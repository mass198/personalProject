public class practiseclass {
    public static string makingcallouts(){
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('CALLOUT:spponacular/api');
request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
return response.getBody();
} return '';
}
}