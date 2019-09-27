@isTest
public class LeadTriggerTestClass {
    static testMethod void testDuplicatePhone() {
        Id customerRecTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Customer').getRecordTypeId();
    	Id driverRecTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Driver').getRecordTypeId();
        
        // create a customer lead rec
        Lead l1 = new Lead();
        l1.LastName = 'Smith';
        l1.company = 'BlueDart';
        l1.MobilePhone = '667799988';
        l1.RecordTypeId = customerRecTypeId;
        insert l1;
        
        //create second customer lead rec
        Lead l2 = new Lead();
        l2.LastName = 'James';
        l2.company = 'Omega';
        l2.MobilePhone = '667799988';
        l2.RecordTypeId = customerRecTypeId;
        try{
          insert l2;  
        }catch(Exception e){
            System.debug('e.getMessage(): '+e.getMessage());
            Boolean expectedExceptionThrown =  e.getMessage().contains('Duplicate not allowed') ? true : false;
			System.AssertEquals(expectedExceptionThrown, true);
        }
        
        //now provide a different mobile no for second customer lead rec
        Lead l3 = new Lead();
        l3.LastName = 'James';
        l3.company = 'Omega';
        l3.MobilePhone = '12345671';
        l3.RecordTypeId = customerRecTypeId;
        insert l3;
        
        //now update the mobile no to 667799988 to
        try{
            l3.MobilePhone = '667799988';
            update l3;
        }catch(Exception e){
            System.debug('e.getMessage(): '+e.getMessage());
            Boolean expectedExceptionThrown =  e.getMessage().contains('Duplicate not allowed') ? true : false;
			System.AssertEquals(expectedExceptionThrown, true);
        }
        
    }
}