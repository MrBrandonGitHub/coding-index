/**
 * @ Author: Your name
 * @ Create Time: 2022-06-03 00:04:58
 * @ Modified by: Your name
 * @ Modified time: 2022-06-03 00:13:29
 * @ Description: While creating an account record if Rating is Hot and Ownership(field) is public then 1 child Opportunity record should be created as the same name of account name.
 * Account kaydı oluşturulurken Rating'i Hot ve Ownership'i public ise Account adı ile aynı isimle 1 adet child Opportunity kaydı oluşturulmalıdır.
  
 
// User Action :-  While creating an account record if Rating is Hot and Ownership(field) is public.
// Trigger Action:- 1 child Opportunities record should be created as the same name of account name.
// sObject :- Account :_ User Action
// Trigger Type :- After Trigger :_ User Action
// Trigger Event :-  It is Depends upon User Action :- After Insert

*/
trigger trgAcount on Account (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(trigger.isBefore && trigger.isInsert){
       trgAccountHandler.beforeInsert(trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert){
        trgAccountHandler.afterInsert(trigger.new);
    }
}
//Reason :- 1.) trigger required 1% of code coverage where apex class required atleast 75% code coverage to deployee in production
// 2.) Code reusebily :- less number of lines of code