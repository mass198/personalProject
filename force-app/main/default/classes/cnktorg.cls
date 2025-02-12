Public class cnktorg {
    Public static void getrecords(){ 
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:cncktorg/services/apexrest/omgFirstns/Casestraining');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            /* Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
// Cast the values in the 'animals' key as a list
List<Object> Account = (List<Object>) results.get('Account');
System.debug('Received the following animals:');
for(Object Accounts: Account) {
system.debug(Account);

} */ System.debug(response.getBody());
            system.debug('strValue: ' + response.getBody().substring(1,0));
            List<wrapclass> accList =(List<wrapclass>) JSON.deserialize(response.getBody(), List<wrapclass>.class);
            System.debug('accList ------ '+accList);
           /* Map<String, String> results = (Map<String, String>) JSON.deserializeUntyped(accDetails);
            system.debug('results ---- '+results);
            Upsert accList; */
            
            
        }
        
        
        
    }
    
    
    Public static void insertrecords(){ 
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:cncktorg/services/apexrest/omgFirstns/Casestraining');
        request.setMethod('PATCH');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"Name":"Edge Communications"}');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) { 
            // Deserialize the JSON string into collections of primitive data types.
            /* Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
// Cast the values in the 'animals' key as a list
List<Object> animals = (List<Object>) results.get('animals');
System.debug('Received the following animals:');
for(Object animal: animals) { }*/
            System.debug(response.getBody());
        }}
    
    Public class wrapclass{
        Public string Name {get; set;}
    }
}