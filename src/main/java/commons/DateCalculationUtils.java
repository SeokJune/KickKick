package commons;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateCalculationUtils {
	
	public static String date_format_timestamp(Timestamp writeDate) {
	      
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 HH:mm");
		String strDate = sdf.format(writeDate);
		
		return strDate;

	}
	
	public static String date_format_string(String writeDate) {
	    
		System.out.println(writeDate);
		// java.sql.Timestamp t = java.sql.Timestamp.valueOf(writeDate);
		Timestamp t = Timestamp.valueOf(writeDate);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 HH:mm");
		String strDate = sdf.format(t);
		
		return strDate;

	}
	
	
}
