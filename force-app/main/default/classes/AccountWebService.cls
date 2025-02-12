public with sharing class AccountWebService {
 
    public static Http http = new Http();
    public static HTTPResponse response;
    public static HttpRequest request;
 
public class NewAccountRequestWrapper {
    public String name {get; set;}
    public String phone {get; set;}
}
 
//test querying an Account record
public static void getAccount(Id accId) {
    request = new HttpRequest();
    request.setMethod('GET');
 
request.setEndpoint('callout:cncktorg/services/apexrest/omgFirstns/Account' + accId);
    response = http.send(request);
    System.debug(response.getBody());
}}