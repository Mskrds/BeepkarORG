public class TriggerAssignHandlerClasses {
 /*   //1.when a contact insert an email should be sent to contact email id with specified template.
    Public static void whencontactcreatesendemailtemplate (list<contact>conlist){
        set<id>conids= new set<id>();
        for(contact con: conlist){
           
            conids.add(con.id);
        }
        list<contact>getcontactsdata = [Select id,lastname, email from contact where id IN :conids];
        
        EmailTemplate emlTmp = [select id,subject,Description,Htmlvalue,Developername,Body from EmailTemplate where name = 'Contact email Template'];
        
        // getting user and passing at setTargetObjectId   
        Id userId = UserInfo.getUserId();
        User uu = [select id,firstName,Lastname from user where Id =: userId LIMIT 1];

        //Email template body
        List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
        for(contact Newcon:getcontactsdata){
            
            if(Newcon.Email!= null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(uu.id);  // targetobj only suit for contact, lead, and user objects only
                mail.setSenderDisplayName('New Contact is Created'); 
                mail.setSaveAsActivity(false);            //general the saveasactivity is true, so make it as flase
                mail.setTemplateID(emlTmp.Id);
                mail.setSubject('New Contact is Created.');
                mail.toaddresses = new string[]{Newcon.Email};
                    emailList.add(mail);
            }
        }
        if(emailList.size()>0){
            Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
            if (results[0].success)
            {
                System.debug('The email was sent successfully.');
            } 
            }   
    } */
      
    /* 2.Public static void preventduplicaterecord (list<contact>conlist){
set<string>emaillist = new set<string>();
Set<string>phonelist = new set<string>();
for(contact con : conlist){
emaillist.add(con.email);
phonelist.add(con.phone);

}
List<contact>getemailandphone = [select lastname,phone,email from contact where email IN: emaillist AND phone IN: phonelist];
/*for(contact prevsemailphonerec : getemailandphone){
if(prevsemailphonerec.size() > 0 ){
prevsemailphonerec.adderror('Found Duplicate Email or phone');    // dont add erro method to the list 
//Best pract: https://developer.salesforce.com/forums/?id=9062I000000gCuoQAE
}
//}  mistake above lines

for(contact con : conlist){
if(getemailandphone.size() > 0 ){
con.addError('Found Duplicate Email or phone');
} 
}


}
//3.Write a trigger, only system admin user should be able to delete the task.

Public static void deletetaskbyadminonly (list<Task>tasklist){
profile getadmin = [SELECT Id FROM Profile WHERE Name='System Administrator'];
For(Task gettasklist :tasklist ){
if(UserInfo.getProfileId()!=getadmin.Id){
gettasklist.addError('Only system admin can delete the task');
}

}

} */
    /*  //4.Write a trigger on Account , when an account insert , automatically account billing address should populate into the account shipping address.

Public static void accBillindShippingaddress(list<Account>Acclist){ 

for(Account Acc:Acclist){

Acc.ShippingPostalCode = Acc.BillingPostalCode;
Acc.ShippingCity = Acc.BillingCity;
Acc.shippingcountry= Acc.BillingCountry;
Acc.ShippingState= Acc.BillingState;
}
}    */
  //5. when an Opportunity will be insert an Opportunity Line Item should be insert
  // by default with any of the Product associated with Opportunity.
  
  /*public static void opportunityinsertion(list<opportunity> opplist){
        list<OpportunityLineItem> oppllist=new list<OpportunityLineItem>();
        for(opportunity opp:opplist){
            OpportunityLineItem oppLineItm=new OpportunityLineItem();
            oppLineItm.OpportunityId=opp.Id;
            
            PricebookEntry pricebookentryid=new PricebookEntry();
            oppLineItm.Product2Id='01t5g00000FU9qQAAT';
            oppLineItm.PricebookEntryId='01u5g00000C4cFEAAZ';
            oppLineItm.Quantity=2;
            oppLineItm.TotalPrice=70;
            oppllist.add(oppLineItm);
        }
        if(oppllist.size()>0){
            insert oppllist;
        }
    } */
      
    
    //  6.Create a duplicate lead when a lead in insert.
  /*  Public static void createduplicateLead(list<Lead>Leadlist){
        List<Lead>AllLeads = new list<Lead>();
        For(lead newlead :Leadlist){ //myString1.contains(myString2);
            if(!(newlead.LastName).contains('Duplicate')){
            lead duplicate = new lead();
            duplicate.LastName = 'Duplicate '+newlead.LastName;
            duplicate.FirstName = 'New';
            duplicate.company = newlead.company;
            AllLeads.add(duplicate);
        }
            }
        if(AllLeads.Size()>0){ //Isempty
       insert  AllLeads;
        }
    }  */
  //09.Once an account insert, a contact will create with the name of account and that contact will be the client contact on Account
   // client contact on Account - means : associated to Account?
   //Object : Account, DML : Insert, Event: After, context Var: Trigger.new 
/*  Public Static void Createconwhenaccreated (List<account>Acclist){
        list<contact>conlist = new list<contact>();
        for(account Acc:Acclist){
            Contact con = new Contact();
            con.lastname = Acc.name;
            Con.Email = acc.Email__c;
            con.accountId = acc.Id;
            conlist.add(con);
        }
        Insert conlist;
 
    Account Acc = new Account();
    Acc.Id = conlist[0].AccountId;
    acc.client_contact__c =conlist[0].id;
      update Acc;
   } */  
 /*      //10.When an opportunity line item created,then an email should go to Opportunity-->Account-->contact emailid 
       //Client Contact -- Client Contact would be a fields on Account lookup to contact.

    
    public static void sendEmailToOppAccEmail(List<OpportunityLineItem> oppLineItemList){
        Set<Id> oppIds = new Set<Id>();
        for(OpportunityLineItem oppLineItems:oppLineItemList){
            oppIds.add(oppLineItems.Id);
        }
        //Query on OLI 
        List<OpportunityLineItem> oliItem = [select id,name,product2.name,ProductCode,UnitPrice,ListPrice, Discount, OpportunityId, Opportunity.Account.Client_Contact__r.Lastname,Opportunity.Account.Client_Contact__r.Email from OpportunityLineItem where Id IN: oppIds];
        
       // created email template and querying it
        EmailTemplate emlTmp = [select id,subject,Description,Htmlvalue,Developername,Body from EmailTemplate where name = 'OpportunityLineItem Email Template'];
        
        // getting user and passing at setTargetObjectId   
        Id userId = UserInfo.getUserId();
        User uu = [select id,firstName,Lastname from user where Id =: userId LIMIT 1];

        //Email template body
        List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
        for(OpportunityLineItem oppLineItems:oliItem){
            
            if( oppLineItems.Opportunity.Account.Client_Contact__r.Email!= null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(uu.id);  // targetobj only suit for contact, lead, and user objects only
                mail.setSenderDisplayName('System Administrator'); 
                mail.setSaveAsActivity(false);            //general the saveasactivity is true, so make it as flase
                mail.setTemplateID(emlTmp.Id);
                // replacing the record values into the template body 
                mail.setSubject('New Opportunity Product was Created.');
                String body = 'HI '+oppLineItems.Opportunity.Account.Client_Contact__r.Lastname+', <br/>';
                body += 'Your Order has been proceed,Order detail is below.<br/>';
                body +='Product Name : '+oppLineItems.Name+'.<br/>';
                body +='Product Code : '+oppLineItems.ProductCode+'.<br/>';
                body +='Unit Price : '+oppLineItems.UnitPrice+'.<br/>';
                body +='List Price : '+oppLineItems.ListPrice+'.<br/>';
                body +='Thanks <br/>'+uu.Lastname;
                mail.setHtmlBody(body);
                
                
                mail.toaddresses = new string[]{oppLineItems.Opportunity.Account.Client_Contact__r.Email};
                    emailList.add(mail);
            }
        }
        if(emailList.size()>0){
            Messaging.SendEmailResult[] results = Messaging.sendEmail(emailList);
            if (results[0].success)
            {
                System.debug('The email was sent successfully.');
            } 
            }
        } */
  
   //11. Once an account created, an email should go to the admin user with specified text below. 
   //An account has been created and name is "Account Name".
   //Object: Account, DML : Update,Event: After  Context Var:Trigger.new
    
   /* public static void SendEmailToAccUser(List<Account> Acclist){
        List<Messaging.SingleEmailMessage> mails =new List<Messaging.SingleEmailMessage>();
        List<String> allAdminEmails = new List<String>(); // to store multiple emails
        For(Account Acc:Acclist){
            if(user.email!=null){   
                List<User> adminUsersemail = new list<User>([Select email from user where profile.name = 'System Administrator']);
                
                for (User adminuser :adminUsersemail ){
                    
                    allAdminEmails.add(adminUser.email);
                }
                
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
               
               
                mail.setToAddresses(allAdminEmails);
                mail.setSenderDisplayName('saikumar Email');
                mail.setSubject('New Account Created');
                mail.setHtmlBody('An Account has been created and name is "Account Name".:'+ Acc.name);
                
                mails.add(mail);
                Messaging.sendEmail(mails); // method
            }     
        }   
    }  */
    
    //24.When an account BillingCity is update , update all contacts MailingCity with account BillingCity
    //Object: Account, DML:Update, Event: After , Context var: Trigger.new
  /*  Public static Void AccBillCityUpdateonCon(List<Account>newlist ,Map<Id,Account>oldMapAcc){
        list<contact>conlist=new list<contact>();
        Set<Id>allIds = new Set<Id>();
        for(Account Acc : newlist){ 
            if(Acc.BillingCity!=oldMapAcc.get(Acc.Id).BillingCity && Acc.BillingCity!=null){
                allIds.add(Acc.id);
            }
        }
        List<Contact>conListToUpdate = [Select id,MailingCity,Accountid,Account.BillingCity from Contact where Accountid =:allIds];
        //List<Contact> conList = [Select Id,MailingCity,AccountId,Account.BillingCity from Contact where AccountId=:accId ];
        For(contact con : conListToUpdate){
            con.MailingCity = con.Account.BillingCity;         
            conlist.add(con);
            
        }
        if(conlist.size()>0){
            update conlist; 
            
            
        }
    } */
    // 14.Upload any pdf file into Document first. Send an email as attachment to lead email Id.
    //Object: Document, DML: Insert, Event: After, Context var:Trigger.new.
    
 /*   Public Static void SendemailwithattachedPdf (List<Attachment>allAttachment){
        List<Messaging.SingleEmailMessage> mails =new List<Messaging.SingleEmailMessage>();
        List<lead>Allleads = new list<lead>();
        List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
        For(Attachment file :allAttachment){
            Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
            efa.setFileName(file.Name);
            efa.setBody(file.Body);
            efa.setContentType(file.ContentType);
            attachments.add(efa);
        }  
   // messaging.setFileAttachments(attachments);
    //if(Attachmentlist.Name.endsWith('.pdf') && Attachmentlist.parentId.getSObjectType().getDescribe().getName().equals('Lead'))
    //{

        // to store multiple emails
        For(Lead leadlist:Allleads){
            if(leadlist.email!=null){   
                
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                mail.setToAddresses(new List<String>{leadlist.Email});
                mail.setSenderDisplayName('saikumar Email');
                mail.setSubject('New Lead Created');
                
                
                mail.setHtmlBody('Pdf is attached in this Lead and name is "LeadName".:'+ leadlist.Lastname);
                mails.add(mail);
                Messaging.sendEmail(mails); // method
            }
        }     
    }  */  //   Not Done-Pending


 //15.Write a trigger on Account when an account type updated, send an email to all contacts as:That your account information has been change.
 //Object: Account, DML: Update, Event: After, Context var:Trigger.new.
 
  /*  Public static Void SendemailWhenAccTypeupdated (List<Account>newlist ,Map<Id,Account>oldMapAcc){
        list<contact>conlist=new list<contact>();
        List<Messaging.SingleEmailMessage> mails =new List<Messaging.SingleEmailMessage>();
        Set<Id>allIds = new Set<Id>();
        for(Account Acc : newlist){ 
            if(Acc.Type!=oldMapAcc.get(Acc.Id).Type && Acc.Type!=null){
                allIds.add(Acc.id);
            }
        }
        List<Contact>conListToUpdate = [Select id,email,Accountid,Account.Type from Contact where Accountid IN:allIds];
        
      
        For(contact con : conListToUpdate){
            if(con.email!= null){        
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                mail.setToAddresses(new List<String>{con.Email});  // to store multiple emails
                mail.setSenderDisplayName('saikumar Email');
                mail.setSubject('Acc Field Status');
                mail.setHtmlBody('An Account has been Updated and name is');
                mails.add(mail);
            }     
        }     
        Messaging.sendEmail(mails);
    } */
    
    // 7.when Account is update check all opportunity inside the account.
    //Update all Opportunities Stage to close lost, if an opportunity created date is greater than 30 days from today & stage not equal to close won.
    // Object Name: Account, DML:Update,Event: After, Context var:Trigger.new.
  /*   Public static void PopulateoppstageName(List<Account>newlist ,map<id,account>oldAccmap){
        Set<Id>allIds = new Set<id>();
        for(Account Acc : newlist){ 
            if(Acc.Update_Opportunity_Stage__c!=oldAccmap.get(acc.id).Update_Opportunity_Stage__c){
            allIds.add(Acc.id);
        }
            }
        //day30 is the date which is 30 days less than today
        DateTime Lessthan30days=system.now()-30;
        List<opportunity>allOppolist = new list<opportunity>();
        List<opportunity> geopplist=[Select id,Accountid,CreatedDate,CloseDate,StageName from opportunity  where Accountid in:allIds];
        
        for(Opportunity opp1 : geopplist){
            if(opp1.CreatedDate>Lessthan30days && Opp1.StageName!='Closed Won'){
                Opp1.StageName='Closed Lost';
                allOppolist.add(Opp1);
                    }
            
        }
        
        if(allOppolist.size()>0){
            Update allOppolist;
        }
    } */
 
    //12.Once an opportunity line item will created, update Opportunity's Account with the total number of Product Quantities.
    // Object: Oppo Line Item, DML: Update, Event: After, Context var:Trigger.new. 
    
  /*  public static void updateQuantityOnAccount(list<OpportunityLineItem> olilist){
        public static void updateQuantityOnAccount(list<OpportunityLineItem> olilist){
        list<account> acclist=new list<account>();
        decimal totalQuantity=0;
        set<id> oppids=new set<id>();
        set<Id> accids=new set<id>();
        for(OpportunityLineItem oli:olilist){
            oppids.add(oli.OpportunityId);
            
        }
        system.debug('Line 45:oppids:::'+oppids);
        list<OpportunityLineItem> oliquery=[select id,Opportunity.AccountId,Quantity from OpportunityLineItem where OpportunityId In:oppids];
        for(OpportunityLineItem oli:oliquery){
            totalQuantity =totalQuantity+ oli.Quantity;
            accids.add(oli.Opportunity.AccountId);
            system.debug('Line 54:oli:::'+oli);
        }
        
        List<Account> accList1 = [Select id, name,Total_sales_quantities__c from Account where Id In:accids];

        for(Account acc:accList1){
            account a=new account();
            a.Id =acc.Id; 
            a.Total_sales_quantities__c=totalQuantity;
            acclist.add(a);   
        }
        update acclist;
    }*/

  
    /* //16.Write a trigger on Opportunity line item when a line item deletes delete an opportuntiy as well
     //Object: Opp Line Item, DML: Delete, Event:After, Context var: Trigger.old

    Public Static void whenOLIDelete2Opportunity(List<OpportunityLineItem>OLIList){
        List<id>AllIds= new list<Id>();
        For(OpportunityLineItem OLI :OLIList){
            AllIds.add(OLI.opportunityId);
        }
        list<opportunity>Opplists =[Select id from Opportunity where Id In:AllIds];
        if(Opplists.size()>0){
          Delete Opplists;  
        }
        
    } */
   /* //18.Once an Opportunity line item will create insert a quotation also
    // object: Opp Line Item, DML: Insert,Event: After, Context Var: Trigger.new, 
    Public Static void createquotewhenOLICreated(List<OpportunityLineItem>OILList){
        List<Quote>Quotelist= new list<Quote>();
        set<id>AllIds=new set<id>();
        for(OpportunityLineItem OLI:OILList){
            AllIds.add(OLI.opportunityId);
        }
        List<opportunity>opplist=[select id,name from opportunity where Id In:AllIds];
        For(Opportunity opp:opplist){
            
            Quote newquotation = new Quote();
            newquotation.Name = opp.Name;
            newquotation.opportunityId = opp.Id;
            Quotelist.add(newquotation);
        }
        if(!Quotelist.isEmpty()){
            insert Quotelist;
        } 
    }  */
    //8.23.Create an asset when create an OpportunityLineItem with associated Account
    //Break the Points:(Assert-child<--Ac-parent<--Opp-Parent<--Opp OLI-Child )
    //When Oppo Line item created, then create Asset
    //Object: oppo line item, DML: Insert, Event: After, Context Var: Trigger new.
 /*   Public Static void createAssetwhenOLICreated(List<OpportunityLineItem>NewList){
        
        set<Id> Allidslist = new Set<Id>();
        for(OpportunityLineItem oppLit : NewList){
            Allidslist.add(oppLit.OpportunityId);
        }
        List<Asset> newAssetcreation= New List<Asset>();
        List<Opportunity> Opplist= [Select Id,AccountID,Account.Name From Opportunity where Id IN : Allidslist];
        
            For(Opportunity opp: Opplist){
                Asset newasset=New Asset();
                newasset.AccountID=opp.AccountId; //related to account id which makes to create under account object
                newasset.Name =opp.Account.Name;
                newAssetcreation.add(newasset);
            
        }
        if(newAssetcreation.Size()>0){
            Insert newAssetcreation;
        }
    }  */
     
/*  //8.23.Create an asset when create an OpportunityLineItem with associated Account
     Public Static void createAssetwhenOLICreated(List<OpportunityLineItem>NewList){
        set<Id>OppId = new set<Id>();
        For(OpportunityLineItem OLi :NewList){
            OppId.add(OLi.opportunityId);
        }
         
        Map<Id,List<OpportunityLineItem>> OppandOLiMap1 = New Map<Id,List<OpportunityLineItem>>();
       List<OpportunityLineItem>OLIList = new list<OpportunityLineItem>();
        for(OpportunityLineItem oli :NewList){                                          // For Calrification again I wrote this lines 
            if(!OppandOLiMap1.containsKey(oli.OpportunityId)){
                OppandOLiMap1.put(oli.OpportunityId,new List<OpportunityLineItem>()); //Adding Exisitng related and creting instance to new opplitem
            }
            OppandOLiMap1.get(oli.OpportunityId).add(oli); // Fetching the data & adding new opplItem 
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
            for(Opportunity oppa: oppandAccMap2.get(getaccid)){ //get account Id and storing in opp varaible
                for(OpportunityLineItem oli :OppandOLiMap1.get(oppa.Id)){ //get opp id
                     Asset Ass = new Asset();
                    if(oppa.Account.name !=null){ 
                        Ass.name = oppa.Account.name;  
                    Ass.AccountId = oppa.AccountId;
                         AssetsList.add(Ass);
                    }else{
                        Ass.Name = 'no account';
                    }
  
                    
                }     
            }
        }
        if(!AssetsList.isEmpty()){
            insert AssetsList;
        }
        
    } */
    
    
 /*  //19.Check the UsageEndDate on Asset and populate on Account Level Field--> if Asset minimum date & UsageEndDate are different.
   //Object: Account, DML: update, Event: After, Context Var: Trigger new.
 
    public static void UpdateAssetMinimumExpirationDate(List<Asset> newList){                     // Pending
        List<Account> accountsToUpdate = new List<Account>();
        for(Asset ass:newList){
            if (ass.UsageEndDate !=null && (ass.UsageEndDate < ass.Account.Asset_Minimum_Expiration_Date__c)){
                Account acc = New Account();
            	acc.Asset_Minimum_Expiration_Date__c = ass.UsageEndDate;
                acc.Id = ass.AccountId;
            	accountsToUpdate.add(acc);
        	}
        }
        if (!accountsToUpdate.isEmpty()) {
        	update accountsToUpdate;
    	}
    } */  
    //21.When Contact update, collect all opportunity Amount And Update this amount on Account Level Field (Total Opportunity Amount)

  /*  public static void updateAccTotalOppAmount(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con:conList){
            accIds.add(con.AccountId);
        }
        List<Account> accList = new List<Account>();
        List<Opportunity> oppListDetails = [select id,name,AccountId,Amount from Opportunity where AccountId IN: accIds];
        List<AggregateResult> oppAmount = [select SUM(Amount) oAmount from Opportunity where AccountId IN: accIds];
        for(Contact con:conList){
            Account acc = new Account();
            acc.Id = con.AccountId;
            acc.Update_Opp_Amt_by_Con_Update__c = (decimal)oppAmount[0].get('oAmount');
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        } 
    }*/
 
    
    
  /*  //12.Once an opportunity line item will create update Opportunity's Account with the total number of Product Quantities.
    public static void UpdateTotalSalesQuantity(List<OpportunityLineItem> newList){
        
        Map<Id,List<OpportunityLineItem>> oppOliMap = new Map<Id,List<OpportunityLineItem>>();
        Map<Id,List<Opportunity>> oppMap = new Map<Id,List<Opportunity>>();
        for(OpportunityLineItem oli : newList){
            if(!oppOliMap.containsKey(oli.OpportunityId)){
                oppOliMap.put(oli.OpportunityId,new List<OpportunityLineItem>());
            }
            oppOliMap.get(oli.OpportunityId).add(oli);
        }
        List<Opportunity> oppList =[select Id,AccountId From Opportunity Where Id IN:oppOliMap.keySet()];
        for(Opportunity opp : oppList){
            if(!oppMap.containsKey(opp.AccountId)){
                oppMap.put(opp.AccountId,new List<Opportunity>());
            }
            oppMap.get(opp.AccountId).add(opp);
        }
        List<Account> accList =[select Id,Total_sales_quantities__c From Account Where Id IN:oppMap.keySet()];
        List<account>acclistadd = new list<account>();
         Decimal temp = 0;
        for(Account acc :accList){                    
            List<Opportunity> opList = oppMap.get(acc.Id);
            for(Opportunity opp : opList){
                List<OpportunityLineItem> oliList = oppOliMap.get(opp.Id);
                for(OpportunityLineItem oli :oliList){
                    temp = temp+oli.Quantity;
                    acc.Total_sales_quantities__c = temp;
                    acclistadd.add(acc);
                }            
            }
        }
        update acclistadd;       
    } */ 
    
/*  //  13. Account will update with the total amount from All Opportunities on Account level.
    public static void UpdateamounttoAcc(List<Opportunity> newList){
        
        list<account>acclist = new list<account>();
        Map<Id,List<opportunity>> oppMap  = new Map<Id,list<opportunity>>();
        Decimal totalamount =0;
       
        for(Opportunity opp : newList){
            if(!oppMap.containskey(opp.AccountId)){
            oppMap.put(opp.accountid, opp);
        }
            }
          system.debug('oppMap--->'+oppMap.keyset());
        for(account acc1: [select id, name,Total_Opportunity_Amount__c,(Select id,amount from apportunities) from account where id In:oppMap.keyset()]){
            system.debug('acc1---->'+acc1);
            Account acc = new account();
            
            Acc.id = acc1.id;
            acc.Total_Opportunity_Amount__c += ;
            acclist.add(acc);
        }
        
update acclist; 
} */
  /* //  34.Now if we update an Opportunity with this multi select value Account should also update with same picklist values

        public static void updatemultipickvalues(list<opportunity> opplist,map<id,opportunity>oldmap1){
        Set<Id> accId = new Set<Id>();
        Map<Id,String> countryMap = new Map<Id,String>();
        for(Opportunity opp :opplist) {
            if(opp.Multi__c!=oldmap1.get(opp.Id).Multi__c && oldmap1.get(opp.Id).Multi__c!=null && opp.AccountId!=null){
               
                    countryMap.put(opp.AccountId,opp.Multi__c);
                    accId.add(opp.AccountId);
                
            }
        }
            System.debug('accId::->'+accId);
        List<Account> accUpdateList = new List<Account>();
        List<Account> accList = [select Id,Filed_Multi_Select__c from Account where Id=: accId];
        if(accList.size()>0){
            for(account a: accList){
                    a.Filed_Multi_Select__c=countryMap.get(a.Id);
                    accUpdateList.add(a);
                
            }
        }
        if(accUpdateList.size()>0){
            update accUpdateList;
        }
    }*/ 
    // 35.When line item is inserted into Opportunity, check if Oppo Product Type is same as Opli Product Family let it be insert 
    // else add error:"AsThe Product family does not match."
/*    Public static void checkOppF1equalstoOLIF2(list<OpportunityLineItem>OLIList){
        try{ 
        Set<id>OppIds = new set<id>();
        For(OpportunityLineItem oil : OLIList){
            if(oil.Product_Family_field__c!=null){   
               OppIds.add(oil.OpportunityId); 
            }
            List<opportunity>oppandoli = [select id,Picklist_Product_Type__c from opportunity where Id =:OppIds];
           // For(OpportunityLineItem oil : OLIList){
        for(opportunity opp:oppandoli){           
            if(oil.Product_Family_field__c!=opp.Picklist_Product_Type__c ){
              oil.adderror('The Product family does not match');  
            }
        }
        }
        }
        catch(exception e){
            
        } */
        
 /*  Public static void checkOppF1equalstoOLIF3(list<OpportunityLineItem>OLIList){
 
        Set<id>OppIds = new set<id>();
        map<id,String>map1 = new map<id,string>();
        For(OpportunityLineItem oil : OLIList){
            if(oil.Product_Family_field__c!=null){   
                map1.put(oil.OpportunityId,oil.Product_Family_field__c);
                OppIds.add(oil.OpportunityId); 
            }
        }
            List<opportunity>oppandoli = [select id,Picklist_Product_Type__c,(select Product_Family_field__c from OpportunityLineItems) from opportunity where Id =:OppIds];
            For(OpportunityLineItem oil : OLIList){
            for(opportunity opp:oppandoli){  
                
                if(opp.Picklist_Product_Type__c!= map1.get(oil.Id)){
                    oil.Product_Family_field__c.adderror('The Product family does not match');  
                }
            }
        }
    } */
    //33.When account is created or deleted update the user count_of_Account__C field(increment/decrement).
     /*   public static void  countofaccounts(list<account> acclist){        
        set<id> ownerids=new set<id>();
            
        for(account acc:acclist){
            ownerids.add(acc.OwnerId);
        }
        list<user> userlist=[SELECT Id, Name, Count_of_Accounts__c From User where id =:ownerids];
        Integer Countofacc = [select Count()from Account where ownerId =:ownerids];
            
        for(user us:userlist){        
            us.Count_of_Accounts__c=Countofacc;
        }
        update userlist;    
    }    */
    //31.Write a trigger on Asset 
    //Once An asset is insert in to Account, An Opportunity and one Opportunity line item have to create with respect to Account
 /*   public static void createoppandoppOLI(List<Asset>Assestlist){
        Map<Id,List<Asset>> AssMap = new Map<Id,List<Asset>>();
        Set<id>assids = new set<id>();
         list<account> acclist = [select id, Name,(Select Id, Name From Opportunities) from Account where id =: assids];
       
        for(Asset ass :Assestlist ){    
            if(ass.AccountId!=null){  
                assids.add(ass.AccountId);
            }
        }
        
  
    
        for(Account acc:acclist ){
            opportunity opp = new opportunity();
            opp.name=acc.Name;
            opp.accountid = acc.id;
            opp.CloseDate = acc.LastActivityDate;
            opp.amount= 100;
            
        }
    } */
    
  //  25.Once an Opportunity client Contact updated, then update Account client contact with same on Opportunity Client Contact

    
 /*   public static void updateAccclientconwithOpp(List<Opportunity> oppList,Map<Id,Opportunity> oldMapList){
        List<Account> accList = new List<Account>();
        for(Opportunity opp:oppList){
            if(opp.Oppo_Client_Contact__c != null && opp.Oppo_Client_Contact__c != oldMapList.get(opp.Id).Oppo_Client_Contact__c){
                Account acc = new Account();
                acc.Id = opp.AccountId;
                acc.Client_Contact__c = opp.Oppo_Client_Contact__c;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }  */
    
  /*  //35.Once an Opportunity is delete or insert and update ,  Update Account Min And Max Date from the All Opportunities.

    public static void WhenoppMinandMaxchangedupdateAccMinMaxDate(List<Opportunity> oppList){
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = new List<Account>();
        for(Opportunity opp:oppList){
            accIds.add(opp.AccountId);
        }
      
        List<AggregateResult> minDate = [select MIN(Minimum_Date__c) oppmindate from Opportunity where AccountId IN:accIds];
        List<AggregateResult> maxDate = [select MAX(Maximum_Date__c) oppmaxdate from Opportunity where AccountId IN:accIds];
        
        for(Opportunity opp:oppList){
            if(opp.AccountId!=null){
            if(opp.Minimum_Date__c != null && opp.Maximum_Date__c != null){
                Account acc = new Account();
                acc.Id = opp.AccountId;
                acc.Minimum_Date__c = (Date)minDate[0].get('oppmindate');
                acc.Maximum_Date__c = (Date)maxDate[0].get('oppmaxdate');
                accList.add(acc);
            }
        }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    } */

    //32.Once an user is update an email should go to his Manager email Id,

/*    public static void sendEmailOfAccCon(List<User> userList,Map<Id,User> oldMapList){
        try{
            Set<Id> userIds = new Set<Id>();
            
            for(User usrRecord:userList){
                userIds.add(usrRecord.Id);
            }
            
            List<Account> accList = [select id,name,OwnerId,(select id,Lastname from Contacts) from Account where ownerId IN: userIds ];
            User usr = [select email,managerId from User where Id=:userIds];
            User managerEmail = [select email from User where id =: usr.ManagerId];

            List<Messaging.Email> emaimsgList = new List<Messaging.Email>();
            for(user usrRecord: userList){
                if(usrRecord.CompanyName != oldMapList.get(usrRecord.Id).CompanyName){
                    if(accList.size()>0){
                        Messaging.singleEmailMessage emailmsg = new Messaging.singleEmailMessage();
                        emailmsg.setSubject('User Company Name has been changed');
                        String emailBody = 'Hello Manager,<br/>';
                        emailBody += 'Accounts and Number of Related Contacts';
                        emailBody += 'Total Accounts::' + accList.size()+'<br/>';
                        for(Account acc:accList){
                            emailBody += '<br/>' + acc.Name + '==>' + acc.Contacts.size();
                        }
                        emailmsg.setHtmlBody(emailBody);
                        emailmsg.setToAddresses(new String[]{managerEmail.email});
                        emaimsgList.add(emailmsg);
                    }
                }
            }
            if(!emaimsgList.isEmpty()){
                Messaging.sendEmail(emaimsgList);
            }
        }
        catch(Exception e){
            system.debug('error::'+e.getMessage());
           
        }
    }  */
  
    //22.Once a Account update, all Opportunities line item list should be copy is account assets with the same products

  /*  public static void updateOLItoAsset(List<Account> accList){
        try{
            Set<Id> accIds = new Set<Id>();
            List<Asset> astList = new List<Asset>();
            for(Account acc:accList){
                accIds.add(acc.Id);
            }
            List<OpportunityLineItem> oliList = [select id,Product2Id,Product2.Name,Opportunity.AccountId from  OpportunityLineItem where  Opportunity.AccountId IN: accIds];
            for(Account acc:accList){
                for(OpportunityLineItem oliProducts: oliList){
                    if(oliProducts.Opportunity.AccountId == acc.Id){
                        Asset ast = new Asset();
                        ast.Name = oliProducts.Product2.Name + ' Asset';
                        ast.Product2Id = oliProducts.Product2Id;
                        ast.AccountId = acc.Id;
                        astList.add(ast);
                        system.debug('ast::'+ ast);
                    }
                }
            }   
        }   
        catch(Exception e){
            system.debug('error::'+e.getMessage());
            
        } 
    }*/
}