/**	Author: Bibhudananda Dash
* 	Date: 26/04/2019
* 	Purpose: Update Account Object field based on some calculation on Contact object
*/
public with sharing class CalculateScoreClass {
    Account[] accounts;
    public static void callCalculateScore(Account[] accounts){// This method is placed to call the private method
        calculateScore1(accounts);
    }
    private static void calculateScore(Account[] accounts){//query ex: Select Id, Devbnd__Score_Account__c, (Select id, Devbnd__Score_Account__c from contacts) from account
        // assuming accounts will contain Contact data : as part of inner query  
        list<Account> lstAcc = new List<Account>();
        for(Account acc: accounts){
            //acc.Devbnd__Score_Account__c = 0;
            List<Contact> contactList = new List<Contact>();
            if(!acc.getSobjects('contacts').isEmpty()){
                contactList = acc.getSobjects('contacts');
                for(Contact cont : contactList){
                    if(acc.Devbnd__Score_Account__c == null)
                        acc.Devbnd__Score_Account__c = 0;// Assigne value as 0 to avoide null pointer, as the value is initilized as null
                    acc.Devbnd__Score_Account__c +=  cont.Score_Contact__c;
                }
                if(acc.Devbnd__Score_Account__c != 0)
                    acc.Devbnd__Score_Account__c = (acc.Devbnd__Score_Account__c)/contactList.size();
            }  
            lstAcc.add(acc);
        }
        update lstAcc;
    }
    private static void calculateScore1(Account[] accounts){
        list<Account> lstAcc = new List<Account>();
        integer count = 0;
        for(Account acc: accounts){
            acc.Devbnd__Score_Account__c = 0;// Making this null as we are evaluating the value with all the contact present, If old value preserved then we will have a diff result
            for(contact con : [Select Id, AccountId, Score_Contact__c from contact where AccountId =: acc.Id]){                
                acc.Devbnd__Score_Account__c +=  con.Score_Contact__c;
                count++;
            }
            if(acc.Devbnd__Score_Account__c != 0)
                acc.Devbnd__Score_Account__c = (acc.Devbnd__Score_Account__c)/count;
                //acc.Devbnd__Score_Account__c = (acc.Devbnd__Score_Account__c)/[Select count() from contact where AccountId =: acc.Id];
            lstAcc.add(acc);
            count = 0;
        }
        update lstAcc;
    }
}