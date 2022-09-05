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
                acc.Name = acc.Name + ' UPDATE FROM QUEUEABLE';
                    //TEST QUEUEABLE BATCH UPDATE FROM QUEUEABLE
                lstAccUpd.add(acc);
            }
            if(lstAccUpd != null){
                update lstAccUpd;
            }
        }
    }
}