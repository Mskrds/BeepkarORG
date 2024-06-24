//create Batch class->whenever a user update stage as closed won in opportunity ,then send Email Notification to user After 2 days
global class BatchClassAssig7 implements Database.Batchable<sObject>{
    
    
    global Database.QueryLocator start(Database.BatchableContext bc){ // collect the batches of records or objects to be passed to execute [To conv string  \'Prospecting\',]
           String userId=userinfo.getuserid();                     
        string queryAccrecords = 'Select id,StageName,Amount,CloseDate from opportunity where ownerid=:userId And StageName =\'Closed Won\'And CloseDate  < last_n_Days:6';
        system.debug('collect all the opportunities related to one Account record'+queryAccrecords);
        return Database.getQueryLocator(queryAccrecords);
        
    }
    
    global void execute(Database.BatchableContext bc, List<opportunity>opprecords){
        // process each batch of records
        list<opportunity>opplist = new list<opportunity>();
      
        Decimal Grandamout =0;
            for(opportunity opp:opprecords){
                Grandamout = Grandamout+opp.amount;
            
            opp.GrandAmountBasedon_User__c =Grandamout;
              opplist.add(opp);
 }
         update opplist;
        system.debug('account name changed'+opplist);    
    }
 
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
    //Id batchId = Database.executeBatch(new BatchclassAssig4(), 5);
}