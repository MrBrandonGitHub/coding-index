
    @isTest
    public with sharing class Acc_DivInoUpd_Batch_Test {
        @isTest
        public static void myMethod1() {
            //Test data
            List<Account> lstAcc = TestDataClass.crtAccDepCode();
            if(lstAcc != null){
                insert lstAcc;
            }
            test.startTest();
            Acc_DivInoUpd_Batch cls = new Acc_DivInoUpd_Batch();
            Id jobIds = Database.executeBatch(cls,200);
            test.stopTest();
        }
    }

