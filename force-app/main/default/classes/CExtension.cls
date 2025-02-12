public class CExtension {
    
    public string message{get;set;}
    public string VarforstoringAccountname {get;set;}
    
    //this line is mandatory for extension code
     public CExtension(ApexPages.StandardController stdcontroller){
        
    }
       

    public void showGreeting() {
        message = 'welcome to the demo of extension';
        
    }
    
    public void mysave(){
        
        Account VarNewAccount = New Account();
        VarNewAccount.Name = VarforstoringAccountname;
        VarNewAccount.industry = 'chemical';
        
        
        insert VarNewAccount;
    }

}