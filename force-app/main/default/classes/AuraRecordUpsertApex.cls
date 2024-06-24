public class AuraRecordUpsertApex {
    @AuraEnabled
    public static contact createContact(Contact contactobj){
        system.debug('contactobj'+contactobj);
        insert contactobj;
        return contactobj;
    }

}