public class Cont_CreatePrimary_Batch implements Database.Batchable<SObject> {
    public Database.QueryLocator  start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        String query = 'Select id,name,Department_Code__c,Division_Info__c from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        List<Contact> lstContRcds = new List<Contact>();
        if(scope != null && scope.size()>0){
            for(Account acc : scope){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                con.Is_Primary__c = true;
                lstContRcds.add(con);
            }
        }
        if(lstContRcds != null){
            insert lstContRcds;
        }
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        Cont_CreatePrimary_Batch cls = new Cont_CreatePrimary_Batch();
        Id jobIds = Database.executeBatch(cls,200);
        system.debug('@@@:::'+jobIds);
}
}