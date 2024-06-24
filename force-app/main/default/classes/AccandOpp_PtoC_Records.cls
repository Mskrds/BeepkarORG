public  with sharing class AccandOpp_PtoC_Records {

    @AuraEnabled
    Public static list<Account> GetAcclist(){
        List<account>acclist =[select id,Name,Email__c,Phone,Site from Account limit 5];
        Return acclist;
    }
 @AuraEnabled
    Public static list<opportunity> getAccRealtedopp(String opprecordID){
        list<opportunity> opplist =[select id, name ,Phone__c,Email__C, AccountId from opportunity where AccountId=:opprecordID];
        return opplist;
    }

}