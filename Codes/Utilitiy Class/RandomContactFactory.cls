/**
 * @ Author: Trailhead: https://sforce.co/3wTQFPM
 * @ Create Time: 2022-05-31 20:15:07
 * @ Modified by: Your name
 * @ Modified time: 2022-05-31 21:32:03
 * @ Description: Create an Apex class that returns a list of contacts based on two incoming parameters: the number of contacts to generate and the last name. Do not insert the generated contact records into the database.
 * NOTE: For the purposes of verifying this hands-on challenge, don't specify the @isTest annotation for either the class or the method, even though it's usually required.
 * Gelen iki parametreye dayalı olarak bir kişi listesi döndüren bir Apex sınıfı oluşturun: oluşturulacak kişi sayısı ve soyadı. Oluşturulan ilgili kişi kayıtlarını veritabanına eklemeyin.
 * NOT: Bu uygulamalı sorgulamayı doğrulama amacıyla, genellikle gerekli olsa bile, sınıf veya yöntem için @isTest ek açıklamasını belirtmeyin.
 */

public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer conNum, String lName){
        
        List<Contact> lstCon = new List<Contact>();
        for(Integer i=0;i<conNum;i++) {
            Contact c = new Contact(FirstName = 'Test' + i, LastName = lName);
            lstCon.add(c);
        }               
        return lstCon;
    }
}