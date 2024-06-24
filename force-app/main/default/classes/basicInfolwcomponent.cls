public class basicInfolwcomponent {

   @AuraEnabled
    public static  void createnewConRecord(String FirstName, String LastName,String Email) {
       
       contact con = new contact();
        con.FirstName=FirstName;
        con.LastName=LastName;
        con.Email=Email;
        insert con;
        system.debug(con);
        
    }
    
        
    }