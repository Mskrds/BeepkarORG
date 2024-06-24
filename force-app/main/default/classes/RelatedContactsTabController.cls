// RelatedContactsTabController.cls
public with sharing class RelatedContactsTabController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id recordId) {
        List<Contact> Conlist = [Select id,Lastname,Phone,Email from Contact where AccountId=: recordId ];
        return Conlist;

        
      
    }
}