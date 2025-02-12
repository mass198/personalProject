/**
 * @description       : 
 * @author            : NAVEEN V
 * @group             : 
 * @last modified on  : 27-08-2022
 * @last modified by  : NAVEEN V
 * Modifications Log
 * Ver   Date         Author     Modification
 * 1.0   27-08-2022   NAVEEN V   Initial Version
**/
public with sharing class whatsappController {

    @AuraEnabled
    public static string sendMessage(String message, string phoneNumber,string accessKey, string samplePhone){
        string result= '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response= new HttpResponse();

        request.setEndpoint('https://graph.facebook.com/v17.0/'+samplePhone+ '/messages');
        request.setHeader('Content-Type', 'application/json');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer '+ accessKey);
        string body='{"messaging_product":"whatsapp","to":"'+phoneNumber+'","type":"template","template":{"name":"hello_world","language":{"code":"en_US"}}}';
        request.setBody(body);
        response=http.send(request);

        if(response.getStatusCode() ==200){
            result='Success';
        }
        else{
            result = 'Failed';
        }
        return result;
    }
}