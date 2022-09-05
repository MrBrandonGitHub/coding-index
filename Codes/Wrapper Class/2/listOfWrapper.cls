public with sharing class listOfWrapper {
    public static void createRecord(){
        List<Account> lstAccount = new List<Account>();
        List<Contact> lstContact = new List<Contact>();
        List<Opportunity> lstOpportunity = new List<Opportunity>();

        for(integer i=0; i<5; i++){
            Account acc = new Account();
            acc.Name = 'Mr. Brandon' + i;
            lstAccount.add(acc);

            Contact con = new Contact();
            con.LastName = 'Bro' + i ;
            lstContact.add(con);

            Opportunity opp = new Opportunity();
            opp.Name = ' Bro opp' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = date.today();
            lstOpportunity.add(opp);            
        }
        insert lstAccount;
        insert lstContact;
        insert lstOpportunity;

        lstWrapper wrp = new lstWrapper();
        wrp.wrpAccount = lstAccount;
        wrp.wrpContact = lstContact;
        wrp.wrpOpportunity = lstOpportunity;
        system.debug(wrp);
    }
    
    public class lstWrapper{
        public List<Account> wrpAccount;
        public List<Contact> wrpContact;
        public List<Opportunity> wrpOpportunity;
    }
}
