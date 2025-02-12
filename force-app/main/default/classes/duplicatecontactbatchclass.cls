public class duplicatecontactbatchclass implements Database.Batchable<sObject>{
  
    public Database.querylocator start(Database.BatchableContext bc){
string query = 'select id, email, name from contact';
return Database.getQueryLocator(query);

}
    public void execute(Database.BatchableContext bc, List<contact> scope){

        for(Contact c : scope){
c.description = 'updated by my batchg';
        }
    }
    public void finish(Database.batchableContext bc){}

}