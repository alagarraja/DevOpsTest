@isTest
public class TestVerifyDate{
    
    @isTest static void testDateWithInNext30Days(){
        Date dt = date.today();
        
        Date result = VerifyDate.CheckDates( dt, dt.addDays(15));
        System.assertEquals(dt.addDays(15), result);
    }
    
    @isTest static void testDateInPast(){
        Date dt = date.today();
        
        Date result = VerifyDate.CheckDates( dt, dt.addDays(-15));
        System.assertEquals(dt.addDays(5), result);
    }
}