@isTest
private class trgAccount_Test {
    @isTest static void unitTest1(){
       Account acc = new Account();
        acc.Name = 'Test';
        acc.Rating = 'Hot';
        acc.Ownership = 'Public';
        insert acc;
        Account accObj = [SELECT id,Industry FROM Account WHERE Id =: acc.Id ];
        System.assertEquals('Banking', accObj.Industry);
        List<Opportunity> oppList = [SELECT Id,Name FROM Opportunity WHERE AccountId =: acc.Id];
        System.assertEquals(acc.Name, oppList[0].Name);
    }
}