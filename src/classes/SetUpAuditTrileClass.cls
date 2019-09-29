public class SetUpAuditTrileClass{
    public static list<string> searchKeyword(){
        list<string> searchComponent = new list<string>{'CustomObject','ApexClass'};
        return searchComponent;
    }
    public static Map<String, String> getSetupModifyDetails(){
        Map<String, String> userActionMap = new Map<String, String>();
        List<SetupAuditTrail> auditList = new List<SetupAuditTrail>();
        auditList = [SELECT Id, Action, Section, createdDate,CreatedById, CreatedBy.Name, Display
                     FROM SetupAuditTrail where CreatedDate = Today];
        for(SetupAuditTrail sat: auditList){
            if(userActionMap.containsKey(sat.CreatedById)){
                string temp = userActionMap.get(sat.CreatedById);
                temp +=', '+ sat.Display;
                userActionMap.put(sat.CreatedById, temp);
            }else{
                userActionMap.put(sat.CreatedById, sat.Display);
                List<string> lst = sat.Display.split(' ');
                system.debug('lst: '+lst);
            }    
        }
        return userActionMap;
    }
    public static void sendEmailToUser(){
        Map<string, string> userActionMap = getSetupModifyDetails();
        List<Messaging.SingleEmailMessage> messageses = new List<Messaging.SingleEmailMessage>();
        set<string> temp1 = userActionMap.keySet();
        List<String> temp = new List<String>(temp1);
        for(integer i = 0; i < temp.Size();i++){            
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.toAddresses = temp;
            email.subject = 'Changes Made by User Today';
            email.plainTextBody = userActionMap.get(temp[i]);
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