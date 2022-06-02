Acc_DivInoUpd_Batch cls = new Acc_DivInoUpd_Batch();
Id jobIds = Database.executeBatch(cls,200);
system.debug('@@@:::'+jobIds);