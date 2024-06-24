//Scenario: Write a batch class to send notification to the Owner of the Opporunity Record if Close Date is today.
// Object: Opportunity,  Certiria: When Close Date is Today
global class  batchApexNotifytoowner implements Database.Batchable <sobject> {
   
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        String Query;
        Date oppdate =date.today();
        Query ='Select id,Name,CloseDate from opportunity where CloseDate=:oppdate';
        return Database.getQueryLocator(Query);
    }
    
    global void execute (Database.BatchableContext bc,List<opportunity>oppolist){
         system.debug('list of opportunity'+oppolist);
        list<Messaging.SingleEmailMessage>emalislist = new list< Messaging.SingleEmailMessage>();
        For(Opportunity opp:oppolist){
            // message.toAddresses = new String[] { '003D000000QDexS', '003D000000QDfW5' };
            //message.optOutPolicy = 'FILTER';
            
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {'saikumarmallagun@gmail.com'});
            email.setSubject('opportunity closed date');
            email.setPlainTextBody('Dear user, Your opportunity '+opp.name+' closed date is Today');
            emalislist.add(email);
            
        }

        Messaging.sendEmail(emalislist);
        
        
    }
      global void finish(database.BatchableContext bc) {}
}