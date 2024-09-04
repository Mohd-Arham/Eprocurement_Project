/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.dao.SecondaryContractorDAO;
import com.eproc.domain.Contractor;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.Secondary_Contractor;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vaishali Gupta
 */
//@Component
@Controller
public class Secondary_ContractorModel {

    @Autowired
    GsonUtility gsonUtility;
     @Autowired
    SecondaryContractorDAO secondaryContractorDAO;
    
    
    
@RequestMapping("/validate")
@ResponseBody
    public String validate(@ModelAttribute("secondaryContractor") Secondary_Contractor secondaryContractor) {
        System.out.println("/Calling class Secondary_Contractor its method validate/");
        Map mapForValidation = new HashMap();
        Gson gson = new Gson();
       boolean flag = false;

        try {

//            if (secondaryContractor.getContractor_privilege() == null || secondaryContractor.getContractor_privilege().equals("")) {
//                mapForValidation.put("secondaryContractorPrivilegesError", "Please Select Atleast One Privileges");
//
//            }
         

            if ( secondaryContractor.getFirstName() == null|| secondaryContractor.getFirstName().equals("")) {

                mapForValidation.put("firstNameError", "Please Enter FirstName");
            }

            if (secondaryContractor.getLastName().equals("") || secondaryContractor.getLastName() == null) {

                mapForValidation.put("lastNameError", "Please Enter LastName");
            }

            if (secondaryContractor.getEmailid().equals("") || secondaryContractor.getEmailid() == null) {

                mapForValidation.put("emailidError", "Please Enter Email");
            }
           if (secondaryContractor.getDesignation().equals("") || secondaryContractor.getDesignation() == null) {

                mapForValidation.put("designationError", "Please Select Designation");
            }


            if (secondaryContractor.getMobileno().equals("") || secondaryContractor.getMobileno() == null) {

                mapForValidation.put("mobile_noError", "Please Enter Mobile No.");
            }

            Pattern email = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
            if (!(email.matcher(secondaryContractor.getEmailid()).matches()) && !secondaryContractor.getEmailid().equals("")) {

                mapForValidation.put("emailidError", "Please Enter Valid Email");
            }
          if( !secondaryContractor.getEmailid().equals(""))  {
          flag = secondaryContractorDAO.checkDuplicateEmail(secondaryContractor.getEmailid());
          System.out.println("flag for checking email is:  " + flag);
          if (flag == true) {
           mapForValidation.put("emailidError", "Email Id is Already Registered");
           }
         }

            Pattern Name = Pattern.compile("[A-Za-z ]+", Pattern.CASE_INSENSITIVE);
//            if (!(Name.matcher(secondaryContractor.getFirstName()).matches()) && !secondaryContractor.getFirstName().equals("")) {
//
//                mapForValidation.put("firstNameError", "Enter only alphabates");
//            }
            if (!(Name.matcher(secondaryContractor.getLastName()).matches()) && !secondaryContractor.getLastName().equals("")) {

                mapForValidation.put("lastNameError", "Enter only alphabates");
            }

//            Pattern password = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$", Pattern.CASE_INSENSITIVE);
//            if (!(password.matcher(secondaryContractor.getPassword()).matches()) && !secondaryContractor.getPassword().equals("")) {
//
//                mapForValidation.put("passwordError", "Enter valid Password");
//            }

            Pattern mobile = Pattern.compile("^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$", Pattern.CASE_INSENSITIVE);
            if (!(mobile.matcher(secondaryContractor.getMobileno()).matches()) && !secondaryContractor.getMobileno().equals("")) {

                mapForValidation.put("mobile_noError", "Enter Valid Mobile No");
            }
            if( !secondaryContractor.getMobileno().equals("")){
             flag = secondaryContractorDAO.checkDuplicateContect(secondaryContractor.getMobileno());
                 System.out.println("flag for checking mobile  is:  " + flag);
         if (flag == true) {
             mapForValidation.put("mobile_noError", "Mobile Number is Already Registered");
           }
          }

//      Pattern privilegeNo6 = Pattern.compile("^[6]{1}+$",Pattern.CASE_INSENSITIVE);
//      if((privilegeNo6.matcher(departmentUser.getUserPrivileges()).matches()) && !departmentUser.getUserPrivileges().equals("")){
//      if(departmentUser.getPaclimit().equals("")||departmentUser.getPaclimit().equals(null)){
//       mapForValidation.put("PacError", "Please Enter PAClimit");
//      }
//      
//      }
            System.out.println(" map " + mapForValidation);
            if (mapForValidation.size() >= 1) {
                String result = gson.toJson(mapForValidation);
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
