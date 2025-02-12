public class Batchfalse implements Database.Batchable<sObject>, Database.Stateful{
public string query;
private List<String> failedopps = new List<String>();
    set<Id> oppIds;
       public Integer recordsProcessed = 0;
    
    Public Batchfalse(set<Id> oppIds){
        this.oppIds = oppIds;
    }

    public Database.QueryLocator start(Database.BatchableContext bc){
        string query = 'select id, name, description from Opportunity where id = :oppIds';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> scope){
        List<Opportunity> updatedList = new List<Opportunity>();
        for(Opportunity c : scope){
        c.description = 'update description from batch wuth stateful';
            updatedList.add(c);
             recordsProcessed = recordsProcessed + 1;
        }
      Database.SaveResult[] srList = Database.update(updatedList, false);
        System.debug('srList: '+srList);
        for(Database.SaveResult sr : srList) {
            System.debug('sr: '+sr);
            if(!sr.isSuccess()) {
                for(Database.Error err : sr.getErrors()) {
                    String errorMessage = 'Opp Id: ' + sr.getId() + ' - Error: ' + err.getMessage();
          
                    failedopps.add(errorMessage);
                }
            }
        }  

    }

public void finish(Database.BatchableContext bc){
 System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
sendErrorEmail(UserInfo.getUserEmail());
   }

 private void sendErrorEmail(String userEmail) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('ERRORS Batchfalse');
        if(failedopps.size() > 0) {
            email.setPlainTextBody(String.join(failedopps, '\n'));
        } else {
            email.setPlainTextBody('No errors in Batchfalse');
        }
        email.setToAddresses(new String[] { userEmail });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }

}