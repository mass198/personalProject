public class FlowLookupController {
    @AuraEnabled
    public static List<SObject> getLookupRecords(String obj, String returnField, String inputField, String inputValue, String extraconditions)
    {
        system.debug('extraconditions***'+extraConditions);
        List<SObject> resultSet;
        try{
         	String qry = 'select id, ' + returnField + ' from ' + obj + ' where ' + inputField + ' like \'' + inputValue + '%\' ' +  extraConditions  + ' limit 20';
           
            resultSet = Database.query(qry);
        }catch(Exception e){
            System.debug('*** Error: [' + e.getMessage() + e.getStackTraceString() + ']');
        }
        return resultSet;
    }
}