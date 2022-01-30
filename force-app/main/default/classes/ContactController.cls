public with sharing class ContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        try{
            Decimal d;
            Decimal i = d +1;
            return [Select Id,FirstName, LastName, Email from Contact WITH SECURITY_ENFORCED Limit 50];
        }catch(Exception e){
            throw new AuraHandledException('Darn it! Something went wrong: '+ e.getMessage()); 
        }
        
    }
}