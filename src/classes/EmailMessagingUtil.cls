public with sharing  class EmailMessagingUtil {
    public static void sendEmail(String [] addresses, String [] subjects, String [] messages){
        Messaging.SingleEmailMessage[] emails = new Messaging.SingleEmailMessage[]{};
            if(!addresses.isEmpty()){
                for(integer i = 0; i < addresses.size(); i++){
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    email.setSubject(subjects[i]);
                    email.setToAddresses(new List<String> { addresses[i] });
                    email.setPlainTextBody(messages[i]);
                    emails.add(email);
                }
            }
        Messaging.sendEmail(emails);
    }
}