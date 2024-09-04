/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.security.SecureRandom;
import org.springframework.stereotype.Service;

/**
 *
 * @author lincpay Solutions
 */

@Service
public class KeyGeneratorRandom {
	 public static String generateRandomKey() {
	 
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	int length =15;
	       
	        SecureRandom random = new SecureRandom();

	        StringBuilder sb = new StringBuilder(length);
	        for (int i = 0; i < length; i++) {
	         
	            int randomIndex = random.nextInt(characters.length());
	          
	            sb.append(characters.charAt(randomIndex));
	        }
	        // Convert the StringBuilder to a String and return
	        return sb.toString();
	    }
}
