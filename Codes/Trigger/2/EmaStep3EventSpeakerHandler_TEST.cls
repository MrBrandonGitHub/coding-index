@isTest
public with sharing class EmaStep3EventSpeakerHandler_TEST {
    @testSetup
    static void prepareData(){

        Event_Organizer__c organizer = new Event_Organizer__c(name = 'Organizer1', 
                                                              Email__c = 'organizer1@gmail.com', 
                                                              Phone__c = '32313877211' );

        insert organizer;

        My_Event__c event = new My_Event__c(Event_Organizer__c = organizer.id,
                                            name = 'Test Event',
                                            Start_Date_Time__c = datetime.now().addDays(-14),
                                            End_Date_Time__c = datetime.now().addDays(14),
                                            Max_Seats__c = 12,
                                            Event_Type__c = 'Virtual',
                                            Live__c = true  );
        insert event;

        Speaker__c speaker1 = new Speaker__c(name = 'speaker 1',
                                             Email__c = 'speaker1@gmail.com',
                                             Phone__c = '3124123123'
                                             );
        Speaker__c speaker2 = new Speaker__c(name = 'speaker 2',
                                             Email__c = 'speaker2@gmail.com',
                                             Phone__c = '3127823123'
                                             );
        insert new List<Speaker__c>{speaker1, speaker2};

        insert new List<Event_Speaker__c>{My_Event__c = event.id, Speaker__c = speaker1.id};

    }

    @isTest 
    static void testPositive(){
        Event_Speaker__c eventSpeaker = [SELECT My_Event__c, Speaker__c FROM Event_Speaker__c LIMIT 1];
        Boolean isFailed = false;
        try{
            Event_Speaker__c newRecord = new Event_Speaker__c(My_Event__c = eventSpeaker.My_Event__c, Speaker__c = eventSpeaker.Speaker__c);
        }catch(Exception e){
            isFailed = true;
        }
        System.assert(isFailed);
    }

    @isTest
    static void testNegative(){
        My_Event__c event = [SELECT id FROM My_Event__c WHERE name = 'Test Event' LIMIT 1];
        Speaker__c speaker2 = [SELECT id FROM Speaker__c WHERE name = 'Speaker 2' LIMIT 1];

        Event_Speaker__c newEventSpeaker = new Event_Speaker__c(My_Event__c = event.id, Speaker__c = speaker2.id);
        insert newEventSpeaker;
    }   
}
