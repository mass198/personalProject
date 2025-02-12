public with sharing class AmazonPaymentServiceController {
    
    @AuraEnabled
    public static String getTokenization(String cardNumber, String cardExpiry, String cardCVV, String cardHolderName) {
        
        system.debug('paraams' + cardNumber + cardExpiry + cardCVV +cardHolderName);
        String Body;
        
        String endpoint = 'https://sbcheckout.payfort.com/FortAPI/paymentPage';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        
        // Set headers
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Access-Control-Allow-Origin', '*');
     //   request.setHeader('Authorization', 'Bearer YOUR_ACCESS_TOKEN');
        
        // Prepare JSON body
        Map<String, Object> requestBody = new Map<String, Object>();
        requestBody.put('merchant_identifier', 'cbd4fa3d');
        requestBody.put('access_code', '3bK61VyP5osH38aPNpdu');
        requestBody.put('signature', '44d3c0afcb5e63b0e20137b57c2f131fb3bff3aa8075f2086613bd4d3e25669b');
        requestBody.put('return_url', 'https://www.merchant.com');
       // requestBody.put('return_url', 'https://sf200-dev-ed.my.salesforce.com');
        requestBody.put('merchant_reference', 'merchanttest-10052');
        requestBody.put('card_holder_name', cardHolderName);
        requestBody.put('card_number', cardNumber);
        requestBody.put('expiry_date', cardExpiry);
        requestBody.put('service_command', 'TOKENIZATION');
        requestBody.put('cvv', cardCVV);
        requestBody.put('language', 'en');
        body = JSON.serialize(requestBody);
        // Convert to JSON string
        request.setBody(JSON.serialize(requestBody));

        HttpResponse response = http.send(request);
        system.debug('res---'+response);
    
    // If we get a 302 redirect, capture the new location and follow the redirect
    if (response.getStatusCode() == 302) {
        String redirectUrl = response.getHeader('Location');
        if (redirectUrl != null) {
            // Follow the redirect by making a new request to the new location
            HttpRequest redirectRequest = new HttpRequest();
            redirectRequest.setEndpoint(redirectUrl);
            redirectRequest.setMethod('POST'); // Assuming it's a GET request for the redirect
            redirectRequest.setHeader('Content-Type', 'application/json');
            redirectRequest.setBody(Body);
            HttpResponse redirectResponse = http.send(redirectRequest);
            return redirectResponse.getBody();
        }
    }
    
    // Handle the normal response if there's no redirect
    return response.getBody();
    }}