public class ChildObjectContorller {
    @AuraEnabled
    public static void updateAttribute(Id recordIdVal){
        Map<String, Id> recordTypeMap = new Map<String, Id>();
        Devbnd__Child_Object__c objDetsila = [Select Id, recordTypeId, recordType.Name 
                                              from Devbnd__Child_Object__c where Id =: recordIdVal];
        List<RecordType> recTypId = [SELECT Id, Name, DeveloperName, SobjectType, IsActive 
                                     FROM RecordType where SobjectType ='Devbnd__Child_Object__c'];
        for(RecordType rc : recTypId){
            recordTypeMap.put(rc.Name, rc.Id);
        }
        if(recordTypeMap.containsKey(objDetsila.recordType.Name)){
            if(objDetsila.recordType.Name == 'RecordType1'){
                objDetsila.recordTypeId = recordTypeMap.get('RecordType2');
            }else if(objDetsila.recordType.Name == 'RecordType2'){
                objDetsila.recordTypeId = recordTypeMap.get('RecordType3');
            }else if(objDetsila.recordType.Name == 'RecordType3'){
                objDetsila.recordTypeId = recordTypeMap.get('RecordType1');
            }
        }
        update objDetsila;
    }
}