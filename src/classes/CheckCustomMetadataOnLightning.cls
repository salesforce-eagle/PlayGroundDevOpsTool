public class CheckCustomMetadataOnLightning {
    
    @AuraEnabled
    public static CustomResult initMethod(Id recordId, string objectName){
    List<Sobject> genericListOfMetadata = [Select Id,Devbnd__Object_Name__c, Devbnd__Fields_Name__c from Devbnd__Store_Object_Values__mdt
                                          where Devbnd__Object_Name__c =: objectName Limit 1];
        String fieldResult = ((Devbnd__Store_Object_Values__mdt)genericListOfMetadata[0]).Devbnd__Fields_Name__c;
        
        return null;
    }
    
    Public class CustomResult{
        @AuraEnabled
        Public String ObjectName;
        @AuraEnabled
        Public List<String> listOfFields; 
        @AuraEnabled
        Public boolean isCase;
    }
    

}