public class SetUpAuditTrileClass{
    public static list<string> searchKeyword(){
        list<string> searchComponent = new list<string>{'CustomObject','ApexClass'};
            return searchComponent;
    }
    Public Class InitWrapper{
        @AuraEnabled
        Public Map<String, String> userActionMap;
        @AuraEnabled
        Public List<SetupAuditTrail> auditList;
    }    
    public static InitWrapper inr = new InitWrapper();
    @AuraEnabled
    public static InitWrapper getSetupModifyDetails(){
        inr.userActionMap = new Map<String, String>();
        inr.auditList = new List<SetupAuditTrail>();
        inr.auditList = [SELECT Id, Action, Section, createdDate,CreatedById, CreatedBy.Name, Display
                         FROM SetupAuditTrail where CreatedDate = Today];
        for(SetupAuditTrail sat: inr.auditList){
            if(inr.userActionMap.containsKey(sat.CreatedById)){
                string temp = inr.userActionMap.get(sat.CreatedById);
                temp +=', '+ sat.Display;
                inr.userActionMap.put(sat.CreatedById, temp);
            }else{
                inr.userActionMap.put(sat.CreatedById, sat.Display);
                List<string> lst = sat.Display.split(' ');
                system.debug('lst: '+lst);
            }    
        }
        return inr;
    }
    
    @AuraEnabled
    public static void sendEmailToUser(){
        InitWrapper inr = new InitWrapper();
        inr = getSetupModifyDetails();
        //Map<string, string> userActionMap = getSetupModifyDetails();
        List<Messaging.SingleEmailMessage> messageses = new List<Messaging.SingleEmailMessage>();
        set<string> temp1 = inr.userActionMap.keySet();
        List<String> temp = new List<String>(temp1);
        for(integer i = 0; i < temp.Size();i++){            
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.toAddresses = temp;
            email.subject = 'Changes Made by User Today';
            email.plainTextBody = inr.userActionMap.get(temp[i]);
            messageses.add(email);        
        }    
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messageses);
        if (results[0].success){
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '+ results[0].errors[0].message);
        }
    }       
}