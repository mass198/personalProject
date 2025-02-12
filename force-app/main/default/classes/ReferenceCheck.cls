public class ReferenceCheck {
    public ReferenceCheck() {
    
        Map<String, Schema.SObjectField> schemaFieldMap = Schema.getGlobalDescribe().get('Opportunity').getDescribe().fields.getMap();
        for(Schema.SObjectField field : schemaFieldMap.values()) {
            Schema.DescribeFieldResult fieldDesc = field.getDescribe();
            //System.debug(fieldDesc);
            
            if(fieldDesc.getName() == 'ContactId' && String.valueOf(fieldDesc.getType()) == 'REFERENCE') {
                system.debug(' field : '+field); //ContactId
                system.debug(' field Describe : '+fieldDesc);
                system.debug(' fieldDesc.getRelationshipName() : '+fieldDesc.getRelationshipName());
                system.debug(' fieldDesc.getName() : '+fieldDesc.getName());
                system.debug(' fieldDesc.getType() : '+fieldDesc.getType());
                //  system.debug(' fieldDesc.getRelationshipName() toLowerCase : '+fieldDesc.getRelationshipName().toLowerCase());
        
            }
        }
    }
}

//This code defines a class named ReferenceCheck. It has a constructor that retrieves the schema of the Opportunity object and loops through all its fields using the getMap() method. For each field, it checks if its name is ContactId and its type is REFERENCE.
//If the field matches these conditions, the code logs several debug statements using the system.debug() method. These debug statements print information about the ContactId field, such as its name, describe result, relationship name, and type.
//This code could be useful for checking the schema of an Opportunity object and identifying whether a specific field, in this case, ContactId, is a reference field. The debug statements could provide additional information to help debug any issues related to this field.