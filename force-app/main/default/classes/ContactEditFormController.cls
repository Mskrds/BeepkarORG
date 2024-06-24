public class ContactEditFormController {

    @AuraEnabled(cacheable=true)
    public static Contact getContact() {
        // Assuming you want to edit the current user's contact record
        Id contactId = [SELECT Id FROM Contact WHERE OwnerId = :UserInfo.getUserId() LIMIT 1].Id;
        return [SELECT Id, Name, Email, Phone FROM Contact WHERE Id = :contactId LIMIT 1];
    }

    @AuraEnabled
    public static void updateContact(Id contactId, String email, String phone) {
        Contact existingContact = new Contact(Id = contactId, Email = email, Phone = phone);
        update existingContact;
    }
}