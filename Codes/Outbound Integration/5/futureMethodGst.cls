public with sharing class futureMethodGst {
    @future(callout=true)
    public static void getGstInfo(Id gstRecordId){
        GST_Records__c gstRecord = [SELECT id, Name, Company_Name__c, Address__c, Pincode__c, State__c, valid__c FROM GST_Records__c where id =:gstRecordId ];        

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.e-waybill.in/api/gstin/validate?gstin='+gstRecord.Name);
        request.setMethod('GET');

        Http http = new Http();

        HttpResponse response = new HttpResponse();
        response = http.send(request);

        if(response.getStatusCode() == 200){
            string jsonBody = response.getBody();
            Map<string,Object> gstBodyObject = (Map<string,Object>) JSON.deserializeUntyped(jsonBody);

            system.debug('==' + gstBodyObject);
            gstRecord.Company_Name__c = (string) gstBodyObject.get('name');            
            gstRecord.Address__c = (string) gstBodyObject.get('address');
            gstRecord.pincode__c = (string) gstBodyObject.get('pinCode');
            gstRecord.state__c = (string) gstBodyObject.get('state');
            gstRecord.valid__c = gstBodyObject.get('valid').toString();
            
            update gstRecord;
        }
    }
}
