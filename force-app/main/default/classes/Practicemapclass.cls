public class Practicemapclass { //OpportunityLineItem
    
    Public Static void CreateAsset(list<OpportunityLineItem>OLIList){
        Set<Id>Oppids = new set<Id>();
        for(OpportunityLineItem newopplist :OLIList){
            Oppids.add(newopplist.opportunityId);
        }
        Map<Id,List<OpportunityLineItem>>Map1 = New Map<Id,List<OpportunityLineItem>>();
        for(OpportunityLineItem OLi :OLIList){
            If(!Map1.containskey(OLi.opportunityId)){
                Map1.put(OLi.opportunityId,new list<opportunitylineitem>());
            }  
            Map1.get(OLi.opportunityId).add(OLi);  //get opportunity id from oli
        }
        Map<id,list<opportunity>>Map2 = new map<id,list<opportunity>>();
        List<Opportunity> opplist =[Select id, AccountId,Account.name from opportunity where Id In: Map1.keyset()];
        for(Opportunity oppo : opplist){
            if(!Map2.containskey(oppo.AccountId)){
                Map2.put(oppo.accountid,new list<opportunity>());
            }
            Map2.get(oppo.AccountId).add(oppo); // Get Accountid from opportunity
        }
        List<asset>asslist = new list<asset>();
        for(id accid : Map2.keyset()){
            for(opportunity oppacc :map2.get(accid)){   // accid
                for(OpportunityLineItem opli : map1.get(oppacc.id)){ //oppo id
                    Asset ass = new asset();
                    if(oppacc.Account.name !=null){
                         ass.Name = oppacc.Account.name;
                    }else{
                        ass.Name = 'no account';
                    }
                    if(oppacc.Account.name !=null){
                        ass.AccountId = oppacc.AccountId;
                    }
                                ass.AccountId=    '0015g00001SqzzyAAB';
                    asslist.add(ass);
                }
            }
        }
        If(!asslist.isEmpty()){
            Insert asslist;
        }
        
    }
    
  /*          public class Account_class {

   public static AccountWrapper method1(string recId){
        AccountWrapper wrapAccount=new AccountWrapper();
        
        list<contact> AcconList=[select id,Lastname from contact where AccountId =:recId];
        wrapAccount.conlist=AcconList;
       
       
        list<AggregateResult>groupedResults = [SELECT COUNT(Id), AccountId FROM Contact where AccountId In:recId GROUP BY AccountId ];
       
        wrapAccount.count=groupedResults;
        
        list<opportunity> Acc_Opp_list=[select id, Name from opportunity where AccountId =:recId];
        wrapAccount.opplist=Acc_Opp_list;
        
        list<case> acc_case_list=[select id,status from case where AccountId =:recId];
        wrapAccount.caselist=acc_case_list;
       system.debug('acclist on relates obj:::'+wrapAccount);
     
        return wrapAccount;   
        
    }
    public class AccountWrapper {
    public list<contact> conlist;
    public list<opportunity> opplist;
    public list<case> caselist;
    public  list<AggregateResult> count;

} 
       

            }*/
}