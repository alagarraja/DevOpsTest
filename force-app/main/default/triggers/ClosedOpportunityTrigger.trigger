trigger ClosedOpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
    
    if(trigger.isInsert || trigger.isUpdate){
        
        List<Task> taskList = new List<Task>();
        
        for(Opportunity opp: trigger.new){
            
            if(opp.stageName == 'Closed Won'){
                
                Task tk = new Task();
                tk.Subject = 'Follow Up Test Task';
                tk.whatId = opp.Id;
                taskList.add(tk);
            }
        }
        
        if(taskList.size() > 0){
            insert taskList;
        }
    }

}