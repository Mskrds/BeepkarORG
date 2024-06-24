//3.Create a batch class to delete Opportunity records whose created date is older than 6 months
//9.When Record is deleted send Email notificationto record owner after 1 week

global class BatchclassAssig3and9 implements Database.Batchable<sObject>,Schedulable,Database.Stateful{
    
    //1.Write a batch class to update all account Name as Account.Name + SFDC
    global Database.QueryLocator start(Database.BatchableContext bc){ // collect the batches of records or objects to be passed to execute
         date afteroneday = system.today().addDays(-1);
        
        string queryAccrecords = 'select id,name,stagename,Close Date, from opportunity where StageName =\'Closed Won\' AND Close Date>=:afteroneday';
        
        string queryAccrecords1 = 'select id,CreatedDate from opportunity where CreatedDate < LAST_N_DAYS: 26 limit 2';
        system.debug('collect all the account records'+queryAccrecords);
        return Database.getQueryLocator(queryAccrecords);
        
    }
    
    global void execute(Database.BatchableContext bc, List<opportunity>Opprecords){  // oppo.CreatedDate = (Date.Today() - 20);
        // process each batch of records
        list<opportunity>opplist = new list<opportunity>();
        for(opportunity opp:Opprecords){
            opplist.add(opp);
        }
        delete opplist;
        system.debug('account name changed'+opplist);
    }    
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        
        
        AsyncApexJob aaj = [Select Id, Status, NumberOfErrors, JobItemsProcessed, MethodName, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
        
        // Send an email to the Apex job's submitter notifying to user email.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {aaj.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Opportunity Record is Deleted-Assig3: ' + aaj.Status);
         String bodyText='A new Opportunity Record is Deleted';
              mail.setPlainTextBody(bodyText);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        //email closed
    }
    
     //Method which schedules the ProductDownloadBatch
    global void execute(SchedulableContext sc) {        
        BatchclassAssig3and9 snInstance = new BatchclassAssig3and9();
        ID batchprocessid = Database.executeBatch(snInstance);
    }
    
    //Id batchId = Database.executeBatch(new BatchclassAssig3and9(), 5);
    
}