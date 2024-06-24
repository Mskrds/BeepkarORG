public class callingBatchinQueueable implements Queueable {
    public static void execute(QueueableContext qc){
        Database.executeBatch(new Quebatchconupdate());
        System.debug('batch started');
    }
}