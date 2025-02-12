@IsTest

private class jsontestTest {
		@IsTest
    static void testcodecoverage(){
        jsontest jsonobj = new jsontest();
        jsonobj.name = 'salesforce';
        jsonobj.place = 'hyderabad';
        jsonobj.Accounts = new List<Account>();
     //   jsontest.Accounts Account = new jsontest.Accounts();
        
        system.assertEquals('salesforce',jsonobj.name);
        system.assertEquals('hyderabad',jsonobj.place);
        
}}