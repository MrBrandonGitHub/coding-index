@RestResource(urlMapping='/AccountAndDataChild/')
global class AccountAndChildData {

    @HttpGet
   
        global static List<Account> getRecord(){
        //List<Account> lstAccount = new List<Account>();
       
        Map<String,String> paramsValue = RestContext.request.params;
        system.debug('RestContext.request::'+RestContext.request);
            system.debug(':::params:::'+paramsValue); 
         
        string accType =paramsValue.get('Type');
        string accIndustry =paramsValue.get('Industry');    
            
 		string AccountQuery = 'SELECT Id,Name,Type,Industry,'
            				+'(SELECT Id,Status,Origin FROM Cases),'
            				+'(SELECT Id,Name,CloseDate FROM Opportunities) FROM Account';
         
         if(!String.isBlank(accType) && !String.isBlank(accIndustry) ){           
             AccountQuery += ' WHERE Type =:accType AND Industry=:accIndustry';             
         //  AccountQuery =AccountQuery + 'WHERE Type =:accType AND Industry=:accIndustry';
          
        }else if(String.isBlank(accType) && !String.isBlank(accIndustry) ){
            AccountQuery += ' WHERE Industry=:accIndustry';
           
        }else if(!String.isBlank(accType) && String.isBlank(accIndustry) ){
            AccountQuery += ' WHERE Type =:accType';
            
        }
           
             
        return Database.Query(AccountQuery);
    }
}