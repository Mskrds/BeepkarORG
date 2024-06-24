public class XYZ {
 
    Public static list<opportunity> XYZFun1(List<Account>acclist){
        List<opportunity>opps= XYZFun2(acclist);
   return opps;
    }
     Public static list<opportunity> XYZFun2(List<Account>acclist){
         
        list<opportunity> ooplist;
         for(account acc: acclist){
             ooplist=[select id,amount from opportunity where accountid=:acc.id];
         }
         
          return ooplist;
        
    }
    // XYZFun3: Implemeting the wrapperclass and creating instance
    // The logic on xyzFun3 method to fetch contact list, opportunity list,case list as per the provided account id.(Bulkify data)
    
      Public static list<AccountWrapper> XYZFun3(list<Account>Acclist){
          
          List<AccountWrapper> Accwrapperlist = new list<AccountWrapper>();

          For(Account Acc:Acclist){
              AccountWrapper wraptoAccount=new AccountWrapper();  // instance creation to wrapperclass
        list<contact> Acc_ConList=[select id,Lastname from contact where AccountId =:Acc.id]; //fetch contacts related to account
        wraptoAccount.conlist=Acc_ConList;       // 
        
        list<opportunity> Acc_Opp_list=[select id, Name from opportunity where AccountId =:Acc.id];
        wraptoAccount.opplist=Acc_Opp_list;
        
        list<case> acc_case_list=[select id,status from case where AccountId =:Acc.id];
        wraptoAccount.caselist=acc_case_list;

              Accwrapperlist.add(wraptoAccount); //(Bulkify the data into list)
     }
          // system.debug('acclist on relates obj:::'+wrapAccount);
        return Accwrapperlist;
    }
    
    //createed the wrapperclass
    public class AccountWrapper {
    public list<contact> conlist; // to use the conlist(con fileds), create instance to wraptoAccount and added to List.
    public list<opportunity> opplist;
    public list<case> caselist;
} 
    
}