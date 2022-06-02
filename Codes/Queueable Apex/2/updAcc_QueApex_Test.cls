@isTest
public class updAcc_QueApex_Test {
    @isTest
    public static void method1() {
        List<Account> lstAcc = new List<Account>();
        Account acc = new Account();
        acc.Name = 'TEST QUEUE';
        lstAcc.add(acc);
        insert lstAcc;
        test.startTest();
        //updAcc_QueApex
        updAcc_QueApex cls = new updAcc_QueApex(lstAcc);
        Id jobId = system.enqueueJob(cls);
        system.assertNotEquals('0', jobId);
        test.stopTest();
    }
    @isTest
    public static void method2(){
        List<Account> lstAcc = new List<Account>();
        Account acc = new Account();
        acc.Name = 'TEST QUEUE';
        lstAcc.add(acc);
        insert lstAcc;
        test.startTest();
        insrtCon_QueApex cls = new insrtCon_QueApex(lstAcc);
        System.enqueueJob(cls);
        List<Contact> lstCon = [Select id,lastName from Contact where lastname='TEST QUEUE'];
        //Test cases
        system.assertEquals(1, lstCon.size());
        
        test.stopTest();

        
    }
}