public class dateTestPageCTR {
    
    public datetime shutoffdate { get; set; }
    public datetime shutoffdateTZ { get; set; }
    
    public dateTestPageCTR (){
        shutoffdate = System.now();
    }
}