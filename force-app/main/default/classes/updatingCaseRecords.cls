public class updatingCaseRecords {

    @AuraEnabled
    public static List<Case> getCasesrecords(){
        List<Case> ListofCases = [Select id,Subject,Description,Status from Case limit 6];
        return ListofCases;
    }

    
    @AuraEnabled
    public static String updateCases(List<Case> casesToUpdate) {
        try {
            update casesToUpdate;
            return 'success';
        } catch (Exception e) {
            return 'error: ' + e.getMessage();
        }
    }

    
    @AuraEnabled
    public static void updateCase(String caseId, String newDescription) {
        Case cs = new Case(Id = caseId, Description = newDescription);
        update cs;
    }
}