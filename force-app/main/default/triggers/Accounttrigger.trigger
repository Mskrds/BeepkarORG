trigger Accounttrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
 /*   if(trigger.isinsert && trigger.isbefore){
        system.debug(trigger.new);
        system.debug(trigger.old);
        system.debug(trigger.newmap);
        system.debug(trigger.oldmap);
        FetchtheCobjData.triggerhandleracc(trigger.new, trigger.newmap);   
    }
    
    if(trigger.isBefore){
        If(trigger.isinsert){
            System.debug('Before Insert is executed');
        }
        Else if(trigger.isupdate){
            System.debug('Before update is executed');  
        }
        Else if(Trigger.isdelete){
            System.debug('Before Delete is executed');
        }
        Else if(trigger.isundelete){
            System.debug('Before Undelete is executed');
        }
        
    } 
    
    //Context variable: Trigger.new
     if(trigger.isbefore && trigger.isinsert){
      for(account acc:trigger.new){
        acc.NumberofLocations__c = 2;
    }
     }
    
    //Context variable: Trigger.old
    //retruns the old value
    if(trigger.isBefore && trigger.isdelete){
        String username = userinfo.getname();
      //  list<profile>profilename=[select id,name from profile where Id=:profileId];
        for(account acc: trigger.old){
            if(acc.Active__c=='Yes' && username =='siva@util.com'){
                acc.adderror('your not allowed to delete');
            }
        }
    }
    //Context variable: Trigger.oldmap
    //retruns the old value
    if(trigger.isBefore && trigger.isupdate){
        
        for(Account acc : trigger.new){
            Account old = Trigger.oldMap.get(acc.id);
            if(acc.Email__c!=null && acc.Email__c!= old.Email__c)
            {
                acc.Email__c.addError('Email cannot be changed');
            }
        }
    } */
    
    
    if(trigger.isinsert || trigger.isbefore){
        accountcopybillingaddress.copyshippingtobillingaddress(trigger.new);
    }
    
}