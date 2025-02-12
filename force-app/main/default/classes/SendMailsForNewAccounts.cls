public class SendMailsForNewAccounts {
    public static void SendEmails(List<Account> Acclists) {
        List<Messaging.SingleEmailMessage> sendmails = new List<Messaging.SingleEmailMessage>();
        User getusermail = [select id, email from user where Username = 'nawin@sf.com'];
        for(Account accObj : Acclists){
            if(getusermail.Email != null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSenderDisplayname('salesforce');
                mail.setUseSignature(false);
                mail.setBccSender(false);
                mail.setSaveAsActivity(false);
                mail.toAddresses = new String[]{getusermail.Email};
                mail.setSubject('New Account was Created.');
                mail.setHtmlBody('An Account has been created for <b>'+accobj.Name+'</b>');
                sendmails.add(mail);
            }
        }
        if(sendmails.size() > 0){
            Messaging.SendEmail(sendmails);
        }
    }
}