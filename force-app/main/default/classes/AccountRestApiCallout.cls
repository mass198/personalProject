@RestResource(urlMapping='/restapicallout')
global class AccountRestApiCallout {
    
    private static final Integer MAX_API_CALLS = 5000;
    
    @future(callout=true)
    global static void makeApiCallout(){
   //     for(Integer i=0;i<MAX_API_CALLS;i++){
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://sf200-dev-ed.my.salesforce.com/services/data/v53.0/sobjects/Account/0015j00000zfYWR');
            req.setMethod('GET');
            Http http = new Http();
            HttpResponse res = http.send(req);
            System.debug(res.getBody());
     //   }
    }
}