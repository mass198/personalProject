trigger updateAccountContactName on Account(after insert) {
  updateclientcontact.updateclientcontactname(Trigger.New);

}