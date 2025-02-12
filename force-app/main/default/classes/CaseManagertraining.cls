@RestResource(urlMapping='/Casestraining/*')
global with sharing class CaseManagertraining {
   
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
       List<Account> accList = [Select Name From Account Limit 10];
        //acclist.Id = null;
      return JSON.serialize(accList);
      
    }
        
        
        
        @HttpPatch
    global static string accountUpdate(string accDetails) {
        system.debug('accDetails ---- '+accDetails);
        List<Test__c> accList = (List<Test__c>)JSON.deserialize(accDetails, List<Test__c>.class);
        System.debug('accList ------ '+accList);
       //Map<String, String> results = (Map<String, String>) JSON.deserializeUntyped(accDetails);
        //system.debug('results ---- '+results);
        return accDetails;
        
    }  
    }