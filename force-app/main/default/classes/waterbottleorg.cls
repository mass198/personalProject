public with sharing class waterbottleorg {
    
    @AuraEnabled
    public static String getAccount(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint(RECEIPE_API+'/recipes/random?apiKey='+API_KEY);
		request.setEndpoint('callout:waterbottle/services/data/v60.0/sobjects/Account/0015h00001abKyFAAU');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug(response.getBody());
            return response.getBody();
            
        }
        return '';
    }

}