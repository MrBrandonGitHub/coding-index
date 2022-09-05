public with sharing class Top60KBatchSchedulable implements Schedulable{

    public void execute(SchedulableContext sc) {

        Top60KBatchApex cls = new Top60KBatchApex();                       
        id jobId = Database.executeBatch(cls, 200);
    }
        
}



    // global void execute(SchedulableContext sc) {
    // Database.executeBatch(this);
    //}    