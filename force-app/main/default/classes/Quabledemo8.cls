//: Data Cleansing Operation on a Custom Object
//•	Objective: Identify and correct data anomalies in MyCustomObject__c.
//•	Details: The Queueable class should find records 
// with missing or incorrect data in certain fields (e.g., Email_c, Phone_c) and update them or flag them for review.
//•	Key Learning: Data validation, anomaly detection.

public class Quabledemo8  implements Queueable{
    public void execute(QueueableContext context){
        set<Id> contactIdSet = new set<Id>();
        Map<Id,Contact> MapOfId = New Map<Id,Contact>();
        List<contact> allContacts = [select id,name,Email,Phone,Present__c from contact where Present__c = False];
        Integer consize = allContacts.size();
        System.debug('Contact Size === >' +consize);
        list<Contact> contactListToUpdate = New List<Contact>();
        for(Contact cons : allContacts){
           contactIdSet.add(cons.Id); 
        }
        
        
        for(Contact con : [Select id,Name,Email,Phone,Present__c from Contact where Id In : contactIdSet]){
            if(con.phone != null ){
                
                con.Present__c = True;
                MapOfId.put(con.id,con);
                
            }
            if(con.Email != null){
            
                con.Present__c = True;
                MapOfId.put(con.id,con);
            }
        }
        if(contactListToUpdate.size()>0){
            update MapOfId.values();
            System.debug('update contact size ====>' +contactListToUpdate.size());
        }
      
        
    }
    
}