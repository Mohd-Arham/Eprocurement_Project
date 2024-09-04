package com.eproc.business;

//import static com.eproc.controller.TenderOpeningController.countDateDiff;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class TestDates {
    
    public static void main(String[] args) {
//        SimpleDateFormat sdf = new SimpleDateFormat("E dd MMM yyyy HH:mm a");
//        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH:mm a");
//        
//        try {
//            String date1 = "Tue, 25 Dec 2018 06:20 PM";
//            date1 = date1.replace(",", "");
//            date1 = sdf1.format(sdf.parse(date1));
//            Date bidDate = sdf1.parse(date1);
//            System.out.println(new Date()+" : Expected Date : "+bidDate);
//            
//            Long timer = countDateDiff(new Date(), bidDate, TimeUnit.MILLISECONDS);
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//    }
//    
//     
        
        
       String input = "Tue, 25 Dec 2018 06:20 PM";
       input = input.replace(",", "");
      //Format of the date defined in the input String
      SimpleDateFormat df = new SimpleDateFormat("E dd MMM yyyy hh:mm a");
      
      
      Date date = null;
      try{
         //Converting the input String to Date
    	 date= df.parse(input);
         System.out.println(new Date()+" : daeeeeeeeeeeeeeee  ; "+date);
         //Changing the format of date and storing it in String
         Long timer = countDateDiff(new Date(), date, TimeUnit.MILLISECONDS);
      }catch(Exception pe){
         pe.printStackTrace();
       }
        
    }
    
    public static long countDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
        System.out.println("Today Date: "+date1.getTime()+": &&& Expected Date "+date2.getTime());
        long diffInMillies = date2.getTime() - date1.getTime();
        System.out.println("Difference in Millisecond: "+diffInMillies);
        return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }
     
}
