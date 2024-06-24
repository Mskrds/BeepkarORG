public class AuraCustomObjCreationApex {
    @AuraEnabled
    public static Id CreateCityrecord(City__c customobj){
        insert customobj;
        return customobj.Id;
    }
    
}