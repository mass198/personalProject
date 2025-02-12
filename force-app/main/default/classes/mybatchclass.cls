public class mybatchclass implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful{
    public Integer numrecordsprocessed;
    public List<string> failedMessages = new List<string>(); 
    public Database.QueryLocator start(Database.BatchableContext bc){
string query = 'select id, name, type from Account where id != null';
        return database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> conlist = new List<Account>();
        for(Account a : scope){
if(a.description != null){
    a.description = 'the email is available, please go ahead and send an email';
    numrecordsprocessed++;
    conlist.add(a);
}
Database.SaveResult[] srlist = Database.update(conlist, false);
 for(Database.SaveResult sr : srlist){
        if(!sr.isSuccess()){
            for(Database.Error  err : sr.getErrors()){
                string errormsg = sr.getId() + err.getMessage();
                failedMessages.add(errormsg);
            }
        }
       }
        
        }
    }
public void finish(Database.BatchableContext bc){
    AsyncApexJob aaj = [select id from AsyncApexJob where id =:bc.getJobId()];
}

}