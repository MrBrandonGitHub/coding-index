public with sharing class testWrapperClass {
    public static void wrapperTest(){
        Account acc = new Account();
        acc.Name = 'Vishal Singh2';
        acc.Rating = 'Cold';
        insert acc;
        
        COntact con = new Contact();
        con.FirstName = 'Test Contact2';
        con.LastName = 'System';
        con.AccountId = acc.Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'test Opp2';
        opp.AccountId = acc.Id;
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        insert opp;
        
        wrpper wrp = new wrpper();
        wrp.accWrp = acc;
        wrp.conWrp = con;
        wrp.oppWrp = opp;        
        System.debug('-------'+ wrp);

        /* 
        //wrapper class dışarda extra class açmadan bu class ın içinde(testWrapperClass) de yazılabilirdi. 
        public with sharing class wrpper {
        public Account accWrp;
        public Contact conWrp;
        public Opportunity oppWrp;
            */
    }    
}
