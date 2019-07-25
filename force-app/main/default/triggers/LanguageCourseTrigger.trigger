trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {

    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
    message.toAddresses = new String[] { 'mcdiasnuno@gmail.com' };
    message.optOutPolicy = 'FILTER';
    message.subject = 'Language Course Updated';
    message.plainTextBody = 'Just to let you know that one language course was created or edited';
    Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

    if (results[0].success) {
    System.debug('The email was sent successfully.');
    } else {
    System.debug('The email failed to send: ' + results[0].errors[0].message);
    }

}