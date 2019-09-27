public with sharing class ExceptionHandlingInAura {
    
    public class CustomExceptionHandling{
        string errorMessage;
        string errorType;
        integer errorNumber;
        
        public CustomExceptionHandling(string errorMessage, string errorType, integer errorNumber){
            this.errorMessage = errorMessage;
            this.errorType = errorType;
            this.errorNumber = errorNumber;       
        }
    }
    Public Static CustomExceptionHandling ceh = new CustomExceptionHandling('Bibhu', 'Error', 5);
    @AuraEnabled
    public static integer initMethod(){        
        integer abc;
        try{
            abc = 1/0;
        }catch(Exception e){
            throw new AuraHandledException('Providing the Error message: '+e.getMessage()+JSON.serialize(ceh));
        }
        return abc;
    }    
}