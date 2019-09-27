global class EmailServicesAccountCreation implements Messaging.InboundEmailHandler{
    global string emailAddress;
    global string phoneNumber;
    EmailServicesAccountCreation(string emailAddress, string phoneNumber){
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
    }
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                                                           Messaging.InboundEnvelope envelope)
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();        
        Account acc = new Account();
        acc.Name = email.fromname.substring(0, email.fromname.indexOf(' '));
        acc.Phone = phoneNumber;        
        insert acc;
        system.debug('result: '+result);
        return result;
    }
}