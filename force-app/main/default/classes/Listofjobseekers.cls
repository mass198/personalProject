public class Listofjobseekers{
    public List<job_form__c> getJobFormC(){
        List<job_form__c> s = new List<job_form__c>(); 
        s = [SELECT First_Name__c,Gender__c,Experience__c
        FROM job_form__c where Experience__c<>null];
       return s;
    }
    public List<job_form__c> getByExperience(Integer exp){
        List<job_form__c> s = new List<job_form__c>(); 
        s = [SELECT First_Name__c,Gender__c,Experience__c
        FROM job_form__c where Experience__c = :exp];
       	return s;
    }
    public List<job_form__c> getByGender(String gen){
        List<job_form__c> s = new List<job_form__c>(); 
        s = [SELECT First_Name__c,Gender__c,Experience__c
        FROM job_form__c where Gender__c = :gen];
       	return s;
    }
}