public class contacthandler{

public static void checkname(List<Contact> conlist){
set<Id> acID = new set<Id>();
set<string> names = new set<string>();
for(Contact c : conlist){

acID.add(c.AccountId);
names.add(c.LastName);

}

system.debug('name'+names);
system.debug('id'+acID);
List<Contact> conslists = [select id, name from Contact where AccountId = :acID and Lastname = :names];

if(conslists.size() > 0){
for(Contact cs : conlist){
cs.addError('There is already a contact associated with the Account with same name');
}}


}}