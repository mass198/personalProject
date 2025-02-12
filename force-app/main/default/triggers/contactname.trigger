trigger contactname on Contact (before insert, before update) {
Contacthandler.checkname(Trigger.New);}