public class mycreateContactForm {

    @AuraEnabled
    public static void createContact(String firstName, String lastName, String email, String phone, String department, Id accountId) {
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email,
            Phone = phone,
            Department = department,
            AccountId = accountId
        );
        insert newContact;
       
    }

}