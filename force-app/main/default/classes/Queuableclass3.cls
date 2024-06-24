public class Queuableclass3 implements Queueable {
 public void execute(QueueableContext context){
        
        List<contact> allContacts = [select id,Description from contact limit 2000];
        Integer consize = allContacts.size(); // have 10,069 records size
        
            
            List<Contact> allContactsToUpdate = new List<Contact>();
        for (contact con : allContacts){
            if(con.Description!=null){
                Contact c = new Contact();
                c.id = con.id;
                con.Description='updated through que';
                allContactsToUpdate.add(c);
                
        }
        }
            if (!allContactsToUpdate.isEmpty()) {
                update allContacts;
        system.debug('size of batch::'+allContacts.size());
            }
            
          //  system.enqueueJob(new Queuableclass3());
          // startPoint = endpoint;
    }
}