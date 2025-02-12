public class PenClassOffer{
public static set<String> processedRecords = new set<String>();

public static void ApplyDiscountPen(list<Pen__c> VarPensListNew){
set<String> thisprocessedRecords = new set<String>();
//processedRecords.clear();
for(Pen__c VarP : VarPensListNew){
if(VarP.Price__c >= 100 && !processedRecords.contains(VarP.Name) ){

VarP.Price__c = VarP.Price__c-20;
processedRecords.add(VarP.Name);
}
thisprocessedRecords.add(VarP.Name);
system.debug('processedRecords---'+processedRecords);
system.debug('processedRecords---'+thisprocessedRecords);

}
}
}