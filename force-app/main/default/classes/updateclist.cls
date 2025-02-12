Public class updateclist{
    public static void updrec(){
        Id cid = '0035j00000vMqQzAAK';
        List<Electronic_product__c> LISTOFC = new List<Electronic_product__c>();
        for(Electronic_product__c loc:LISTOFC){
            if(loc.Contact__c == null){
                loc.Contact__c = cid;
            }
         
        }
    }
}