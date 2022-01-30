public class campingCTR {

    @AuraEnabled
    public static List<Camping_Item__c> getCamping() {
       return [Select Id, Name From Camping_Item__c Order by Name];
    }

}