package com.eproc.util;

import java.util.Random;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

@Repository
public class EmailService {

//    public static void main(String[] args) {
//        new EmailService().sendMessage("7389069343");
//    }

    public char[] OTP(int len) {
        System.out.println("Generating OTP using random() :");

        // Using numeric values
        String numbers = "0123456789";

        // Using random method
        Random rndm_method = new Random();

        char[] otp = new char[len];

        for (int i = 0; i < len; i++) {
            // Use of charAt() method : to get character value
            // Use of nextInt() as it is scanning the value as int
            otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
            System.out.println("otp is:-" + otp);
        }
        return otp;
    }

// Service for send message
    public String sendMessage(String mobileNo) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            char[] otp = OTP(4);
            String generatedotp = new String(otp);

                String message="Dear User,\n" +
"Your OTP is "+generatedotp+", Use this code to complete your process. Do not share this OTP with anyone.\n" +
"Thank You.";
            System.out.println("mobileNo : " + mobileNo + " and message is " + message);
            String smsApiUrl = "http://sms.clicksensetech.com/sendSMS" + "?username=" + "lincpay" + "&message=" + message
                    + "&sendername=LINVER&smstype=TRANS&numbers=" + mobileNo + "&apikey=" + "18d3d763-6de6-48b4-977b-47b405ffcf9c";

            // Make the API call using RestTemplate
            String response = restTemplate.getForObject(smsApiUrl, String.class);

            if (response != null) {
                System.err.println(response);
                return generatedotp;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}