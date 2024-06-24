public class ContactInfoFormController {
    @AuraEnabled(cacheable=true)
    public static Contact getContactById(String contactId) {
        return [SELECT Id, LastName, Email, Phone FROM Contact WHERE Id = :contactId LIMIT 1];
    }

    @AuraEnabled
    public static void updateContact(String contactId, String lastName, String email, String phone) {
        try {
            Contact existingContact = [SELECT Id FROM Contact WHERE Id = :contactId LIMIT 1];
            
            // Set the new values and perform additional checks or validations if needed before updating
            existingContact.LastName = lastName;
            existingContact.Email = email;
            existingContact.Phone = phone;

            update existingContact;
        } catch (Exception e) {
            // Handle exceptions appropriately
            throw new AuraHandledException('Error updating contact: ' + e.getMessage());
        }
    }
}