public class accupdate {
    public static void updatetheaddress(List<Account> AccList){
        try{
                for(Account Acc: Acclist){
                     if(Acc.ShippingCity != null){
                        Acc.BillingCity = Acc.ShippingCity;}
            
                    if(Acc.ShippingCountry != null){
                    Acc.BillingCountry = Acc.ShippingCountry;}
            
                    if(Acc.ShippingPostalCode != null){
                    Acc.BillingPostalCode = Acc.ShippingPostalCode;}
            
                
                }
            update AccList;
            if(Test.isRunningTest()){
system.debug('ISRUNNINGTEST CALLED');}
        }
                    catch(Exception e){
                    system.debug('Error'+ e.getMessage());}
        }
                
}