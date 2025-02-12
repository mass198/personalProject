public with sharing class SlackNotificationWrapper {
    
    @AuraEnabled
    public String notificationMessage;
    @AuraEnabled
    public Id approvalId;
    @AuraEnabled
    public String approverSlackId;
    @AuraEnabled
    public String slackMessageTimestamp;
    @AuraEnabled
    public List<Opportunity> oppo;
   
    
   
    public SlackNotificationWrapper(String message, String slackId, Id approvalId, String timestamp, List<Opportunity> oppoapro){
        this.notificationMessage = message;
        this.approverSlackId = slackId;
        this.approvalId = approvalId;
        this.slackMessageTimestamp = timestamp;
        this.oppo = oppoapro; 
         system.debug('oppolist---'+oppo);
         system.debug('oppoaprolist---'+oppoapro);
    }

    public SlackNotificationWrapper(String message, String slackId, Id approvalId){
        this.notificationMessage = message;
        this.approverSlackId = slackId;
        this.approvalId = approvalId;
    }

    public SlackNotificationWrapper(){}
    
     public Id getApprovalId() {
        return this.approvalId;
    }

/*
    @AuraEnabled
    public String notificationMessage;
    @AuraEnabled
    public Id approvalId;
    @AuraEnabled
    public String approverSlackId;
    @AuraEnabled
    public String slackMessageTimestamp;
    @AuraEnabled
    public List<Opportunity> oppo;
   
    
   
    public SlackNotificationWrapper(String message, String slackId, Id approvalId, String timestamp, List<Opportunity> oppoapro){
        this.notificationMessage = message;
        this.approverSlackId = slackId;
        this.approvalId = approvalId;
        this.slackMessageTimestamp = timestamp;
        this.oppo = oppoapro; 
         system.debug('oppolist---'+oppo);
         system.debug('oppoaprolist---'+oppoapro);
    }

    public SlackNotificationWrapper(String message, String slackId, Id approvalId){
        this.notificationMessage = message;
        this.approverSlackId = slackId;
        this.approvalId = approvalId;
    }

    public SlackNotificationWrapper(){}

*/
}