Public class soqlquery{
    
    
     public static void getForm(){

     List<job_form__c> REQUIRED = new List<job_form__c>();


	REQUIRED = [SELECT Preferred_Country__c,Gender__c,Languages_Known__c,Job_status__c
                FROM job_form__c WHERE Gender__c = 'Male'];
       
       system.debug(required);
         
         
 
     }
}