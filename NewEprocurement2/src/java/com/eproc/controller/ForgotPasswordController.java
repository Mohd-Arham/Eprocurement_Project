/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

//import com.eproc.domain.Common_Logon_Status;
//import com.eproc.domain.Tender;
//import com.eproc.domain.TenderKeyDates;

import com.eproc.dao.ContractorDao;
import com.eproc.dao.ContractorDetailsDao;
import com.eproc.dao.SecondaryContractorDAO;

import com.eproc.daoImpl.CitiesDAOImpl;
import com.eproc.daoImpl.ContractorClassDAOImpl;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.ContractorDesignationDAOImpl;
import com.eproc.daoImpl.CountriesDAOImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.MsmeDAOImpl;
import com.eproc.daoImpl.OrganizationTypeDAOImpl;
import com.eproc.daoImpl.SocialCategoryDAOImpl;
import com.eproc.daoImpl.StatesDAOImpl;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorOrganizationType;
import com.eproc.domain.DepartmentUser;
import com.eproc.util.CommonUtil;
import com.eproc.util.EmailService;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Naina Jain
 */
@Controller
public class ForgotPasswordController {

    private String generatedotp;
    private String generatedOTP;
    @Autowired
    EmailService emailService;
    @Autowired
    CommonUtil commonUtil;
    @Autowired
    StatesDAOImpl statesdao;
    @Autowired
    CitiesDAOImpl citiesdao;
    @Autowired
    ContractorDetailsDao contractordetailsdao;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    CountriesDAOImpl countryDao;
    @Autowired
    SocialCategoryDAOImpl socialCategoryDao;
    @Autowired
    OrganizationTypeDAOImpl organizationTypeDao;
    List<ContractorOrganizationType> contApplication;
    @Autowired
    MsmeDAOImpl msmeDao;
    @Autowired
    ContractorDao contractordao;
    @Autowired
    ContractorClassDAOImpl contractorClassDao;
    @Autowired
    ContractorDesignationDAOImpl contractorDesignationDao;
    @Autowired
    ContractorDaoImpl contractorDaoImpl;
    String emailFromRecipient = "info@lotusprocure.in";
    @Autowired
    SecondaryContractorDAO secondaryContractorDAO;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    JavaMailSender mailSender;
 

    @RequestMapping("/forgotPassword")
    @ResponseBody
    public List forgotPassword(@RequestParam String validUser,Model m,HttpSession session) {
        System.out.println("forgot Password validUser is:   "+validUser.trim());
        String generatedotp;
        String generatedOTP = "";
        List res = new ArrayList();
        DepartmentUser departmentUser = new DepartmentUser();
               try{
        String userExists = departmentUserDaoImpl.checkLogin(validUser.trim());
         System.out.println("userExists   :  "+userExists);
           if (userExists == "Contractor") {
               System.out.println("User Inside Contractor");
                List<Contractor> contractorList =null;
                contractorList = contractorDaoImpl.fetchAll(); 
                for(Contractor contractor:contractorList){
                if ((validUser.equalsIgnoreCase(contractor.getEmailid())  || validUser.equals(contractor.getMobileno()))) {
                  generatedOTP =  emailService.sendMessage(contractor.getMobileno());
//                   generatedOTP = CommonUtil.generatePassword();
                     res.add(contractor.getId());
                   System.out.println("forgot Password validUser:  "+generatedOTP);
                  }
               } 
                
                 if(generatedOTP != null || generatedOTP != ""){
                       System.out.println("otp is not null");
                       res.add(generatedOTP);
                       res.add("Contractor");
                       return res; 
                    } else{
                     System.out.println("otp is null");
                   }
         }else if(userExists == "DepartmentUser"){
               System.out.println("User Inside Department User");
                 departmentUser = departmentUserDaoImpl.fetchData(validUser);
                
                if ((validUser.equalsIgnoreCase(departmentUser.getEmailAdd())  || validUser.equals(departmentUser.getMobNo()))) {
                  generatedOTP =  emailService.sendMessage(departmentUser.getMobNo());
//                   generatedOTP = CommonUtil.generatePassword();
                     res.add(departmentUser.getReg_Id());
                   System.out.println("forgot Password validUser:  "+generatedOTP);
                  }
                 if(generatedOTP != null){
                       System.out.println("otp is not null");
                       res.add(generatedOTP);
                       res.add("DepartmentUser");
                       return res; 
                    } else{
                     System.out.println("otp is null");
                   }
         }
        }catch(Exception ex){
            System.out.println("Exception is: "+ex.getMessage());
        }
         return res;
    }

