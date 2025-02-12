public class ContactDedupeController {
    
    // Initialize a variable to hold the contact record you're processing
    private final Contact contact;
    
    // Initialize a list to hold any duplicate records
    private List<sObject> duplicateRecords;
    
    // Define variable that’s true if there are duplicate records
    public boolean hasDuplicateResult{get;set;}
    
    // Define the constructor
    public ContactDedupeController() {
        
        // Define the values for the contact you’re processing based on its ID
        Id id = ApexPages.currentPage().getParameters().get('id');
        this.contact = (id == null) ? new Contact() : 
            [SELECT Id, FirstName, LastName, Email, Phone, AccountId 
             FROM Contact WHERE Id = :id];
       
        // Initialize empty list of potential duplicate records
        this.duplicateRecords = new List<sObject>();
        this.hasDuplicateResult = false;
    }
    
    // Return contact and its values to the Visualforce page for display
    public Contact getContact() {
        return this.contact;
    }
    
    // Return duplicate records to the Visualforce page for display
    public List<sObject> getDuplicateRecords() {
        return this.duplicateRecords;
    }
    
    // Process the saved record and handle any duplicates
    public PageReference save() {
        
        // Optionally, set DML options here, use “DML” instead of “false” 
        //   in the insert()
        // Database.DMLOptions dml = new Database.DMLOptions(); 
        // dml.DuplicateRuleHeader.allowSave = true;
        // dml.DuplicateRuleHeader.runAsCurrentUser = true;
        Database.SaveResult saveResult = Database.insert(contact, false);

        if (!saveResult.isSuccess()) {
            for (Database.Error error : saveResult.getErrors()) {
                // If there are duplicates, an error occurs
                // Process only duplicates and not other errors 
                //   (e.g., validation errors)
                if (error instanceof Database.DuplicateError) {
                    // Handle the duplicate error by first casting it as a 
                    //   DuplicateError class
                    // This lets you use methods of that class 
                    //  (e.g., getDuplicateResult())
                    Database.DuplicateError duplicateError = 
                            (Database.DuplicateError)error;
                    Datacloud.DuplicateResult duplicateResult = 
                            duplicateError.getDuplicateResult();
                    
                    // Display duplicate error message as defined in the duplicate rule
                    ApexPages.Message errorMessage = new ApexPages.Message(
                            ApexPages.Severity.ERROR, 'Duplicate Error: ' + 
                            duplicateResult.getErrorMessage());
                    ApexPages.addMessage(errorMessage);
                    
                    // Get duplicate records
                    this.duplicateRecords = new List<sObject>();

                    // Return only match results of matching rules that 
                    //  find duplicate records
                    Datacloud.MatchResult[] matchResults = 
                            duplicateResult.getMatchResults();

                    // Just grab first match result (which contains the 
                    //   duplicate record found and other match info)
                    Datacloud.MatchResult matchResult = matchResults[0];

                    Datacloud.MatchRecord[] matchRecords = matchResult.getMatchRecords();

                    // Add matched record to the duplicate records variable
                    for (Datacloud.MatchRecord matchRecord : matchRecords) {
                        System.debug('MatchRecord: ' + matchRecord.getRecord());
                        this.duplicateRecords.add(matchRecord.getRecord());
                    }
                    this.hasDuplicateResult = !this.duplicateRecords.isEmpty();
                }
            }
            
            //If there’s a duplicate record, stay on the page
            return null;
        }
        
        //  After save, navigate to the view page:
        return (new ApexPages.StandardController(contact)).view();
    }
    
}