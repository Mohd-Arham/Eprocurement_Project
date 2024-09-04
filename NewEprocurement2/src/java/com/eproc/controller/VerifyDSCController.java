package com.eproc.controller;

import com.eproc.dao.DSCInfoDao;
import com.eproc.daoImpl.JnlpStatusDaoImpl;
import com.eproc.domain.DSCInformationForDepartmentUser;
import com.eproc.domain.JnlpStatus;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Map;
import javax.servlet.http.HttpSession;
@Controller
public class VerifyDSCController {

    @Autowired
    JnlpStatusDaoImpl jnlpStatusDaoImpl;
    
    @Autowired
    DSCInfoDao  decInfoDao;

    @RequestMapping(value = "/VerifyDSCProcess", method = RequestMethod.GET)
    public String pdfSignerWEB(ModelMap model, @RequestParam String randomNo, HttpServletRequest request, @RequestParam String dscType, @RequestParam String userType) {
        System.out.println("pdf Signer WEB Ready For Run : " + randomNo);
        System.out.println("userType :  "+userType);
        // changes
       
      //  System.out.println("UserType is "+userType);
        JnlpStatus jnlpStatus = new JnlpStatus();
        jnlpStatus.setRandomNo(randomNo);
        jnlpStatus.setDeptId("2");
        jnlpStatus.setDeptUserId("4");
        jnlpStatus.setStatus("inprocess");
        
        
        
        if (userType != null) {
            if (userType.equals("deptUser")) {
               jnlpStatus.setUrl("/NewEprocurement/departmentUserLogin");
            } else if (userType.equals("Contractor")) {
                
               jnlpStatus.setUrl("/NewEprocurement/getContractorProfile");
            } else if (userType.equals("DeptAdmin")) {
                
              // jnlpStatus.setUrl("/NewEprocurement/AdminDashboard");
               jnlpStatus.setUrl("/NewEprocurement/DepartmentAdminLogin");
            }
        } else {
           jnlpStatus.setUrl("/NewEprocurement");
        }
        
        
        jnlpStatus.setUserId("5");
        
        jnlpStatusDaoImpl.saveJnlpEntry(jnlpStatus);
        model.addAttribute("randomNo", randomNo);
        request.setAttribute("randomNo", randomNo);
        request.setAttribute("dscType", dscType);
        request.setAttribute("userType", userType);
        return "/jnlp/VerifyDSC";
    }
    
    
     @RequestMapping(value = "/ApproveTenderProcess", method = RequestMethod.GET)
    public String approveTenderProcess(ModelMap model, @RequestParam String randomNo, HttpServletRequest request, HttpSession session) {
        System.out.println("Approve Tender Process : " + randomNo);
       for (Map.Entry<String, Object> entry : model.entrySet()) {
    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
}
       System.out.println("department user id is  in verify dsc controller "+session.getAttribute("commanId"));
        
        JnlpStatus jnlpStatus = new JnlpStatus("2", "4", randomNo, "inprocess", "www.LincPay.com", "5");
       
          System.out.println("department user id is  in verify dsc controller "+session.getAttribute("commanId"));
        int deptId=(int)session.getAttribute("commanId");
              
        jnlpStatusDaoImpl.saveJnlpEntry(jnlpStatus);
        
           List<DSCInformationForDepartmentUser>data= decInfoDao.getDepartmentUserData(String.valueOf(deptId), "Signing");
           System.err.println("List size is"+data.size());
           if(!data.isEmpty())
    {
      
            
      DSCInformationForDepartmentUser dSCInformationForDepartmentUser=  data.get(0);
        model.addAttribute("serialNumber", dSCInformationForDepartmentUser.getDscSerialNo());
        session.setAttribute("serialNumber", dSCInformationForDepartmentUser.getDscSerialNo());
        request.setAttribute("serialNumber", dSCInformationForDepartmentUser.getDscSerialNo());
    }
        
//        String serialNumber="14061632";
//        model.addAttribute("serialNumber", serialNumber);
        model.addAttribute("randomNo", randomNo);
        request.setAttribute("randomNo", randomNo);
          request.setAttribute("departmentUserId", deptId);
//        request.setAttribute("serialNumber", serialNumber);
        jnlpStatus.setUrl("/NewEprocurement/departmentUserLogin");
        return "/jnlp/ApproveTenderJNLP";
    }
    
