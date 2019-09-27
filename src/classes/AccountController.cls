public class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id, Name, Phone, Rating, Active__c FROM Account LIMIT 200];
    }
}