    @RequestMapping("/registeredEmail")
    public String registeredEmail(@RequestParam String emailid,HttpServletRequest request,Model m) {
        System.out.println("");
        String userExists = commonUtil.checkLogin(emailid);
        System.out.println("$$$$$$"+userExists);
         if (userExists == "DepartmentUser") {         
         } else if (userExists == "Contractor"){         
         }
         generatedotp = CommonUtil.generatePassword();
         HttpSession hsession = request.getSession(true);
         hsession.setAttribute("OTP", generatedotp);
         System.out.println("OTP : " + generatedotp);
         m.addAttribute("generatedotp", generatedotp);
        return "OTPVerification";
    }
    
 
    @RequestMapping("/verifyOTPDeptAdmin")
     public String verifyOTPDeptAdmin(@RequestParam String verifyingotp, String generatedotp,RedirectAttributes ra,HttpSession session) {
        System.out.println("#########"+generatedotp);
        System.out.println("~~~~~~~~~"+verifyingotp);
         try {
            if (verifyingotp.equals(generatedotp)) {
                System.out.println("Mobile no. Verified");
                return "redirect:/DepartmentAdminLogin";

//           return "redirect:/departmentUserLogin";
            } else {
//          return "OTPNotVerified";
                return "redirect:/";
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
        
   }
     
    @RequestMapping("/verifyOTPDeptUser") 
     public String verifyOTPDeptUser(@RequestParam String verifyingotp, String generatedotp,HttpSession session,
             RedirectAttributes ra) {
        System.out.println("######### generatedotp"+generatedotp);
        System.out.println("~~~~~~~~~ verifyingotp"+verifyingotp);
         String OTP_OnMobile = (String) session.getAttribute("OTP_OnMobile");
         String mobileno = (String) session.getAttribute("deptMobNo");
         try {
              if (verifyingotp.equals(OTP_OnMobile)){
//          if(verifyingotp.equals(generatedotp)){
                departmentUserDaoImpl.mobileverified(mobileno);
              System.out.println("~~~~ movile no verified");
           return "redirect:/departmentUserLogin";
          }else{
                   ra.addFlashAttribute("verifyMobileno", "OTP is not verified from your Mobile No. Please ReLogin");
          return "redirect:/";
          }     
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }
     
     
     /**
     * @verifyMobile Method
     * @verifyMobile method used to verify mobile number and update the mobile verify status to verified
     * @return LotusHomePage
     */
   
     @RequestMapping("/verifyMob")
     @ResponseBody
     public String verifyMobile(Model m, HttpSession session) {
     System.out.println("~~~~~~~~~~~verifyMobile method in forgot password controller~~~~~~~~~");
     Integer regId=(Integer)session.getAttribute("contRegId");
         System.out.println("contractor regid is:  "+regId);
    try {
      if(regId!=null){
      Contractor contractor=(Contractor) contractordao.fetchData(regId);
          System.out.println("Contractor mobile no is:"+contractor.getMobileno()  +"   ");
           generatedOTP =  emailService.sendMessage(contractor.getMobileno());
//                generatedOTP = CommonUtil.generatePassword();
                 System.out.println("OTP : " +generatedOTP);
     }else{
           generatedOTP = (String) session.getAttribute("mobOTP");
           System.out.println("OTP : " +generatedOTP);
      }
           if(generatedOTP != null){
              return generatedOTP;  
           }
     
            
            //     return "Contractor/OTPVerificationContractor";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Method:verifymobile");
        }
        return null;
    }
     //after registration otp verification
     @RequestMapping("/verifyRegisteredContractor")
     @ResponseBody
     public String verifyRegisteredContractor(@RequestParam Integer regId,Model m, HttpSession session) {
     System.out.println("~~~~~~~~~~~verifyRegisteredContractor method in forgot password controller~~~~~~~~~");
       System.out.println("contractor regid is:  "+regId);
    try {
      if(regId!=null){
      Contractor contractor=(Contractor) contractordao.fetchData(regId);
          System.out.println("Contractor mobile no is:"+contractor.getMobileno()  +"   ");
           generatedOTP =  emailService.sendMessage(contractor.getMobileno());
//                generatedOTP = CommonUtil.generatePassword();
                 System.out.println("OTP : " +generatedOTP);
     }
          if(generatedOTP != null){
          return generatedOTP;  
           }
       } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Method:verifymobile");
        }
        return null;
    }
     
     
     @RequestMapping("/editRegisteredContractor")
     @ResponseBody
     public String editRegisteredContractor(@RequestParam Integer regId,String mobileNo,Model m, HttpSession session) {
     System.out.println("~~~~~~~~~~~editRegisteredContractor method in forgot password controller~~~~~~~~~");
       System.out.println("contractor regid is:  "+regId);
    try {
      if(regId!=null){
      Contractor contractor=(Contractor) contractordao.fetchData(regId);
          System.out.println("Contractor mobile no is:  "+mobileNo);
//           generatedOTP =  emailService.sendMessage(mobileNo);
                generatedOTP = CommonUtil.generatePassword();
                System.out.println("OTP : " +generatedOTP);
      }
          if(generatedOTP != null){
          return generatedOTP;  
           }
       } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Method:verifymobile");
        }
        return null;
    }

    
    /**
     * @verifyMobileContractor Method
     * @verifyMobileContractor method used to verify mobile number and update the mobile verify status to verified
     * @return LotusHomePage
     */
     @RequestMapping("/verifyMobileContractor")
    public String verifyMobileContractor( Model m,@RequestParam String verifyingotp, @RequestParam String generatedotp,String otpFor,RedirectAttributes ra, HttpSession session) throws IOException {
         System.out.println("~~~~~~~~~verifyMobileContractor Method~~~~~~~~~~");
         System.out.println("Generated otp in verifyMobileContractor" + generatedotp);
         System.out.println("Generated otp in otpFor" + otpFor);
         System.out.println("Verifying otp in verifyMobileContractor" + verifyingotp);
         Common_Logon_Status common_Logon_Status= (Common_Logon_Status) session.getAttribute("commonLogin");
         Map map = new HashMap();
         Gson gson = new Gson();
         Integer regId=(Integer)session.getAttribute("contRegId");
         Contractor contractor = (Contractor) contractordao.fetchData(regId);
         String Mobileno=contractor.getMobileno();
         System.out.println("regid is"  +regId);
          if (verifyingotp.equals("") || verifyingotp == null) {
                map.put("validateOTP", "Please Enter Otp");
            }
            System.out.println(" map " + map);
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                return result;
            } 
            try {
            if (verifyingotp.equals(generatedotp)) {
                System.out.println("otp is matched in verifyMobileContractor");
                if(otpFor.equalsIgnoreCase("editRegDetails")){
                     ra.addFlashAttribute("openModal", "registrationModal");
                     ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
                     return "redirect:/viewPrimaryContractor";
                 }
                 if(otpFor.equalsIgnoreCase("editBidderDetails")){
                    session.setAttribute("step", "step2");
                    ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
                    return "redirect:/getContractorProfile";
                  }
                  if(otpFor.equalsIgnoreCase("secondaryContractor")){
                    System.out.println("secondaryContractor !!!!!!!!!!!!!"); 
                    Integer id=(Integer) session.getAttribute("reg_Id");
                    if(id != null){
                         secondaryContractorDAO.mobileverified(id);
                      }
                    ra.addFlashAttribute("passwordFor", "secondaryContractorCreatePassword");
                      return "redirect:/";
                     }
                   if(otpFor.equalsIgnoreCase("editForeignDetails")){
                     session.setAttribute("step", "step1");
                      ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
                     return "redirect:/getContractorProfile";
                  }
                   if(otpFor.equalsIgnoreCase("editOrganizationDetails")){
                     session.setAttribute("step", "step3");
                      ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
                     return "redirect:/getContractorProfile";
                  }
                   if(otpFor.equalsIgnoreCase("forgotPasswordOtp")){
                     ra.addFlashAttribute("regId",regId);
                      ra.addFlashAttribute("forgotPasswordPage","forgotPasswordPage");
                     return "redirect:/";
                  }
 
                System.out.println("palak palak  "+Mobileno);    
                 contractordao.mobileverified(Mobileno,"verified");
                System.out.println("regid of :" + regId);
               Contractor contractor1=(Contractor) contractordao.fetchData(regId);
                System.out.println("email is" + contractor.getEmailStatus());
                if (!contractor1.getEmailStatus().equals("verified")) {
                    System.out.println("email is not verified");
                    ra.addFlashAttribute("emailid", contractor.getEmailid());
                    ra.addFlashAttribute("notVerifyEmail", "Please verify Email");
                    ra.addFlashAttribute("contVerifyRegId", contractor.getId());
                  }
                if (!contractor1.getMobileStatus().equals("verified")) {
                    ra.addFlashAttribute("contMobile", contractor.getMobileno());
                     System.out.println("Mobile is not verified");
                   ra.addFlashAttribute("notVerifyMobile", "Please Verify Mobile");
                    ra.addFlashAttribute("contVerifyRegId", contractor.getId());
                }
              ra.addFlashAttribute("contVerifyRegId", contractor.getId());
               ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
               ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
              return "redirect:/logoutContractor";
            } else {
                ra.addFlashAttribute("verifyMobileno", "OTP is not verified from your Mobile No.");
                return "redirect:/";
            }
           } catch (Exception e) {
            e.printStackTrace();
          }
        return null;
    }
    /**
     * @verifyMobileContractor Method
     * @verifyMobileContractor method used to verify mobile number and update the mobile verify status to verified
     * @return LotusHomePage
     */
     @RequestMapping("/verifyRegisteredOtpCont")
    public String verifyRegisteredOtpCont( Model m,@RequestParam String enteredOTP,Integer regContId ,@RequestParam String generatedOTP,String otpFor,String mobileNo,RedirectAttributes ra, HttpSession session) throws IOException {
         System.out.println("~~~~~~~~~verifyRegisteredOtpCont Method~~~~~~~~~~");
         System.out.println("Generated otp in verifyMobileContractor" + generatedOTP);
         System.out.println("Generated otp in otpFor" + otpFor);
         System.out.println("Verifying otp in verifyMobileContractor" + enteredOTP);
         System.out.println("Contractor Mobile Number is:   "+mobileNo);
         Map map = new HashMap();
         Gson gson = new Gson();
         Contractor contractor = (Contractor) contractordao.fetchData(regContId);
         String Mobileno=contractor.getMobileno();
          System.out.println("regid is"  +regContId);
          if (enteredOTP.equals("") || enteredOTP == null) {
                map.put("validatingOTP", "Please Enter Otp");
            }
            System.out.println(" map " + map);
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                return result;
            } 
            try {
            if (enteredOTP.equals(generatedOTP)) {
                System.out.println("~~~~~~~~~~otp is matched~~~~~~~~~~~~~~ ");
                 if(otpFor.equalsIgnoreCase("forgotPasswordOtp")){
                     ra.addFlashAttribute("regId",regContId);
                     ra.addFlashAttribute("contVerifyRegId",regContId);
                     ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
                     ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
                     ra.addFlashAttribute("forgotPasswordPage","forgotPasswordPage");
                     return "redirect:/";
                  }
                 if(otpFor.equalsIgnoreCase("editContMobileNumber")){
                 String status=contractordao.updateContractorMobileNumber(regContId, mobileNo);
                     System.out.println("status is !!!!!!!!!!!!!  "+status);
                     ra.addFlashAttribute("regId",regContId);
                     ra.addFlashAttribute("contVerifyRegId",regContId);
                     ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
                     if(status.equalsIgnoreCase("true")){
                     contractordao.mobileverified(mobileNo,"verified");    
                     ra.addFlashAttribute("editContMobileNumberStatus","Mobile Number is Changed Successfully");
                     }
                     else{
                     ra.addFlashAttribute("editContMobileNumberStatus","Mobile Number is not Changed Successfully");
                     }
                     ra.addFlashAttribute("otpMessage", "Otp Is Verified"); 
                      return "redirect:/";
                  }
               System.out.println("Contractor Mobile no "+Mobileno);    
                contractordao.mobileverified(Mobileno,"verified");
               System.out.println("regid of :" + regContId);
            
                 Contractor contractor1=(Contractor) contractordao.fetchData(regContId);
                System.out.println("email is" + contractor.getEmailStatus());
                if (!contractor1.getEmailStatus().equals("verified")) {
                    System.out.println("email is not verified");
                    ra.addFlashAttribute("emailid", contractor.getEmailid());
                    ra.addFlashAttribute("notVerifyEmail", "Please verify Email");
                  }
                if (!contractor1.getMobileStatus().equals("verified")) {
                    ra.addFlashAttribute("contMobile", contractor.getMobileno());
                     System.out.println("Mobile is not verified");
                   ra.addFlashAttribute("notVerifyMobile", "Please Verify Mobile");
                }
                 ra.addFlashAttribute("contVerifyRegId",regContId);
                 ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
                 ra.addFlashAttribute("otpMessage", "Otp Is Verified");   
              return "redirect:/";
            } else {
                ra.addFlashAttribute("verifyMobileno", "OTP is not verified from your Mobile No.");
                return "redirect:/";
            }
           } catch (Exception e) {
            e.printStackTrace();
          }
        return null;
    }

           @RequestMapping("/resendEmail")
           public String  resendEmail(@RequestParam String emailid,Model m) {
            System.out.println("Email id is:"+emailid);
            int index=emailid.indexOf('@');
            int length=emailid.length();
            String email=emailid.substring(0, index);
           char[] emailStr = email.toCharArray();
            System.out.println("index is:"+index+"   length of string is"+length +"encryptEmail:"+email);
            for (int i=0;i<emailStr.length;i++){
            
            if(i>2){
               email=email.replace(emailStr[i], '*');
            }
           }
           System.out.println("Email after replacing character is:"+email);
           String sub=emailid.substring(index);
           System.out.println("Substring "+sub);
           m.addAttribute("emailid", email+sub);
           m.addAttribute("emailId", emailid);
           return "Contractor/resendEmail";
    }
    
    
     @RequestMapping("/resendEmailDone")
    public String  resendEmailDone(@RequestParam String emailId,HttpServletRequest request) {
        String subject = "Registration is Successful";
        String result="";
//        System.setProperty("proxyHost", "192.168.0.2");
//        System.setProperty("proxyPort", "3128");
     try{
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(emailId);
        email.setFrom(emailFromRecipient);
        email.setSubject(subject);
        Contractor contractor = null;
        String userExists = departmentUserDaoImpl.checkLogin(emailId);
        contractor = (Contractor) contractordao.fetchIdbyEmail(emailId);
        System.out.println("userExists " + userExists);
        System.out.println("contractor id is:" + contractor.getId());
        String confirmationUrl = "/contractorVerification?EmailNo=" + contractor.getId();
        email.setText("To verify your Email:Please click here" + "<a href='http://newlotus.org.osmo/"+ confirmationUrl+"'></a>");
        System.out.println("   email link " + email.getText());
        mailSender.send(email);
        result="success";
        gsonUtility.writeData(result);
        return result;
        }catch(Exception ex){
            ex.printStackTrace();
            System.out.println("Class:ForgotPasswordController Method:resendEmailDone  ");
        }
        return null;
    }

    
 /**
     * @resendOtpCont Method
     * @resendOtpCont method used to send the otp to the mobile number
     * @return LotusHomePage
     */
     @RequestMapping("/resendOtpRegCont")
     @ResponseBody
     public List resendOtpCont(@RequestParam Integer regId,Model m, HttpSession session) {
     System.out.println("~~~~~~~~~~~resendOtpCont method in forgot password controller~~~~~~~~~");
       System.out.println("contractor regid is:  "+regId);
       List res= new ArrayList();
    try {
      if(regId!=null){
      Contractor contractor=(Contractor) contractordao.fetchData(regId);
          System.out.println("Contractor mobile no is:"+contractor.getMobileno());
           generatedOTP =  emailService.sendMessage(contractor.getMobileno());
           res.add(contractor.getMobileno());
//                generatedOTP = CommonUtil.generatePassword();
                 System.out.println("OTP : " +generatedOTP);
     }
          if(generatedOTP != null){
          res.add(generatedOTP);
          return res;  
           }
       } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Method:verifymobile");
        }
        return null;
    }

