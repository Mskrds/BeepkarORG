public class Queuabletest1 implements Queueable{
        /*private Integer startPoint;
    	private Integer Batchsize;
    	private List<Contact> allContacts;
    
        public Queuable1(Integer startPoint,Integer Batchsize,List<Contact> allContacts){
            this.startPoint = startpoint;
            this.Batchsize = Batchsize;
            this.allContacts = allContacts;
        }
    		*/
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
            
            /*Integer endpoint = startPoint+Batchsize;
            
            List<Contact> allContactsToUpdate = new List<Contact>();
            
			if (endpoint > consize) {
            	endpoint = consize;
        	}
            
            for (Integer i = startPoint; i < endpoint; i++) {
                Contact contact = allContacts[i];
                contact.Description = 'SFDC';
                allContactsToUpdate.add(contact);
        	}
            if(!allContactsToUpdate.isEmpty()){
                update allContactsToUpdate;
            }
				*/
        
        
    }

}