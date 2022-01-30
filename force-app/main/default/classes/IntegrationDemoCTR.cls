public class IntegrationDemoCTR {
    
    public string displayText { get; set; }
    
    public IntegrationDemoCTR(){
        displayText = IntgerationRequestGenerator.getXML('PCSM','0011t00000doraW');
    }
}