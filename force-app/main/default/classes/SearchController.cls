public class SearchController {
    @AuraEnabled
    public static List<Account> searchRecords(String searchCriteria, String selectedField) {
        String query = 'SELECT Id, Name, Industry FROM Account WHERE ' + selectedField + ' LIKE \'%' + searchCriteria + '%\' LIMIT 10';
        return Database.query(query);
    }
}