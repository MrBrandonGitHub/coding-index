@isTest
public with sharing class Acc_DivInoUpd_Schedulable_Test {
    @istest
    public static void Schedulable_Test1() {
    
        List<Account> lstAcc = TestDataClass.crtAccDepCode();
        if(lstAcc != null){
            insert lstAcc;
        }

        Acc_DivInoUpd_Schedulable cls = new Acc_DivInoUpd_Schedulable();
        String sch = '20 30 8 10 2 ?';
        test.startTest();
        system.schedule('Acc Division Info Update2', sch, cls);
        test.stopTest();

    }
}