Public Class ElectronicsDiscountOffer{

Public Static Void DiscountOffer(list<Electronic_product__c> VarElectronicsListNew){

for(Electronic_product__c VarE : VarElectronicsListNew){

If(VarE.Type__c == 'Mobile'){
VarE.Price__c =VarE.Price__c - (VarE.Price__c * 0.5);}

ELSE If(VarE.Type__c == 'LED'){
VarE.Price__c =VarE.Price__c - (VarE.Price__c * 0.2);}

Else If(VarE.Type__c == 'AC'){
VarE.Price__c =VarE.Price__c - (VarE.Price__c * 0.3);}

}
}
}