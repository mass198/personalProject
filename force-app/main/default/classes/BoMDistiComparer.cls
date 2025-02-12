public class BoMDistiComparer {

    public class BoMDistiComparisonResult {
        public String bom_pn { get; set; }
        public Decimal bom_qty { get; set; }
        public String disti_pn { get; set; }
        public Decimal disti_qty { get; set; }
        public Boolean errorFlag { get; set; }
        
        public BoMDistiComparisonResult(String bom_pn, Decimal bom_qty, String disti_pn, Decimal disti_qty, Boolean errorFlag) {
            this.bom_pn = bom_pn;
            this.bom_qty = bom_qty;
            this.disti_pn = disti_pn;
            this.disti_qty = disti_qty;
            this.errorFlag = errorFlag;
        }
    }
    
    public static List<BoMDistiComparisonResult> compareBoMDisti(List<Map<String, Object>> bom, Map<String, Decimal> disti) {
        List<BoMDistiComparisonResult> comparisonResults = new List<BoMDistiComparisonResult>();
        
        for (Map<String, Object> bomItem : bom) {
            String bom_pn = (String)bomItem.get('Part Number');
            Decimal bom_qty = (Decimal)bomItem.get('Quantity');
            Decimal remainingDistiQty = disti.containsKey(bom_pn) ? disti.get(bom_pn) : 0;
            Boolean errorFlag = !disti.containsKey(bom_pn);
            
            while (bom_qty > 0) {
                Decimal disti_qty = remainingDistiQty > bom_qty ? bom_qty : remainingDistiQty;
                remainingDistiQty -= disti_qty;
                bom_qty -= disti_qty;
                
                comparisonResults.add(new BoMDistiComparisonResult(bom_pn, disti_qty, disti.containsKey(bom_pn) ? bom_pn : null, disti_qty, errorFlag));
                
                if (bom_qty > 0 && !disti.containsKey(bom_pn)) {
                    comparisonResults.add(new BoMDistiComparisonResult(bom_pn, bom_qty, null, 0, true));
                    bom_qty = 0;
                }
            }
        }
        
        for (String disti_pn : disti.keySet()) {
            if (!bomContainsPN(bom, disti_pn)) {
                comparisonResults.add(new BoMDistiComparisonResult(null, 0, disti_pn, disti.get(disti_pn), true));
            }
        }
        
        return comparisonResults;
    }
    
    private static Boolean bomContainsPN(List<Map<String, Object>> bom, String pn) {
        for (Map<String, Object> bomItem : bom) {
            if (((String)bomItem.get('Part Number')).equals(pn)) {
                return true;
            }
        }
        return false;
    }
}