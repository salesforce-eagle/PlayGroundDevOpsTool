public class FieldRenderingController {
    
    public class InnerWrapper {
        @AuraEnabled
        public boolean readOnly;
        @AuraEnabled
        public boolean required;
        @AuraEnabled
        public boolean rendere;
        @AuraEnabled
        public string fieldName;        
    }
    
    @AuraEnabled
    public static InnerWrapper returnMethod(string recordId, string fieldNames){
        return null;
    }

}