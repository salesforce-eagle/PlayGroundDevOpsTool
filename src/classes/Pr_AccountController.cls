public class Pr_AccountController {
@AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT
               Id, Name,Phone
               FROM Account LIMIT 200];
    }

    @AuraEnabled
    public static boolean updateAccounts(List<Account> editedAccountList){
        try{
            update editedAccountList;
            return true;
        } catch(Exception e){
            return false;
        }
    }
    /*
    
    @author : pk
@created : Dec 2018


interface Security_Authenticatable {
    
    public abstract void setNextAuthenticator(Security_authenticatable nextAuthentication); 
    public abstract Booelan authenticate(AuthenticationRequest request); 

}

public enum AuthenticationType {VIEW, CREATE, DELETE}

class AuthenticationRequest{
        SobjectType sobjType;
        List<Schema.SobjectField> fieldList;
        AuthenticationType authType;
}

class ESAPI_Authenticator implements Security_Authenticatable{
    private Security_Authenticatable nextAuthentication; 
  
    public void setNextAuthenticator(Security_authenticatable nextAuth) 
    { 
        nextAuthentication = nextAuth; 
    } 
    
    public Booelan authenticate(AuthenticationRequest request){
        
        // check authentication
        ESAPI_Authentication_Service esapi_service= new ESAPI_Authentication_Service();
                
        if(esapi_service.authenticate(request)){
            // if authentication succeeds check for the next validation - may be project specific?
            nextAuthentication.authenticate(request);
        }
        else{
            // else return false and break the chain of authetication
            return false;
        }
    }

}

class ProjectSpecific_Authenticator implements Security_Authenticatable{
    // will be specific to the project - if some business logic validation required
}


class ESAPI_Authentication_Service {
    
    public Boolean authenticate(AuthenticationRequest request){
        if(request.authType == AuthenticationType.VIEW){
            return isAuthorizedToView(request);
        }
        if(request.authType == AuthenticationType.CREATE){
            return isAuthorizedToCreate(request);
        }
        // and so on...
    
    }
    public Boolean isAuthorizedToView(AuthenticationRequest request){
        SecurityUtil.AccessController.isAuthorizedToView(request.sobjType,request.fieldList);
    }
    
    public Boolean isAuthorizedToCreate(AuthenticationRequest request>){
        SecurityUtil.AccessController.isAuthorizedToCreate(request.sobjType,request.fieldList);
    }

}


//maintain just one instance - singleton pattern
public class SecurityUtil{
    public static SFDCAccessController AccessController; 
    
    public static AccessController SFDCAccessController(){
        if(AccessController==null){
            AccessController = new SFDCAccessController();
        }
        return AccessController
    }
    

}
    */
}