public class AuraOppFieldsValidationApex {
 @AuraEnabled
    public static Id CreateContact(opportunity oppobj){
        insert oppobj;
        return oppobj.Id;
    }
}