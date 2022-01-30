public class IntgerationRequestGenerator {

    public static string getXML(String bizStrem,Id accountId){
        
        //Custom metadata types 
        IntegrationStream__mdt intgRec = [Select Id,(Select Id,FieldAPIname__c,APIAttributeName__c,DefaultValue__c from IntegrationFieldMappings__r 
                                                 where IsActive__c =TRUE ) 
                                                 from IntegrationStream__mdt where DeveloperName=:bizStrem Limit 1];
        
        //Account data
        Account acc = [Select Id,Name,Phone,SLA__c from Account where Id=:accountId];
        sObject objRec = (sObject)acc;
        
        //XML Writer             
        XmlStreamWriter  w= new XmlStreamWriter();
        w.writeStartElement(null,'Accounts',null);
        
        for(IntegrationFieldMapping__mdt fieldMap : intgRec.IntegrationFieldMappings__r){
            
            String fieldVal = ( fieldMap.DefaultValue__c != NULL ? fieldMap.DefaultValue__c : (string) objRec.get(fieldMap.FieldAPIname__c));
            
            w.writeStartElement(null, fieldMap.APIAttributeName__c ,null);
            w.writeCharacters(  (fieldVal == null ? '' : fieldVal ) );
            w.writeEndElement();
        }
        
        w.writeEndElement();
        
       /* XmlStreamWriter  w= new XmlStreamWriter();
        w.writeStartElement(null, 'User',null );
        w.writeNamespace('i','http://temp.blogspot.com');
        w.writeStartElement(null,'DisplayName',null);
        w.writeCharacters('Unid');
        w.writeEndElement();
        w.writeEndElement();
         
        return w.getXmlString(); */
        
        return w.getXmlString();
    }
    
    public static string getJSON(){
        
        return '';
    }
}