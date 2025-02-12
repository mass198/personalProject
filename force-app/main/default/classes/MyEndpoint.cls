/*@RestResource(urlMapping='/invalidgrant/*')
global class invalidgrantController{
    
    // Method to make API request
     @future(callout=true)
    global static void apiRequests(String endpoint, String method, String requestBody, String accessToken) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod(method);
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        if(requestBody != null) {
            request.setBody(requestBody);
        }
        Http http = new Http();
        HttpResponse response = http.send(request);
       // return response.getBody();
    }
    // This class makes 5000 requests
     @HttpGet
    global static void apiRequests5000() {
        String endpoint = 'https://sf200-dev-ed.my.salesforce.com/services/data/v50.0/query?q=SELECT+Id,Name+FROM+Opportunity';
        String method = 'GET';
        String requestBody = null;
        String accessToken =UserInfo.getSessionId();
        for(Integer i=0; i<1000; i++) {
            apiRequests(endpoint, method, requestBody, accessToken);
            
             
        }
    }
}

this apex class is getting callout error */

@RestResource(urlMapping='/myEndpoint3/*')
global with sharing class MyEndpoint {
    @HttpGet
    global static void getRecord() {
        for (Integer i = 0; i < 5000; i++) {
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://sf200-dev-ed.my.salesforce.com/services/data/v53.0/sobjects/Account/0015j00000zfYWR');
            request.setMethod('GET');
            request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
            Http http = new Http();
            HttpResponse response = http.send(request);
            // You can process the response here if needed
        }
    }
}

/*
@RestResource(urlMapping='/invalidgrant/*')
global class invalidgrantController {

    // Queueable job to make API request
    private class apiRequestsJob implements Queueable {
        private String endpoint;
        private String method;
        private String requestBody;
        private String accessToken;
        
        public apiRequestsJob(String endpoint, String method, String requestBody, String accessToken) {
            this.endpoint = endpoint;
            this.method = method;
            this.requestBody = requestBody;
            this.accessToken = accessToken;
        }
        
        public void execute(QueueableContext context) {
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod(method);
            request.setHeader('Authorization', 'Bearer ' + accessToken);
            if(requestBody != null) {
                request.setBody(requestBody);
            }
            Http http = new Http();
            HttpResponse response = http.send(request);
            
        }
    }

    
    @HttpGet
    global static void make4000Requests() {
        String endpoint = 'https://sf200-dev-ed.my.salesforce.com/services/data/50.0/query?q=SELECT+Id,Name+FROM+Opportunity';
        String method = 'GET';
        String requestBody = null;
        String accessToken = UserInfo.getSessionId();
        
        Integer numJobs = 4000;
        Integer batchSize = 1;
        Integer batchCount = numJobs / batchSize;
        Integer remainder = Math.Mod(numJobs, batchSize);
        for(Integer i=0; i<batchCount; i++) {
            System.enqueueJob(new BatchAPIRequestJob(endpoint, method, requestBody, accessToken, batchSize));
        }
        if(remainder > 0) {
            System.enqueueJob(new BatchAPIRequestJob(endpoint, method, requestBody, accessToken, remainder));
        }
    }
    
    // Queueable job to batch API request jobs
    private class BatchAPIRequestJob implements Queueable {
        private String endpoint;
        private String method;
        private String requestBody;
        private String accessToken;
        private Integer batchSize;
        
        public BatchAPIRequestJob(String endpoint, String method, String requestBody, String accessToken, Integer batchSize) {
            this.endpoint = endpoint;
            this.method = method;
            this.requestBody = requestBody;
            this.accessToken = accessToken;
            this.batchSize = batchSize;
        }
        
        public void execute(System.QueueableContext context) {
            List<Queueable> jobList = new List<Queueable>();
            for(Integer i=0; i<batchSize; i++) {
                jobList.add(new apiRequestsJob(endpoint, method, requestBody, accessToken));
            }
          //  System.enqueueJobs(jobList);
        }
    }
} */