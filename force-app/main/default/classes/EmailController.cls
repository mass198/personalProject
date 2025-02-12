public class EmailController {
    
    @InvocableMethod
    public static void sendWelcomeEmail(list<EmailWrapper> lstEmailWrapper){
		Messaging.SingleEmailMessage objEmail = new Messaging.SingleEmailMessage();
        
        // Set the Email of the Recipient.
        objEmail.setToAddresses(new list<String>{lstEmailWrapper[0].strRecipientEmail});
		
        // Set the Template Id
        objEmail.setTemplateId([SELECT Name FROM EmailTemplate WHERE Name = :lstEmailWrapper[0].strEmailTemplate LIMIT 1].Id);
        
        // To set the context and ensures that merge fields in the template contain the correct data.
        objEmail.setTargetObjectId(lstEmailWrapper[0].strRecipientId);
        objEmail.setTreatTargetObjectAsRecipient(false);
        
        Messaging.SendEmailResult[] emailResult = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {objEmail});
        if(!emailResult[0].isSuccess()){
            System.debug('Error :' +emailResult[0].getErrors());
        } else{
            System.debug('Success');
        } 
    }
}