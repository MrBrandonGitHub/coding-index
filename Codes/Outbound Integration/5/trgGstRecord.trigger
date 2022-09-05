trigger trgGstRecord on GST_Records__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        trgGstRecordHandler.afterUpdateMethod(trigger.new);
    }
}