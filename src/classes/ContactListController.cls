public class ContactListController {
    
    @AuraEnabled
    public static List<Contact> getContactList(List<Id> accountIds) {
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Email, Phone, AccountId FROM Contact WHERE AccountId in :accountIds];
        return contactList;
    }
    
    @AuraEnabled
    public static Map<String,String> saveContactList(List<Contact> contactList) {
        Map<String,String> resultMap = new Map<String,String>();
        try {
            update contactList;
            resultMap.put('status', 'success');
            resultMap.put('message', 'Contacts Updated Successfully');        
        }
        catch(Exception e) {
            resultMap.put('status', 'error');
            resultMap.put('message',e.getMessage());
        }
        return resultMap;
    }
    @AuraEnabled
    public static Map<String, String> createContactRecord(Contact newContact) {
        Map<String,String> resultMap = new Map<String,String>();
        // Adding try catch for exception handling
        try {
            // Inserting the Contact
            insert newContact;
            // Setting the success status and message in resultMap
            resultMap.put('status', 'success');
            resultMap.put('message', 'Contact Inserted Successfully');        
        }
        catch(Exception e) {
            // Setting the error status and message in resultMap
            resultMap.put('status', 'error');
            resultMap.put('message',e.getMessage());
        }
        // Returning the result string map
        return resultMap;        
    }
}