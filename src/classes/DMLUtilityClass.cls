/**
* Purpose: This class will be use for all kind of DML operations.
* 
* **/
public class DMLUtilityClass {
    //public static Map<Id, List<String>> mapList = new TreeMap<Id, List<String>>();
    Public Class ErrorWrapper{
        Public string dmlMode;
        Public String errorMessage;
        Public Integer lineNumber;
        Public String stackTracing;
        Public string errorType;
        Public string queryResult;
    }    
    Public static ErrorWrapper errRap = new ErrorWrapper();
    Public static Integer count= 0;
    Public static Integer recordCount;
    
    public static ErrorWrapper insertDML(List<sObject> sObjectList){
        try{
            insert sObjectList;
        }catch(Exception e){            
            errRap.errorMessage = e.getMessage();
            errRap.lineNumber = e.getLineNumber();
            errRap.stackTracing = e.getStackTraceString();
            errRap.errorType = e.getTypeName();
            errRap.queryResult = 'Failure';
        }finally{
            if(errRap.queryResult != 'Failure'){
                errRap.queryResult = 'Success';
            }
        }
        system.debug('Result: '+errRap.queryResult);
        return errRap;
    }
    public static ErrorWrapper databaseInsert(List<sObject> sObjectList,boolean ispartialInsert, boolean isRollBack){        
        if(isRollBack){
            Savepoint sp = Database.setSavepoint();
            Database.SaveResult[] resultData = Database.insert(sObjectList, ispartialInsert);
            for(Database.SaveResult dsr : resultData){
                if(dsr.isSuccess()){
                    system.debug('Passing'+dsr.getId());
                    errRap.queryResult = 'All records saved Successfully'+dsr.getId();
                }else{
                    for(Database.Error der : dsr.getErrors()){
                        system.debug('Failing');                    
                    }
                }
            }
            Database.rollback(sp);
        }else{
            Database.SaveResult[] resultData = Database.insert(sObjectList, ispartialInsert);
            recordCount = resultData.size();
            for(Database.SaveResult dsr : resultData){
                if(dsr.isSuccess()){
                    count++;
                    system.debug('Passing'+dsr.getId());
                    errRap.queryResult = 'All records saved Successfully'+dsr.getId();
                }else{
                    for(Database.Error der : dsr.getErrors()){
                        system.debug('Failing');                    
                    }
                }
            }
        }
        System.debug('Success Count is: '+count+' Failure Count is '+(recordCount-count));
        count = 0;
        recordCount = 0;
        return errRap;
    }    
}