public class createTaskFromEmails implements Messaging.InboundEmailHandler{

    public Messaging.InboundEmailResult  handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env){
system.debug('Messaging.InboundEmail'+email);
system.debug('Messaging.InboundEnvelope'+env);


    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
system.debug('Messaging.InboundEmailResult'+result);

        string plainText;
        plainText= email.plainTextBody;

    Contact con = [select id, name from Contact where email = :email.fromAddress Limit 1];
system.debug('conId'+con.Id);

        Task[] t = new Task[0];
        t.add(new Task(Description =  plainText,
           Priority = 'Normal',
           Status = 'Inbound Email',
           Subject = email.subject,
           IsReminderSet = true,
           ReminderDateTime = System.now()+1,
           WhoId =  Con.Id));
insert t;

result.success= true;
    return result;}
}