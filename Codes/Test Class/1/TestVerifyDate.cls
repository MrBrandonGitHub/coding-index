/**
 * @ Author: Your name
 * @ Create Time: 2022-05-31 20:15:07
 * @ Modified by: Your name
 * @ Modified time: 2022-05-31 20:29:03
 * @ Description: VerifyDate classının Test Classı
 */

@isTest
public class TestVerifyDate {
    
    @istest static void testDateNext30Days() {
        Date dt = VerifyDate.CheckDates(Date.newInstance(2022, 5, 17), Date.newInstance(2022, 5, 27));
        System.assertEquals(Date.newInstance(2022, 5, 27), dt);
    }
    
    @istest static void testDateMoreThan30Days() {
        Date dt = VerifyDate.CheckDates(Date.newInstance(2022, 5, 17), Date.newInstance(2022, 6, 27));
        System.assertEquals(Date.newInstance(2022, 5, 31), dt);
    }
    
    @istest static void testDateFalse() {
        Boolean bl = VerifyDate.DateWithin30Days(Date.newInstance(2022, 5, 17), Date.newInstance(2022, 5, 7));
        System.assertEquals(false , bl);
    }
    
    @istest static void testDateTrue() {
        Boolean bl = VerifyDate.DateWithin30Days(Date.newInstance(2022, 5, 17), Date.newInstance(2022, 5, 27));
        System.assertEquals(true , bl);
    }
    
    @istest static void testDateTotal() {
        date dt = VerifyDate.SetEndOfMonthDate(Date.newInstance(2022, 5, 17));
        System.assertEquals(Date.newInstance(2022, 5, 31) , dt);
    }

}