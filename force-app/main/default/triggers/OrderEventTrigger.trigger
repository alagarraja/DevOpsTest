trigger OrderEventTrigger on Order_Event__e (after insert) {
	
    List<task> taskList = new List<task>();
    for(Order_Event__e event: trigger.new){
        
        if(event.Has_Shipped__c == true){
            
            task tk = new Task();
            tk.Priority = 'Medium';
			tk.Subject= 'Follow up on shipped order ' + event.Order_Number__c;
            tk.OwnerId= event.CreatedById;
            taskList.add(tk);
        }
    }
    
    insert taskList;
}