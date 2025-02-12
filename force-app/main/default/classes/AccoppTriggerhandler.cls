public class AccoppTriggerhandler {
    public static void updateopprec(List<Account> Accts) {
        set<Id> AccIds = new set<Id>();
        for(Account a: Accts){
            AccIds.add(a.Id);
        }
        Datetime day30 =system.now()-30;
        List<Opportunity> opplisttobeupdated = new List<Opportunity>();
        List<Opportunity> opplist = [select id, AccountId, CreatedDate, StageName, CloseDate From Opportunity where AccountId = :AccIds];

        if(opplist.size()>0){
            for(Opportunity opp : opplist){
                if(opp.CreatedDate < day30 && opp.StageName != 'Closed Won'){
                    opp.stageName = 'closed lost';
                    opp.CloseDate = system.today();
                    opplisttobeupdated.add(opp);
                }
            }
        }
        if(opplisttobeupdated.size() > 0){
            update opplisttobeupdated;
        }
    }
}