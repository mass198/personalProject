trigger ElectronicsDiscountTrigger on Electronic_product__c (before insert) {
ElectronicsDiscountOffer.DiscountOffer(trigger.new);
}