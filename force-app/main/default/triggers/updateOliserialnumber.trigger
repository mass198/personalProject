trigger updateOliserialnumber on OpportunityLineItem(before insert) {
  updateSerialNo.updateSerialNoofOli(Trigger.New);
}