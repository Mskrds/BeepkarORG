public class AuraCreateContactcls {
    @AuraEnabled
    public static Id CreateContact(contact contobj){
        insert contobj;
        return contobj.Id;
    }
    
}