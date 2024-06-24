public with sharing class myHandler implements Messaging.InboundEmailHandler {
	  public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
		  Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          EmailMessage ems = new EmailMessage(
          Subject = '0015g00001c1hHqAAI',
              TextBody = email.PlainTextBody,
              FromAddress = email.fromAddress,
              fromname = email.fromname
          );
          Insert ems;
          return result;
      }
  }