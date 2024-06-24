//The Queueable class should find records with missing or incorrect data in certain fields 
//(e.g., Email__c, Phone__c) and update with checkbox as True 

public class Queuableclass8 implements Queueable{
    
    public void execute(QueueableContext context){
            Integer startPoint =0;
            Integer Batchsize = 2000;
            List<contact> allContacts = [select id,name,Email,Phone,Check_Email_Phone__c from contact where phone =null And Email = null];
            Integer consize = allContacts.size(); // by above query i am getting only 1218 records
            
            while (startPoint < consize) {
                Integer endpoint = startPoint + batchSize;
                if (endpoint > consize) {
                    endpoint = consize;
                }

                List<Contact> allContactsToUpdate = new List<Contact>();
    
                for (Integer i = startPoint; i <endpoint; i++) {
                    Contact con = allContacts[i];
                    if(con.Phone!= null && con.Email!= null && con.Phone.length()== 10){
                  //  if(con.email==null || (con.phone ==null && con.Phone.length()!= 10)){
                        
                        con.Check_Email_Phone__c = true;
                    }
                    allContactsToUpdate.add(con);
                }

                if (!allContactsToUpdate.isEmpty()) {
                    update allContactsToUpdate;
                }
                
                startPoint = endpoint;
        }
    }
}