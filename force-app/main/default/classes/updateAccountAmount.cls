public with sharing class updateAccountAmount {
  public static void updateAccountAmountvalue(List<Account> Acclist) {
    set<Id> accid = new Set<id>();
    for (Account acc : Acclist) {
      acc.Total_Opportunity_Amount__c = 0;
      accid.add(acc.Id);
    }
      system.debug('accId---'+accId);

    Map<Id, Decimal> mapacc = new Map<Id, Decimal>();
    List<AggregateResult> acctResult = [
      SELECT AccountId, sum(Amount) TotalAmount
      FROM Opportunity
      WHERE AccountId = :accId
      GROUP BY AccountId
    ];
       system.debug('acctResult---'+acctResult);
    if (acctResult.size() > 0) {
        system.debug('size---'+acctResult.size() );
      for (AggregateResult a : acctResult) {
        Id accountId = (Id) a.get('AccountId');
        Decimal TotalAmount = (Decimal) a.get('TotalAmount');
        mapacc.put(accountId, TotalAmount);
      }
    }
    for (Account acclists : Acclist) {
      if (mapacc.containskey(acclists.Id)) {
        acclists.Total_Opportunity_Amount__c = mapacc.get(acclists.Id);
      }
    }
  }
}