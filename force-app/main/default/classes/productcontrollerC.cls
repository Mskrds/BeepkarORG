Public without sharing class productcontrollerC {

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(String recordId) {
        return [SELECT Name, Industry, Rating, Website FROM Account WHERE Id = :recordId];
    }
}