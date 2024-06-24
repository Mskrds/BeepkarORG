public class CustomRecordEditController {

    @AuraEnabled
    public static List<opportunity> getRecord(){
        List<opportunity> Listofoppo = [Select id,Name,Amount,email__c from opportunity limit 6];
        return Listofoppo;
    }

    
    @AuraEnabled
    public static String updateRecord(List<opportunity> Updateopprec) {
        try {
            update Updateopprec;
            return 'success';
        } catch (Exception e) {
            return 'error: ' + e.getMessage();
        }
    }

}