/**
* Access properties of Apex class dynamically example
**/
public class InnerClassShorting extends DynamicApexProp {
    Public InnerClassShorting(){
        system.debug('Describe Data Formate is : '+getObjectSchema(new String[]{'Account'}));
    }    
}