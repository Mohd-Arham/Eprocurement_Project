/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;
import com.eproc.domain.EmdPayment;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EmdModel {

    @Autowired
    GsonUtility gsonUtility;

    public boolean validateEmd(EmdPayment emdpayment) {
        System.out.println("start Calling class EmdModel validate");
        Map map = new HashMap();
        Gson gson = new Gson();
        boolean flag = true;
//        String emailpattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$";
//        String passwordpattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";
//        String mobpattern = "^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$";
//        String remark= "^[a-zA-Z0-9]$";
        String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpg|png|doc|docx|xl|xlx|pdf|rar|zip|cdr|dwg))$)";
        String alpha = "^[a-zA-Z]+$";
        String neu ="^[0-9]*$";
        try {
            System.out.println("emdpayment.getBank()" + emdpayment.getBankName());
            if (emdpayment.getEmdCopyFile() == null ) {
                map.put("emdCopy", "Emd copy can not be empty");
            } 
            else if (!emdpayment.getEmdCopy().matches(IMAGE_PATTERN)) {
                map.put("emdCopy", "Please upload file having extensions jpg,png,doc,docx,xl,xlx,pdf,rar,zip,cdr,dwg");
                
            }
             if(emdpayment.getBankName() == null || emdpayment.getBankName().trim().equals("")) {
                map.put("bankName", "Please select Bank Name");
            }
            else  if (emdpayment.getBankName().trim().equals("Other") && (emdpayment.getBankOtherName()==null || emdpayment.getBankOtherName().trim().equals(""))) {
                map.put("bankOtherName", "Bank Name can not be empty");
            }    
            if (emdpayment.getEmdValidity() == null || emdpayment.getEmdValidity().trim().equals("")) {
                map.put("emdValidity", "Emd Validity can not be empty");

            }
            else if(!emdpayment.getEmdValidity().matches(neu))
            {
              map.put("emdValidity", "Month Number should be neumeric");;
            }
            if (emdpayment.getBankBranchName() == null || emdpayment.getBankBranchName().trim().equals("")) {
                map.put("bankBranchName", "Branch Name can not be empty");
            }
            else if(!emdpayment.getBankBranchName().matches(alpha)) {
                map.put("bankBranchName", "Branch Name should be alphabetic");
            }
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                flag = false;
                return flag;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
//        String resultt = "Noerror";
        return flag;
    }         
        public boolean validateEmdForUpdate(EmdPayment emdpayment) {
        System.out.println("start Calling class EmdModel validateEmdForUpdate");
        Map map = new HashMap();
        Gson gson = new Gson();
        boolean flag = true;
        String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpg|png|doc|docx|xl|xlx|pdf|rar|zip|cdr|dwg))$)";
        String alpha = "^[a-zA-Z]+$";
        String neu ="^[0-9]*$";
        try {
            System.out.println("emdpayment.getBank()" + emdpayment.getBankName());
          if (!emdpayment.getEmdCopy().matches(IMAGE_PATTERN)) {
                map.put("emdCopy", "Please upload file having extensions jpg,png,doc,docx,xl,xlx,pdf,rar,zip,cdr,dwg");
                
            }
                 if (emdpayment.getEmdValidity() == null || emdpayment.getEmdValidity().trim().equals("")) {
                map.put("emdValidity", "Emd Validity can not be empty");

            }
                 else  if(!emdpayment.getEmdValidity().matches(neu))
            {
              map.put("emdValidity", "Month Number should be neumeric");
            }
                 
               if (emdpayment.getBankBranchName() == null || emdpayment.getBankBranchName().trim().equals("")) {
                map.put("bankBranchName", "Branch Name can not be empty");
            }
             else  if(!emdpayment.getBankBranchName().matches(alpha)) {
                map.put("bankBranchName", "Branch Name should be alphabetic");
            }
            if (map.size() >= 1) {
                String result = gson.toJson(map);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                flag = false;
                return flag;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
//        String resultt = "Noerror";
        return flag;
    }
}
