global class BatchclassAssig1 implements Database.Batchable<sObject> {
    
    //1.Write a batch class to update all account Name as Account.Name + SFDC
    global Database.QueryLocator start(Database.BatchableContext bc){ // collect the batches of records or objects to be passed to execute
        string n =  'test23';                        
        string queryAccrecords = 'select id, name from account where name = :n';
        system.debug('account name changed'+queryAccrecords);
        return Database.getQueryLocator(queryAccrecords);
        
    }
    
    global void execute(Database.BatchableContext bc, List<account>Accrecords){
        // process each batch of records
        list<account>acclist = new list<account>();
        for(Account Acc:Accrecords){
            Acc.Name = Acc.Name+'SFDC';
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