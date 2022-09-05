public with sharing class insertContact {
    public static void insertContactMethod() {

        Contact con = new Contact();
        // required field: LastName
        con.firstName = 'DataBase Deneme';

        //insert con;

        Database.saveResult result = Database.insert(con, false);
            // ya da
            // Account a = new Account(name = 'Acme1');
            // Database.SaveResult[] lsr = Database.insert(new Account[]{a, new Account(Name = 'Acme2')}, false);

        system.debug(result);
        // System.debug(result.getErrors());
        // System.debug(result.getErrors().size());
        // System.debug(result.getId());        
        // System.debug(result.isSuccess());        
        // System.debug(result.getErrors()[0].getMessage());
        
    }


// mesela 150 limit yeine 210 tane insert edince database ile nolcak


// insert con; yerine Database.saveResult result = Database.insert(con, false); ile çağır
// true ile çağır

// lastname ile false ile debug'ta result u çağır: system.debug(result);   +
// firstname ile false ile debug'ta result u çağır: system.debug(result);   + ()

// lastname ile true ile debug'ta result u çağır: system.debug(result);   +
// firstname ile true ile debug'ta result u çağır: system.debug(result);   -

// getErrors: getFeilds - getMessage - getStatusCode - getId - isSuccess



public static void multipleInsertContactMethod(){

    List<Contact> conList = new List<Contact>();
    for(integer i=0; i < 10001; i++){
        Contact con = new Contact();
        con.lastname = 'Multiple DataBase' + i;
        conList.add(con);
    }

    //insert conList;

        Database.saveResult[] result = Database.insert(conList, false);
        system.debug(result);

}












public static void deleteMethod(){
    List<Contact> conList = [Select id, lastname from Contact where lastname like 'Dekeme%' ];

    delete conList;  // delete kullanılınca silinip silinmediği anlaşılmaz

    // Database.DeleteResult[] DR_Dels = Database.delete(conList);  // silinen bir öğe yoksa boş küme gelir. silinen bir şeyin olmadığı anlaşılır
    // system.debug(DR_Dels);


    // string queryString = 'SELECT count() FROM Contact';
    // integer i = Database.countQuery(queryString);
    // system.debug(i);
}


public static void UndeleteMethod(){
    List<Contact> conList = [Select id, lastname from Contact where lastname like 'Deneme%' ALL ROWS];

    Database.UndeleteResult[] UDR_Dels = Database.undelete(conList);
    system.debug(UDR_Dels);

}










}