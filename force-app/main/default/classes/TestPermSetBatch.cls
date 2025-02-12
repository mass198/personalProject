public class TestPermSetBatch implements Database.Batchable<SObject>, Database.Stateful, Database.AllowsCallouts  {
    
    public TestPermSetBatch() {
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM PermissionSet LIMIT 1');
    }

    public void execute(Database.BatchableContext bc, List<PermissionSet> permissionSets) {

    }

    public void finish(Database.BatchableContext bc) {

    }

}