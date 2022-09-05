public with sharing class EmaStep3EventSpeakerHandler {
    public static vod checkDuplicateSpeakerOnEvents(List<Event_Speaker__c> eventSpeakers) {
        // amaç şu: hem event in hem de speaker ın id sini birleştirip 36 haneli bir değer oluşturmak
        // bu 36 haneli değer eğer duplicate olacaksa sistem hata verecek. 
        // yani o event e ait bir speaker dan farklı bir speaker insert edildiğinde problem olmayacak.
        // ama o event e insert edilen speaker bir daha insert edildiğinde 36 haneli değer duplicate olacağı için hata alınacak
        // 36 haneli variable = My_Event__c + Speaker__c yani = "a038d000003UsVFAA0""a048d000003ZpB5AAK"

        //Set<String> uniqueKeys = new Set<String>();
        Map<String, Event_Speaker__c> eventSpeakersMap = new Map<String, Event_Speaker__c>();
        Set<id> eventIds = new Set<id>();
        Set<id> speakerIds = new Set<id>();

        for(Event_Speaker__c es : eventSpeakers){
            String uniqueKey = String.valueOf(es.My_Event__c) + String.valueOf(es.Speaker__c);
            //uniqueKeys.add(uniqueKey);            
            eventSpeakersMap.put(uniqueKey, es);

            eventIds.add(es.My_Event__c);
            speakerIds.add(es.Speaker__c);
        }

        List<Event_Speaker__c> onSystemRecords = [SELECT My_Event__c, Speaker__c
                                            FROM Event_Speaker__c
                                            WHERE My_Event__c IN: eventIds
                                            AND Speaker__c IN: speakerIds];

        for(Event_Speaker__c sys : onSystemRecords){
            String uniqueKey = String.valueOf(es.My_Event__c) + String.valueOf(es.Speaker__c);
            Event_Speaker__c checkingObject = eventSpeakersMap.get(uniqueKey);

            if(checkingObject == null) continue;

            checkingObject.addError('Found a duplicate Event Speaker record on the system with id: ' + String.valueOf(sys.id));
        }
    }
}
