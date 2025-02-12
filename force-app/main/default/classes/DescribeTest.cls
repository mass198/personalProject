// @IsTest
public class DescribeTest{
   /* @IsTest
    private static void productDescribeTest() {
       
        List<String> errorMessages1 = new List<String>();
        for(SObjectType parentType : Schema.getGlobalDescribe().values()){
             List<String> errorMessages = new List<String>();
            errorMessages = checkChildRelationships(parentType);
            if(errorMessages.size()>0){
                
           
            
            errorMessages1.addAll(errorMessages); }
     
        }
                system.debug('errorMessages1--'+errorMessages1);

        system.debug('error message -- '+ errorMessages);
        system.debug('String.join -- '+String.join(errorMessages,'\n'));
        System.assertEquals(true,errorMessages.size()!=0); 
        System.assertEquals('', String.join(errorMessages1,'\n'));
    }
    public static List<String> checkChildRelationships(Schema.SObjectType typeToCheck){
        List<String> errorMessages = new List<String>();
        List<Schema.ChildRelationship> childRelationships = typeToCheck.getDescribe().getChildRelationships();
        for(Schema.ChildRelationship childRelationship : childRelationships){
            SObjectType childType = childRelationship.getChildSObject();
            String childFieldName = childRelationship.getField().getDescribe().getName();
            
            Boolean fieldExistsInObjectDescribe = false;
            //Get all fields for the current child object
            for(String objectDescribeFieldName : childRelationship.getChildSObject().getDescribe().fields.getMap().keySet()){
            //   system.debug('objectDescribeFieldName--'+ objectDescribeFieldName); 
                   if(childFieldName == objectDescribeFieldName){
                     //  system.debug('true');
                    //Child relationship field exists in the child sobject describe
                    fieldExistsInObjectDescribe = true;
                    break;
                }
            }
            if(!fieldExistsInObjectDescribe){
                if(childFieldName=='UserRecordAccessId'){
                    
                
                system.debug('childFieldName--'+ childFieldName);
                system.debug('childType--'+ childType);
                system.debug('typeToCheck--'+ typeToCheck);}
                errorMessages.add('Field ' + childFieldName + ' does not exist when describing the ' + childType + ' object directly, but exists as a child relationship of ' + typeToCheck);
            }
        }
        system.debug('mycheck--'+errorMessages);
        return errorMessages;
    }*/
}