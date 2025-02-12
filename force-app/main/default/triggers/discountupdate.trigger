trigger discountupdate on Pen__c (before insert, before update) {
PenClassOffer.ApplyDiscountPen(Trigger.New);
}