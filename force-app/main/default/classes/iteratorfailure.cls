public class iteratorfailure {
    public static void doesthispass(){
        Database.QueryLocator locator = Database.getQueryLocator( 'SELECT Id FROM Account' );

Assert.isInstanceOfType( locator, Iterable<SObject>.class );
Assert.isInstanceOfType( locator.iterator(), Iterator<SObject>.class );

Iterable<SObject> iAmIterable = locator;
//locator.iterator(); // works
iAmIterable.iterator(); // doesn't work
    }
}