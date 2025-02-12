@RestResource(urlMapping='/Casestraining1/*')
global class WebServiceClass {
    @HttpGet
    global static String getCaseById() {
        /*RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case result =  [SELECT CaseNumber,Subject,Status,Origin,Priority
                        FROM Case
                        WHERE Id = :caseId];
        return result;*/
        List<Contact> accList = New List<Contact> ();
        accList = [Select Name From Contact Limit 10];
        return JSON.serialize(accList);
    }
    @HttpPost
    global static string echoMyType(string ic) {
        system.debug('ic');
        return ic;
    }
    @HttpPatch
    global static string accountUpdate(string accDetails) {
        system.debug('accDetails ---- '+accDetails);
        List<Account> accList = (List<Account>)JSON.deserialize(accDetails, List<Account>.class);
        System.debug('accList ------ '+accList);
       //Map<String, String> results = (Map<String, String>) JSON.deserializeUntyped(accDetails);
        //system.debug('results ---- '+results);
        return accDetails;
    }
}