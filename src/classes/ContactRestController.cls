@RestResource(urlMapping='/ContactRest/*')
global with sharing class ContactRestController {   
    @HttpPost
    global static string createContactRecord(String firstName, String lastName, String email, String phone){
        contact newContact = new contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email,
            Phone = phone
        );
        Database.SaveResult insertContactResult = Database.insert(newContact);
        if(insertContactResult.isSuccess()){
            return string.valueOf(insertContactResult.getId());
        }
        return null;
    }
    @HttpGet
    global static contact fetchContactById(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        system.debug('resp: '+resp);
        Id contactId = req.requestURI.subString(req.requestURI.lastIndexOf('/')+1);
        return [Select Id, LastName, FirstName, Email, Phone from Contact where Id= :contactId];
    }
}