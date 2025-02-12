@isTest(SeeAllData=true)

class ElectronicsDiscountOfferTest{

@isTest

static void TestFunction1(){
Electronic_product__c VarE = NEW Electronic_product__c();
VarE.Name = 'sully';
VarE.Price__c = 2000;
VarE.Type__c = 'Mobile';
VarE.Contact__c = '0035j00000r6op0AAA';

Insert VarE;

Electronic_product__c VarE2 = New Electronic_product__c();
        VarE2 = [SELECT Price__c FROM Electronic_product__c WHERE Id =: VarE.Id];
        
        System.assertEquals(1000, VarE2.Price__c);
        }
        
        @istest
        
        static void TestFunction2(){
Electronic_product__c VarE = NEW Electronic_product__c();
VarE.Name = 'bully';
VarE.Price__c = 3000;
VarE.Type__c = 'LED';
VarE.Contact__c = '0035j00000r6op0AAA';
Insert VarE; 

Electronic_product__c VarE2 = New Electronic_product__c();
        VarE2 = [SELECT Price__c FROM Electronic_product__c WHERE Id =: VarE.Id];
        
        System.assertEquals(2400, VarE2.Price__c);
        
        }
        @istest(SeeALLData=true)
        
        static void TestFunction3(){
Electronic_product__c VarE = NEW Electronic_product__c();
VarE.Name = 'Lully';
VarE.Price__c =2500;
VarE.Type__c = 'AC';
VarE.Contact__c = '0035j00000r6op0AAA';

Insert VarE;

Electronic_product__c VarE2 = New Electronic_product__c();
        VarE2 = [SELECT Price__c FROM Electronic_product__c WHERE Id =: VarE.Id];
        
        System.assertEquals(1750, VarE2.Price__c);
        }
        }