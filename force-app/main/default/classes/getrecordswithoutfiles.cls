public class getrecordswithoutfiles {
    
    public static void getthoserecords(){
    Set<Id> setAttachmentParentId = new Set<Id>();
for(ContentDocumentLink a : [SELECT ContentDocumentId, LinkedEntityId FROM ContentDocumentLink where LinkedEntityId in ( SELECT Id FROM Account) and LinkedEntity.Type='Account']){
    setAttachmentParentId.add(a.LinkedEntityId);
}
List<Account> lstCC = [SELECT ID FROM Account WHERE  ID NOT IN : setAttachmentParentId];

system.debug('list of accounts without files ' + lstCC);
    }
}