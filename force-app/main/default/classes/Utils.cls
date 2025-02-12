global without sharing class Utils {

    private static Map< Id, RecordType > mapRT;
    private static Map< String, Id > mapTerritoryModelId;
    private static Map< String, Id > mapTerritoryTypeId;
    private static Map< String, Id > profileMap;
    private static Map< String, Id > userRoleMap;
    private static Map< String, Schema.SObjectType > mapGlobalDescribe = Schema.getGlobalDescribe();
    private static Map< String, Id > businessHoursMap;
    private static Id adminProfileId;
    private static Id defaultBusinessHoursId;
    
    
    public static String baseURL{
        get{
            return Utils.baseURL();
        }
    }
    
    public static String baseURL(){
        return URL.getCurrentRequestUrl().toExternalForm().substringBefore( '/apex' );
    }

    public static String getResourceURL(String resourceName) {
        List<StaticResource> resourceList = [
            SELECT Name, NamespacePrefix, SystemModStamp
            FROM StaticResource
            WHERE Name = :resourceName
        ];
        
        if(resourceList.size() == 1) {
            String namespace = resourceList[0].NamespacePrefix;
            
            String response ='/resource/'
            + resourceList[0].SystemModStamp.getTime() + '/'
            + (namespace != null && namespace != '' ? namespace + '__' : '')
            + resourceName;
            System.debug('Utils.getResourceURL Response>>>>>>>'+response);
            return response;
        } else
            return '';
    }
    
    public static String getImageUrl (Id documentId){
        return URL.getSalesforceBaseUrl().toExternalForm() + '/servlet/servlet.ImageServer?id=' + documentId + '&oid=' + UserInfo.getOrganizationId();
    }
    
    public static Boolean futureAble(){
        return !System.isBatch() && !System.isFuture() && !System.isScheduled();
    }
    
    
    // Formatação de strings
    
    public static String limparFormatacaoTel(String param) {
        if(String.isEmpty(param)) return '';
        param = param.replace(' ', '');
        return param.replaceAll('[)(-]', '');
    }
    
    public static String limparFormatacaoCpfCnpj(String param) {
        if(String.isEmpty(param)) return '';
        param = param.replace(' ', '');
        return param.replaceAll('[/\\.-]', '');
    }
    
    public static String limparFormatacaoEspecial(String param){
        if(String.isEmpty(param)) return '';
        param = param.replaceAll(' ', '');
        return param.replaceAll('(?i)[^0-9a-záéíóúàèìòùâêîôûãõç]', '');
    }
    
    public static String limparFormatacaoGeral(String param) {
        if(String.isEmpty(param)) return '';
        Set<String> removeChars = new Set<String> {')', '/', '-', '.', '[', ']', '{', '}'};
        removeChars.add('(');
        
        for(String s : removeChars)
            param = param.remove(s);
            
        return param;
    }}