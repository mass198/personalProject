@isTest(SeeAllData = true) public class soqlQueryTest {
    
    @isTest static void testgetForm(){
        Test.StartTest();
        soqlquery.getForm();
         Test.StopTest();
     List<job_form__c>  REQUIRED = [SELECT Preferred_Country__c,Gender__c,Languages_Known__c,Job_status__c
                FROM job_form__c WHERE Gender__c = 'Male'];
         system.assertEquals(22, REQUIRED.size());
    }
   

}