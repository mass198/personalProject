public class contactdatareturn {
    @AuraEnabled(cacheable=true)
    public static Contact getContactData(){
        return [select id, name, email from contact limit 1];
    }

@AuraEnabled(cacheable=true)
    public static list<Account> getAccountList(){
return [select id, name from Account where id != null Order By CreatedDate limit 5];}

@AuraEnabled(cacheable=true)
public static list<Account> getAccountusingNames(string searchKey){
string keys = '%' + searchKey + '%';
return [select id, name from Account where name like :keys limit 5];
}
}