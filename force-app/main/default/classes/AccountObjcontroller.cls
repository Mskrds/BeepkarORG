public class AccountObjcontroller {
    public static void copyshippingtobillingaddress(List<account>acclist){
        for(Account acc :acclist){
            if(acc.CopyBillingToShipping__c=true && acc.BillingCity!= null
                && acc.BillingCountry!= null && acc.BillingPostalCode!= null
                && acc.BillingState!= null && acc.BillingStreet!= null){
                    acc.shippingcity=acc.billingcity;
                    acc.shippingcountry=acc.billingcountry;
                    acc.shippingpostalcode=acc.Billingpostalcode;
                    acc.ShippingState=acc.BillingState;
                    acc.shippingStreet=acc.BillingStreet;
            }
        }
    }
   // For VF page to get the account records 
    @RemoteAction
    public static List<Account> getAccounts() {
        System.debug('inside');
        return [SELECT Id, Name, Industry, Type, Rating FROM Account limit 6];
    }
    @RemoteAction
    public static String updateAccounts(List<Account> accountsToUpdate) {
        try {
            update accountsToUpdate;
            return 'Records updated successfully';
        } catch (Exception e) {
            System.debug('Error updating accounts: ' + e.getMessage());
            return 'Error updating records: ' + e.getMessage();
        }
    }
 
    // For LWC Comp to Get the Accounr Records 
  @AuraEnabled(cacheable=true)
    public static List<Account> getAccdata() {
        System.debug('check the apex class passing');
        return [SELECT Id, Name, Email__c, Rating,Type,Ownership FROM  Account  limit 4];
    }


    // To retrieve rating picklist values from the backend to the Account Object
     @AuraEnabled(cacheable=true)
    public static List<String> getRatingpicklistvalues() {
        List<String> rating = new List<String>();

        Schema.DescribeFieldResult fieldResult = Account.rating.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

            for (Schema.PicklistEntry picklistEntry : ple) {
                rating.add(picklistEntry.getValue());
            }
        return rating;
    }
   
    // For LWC Comp to Get the Account details Records 
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountdata() {
        System.debug('check the apex class passing');
       List<Account> lsacc = [SELECT Id, Name, Email__c, Phone, Rating, Type,Ownership, Site,Industry,Active__c FROM Account  LIMIT 1];
       System.debug('lsacc====>'+lsacc);
       return lsacc;
    }
    // AccountController.cls
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsForAccount(Id accountId) {
        try {
           
            List<Contact> contacts = [SELECT Id, Name, Email, Phone FROM Contact WHERE AccountId = :accountId];
            return contacts;
        } catch(Exception ex) {
           
            System.debug('Error fetching contacts: ' + ex.getMessage());
            return null;
        }
    }

        @auraEnabled(cacheable=true)
    
        public static List<Account> fetchAccount()
    
        {
            List<Account> accList=[SELECT Id,Name FROM Account LIMIT 10];
            return accList;
        }
         @auraEnabled(cacheable=true)
        public static List<Contact> getContacts(String accountId)
        {
            List<Contact> conList=[SELECT Id,LastName,AccountId FROM Contact WHERE AccountId=:accountId LIMIT 10];
            return conList;
        }
        @auraEnabled(cacheable=true)
        public static List<Opportunity> fetchOpportunity(String accountId)
        {
            List<Opportunity> oppList=[SELECT Id,Name,AccountId FROM Opportunity WHERE AccountId=:accountId LIMIT 10];
            return oppList;
        } 

        //to fetch the account related contacts
          @auraEnabled(cacheable=true)
          public static list<account>getconrelatedtoacc(){
              return [Select Id,Name,(select Id,Name,Phone,Account.Name,Email from Contacts) from Account limit 3];
          }
          //--
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsforbarchart() {
            return [SELECT Id, Name, Industry, AnnualRevenue FROM Account];
        }
    //to count the account and show in bar chart
    @AuraEnabled(cacheable=true)
   public static Map<String, Integer> getAccountCountsByIndustry() {
    Map<String, Integer> industryCounts = new Map<String, Integer>();
    for (Account acc : [SELECT Industry FROM Account]) {
        String industry = acc.Industry;
        if (industry != null) {
            if (!industryCounts.containsKey(industry)) {
                industryCounts.put(industry, 0);
            }
            industryCounts.put(industry, industryCounts.get(industry) + 1);
        }
    }
    System.debug('industryCounts: ' + industryCounts);
    return industryCounts;
}
//to count the account based on status and Industry in one Bar
    @AuraEnabled(cacheable=true)
    public static Map<String, Map<String, Integer>> getAccountCountsByIndustryAndStatus() {
        Map<String, Map<String, Integer>> result = new Map<String, Map<String, Integer>>();

        List<AggregateResult> groupedResults = [
            SELECT Industry, Status__c, COUNT(Id)
            FROM Account
            GROUP BY Industry, Status__c
        ];

        for (AggregateResult ar : groupedResults) {
            String industry = (String)ar.get('Industry');
            String status = (String)ar.get('Status__c');
            Integer count = (Integer)ar.get('expr0');

            if (!result.containsKey(industry)) {
                result.put(industry, new Map<String, Integer>());
            }
            result.get(industry).put(status, count);
        }

        return result;
    }
}