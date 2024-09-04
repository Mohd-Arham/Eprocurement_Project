package com.eproc.model;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.util.GsonUtility;
import java.util.Iterator;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class DepartmentAdminModel {

    @Autowired
    DepartmentAdminDAOImpl departmentAdminDAOImpl;
    @Autowired
    GsonUtility gsonUtility;
      String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpg|png|doc|docx|xl|xlx|pdf|rar|zip|cdr|dwg))$";
      String passwordpattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";
      String mobpattern = "^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$";
      String ifscreg = "^([A-Za-z]{4}[0-9]{6,7})$";
      String accnumreg = "(^\\d{9,18}$)";
      String emailpattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$";
      String descriptReg = "^\\s*(\\S+\\s+){0,300}+\\S*$";
    public boolean validateForUpdateAdmin(@ModelAttribute("departmentadmin") DepartmentAdmin department) {
        System.out.println("start Calling class DepartmentModel to validate department in validateForUpdateDept");
        Map map = new HashMap();
        Gson gson = new Gson();
        boolean validateStatus = false;

   
        List<DepartmentAdmin> DepartmentList = departmentAdminDAOImpl.fetchAll();
        Iterator<DepartmentAdmin> iterator = DepartmentList.listIterator();
        try {

            if ((department.getDeptAdminName() == null) || (department.getDeptAdminName().trim().equals(""))) {
                System.out.println("departmentadmin.getDeptAdminName()" + department.getDeptAdminName());
                map.put("deptAdminName", "Admin Name is required");
            }
            if ((department.getDesignation() == null) || (department.getDesignation().trim().equals(""))) {
                System.out.println("departmentadmin.getDesignation()" + department.getDesignation());
                map.put("designation", "Designation is required");
            }
            if ((department.getDeptMobNo() == null) || (department.getDeptMobNo().trim().equals(""))) {
                System.out.println("departmentadmin.getDesignation()" + department.getDeptMobNo());
                map.put("deptMobNo", "Mobile number is required");
            } else if (!(department.getDeptMobNo().length() == 10)) {
                System.out.println("departmentadmin.getDeptMobNo().length()");
                map.put("deptMobNo", "Mobile no. must have 10 digit");
            } else if (!department.getDeptMobNo().matches(mobpattern)) {
                System.out.println("!departmentadmin.getDeptMobNo().matches(mobpattern)");
                map.put("deptMobNo", "Invalid mobile no.");
            }

            if ((department.getDeptEmailId() == null) || (department.getDeptEmailId().trim().equals(""))) {
                System.out.println("departmentadmin.getDeptEmailId()" + department.getDeptEmailId());
                map.put("deptEmailId", "Email Id is required");
            }
          else  if (!department.getDeptEmailId().matches(emailpattern)) {
                System.out.println("departmentadmin.getDeptEmailId().matches(emailpattern)");
                map.put("deptEmailId", "Invalid Department E-mail Id");
            }  
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                validateStatus = true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("End class DepartmentModel to validate department in validateForUpdateDept");
        return validateStatus;
    }
    
     public boolean validateForUpdateDept(DepartmentAdmin department) {
        System.out.println("start Calling class DepartmentModel to validate dept in validateForUpdateDept");
        Map map = new HashMap();
        Gson gson = new Gson();
        boolean flag = false;
        try {
            

             if ((department.getBankBranchName()== null) || (department.getBankBranchName().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("bankBranchName", "Branch Name is required");
            }
             
             if ((department.getDeptAddress()== null) || (department.getDeptAddress().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("deptAddress", "Address is required");
            }
              if ((department.getIfscCode()== null) || (department.getIfscCode().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("ifscCode", "IFSC Code is required");
            }
              else if(!department.getIfscCode().matches(ifscreg)){
                  System.out.println("::::::::::::2");
                map.put("ifscCode", "Invalid IFSC Code"); 
              }
               System.out.println("password"+department.getDeptLoginPass());
            if (department.getDeptLoginPass() == null || department.getDeptLoginPass().trim().equalsIgnoreCase("")) {

                map.put("deptLoginPass", "Password is required");
            }
            else 
                if (!department.getDeptLoginPass().matches(passwordpattern)) {
                map.put("deptLoginPass", "Passwords must contain at least eight characters, including uppercase, lowercase letters ,numbers and special symbol.");
            }
               if ((department.getSubAccountName()== null) || (department.getSubAccountName().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("subAccountName", "SubAccount Name is required");
            }
                if ((department.getDeptDescription()== null) || (department.getDeptDescription().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("deptDescription", "Description is required");
            }
                else if(!department.getDeptDescription().matches(descriptReg))
                {
                     map.put("deptDescription", "Description should not have more than 300 words");
                }
//            if(department.getCropedFile()==null)
//            {
//                 map.put("file-input", "Please select logo");
//            }          
//            else 
//                if (!department.getDeptLogoFileName().matches(IMAGE_PATTERN)) {
//                map.put("file-input", "Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.");
//            }
// 
//
//                 if (!department.getDeptWorkOrderFileName().matches(IMAGE_PATTERN)) {
//                map.put("workOrder", "Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.");
//            }
            
            if ((department.getAccountNumber()== null) || (department.getAccountNumber().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("accountNumber", "Account number is required");
            }
                 else if(!department.getAccountNumber().matches(accnumreg))
            {
             System.out.println("::::::::::::2");
                map.put("accountNumber", "Invalid Account number");    
            }
            if(department.getBankName()== null || department.getBankName().trim().equals("")) {
                map.put("bankName", "Please select Bank Name");
            }
            else  if (department.getBankName().trim().equals("Other") && (department.getBankOtherName()==null || department.getBankOtherName().trim().equals(""))) {
                map.put("bankOtherName", "Bank Name is required");
            }  
            
            if ((department.getDeptName() == null) || (department.getDeptName().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("deptName", "Department Name is required");
            }
            if ((department.getDeptShortName() == null) || (department.getDeptShortName().trim().equals(""))) {
                System.out.println("::::::::::::2");
                map.put("deptShortName", "Short Name is required");
            }
            if ((department.getAuctionPrefix() == null) || (department.getAuctionPrefix().trim().equals(""))) {
                System.out.println("::::::::::::6");
                map.put("auctionPrefix", "Auction Prefix is required");
            }
            if ((department.getAuctionStartingNo() == null) || (department.getAuctionStartingNo().trim().equals(""))) {
                System.out.println("::::::::::::6");
                map.put("auctionStartingNo", "Auction Starting No. is required");
            }
            if ((department.getTenderPrefix() == null) || (department.getTenderPrefix().trim().equals(""))) {
                System.out.println("::::::::::::6");
                map.put("tenderPrefix", "Tender Prefix is required");
            }
            if ((department.getTenderStartingNo() == null) || (department.getTenderStartingNo().trim().equals(""))) {
                System.out.println("::::::::::::6");
                map.put("tenderStartingNo", "Tender Starting No. is required");
            }
//             if (!(department.getDeptFaxNo().length() == 10)) {
//                System.out.println("::::::::::::5");
//                map.put("deptFaxNo", "Department fax no. must have 10 digit");
//            } else if (!department.getDeptFaxNo().matches(mobpattern)) {
//                map.put("deptFaxNo", "Invalid Fax no.");
//            }

            if ((department.getDeptPhoneNo() == null) || (department.getDeptPhoneNo().trim().equals(""))) {
                System.out.println("::::::::::::4");
                map.put("deptPhoneNo", "Department phone no. is required");
            } 
              else if (!(department.getDeptPhoneNo().length() == 10)) {
                System.out.println("::::::::::::5");
                map.put("deptPhoneNo", "Department phone no. must have 10 digit");
            }
            else if (!department.getDeptPhoneNo().matches(mobpattern)) {
                map.put("deptPhoneNo", "Invalid phone no.");
            }
//
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                flag = true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }
}

