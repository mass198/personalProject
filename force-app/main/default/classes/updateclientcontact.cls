public with sharing class updateclientcontact {
  public static void updateclientcontactname(List<Account> acct) {
    List<Account> updatelist = new List<Account>();
    List<Contact> con = new List<Contact>();
    set<Id> AccId = new Set<Id>();
    Map<Id, Account> mapacc = new Map<Id, Account>();

    for (Account acc : acct) {
      Contact cobj = new Contact();
      cobj.LastName = acc.Name;
      cobj.AccountId = acc.Id;
      con.add(cobj);
      AccId.add(acc.Id);
    }
    if (con.size() > 0) {
      insert con;
    }
    List<Account> acclist = [
      SELECT id, Client_Contact__c
      FROM Account
      WHERE id = :AccId
    ];

    for (Account aObj : acclist) {
      mapacc.put(aObj.Id, aObj);
    }
    if (con.size() > 0) {
      for (Contact cObj : con) {
        if (mapacc.containskey(cObj.AccountId)) {
          Account checka = mapacc.get(cObj.AccountId);
          checka.Client_Contact__c = cObj.Id;
          updatelist.add(checka);
        }
        if (updatelist.size() > 0) {
          update updatelist;
        }
      }
    }
  }
}