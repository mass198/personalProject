trigger Realtor_LeadConversion on Lead (after update,before update) {    
    // List<Lead> convertedLeads = [Select Id, Name,ConvertedOpportunityId From Lead Where IsConverted = true AND Recordtype.Name='Agent'AND Recordtype.Name!='Student'AND Recordtype.Name!='Employee_Candidate'AND Recordtype.Name!='Commercial' AND Recordtype.Name!= 'Financial' AND Recordtype.Name!= 'Personal'];
    List<Opportunity> Opportunitylist = new List<Opportunity>();
    List<Contact> ContactList = new List<Contact>();
    List<Task> ThankYouNote = new List<Task>();
    //Id AgentRecordTypeId;
    //Id ContactRecordTypeId;
 //    RecordType agentRecordType = [select id from RecordType where Name='Agent'];
 //   Id agnetRecordType=Schema.SObjectType.Lead.getRecordTypeInfosByName().get('').getRecordTypeId();
    //List < RecordType> RecordTypeIds = [select id from RecordType where Name='Agent' or Name='Gary Greene Internal'];
    //Map<String, Id> mapRTId= new Map<String,Id>();
    
   // Id AgentRecordTypeId = agnetRecordType;
    // Id ContactRecordTypeId=Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Gary Greene Internal').getRecordTypeId();
    RecordType contactRecordType = [select id from RecordType where Name='Gary Greene Internal'];
    Id ContactRecordTypeId = contactRecordType.id;
  //  EmailTemplate template = [SELECT Id, HtmlValue, Subject FROM EmailTemplate WHERE Name ='Invitation to Sign up for Essential Classes']; 
    set<id> leadIds= new set<id>();
    
   
    
    set<id> taskids=new set<id>();
    if(trigger.isafter && trigger.isupdate)
    {
        for (Lead leadrec:Trigger.new) {
            taskids.add(leadrec.id);
        }
       
        integer i=0;
        map<id,Lead> leadmap=new map<id,Lead>();
        map<id,Contact> contacmap=new  map<id,Contact>();
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for (Lead leadrecord : Trigger.new) {
            if((Trigger.old[i].IsConverted == false)&&(leadrecord.IsConverted == true)){
                leadmap.put(leadrecord.Id,leadrecord);
                // Opportunity OpportunityInstance = new Opportunity();
                //OpportunityInstance.id=leadrecord.ConvertedOpportunityId;
                //OpportunityInstance.StageName = 'Won';
                // Opportunitylist.add(OpportunityInstance);
                Contact updateContact = new Contact();
                updateContact.Id = leadrecord.ConvertedContactId;
                updateContact.RecordTypeId= ContactRecordTypeId;
                contacmap.put(leadrecord.Id,updateContact);
                ContactList.add(updateContact);
                
 system.debug('convertedContactID2---'+leadRecord.ConvertedContactId);            
        }
        
        
        // update Opportunitylist; 
        update ContactList; 
            
            system.debug('ContactList---'+ContactList);
           
 //       update TransList; 
        Insert ThankYouNote;
        If(emailList.size()>0)
        {
            // Messaging.SendEmailResult [] r = Messaging.sendEmail(emailList);
        }
    }
        system.debug('before entering into if condtion'); }
    List<string> licenseNubmers=new List<string>(); 
        List<string> contactPhone=new List<string>();
        List<string> contactEmail=new List<string>();
        set<ID> getconvertedcontactID=new set<ID>();
         set<Id> getCId = new set<ID>();
    if(trigger.isbefore && trigger.isupdate)
    {
        system.debug('trigger.isbefore and isupdate');
        
        for (Lead leadRecords : Trigger.new) {

                if(leadRecords.Phone != null){
                    licenseNubmers.add(leadRecords.Phone );
                }
                getconvertedcontactID.add(leadRecords.Id);
            getCId.add(leadRecords.ConvertedContactId);
            system.debug('convertedContactID---'+leadRecords.ConvertedContactId);
            system.debug('getconvertedcontactID---'+getconvertedcontactID);
                system.debug('pass---lead'+leadRecords);
            system.debug('getCId---'+getCId);
            
            }
        
        system.debug('pass--map'+licenseNubmers.size());
        if(licenseNubmers.size() > 0)
        {
            //OR Phone in: licenseNubmers OR Email in:licenseNubmers 
            list<Contact> listOfGG=[select id,Name,Phone,Email  from contact where Phone in:licenseNubmers AND Id Not in :getCId];//AND ID<>:getconvertedcontactID
            
            system.debug('contacts list---'+listOfGG);
            Map<string,string> dupLicenseContact = new Map<string,string>();
            
            for(Contact contactlist : listOfGG){
                if( listOfGG.size()>0)
                {
                    system.debug('contactlist---pass'+contactlist);
                    if( contactlist.Phone != null){
                        dupLicenseContact.put(contactlist.Phone,contactlist.Name);   
                        
                    } 
                    system.debug('dupLicenseContact---'+dupLicenseContact);
                    
                }
            }
            for (Lead leadRec : Trigger.new) {
                system.debug('tested it if it entered in forloop---');
                if(leadRec.Status=='Closed - Converted' && (!listOfGG.isEmpty()) && (dupLicenseContact.containsKey(leadRec.Phone))){leadRec.Status.addError('Contact named exist with same license number or email or phone number');   }
                    system.debug('leadRec.Status---'+leadRec.Status);
                 system.debug('leadRec.Phone---'+leadRec.Phone);
                    system.debug('duplicate contact entered in error');
                 //&& (!getconvertedcontactID.contains(leadRec.convertedcontactID))) || dupEmailContact.containsKey(leadRec.Email)  || dupPhoneContact.containsKey(leadRec.Phone))
       
               
                   
                 
                    
                    
                  
                }
                
            }
    }
        
      
    
    string aa3re = 'ss';
    string aae3 = 'ss';
    string aaef = 'ss';
    string aaew2 = 'ss';
    string aa3dd = 'ss';
    string aawd33 = 'ss';
    string aaqw33 = 'ss';
    string aacqw1 = 'ss';
    string aa1wqs = 'ss';
    string aa12w = 'ss';
    string aa11wss = 'ss';
    string aa12ss = 'ss';
    string aa12dw = 'ss';
    string aa12e2d = 'ss';
    string aa12s1s = 'ss';
    string aa12ssw = 'ss';
    string aace3 = 'ss';
    string aaswdd = 'ss';
    string aa22w = 'ss';
    string aa2r2 = 'ss';
    string aa3rg3 = 'ss';
    string aa3r3 = 'ss';
    string aa33356 = 'ss';
    string aa335 = 'ss';
    string aa32 = 'ss';
    string aa432 = 'ss';
    string aa34 = 'ss';
    string aa56 = 'ss';
    string aa77 = 'ss';
    string aa99 = 'ss';
    string aa9 = 'ss';
    string aa8 = 'ss';
    string aa66 = 'ss';
    string aa7 = 'ss';
    string aa6 = 'ss';
    string aa5 = 'ss';
    string aa4 = 'ss';
    string aa3 = 'ss';
    string aa2 = 'ss';
    string aa1 = 'ss';
    string aa2xaxs = 'ss';
    string aa1assw = 'ss';
    string aa2asa = 'ss';
    string aazx1 = 'ss';
    string aa2q1 = 'ss';
    string aaxz1 = 'ss';
    string aa2q2 = 'ss';
    string aa1xz = 'ss';
    string aa2q3 = 'ss';
    string aa1xzss = 'ss';
    string aa2q4 = 'ss';
    string aa1xzd = 'ss';
    string aa2q5 = 'ss';
    string aza1xz = 'ss';
    string aa2q6 = 'ss';
    string aa1cdcc = 'ss';
    string aa2q7 = 'ss';
    string aa1qsqaa = 'ss';
    string aa2q8 = 'ss';
    string aa1wzsw = 'ss';
    string aa2q9 = 'ss';
    string aa1wss = 'ss';
    string aa2q10 = 'ss';
    string aa1sadw = 'ss';
    string aa2q11 = 'ss';
    string aa1sasccs = 'ss';
    string aa2q12 = 'ss';
    string aa1asqs = 'ss';
    string aa2q13 = 'ss';
    string aa1ascww = 'ss';
    string aa2q14 = 'ss';
    string aa1saqwss = 'ss';
    string aa2q16 = 'ss';
    string aa1saccs = 'ss';
    string aa2q122 = 'ss';
    string aa1wsaas = 'ss';
    string aa2q109 = 'ss';
    string aa1saws = 'ss';
    string aa2q1222 = 'ss';
    string aa1sxsa = 'ss';
    string aa2q122w = 'ss';
    string aa1saaas = 'ss';
    string aa2q12se = 'ss';
    string aa1sasa = 'ss';
    string aa2q12qq = 'ss';
    string aa1ssas = 'ss';
    string aa2q1zx = 'ss';
    string aa1ssssa = 'ss';
    string aa2q1mn = 'ss';
    string aa1ssss = 'ss';
    string aa2q1lk = 'ss';
    string aa1ss = 'ss';
    string aa2qkk = 'ss';
    string aa10s = 'ss';
    string aa2qj = 'ss';
    string aaqq1 = 'ss';
    string aabu34ub = 'ss';
    string aanuiuy6 = 'ss';
    string aajyvv5 = 'ss';
    string aabuiuibge8 = 'ss';
    string aabhsydos8 = 'ss';
    string aa2q1zx1 = 'ss';
    string aa1ssssa2 = 'ss';
    string aa2q1mn3 = 'ss';
    string aa1ssss4 = 'ss';
    string aa2q1lk5 = 'ss';
    string aa1ss6 = 'ss';
    string aa2qkk7 = 'ss';
    string aa10s8 = 'ss';
    string aa2qj9 = 'ss';
    string aaqq10 = 'ss';
}