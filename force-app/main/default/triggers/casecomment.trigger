trigger casecomment on CaseComment (before insert, after insert) {
system.debug('tested');
}