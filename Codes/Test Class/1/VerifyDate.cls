/**
 * @ Author: Trailhead: https://sforce.co/3x3CU2h
 * @ Create Time: 2022-05-31 20:15:07
 * @ Modified by: Your name
 * @ Modified time: 2022-05-31 20:27:48
 * @ Description: Create and install a simple Apex class to test if a date is within a proper range, and if not, returns a date that occurs at the end of the month within the range.
 * Bir tarihin uygun bir aralıkta olup olmadığını test etmek için basit bir Apex sınıfı oluşturun ve kurun ve değilse, aralık içinde ayın sonunda gerçekleşen bir tarihi döndürür.
 */

public class VerifyDate {
	
	//method to handle potential checks against two dates
	public static Date CheckDates(Date date1, Date date2) {
		//if date2 is within the next 30 days of date1, use date2.  Otherwise use the end of the month
		if(DateWithin30Days(date1,date2)) {
			return date2;
		} else {
			return SetEndOfMonthDate(date1);
		}
	}
	
	//method to check if date2 is within the next 30 days of date1
	@testVisible
    private static Boolean DateWithin30Days(Date date1, Date date2) {
		//check for date2 being in the past
        	if( date2 < date1) { return false; }
        
        	//check that date2 is within (>=) 30 days of date1
        	Date date30Days = date1.addDays(30); //create a date 30 days away from date1
		if( date2 >= date30Days ) { return false; }
		else { return true; }
	}

	//method to return the end of the month of a given date
	@testVisible
    private static Date SetEndOfMonthDate(Date date1) {
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		return lastDay;
	}

}