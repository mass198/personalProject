public class ChatgptIntegration {

//public static final String openApiKey = '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';
    
    public static void makecalltogpt(string input){

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:chatgpt/v1/completions');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        String body = '{"model": "gpt-3.5-turbo", "prompt": "' + input + '", "max_tokens": 2}';

        req.setBody(body);
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
system.debug(res.getBody());
} else system.debug(res.getStatusCode());
        
}

}