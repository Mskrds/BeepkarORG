public class EmailThreadingExample {

    // Method to send an email and optionally include a threadId for threading
    public static void sendEmail(String recipientEmail, String subject, String body, String threadId) {
        try {
          
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] { recipientEmail });
            email.setSubject(subject);
            email.setPlainTextBody(body);
            
          
            if (threadId != null) {
                System.debug('The threadId is: ' +threadId);
                Map<String, String> headers = new Map<String, String>();
                headers.put('In-Reply-To', threadId);
                //email.setHeaders(headers);
                 
            }
           
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });

            if (threadId == null) {
                saveEmailThread(subject);
            }

        } catch (Exception e) {
            System.debug('Error sending email: ' + e.getMessage());
        }
    }

   
    public static void saveEmailThread(String subject) {
        
        List<EmailMessage> sentEmails = [SELECT Id  FROM EmailMessage WHERE Subject = :subject ORDER BY CreatedDate DESC LIMIT 1
        ];
        if (!sentEmails.isEmpty()) {
            Email_Thread__c emailThread = new Email_Thread__c();
            emailThread.ThreadId__c = sentEmails[0].Id;
            emailThread.Subject__c = subject;
            insert emailThread;
            system.debug('emailThread'+emailThread);
        }
    }

    // Public method to send an email with threading support
    public static void sendEmailWithThreading(String recipientEmail, String subject, String body,string threadId ) {
 
        List<Email_Thread__c> emailThreads = [
            SELECT Id, ThreadId__c FROM Email_Thread__c WHERE ThreadId__c=: threadId LIMIT 1];
        if (!emailThreads.isEmpty()) {
            sendEmail(recipientEmail, subject, body, emailThreads[0].ThreadId__c);
        } else {
            sendEmail(recipientEmail, subject, body, null);
        }
    }
}