public class WrapperclassAssignment {
    
    //1.Create Wrapper to Show All Account,Contact,Case,Opportunity,Lead Count for the Loged in User.
    
  /*  public static Countofaccol method1(string UserIDs){
        Countofaccol wrapobj=new Countofaccol();
        Set<Id> allownerIds= new Set<Id>();
        allownerIds.add(UserIDs);
        
        integer AcconList=[select COUNT() from Account where ownerId in:allownerIds];
        wrapobj.AccountrecordsCount=AcconList;
        System.debug('Count of Accounts'+AcconList);
        
        
        integer ConList=[select COUNT() from contact where ownerId in:allownerIds];
        wrapobj.contactrecordscount=ConList;
        System.debug('Count of Accounts'+ConList);
        
        Integer caselist =[select count() from case where ownerId in:allownerIds];
        wrapobj.caserecordscount=caselist;
        System.debug('count of case'+caselist);
        
        
        Integer oppolist = [select count() from opportunity where ownerid in:allownerIds];
        wrapobj.opporecordscount=oppolist;
        system.debug('count of opportunities'+oppolist);
        
        
        Integer leadlist=[select count() from lead where ownerid in:allownerIds];
        wrapobj.Leadrecordscount = leadlist;
        system.debug('count of leads'+leadlist);
        return wrapobj; 
    } */
       
  //2.Create Wrapper class to fetch all Acccount,Contact & Lead List for loged in user.
  /*  public static fetchobjrecords Assg2(string UserIDs){
        fetchobjrecords sobjectwrap = new fetchobjrecords();
        Set<Id> allownerlist= new Set<Id>();
        allownerlist.add(UserIDs);
        
        list<Account>AllAccounts=[select name from Account where ownerId in:allownerlist];
        sobjectwrap.acclist=AllAccounts;
        System.debug('User Related Accounts'+AllAccounts);
        
        
        list<contact>allcontacts = [select lastname from contact where ownerId in:allownerlist];
        sobjectwrap.conlist=allcontacts;
        System.debug('User related Contacts'+allcontacts);
        
        list<lead>allleads = [select name from lead where ownerid in:allownerlist];
        sobjectwrap.leadlist= allleads;
        System.debug('user related leads'+allleads);
        
        Return sobjectwrap; // retrun type 
    } */
    //3.using wrappper create Account,Contact,Lead in single method.
    public static CreateAcConLead Assig3 (){
        
        CreateAcConLead WarapACL = new CreateAcConLead();
        
        account acc= new account(Name= 'wrapperAccount');
        WarapACL.Accacl=acc;
        System.debug('New account'+acc);
        
        Contact con = new contact( Lastname= 'wrappercontact');
        WarapACL.concla=con;
        System.debug('New account'+con);
        
        lead led = new lead(Lastname= 'wrapperlead',Company = 'util'); 
        WarapACL.ledlca=led;
        System.debug('New account'+led);
        
        insert acc;
        insert con;
        insert led;
        Return WarapACL;
    } 
    //4.Using wrapper show Opportunity records & opportunity line item records

    public static displayopportunityrelatedOLI Assg4(list<opportunity>opplists){
       
        displayopportunityrelatedOLI sobjectopp = new displayopportunityrelatedOLI();
        
        Set<id>oppandoliids = new set<id>();
        for(opportunity opp : opplists){  
            
            oppandoliids.add(opp.id);
            
        }
        list<opportunity>oppsrecords = [select id,amount from opportunity where id In:oppandoliids];
        sobjectopp.oppolist=oppsrecords; 
        System.debug('opportunity records'+oppsrecords);
        
        list<opportunityLineItem> olirecords=[select id,name from opportunityLineItem where opportunityid in:oppandoliids];
        sobjectopp.olilist =olirecords;
        system.debug('Opportunity Line Item records'+olirecords);
        
        return sobjectopp;  
    }  
    //5.Using wrapper get Account records 
    
  /*  public static getaccrecords Ass5(string UserIDs){
        getaccrecords wrapobj=new getaccrecords();
        
        list<account> acclist=[select id,name from Account];
        wrapobj.accist=acclist;
        System.debug('Count of Accounts'+acclist);
    
    
    return wrapobj;
    
    } */
/*    //6.Write a method to show Account with its associated contacts by using wrapper class

    public static displayAccrelatedcon Assg6(list<account>accoulist){
         
        displayAccrelatedcon sobjectacc = new displayAccrelatedcon();
        Set<Id> accids = new Set<Id>();
        for(account acc : accoulist) {
        
        accids.add(Acc.id);
        }
        list<Account>Accrelatecon=[select id,name,(select accountid from contacts) from account where id In:accids];
       // [select id from opportunity where id in(Select opportunityid from opportunitylineitem)];
        sobjectacc.getaccrealedcon=Accrelatecon;
      
        System.debug('User Related Accounts'+Accrelatecon);
    
    
    return sobjectacc;
    
    
    } */
/*    //7.Create a wrapper class to show Account Object records.
    
     public static showaccrecords assg7(string UserIDs){
        showaccrecords wrapobjacc =new showaccrecords();
        Set<Id> allownerIds= new Set<Id>();
        allownerIds.add(UserIDs);
        
        list<account>AcconList=[select id, name from Account where ownerId in:allownerIds];
        wrapobjacc.fetchaccrecords=AcconList;
        System.debug('Count of Accounts'+AcconList);
    
    return wrapobjacc;
    
    
     } */
    // for first scenario  
    public class Countofaccol {
        public integer AccountrecordsCount;
        public integer contactrecordscount;  
        public integer caserecordscount;
        public integer opporecordscount;
        public integer Leadrecordscount;  
    }
    // for Second scenario
    public class fetchobjrecords{ // class
        public list<account>acclist; // parameters
        public list<contact> conlist;
        public list<lead> leadlist;
        public list<case> caselist;
    }
    // for third scenario
    public class CreateAcConLead {
        public account Accacl {get;set;}
        public contact concla {get;set;}
        public lead ledlca {get;set;}
    
} 
//for fourth scenario
   public class displayopportunityrelatedOLI {
    public list<opportunity>oppolist;
       public list<opportunitylineitem>olilist;
}
//for fifth scenario
  public class getaccrecords{
    public list<account>accist;
}
//for Sixth scenario
  public class displayAccrelatedcon{
    public list<account>getaccrealedcon;
}

// for seventh scenario
  public class showaccrecords{
    public list<account>fetchaccrecords;
}
    
}