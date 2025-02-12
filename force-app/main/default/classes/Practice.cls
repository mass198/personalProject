public class Practice {
    
    Public static void listofAccounts(){
        List<Account> Alist = new List<Account>();
        Alist = ([Select Name,Id from Account]);
        system.debug(Alist);
        }
    
    Public static void UpdateAccount(){
        List<Account> A2list = new List<Account>([Select Name,Id,Rating from Account Where Id = '0015j000009gXXMAA2']);
            for(Account acc : A2list){
                acc.Rating = 'Hot';
    }
        Update A2list;
    }  
    
    Public Void CreateAccount(string Name){
        Account acc = new Account();
            acc.Name = 'Apex Test33';
       
        	INSERT acc;
    }
    
    Public void fetchAccount(String P){
        set<string> s1 = new set<string>();
     List<Account> Acc = ([SELECT Name,Id,Phone from Account Where Phone = :P]);
             for(Account A: Acc){
               string s =A.Name;
                 
                     s1.add(s);}
        
        system.debug(s1);
                 	                           
}
    
    Public static void CreateAOC(string n){
        Account a = new Account();
        a.Name = 'Linked Account';
        insert a;
        system.debug(a);
        
        Contact c = new contact();
        c.LastName= 'Linked contact';
        c.AccountId= a.Id;
        insert c;
        system.debug(c);
        
        Opportunity o = new Opportunity();
        o.Name = 'Linked Opp';
        o.AccountId= a.Id;
        o.StageName='Qualification'; 
        Date d = Date.newinstance(2022,08,28);
        o.CloseDate=d;

        insert o;
        system.Debug(o);
    }
    
    
    
    
}