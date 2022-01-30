trigger AccountAddressTrigger on Account (before insert, before update) {
    
    if(Trigger.isBefore){
        
        if(Trigger.isInsert || Trigger.isUpdate){
            
            for(Account acc: trigger.new){
                
                if(acc.BillingPostalCode != NULL && acc.Match_Billing_Address__c){
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            }
        
        }
        
    }
}