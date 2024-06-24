public class LWCInlineCtrlTest {
    @AuraEnabled(Cacheable = true)
    public static List<Contact> getContacts() {
        return [SELECT Id, FirstName, LastName, Phone FROM Contact  limit 10];
    }
}