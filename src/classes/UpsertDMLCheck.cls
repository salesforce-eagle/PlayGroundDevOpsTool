public with sharing class UpsertDMLCheck {
    // Concedring Account(ObjectA) and Contact(ObjectB)
    public static void checkMethod(){
        Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, Name, (Select id, LastName from contacts) from Account LIMIT 2500]);
			system.debug('I am: '+accountMap.size());
    }
}