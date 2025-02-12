trigger sendemailsfornewaccountrec on Account (before insert) {
 //   SendMailsForNewAccounts.SendEmails(Trigger.New);
 set<Id> setId = new set<Id>();
 List<Account> acclist = Trigger.new;
    for(Account acc : acclist){
     Id seid = acc.Id;
        setId.add(seid);
        
    }
    list<Account> newa = [select id from account where id in :setid];
    
    system.debug('newa---'+ newa);
    
    for (Account leadRec : Trigger.new) {
        if(leadRec.Name=='error'){
       leadRec.Name.addError('Contact named  exist with same license number or email or phone number');    

        } 
       
                
                    
                   
                 
                    
                  
              }
    

}