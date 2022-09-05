public class Acc_DivInoUpd_Batch implements Database.Batchable<SObject> {
    public Database.QueryLocator  start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        String query = 'Select id,name,Department_Code__c,Division_Info__c from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        List<Account> lstAcc = new List<Account>();
        if(scope != null && scope.size()>0){
            for(Account acc:scope){
                if(acc.Department_Code__c == '100'){
                    acc.Division_Info__c = 'Admin';
                }else if(acc.Department_Code__c == '200'){
                    acc.Division_Info__c = 'HR';
                }else if(acc.Department_Code__c == '300'){
                    acc.Division_Info__c = 'Electrical';
                }else if(acc.Department_Code__c == '500'){
                    acc.Division_Info__c = 'Mechanical';
                }else if(acc.Department_Code__c == '900'){
                    acc.Division_Info__c = 'Finance';
                }else{
                    acc.Division_Info__c = 'Others';
                }
                lstAcc.add(acc);
            }
        }
        if(lstAcc != null){
            update lstAcc;
        }
    }
    public void finish(Database.BatchableContext bc){
        
        //  Cont_CreatePrimary_Batch class ı için. ikinci örnek için yani
        Cont_CreatePrimary_Batch cls = new Cont_CreatePrimary_Batch();
        Id jobIds = Database.executeBatch(cls,200);
        system.debug('@@@:::'+jobIds);
    }
    }
