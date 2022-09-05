@RestResource(urlMapping='/dynamicAccount/')
global class createDynamicAccount {
@httpPost
    global static List<Account> dynamicAccountCreate(){
        RestRequest req = RestContext.request;
        
        String jsonBody = req.requestBody.toString();
        List<Account>  lstAccount = (List<Account>) JSON.deserialize(jsonBody, List<Account>.Class);
        insert lstAccount;
        return lstAccount;
    }
}