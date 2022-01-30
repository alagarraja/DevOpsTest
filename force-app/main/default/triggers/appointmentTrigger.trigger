trigger appointmentTrigger on ServiceAppointment (after update) {
    
    Set<String> statusSet = new Set<String> { 'Completed', 'Cannot Complete'};
    
    System.debug('$$$$$ appointment trigger --> ');   
    Set<Id> appointmentIds = new Set<Id>();
    for(ServiceAppointment sa: trigger.new){
        
        ServiceAppointment oldVal = Trigger.oldMap.get(sa.Id);    
        
        //if(sa.Status != oldVal.status && statusSet.contains(sa.status)){
            appointmentIds.add(sa.Id);    
        //}
    }
    System.debug('$$$$$ appointmentIds --> '+ appointmentIds);
    
    Map<Id,DateTime> jobStartTimeMap = new Map<Id,DateTime>();
    Map<Id,DateTime> jobEndTimeMap = new Map<Id,DateTime>();
    for(AssignedResource asr: [Select Id,FSL__EstimatedTravelTimeFrom__c,EstimatedTravelTime,ServiceResourceId,
                                      ServiceAppointment.ActualStartTime, ServiceAppointment.ActualEndTime
                                      from AssignedResource where ServiceAppointmentId IN: appointmentIds]){
        
        //Start time calc
        Integer startTime = (Integer) asr.EstimatedTravelTime;
        
        Integer startHrs = (startTime/60);
        Integer startMins = Math.mod(startTime,60);
        System.debug('#### '+ startHrs +' :::: '+ startMins);   
        
        DateTime startDt = asr.ServiceAppointment.ActualStartTime;
        if(startDt != Null){
            startDt = startDt.addHours( -startHrs ).addMinutes( -startMins );
            jobStartTimeMap.put( asr.ServiceResourceId, startDt);
        }
        
        //End time calc
        Integer endTime = (Integer) asr.FSL__EstimatedTravelTimeFrom__c;

        Integer endHrs = (endTime/60);
        Integer endMins = Math.mod(endTime,60);
        System.debug('#### '+ endHrs +' :::: '+endMins);   
                
        
        DateTime endDt = asr.ServiceAppointment.ActualEndTime;
        if(endDt != Null){
            endDt = endDt.addHours( endHrs ).addMinutes( endMins );
            jobEndTimeMap.put( asr.ServiceResourceId, endDt );
        }
        
    }
    
    System.debug('#### job start time Map --> '+ jobStartTimeMap ); 
    System.debug('#### job End time Map --> '+ jobEndTimeMap ); 
    
    Map<Id,TimeSlot> slotsMap = new Map<Id,TimeSlot>();
    for(TimeSlot tst: [Select Id,StartTime,EndTime,OperatingHoursId from TimeSlot ]){
        slotsMap.put( tst.OperatingHoursId, tst);
    }
    
    //ServiceAppointments - assigned resource object
    DateTime nowDt = DateTime.now();
    Map<Id,DateTime> shiftEndMap = new Map<Id,DateTime>();
    Map<Id,Integer> shiftWorkDiffMap = new Map<Id,Integer>();
    Set<Id> considerForBreak = new Set<Id>();
    Map<Id,DateTime> createStartBlock = new Map<Id,DateTime>();
    Map<Id,DateTime> createEndBlock = new Map<Id,DateTime>();
    
    for(ServiceResource sr:[Select Id,Name, (Select Id,EffectiveStartDate,EffectiveEndDate,INS_IsWorkingShift__c,OperatingHoursId
                                                from ServiceTerritories where EffectiveStartDate <:nowDt AND EffectiveEndDate >:nowDt  
                                                ORDER BY EffectiveEndDate desc Limit 1 ),
                                            
                                            (Select Id,ServiceAppointmentId,ServiceAppointment.ActualEndTime from ServiceAppointments 
                                                where ServiceAppointmentId NOT IN: trigger.new AND ServiceAppointment.Status IN: statusSet
                                                Order by ServiceAppointment.ActualEndTime desc Limit 1)
                                                
                                            from ServiceResource where Id IN (Select ServiceResourceId from AssignedResource where ServiceAppointmentId IN:appointmentIds)]){
        
        DateTime lastJobCompletionTime;
        for(AssignedResource asr: sr.ServiceAppointments ){
            lastJobCompletionTime = asr.ServiceAppointment.ActualEndTime;
        }
        
        //Get current job start time 
        DateTime currentJobStartTime = jobStartTimeMap.get(sr.Id);
            
        //Boolean outsideShift =false;                                            
        DateTime shiftEndTime, shiftStartTime;
        Integer shiftWorkDiffMins =0;
        for(ServiceTerritoryMember stm: sr.ServiceTerritories){
            
            
            if(stm.INS_IsWorkingShift__c){
            
                Date dtm = Date.valueOf(stm.EffectiveStartDate);
                
                if(slotsMap.containsKey(stm.OperatingHoursId)){
                
                    Time dayStart = slotsMap.get(stm.OperatingHoursId).StartTime;
                    shiftStartTime = datetime.newInstance(dtm.year(), dtm.month(),dtm.day(), dayStart.hour(), dayStart.minute(), dayStart.second() );
                    
                    Time dayEnd = slotsMap.get(stm.OperatingHoursId).EndTime;
                    shiftEndTime = datetime.newInstance(dtm.year(), dtm.month(),dtm.day(), dayEnd.hour(), dayEnd.minute(), dayEnd.second() );
                    
                    if( !(currentJobStartTime > shiftStartTime && currentJobStartTime < shiftEndTime) ){
                        //outsideShift = true;
                        considerForBreak.add(sr.Id);
                        shiftEndMap.put(sr.Id, shiftEndTime);  
                        
                        DateTime compareDt = (lastJobCompletionTime > shiftEndTime ? lastJobCompletionTime : shiftEndTime);
                        
                        Long milliseconds = ( currentJobStartTime.getTime() - compareDt.getTime() );
                        Long seconds = milliseconds / 1000;
                        Long minutes = seconds / 60;
                        System.debug('#### diff minutes ::: '+ minutes);
                        
                        shiftWorkDiffMins = (Integer) minutes;
                        shiftWorkDiffMap.put(sr.Id, (Integer) minutes );
                    }
                }
            }
        }  
        
        if(shiftWorkDiffMins < 660){
            //Update shift start time (Create block in start of the day)
            createStartBlock.put( sr.Id,jobEndTimeMap.get(sr.Id).addHours(11) );
        }else{
            //Update shift end time (Create block at the end to reduce the shift end)
            createEndBlock.put( sr.Id,jobStartTimeMap.get(sr.Id).addHours(11) );
        }
       
        
    }
    
    List<ResourceAbsence> createList = new List<ResourceAbsence>();
    for(Id usrId: createStartBlock.keySet()){
        
        ResourceAbsence rab = new ResourceAbsence();
        rab.RecordTypeId = '0121t000000U8Rn'; //Non Availablility record type
        rab.ResourceId = usrId;
        rab.Type = 'Non-Availability - Other';
        rab.INS_NonAvailabilityType__c='Non Working Non-Availability';
        rab.Start = jobEndTimeMap.get(usrId);
        rab.End = jobEndTimeMap.get(usrId).addHours(11);
        rab.FSL__GanttLabel__c = 'Work Time Directive';
        createList.add(rab);
    }
    
    for(Id usrId: createEndBlock.keySet()){
        
        ResourceAbsence rab = new ResourceAbsence();
        rab.RecordTypeId = '0121t000000U8Rn'; //Non Availablility record type
        rab.ResourceId = usrId;
        rab.Type = 'Non-Availability - Other';
        rab.INS_NonAvailabilityType__c='Non Working Non-Availability';
        rab.Start = jobStartTimeMap.get(usrId).addHours(11);
        rab.End = jobStartTimeMap.get(usrId).addHours(22);
        rab.FSL__GanttLabel__c = 'Work Time Directive';
        createList.add(rab);
    }
    
    if(createList.size() > 0){
        insert createList;
    }
    
    System.debug('&&&&&& considerForBreak::: '+ considerForBreak);
    System.debug('&&&&&& shiftEndMap::: '+ shiftEndMap);
    System.debug('&&&&&& shiftWorkDiffMap::: '+ shiftWorkDiffMap);
    
    System.debug('!!!!!!!! createStartBlock -> '+ createStartBlock );
    System.debug('!!!!!!!! createEndBlock -> '+ createEndBlock );
         
        
        /* System.debug('!!!!! Shift timing--> '+ shiftStartTime + ' - '+shiftEndTime );
        System.debug('!!!!! lastshiftEndTime --> '+ outsideShift);
        
        if(shiftEndTime != NULL && shiftEndTime > elevenHourBeforeJobStart && shiftEndTime < currentJobStartTime ){
            createBreak.add(sr.Id);
        }
        
        
        DateTime lastjobCompleteTime;
        if(sr.ServiceAppointments.size() > 0){
            lastjobCompleteTime = sr.ServiceAppointments[0].ServiceAppointment.ActualEndTime;
        }
        System.debug('!!!!! lastjobCompleteTime --> '+ lastjobCompleteTime);
        
        if(lastjobCompleteTime != NULL && lastjobCompleteTime > elevenHourBeforeJobStart && lastjobCompleteTime < currentJobStartTime ){
            createBreak.add(sr.Id);
        } */
    
    
        /*
        
        
        
        //End time calc
        Integer endTime = (Integer) asr.FSL__EstimatedTravelTimeFrom__c;

        Integer endHrs = (endTime/60);
        Integer endMins = Math.mod(endTime,60);
        System.debug('#### '+ endHrs +' :::: '+endMins);   
                
        
        DateTime endDt = asr.ServiceAppointment.ActualEndTime;
        if(endDt != Null){
            endDt = endDt.addHours( -endHrs ).addMinutes( -endMins );
            jobStartTimeMap.put( asr.ServiceResourceId, endDt );
        } 
        
        Long milliseconds = ( startDt.getTime() - shiftEndMap.get(asr.ServiceResourceId).getTime() );
        Long seconds = milliseconds / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        System.debug('#### diff hours ::: '+ hours);   */ 
    
    
}