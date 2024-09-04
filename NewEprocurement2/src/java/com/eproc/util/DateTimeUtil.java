/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Gaurav Dubey
 */
@Service
public class DateTimeUtil{

    /*
    * dateToDayConversion
    * Method call to get the day according to date
    * @Created 29 Sep 2018
    * @version 2.0.0
    */
    public static String dateToDayConversion(String date) throws ParseException{
        String day = "undefine";
        Date d = new SimpleDateFormat("dd/M/yyyy").parse(date);
        System.out.println("The Date : "+d);
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        System.out.println("The Day is: "+dayOfWeek);
        if( dayOfWeek == 1){
           day = "Sunday"; 
        }
        if( dayOfWeek == 2){
           day = "Monday"; 
        }
        if( dayOfWeek == 3){
           day = "Tuesday"; 
        }
        if( dayOfWeek == 4){
           day = "Wednesday"; 
        }
        if( dayOfWeek == 5){
           day = "Thursday"; 
        }
        if( dayOfWeek == 6){
           day = "Friday"; 
        }
        if( dayOfWeek == 7){
           day = "Saturday"; 
        }
        return day;
    }

   public static String currentDateInString(){
       Date dd = new Date();
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
       String ddd = sdf.format(dd);
       System.out.println("The Date is :" + ddd);
       return ddd;
   } 
  
 
}
