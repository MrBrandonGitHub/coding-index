public with sharing class Acc_DivInoUpd_Schedulable implements Schedulable{

    public void execute(SchedulableContext sc) {
        Acc_DivInoUpd_Batch cls = new Acc_DivInoUpd_Batch();
        id jobId = Database.executeBatch(cls, 10);
    }

}