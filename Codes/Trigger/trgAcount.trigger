/**
 * @ Author: Trailhead: https://sforce.co/3wTQFPM
 * @ Create Time: 2022-05-31 20:15:07
 * @ Modified by: Your name
 * @ Modified time: 2022-05-31 21:32:03
 * @ Description: while creating account record if rating is hot then Industry field must be update as Banking.
 *  Account kaydı oluşturulurken Rating'i Hot ise Industry'si Banking olarak güncellenmelidir.
 *  // User Action :- while creating account record if rating is hot
 *  // Trigger Action :- Industry field must be update as Banking.
 *  // sObject Name :- Account  :- User Action Object
 *  // Trigger Type :- Before Trigger
 *  // Trigger Event :-  Before Insert :- User Action
 *  // Context Variable :- trigger.new (List<Account>)

 */


trigger trgAcount on Account (before insert,before update,before delete,after insert) {
    if(trigger.isBefore && trigger.isInsert){
        for(Account acc : trigger.new){
            if(acc.Rating == ‘Hot’){
                System.debug(‘----before Insert-’+acc);
                acc.Industry = ‘Banking’;
            }
        }
    }
    if(trigger.isAfter && trigger.isInsert){
        List<Account> lstAccount = new List<Account>();
        Set<Id> setOfId = new Set<Id>();
        for(Account acc : trigger.new){
            setOfId.add(acc.Id);
        }
        lstAccount = [SELECT Id ,Industry  FROM Account WHERE Id IN : setOfId ];
        for(Account acc : lstAccount){
            acc.Industry = ‘Banking’;
        }
        update lstAccount;
    }
}
// record will insert