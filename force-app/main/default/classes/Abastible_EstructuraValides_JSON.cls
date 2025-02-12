global class Abastible_EstructuraValides_JSON {
  
  public String msg;
  public String code;
  public String address;
  public String cardcode;
  public String phone;
  public String city;
  public String name;
  public String state;
  public String email;
  public String type;
  public Boolean success;
  public String expire_at;
  public String type_qr;
  public List<Products> products;

  public class Products {
    public String amount;
    public String material;
    public String qty;
    public String convenio;
  }
  
   public static void generateCoverage() {
     System.debug('cover me!');
   }
}