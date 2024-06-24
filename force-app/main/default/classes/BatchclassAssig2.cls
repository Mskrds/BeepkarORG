//Create one Custom Field on Account as "Batch Executed" checkbox. Get all the Account records and update this field as true.
global class BatchclassAssig2 implements Database.Batchable<sObject> {
    
    //1.Write a batch class to update all account Name as Account.Name + SFDC
    global Database.QueryLocator start(Database.BatchableContext bc){ // collect the batches of records or objects to be passed to execute
                                
        string queryAccrecords = 'select id, name from account';
        system.debug('collect all the account records'+queryAccrecords);
        return Database.getQueryLocator(queryAccrecords);
        
    }
    
    global void execute(Database.BatchableContext bc, List<account>Accrecords){
        // process each batch of records
        list<account>acclist = new list<account>();
        for(Account Acc:Accrecords){
            Acc.Batch_Executed__c = true;
            acclist.add(Acc);
        }
        update acclist;
        system.debug('account name changed'+acclist);
    }    
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
    //Id batchId = Database.executeBatch(new BatchclassAssignment(), 5);
}