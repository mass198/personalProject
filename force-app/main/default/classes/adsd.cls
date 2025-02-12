public class adsd {

     public String recordTypeId { get; set; }

    public adsd() {
        recordTypeId = ApexPages.currentPage().getParameters().get('RecordType');
        List<RecordType> rtIds = [SELECT Name from RecordType where Id = :recordTypeId LIMIT 1];
        if (rtIds.size() > 0) {
            string recordTypeName = rtIds[0].Name;
        }
    }
}