    @RequestMapping(value = "/AmmendTenderProcess", method = RequestMethod.GET)//
    public String ammendTenderProcess(ModelMap model, @RequestParam String randomNo, HttpServletRequest request,HttpSession session) {
        System.out.println("Approve Tender Process : " + randomNo);
        JnlpStatus jnlpStatus = new JnlpStatus("2", "4", randomNo, "inprocess", "www.Lincpay.in", "18");
          int deptId=(int)session.getAttribute("commanId");
        jnlpStatusDaoImpl.saveJnlpEntry(jnlpStatus);
        List<DSCInformationForDepartmentUser>data= decInfoDao.getDepartmentUserData(String.valueOf(deptId), "Signing");
           System.err.println("List size is"+data.size());
           if(!data.isEmpty())
    {
      
            
      DSCInformationForDepartmentUser dSCInformationForDepartmentUser=  data.get(0);
        model.addAttribute("serialNumber", dSCInformationForDepartmentUser.getDscSerialNo());
        session.setAttribute("serialNumber", dSCInformationForDepartmentUser.getDscSerialNo());
        request.setAttribute("serialNumber", dSCInformationForDepartmentUser.getDscSerialNo());
    }
        
//        model.addAttribute("serialNumber", serialNumber);
        model.addAttribute("randomNo", randomNo);
        request.setAttribute("randomNo", randomNo);
         request.setAttribute("departmentUserId", deptId);
//        request.setAttribute("serialNumber", serialNumber);
//         System.out.println("dddddddddddddddddddddddddddddddddddd : "+serialNumber);
        jnlpStatus.setUrl("/NewEprocurement/departmentUserLogin");
        return "/jnlp/AmmendTenderJNLP";
    }
    

    @RequestMapping(value = "/accessJnlpExeStatus", method = RequestMethod.GET)
    public @ResponseBody
    String accessJnlpExeStatus(ModelMap model, @RequestParam String randomNo) {
        //System.out.println("accessJnlpExeStatus randomNo : " + randomNo);
        String data = jnlpStatusDaoImpl.fetchJnlpStatusByRandomNo(randomNo);
        System.err.println(" data is :-"  +data); //added by nagesh
        return data;
    }

    @RequestMapping(value = "/VerifyDSCProcessForDeptUser", method = RequestMethod.GET)
    public String pdfSignerWEBForDeptUser(ModelMap model, @RequestParam String randomNo, HttpServletRequest request) {
        System.out.println("pdf Signer WEB Ready For Run : " + randomNo);
        JnlpStatus jnlpStatus = new JnlpStatus();
        jnlpStatus.setRandomNo(randomNo);
        jnlpStatus.setDeptId("1");
        jnlpStatus.setDeptUserId("4");
        jnlpStatus.setStatus("inprocess");
        jnlpStatus.setUrl("/NewEprocurement/departmentUserLogin");
        jnlpStatus.setUserId("5");
        jnlpStatusDaoImpl.saveJnlpEntry(jnlpStatus);
        model.addAttribute("randomNo", randomNo);
        request.setAttribute("randomNo", randomNo);
        return "/jnlp/VerifyDSC";
    }

    @RequestMapping(value = "/accessJnlpExeStatusForDeptUser", method = RequestMethod.GET)
    public @ResponseBody
    String accessJnlpExeStatusForDeptUser(ModelMap model, @RequestParam String randomNo) {
        //System.out.println("accessJnlpExeStatus randomNo : " + randomNo);
        String data = jnlpStatusDaoImpl.fetchJnlpStatusByRandomNo(randomNo);
        return data;
    }
}