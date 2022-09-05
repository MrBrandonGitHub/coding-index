myQueuExample1 cls = new myQueuExample1();
Id jobId = system.enqueueJob(cls);
system.debug('@@@:::'+jobId);



List<asyncApexjob> rcd = [Select id,status from asyncApexjob where id =: jobId];
System.debug('@@@::rcd:::'+rcd);