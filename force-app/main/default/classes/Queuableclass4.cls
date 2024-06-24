//find all Opportunities related to a certain Account and update a custom field TotalOpportunityValue__c on the Account.
// Based on the sum of Amount from the related Opportunities.

public class Queuableclass4 implements Queueable{
    
    public void execute(QueueableContext context){
        Integer startPoint =0;
        Integer Batchsize = 2000;
        List<Account> allContacts = [select id,name,Total_Opportunity_Amount__c,(Select id,Amount from opportunities) from Account];
        Integer consize = allContacts.size();
        
        while (startPoint < consize) {
            Integer endpoint = startPoint + batchSize;
            if (endpoint > consize) {
                endpoint = consize;
            }
            
            List<Account> allContactsToUpdate = new List<Account>();
            Decimal total=0;
            for (Integer i = startPoint; i < endpoint; i++) {
                for(Account acc : allContacts){
                    
                    for(Opportunity opp : acc.opportunities){
                        total = total + opp.Amount;
                    }
                    acc.Total_Opportunity_Amount__c = total;
                     allContactsToUpdate.add(acc);
                }           
            }
    
    
    if (!allContactsToUpdate.isEmpty()) {
        update allContactsToUpdate;
    }
    
    startPoint = endpoint;
}
}
}