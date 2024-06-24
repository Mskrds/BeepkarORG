public class scrollableAccandConAPEX {
    @AuraEnabled
    public static List<account> getAccDetails(){
        List<account> accList = [select Name,(SELECT FirstName, LastName, Email, Phone FROM Contacts) from account limit 15];
        return accList;
    } }