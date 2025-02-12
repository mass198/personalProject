public with sharing class Spoonacular {
    private static final String RECEIPE_API = 'https://api.spoonacular.com';
    //API key can be found in spoonacular website
    private static final String API_KEY = 'e6ef3c64f0234b9ba8420df6fd830d9a';
public static string addit;

    @AuraEnabled
    public static string getRandomRecipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint(RECEIPE_API+'/recipes/random?apiKey='+API_KEY);
		request.setEndpoint('callout:Spoonacular/recipes/random?apiKey=e6ef3c64f0234b9ba8420df6fd830d9a');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
system.debug(response.getBody());
Blob blobres = response.getBodyasBlob();
       

/*Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Map<String, Object>> recipes = (List<Map<String, Object>>) results.get('recipes');
            
            if (!recipes.isEmpty()) {
                Map<String, Object> recipe = recipes[0];
                String recipeName = (String) recipe.get('title'); // Recipe title
                String recipeJson = JSON.serialize(recipe); // Convert recipe details to JSON text
                
                // Convert JSON text to Blob (file content)
                Blob fileBlob = Blob.valueOf(recipeJson);

                // Upload the file to Salesforce */
                uploadFile('recipeName.json', blobres, 'application/json');

           
return response.getBody();
        } else return '';}
        

    
/*
Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
       List<Object> Animal = (List<Object>) results.get('recipes');
            for(Object ani : Animal){


}
string decode = (string)JSON.deserialize(addit, string.class);
Blob b = EncodingUtil.base64Decode(decode);
contentVersion cv = new ContentVersion();
        cv.Title = 'fileName';
        cv.PathOnClient = 'fileName';
        cv.VersionData = b;
        cv.ContentLocation = 'S';
        
        insert cv;
system.debug('cvid---'+cv.id);
        
        return cv.Id;
/*Map<string, Object> results = (Map<string, Object>)JSON.deserializeUntyped(response.getBody());
system.debug(results); 
            return response.getBody();  */
       

    @AuraEnabled
    public static String getRecipe(String recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
Boolean vegetarian = (Boolean) result.get('vegetarian');
Boolean vegan = (Boolean) result.get('vegan');
Boolean glutenFree = (Boolean) result.get('glutenFree');
Boolean dairyFree = (Boolean) result.get('dairyFree');
Boolean veryHealthy = (Boolean) result.get('veryHealthy');
Boolean cheap = (Boolean) result.get('cheap');
Boolean veryPopular = (Boolean) result.get('veryPopular');
Boolean sustainable = (Boolean) result.get('sustainable');
Boolean lowFodmap = (Boolean) result.get('lowFodmap');
Integer weightWatcherSmartPoints = (Integer) result.get('weightWatcherSmartPoints');
String gaps = (String) result.get('gaps');
Integer preparationMinutes = (Integer) result.get('preparationMinutes');
Integer cookingMinutes = (Integer) result.get('cookingMinutes');
Integer aggregateLikes = (Integer) result.get('aggregateLikes');
Integer healthScore = (Integer) result.get('healthScore');
String creditsText = (String) result.get('creditsText');
Object extendedIngredients = (object)result.get('extendedIngredients');

// Output values
System.debug('extendedIngredients: ' + extendedIngredients);
System.debug('Vegetarian: ' + vegetarian);
System.debug('Vegan: ' + vegan);
System.debug('Gluten Free: ' + glutenFree);
System.debug('Dairy Free: ' + dairyFree);
System.debug('Very Healthy: ' + veryHealthy);
System.debug('Cheap: ' + cheap);
System.debug('Very Popular: ' + veryPopular);
System.debug('Sustainable: ' + sustainable);
System.debug('Low Fodmap: ' + lowFodmap);
System.debug('Weight Watcher Smart Points: ' + weightWatcherSmartPoints);
System.debug('Gaps: ' + gaps);
System.debug('Preparation Minutes: ' + preparationMinutes);
System.debug('Cooking Minutes: ' + cookingMinutes);
System.debug('Aggregate Likes: ' + aggregateLikes);
System.debug('Health Score: ' + healthScore);
System.debug('Credits Text: ' + creditsText);
system.debug(result);
            return response.getBody();

        }
        return '';
    }

    @AuraEnabled
    public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/findByIngredients?ingredients='+ingredients+'&number=10&apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }


/* public Integer recipeId = 646738;
 Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Spoonacular'+'/recipes/'+recipeId+'/information?apiKey=e6ef3c64f0234b9ba8420df6fd830d9a');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug(response.getBody());
        } */

public static Id uploadFile(String fileName, Blob fileBody, String contentType) {
        ContentVersion cv = new ContentVersion();
        cv.Title = fileName;
        cv.PathOnClient = fileName;
        cv.VersionData = fileBody;
        cv.ContentLocation = 'S';
        
        insert cv;
    return cv.id; }}