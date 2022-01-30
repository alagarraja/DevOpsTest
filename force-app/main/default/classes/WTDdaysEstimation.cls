public class WTDdaysEstimation {
    
    public List<Date> workingDaysList { get; set; }
    public List<Date> nonWorkingDaysList { get; set; }
    public List<Date> finalDaysList { get; set; }
    public List<AssignedResource> appointmentsList { get; set; }
    public string resourceName { get; set; }
    public Map<Id,Integer> resourceWithCount { get; set; }
        
    public void WTDdaysMethod(){
        
        workingDaysList = new List<Date>();
        nonWorkingDaysList = new List<Date>();
        finalDaysList = new List<Date>();
        appointmentsList = new List<AssignedResource>();
        
        Date dt = Date.today();
        Date startDate = Date.today().addDays(-11);
        Date endDate = Date.today().addDays(2);
        
        //ServiceTerritories - Territory Member object (Select Id from ServiceTerritories )
        //ServiceAppointments - Assigned Resource Object
        
        resourceWithCount = new Map<Id,Integer>();
        
        for(ServiceResource sr:[Select Id,Name, (Select Id, OperatingHours.Name,EffectiveStartDate,EffectiveEndDate,INS_IsWorkingShift__c from ServiceTerritories 
                                                where EffectiveStartDate >=:startDate AND  EffectiveStartDate <=:dt Order by EffectiveStartDate asc),
                                            
                                           (Select Id,ServiceAppointmentId, ServiceAppointment.AppointmentNumber, ServiceAppointment.ActualStartTime, 
                                                   ServiceAppointment.ActualEndTime from ServiceAppointments 
                                                   WHERE (ServiceAppointment.Status = 'Completed' OR ServiceAppointment.Status ='Cannot Complete')  
                                                   AND ServiceAppointment.SchedStartTime >=: startDate AND ServiceAppointment.SchedEndTime <=: endDate 
                                                   Order by ServiceAppointment.ActualStartTime asc),
                                            
                                           (Select Id,Start,End,INS_NonAvailabilityType__c from ResourceAbsences 
                                               where Start >:startDate AND End <:dt AND INS_NonAvailabilityType__c='Non Working Non-Availability' Order by Start asc)
                                            
                                  from ServiceResource where Id='0Hn1t000000bzBU']){
            
            System.debug('$$$$ '+ sr.ServiceTerritories.size() );
            resourceName = sr.Name;
            
            Set<Date> workingDays = new Set<Date>();
            Set<Date> nonWorkingDays = new Set<Date>();
            
            //Get the working and non working days
            for(ServiceTerritoryMember stm: sr.ServiceTerritories){
                if(stm.INS_IsWorkingShift__c){
                    workingDays.add( stm.EffectiveStartDate.date() );
                }else{
                    nonWorkingDays.add( stm.EffectiveStartDate.date() );
                }
                
                //System.debug('#### '+stm.OperatingHours.Name+' :Start-> '+stm.EffectiveStartDate+' :END-> '+stm.EffectiveEndDate+' :IsWorking ->'+stm.INS_IsWorkingShift__c);
            }
            
            System.debug('##### Working: '+ workingDays );
            System.debug('##### NonWorking: '+ nonWorkingDays );
            
            //Get the Absence on working days
            Set<Date> absenceSet = new Set<Date>();
            for(ResourceAbsence rab: sr.ResourceAbsences){
                
                Date absenceStartDt = rab.start.date();
                Date absenceEndDt = rab.end.date();
                
                if(workingDays.contains(absenceStartDt) && !absenceSet.add(absenceStartDt) ){
                    absenceSet.add(absenceStartDt);
                } 
                
                if(workingDays.contains(absenceEndDt) && !absenceSet.add(absenceEndDt) ){
                    absenceSet.add(absenceEndDt);
                } 
            }
            System.debug('Absence on working day -> '+ absenceSet );

            Set<Date> allNonWorkingDays = new Set<Date> ();
            allNonWorkingDays.addAll( nonWorkingDays);
            allNonWorkingDays.addAll( absenceSet );
            System.debug('All non working days before removal-> '+ allNonWorkingDays );
            nonWorkingDaysList.addAll(allNonWorkingDays);
            
            //Checks whether a user has worked on non working days
            for(AssignedResource asgn: sr.ServiceAppointments){
                
                Date start_Dt = asgn.ServiceAppointment.ActualStartTime.date();
                Date end_Dt = asgn.ServiceAppointment.ActualEndTime.date();
                appointmentsList.add(asgn);
                
                //System.debug('!!!!!!!!! --> '+asgn.Id);
                if(allNonWorkingDays.contains(start_dt) ){
                    allNonWorkingDays.remove(start_dt);
                }
                
                if(allNonWorkingDays.contains(end_Dt) ){
                    allNonWorkingDays.remove(end_Dt);
                }
            }
            
            System.debug('final non working days -> '+ allNonWorkingDays );
            
            if(allNonWorkingDays.size() < 2){
                resourceWithCount.put( sr.Id, allNonWorkingDays.size() );
            }
                       
            
            //----------------
            workingDaysList.addAll(workingDays);           
            finalDaysList.addAll(allNonWorkingDays);
        
        }
        
        
            
        createAbsences();
        
    }

    public void createAbsences(){

        Date tomDate = Date.today().addDays(1);
        Date dayAfterTomDate = Date.today().addDays(2);
        List<ResourceAbsence> createList = new List<ResourceAbsence>();

        for(ServiceResource sr:[Select Id,Name,(Select Id, OperatingHours.Name,EffectiveStartDate,EffectiveEndDate,INS_IsWorkingShift__c from ServiceTerritories 
                                                where EffectiveStartDate >=:tomDate AND  EffectiveStartDate <=:dayAfterTomDate 
                                                Order by EffectiveStartDate asc),

                                    (Select Id,Start,End,INS_NonAvailabilityType__c from ResourceAbsences 
                                               where Start >=:tomDate AND End <=:dayAfterTomDate AND INS_NonAvailabilityType__c='Non Working Non-Availability' Order by Start asc)

                                    from ServiceResource where Id IN: resourceWithCount.keyset()]){
            
            System.debug('Absence list -> '+ sr.Id +' :'+ resourceWithCount.get(sr.Id) );
            
            Integer cnt = (resourceWithCount.get(sr.Id) == 0 ? 2 : 1);
            
            for(Integer i =0; i < cnt; i++ ){
                
                Date dt = Date.today().addDays( i+1 );
                
                ResourceAbsence rab = new ResourceAbsence();
                rab.RecordTypeId = '0121t000000U8Rn'; //Non Availablility record type
                rab.ResourceId = sr.Id;
                rab.Type = 'Non-Availability - Other';
                rab.INS_NonAvailabilityType__c='Non Working Non-Availability';
                rab.Start = dt;
                rab.End = DateTime.newInstance( dt.year(), dt.month(), dt.day(), 23, 59, 59);
                rab.FSL__GanttLabel__c = 'Work Time Directive';
                createList.add(rab);
            }
            
        }

        System.debug('Create Absence list -> '+ createList );

        if(createList.size() > 0){
            insert createList;
        }
    }

    
}