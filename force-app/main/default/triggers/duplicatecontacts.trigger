trigger duplicatecontacts on Contact(before insert, before update) {
  DuplicateContacts.DuplicateContactCheck(Trigger.new);
}