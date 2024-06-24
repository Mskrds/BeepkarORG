public class DeleteAccountBulk {
    
    // Declaration of class variables
    public List<Account> SelectedAccountList;
    public String AccountId;
    
    // Constructor that takes a StandardSetController as a parameter
    public DeleteAccountBulk(ApexPages.StandardSetController cntlr){ // allow you to create Visualforce pages that can display or act on a set of records
        System.debug('cntlr Selected ===>'+cntlr.getSelected());
        
        // Initialize the SelectedAccountList with the selected records from the StandardSetController
        SelectedAccountList = cntlr.getSelected();
        AccountId = '';  
        for(Account acc : SelectedAccountList){
            
            // Initialize AccountId as an empty string
            AccountId += acc.Id + ',';  
            System.debug('AccountId for Loop ===> '+AccountId);                       
        }
        AccountId = AccountId.removeEnd(','); 
        System.debug('Out Side For Loop ===>'+AccountId);
    }
    
    public PageReference redirectToLC(){
        String returnUrl = '/lightning/cmp/c__DeleteAccountBulkComp?c__listofAccounts='+AccountId;
        PageReference pgReturnPage = new PageReference(returnUrl);
        pgReturnPage.setRedirect(true);
        return pgReturnPage;
    }
    
    // AuraEnabled method to delete selected account IDs
    @AuraEnabled
    public Static String DeleteSelectedAccountIds(List<String> accountIdSet){
        Integer recordCount = 0;
        try{
            List<String> lstString = accountIdSet[0].split(',');  
            List<Account> AccountListToDelete = [SELECT Id,Name FROM Account WHERE ID IN :lstString ];
            Database.DeleteResult[] drList = Database.delete(AccountListToDelete, false);
            System.debug('drList ===>'+drList);
            for(Database.DeleteResult dr : drList) {
                if (dr.isSuccess()) {
                    System.debug('Successfully deleted account with ID: ' + dr.getId());
                    recordCount = recordCount + 1;
                }else{
                    for(Database.Error err : dr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                    }
                }
            }
            System.debug('recordCount === >'+recordCount);
            return String.valueOf(recordCount);     
        }catch(Exception e){
            System.debug('The Error ::'+e.getMessage() +' AND Error Line No :'+e.getLineNumber());
        }
        return null;  
    } 
}