trigger updateTotalOPPAmount on Account(before update) {
  updateAccountAmount.updateAccountAmountvalue(Trigger.new);

}