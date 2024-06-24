//5.update Account records based on related Contact information.
//Update this field as all the contact's Name & Email (Format : Contact.Name - Contact.Email, Contact2.name-Contact2.Email.......)
global class BatchClassAssig5 implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){ // collect the batches of records or objects to be passed to execute
                              
        string queryAccrecords = 'select id,description,(select id,lastname,email from contacts) from account';
        system.debug('account name changed'+queryAccrecords);
        return Database.getQueryLocator(queryAccrecords);
        
    }
    
    global void execute(Database.BatchableContext bc, List<account>Accrecords){
        // process each batch of records
        list<account>acclist = new list<account>();
        string name = '';
        for(Account acc : Accrecords){
            for(contact con: Acc.contacts){
                name =name+con.lastName +'-' +con.Email+',';
               
            }
             acc.Description = name;
              acclist.add(acc);
        }
        update acclist;
        system.debug('account Description'+acclist);
    }    
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
    //Id batchId = Database.executeBatch(new BatchClassAssig5(), 5);
}