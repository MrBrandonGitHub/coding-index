public class dynamiSOQLQuery {
    public static void getRecords(String accRating, String accIndustry){
        String whereConditon ;
        
        if(!String.isBlank(accRating) && !String.isBlank(accIndustry) ){
           whereConditon = 'WHERE Rating =: accRating AND Industry =: accIndustry' ;
        }else if(String.isBlank(accRating) && !String.isBlank(accIndustry) ){
            whereConditon = 'WHERE Industry =: accIndustry' ;
        }else if(!String.isBlank(accRating) && String.isBlank(accIndustry) ){
            whereConditon = 'WHERE Rating =: accRating' ;
        }else{
            whereConditon ='';
        }
        
        
        
       List<Account> lstAccount = Database.query('SELECT Id ,Name,Rating,Industry FROM Account '+whereConditon);
        for(Account acc : lstAccount){
            System.debug('--acc---'+acc);
        }              
       
    }

}