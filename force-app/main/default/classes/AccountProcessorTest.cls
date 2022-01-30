@isTest
public class AccountProcessorTest{
    
    @isTest static void contactCOuntTest(){
        
        
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;

        Contact cont = new Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = a.Id;
        insert cont;

        List<Id> setAccId = new List<ID>();
        setAccId.add(a.Id);

               
        Test.startTest();
            AccountProcessor.countContacts(setAccId);       
        Test.stoptest();
        
        Account acc = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c) ,1);
    }
}