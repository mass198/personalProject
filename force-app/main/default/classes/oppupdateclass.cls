public class oppupdateclass {
    public static void updateopps(List<Opportunity> opps){
List<Opportunity> opplist = new List<Opportunity>();
    for(opportunity opp : opps){
        opp.check_validation__c	 = opp.Order_Status__c;
     
    }

        
    }

}