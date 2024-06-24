public class AuraSortingPagnation {
 
    @AuraEnabled
    public static List<Account> fetchAccountData(){
        return [SELECT Id, Name, Type, Website, CreatedDate, Phone FROM Account LIMIT 10];
    }
}