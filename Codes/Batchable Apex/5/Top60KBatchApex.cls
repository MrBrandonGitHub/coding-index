global class Top60KBatchApex implements Database.Batchable<sObject> , Database.Stateful {
    // global void execute(SchedulableContext sc) {
    // Database.executeBatch(this);

    Integer intNumOfBatch = 0;
    Integer intNumOfRec = 0; 

    global Database.QueryLocator  start(Database.BatchableContext bc) {
        return Database.getQueryLocator([Select name, Rating__c, X2020_Genel_S_ralamas__c from Top60K__c]);
    }
    global void execute(Database.BatchableContext bc, List<Top60K__c> scope){
        
        List<Top60K__c> lstUpdRcds = new List<Top60K__c>();
        if(scope != null && scope.size()>0){
            for(Top60K__c rcd : scope){
                if(0<rcd.X2020_Genel_S_ralamas__c && rcd.X2020_Genel_S_ralamas__c < 100){
                    rcd.Rating__c = 'Hot Hot';                    
                } else if(100 < rcd.X2020_Genel_S_ralamas__c && rcd.X2020_Genel_S_ralamas__c <= 500){
                    rcd.Rating__c = 'Warm Warm';
                }else if(rcd.X2020_Genel_S_ralamas__c > 500){
                    rcd.Rating__c = 'Cold Cold';
                }else{
                    rcd.Rating__c = 'Burada ne işin var!';
                }
                lstUpdRcds.add(rcd);
                intNumOfRec++;
            }
            intNumOfBatch++;
        }
        if(lstUpdRcds != null){
            //system.debug('@@@:: size::'+lstUpdRcds.size());
            update lstUpdRcds;
        }
    }
    global void finish(Database.BatchableContext bc){
        System.debug('@@@@::::: Number of batches : ' + intNumOfBatch);
        System.debug('@@@@::::: Number of records : ' + intNumOfRec);
    }
}






// VAROLAN RECORDLARI SİL

// global class Top60KBatchApex implements Database.Batchable<sObject> , Database.Stateful {
//     Integer intNumOfBatch = 0;
//     Integer intNumOfRec = 0; 

//     global Database.QueryLocator  start(Database.BatchableContext bc) {
//         return Database.getQueryLocator([Select name, Rating__c from Top60K__c where rating__c = 'Burada ne işin var!' ]);
//     }
//     global void execute(Database.BatchableContext bc, List<Top60K__c> scope){
      
//         List<Top60K__c> lstUpdRcds = new List<Top60K__c>();
//         if(scope != null && scope.size()>0){
//             for(Top60K__c rcd : scope){
                
//                 lstUpdRcds.add(rcd);
//                 intNumOfRec++;
//             }
//             intNumOfBatch++;
//         }
//         if(lstUpdRcds != null){
//             system.debug('@@@:: size::'+lstUpdRcds.size());
//             delete lstUpdRcds;
//         }
//     }
//     global void finish(Database.BatchableContext bc){
//         System.debug('@@@@::::: Number of batches : ' + intNumOfBatch);
//         System.debug('@@@@::::: Number of records : ' + intNumOfRec);
//     }
// }

