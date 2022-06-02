public class insrtCon_QueApex implements System.Queueable {
    List<Account> lstAccRcds = new List<Account>();
    List<Contact> lstConRcds = new List<Contact>();
    //Constructor - has list of Account records as parameter
    public insrtCon_QueApex(List<Account> lstAcc){
        if(lstAcc!=null) lstAccRcds = lstAcc;
    }
    //Execute method
    public void execute(QueueableContext context) {
        //Main logic
        if(lstAccRcds != null){
            for(Account acc: lstAccRcds){
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.id;
                lstConRcds.add(con);
            }
            if(lstConRcds != null){
                insert lstConRcds;
            }
        }
    }
}