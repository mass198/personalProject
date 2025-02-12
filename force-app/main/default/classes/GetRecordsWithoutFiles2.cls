public class GetRecordsWithoutFiles2 {
    public static void getThoseRecords() {
        Set<Id> setAttachmentParentId = new Set<Id>();
        for (ContentDocumentLink a : [SELECT ContentDocument.LatestPublishedVersionId, LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId IN (SELECT Id FROM Account) AND LinkedEntity.Type = 'Account']) {
            setAttachmentParentId.add(a.ContentDocument.LatestPublishedVersionId);
        }
        Integer batchSize = 200;
        Integer offset = 0;
        List<Account> lstCC = new List<Account>();
        while (true) {
            List<Account> accounts = Database.query('SELECT Id FROM Account WHERE Id NOT IN :setAttachmentParentId LIMIT ' + batchSize + ' OFFSET ' + offset);
            lstCC.addAll(accounts);
            offset += batchSize;
            if (accounts.size() < batchSize) {
                break;
            }
        }
        System.debug('List of accounts without files: ' + lstCC);
    }
}