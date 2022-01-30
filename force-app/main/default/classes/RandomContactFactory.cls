public class RandomContactFactory{
    
    public static List<Contact> generateRandomContacts(Integer cnt, String conName){
        
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=0; i < cnt; i++){
            
            Contact con = new Contact();
            con.FirstName = 'Test '+ i;
            conList.add(con);
        }
        
        return conList;
    }
}