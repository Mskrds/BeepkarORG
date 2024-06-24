public with sharing class ContactDetailsController {
    @AuraEnabled
    public static Contact getContact(String recordId) {
        return [SELECT Id,LastName, Email, Phone FROM Contact WHERE Id = :recordId LIMIT 1];
        
    }

    @AuraEnabled
    public static void updateContact(Contact updatedContact) {
        update updatedContact;
    }
  
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactforsortingandfilter() {
        return [SELECT Id, Name, Email FROM Contact LIMIT 50];
    }
    @AuraEnabled(cacheable=true)
    public static List<contact>getcontactstodelete(){
        list<Contact>conlist=[select id,lastname,email from contact limit 6];
        return conlist;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId) {
        return [SELECT Id, Name, Email, Phone,Department,CleanStatus FROM Contact WHERE AccountId = :accountId];
    }
     @AuraEnabled
    public static String updateCondata(List<contact> contoUpdate) {
        try {
            update contoUpdate;
            return 'success';
        } catch (Exception e) {
            return 'error: ' + e.getMessage();
        }
        
    }
}