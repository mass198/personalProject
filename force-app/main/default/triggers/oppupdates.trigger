trigger oppupdates on Opportunity (before update) {
oppupdateclass.updateopps(Trigger.New);

}