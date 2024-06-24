//4.Create a batch class to calculate the total number of amount of all related Opportunities for each Account
global class BatchclassAssig4 implements Database.Batchable<sObject>{
    
    
    global Database.QueryLocator start(Database.BatchableContext bc){ // collect the batches of records or objects to be passed to execute
                                
        string queryAccrecords = 'Select id,Total_Opportunity_Amount__c,(Select id,amount from opportunities) from Account';
        system.debug('collect all the opportunities related to one Account record'+queryAccrecords);
        return Database.getQueryLocator(queryAccrecords);
        
    }
    
    global void execute(Database.BatchableContext bc, List<account>Accrecords){
        // process each batch of records
        list<account>acclist = new list<account>();
       // list<opportunity>opplist = new list<opportunity>();
        Decimal Grandamout =0;
        for(Account Acc:Accrecords){
          
            for(opportunity opp:Acc.opportunities){
                Grandamout = Grandamout+opp.amount;
            }
            Acc.Total_Opportunity_Amount__c =Grandamout;
              acclist.add(Acc);
        }
        update acclist;
        system.debug('account name changed'+acclist);
    }    
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
    //Id batchId = Database.executeBatch(new BatchclassAssig4(), 5);
}