public with sharing class trgGstRecordHandler {
    public static void afterUpdateMethod(List<GST_Records__c> newRecord){
        for(GST_Records__c eachGst : newRecord){
            if(eachGst.name.length() == 15){
                futureMethodGst.getGstInfo(eachGst.Id);
            }
        }
    }
}
