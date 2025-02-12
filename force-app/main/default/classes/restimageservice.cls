public class restimageservice {

    public static void getImages(string type, Integer num){
Http http = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('callout:Anime/v1/anime/'+type+'/'+num);
req.setMethod('GET');
HttpResponse response = http.send(req);

        if(response.getStatusCode() == 200){
system.debug(response.getBody());

Map<string, Object> results = (Map<string, Object>) JSON.deserializeUntyped(response.getBody());

List<Object> images = (List<Object>) results.get('images');

if (images != null && !images.isEmpty()) {
                String imageUrl = (string) images[0];
				String url = (string) imageUrl;
				String imageName = url.substring(url.lastIndexOf('/') + 1, url.lastIndexOf('.'));
uploadImage(imageUrl,imageName, type);
} else 
system.debug(response.getStatusCode());

}
    }

private static void uploadImage(String imageUrl, String imageName, string type) {
        // Step 3: Download the image as a blob
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(imageUrl);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);


        
        if (response.getStatusCode() == 200) {

system.debug('full response' + response);
system.debug('bodyasblob'+ response.getBodyAsBlob());
system.debug('body'+response.getBody());

            Blob imageBlob = response.getBodyAsBlob();
            
            // Step 4: Create a new ContentVersion record
            ContentVersion contentVersion = new ContentVersion();
            contentVersion.Title = imageName;
            contentVersion.PathOnClient = imageName + '.'+type;
            contentVersion.VersionData = imageBlob;
            contentVersion.ContentLocation = 'S'; // Salesforce Content
            
            // Insert the ContentVersion record
            insert contentVersion;
system.debug('contentVersion' + contentVersion.Id);
        } else {
            System.debug('Error downloading image: ' + response.getStatus());
        }
    }
}