public with sharing class RelationshipController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchRecords(String searchTerm) {
        // Implement logic to query records based on the search term
        List<account>acclist=[Select id, Name, Phone from Account];
          return acclist;
        // Return a list of records
    }

    @AuraEnabled
    public static void createRelationship(Id parentId, List<Id> childIds) {
        // Implement logic to create relationships between objects
    }
  
}