public class PaymentFormController {
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
    public PaymentFormController() {
        merchantIdentifier = 'cbd4fa3d';
        accessCode = '3bK61VyP5osH38aPNpdu';
        merchantReference = 'XYZ9239-yu898';
        language = 'en';
        OrderDescription = 'iPhone 6-S';
        Email = 'test@payfort.com';
        serviceCommand ='AUTHORIZATION';
        signature = '57622e08b718763e7e12d61604ba859e270d4938d720e6c8f52f480d0a7e8d01'; 
      
    }

    private String generateSignature() {
        // Construct the raw signature data MODIFY this code as per signature requirement
        String rawData = 'access_code=' + accessCode +
                         '&merchant_identifier=' + merchantIdentifier +
                         '&merchant_reference=' + merchantReference +
                         '&language=' + language;
                         
        // Generate the SHA256 signature
        Blob hash = Crypto.generateDigest('SHA256', Blob.valueOf(rawData));
        return EncodingUtil.convertToHex(hash).toLowerCase();
    }
}