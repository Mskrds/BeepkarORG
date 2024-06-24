public class ContactCreationControllerAB {
    @AuraEnabled
    public static void createContact( String LastName, String Email, String AccountId) {
        try {
            Contact newCon = new Contact();
           
            newCon.LastName = LastName;
            newCon.Email = Email;
            newCon.AccountId = AccountId;

            insert newCon;

            System.debug('Contact created successfully: ' + newCon.Id);
        } catch (Exception e) {
            System.debug('Error creating contact: ' + e.getMessage());
            
        }
    }
}