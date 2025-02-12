/*@RestResource(urlMapping='/createAccounts')
global class AccountCreationRestService {
    @HttpPost
    global static String createAccounts() {
        List<Case> accountsToCreate = new List<Case>();
        for (Integer i = 1; i <= 5000; i++) {
            Case newAccount = new Case();
            newAccount.Subject = '00001677 ' + i;
           // accountsToCreate.add(newAccount); single apicall
            insert newAccount; 
        }
       // insert accountsToCreate;
        return 'Successfully created ' + accountsToCreate.size() + ' accounts.';
    }


 @HttpDelete
    global static String deleteAccounts() {
        List<Case> accountsTodelete = [select id, subject, createdDate from case WHERE CreatedDate= TODAY];
        for (Case cs : accountsTodelete) {
            
            
        }
        delete accountsTodelete; 
       // insert accountsToCreate;
        return 'Successfully deleted ' + accountsTodelete.size() + ' accounts.';
    }
}
*/
@RestResource(urlMapping='/createCases')
global class CreateCasesRestService {

    @HttpPost
    global static String createCases() {
        List<Case> casesToInsert = new List<Case>();
        for (Integer i = 1; i <= 5000; i++) {
            Case c = new Case(Subject='Test Case ' + i, Priority='Medium', Status='New');
            casesToInsert.add(c);
        }
        
        Integer batchSize = 1; // set the batch size to 1 to make a single API call for each record
        
        List<List<Case>> caseBatches = new List<List<Case>>();
        for (Integer i = 0; i < casesToInsert.size(); i += batchSize) {
            List<Case> caseBatch = new List<Case>();
            for (Integer j = i; j < Math.min(i + batchSize, casesToInsert.size()); j++) {
                caseBatch.add(casesToInsert[j]);
            }
            caseBatches.add(caseBatch);
        }
        
        Integer numCalls = 0;
        for (List<Case> caseBatch : caseBatches) {
            List<Database.SaveResult> saveResults = Database.insert(caseBatch, false);
            numCalls++;
        }
        
        return 'Created ' + casesToInsert.size() + ' cases in ' + numCalls + ' API calls.';
    }
}