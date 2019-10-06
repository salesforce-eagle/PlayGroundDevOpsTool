public class YashRajClass {
    
    Public class WrapperClass{
        public string objectName;
        public Address userAddress;
    }
    public static WrapperClass wc = new WrapperClass();
    public static Map<Id, WrapperClass> initMethod(){
        Devbnd__Object_A__c tempData = [Select Name, OwnerId from Devbnd__Object_A__c where Id = 'a056F000011bxGUQAY' LIMIT 1];
        User userData =  [Select Id, Address from User Where Id =: tempData.OwnerId];
        wc.objectName = tempData.Name;
        wc.userAddress = userData.Address;
        Map<Id, WrapperClass> finalMap = new Map<Id, WrapperClass>();
        finalMap.put(tempData.OwnerId, wc);
        system.debug('finalMap: '+finalMap);
        return finalMap;
    }  
}