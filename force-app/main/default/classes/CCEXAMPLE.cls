public with sharing class CCEXAMPLE {
    
    public string UserName {set;get;}
    public string Message {set;get;}
    
    public void ShowMessage(){
        
        Message = 'welcome  ' + UserName;
    }

}