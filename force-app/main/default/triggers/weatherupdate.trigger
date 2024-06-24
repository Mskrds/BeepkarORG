trigger weatherupdate on Account (after update) {
    if(trigger.isupdate  && trigger.isafter){
        
        for(Account a : Trigger.new){
            if( a.State__c!= trigger.OldMap.get(a.id).State__c ){
                weatherupdatesonaccount.weatherinfo123(JSON.serialize(a));

            }
        }
        
    }
}