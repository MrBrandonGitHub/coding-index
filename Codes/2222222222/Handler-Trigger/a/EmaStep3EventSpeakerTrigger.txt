trigger EmaStep3EventSpeakerTrigger on Event_Speaker__c (before insert, before update) {
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            EmaStep3EventSpeakerHandler.checkDuplicateSpeakerOnEvents(trigger.new);
        }
    }    
}