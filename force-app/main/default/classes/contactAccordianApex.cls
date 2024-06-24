public with sharing class contactAccordianApex {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactDetails() {
        List<Contact> contacts = [SELECT Id, LastName, Email, Phone, Department FROM Contact];
        System.debug('Contacts: ' + contacts);
        return contacts;
    }
}