/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.MessageDigest;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Gaurav Dubey
 */
@Service
public class FileUtility {
    
    public static final String UPLOAD_TENDERDOCUMENTDIRECTORY = "/resources/UploadedDocuments/tenderDocuments";
    public static final String UPLOAD_BUYBACKDIRECTORY = "/resources/UploadedDocuments/buybackdocument";
    public static final String UPLOAD_TENDERAMENDMENTDOCUMENT = "/resources/UploadedDocuments/amendmentDocument";
    public static final String UPLOAD_TENDERTEMPORARYAMENDMENTDOCUMENT = "/resources/UploadedDocuments/temporaryAmendDocument";
    public static final String UPLOAD_TEMPORARYCLOUDFOLDER = "/resources/UploadedDocuments/cloudFolder/temporaryDocuments";
    public static final String UPLOAD_CLOUDFOLDER = "/resources/UploadedDocuments/cloudFolder";
    public static final String UPLOAD_TEMPORARYDOCUMENT = "/resources/UploadedDocuments/temporaryBidDocument";
    public static final String UPLOAD_Created_PDFFOLDER = "/resources/UploadedDocuments/Created_PDF";
    public static final String UPLOAD_Approval_PDFFOLDER = "/resources/UploadedDocuments/Approval_PDF";
    
    
      @Autowired
    private ServletContext servletContext;
    
     public static String generateRandomNo() {
        Date date = new Date();
        System.out.println("date is:"+date);
        int mili = date.getSeconds();
        
        
        String str = "0123456789";
        StringBuilder sb = new StringBuilder();
         System.out.println("-------Generate Random number method is run-------------");
        for (int i = 0; i < 4; i++) {
         sb.append(new Random().nextInt(str.length()));
         }
        
        System.out.println("random no : " + sb.toString() + mili);
        System.out.println("-------------Generate Random number method is closed---------");
        return sb.toString();
    }
     
     /**
      * Method used to remove extension 
      * @param fileName
      * @return fileName
      */    
      public static String removeExtension(String fileName) {
          System.out.println("----------Remove extension method is run-------------");
        if (fileName.indexOf(".") > 0) {
            return fileName.substring(0, fileName.lastIndexOf("."));
        } else {
            return fileName;
        }
    } 
      /**
       * @author Palak Tiwari
       * @return random number concatenate with milliseconds
       */
     public static String generateRandomNoMili() {
        Date date = new Date();
        System.out.println("date is:"+date);
        int mili = date.getSeconds();
        String randomNo=null;
        
        String str = "0123456789";
        StringBuilder sb = new StringBuilder();
         System.out.println("-------Generate Random number method is run-------------");
        for (int i = 0; i < 4; i++) {
         sb.append(new Random().nextInt(str.length()));
         }
        randomNo=sb.toString() + mili;
        
        System.out.println("random no : " +randomNo );
        System.out.println("-------------Generate Random number method is closed---------");
        return randomNo;
    }  
     public String generatingCheckSum(String datafile){

    StringBuffer sb = new StringBuffer("");
    try{     
    MessageDigest md = MessageDigest.getInstance("SHA1");
    //we can also used "MD5"
    FileInputStream fis = new FileInputStream(datafile);
    byte[] dataBytes = new byte[1024];
    
    int nread = 0; 
    
    while ((nread = fis.read(dataBytes)) != -1) {
      md.update(dataBytes, 0, nread);
    };

    byte[] mdbytes = md.digest();   
    //convert the byte to hex format
    
    for (int i = 0; i < mdbytes.length; i++) {
    	sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
    }    
    System.out.println("Digest(in hex format):: " + sb.toString());
     }
    catch(Exception ex){
        ex.printStackTrace();
    }
    return sb.toString();
   } 
     
   
public String fileUploadingUtil(MultipartFile file, String upload_Directory){
    String fileconvertedName = null;
    System.out.println("The File in fileUploadingUtil method: "+file.getOriginalFilename());
    try{
       String path = servletContext.getRealPath(upload_Directory);
            System.out.println("Path of the file is:"+path);
            String filename = file.getOriginalFilename();
            System.out.println("File name are: "+filename);
            String ext=filename.substring(filename.lastIndexOf("."));
            System.out.println("ext"+ext);
            fileconvertedName = FileUtility.removeExtension(filename)+FileUtility.generateRandomNo()+ext;
            System.out.println("File converted name is:"+ fileconvertedName);
            byte[] bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
            new File(path + File.separator + fileconvertedName)));            
            stream.write(bytes);
            if(stream != null){
                stream.close();
            }
    }catch(Exception ex){
        ex.printStackTrace();
    }
    return fileconvertedName;
}   
   
public String fileUploadingWithConvertedName(MultipartFile file, String upload_Directory){
    String filename = "";
    System.out.println("The File in fileUploadingUtil method: "+file.getOriginalFilename());
    try{
       String path = servletContext.getRealPath(upload_Directory);
            System.out.println("Path of the file is:"+path);
            filename = file.getOriginalFilename();
            System.out.println("File name are: "+filename);
            byte[] bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
            new File(path + File.separator + filename)));            
            stream.write(bytes);
            if(stream != null){
                stream.close();
            }
    }catch(Exception ex){
        ex.printStackTrace();
    }
    return filename;
}   

}
