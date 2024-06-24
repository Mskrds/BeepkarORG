public with sharing class ContactControllers {
    @AuraEnabled
    public static void createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        
        insert newContact;
    }
}