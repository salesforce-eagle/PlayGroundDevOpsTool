global class MultipleObjectUpdateBatchClass implements Database.Batchable<Object> {
    global string queryString = '';
    public MultipleObjectUpdateBatchClass(List<String> nameOfObjects){
        queryString += 'FIND {rec*} IN ALL FIELDS RETURNING ';
        for(String str : nameOfObjects){
            queryString += str+',';
        }
        queryString = queryString.removeEnd(',');
    }
    public Iterable<Object> start(Database.BatchableContext bc) {
        List<List<sObject>> returnList = search.query(queryString);
        system.debug('In Start: '+returnList);        
        return (Iterable<Object>)returnList;
    }
    public void execute(Database.BatchableContext bc, List<Object> scope){
        system.debug('scope: ');
        system.debug('scope: '+scope);
    }
    public void finish(Database.BatchableContext bc){}
}