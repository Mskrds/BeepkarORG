public class allObjectsDetails {
    @AuraEnabled
    public static List<Contact> getContactDetails(){
        List<Contact> conList = [select firstName,lastName,email,phone from contact limit 15];
        return conList;
    }
    
    @AuraEnabled
    public static List<Account> getAccountDetails(){
        List<Account> accList = [select Name,phone,type from Account limit 15];
        return accList;
    }
    
    @AuraEnabled
    public static List<Opportunity> getOpportunityDetails(){
        List<Opportunity> oppList = [select Name,StageName,CloseDate  from Opportunity limit 15];
        return oppList;
    }
}