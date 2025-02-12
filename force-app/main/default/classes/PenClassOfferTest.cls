@isTest

class PenClassOfferTest {

    @testSetup static void datacreate(){

Pen__c VarP = new Pen__c();
        VarP.Name = 'VarP2';
        VarP.Price__c = 180;  
        insert VarP; }
        
  
@isTest
    Static Void TestFunction() {
        
        
        //Pen__c VarP2 = New Pen__c();
        
        //VarP2 = [SELECT Price__c FROM Pen__c WHERE Id =: VarP.Id];
       Pen__c pen = [SELECT Price__c FROM Pen__c WHERE name ='VarP2' LIMIT 1];
      
       
      
        System.assertEquals(160, pen.Price__c);
        
        
    }


}