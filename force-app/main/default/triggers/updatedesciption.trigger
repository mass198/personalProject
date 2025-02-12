trigger updatedesciption on Contact (after update) {
  List<Account> acclist = new List<Account>();
    Map<Id, String> getdescriptionMap = new Map<Id, String>();
    set<Id> acId = new set<Id>();
    for(Contact con : Trigger.New){
        if(con.description != Trigger.OldMap.get(con.Id).description){
            acid.add(con.AccountId);
            getdescriptionMap.Put(con.AccountId,con.Description);
        }
    }
			List<Account> accounts = [select id, name, description from Account where id = :getdescriptionMap.Keyset()];
    
    for(Account acc : accounts){
        if(getdescriptionMap.containskey(acc.Id)){
        acc.description = getdescriptionMap.get(acc.id);
            acclist.add(acc);
            }}
    update acclist;
}