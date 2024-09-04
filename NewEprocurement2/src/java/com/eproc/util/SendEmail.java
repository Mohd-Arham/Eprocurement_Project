/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Service
public class SendEmail {
 
    static  String emailFromRecipient = "info@lotusprocure.in";
    
    @Autowired
    private JavaMailSender mailSender;
     
  
    
    @RequestMapping("/sendEmail")
    public SimpleMailMessage doSendEmail(String emailid) {
        // takes input from e-mail form
//        String recipientAddress = request.getParameter("recipient");
//        String subject = request.getParameter("subject");
//        String message = request.getParameter("message");
         
        String recipientAddress = emailid;
        String subject = "Thank You";
        String message = "This email is for testing";
        // prints debug info
        System.out.println("To: " + emailid);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
        
        System.setProperty("proxyHost","192.168.0.2");
        System.setProperty("proxyPort", "3128");
        
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
//        email.setTo(recipientAddress);
//        email.setFrom(emailFromRecipient); 
//        email.setSubject(subject);
//        email.setText(message);
//      
//        
//        // sends the e-mail
//        
//        mailSender.send(email);
        System.out.println("Email is:-"+email);
         
        // forwards to the view named "Result"
        return email;
    }
}
