public class Queuable1B implements Queueable{
        
    	public void execute(QueueableContext context){
            Integer startPoint =0;
            Integer Batchsize = 2000;
            List<contact> allContacts = [select id,name,description from contact];
            Integer consize = allContacts.size();
            
            while (startPoint < consize) {
                Integer endpoint = startPoint + batchSize;
                if (endpoint > consize) {
                    endpoint = consize;
                }

                List<Contact> allContactsToUpdate = new List<Contact>();
    
                for (Integer i = startPoint; i < endpoint; i++) {
                    Contact contact = allContacts[i];
                    contact.Description = 'Banoj';
                    allContactsToUpdate.add(contact);
                }

                if (!allContactsToUpdate.isEmpty()) {
                    update allContactsToUpdate;
                }
                
                startPoint = endpoint;
        }
    
    }

}