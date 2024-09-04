/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.springframework.stereotype.Service;

/**
 *
 * @author OSMO12
 */
@Service
public class AesEncrDec {
    
    public static void main(String[] args){
        String str = new AesEncrDec().encrypt("Password@123", "lk3a40jgh9dnhgw4b9z09fgb27gh1ju4");
        System.out.println("st : "+str);
    }

    private String secretKey = "lk3a40jgh9dnhgw4b9z09fgb27gh1ju4";
//    private String cipherText;
//    private List encrList = new ArrayList();
//
//    public List getEncrList() {
//        return encrList;
//    }
//
//    public void setEncrList(List encrList) {
//        this.encrList = encrList;
//    }

    public String encrypt(String strToEncrypt, String encryptKey) {
        try {
            Key secretKey = setKey(encryptKey);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        } catch (Exception e) {
            System.out.println("Exception in encrypt() : encryptKey- " + encryptKey + " : Message- " + e.getMessage());
        }
        return null;
    }

    private Key setKey(String encryptKey) {
        MessageDigest sha = null;
        try {
            byte[] key = encryptKey.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-256");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16);
            Key secretKey = new SecretKeySpec(key, "AES");
            return secretKey;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public String decrypt(String responseString, String encryptKey) {
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            Key secretKey = setKey(encryptKey);
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(Base64.getDecoder().decode(responseString)), "UTF-8");
        } catch (Exception e) {
            System.out.println("Exception in decryptResponse() encryptKey- " + encryptKey + " : Message- " + e.getMessage());
        }
        return null;
    }
}
