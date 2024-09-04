 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.AddToCartDao;
import com.eproc.dao.ContractorClassDao;
import com.eproc.dao.TenderDao;
import com.eproc.daoImpl.AddToCartDaoImpl;
import com.eproc.daoImpl.ContractorDesignationDAOImpl;
import com.eproc.daoImpl.CountriesDAOImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.MsmeDAOImpl;
import com.eproc.daoImpl.OrganizationTypeDAOImpl;
import com.eproc.daoImpl.SocialCategoryDAOImpl;
import com.eproc.daoImpl.StatesDAOImpl;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.ContractorDesignation;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.Countries;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.MsmeOrg;
import com.eproc.domain.OrganizationType;
import com.eproc.domain.SocialCategory;
import com.eproc.domain.States;
import com.eproc.domain.Tender;
import com.eproc.util.CommonUtil;
import com.eproc.util.EmailService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Gaurav Dubey
 */
@Controller
public class MainController {

    @Autowired
    ContractorDesignationDAOImpl contractorDesignationDao;
    @Autowired
    DepartmentAdminDAOImpl departmentAdminDAOImpl;
    @Autowired
    EmailService emailService;
     @Autowired
  TenderDao tenderDao;
    
    String deptName;
    
      @Autowired
    AddToCartDaoImpl   addToCartDao; 
      

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
    
    @RequestMapping("/")
    public String departmentAdmin(Model m,RedirectAttributes ra) {
        System.out.println("The User Login to Department Admin");
        m.addAttribute("commonlogin", new Common_Logon_Status());
        m.addAttribute("contractor", new Contractor());
        List<ContractorDesignation> contractorDesignationList = contractorDesignationDao.fetchAll();
        m.addAttribute("contDesignationList", contractorDesignationList);
        
        List<DepartmentAdmin> DepartmentList = departmentAdminDAOImpl.fetchAll();       
        m.addAttribute("DepartmentList", DepartmentList);
        return "index";
    }

    @RequestMapping("/searchTender")
    public String searchTender(Model m) {    
      List<Tender> list = tenderDao.getAllApprovedTender();
      List<Tender> list1=addToCartDao.liveTenderList(list);
       // System.out.println("list size is " +  list1.get(0));
        m.addAttribute("tenderList", list1);
        return "/searchTender";
    }

    @RequestMapping("/Aboutus")
    public String Aboutus(Model m) {
        System.out.println("Aboutus  page");
        return "/Aboutus";
    }

    @RequestMapping("/solution")
    public String solution(Model m) {
        System.out.println("solution page");
        return "/Solution";
    }

    @RequestMapping("/PrivacyPolicy")
    public String PrivacyPolicy(Model m) {
        System.out.println("solution page");
        return "/PrivacyPolicy";
    }

    @RequestMapping("/TermsConditions")
    public String TermsConditions(Model m) {
        System.out.println("solution page");
        return "/TermsConditions";
    }

    @RequestMapping("/resendOTPForDepartmentUser")
    @ResponseBody
    public String resendOTP(HttpSession session, HttpServletRequest request) {
        System.out.println("djgsfjdgbjfsdgbk");
        String generatedotp = "";
      //  generatedotp = CommonUtil.generatePassword();

        String deptMobNo = (String) session.getAttribute("deptMobNo");
        System.out.println("The Department Mobiel Number is: "+deptMobNo);
                generatedotp =  emailService.sendMessage(deptMobNo);
        HttpSession hsession = request.getSession(true);
//                hsession.setAttribute("OTP", generatedotp);
        hsession.setAttribute("OTP_OnMobile", generatedotp);
        
        System.out.println("OTP : " + generatedotp);

        return generatedotp;

    }

}
