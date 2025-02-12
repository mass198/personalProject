public with sharing class updateSerialNo {
  public static void updateSerialNoofOli(List<OpportunityLineItem> lineItems) {
    Integer counterInitial = 0;
    List<OpportunityLineItem> recentItem = [
      SELECT id, Serial_No__c, OpportunityId, lastModifiedDate
      FROM OpportunityLineItem
      WHERE OpportunityId = :lineItems.get(0).OpportunityId
      ORDER BY lastModifiedDate DESC
      LIMIT 1
    ];
    if (recentItem.size() > 0 && recentItem.get(0).Serial_No__c != null) {
      counterInitial = Integer.valueof(recentItem.get(0).Serial_No__c);
    }
    for (OpportunityLineItem item : lineItems) {
      item.Serial_No__c = String.valueOf(++counterInitial);
    }
  }
}