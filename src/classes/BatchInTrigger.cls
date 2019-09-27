public class BatchInTrigger implements Database.Batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        string query = 'Select Id, Name from Account where Name Like \'%TestData%\'';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc , List<sObject> scope){
        
    }
    public void finish(Database.BatchableContext BC){}
}