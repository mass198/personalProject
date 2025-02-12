/* public class batchApexForRecordsWithoutFiles implements Database.Batchable<sObject> {
    
    public Set<Id> setAttachmentParentId;
    
    public batchApexForRecordsWithoutFiles() {
        setAttachmentParentId = new Set<Id>();
        for (ContentDocumentLink a : [SELECT ContentDocument.LatestPublishedVersionId, LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId IN (SELECT Id FROM Account) AND LinkedEntity.Type = 'Account']) {
            setAttachmentParentId.add(a.ContentDocument.LatestPublishedVersionId);
        }
    }
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id FROM Account WHERE Id NOT IN :setAttachmentParentId');
    }
    
    public void execute(Database.BatchableContext context, List<Account> scope) {
        // Perform processing on the current batch of records
        for (Account account : scope) {
            // Do something with the account record
        }
    }
    
    public void finish(Database.BatchableContext context) {
        System.debug('Batch job completed successfully');
    }
}

*/

public class AccountWithoutFilesBatch implements Database.Batchable<SObject>, Database.Stateful {
    
    private Integer processedRecords = 0;
    private Set<Id> setAttachmentParentId = new Set<Id>();
    private List<Account> accountsWithoutFiles = new List<Account>();
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator([
            SELECT ContentDocumentId, LinkedEntityId
            FROM ContentDocumentLink
            WHERE LinkedEntityId IN (SELECT Id FROM Account) AND LinkedEntity.Type = 'Account'
        ]);
    }
    
    public void execute(Database.BatchableContext context, List<SObject> scope) {
        for (SObject s : scope) {
            ContentDocumentLink a = (ContentDocumentLink) s;
            setAttachmentParentId.add(a.LinkedEntityId);
        }
        
        List<Account> lstCC = [SELECT Id FROM Account WHERE Id NOT IN :setAttachmentParentId];
        
        accountsWithoutFiles.addAll(lstCC);
        
        processedRecords += scope.size();
    }
    
    public void finish(Database.BatchableContext context) {
        System.debug('Total processed records: ' + processedRecords);
        System.debug('Number of Accounts without files: ' + accountsWithoutFiles.size());
        
        // Do something with the accountsWithoutFiles list here
    }
    
}