global with sharing class ExceptionHandlingClass{
    public static integer lineNumber;
    Public static string errorMessage;
    /* implements Messaging.InboundEmailHandler
     * global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                                                           Messaging.InboundEnvelope envelope)
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        return result;
    }*/
    public static void createMethod(){
        Account ac = new Account(Name='Bibhu',Phone='9778430344');
        try{
            insert ac;
        }catch(Exception ex){
            lineNumber = ex.getLineNumber();
            errorMessage = ex.getMessage();
        }finally{
            Devbnd__Exception_Log__c exLog = new Devbnd__Exception_Log__c();
            exlog.Devbnd__Error_Line_Number__c = lineNumber;
            exLog.Devbnd__Error_Message__c = errorMessage;
            insert exLog;
        }
    }
}