//vaishali gupta
     @RequestMapping("/getOTPforBidwithDraw")
    @ResponseBody
    public String getOTPforBidwithDraw(HttpSession session,HttpServletRequest request){
         System.out.println("inside getOTPforBidwithDraw");
       String generateOTP="";
       Integer regId=(Integer)session.getAttribute("contRegId");
       try{
           if(regId!=0||regId!=null){
//               generateOTP = CommonUtil.generatePassword();
             Contractor contractor=(Contractor) contractordao.fetchData(regId);
          System.out.println("Contractor mobile no is:"+contractor.getMobileno()  +"   ");
               System.out.println("generateOTP "+generateOTP);
           generateOTP =  emailService.sendMessage(contractor.getMobileno());
                    request.getSession().removeAttribute("contOTP");
                    request.getSession().setAttribute("contOTP",generateOTP);
//                session.removeAttribute("contOTP");
//                session.setAttribute("contOTP", generateOTP);
           }
         
       
       
       }catch(Exception ex){
           ex.printStackTrace();
       }
    return generateOTP;
    }
    
     @RequestMapping("/matchOTP")
    @ResponseBody
    public boolean getOTPfromSession(@RequestParam String enteredOtp,HttpSession session,HttpServletRequest request){
         System.out.println("inside getOTPforBidwithDraw");
         System.out.println(" enteredOtp "+enteredOtp);
       String generateOTP="";
       boolean matchOTPStatus=false;
       try{
            generateOTP= (String) request.getSession().getAttribute("contOTP");
             if(generateOTP.equals(enteredOtp)){
                 System.out.println("/true/");
             matchOTPStatus=true;
             }else{
             matchOTPStatus=false;
               System.out.println("/false/");
             }
       }catch(Exception ex){
           ex.printStackTrace();
       }
    return matchOTPStatus;
    }
     
}
