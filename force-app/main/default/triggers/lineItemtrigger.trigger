trigger lineItemtrigger on WorkOrderLineItem (before insert, before Update, after insert, after update) {
    
    
    
    if(trigger.isInsert && trigger.isAfter){
        
        List<INS_PreRequisite__c> reqList = new List<INS_PreRequisite__c>();
        for(WorkOrderLineItem wli: trigger.new){
        
            INS_PreRequisite__c pReq = new INS_PreRequisite__c();
            pReq.Name = 'Pre Req -'+wli.LineItemNumber;
            pReq.INS_WorkOrderLineItem__c = wli.Id;
            System.debug('pReq --> '+ pReq);
            reqList.add(pReq);
        }
        
        if(reqList.size() > 0){
            System.debug('reqList  --> '+ reqList);
            insert reqList;
        }
        
        List<ServiceAppointment> appList = new List<ServiceAppointment>();
        for(ServiceAppointment appmt : [Select Id,AppointmentNumber,ParentRecordId,Status from ServiceAppointment 
                                                      where ParentRecordId IN:trigger.new]){
             appmt.Status = 'Scheduled'; 
             appList.add(appmt);                                        
        }
        
        if(appList.size() > 0){
            update appList;
        }
        //System.debug('after insert Obj...' + appList_ai );
        //System.debug('after insert ...'+ appList_ai.size() );
    }
    
    
}