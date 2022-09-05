public with sharing class Top60K {
    public static void Top60KUpdate() {

        List<Top60K__c> Updlist60K = new List<Top60K__c>();
        List<Top60K__c> Top60K = [SELECT name, Rating__c, ihracat__c FROM Top60K__c];        

        if(Top60K != null && Top60K.size()>0){
            
            for(Top60K__c new60K : Top60K){
                if(new60K.ihracat__c >= 2000000000){
                    new60K.Rating__c = 'Hot';            
                }else if(1000000000 <= new60K.ihracat__c && new60K.ihracat__c < 2000000000){
                    new60K.Rating__c = 'Warm'; 
                }else if(new60K.ihracat__c < 1000000000){
                    new60K.Rating__c = 'Cold';
                }else{
                    new60K.Rating__c = 'Burada ne işin var!!';
                }
                Updlist60K.add(new60K);
            }            
        }
        if(Updlist60K != null && Updlist60K.size()>0){
        Update Updlist60K;
        }
        system.debug(Top60K.size());
    }
    
    public static void Top60KInsert(){
        
        List<Top60K__c> insrt60KList = new List<Top60K__c>();
        Top60K__c new60K;
        for(integer i=0; i<7500; i++){
            new60K = new Top60K__c();
            new60K.name = 'yeni'+i;

            insrt60KList.add(new60K);
            system.debug(new60K);
        }
        
        if(insrt60KList != null && insrt60KList.size()>0){
            insert insrt60KList;
        }
        
    }
    



}
