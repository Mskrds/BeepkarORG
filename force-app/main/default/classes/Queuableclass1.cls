//Update the 'Description' field of all Contact records to "Updated via Queueable Apex".
public class Queuableclass1 implements Queueable,schedulable{
    public void execute(schedulablecontext context){
        system.enqueueJob(this);
    }
    

    public void execute(QueueableContext context){
        
 
            system.enqueueJob(new Queuableclass2());
        
          // startPoint = endpoint;
    }
}

/*public class Queuableclass1 implements Queueable {

    private static final Integer BATCH_SIZE = 2000;
    private static Integer offset = 0;

    public void execute(QueueableContext context) {
        List<Contact> contactsToProcess = [SELECT Id, Description FROM Contact LIMIT :BATCH_SIZE OFFSET :offset];

        if (!contactsToProcess.isEmpty()) {
            for (Contact con : contactsToProcess) {
                con.Description = 'updated through queue';
            }

            update contactsToProcess;
            offset += BATCH_SIZE;

            // Enqueue the next job for the remaining contacts
            System.enqueueJob(new Queuableclass1());
        }
    }
}
*/