public class Opprtunitytriggerhelper {
    
    /*public static void creditupdatemethod(map<id, opportunity> oppOldMap,map<id, opportunity> oppNewMap ){
        map<String, decimal> accIdWithCreditChangeMap = new  map<String, decimal>();
        List<Account> Updatedacclist = new LIst<Account>();
        
        for(string oppId : oppOldMap.keyset()){
            if(oppOldMap.get(oppId).amount != oppNewMap.get(oppId).amount && oppOldMap.get(oppId).amount != null && oppNewMap.get(oppId).amount != null){
                decimal Creditchange = oppNewMap.get(oppId).amount - oppOldMap.get(oppId).amount;
                if(accIdWithCreditChangeMap.containskey(oppOldMap.get(oppId).AccountID)){
                    Decimal existingaccountcreditchangevalue = accIdWithCreditChangeMap.get(oppOldMap.get(oppId).AccountID); 
                    existingaccountcreditchangevalue = existingaccountcreditchangevalue + Creditchange;
                    accIdWithCreditChangeMap.put(oppOldMap.get(oppId).AccountID, existingaccountcreditchangevalue);
                    
                }
                else{
                     accIdWithCreditChangeMap.put(oppOldMap.get(oppId).AccountID, Creditchange);
                }
            }
        }
        Map<Id, account> accmap = new Map<Id, account>();
        List<Account> Accolist = [SELect id, credit__c from account where Id IN: accIdWithCreditChangeMap.keyset()];
        for(account acc : Accolist){
            accmap.put(acc.id, acc);
        }
        
        for(string accid : accIdWithCreditChangeMap.keyset()){
            Account acc = new Account();
            acc.credit__c =  accmap.get(accid).credit__c + accIdWithCreditChangeMap.get(accid); //
            acc.Id = accid;
            Updatedacclist.add(acc);
        }
        if(Updatedacclist.size()>0){
            update Updatedacclist;
        }
        
    } */
    
  /*   Public Static void createAssetwhenOLICreated(List<OpportunityLineItem>NewList){
        set<Id>OppId = new set<Id>();
        For(OpportunityLineItem OLi :NewList){
            OppId.add(OLi.opportunityId);
        }
        Map<Id,List<OpportunityLineItem>> OppandOLiMap1 = New Map<Id,List<OpportunityLineItem>>();
       List<OpportunityLineItem>OLIList = new list<OpportunityLineItem>();
        for(OpportunityLineItem oli :NewList){
            if(!OppandOLiMap1.containsKey(oli.OpportunityId)){
                OppandOLiMap1.put(oli.OpportunityId,new List<OpportunityLineItem>()); //Adding Existing and new records
            }
            OppandOLiMap1.get(oli.OpportunityId).add(oli); // Fetching the data 
        }
        list<opportunity> Opplist =[Select id,AccountId,Account.name from Opportunity where id In:OppandOLiMap1.Keyset()];// get map1 keys only-->opp Id's
        Map<id,list<opportunity>> oppandAccMap2 =  new Map<id,list<opportunity>>();
        for(Opportunity opp:Opplist){
            if(!oppandAccMap2.containsKey(opp.AccountId)){
                oppandAccMap2.put(opp.AccountId,new List<Opportunity>());
            }
            oppandAccMap2.get(opp.AccountId).add(opp);
        }
        List<Asset> AssetsList = new List<Asset>();
        for(Id getaccid : oppandAccMap2.keyset()){
            for(Opportunity opp : oppandAccMap2.get(getaccid)){ //get account Id and storing in opp varaible
                for(OpportunityLineItem oli :OppandOLiMap1.get(opp.Id)){ //get opp id
                    Asset Ass = new Asset();
                    Ass.AccountId = opp.AccountId;
                    Ass.name = opp.Account.name;
                    AssetsList.add(Ass); 
                    
                }     
            }
        }
        if(!AssetsList.isEmpty()){
            insert AssetsList;
        }
        
    }  */
    
}