/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.domain.Contractor;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/*
 * @author Yashovardhan Singh
 * Contactor Model Validator Class
 */
@Component
public class ContractorModel {
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    DepartmentUserDaoImpl departmentUserDAO;

  public String validateContractor(Contractor contractor,HttpSession session) {
        System.out.println("Calling class Secondary_Contractor its method validate");
        Map map = new HashMap();
        Gson gson = new Gson();
       try {
            if (contractor.getFirstname() == null || contractor.getFirstname().equals("")) {
                map.put("firstnameError", "Please Enter First Name");
            } 

//            if (contractor.getMiddlename().equals("") || contractor.getMiddlename() == null) {
//
//                map.put("MiddlenameError", "Please Enter Middle Name");
//            }
            
            if (contractor.getLastname().equals("") || contractor.getLastname()== null) {

                map.put("lastnameError", "Please Enter Last Name");
            }

            if (contractor.getEmailid().equals("") || contractor.getEmailid() == null) {

                map.put("emailError", "Please Enter Email");
            }
               Integer regId=(Integer)session.getAttribute("contRegId");
         System.out.println("registration id in vlidation is:   "+regId);
            if(regId== null){
            if (contractor.getPassword().equals("") ||contractor.getPassword()==null) {

                map.put("passwordContError", "Please Enter Password");
            }
             if (contractor.getContractorType() == null) {
               map.put("contractorTypeError", "Please Select Contractor Type");
             }
           if(!contractor.getEmailid().equals("")){
            boolean duplicateCheckEmail = departmentUserDAO.checkDuplicateEmail(contractor.getEmailid());
            if (duplicateCheckEmail == true) {
             map.put("emailError","Email Id is already registered");
               }
            }
            if(!contractor.getMobileno().equals("")){
              boolean  duplicateCheckMob = departmentUserDAO.checkDuplicateContect(contractor.getMobileno());
             if (duplicateCheckMob == true) {
             map.put("mobilenoError","Mobile  is already registered");
               }
             }
            
            Pattern password = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$", Pattern.CASE_INSENSITIVE);
            if (!(password.matcher(contractor.getPassword()).matches()) && !contractor.getPassword().equals("")) {
             map.put("passwordContError", "Password must contains atleast 1 special character(#,!,%),1 capital letter(A-Z) and minimum length should be 8");
             }
           }

            if (contractor.getMobileno().equals("") || contractor.getMobileno()== null) {

                map.put("mobilenoError", "Please Enter Mobile No.");
            }
               if (contractor.getDialCode().equals("") || contractor.getDialCode()== null) {

                map.put("dialCodesError", "Please Select Dial Code");
            }
            
             if (contractor.getDesignation().equals("") || contractor.getDesignation() == null) {

                map.put("designationError", "Please Select Designation");
            }
          
    
//             if (!contractor.getDesignation().equals("") || contractor.getDesignation() != null) {
//                 if (!contractor.getDesignation().equals("3"))
//                map.put("otherDesignationError", "Please Enter Other Designation");
//            }
            
            Pattern email = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
            if (!(email.matcher(contractor.getEmailid()).matches()) && !contractor.getEmailid().equals("")) {

                map.put("emailError", "Please Enter Valid Email");
            }
            Pattern Name = Pattern.compile("[A-Za-z ]+", Pattern.CASE_INSENSITIVE);
//            if (!(Name.matcher(secondaryContractor.getFirstName()).matches()) && !secondaryContractor.getFirstName().equals("")) {
//
//                mapForValidation.put("firstNameError", "Enter only alphabates");
//            }
            if (!(Name.matcher(contractor.getFirstname()).matches()) && !contractor.getFirstname().equals("")) {

                map.put("firstnameError", "Please Enter Alphabets Only");
            }
             if (!(Name.matcher(contractor.getMiddlename()).matches()) && !contractor.getMiddlename().equals("")) {

                map.put("middlenameError", "Please Enter Alphabets Only");
            }
              if (!(Name.matcher(contractor.getLastname()).matches()) && !contractor.getLastname().equals("")) {

                map.put("lastnameError", "Please Enter Alphabets Only");
            }

            

            Pattern mobile = Pattern.compile("^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$", Pattern.CASE_INSENSITIVE);
            if (!(mobile.matcher(contractor.getMobileno()).matches()) && !contractor.getMobileno().equals("")) {

                map.put("mobilenoError", "Please Enter Valid Mobile No");
            }
           

//      Pattern privilegeNo6 = Pattern.compile("^[6]{1}+$",Pattern.CASE_INSENSITIVE);
//      if((privilegeNo6.matcher(departmentUser.getUserPrivileges()).matches()) && !departmentUser.getUserPrivileges().equals("")){
//      if(departmentUser.getPaclimit().equals("")||departmentUser.getPaclimit().equals(null)){
//       mapForValidation.put("PacError", "Please Enter PAClimit");
//      }
//      
//      }
            System.out.println(" map " + map);
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                return result;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String result = "Noerror";
        return result;
    }
  

  
  
  
  
  
  
  
  
  
  
}
