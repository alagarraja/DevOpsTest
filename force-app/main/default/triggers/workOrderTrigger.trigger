trigger workOrderTrigger on WorkOrder (after insert) {
    
    //create line item
    List<WorkOrderLineItem> itemList = new List<WorkOrderLineItem>();
    Boolean createPreReq=false;
    
    for(WorkOrder wor: trigger.new){
    
        WorkOrderLineItem wli = new WorkOrderLineItem();
        wli.WorkOrderId = wor.Id;
        wli.worktypeId = wor.worktypeId;
        wli.Status = 'New';
        
        if(wor.Create_PreReq__c == true){
            createPreReq = true;
        }else{
            createPreReq = false;
        }
        itemList.add(wli);
    }
    
    if(itemList.size() > 0){
        System.debug('Create line item  --> '+ itemList);
        insert itemList;
    }
    
    //Create preReq
    if(createPreReq == true){
    
        List<INS_PreRequisite__c> reqList = new List<INS_PreRequisite__c>();
        for(WorkOrderLineItem wli: [Select Id,LineItemNumber from WorkOrderLineItem where id IN:itemList]){
        
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
    }
    
    //Update Appointment Status
    List<ServiceAppointment> updateAppointment = new List<ServiceAppointment>();
    for(WorkOrderLineItem itm: [Select Id,(Select Id,Status from ServiceAppointments),
                                        (Select Id from PreRequisite__r) 
                                        from WorkOrderLineItem where id IN:itemList]){
        Integer reqCnt = itm.PreRequisite__r.size();
        
        for(ServiceAppointment sApp: itm.ServiceAppointments){
            
            if(reqcnt > 0){
                sApp.Status = 'Has PreReq';
            }else{
                sApp.Status = 'No PreReq';
            }
            
            updateAppointment.add(sApp);
        }
        
        if(updateAppointment.size() > 0){
            update updateAppointment;
        }
    }
}