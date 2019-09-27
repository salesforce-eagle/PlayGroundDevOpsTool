/**
 * Purpose: Use this class to create query dynamically by passing the field API Name
**/
public class SOQLUtilityClass {
    public static List<sObject> getSOQLQueryResult(string objectName, List<String> fieldAPIValues, Id recordId, String filterCondition, Integer recordLimit){
        String query = 'Select ';
        for(String fld : fieldAPIValues){
            query += fld;
            query += ', ';
        }
        query = query.substring(0, query.length() - 2);
        query += ' From '+objectName;
        query += ' Where '+filterCondition;
        query += ' LIMIT '+recordLimit;
        return Database.query(query);
    }
    public static List<sObject> getSOQLQueryResult(string objectName, List<String> fieldAPIValues, Id recordId, Integer recordLimit){
        String query = 'Select ';
        for(String fld : fieldAPIValues){
            query += fld;
            query += ', ';
        }
        query = query.substring(0, query.length() - 2);
        query += ' From '+objectName;
        query += ' Where Id =: '+recordId;
        query += ' LIMIT '+recordLimit;
        return Database.query(query);
    }
    public static List<sObject> getSOQLQueryResult(string objectName, List<String> fieldAPIValues){
        String query = 'Select ';
        for(String fld : fieldAPIValues){
            query += fld;
            query += ', ';
        }
		query = query.substring(0, query.length() - 2);
        query += ' From '+objectName;
        return Database.query(query);
    }
    
    Public static Map<String, List<List<Sobject>>> getSOSLQueryResult(string searchString){
        return null;
    }
}