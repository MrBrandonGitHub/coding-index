/**
 * @ Author: Your name
 * @ Create Time: 2022-06-03 00:04:58
 * @ Modified by: Your name
 * @ Modified time: 2022-06-03 01:33:26
 * @ Description: While creating an account record if Rating is Hot and Ownership(field) is public then 1 child Opportunity record should be created as the same name of account name.
 * Account kaydı oluşturulurken Rating'i Hot ve Ownership'i public ise Account adı ile aynı isimle 1 adet child Opportunity kaydı oluşturulmalıdır.
  
 
// User Action :-  While creating an account record if Rating is Hot and Ownership(field) is public.
// Trigger Action:- 1 child Opportunities record should be created as the same name of account name.
// sObject :- Account :_ User Action
// Trigger Type :- After Trigger :_ User Action
// Trigger Event :-  It is Depends upon User Action :- After Insert
 */

public class trgAccountHandler {
    //When Ever user hit save button and process get completed before record inserted from database
    public static void beforeInsert(List<Account> newAccount){
        for(Account acc : newAccount){
            if(acc.Rating == 'Hot'){
                acc.Industry = 'Banking';
            }
        }
    }
    // Record has been inserted
    public static void afterInsert(List<Account> newAccount){
        List<Opportunity> lstOpp = new List<Opportunity>();
        for(Account acc : newAccount){
            if(acc.Rating == 'Hot' && acc.Ownership == 'Public'){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.Id;
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.newInstance(2022,02,02);
                lstOpp.add(opp);
            }
        }
        insert lstOpp;
    }
}