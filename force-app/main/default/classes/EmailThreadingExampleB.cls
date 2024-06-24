public class EmailThreadingExampleB {

    // Method to send an email and optionally include a threadId for threading
    public static void sendEmail(String recipientEmail, String subject, String body, String threadId) {
        try {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] { recipientEmail });
            email.setSubject(subject);
            email.setPlainTextBody(body);
            
            if (threadId != null) {
                System.debug('The threadId is: ' + threadId);
               
                email.setPlainTextBody(body + '\n\n[Thread ID: ' + threadId + ']');
            }

            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });

            if (threadId == null) {
                saveEmailThread(recipientEmail, subject);
            }

        } catch (Exception e) {
            System.debug('Error sending email: ' + e.getMessage());
        }
    }

    // Method to handle saving the MessageId for threading
    public static void saveEmailThread(String recipientEmail, String subject) {
        // Query the latest sent email by recipient email and subject
        List<EmailMessage> sentEmails = [SELECT Id FROM EmailMessage 
            WHERE ToAddress = :recipientEmail 
            AND Subject = :subject 
            ORDER BY CreatedDate DESC LIMIT 1
        ];
        if (!sentEmails.isEmpty()) {
            Email_Thread__c emailThread = new Email_Thread__c();
            emailThread.ThreadId__c = sentEmails[0].Id;
            emailThread.Email__c = recipientEmail;
            emailThread.Subject__c = subject;
            insert emailThread;
            System.debug('emailThread: ' + emailThread);
        }
    }

    // Public method to send an email with threading support
    public static void sendEmailWithThreading(String recipientEmail, String subject, String body) {
      
            List<Email_Thread__c> emailThreads = [
                SELECT Id, ThreadId__c 
                FROM Email_Thread__c 
                WHERE Email__c = :recipientEmail 
                ORDER BY CreatedDate DESC LIMIT 1
            ];
            if (!emailThreads.isEmpty()) {
                sendEmail(recipientEmail, subject, body, emailThreads[0].ThreadId__c);
            } else {
                sendEmail(recipientEmail, subject, body, null);
            }
        }
    }