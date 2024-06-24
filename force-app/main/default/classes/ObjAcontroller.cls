// Apex method to retrieve the Rich Text field content
public with sharing class ObjAcontroller {
    @AuraEnabled(cacheable=true)
    public static list<ObjectA__c> getcandidateDetails() {
        return [SELECT Id, Name, Candidate_Photo__c, Unit_Price__c, Rating__c FROM ObjectA__c  LIMIT 1];
    }
}