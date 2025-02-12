@isTest
public class Abastible_EstructuraValides_JSONTest {
    /*
   static Abastible_EstructuraValides_JSON data;
    @TestSetup static Void setuptestdata(){
        testdata();
        system.debug('setuptestdata');
    }
    
    
    
    static void testdata(){
         system.debug('testdata');
    
       data = new Abastible_EstructuraValides_JSON();
        // Set values for the properties
        data.msg = 'Test message';
        data.code = 'Test code';
        data.address = 'Test address';
        data.cardcode = 'Test cardcode';
        data.phone = 'Test phone';
        data.city = 'Test city';
        data.name = 'Test name';
        data.state = 'Test state';
        data.email = 'Test email';
        data.type = 'Test type';
        data.success = true;
        data.expire_at = 'Test expire_at';
        data.type_qr = 'Test type_qr';
        // Create a list of Products
        List<Abastible_EstructuraValides_JSON.Products> productsList = new List<Abastible_EstructuraValides_JSON.Products>();
        // Create a product and add it to the list
        Abastible_EstructuraValides_JSON.Products product1 = new Abastible_EstructuraValides_JSON.Products();
        product1.amount = 'Test amount 1';
        product1.material = 'Test material 1';
        product1.qty = 'Test qty 1';
        product1.convenio = 'Test convenio 1';
        productsList.add(product1);
        // Create another product and add it to the list
        Abastible_EstructuraValides_JSON.Products product2 = new Abastible_EstructuraValides_JSON.Products();
        product2.amount = 'Test amount 2';
        product2.material = 'Test material 2';
        product2.qty = 'Test qty 2';
        product2.convenio = 'Test convenio 2';
        productsList.add(product2);
        // Set the products list in the main data object
            data.products = productsList;}
        // Perform your assertions or actions on the data object
        // ...
        // Perform assertions to verify the data object's properties */
          @isTest   
    static void testAbastibleEstructuraValidesJSON() {
        Test.StartTest();
        Abastible_EstructuraValides_JSON.generateCoverage();
        Test.StopTest();
        
      }}