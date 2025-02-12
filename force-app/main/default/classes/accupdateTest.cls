@isTest

public class accupdateTest {
    
    @testSetup static void datacreate(){
        Account accc = new Account();
        accc.Name = 'Test Account';
        accc.ShippingCity = 'Hyderabad';
        accc.ShippingCountry = 'India';
        accc.ShippingPostalCode = '500084';
        
        
        insert accc;
        
        Account acccc = new Account();
        acccc.Name = 'Test Account2';
        acccc.ShippingPostalCode = '500084t';
        insert acccc;
    }
    @isTest static void testupdatetheaddress(){
        List<Account> AccList = [select id, name, ShippingCity, ShippingCountry, ShippingPostalcode from Account where name = 'Test Account'];
        Test.startTest();
       accupdate.updatetheaddress(AccList); 
        Test.stopTest();
        
        for(Account Acc : AccList){
            system.assertEquals(Acc.ShippingCity,  Acc.BillingCity);
        system.assertEquals(Acc.ShippingCountry, Acc.BillingCountry);
        system.assertEquals(Acc.ShippingPostalCode, Acc.BillingPostalCode );
        }
    } 
        
    @isTest static void catchExceptionmethod(){
        List<Account> AccList = [select id, name, ShippingCity, ShippingCountry, ShippingPostalcode, BillingCity, BillingCountry, BillingPostalcode from Account where name = 'Test Account2'];
        Test.startTest();
       accupdate.updatetheaddress(AccList); 
        Test.stopTest();
        
         
    }
    
}