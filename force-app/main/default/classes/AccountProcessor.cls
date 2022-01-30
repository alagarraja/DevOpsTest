public class AccountProcessor{
    
    @future
    public static void countContacts(List<Id> accIds){
        
        List<Account> updateList = new List<Account>();
        for(Account acc:[Select Id,Number_of_Contacts__c,(Select Id from Contacts) from Account where Id IN: accIds]){
            
            //Account act = new Account();
            acc.Number_of_Contacts__c = acc.Contacts.size();
            updateList.add(acc);
        }
        
        if(updateList.size() > 0){
            Update updateList;
        }
    }
}