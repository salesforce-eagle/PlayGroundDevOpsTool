global class BatchClassLearning implements Database.batchable<sObject>, Database.Stateful{
    public List<string> trackErrorList;
    public List<string> trackSuccessList;
    global Iterable<sObject> start(Database.BatchableContext info){
        List<Contact> accDetails = [Select Id, Devbnd__Languages__c, AccountId, Name from Contact where AccountId != null];
        List<sObject> updateDetails = new List<Contact>();
        for(contact con: accDetails){
            con.Devbnd__Languages__c = con.Devbnd__Languages__c+con.AccountId;
            updateDetails.add(con);
        }
        return updateDetails;
    }     
    global void execute(Database.BatchableContext info, List<sObject> scope){
        trackErrorList = new List<string>();
        trackSuccessList = new List<string>();
        if(!scope.isEmpty()){
            /**	Database.Update	**/
            Database.SaveResult[] dsr = Database.update(scope, false);
            for(Database.SaveResult ds : dsr){
                if(!ds.isSuccess()){
                    for(Database.Error err : ds.getErrors()){
                        trackErrorList.add(err.getMessage());
                    }
                }else{
                    trackSuccessList.add('Success Is here'+ds);
                }                
            }
/*            try{
update scope;
}catch(Exception e){
trackErrorList.add(e.getMessage());
}finally{

}*/
        }
    }     
    global void finish(Database.BatchableContext info){
        system.debug('Success Messages are: '+trackErrorList);
        system.debug('Error Messages are: '+trackErrorList);
    } 
}