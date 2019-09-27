public abstract class DynamicApexProp {
    Public Class SchemaDetailsProvider{        
    }
    public abstract void methodName();
    public Object getValues(String parameters){
        String json_Instance = Json.serialize(this);
        system.debug('json_Instance: '+json_Instance);
        Map<String, Object> unTyped_Instance;
        unTyped_Instance = (Map<String, Object>)JSON.deserializeUntyped(json_Instance);
        system.debug('unTyped_Instance: '+unTyped_Instance);
        return unTyped_Instance.get(parameters);
    }
    Public string getClassPeoperties(object objectName){
        return String.valueOf(objectName);
    }
    Public Object getObjectSchema(List<string> ObjectNames){
        Map<string, schema.SObjectType> mapName = schema.getGlobalDescribe();
        Schema.DescribeSObjectResult[] descResult = Schema.describeSObjects(ObjectNames);        
        return (Object)descResult;
    }    
}