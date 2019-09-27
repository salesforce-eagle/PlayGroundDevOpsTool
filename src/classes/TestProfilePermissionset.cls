public class TestProfilePermissionset {
    
    public void TestMetho()
    {
        List<Profile> profileList =[Select Id, Name, (Select Id, Name From Users) From Profile];
        Map<Id, List<User>> UserMap = new Map<Id, List<User>>();
        
        Map<String, List<String>> ProfilePermissionSetMap = new Map<String, List<String>>();
        
        for(profile p: profileList)
        {
            list<String> permissionSetString = new List<String>();
            If(p.Name.equals('System Administrator'))
            {
                permissionSetString.add('0PS6F000001tYwU');
                ProfilePermissionSetMap.put('System Administrator', permissionSetString);
            }
        }
        
        For(profile pk : profileList)
        {
            If(pk.Name.equals('System Administrator')){
                List<PermissionSetAssignment> listPermission = new List<PermissionSetAssignment>();
            for(User usk : pk.getSobjects('Users'))
            {
                
            }
        }
        }
    }    
}