public class newContactFormApex {
	@AuraEnabled
    public static Contact getContactDetails(Contact conList){
        upsert conList;
        return conList;
    }
}