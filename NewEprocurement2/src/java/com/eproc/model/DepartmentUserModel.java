/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.DepartmentUser;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 *
 * @author Vaishali Gupta
 */
@Component
public class DepartmentUserModel {
    @Autowired
    GsonUtility gsonUtility;
  
    
     public String validate(DepartmentUser departmentUser) throws IOException {
       System.out.println("Calling class Department its method validate");
       Map mapForValidation = new HashMap();
        Gson gson = new Gson();
       
       
       try{
           
        if(departmentUser.getUserPrivileges() == null||departmentUser.getUserPrivileges().equals("") ){
     mapForValidation.put("userPrivilegesError", "Please Select Atleast One Privileges");
     }    
           
           
     if(departmentUser.getFirstName().equals("")||departmentUser.getFirstName() == null ){
     mapForValidation.put("firstNameError", "Please Enter FirstName");
     }
     
      if(departmentUser.getLastName().equals("")||departmentUser.getLastName() == null ){
     mapForValidation.put("lastNameError", "Please Enter LastName");
     }
     
      if(departmentUser.getEmailAdd().equals("")||departmentUser.getEmailAdd() == null ){
     mapForValidation.put("EmailError", "Please Enter Email");
     }
     
//      if(departmentUser.getPassword().equals("") ){
//     mapForValidation.put("PasswordError", "Please Enter Password");
//     }
     
      if(departmentUser.getAddress().equals("")||departmentUser.getAddress() == null ){
     mapForValidation.put("AddressError", "Please Enter Address");
     }
     
      if(departmentUser.getMobNo().equals("")||departmentUser.getMobNo() == null ){
     mapForValidation.put("MobileNoError", "Please Enter Mobile No.");
     }
     
      if(departmentUser.getDesignationName() == null ){
     mapForValidation.put("designationError", "Please Select Designation");
     }
     
      if(departmentUser.getDeptcircle()== null ){
     mapForValidation.put("circleError", "Please Select Circle");
     }
     
      if(departmentUser.getDeptDivision()==null) {
     mapForValidation.put("divisionError", "Please Select Division");
     }
     
      if(departmentUser.getDeptSubDivision() == null ){
     mapForValidation.put("subDivisionError", "Please Select SubDivision");
     }
     
      if(departmentUser.getPincode().equals("")||departmentUser.getPincode() == null ){
     mapForValidation.put("pincodeError", "Please Enter Pincode");
     }
     
     
     
          
       Pattern email = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",Pattern.CASE_INSENSITIVE);
      if (!(email.matcher(departmentUser.getEmailAdd()).matches()) && !departmentUser.getEmailAdd().equals("")) {
         mapForValidation.put("EmailError", "Please Enter Valid Email");
      }   
      
       Pattern Name = Pattern.compile("[A-Za-z ]+",Pattern.CASE_INSENSITIVE);
      if (!(Name.matcher(departmentUser.getFirstName()).matches()) && !departmentUser.getFirstName().equals("")) {
         mapForValidation.put("firstNameError", "Enter only alphabates");
      }
      if(!(Name.matcher(departmentUser.getLastName()).matches()) && !departmentUser.getLastName().equals("")) {
         mapForValidation.put("lastNameError", "Enter only alphabates");
      }
      
//      
//        Pattern password = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$",Pattern.CASE_INSENSITIVE);
//      if (!(password.matcher(departmentUser.getPassword()).matches()) && !departmentUser.getPassword().equals("")) {
//         mapForValidation.put("PasswordError", "Enter valid Password");
//      }   
//      
        Pattern pincode = Pattern.compile("^(([1-9][0-9]{5}))$",Pattern.CASE_INSENSITIVE);
      if (!(pincode.matcher(departmentUser.getPincode()).matches()) && !departmentUser.getPincode().equals("")) {
         mapForValidation.put("pincodeError", "Enter valid Pincode");
      }   
      
        Pattern mobile = Pattern.compile("^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$",Pattern.CASE_INSENSITIVE);
      if (!(mobile.matcher(departmentUser.getMobNo()).matches()) && !departmentUser.getMobNo().equals("")) {
         mapForValidation.put("MobileNoError", "Enter Valid Mobile No");
      }   
      
        Pattern address = Pattern.compile("^(([a-zA-Z0-9 ]+$))",Pattern.CASE_INSENSITIVE);
      if (!(address.matcher(departmentUser.getAddress()).matches()) && !departmentUser.getAddress().equals("")) {
         mapForValidation.put("AddressError", "Enter valid Address");
      }   
      
      
//      Pattern privilegeNo6 = Pattern.compile("^[6]{1}+$",Pattern.CASE_INSENSITIVE);
//      if((privilegeNo6.matcher(departmentUser.getUserPrivileges()).matches()) && !departmentUser.getUserPrivileges().equals("")){
//      if(departmentUser.getPaclimit().equals("")||departmentUser.getPaclimit().equals(null)){
//       mapForValidation.put("PacError", "Please Enter PAClimit");
//      }
//      
//      }

           System.out.println(" map "+mapForValidation);
      if (mapForValidation.size() >= 1) {
                 String result = gson.toJson(mapForValidation);
                System.out.println("response "+result);
                gsonUtility.writeData(result);
                return result;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String result="Noerror";
    return result;
    }
     
      public String validateOnUpdate(DepartmentUser departmentUser) throws IOException {
       System.out.println("Calling class Department its method validate");
       Map mapForValidation = new HashMap();
        Gson gson = new Gson();
       
       
       try{
           
           
            if(departmentUser.getFirstName().equals("")||departmentUser.getFirstName() == null ){
     mapForValidation.put("firstNameError", "Please Enter FirstName");
     }
     
      if(departmentUser.getLastName().equals("")||departmentUser.getLastName() == null ){
     mapForValidation.put("lastNameError", "Please Enter LastName");
     }
      
      
        if(departmentUser.getUserPrivileges() == null||departmentUser.getUserPrivileges().equals("") ){
     mapForValidation.put("userPrivilegesError", "Please Select Atleast One Privileges");
     }    
           
           
   
     
      if(departmentUser.getAddress().equals("")||departmentUser.getAddress() == null ){
     mapForValidation.put("AddressError", "Please Enter Address");
     }
     
    
      if(departmentUser.getDesignationName() == null ){
     mapForValidation.put("designationError", "Please Select Designation");
     }
     
      if(departmentUser.getDeptcircle()== null ){
     mapForValidation.put("circleError", "Please Select Circle");
     }
     
      if(departmentUser.getDeptDivision()==null) {
     mapForValidation.put("divisionError", "Please Select Division");
     }
     
      if(departmentUser.getDeptSubDivision() == null ){
     mapForValidation.put("subDivisionError", "Please Select SubDivision");
     }
     
      if(departmentUser.getPincode().equals("")||departmentUser.getPincode() == null ){
     mapForValidation.put("pincodeError", "Please Enter Pincode");
     }
     
      
        Pattern pincode = Pattern.compile("^(([1-9][0-9]{5}))$",Pattern.CASE_INSENSITIVE);
      if (!(pincode.matcher(departmentUser.getPincode()).matches()) && !departmentUser.getPincode().equals("")) {
         mapForValidation.put("pincodeError", "Enter valid Pincode");
      }   
      
        Pattern address = Pattern.compile("^(([a-zA-Z0-9 ]+$))",Pattern.CASE_INSENSITIVE);
      if (!(address.matcher(departmentUser.getAddress()).matches()) && !departmentUser.getAddress().equals("")) {
         mapForValidation.put("AddressError", "Enter valid Address");
      }   
      
       Pattern Name = Pattern.compile("[A-Za-z ]+",Pattern.CASE_INSENSITIVE);
      if (!(Name.matcher(departmentUser.getFirstName()).matches()) && !departmentUser.getFirstName().equals("")) {
         mapForValidation.put("firstNameError", "Enter only alphabates");
      }
      if(!(Name.matcher(departmentUser.getLastName()).matches()) && !departmentUser.getLastName().equals("")) {
         mapForValidation.put("lastNameError", "Enter only alphabates");
      }
      
      
//      Pattern privilegeNo6 = Pattern.compile("^[6]{1}+$",Pattern.CASE_INSENSITIVE);
//      if((privilegeNo6.matcher(departmentUser.getUserPrivileges()).matches()) && !departmentUser.getUserPrivileges().equals("")){
//      if(departmentUser.getPaclimit().equals("")||departmentUser.getPaclimit().equals(null)){
//       mapForValidation.put("PacError", "Please Enter PAClimit");
//      }
//      
//      }

           System.out.println(" map "+mapForValidation);
      if (mapForValidation.size() >= 1) {
                 String result = gson.toJson(mapForValidation);
                System.out.println("response "+result);
                gsonUtility.writeData(result);
                return result;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String result="Noerror";
    return result;
      
      }

      
      
      
      
       public String validateOnSecondaryUserReg(DepartmentUser departmentUser) throws IOException {
       System.out.println("Calling class Department its method validate");
       Map mapForValidation = new HashMap();
        Gson gson = new Gson();
       
       
       try{
           
           
            
     
     
      
      
        if(departmentUser.getUserPrivileges() == null||departmentUser.getUserPrivileges().equals("") ){
     mapForValidation.put("userPrivilegesError", "Please Select Atleast One Privileges");
     }    
           
           
   
     
      if(departmentUser.getAddress().equals("")||departmentUser.getAddress() == null ){
     mapForValidation.put("AddressError", "Please Enter Address");
     }
     
    
      if(departmentUser.getDesignationName() == null ){
     mapForValidation.put("designationError", "Please Select Designation");
     }
     
      if(departmentUser.getDeptcircle()== null ){
     mapForValidation.put("circleError", "Please Select Circle");
     }
     
      if(departmentUser.getDeptDivision()==null) {
     mapForValidation.put("divisionError", "Please Select Division");
     }
     
      if(departmentUser.getDeptSubDivision() == null ){
     mapForValidation.put("subDivisionError", "Please Select SubDivision");
     }
     
      if(departmentUser.getPincode().equals("")||departmentUser.getPincode() == null ){
     mapForValidation.put("pincodeError", "Please Enter Pincode");
     }
     
      
        Pattern pincode = Pattern.compile("^(([1-9][0-9]{5}))$",Pattern.CASE_INSENSITIVE);
      if (!(pincode.matcher(departmentUser.getPincode()).matches()) && !departmentUser.getPincode().equals("")) {
         mapForValidation.put("pincodeError", "Enter valid Pincode");
      }   
      
        Pattern address = Pattern.compile("^(([a-zA-Z0-9 ]+$))",Pattern.CASE_INSENSITIVE);
      if (!(address.matcher(departmentUser.getAddress()).matches()) && !departmentUser.getAddress().equals("")) {
         mapForValidation.put("AddressError", "Enter valid Address");
      }   
      
      
      
      
//      Pattern privilegeNo6 = Pattern.compile("^[6]{1}+$",Pattern.CASE_INSENSITIVE);
//      if((privilegeNo6.matcher(departmentUser.getUserPrivileges()).matches()) && !departmentUser.getUserPrivileges().equals("")){
//      if(departmentUser.getPaclimit().equals("")||departmentUser.getPaclimit().equals(null)){
//       mapForValidation.put("PacError", "Please Enter PAClimit");
//      }
//      
//      }

           System.out.println(" map "+mapForValidation);
      if (mapForValidation.size() >= 1) {
                 String result = gson.toJson(mapForValidation);
                System.out.println("response "+result);
                gsonUtility.writeData(result);
                return result;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String result="Noerror";
    return result;
      
      }
}



