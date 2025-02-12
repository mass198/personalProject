//this apex class is for a VF pagfe controller by this we can make a workaround for a CORS error

public class ReqController {

public String inputValue{get; set;}

public String staticResource{get; set;}

  public void getStaticResource(){

staticResource = new PageReference(inputValue).getContent().toString();

  }

}