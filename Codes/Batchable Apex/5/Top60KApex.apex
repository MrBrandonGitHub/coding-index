

// Batch için
Top60KBatchApex new60K = new Top60KBatchApex();
id batchId = Database.executeBatch(new60K, 2000); //Default değeri 200
// id batchId = Database.executeBatch(new Top60KBatchApex(), 2000); // şeklinde de tek satırda yazılır



