public class updAcc_QueApex implements System.Queueable {
    List<Account> lstAccRcds = new List<Account>();
    List<Account> lstAccUpd = new List<Account>();
    public updAcc_QueApex(List<Account> lstAcc) {
        if(lstAcc != null) {
            lstAccRcds = lstAcc;
        }
    }
    public void execute(QueueableContext context) {
        if(lstAccRcds != null && lstAccRcds.size()>0){
            for(Account acc : lstAccRcds){
                acc.Name = 'QUEUE BATCH ACC with CONTACT';     //Assignment
                //TEST QUEUEABLE BATCH UPDATE FROM QUEUEABLE - old value
                lstAccUpd.add(acc);
            }
            if(lstAccUpd != null){
                update lstAccUpd;
            }
            //Call other queueable apex - insrtCon_QueApex
            
           // if(!test.isRunningTest()){
                insrtCon_QueApex cls = new insrtCon_QueApex(lstAccUpd);
                Id jobId = system.enqueueJob(cls);
                system.debug('@@@:job ID::::'+jobId);
           // }
        }
    }
}