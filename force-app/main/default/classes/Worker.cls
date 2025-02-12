global class Worker implements Database.Batchable<sObject>{
    // List<Workers__c> workers = new List<Workers__c>();
    global Database.QueryLocator start(Database.BatchableContext BC){
       return Database.getQueryLocator([SELECT Id,New_Salary__c, Current_Salary__c,Worker_Id__c FROM Salary_Changes__c WHERE Term_Date__c = LAST_N_DAYS:3]);
    }
    global void execute(Database.BatchableContext BC, List<Salary_Changes__c> scope){
     
        
        for(Salary_Changes__c salary : scope ){
            Workers__c worker = [SELECT Id, Current_Salary__c,Workers_Id__c,CreatedBy.Email From Workers__c Where id = :Salary.Worker_Id__c];
            worker.Current_Salary__c = salary.New_Salary__c;
           // workers.add(worker);
            update worker;
        } 
    }
    
	global void finish(Database.BatchableContext BC){
       // for(Workers__c worker: workers){
           
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           // system.debug('worker.CreatedBy.Email');
            mail.setToAddresses(new String[] { 'vattimallanaveen198@gmail.com' });
       // mail.setReplyTo('manager@gmail.com');
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('regarding salary changes');
        mail.setPlainTextBody('the salary changes have been done till yesterday');
    	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    

}