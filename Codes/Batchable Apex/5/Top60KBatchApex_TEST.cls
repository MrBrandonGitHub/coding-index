@isTest 
public with sharing class Top60KBatchApex_TEST {
    @isTest 
    public static void Top60KBatchApexMethod() {

        List<Top60K__c> List60K = new List<Top60K__c>();

        for(integer i=1; i<4; i++){

            Top60K__c inst60K = new Top60K__c();            
            inst60K.name = 'Batch Test' + i;
            if(i == 1) inst60K.X2020_Genel_S_ralamas__c = 50;
            if(i == 2) inst60K.X2020_Genel_S_ralamas__c = 200;
            if(i == 3) inst60K.X2020_Genel_S_ralamas__c = 800;
            if(i == 4) inst60K.X2020_Genel_S_ralamas__c = 0;

            List60K.add(inst60K);
        }

        if(List60K != null && List60K.size()>0){
            insert List60K;
        }

        test.startTest();
        Top60KBatchApex cls = new Top60KBatchApex();
        id jobIds = Database.executeBatch(cls,200);
        test.stopTest();




        
    }
}
