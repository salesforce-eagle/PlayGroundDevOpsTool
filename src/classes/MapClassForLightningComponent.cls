public class MapClassForLightningComponent {
    
    @AuraEnabled
    public static Map<String, List<String>> getObjectAndFieldDetails()
    {
        Map<String, List<String>> MapOfObjectandField = new Map<String, List<String>>();
        List<String> collectField = new List<String>();
        For(Devbnd__Store_Object_Values__mdt cmtd: [Select Devbnd__Fields_Name__c, Devbnd__Object_Name__c from Devbnd__Store_Object_Values__mdt])
        {            
            If(cmtd.Devbnd__Fields_Name__c != Null )
            {
                collectField.addAll(cmtd.Devbnd__Fields_Name__c.Split(','));
            } 
            MapOfObjectandField.put(cmtd.Devbnd__Object_Name__c, collectField);
        }
        system.debug('collectField -->'+collectField);
        system.debug('collectField Size -->'+collectField.Size());
        system.debug('MapOfObjectandField -->'+MapOfObjectandField);
        system.debug('MapOfObjectandField Size -->'+MapOfObjectandField.Size());
        return MapOfObjectandField;
    }
    @AuraEnabled
    public static List<Devbnd__Store_Object_Values__mdt> getListOfElements()
    {
        List<Devbnd__Store_Object_Values__mdt> collectField = [Select Devbnd__Fields_Name__c, Devbnd__Object_Name__c from Devbnd__Store_Object_Values__mdt];
        return collectField;
    }

}