// this will help in inserting an account record as Demo
public class myQueuExample1 implements System.Queueable {
    //Execute method - help in handling major logic
    public void execute(QueueableContext context) {
        //Main Logic step starts
        List<Account> lstAcc = new List<Account>();
        Account acc = new Account();
        acc.Name = 'TEST QUEUEABLE BATCH';
        lstAcc.add(acc);
        if(lstAcc!= null & lstAcc.size()>0) insert lstAcc;
    }
}

