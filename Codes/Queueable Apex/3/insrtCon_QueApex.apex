List<Account> lstAcc = [Select id,Name from Account where Name = 'TEST QUEUEABLE BATCH UPDATE FROM QUEUEABLE'];
System.debug('@@@::lst:::'+lstAcc);
updAcc_QueApex cls = new updAcc_QueApex(lstAcc);
Id jobId = system.enqueueJob(cls);