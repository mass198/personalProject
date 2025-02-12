@isTest

public class updateAccountAmountTest {
    
   
    
    @testSetup  static void testdatacreate(){
       
         
        Account a = new Account();
        a.name = 'test1';
        insert a;
        
        Account ab = new Account();
        ab.name = 'test2';
        insert ab;
        
      Opportunity opp = new Opportunity(Name = 'Test Opp', StageName = 'Closed Won', CloseDate= Date.newInstance(2022, 12, 22),  Amount = 1000, AccountId = a.Id);
        insert opp;
        
        Opportunity opp1 = new Opportunity(Name = 'Test Opp', StageName = 'Closed Won', CloseDate =Date.newInstance(2022, 12, 22),  Amount = 2000, AccountId = ab.Id);
        insert opp1;
    }

    @isTest static void callMethod(){
         List<Account> Acclist1 = [select id, name from Account];
        Test.startTest();
        updateAccountAmount.updateAccountAmountvalue(Acclist1);
         Test.stopTest();
    }

}