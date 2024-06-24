public class ConvertingFlowstoTriggerhandlerclass {
    
   /* //Sheet1:1.Whenever Contact's email is changed, account should be updated with same email.
    //
    Public Static void PopulateEmailonAcc(list<contact>conlist,Map<id,contact>oldmap){
        list<account>acclist = new list<account>();
        
        for(contact con:conlist){
            if(con.email != oldmap.get(con.id).email){
                Account acc = new account();
                Acc.id = con.accountid;
                Acc.Con_Email__c = con.email;
                acclist.add(acc);
            }
        }
        Update acclist;
        
    }
    
    //Sheet1:2.Whenever Account is created, create a contact under that Account
    
    Public Static void SendEmailToConEmail(list<account>acclist){
        list<contact>conlist=new list<contact>();
        For(Account Acc:acclist){
            Contact con = new contact();
            con.LastName=Acc.name;
            con.AccountId=acc.Id;
            conlist.add(con);
        }
        insert conlist;
    }
    //Sheet1:3.Whenever Contact is created, check if it's email is null or not. If email is not NULL, send an email to that email id.
    public static void SendEmailToConEmail(List<Contact> conList){
        List<Messaging.SingleEmailMessage> mails =new List<Messaging.SingleEmailMessage>();
   //https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_email_outbound_single.htm#apex_Messaging_SingleEmailMessage_constructors
        For(contact con:conlist){
            if(con.email!=null){   
                List<Contact> con1 = [Select id,lastname,email from Contact where Id =: con.Id]; //to get the curent con Id and fields
                //Contact con = new contact
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                List<String> allemails = new List<String>(); // to store multiple emails
                allemails.add(con.email);
                mail.setToAddresses(allemails);
                mail.setSenderDisplayName('saikumar Email');
                mail.setSubject('New Contact Created');
                mail.setHtmlBody('Hello a new contact is createdS:'+ con.lastname);
                
                mails.add(mail);
                Messaging.sendEmail(mails); // method
            }     
        }   
    }
 //Sheet1:5.Create a datetime field on Lead called Followup Date-Time. Whenever Followup is changing, create a Task for Lead Owner.
    
     public static void whenleadCrtedCretetask(List<Lead>leadlist,map<id,lead>oldmap){
         List<task>tasklist = new list<task>();
         For(Lead fieldupdate : Leadlist){
             if(fieldupdate.Fallowup_Date_Time__c!=oldmap.get(fieldupdate.id).Fallowup_Date_Time__c){
             Task newtask = new task();
             newtask.OwnerId = fieldupdate.OwnerId;
             newtask.Subject = 'New Task Created for lead Fallowup date changed';   
             tasklist.add(newtask);
         }
         }
    insert tasklist;
    
     }
    //Before deleting the account, it's shipping type should be populated on it's related Alternate contacts
    
      //before delete // Account obj //Populate field @ Another Altr con Obj
     public static void PopulateAlterconBeforeaccDeleted (List<account>Acclist,map<id,lead>oldmap){
    
    
    
    
 
} */
    
    
    
    
}