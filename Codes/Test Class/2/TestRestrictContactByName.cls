/**
 * @ Author: Your name
 * @ Create Time: 2022-05-31 20:15:07
 * @ Modified by: Your name
 * @ Modified time: 2022-05-31 20:33:26
 * @ Description: Create and install a simple Apex trigger which blocks inserts and updates to any contact with a last name of 'INVALIDNAME'. You'll copy the code for the class from GitHub. Then write unit tests that achieve 100% code coverage.
 * Soyadı 'INVALIDNAME' olan herhangi bir kişiye yapılan eklemeleri ve güncellemeleri engelleyen basit bir Apex tetikleyicisi oluşturun ve kurun. GitHub'dan sınıfın kodunu kopyalayacaksınız. Ardından %100 kod kapsamı sağlayan birim testleri yazın.
 */

@isTest
public class TestRestrictContactByName {

    @isTest static void TestDeleteAccountWithOneOpportunity() {
    
        // Test data setup
        // Create a contact with Lastname = 'INVALIDNAME' 
                 
        Contact con = new Contact(LastName='INVALIDNAME');    
                  
        // Perform test
        Test.startTest();
        Database.saveResult result = Database.insert(con, false);
        Test.stopTest();
                
                
          
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());        
     
    	
    }

}