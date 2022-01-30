@isTest
public class TestRestrictContactByName{
    
    @isTest static void positiveTest(){
        
        Contact c = new Contact();
        c.FirstName ='firstNAme';
        c.LastName = 'INVALIDNAME';
        
        Test.startTest();
            Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
}