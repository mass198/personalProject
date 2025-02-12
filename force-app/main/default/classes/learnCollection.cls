public class learnCollection{
    
    public static void addMap(){
        
        Map<integer,string> newMap = New Map<integer,string>();
        newMap.put(1,'Apple');
        newMap.put(2,'Banana');
        newMap.put(3,'Cat');
        newMap.put(4,'Dog');
        newMap.put(5,'Elephant');
        
        if(newMap.Containskey(1)){
         string result = newMap.get(1);
            system.debug(result);
        }
        
    }



    public static void addList(){
        
      List<String> newList = New List<String>();
        newList.add('Apple');
        newList.add('Banana');
        newList.add('Cat');
        newList.add('Dog');
        newList.add('Elephant');
       
        string checkifthere = newList.get(2);
        system.debug('answer---' + checkifthere);
    }
}