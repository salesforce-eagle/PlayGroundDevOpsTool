public class TestController {
    @AuraEnabled
    public static List<Contact> getObjectList(List<Id> accountIds) {
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Email, Phone, AccountId FROM Contact WHERE AccountId in :accountIds];
        return contactList;
    }
    
}