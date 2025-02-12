public class TokenFormController {
    public String merchantIdentifier { get; set; }
    public String serviceCommand { get; set; }

    public String accessCode { get; set; }
    public String signature { get; set; }
    public String returnUrl { get; set; }
    public String merchantReference { get; set; }
    public String cardHolderName { get; set; }
    public String cardNumber { get; set; }
    public String expiryDate { get; set; }
    public String cvv { get; set; }
    public String language { get; set; }
    public Integer Amount {get; set; }
    Public String Curency {get; set; }
    Public String Email {get; set; }
    Public String OrderDescription{get; set; }

    // Constructor to initialize the form values
    public TokenFormController() {
        merchantIdentifier = 'cbd4fa3d';
        accessCode = '3bK61VyP5osH38aPNpdu';
        serviceCommand ='PURCHASE';
   
        merchantReference = 'XYZ9239-yu899';
        language = 'en';
        Email = 'test@payfort.com';
        OrderDescription = 'iPhone 7-S';
        Amount = 10000;
        Curency = 'AED';
        signature = '7ef81081920f4fb8cf2759de42a1ac6c8127b93e580c4ecb379932d7c943c6d6';
     /*   cardHolderName = 'John Smith';
        cardNumber = '4005550000000001';
        expiryDate = '2105';
        cvv = '123'; */
            

        
        
    }

    private String generateSignature() {
        // Construct the raw signature data (adjust as per your gateway's requirements)
        String rawData = 'access_code=' + accessCode +
                         '&merchant_identifier=' + merchantIdentifier +
                         '&merchant_reference=' + merchantReference +
                         '&language=' + language;
                         
        // Generate the SHA256 signature
        Blob hash = Crypto.generateDigest('SHA256', Blob.valueOf(rawData));
        return EncodingUtil.convertToHex(hash).toLowerCase();
    }
}