public with sharing class createNewRecordHandler {
    @AuraEnabled
    public static string createNewRecMethod(string FName,string lName, String lcomp,String lgender,String lEmail,String lphone){
        
            Lead ld = new Lead();
            ld.lastName = lName;
            ld.firstName = FName;
            ld.Company = lcomp;
            ld.GenderIdentity=lgender;
             ld.Email = lEmail;  // field has to be visible  for gender- Female
             ld.Phone = lphone; // field has to be visible  for gender-Male
            insert ld;
            return 'Success';
      
        
    }
}