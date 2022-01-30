public class AccounDataFactory{
    
    public static List<Account> createAccount(Integer cnt, String name){
        
        List<Account> accList = new List<Account>();
        
        for(Integer i=0; i< cnt; i++){
        
            Account acc = new Account();
            acc.Name =name +i;
            accList.add(acc);
        }
        
        return accList;
    }
}