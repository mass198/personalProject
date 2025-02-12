public class updatecontactbatchclass implements Database.Batchable<sObject>, Database.Stateful{
     public Integer numofrecordsprocessed = 0;
    string email = 'vattimallanaveen198@gmail.com';
    public Database.QueryLocator start(Database.BatchableContext bc){
       
        return Database.getQueryLocator([SELECT id, name, Description from Contact]);
    }
    
    Public void execute(Database.BatchableContext bc, List<Contact> scope){
        List<Contact> ctc = new List<contact>();
        for(Contact ct: scope){
            if(ct.description == null){
                ct.description = 'Updated by updatecontactbatchclass';
            }
            update ct;
            numofrecordsprocessed = numofrecordsprocessed + 1;
            
        }
        
        
        
    }
    
    public void finish(Database.BatchableContext bc){
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

mail.setToAddresses(new String[] {email});
mail.setReplyTo('vattimallanaveen198@gmail.com');
mail.setSenderDisplayName('Batch Processing');
mail.setSubject('Batch Process Completed');
mail.setPlainTextBody('Batch Process has completed' + numofrecordsprocessed);

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }

}