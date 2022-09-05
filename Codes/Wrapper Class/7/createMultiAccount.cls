@RestResource(urlMapping='/MultiAccount/')
global class createMultiAccount {
    @httpPost
    global static List<Account> createListOfAccount(){
        List<Account> lstAccount = new List<Account>();
        RestRequest req = RestCOntext.request;
        String jsonBody = req.requestBody.toString();
        
       List<AccountWrapper> allAccounts = (List<AccountWrapper>) JSON.deserialize(jsonBody, List<AccountWrapper>.Class);
        for(AccountWrapper accEach : allAccounts){
            Account acc = new Account();
            acc.Name = accEach.name;
            acc.Rating = accEach.rating;
            acc.Industry = accEach.industry;
            acc.Website = accEach.website;
            lstAccount.add(acc);
        }
        insert lstAccount;
        return lstAccount;
        
    }
    
    
    public Class AccountWrapper{
        public String name;
        public String rating;
        public String industry;
        public String website;
    }
    
    

}