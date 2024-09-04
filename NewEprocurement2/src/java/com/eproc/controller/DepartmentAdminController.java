/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.BidderPrivilegeDAO;
import com.eproc.dao.SecondaryContractorDAO;
import com.eproc.daoImpl.CircleDAOImpl;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.ContractorLogsDaoImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.DepartmentSecondaryUserDaoImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.DesignationDaoImpl;
import com.eproc.daoImpl.DivisionDAOImpl;
import com.eproc.daoImpl.SubDivisionDAOImpl;
import com.eproc.domain.Circle;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorLogs;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Designation;
import com.eproc.domain.Division;
import com.eproc.domain.Logs;
import com.eproc.domain.Secondary_Contractor;
import com.eproc.domain.SubDivision;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.DepartmentAdminModel;
import com.eproc.service.DepartmentService;
import com.eproc.util.AesEncrDec;
import com.eproc.util.CommonUtil;
import com.eproc.util.EmailService;
import com.eproc.util.GsonUtility;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.crypto.SecretKey;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Naina Jain
 */
@Controller
public class DepartmentAdminController {

    private String generatedotp;
    private String generatedOTP;
 static String emailFromRecipient = "info@lotusprocure.in";
    @Autowired
    EmailService emailService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;

    @Autowired
    DepartmentSecondaryUserDaoImpl departmentSecondaryUserDaoImpl;

    @Autowired
    ContractorDetailsdaoImpl contractor_detailsdaoImpl;

    @Autowired
    DepartmentAdminDAOImpl departmentAdminDaoImpl;
    @Autowired
    ContractorLogsDaoImpl contractorlogsdao;

    CommonUtil commonUtil = new CommonUtil();

    @Autowired
    LogsAction logsAction;
    @Autowired
    LogsActionDao logsActionDao;
 

    @Autowired
    AesEncrDec aesEncrDec;

    @Autowired
    ContractorDaoImpl contractorDaoImpl;
    @Autowired
    DesignationDaoImpl designationdao;
    @Autowired
    CircleDAOImpl circleDao;
    @Autowired
    DivisionDAOImpl divisionDao;
    @Autowired
    SubDivisionDAOImpl subDivisionDao;
    @Autowired
    SecondaryContractorDAO secondaryContractorDAO;
    @Autowired
    BidderPrivilegeDAO bidderPrivilegeDAO;
    @Autowired
    DepartmentAdminModel departmentAdminModel;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    DepartmentService departmentService;
    
    @Value("${secret.key}")
    private String secretKey;

    @RequestMapping("/DepartmentAdminLogin")
    public String departmentAdminDashboard(Model m, HttpSession session) {

        Integer deptId = (Integer) session.getAttribute("deptId");
        List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptId);
        List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID(deptId);
        List<Division> divisionList = divisionDao.fetchAllbyDept_ID(deptId);
        List<SubDivision> subDivisionList = subDivisionDao.fetchAllbyDept_ID(deptId);

        if (circleList.size() == 0) {
            m.addAttribute("circleList", "size is zero");
        } else {
            m.addAttribute("circleList", circleList);
        }

        if (designationList.size() == 0) {
            m.addAttribute("designationList", "size is zero");
        } else {
            m.addAttribute("designationList", designationList);
        }

        if (divisionList.size() == 0) {
            m.addAttribute("divisionList", "size is zero");
        } else {
            m.addAttribute("divisionList", divisionList);
        }

        if (subDivisionList.size() == 0) {
            m.addAttribute("subDivisionList", "size is zero");
        } else {
            m.addAttribute("subDivisionList", subDivisionList);
        }

        return "DepartmentAdmin/AdminDashboard";
    }

//*************************Naina Jain's Code Start*************************//
    @RequestMapping("/DeptAdminLogin")
    public String DeptAdminLogin(@ModelAttribute("deptAdminLogin") DepartmentAdmin deptAdminLogin, @ModelAttribute("commonlogin") Common_Logon_Status commonlogin, Model m, @RequestParam String deptEmailId,
            @RequestParam String deptLoginPass, HttpServletRequest request, RedirectAttributes ra) {
        System.out.println("**************DeptAdminLogin method run**************" + deptLoginPass);
        String password2 = "";
        String decrypted_pass = "";
        HttpSession session = request.getSession(true);
        try {
            String txtCaptchaInput = deptAdminLogin.getTxtCaptchaInput();
            System.out.println("$$$$$$$ txtCaptcha $$$$$::" + txtCaptchaInput);
            if (txtCaptchaInput.equalsIgnoreCase("")) {
                ra.addFlashAttribute("msg2", "Must Keep Captcha");
                return "redirect:/";
            }
            String validUser = deptEmailId.trim();
            boolean userExists = departmentAdminDaoImpl.checkLogin(validUser);
            System.out.println("The user Exits: " + userExists);
            List<DepartmentAdmin> departmentAdminList = departmentAdminDaoImpl.fetchAll();
            Iterator<DepartmentAdmin> iterator = departmentAdminList.iterator();
            if (userExists) {
                while (iterator.hasNext()) {
                    DepartmentAdmin deptAdmin = iterator.next();
                    if (deptAdmin.getDeptLoginPass() != null) {
                        //secretKey = deptAdmin.getSecretKey();
                        System.out.println("The Secret Key: " + secretKey);
                        password2 = deptAdmin.getDeptLoginPass();
                        System.out.println("The Secret Key: " + secretKey);
                        decrypted_pass = "Password";
                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
                    }
                    if (deptLoginPass.contains(" ")) {
                        System.out.println("!!!!!!!!!!!!!! space check");
                        String invalidUserAdmin = "Sorry..!!!Password does not contain spaces";
                        ra.addFlashAttribute("invalidUserAdmin", invalidUserAdmin);
                        return "redirect:/";
                    }
//                    String pwd = commonUtil.encrypt(enc_pwd, "0xFACA");
                    if ((validUser.equalsIgnoreCase(deptAdmin.getDeptEmailId()) || validUser.equals(deptAdmin.getDeptMobNo())) && decrypted_pass.equals(deptLoginPass)) {
                        Date date = new Date();
                        commonlogin.setCurrent_Login(date);
                        commonlogin.setEmailid(deptAdmin.getDeptEmailId());
                        commonlogin.setMobileno(deptAdmin.getDeptMobNo());
                        commonlogin.setRole(deptAdmin.getRole());
                        departmentAdminDaoImpl.saveStatus(commonlogin);

                        session.setAttribute("deptId", deptAdmin.getDeptId());
                        session.setAttribute("deptName", deptAdmin.getDeptName());
                        session.setAttribute("deptEmailId", deptAdmin.getDeptEmailId());
                        session.setAttribute("deptMobNo", deptAdmin.getDeptMobNo());
                        session.setAttribute("Current_Login", commonlogin.getCurrent_Login());
                        session.setAttribute("role", deptAdmin.getRole());
                        session.setAttribute("Id", commonlogin.getId());
                        generatedotp =  emailService.sendMessage(deptAdmin.getDeptMobNo());
//                        generatedotp = CommonUtil.generatePassword();
                        System.out.println("OTP : " + generatedotp);

                        m.addAttribute("generatedotp", generatedotp);

                        return "DepartmentAdmin/OTPVerificationDeptAdmin";
                    }
                }
            }
            System.out.println("*******************END****************************************");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String invalidUserAdmin = "Sorry..!!!You have entered wrong ID and Password";
        ra.addFlashAttribute("invalidUserAdmin", invalidUserAdmin);
        return "redirect:/";
    }

    @RequestMapping("/logoutDeptAdmin")
    public String logoutDeptAdmin(@ModelAttribute("commonlogin") Common_Logon_Status commonlogin, HttpServletRequest request, RedirectAttributes ra) {
        HttpSession session = request.getSession(true);

        try {
            List<Common_Logon_Status> common_logonList = departmentAdminDaoImpl.fetchAllLogonStatus();
            Iterator<Common_Logon_Status> iterator = common_logonList.iterator();
            while (iterator.hasNext()) {
                Common_Logon_Status cls = iterator.next();
                int id = (int) session.getAttribute("Id");
                if (cls.getId() == id) {
                    commonlogin.setIp_Address(logsAction.fetchIpAddress());
                    commonlogin.setOsName(logsAction.FetchOSName());
                    commonlogin.setMac_Address(logsAction.fetchMacAddress());
                    commonlogin.setBrowserName(logsAction.getClientBrowser(request));
                    commonlogin.setCurrent_Login((Date) session.getAttribute("Current_Login"));
                    commonlogin.setRole((String) session.getAttribute("role"));
                    commonlogin.setEmailid((String) session.getAttribute("deptEmailId"));
                    commonlogin.setMobileno((String) session.getAttribute("deptMobNo"));
                    Date date = new Date();
                    commonlogin.setLogout_Time(date);
                    commonlogin.setId(id);
                    departmentAdminDaoImpl.saveStatus(commonlogin);
                    session.invalidate();
                    System.out.println("");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        ra.addFlashAttribute("msg", "Logged Out SuccessFully");
        return "redirect:/";
    }
//*************************Naina Jain's Code END*************************//

    //****************************** Common Login  ***************************//
//    @RequestMapping("/login")
//    public String login(@ModelAttribute("commonlogin") Common_Logon_Status commonlogin, Model m, @RequestParam String emailid,
//            HttpServletRequest request, RedirectAttributes ra, HttpSession session) {
//        System.out.println("**************dept User login method run***  " + commonlogin.getPassword() + "  ***********");
//        Map<String, DepartmentAdmin_OLD> deptoption = new LinkedHashMap<>();
//        Map<String, String> privilege = new LinkedHashMap<String, String>();
//        String returnHome = "redirect:/";
//        String otpstatus = "";
//        String password2 = "";
//        String decrypted_pass = "";
//        List common_logonList = null;
//        Integer contRegSecId = 0;
//        Integer contRegPriId = 0;
//        Date date = new Date();
//        String checkCaptcha = commonlogin.getTxtCaptchaInput();
//        System.out.println("checkCaptcha:" + checkCaptcha);
//        if (checkCaptcha.equalsIgnoreCase("")) {
//            ra.addFlashAttribute("msg1", "Must Keep Captcha");
//            return returnHome;
//        }
//        try {
//            String validUser = emailid.trim();
//            System.out.println("Valid user is:" + validUser);
//            if (commonlogin.getPassword().contains(" ")) {
//                String invalidUser = "Sorry..!!!Password does not contain spaces";
//                ra.addFlashAttribute("invalidUser", invalidUser);
//                return returnHome;
//            }
////            List userExists = departmentUserDaoImpl.checkLogin1(validUser);
//            String userExists = departmentUserDaoImpl.checkLogin(validUser);
//            System.out.println("The User  is: " + userExists);
//            if (userExists == "DepartmentUser") {
////            common_logonList = departmentUserDaoImpl.fetchAllLogonStatus();
//                common_logonList = departmentUserDaoImpl.fetchAll();
//                Iterator iterator = common_logonList.iterator();
//                System.out.println("inside if condition");
//                while (iterator.hasNext()) {
//                    //Common_Logon_Status dept = iterator.next();
//                    DepartmentUser dept = (DepartmentUser) iterator.next();
//                    if (dept.getPassword() != null) {
//         //BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//                        secretKey = dept.getSecretKey();
//                        password2 = dept.getPassword();
//                        //boolean key = passwordEncoder.matches(password2, password2);
//                        //System.out.println("The Key: "+key);
//                        decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
//                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
//                    }
//                    // aesEncrDec.decrypt(dept.getPassword(), null);
//
//                    System.out.println("db DepartmentUser is:  " + dept.getPassword());
//                    System.out.println("condition DepartmentUser is:  " + commonlogin.getPassword().equals(decrypted_pass));
//                    if ((validUser.equalsIgnoreCase(dept.getEmailAdd()) || validUser.equals(dept.getMobNo())) && commonlogin.getPassword().equals(decrypted_pass)) {
//                        session.setAttribute("Id", commonlogin.getId());
//                        System.out.println("date is:" + date + "   " + commonlogin.getUserRegID() + "   " + dept.getReg_Id());
//                        DepartmentUser departmentUser = departmentUserDaoImpl.fetchData(dept.getReg_Id());
//                        otpstatus = departmentUser.getOtp_alertStatus();
//
//                        System.out.println("/::::::::::::::OPT Status: " + otpstatus + "/");
//                        commonlogin.setCurrent_Login(date);
//                        commonlogin.setRole(userExists);
//                        commonlogin.setMobileno(dept.getMobNo());
//                        //  commonlogin.setId(dept.getId());
//                        commonlogin.setDeptId(dept.getDeptId());
//                        commonlogin.setDeptName(dept.getDeptName());
//                        commonlogin.setEmailid(dept.getEmailAdd());
//                        commonlogin.setMobileno(dept.getMobNo());
//                        commonlogin.setPassword(dept.getPassword());
//                        commonlogin.setSecretKey(dept.getSecretKey());
//                        departmentUserDaoImpl.saveStatus(commonlogin);
////                      emailService.sendMessage(dept.getMobileno());
//                        List<DepartmentSecondaryUser> departmentSecondaryUserList = departmentSecondaryUserDaoImpl.fetchAll();
//                        for (DepartmentSecondaryUser departmentSecondaryUser : departmentSecondaryUserList) {
//                            if (departmentSecondaryUser.getEmailAdd().equals(emailid)) {
//                              DepartmentAdmin_OLD departmentAdmin = departmentAdminDaoImpl.fetchData(departmentSecondaryUser.getDeptId());
//                              System.out.println("departmentAdmin " + departmentAdmin.getDeptLogoFileUrl());
//                              deptoption.put(String.valueOf(departmentAdmin.getDeptId()), departmentAdmin);
////                            deptoptions.add(departmentSecondaryUser.getDeptId());
//                            }
//                        }
//                        DepartmentAdmin_OLD departmentAdmin = departmentAdminDaoImpl.fetchData(dept.getDeptId());
//                        deptoption.put(String.valueOf(departmentAdmin.getDeptId()), departmentAdmin);
//                        System.out.println(" departmentAdmin.getDeptName() " + departmentAdmin.getDeptName() + " departmentAdmin.getDeptLogoFileUrl() " + departmentAdmin.getDeptLogoFileUrl());
//                        session.setAttribute("deptId", dept.getDeptId());
//                        session.setAttribute("deptName", dept.getDeptName());
//                        session.setAttribute("deptEmailId", dept.getEmailAdd());
//                        session.setAttribute("deptMobNo", dept.getMobNo());
//                        session.setAttribute("deptoption", deptoption);
//                        System.out.println("deptoption " + deptoption);
//                        if (otpstatus.equals("Enable")) {
//                            generatedotp = CommonUtil.generatePassword();
//                            String deptMobNo = (String) session.getAttribute("deptMobNo");
////                generatedotp =  emailService.sendMessage(deptMobNo);
//                            HttpSession hsession = request.getSession(true);
////                hsession.setAttribute("OTP", generatedotp);
//                            hsession.setAttribute("OTP_OnMobile", generatedotp);
//                            System.out.println("OTP : " + generatedotp);
//                            m.addAttribute("generatedotp", generatedotp);
//                            return "DepartmentUser/OTPVerificationDeptUser";
//                        }
//                        return "redirect:/departmentUserLogin";
//                    }
//                }
//            } else if (userExists == "Contractor") {
//            
//                List<Contractor> contractorList = null;
//                contractorList = contractorDaoImpl.fetchAll();
//                for (Contractor contractor : contractorList) {
//                    if (contractor.getPassword() != null) {
//                      password2 = contractor.getPassword();
//                      // decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
//                        System.out.println("Decrypted Pssword is:-  " + decrypted_pass + " Secret Key:-  " + secretKey + " Password is:-  " + password2);
//                    }
//                    if ((validUser.equalsIgnoreCase(contractor.getEmailid())
//                            || validUser.equals(contractor.getMobileno()))
//                            && commonlogin.getPassword().equals(password2)) {
//                        System.out.println("The Login User Email id is:  " + validUser + " & The MATCHED Email Id is:  " + contractor.getEmailid());
//                        ContractorLogs ContractorLogs = contractorlogsdao.fetchDataByContId(contractor.getId());
//                        System.out.println("ContractorLogs status is:-- " + ContractorLogs.getContstatus());
//                        if ("suspended".equals(ContractorLogs.getContstatus())) {
//                            System.out.println("inside status is suspend cond");
//                            ra.addFlashAttribute("contractorStatus", "Suspended Contractor Cannot Login");
//                            return "redirect:/";
//                        }
//                        System.out.println("The valid contractor email id is:  " + contractor.getEmailid() + "  email status is: " + contractor.getEmailStatus() + "  mobile status is: " + contractor.getMobileStatus() + "  contractor id is: " + contractor.getId());
//                        if (contractor.getEmailStatus().equals("verified")
//                                && contractor.getMobileStatus().equals("verified")
//                                || contractor.getOtpStatus().equals("Disable")) {
//                            System.out.println("verified" + contractor);
////                            m.addAttribute("contractor", contractor);
////                          ra.addFlashAttribute("contractor",contractor);
//                            session.setAttribute("contRegId", contractor.getId());
//                            session.setAttribute("contMobNo", contractor.getMobileno());
//                            commonlogin.setCurrent_Login(date);
//                            commonlogin.setRole(userExists);
//                            commonlogin.setMobileno(contractor.getMobileno());
//                            commonlogin.setUserRegID(contractor.getId());
//                            commonlogin.setEmailid(contractor.getEmailid());
//                            commonlogin.setMobileno(contractor.getMobileno());
//                            commonlogin.setPassword(contractor.getPassword());
////                            commonlogin.setSecretKey(contractor.getSecretKey());
//                            departmentUserDaoImpl.saveStatus(commonlogin);
//                            System.out.println("Common Logon Id is: " + commonlogin.getId());
//                            session.setAttribute("commonLoginId", commonlogin.getId());
////                        session.setAttribute("Current_Login",commonlogin.getCurrent_Login());
////                        session.setAttribute("role",commonlogin.getRole());
//                            session.setAttribute("commonLogin", commonlogin);
//                            return "redirect:/getContractorProfile";
//                        } else {
//                            if (!contractor.getEmailStatus().equals("verified")) {
//                                System.out.println("Email Status is not verified");
//                                ra.addFlashAttribute("emailid", contractor.getEmailid());
//                                ra.addFlashAttribute("notVerifyEmail", "Please verify Email");
//                            }
//                            if (!contractor.getMobileStatus().equals("verified")) {
//                                generatedOTP = (String) session.getAttribute("mobOTP");
//                                System.out.println("OTP : " + generatedOTP);
//                                ra.addFlashAttribute("contMobile", contractor.getMobileno().trim());
//                                //                         session.setAttribute("contMobile",contractor.getMobileno());
//                                System.out.println("Mobile Status is not verified");
//                                ra.addFlashAttribute("notVerifyMobile", "Please Verify Mobile");
//                            }
//
//                            session.setAttribute("mobileno", contractor.getMobileno());
//                            session.setAttribute("contRegId", contractor.getId());
//                            return "redirect:/";
//                        }
//                    }
//                }
//
//                //===========================================================================            
//            } else if (userExists == "SecondaryContractor") {
//                List<Secondary_Contractor> common_logonLists = null;
//                common_logonLists = secondaryContractorDAO.fetchAll();
//                System.out.println("Secondary_Contractor login list:" + common_logonLists.size());
//                for (Secondary_Contractor secondaryContractor : common_logonLists) {
//                    if (secondaryContractor.getPassword() != null) {
//                        secretKey = secondaryContractor.getSecretKey();
//                        password2 = secondaryContractor.getPassword();
//                        decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
//                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
//                    } else {
//                        //verifify email notification
//                    }
//                    // aesEncrDec.decrypt(dept.getPassword(), null);
//                    if ((validUser.equalsIgnoreCase(secondaryContractor.getEmailid())
//                            || validUser.equals(secondaryContractor.getMobileno()))
//                            && commonlogin.getPassword().equals(decrypted_pass)) {
//                        if (!secondaryContractor.getMobileVerifyStatus().equals("verified")) {
////                                   generatedotp = emailService.sendMessage(secondaryContractor.getMobileno());
//                            generatedotp = CommonUtil.generatePassword();
//                            HttpSession hsession = request.getSession(true);
//                            hsession.setAttribute("OTP_OnMobile", generatedotp);
//                            System.out.println("OTP : " + generatedotp);
//                            m.addAttribute("generatedotp", generatedotp);
//                            m.addAttribute("secondaryContractor", "secondaryContractor");
//                            return "Contractor/OTPVerificationContractor";
//                        }
//                        int primaryCont = secondaryContractor.getPrimaryContractor_regId();
////                        String bidderprivilege = secondaryContractor.getContractor_privilege();
////                        System.out.println("bidderprivilege " + bidderprivilege);
////                        String privileges[] = bidderprivilege.split(",");
////                        for (String s : privileges) {
////                            int privilegeid = Integer.parseInt(s);
////                            BidderPrivilege bidderprivileges = (BidderPrivilege) bidderPrivilegeDAO.fetchData(privilegeid);
////                            if (privileges != null) {
////                                if (privilege.containsKey(bidderprivileges.getPrivilegeArea())) {
////                                    privilege.put(bidderprivileges.getPrivilegeArea(), privilege.get(bidderprivileges.getPrivilegeArea()) + "," + bidderprivileges.getPrivilegeAction());
////                                } else {
////                                    privilege.put(bidderprivileges.getPrivilegeArea(), bidderprivileges.getPrivilegeAction());
////                                }
////                            }
////                        }
//                        commonlogin.setUserRegID(secondaryContractor.getContractorSecndry_regId());
//                        contRegSecId = secondaryContractor.getContractorSecndry_regId();
//                        contRegPriId = secondaryContractor.getPrimaryContractor_regId();
//                        session.setAttribute("regId", contRegPriId);//for fetching the details
//                        commonlogin.setCurrent_Login(date);
//                        commonlogin.setRole(userExists);
//                        commonlogin.setMobileno(secondaryContractor.getMobileno());
////                        commonlogin.setPassword(secondaryContractor.getPassword());                       
////                        commonlogin.setSecretKey(secondaryContractor.getSecretKey());
//                        departmentUserDaoImpl.saveStatus(commonlogin);
//                        //  emailService.sendMessage(cont.getMobileno());
//                        System.out.println("save commonlogon status");
////                        ra.addFlashAttribute("privilege", privilege);
//                        ra.addFlashAttribute("secondaryContractor", secondaryContractor);
//                        ra.addFlashAttribute("loginContractor", "secondaryContractor");
//                    }
//                }
////                m.addAttribute("msg2", "Login Successfully");
//
//                return "redirect:/updateSecondaryContractor?id=" + contRegSecId;
//            }else if(userExists == "DepartmentAdmin") {
//            
//              List<DepartmentAdmin> departmentAdminList = departmentAdminDaoImpl.fetchAll();
//              
//                for (DepartmentAdmin deptAdmin : departmentAdminList) {
//                    
//               if (deptAdmin.getDeptLoginPass() != null) {
//                        secretKey = deptAdmin.getSecretKey();
//                        System.out.println("The Secret Key: " + secretKey);
//                        password2 = deptAdmin.getDeptLoginPass();
//                        System.out.println("The Secret Key: " + secretKey);
//                        decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
//                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
//                    }
//                    if (commonlogin.getPassword().contains(" ")) {
//                        System.out.println("!!!!!!!!!!!!!! space check");
//                        String invalidUserAdmin = "Sorry..!!!Password does not contain spaces";
//                        ra.addFlashAttribute("invalidUserAdmin", invalidUserAdmin);
//                        return "redirect:/";
//                    }
////                    String pwd = commonUtil.encrypt(enc_pwd, "0xFACA");
//                    if ((validUser.equalsIgnoreCase(deptAdmin.getDeptEmailId()) || validUser.equals(deptAdmin.getDeptMobNo())) && decrypted_pass.equals(commonlogin.getPassword())) {
//                        Date date1 = new Date();
//                        commonlogin.setCurrent_Login(date1);
//                        commonlogin.setEmailid(deptAdmin.getDeptEmailId());
//                        commonlogin.setMobileno(deptAdmin.getDeptMobNo());
//                        commonlogin.setRole(deptAdmin.getRole());
//                        departmentAdminDaoImpl.saveStatus(commonlogin);
//
//                        session.setAttribute("deptId", deptAdmin.getDeptId());
//                        session.setAttribute("deptName", deptAdmin.getDeptName());
//                        session.setAttribute("deptEmailId", deptAdmin.getDeptEmailId());
//                        session.setAttribute("deptMobNo", deptAdmin.getDeptMobNo());
//                        session.setAttribute("Current_Login", commonlogin.getCurrent_Login());
//                        session.setAttribute("role", deptAdmin.getRole());
//                        session.setAttribute("Id", commonlogin.getId());
////                        generatedotp =  emailService.sendMessage(deptAdmin.getDeptMobNo());
//                        generatedotp = CommonUtil.generatePassword();
//                        System.out.println("OTP : " + generatedotp);
//
//                        m.addAttribute("generatedotp", generatedotp);
//
//                        return "DepartmentAdmin/OTPVerificationDeptAdmin";
//                    }
//                }
//            
//            } else {
//                ra.addFlashAttribute("invalidUser", "WrongId");
//                return "redirect:/";
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        System.out.println("*******************END****************************************");
//        String invalidUser = "Sorry..!!!You have entered wrong ID and Password";
////        ra.addFlashAttribute("invalidUser", invalidUser);
//        return "redirect:/";
//    }
//    
   
     //****************************** Common Login  ***************************//
    @RequestMapping("/login")
    public String login(@ModelAttribute("commonlogin") Common_Logon_Status commonlogin, Model m,
            HttpServletRequest request, RedirectAttributes ra, HttpSession session) {
        System.out.println("**************dept User login method run***  " + commonlogin.getPassword() + "  ***********");
        Map<String, DepartmentAdmin> deptoption = new LinkedHashMap<>();
        Map<String, String> privilege = new LinkedHashMap<String, String>();
        String returnHome = "redirect:/";
        String otpstatus = "";
        String password2 = "";
        String decrypted_pass = "";
        List common_logonList = null;
        Integer contRegSecId = 0;
        Integer contRegPriId = 0;
        Date date = new Date();
        String checkCaptcha = commonlogin.getTxtCaptchaInput();
        System.out.println("checkCaptcha:" + checkCaptcha);
        
        if (checkCaptcha.equalsIgnoreCase("") || checkCaptcha==null) {
            ra.addFlashAttribute("msg1", "Must Keep Captcha");
            return returnHome;
        }
        
        try {
            String validUser = commonlogin.getEmailid();
            System.out.println("Valid user is:" + validUser);
            if (commonlogin.getPassword().contains(" ")) {
                String invalidUser = "Sorry..!!!Password does not contain spaces";
                ra.addFlashAttribute("invalidUser", invalidUser);
                return returnHome;
            }
//            List userExists = departmentUserDaoImpl.checkLogin1(validUser);
            String userExists = departmentUserDaoImpl.checkLogin(validUser);
            System.out.println("The User  is: " + userExists);
            if (userExists == "DepartmentUser") {
//            common_logonList = departmentUserDaoImpl.fetchAllLogonStatus();
                common_logonList = departmentUserDaoImpl.fetchAll();
                Iterator iterator = common_logonList.iterator();
                System.out.println("inside if condition");
                while (iterator.hasNext()) {
                    //Common_Logon_Status dept = iterator.next();
                    DepartmentUser dept = (DepartmentUser) iterator.next();
                    if (dept.getPassword() != null) {
                        password2 = dept.getPassword();
                        decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
                    }
                    // aesEncrDec.decrypt(dept.getPassword(), null);

                    System.out.println("db DepartmentUser is:  " + dept.getPassword());
                    System.out.println("condition DepartmentUser is:  " + commonlogin.getPassword().equals(decrypted_pass));
                    if ((validUser.equalsIgnoreCase(dept.getEmailAdd()) || validUser.equals(dept.getMobNo())) && commonlogin.getPassword().equals(decrypted_pass)) {
                        session.setAttribute("Id", commonlogin.getId());
                        System.out.println("date is:" + date + "   " + commonlogin.getUserRegID() + "   " + dept.getReg_Id());
                        DepartmentUser departmentUser = departmentUserDaoImpl.fetchData(dept.getReg_Id());
                        if(!departmentUser.getStatus().equalsIgnoreCase("Enable")){
                        ra.addFlashAttribute("msgFordeptUser","Your Account is Blocked. Please Contect to the Department");
                            System.out.println("Your Account is Blocked. Please Contect to the Department");
                        return "redirect:/";
                        }
                        otpstatus = departmentUser.getOtp_alertStatus();

                        System.out.println("/::::::::::::::OPT Status: " + otpstatus + "/");
                        commonlogin.setCurrent_Login(date);
                        commonlogin.setRole(userExists);
                        commonlogin.setMobileno(dept.getMobNo());
                        //  commonlogin.setId(dept.getId());
                        commonlogin.setDeptId(dept.getDeptId());
                        commonlogin.setDeptName(dept.getDeptName());
                        commonlogin.setEmailid(dept.getEmailAdd());
                        commonlogin.setMobileno(dept.getMobNo());
                        commonlogin.setPassword(dept.getPassword());
                       // commonlogin.setSecretKey(dept.getSecretKey());
                        departmentUserDaoImpl.saveStatus(commonlogin);
//                      emailService.sendMessage(dept.getMobileno());
                        List<DepartmentSecondaryUser> departmentSecondaryUserList = departmentSecondaryUserDaoImpl.fetchAll();
                        for (DepartmentSecondaryUser departmentSecondaryUser : departmentSecondaryUserList) {
                            if (departmentSecondaryUser.getEmailAdd().equals(commonlogin.getEmailid())) {
                              DepartmentAdmin departmentAdmin = departmentAdminDaoImpl.fetchData(departmentSecondaryUser.getDeptId());
                              System.out.println("departmentAdmin " + departmentAdmin.getDeptLogoFileUrl());
                              deptoption.put(String.valueOf(departmentAdmin.getDeptId()), departmentAdmin);
//                            deptoptions.add(departmentSecondaryUser.getDeptId());
                            }
                        }
                        DepartmentAdmin departmentAdmin = departmentAdminDaoImpl.fetchData(dept.getDeptId());
                        
                        if(departmentAdmin!=null){
                            System.out.println("The Department Admin Id: "+departmentAdmin.getDeptId());
                        deptoption.put(String.valueOf(departmentAdmin.getDeptId()), departmentAdmin);
                        System.out.println(" departmentAdmin.getDeptName() " + departmentAdmin.getDeptName() + " departmentAdmin.getDeptLogoFileUrl() " + departmentAdmin.getDeptLogoFileUrl());
                        session.setAttribute("deptId", dept.getDeptId());
                        session.setAttribute("deptName", dept.getDeptName());
                        session.setAttribute("deptEmailId", dept.getEmailAdd());
                        session.setAttribute("deptMobNo", dept.getMobNo());
                        session.setAttribute("deptoption", deptoption);
                        System.out.println("deptoption " + deptoption);
                        }
                       if (otpstatus.equals("Enable")) {
//                            generatedotp = CommonUtil.generatePassword();

                            String deptMobNo = (String) session.getAttribute("deptMobNo");
                generatedotp =  emailService.sendMessage(deptMobNo);
                            HttpSession hsession = request.getSession(true);
//                hsession.setAttribute("OTP", generatedotp);
                            hsession.setAttribute("OTP_OnMobile", generatedotp);
                            System.out.println("OTP : " + generatedotp);
                            ra.addFlashAttribute("generatedotp", generatedotp);
                            ra.addFlashAttribute("otpfor","otpforDeptUser");
                           
                            
                            
                            return "redirect:/";
                        }
                        
                        return "redirect:/departmentUserLogin";
                    }
                }
            } else if (userExists == "Contractor") {
            
                List<Contractor> contractorList = null;
                contractorList = contractorDaoImpl.fetchAll();
                for (Contractor contractor : contractorList) {
                    if (contractor.getPassword() != null) {
                        System.out.println("The Secret Key: " + secretKey);
                        password2 = contractor.getPassword();
                        System.out.println("The Secret Key: " + secretKey);
                     
                       decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
                        System.out.println("Decrypted Pssword is:-  " + decrypted_pass + " Secret Key:-  " + secretKey + " Password is:-  " + password2);
                    }
                    if ((validUser.equalsIgnoreCase(contractor.getEmailid())
                            || validUser.equals(contractor.getMobileno()))
                            && commonlogin.getPassword().equals(decrypted_pass)) {
                        System.out.println("The Login User Email id is:  " + validUser + " & The MATCHED Email Id is:  " + contractor.getEmailid());
                        ContractorLogs ContractorLogs = contractorlogsdao.fetchDataByContId(contractor.getId());
                       // System.out.println("ContractorLogs status is:-- " + ContractorLogs.getContstatus());
                        if ("suspended".equals(ContractorLogs.getContstatus())) {
                            System.out.println("inside status is suspend cond");
                            ra.addFlashAttribute("contractorStatus", "Suspended Contractor Cannot Login");
                            return "redirect:/";
                        }
                        System.out.println("The valid contractor email id is:  " + contractor.getEmailid() + "  email status is: " + contractor.getEmailStatus() + "  mobile status is: " + contractor.getMobileStatus() + "  contractor id is: " + contractor.getId());
                        if (contractor.getEmailStatus().equals("verified")
                                && contractor.getMobileStatus().equals("verified")
                                || contractor.getOtpStatus().equals("Disable")) {
                            System.out.println("verified" + contractor);
//                            m.addAttribute("contractor", contractor);
//                          ra.addFlashAttribute("contractor",contractor);
                            session.setAttribute("contRegId", contractor.getId());
                            session.setAttribute("contMobNo", contractor.getMobileno());
                            commonlogin.setCurrent_Login(date);
                            commonlogin.setRole(userExists);
                            commonlogin.setMobileno(contractor.getMobileno());
                            commonlogin.setUserRegID(contractor.getId());
                            commonlogin.setEmailid(contractor.getEmailid());
                            commonlogin.setMobileno(contractor.getMobileno());
                            commonlogin.setPassword(contractor.getPassword());
//                            commonlogin.setSecretKey(contractor.getSecretKey());
                            departmentUserDaoImpl.saveStatus(commonlogin);
                            System.out.println("Common Logon Id is: " + commonlogin.getId());
                            session.setAttribute("commonLoginId", commonlogin.getId());
//                        session.setAttribute("Current_Login",commonlogin.getCurrent_Login());
//                        session.setAttribute("role",commonlogin.getRole());
                            session.setAttribute("commonLogin", commonlogin);
                            return "redirect:/getContractorProfile";
                        } else {
                            if (!contractor.getEmailStatus().equals("verified")) {
                                System.out.println("Email Status is not verified");
                                ra.addFlashAttribute("emailid", contractor.getEmailid());
                                ra.addFlashAttribute("notVerifyEmail", "Please verify Email");
                            }
                            if (!contractor.getMobileStatus().equals("verified")) {
                                generatedOTP = (String) session.getAttribute("mobOTP");
                                System.out.println("OTP : " + generatedOTP);
                                ra.addFlashAttribute("contMobile", contractor.getMobileno().trim());
                                //                         session.setAttribute("contMobile",contractor.getMobileno());
                                System.out.println("Mobile Status is not verified");
                                ra.addFlashAttribute("contVerifyRegId", contractor.getId());
                                ra.addFlashAttribute("notVerifyMobile", "Please Verify Mobile");
                            }
                             ra.addFlashAttribute("contVerifyRegId", contractor.getId());
                             ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
//                            session.setAttribute("mobileno", contractor.getMobileno());
//                            session.setAttribute("contRegId", contractor.getId());
                            return "redirect:/";
                        }
                    }
                }

                //===========================================================================            
            } else if (userExists == "SecondaryContractor") {
                List<Secondary_Contractor> common_logonLists = null;
                common_logonLists = secondaryContractorDAO.fetchAll();
                System.out.println("Secondary_Contractor login list:" + common_logonLists.size());
                for (Secondary_Contractor secondaryContractor : common_logonLists) {
                    if (secondaryContractor.getPassword() != null) {
                        password2 = secondaryContractor.getPassword();
                        decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
                    } else {
                        //verifify email notification
                    }
                    // aesEncrDec.decrypt(dept.getPassword(), null);
                    if ((validUser.equalsIgnoreCase(secondaryContractor.getEmailid())
                            || validUser.equals(secondaryContractor.getMobileno()))
                            && commonlogin.getPassword().equals(decrypted_pass)) {
                        if (!secondaryContractor.getMobileVerifyStatus().equals("verified")) {
                                   generatedotp = emailService.sendMessage(secondaryContractor.getMobileno());
//                            generatedotp = CommonUtil.generatePassword();
                            HttpSession hsession = request.getSession(true);
                            hsession.setAttribute("OTP_OnMobile", generatedotp);
                            System.out.println("OTP : " + generatedotp);
                            m.addAttribute("generatedotp", generatedotp);
                            m.addAttribute("secondaryContractor", "secondaryContractor");
                            return "Contractor/OTPVerificationContractor";
                        }
                        int primaryCont = secondaryContractor.getPrimaryContractor_regId();
//                        String bidderprivilege = secondaryContractor.getContractor_privilege();
//                        System.out.println("bidderprivilege " + bidderprivilege);
//                        String privileges[] = bidderprivilege.split(",");
//                        for (String s : privileges) {
//                            int privilegeid = Integer.parseInt(s);
//                            BidderPrivilege bidderprivileges = (BidderPrivilege) bidderPrivilegeDAO.fetchData(privilegeid);
//                            if (privileges != null) {
//                                if (privilege.containsKey(bidderprivileges.getPrivilegeArea())) {
//                                    privilege.put(bidderprivileges.getPrivilegeArea(), privilege.get(bidderprivileges.getPrivilegeArea()) + "," + bidderprivileges.getPrivilegeAction());
//                                } else {
//                                    privilege.put(bidderprivileges.getPrivilegeArea(), bidderprivileges.getPrivilegeAction());
//                                }
//                            }
//                        }
                        commonlogin.setUserRegID(secondaryContractor.getContractorSecndry_regId());
                        contRegSecId = secondaryContractor.getContractorSecndry_regId();
                        contRegPriId = secondaryContractor.getPrimaryContractor_regId();
                        session.setAttribute("regId", contRegPriId);//for fetching the details
                        commonlogin.setCurrent_Login(date);
                        commonlogin.setRole(userExists);
                        commonlogin.setMobileno(secondaryContractor.getMobileno());
//                        commonlogin.setPassword(secondaryContractor.getPassword());                       
//                        commonlogin.setSecretKey(secondaryContractor.getSecretKey());
                        departmentUserDaoImpl.saveStatus(commonlogin);
                        //  emailService.sendMessage(cont.getMobileno());
                        System.out.println("save commonlogon status");
//                        ra.addFlashAttribute("privilege", privilege);
                        ra.addFlashAttribute("secondaryContractor", secondaryContractor);
                        ra.addFlashAttribute("loginContractor", "secondaryContractor");
                    }
                }
//                m.addAttribute("msg2", "Login Successfully");

                return "redirect:/updateSecondaryContractor?id=" + contRegSecId;
            }else if(userExists == "DepartmentAdmin") {
                System.out.println("//:::::The Department Admin Login::://");
              List<DepartmentAdmin> departmentAdminList = departmentAdminDaoImpl.fetchAll();
              
                for (DepartmentAdmin deptAdmin : departmentAdminList) {
                    
               if (deptAdmin.getDeptLoginPass() != null) {
                        System.out.println("The Secret Key: " + secretKey);
                        password2 = deptAdmin.getDeptLoginPass();
                        System.out.println("The Secret Key: " + secretKey);
                        decrypted_pass = new AesEncrDec().decrypt(password2, secretKey);
                        System.out.println(" decrypted_pass " + decrypted_pass + " secretKey " + secretKey + " password2 " + password2);
                    }
                    if (commonlogin.getPassword().contains(" ")) {
                        System.out.println("!!!!!!!!!!!!!! space check");
                        String invalidUserAdmin = "Sorry..!!!Password does not contain spaces";
                        ra.addFlashAttribute("invalidUserAdmin", invalidUserAdmin);
                        return "redirect:/";
                    }
//                    String pwd = commonUtil.encrypt(enc_pwd, "0xFACA");
                    if ((validUser.equalsIgnoreCase(deptAdmin.getDeptEmailId()) || validUser.equals(deptAdmin.getDeptMobNo())) && decrypted_pass.equals(commonlogin.getPassword())) {
                        Date date1 = new Date();
                        commonlogin.setCurrent_Login(date1);
                        commonlogin.setEmailid(deptAdmin.getDeptEmailId());
                        commonlogin.setMobileno(deptAdmin.getDeptMobNo());
                        commonlogin.setRole(deptAdmin.getRole());
                        departmentAdminDaoImpl.saveStatus(commonlogin);

                        session.setAttribute("deptId", deptAdmin.getDeptId());
                        session.setAttribute("deptName", deptAdmin.getDeptName());
                        session.setAttribute("deptAdminName", deptAdmin.getDeptAdminName());
                        session.setAttribute("deptEmailId", deptAdmin.getDeptEmailId());
                        session.setAttribute("deptMobNo", deptAdmin.getDeptMobNo());
                        session.setAttribute("Current_Login", commonlogin.getCurrent_Login());
                        session.setAttribute("role", deptAdmin.getRole());
                        session.setAttribute("Id", commonlogin.getId());
                        generatedotp =  emailService.sendMessage(deptAdmin.getDeptMobNo());
//                        generatedotp = CommonUtil.generatePassword();
                        System.out.println("OTP : " + generatedotp);

                        m.addAttribute("generatedotp", generatedotp);

                        return "DepartmentAdmin/AdminDashboard";
                    }
                }
            
            }
                ra.addFlashAttribute("invalidUser", "Please Enter Valid Email Id and Password");
                return "redirect:/";
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("*******************END****************************************");
        String invalidUser = "Sorry..!!!You have entered wrong ID and Password";
        ra.addFlashAttribute("invalidUser", invalidUser);
        return "redirect:/";
    }
    
  @RequestMapping("/departmentAdminLogout")
    public String departmentAdminLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println("Logging out...");

            // Invalidate the current session
            session.invalidate();

            // Clear cookies related to the old session
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("JSESSIONID")) {
                        System.out.println("Removing JSESSIONID cookie");
                       
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to the home page or login page
        return "redirect:/"; // Adjust the redirect URL as needed
    }
   @RequestMapping("/dashboardOfAdmin")
  public String dashboardOfAdmin(){
      try{
         // session.invalidate();
      }catch(Exception e){
          e.printStackTrace();
      }
      return "redirect:/";
  }
  
      /* deptadminprofile method is used to view department Profile.
     *
     *@Param session
     *@Param model m
     *
     *@return jsp page.
     */
        /* deptadminprofile method is used to view department Profile.
     *
     *@Param session
     *@Param model m
     *
     *@return jsp page.
     */
    @RequestMapping("/deptadminprofile")
    public String deptadminprofile(HttpSession session, Model m) {
         System.out.println("---------------method end to viw department profile in DepartmentAdminController----------------");
        try {
            if (session != null) {
                int deptId = (int) session.getAttribute("deptId");
                DepartmentAdmin departmentadmin = departmentAdminDaoImpl.fetchData(deptId);
                System.out.println("dept id" + departmentadmin.getDeptId());
                m.addAttribute("departmentadmin", departmentadmin);
                m.addAttribute("superAdmin", departmentadmin);
 
            }

        } catch (Exception e) {
            System.out.println("Exception in deptadminprofile::"+e.getMessage());
            e.printStackTrace();
        }
        System.out.println("---------------method end to view department profile in DepartmentAdminController----------------");
        return "DepartmentAdmin/DepartmentAdminProfile";
    }
    

    
    /* saveDepartment method is used to update basic details of department Profile.
     *
     *@Param object department 
     *@Param RequestParam dept
     *@Param RequestParam deptAdminName
     *@Param RequestParam deptemail
     *@Param RequestParam deptMobNo
     *@Param RequestParam designation
     *@Param session
     *@Param Model m
     *@return jsp page.
     */
    @RequestMapping("/updateDepartmentAdmin")
    @ResponseBody
    public String updateDepartmentAdmin(@ModelAttribute("departmentadmin") DepartmentAdmin department, HttpServletRequest request, @RequestParam Integer dept, @RequestParam String deptemail, @RequestParam String deptMobNo, @RequestParam String designation, @RequestParam String deptAdminName, HttpSession session, Model m) throws IOException {
        System.out.println("---------------method start to update department in saveDepartment method in DepartmentAdminController----------------");
//        System.out.println("department id::" + dept);
        System.out.println("department::" + department);
        Logs logs = new Logs();
        String response = "";
        boolean validateFlag = false;
        boolean emailFlag = false;
        boolean mobFlag = false;
        String message2 = "Thank you";
        String subject = "Testing Email";
        System.setProperty("proxyHost", "192.168.0.2");
        System.setProperty("proxyPort", "3128");
        try {
        
            if (dept != 0) {
         
                department = departmentAdminDaoImpl.fetchData(dept);
                department.setDeptAdminName(deptAdminName);
                department.setDeptEmailId(deptemail);
                department.setDeptMobNo(deptMobNo);
                department.setDesignation(designation);
                // creates a simple e-mail object
                SimpleMailMessage email = new SimpleMailMessage();
                String emailAdd = department.getDeptEmailId();
                email.setTo(emailAdd);
                email.setFrom(emailFromRecipient);
                email.setText(message2);
                email.setSubject(subject);
//              Validation method called 
                validateFlag = departmentAdminModel.validateForUpdateAdmin(department);
                emailFlag = departmentAdminDaoImpl.checkDuplicateEmail(deptemail, dept);
                mobFlag = departmentAdminDaoImpl.checkDuplicateContact(deptMobNo, dept);
                if (validateFlag == false && emailFlag== false && mobFlag==false) {
                    System.out.println("All conditions are false....");
                    departmentAdminDaoImpl.insertData(department);
                    response = "Department Admin Successfully Updated";
                    email.setText(message2 + " " + "http://192.168.0.103:8084/NewEprocurement");
                    mailSender.send(email);
                    System.out.println("/The Departmet id: " + department.getDeptId() + "/");
                    System.out.println("logs started in insert method");
                    logs.setActivity("Save Department");
                    logs.setLogMessage("Department Admin  details Updated successfully");
                    logs.setIpAddress(logsAction.fetchIpAddress());
                    logs.setOsName(logsAction.getOs());
                    logs.setBrowserName(logsAction.getClientBrowser(request));
                    logs.setMacAddress(logsAction.fetchMacAddress());
                    logsActionDao.save(logs);
                    System.out.println("logs end in insert method");
                    gsonUtility.writeData(response);
                    return response;
                }  
                 if(validateFlag == false && emailFlag== true && mobFlag==false)
                {
                    System.out.println("validateFlag == false && emailFlag== true && mobFlag==false");
                   response="Duplicate Email";
                   return response;
                }
                 if(validateFlag == false && emailFlag== false && mobFlag==true)
                {
                    System.out.println("validateFlag == false && emailFlag== false && mobFlag==true");
                   response="Duplicate Mobile Number";
                   return response;
                }
                   if(validateFlag == false && emailFlag== true && mobFlag==true)
                {
                    System.out.println("validateFlag == false && emailFlag== true && mobFlag==true");
                   response="Duplicate Email and Mobile number";
                   return response;
                }
                  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
          System.out.println("---------------method end to update department in saveDepartment method in DepartmentAdminController----------------");
        return response;
    }
    
     /*This method is used to save department
     *
     *@Param department
     *@Param session
     *@Param request
     *
     *@return String
     */
    @RequestMapping(value = "/saveDepartment", method = RequestMethod.POST)
    @ResponseBody
    public String saveDepartment(@ModelAttribute DepartmentAdmin department, Model m,  HttpSession session,  HttpServletRequest request, RedirectAttributes ra) throws FileNotFoundException, IOException {
        System.out.println("-------------------method call to save department in DepartmentController-----------------");
        String encreptPassword = "";
        boolean validateFlag = false;
        String response = "";
        System.out.println(department.getDesignation());
        Logs logs = new Logs();
        System.out.println("Department id is : " + department.getDeptId() );
        DepartmentAdmin deptfetch = departmentAdminDaoImpl.fetchData(department.getDeptId());
        
       // System.out.println("deptfetch:::"+deptfetch.getDeptId());
        String emailAdd = department.getDeptEmailId();
        String message2 = "Thank you";
        String subject = "Testing Email";
        System.setProperty("proxyHost", "192.168.0.2");
        System.setProperty("proxyPort", "3128");
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(emailAdd);
        email.setFrom(emailFromRecipient);
        email.setText(message2);
        email.setSubject(subject);
        
        try 
        {
          if (department.getDeptId() != null && department.getCropedFile() == null && department.getWorkOrderFile() != null) {
            System.out.println("to update department when workorder is not null");
            String workOrderFile = department.getWorkOrderFile().getOriginalFilename();
            String departmentFileworkorder = departmentService.saveFile(department.getWorkOrderFile(), request, workOrderFile);
            department.setDeptWorkOrderFileUrl(departmentFileworkorder);
            department.setDeptWorkOrderFileName(workOrderFile);
        }
         else if (department.getDeptId() != null && department.getCropedFile() == null && department.getWorkOrderFile() == null) {
           System.out.println("to update department when workorder is null");
           department.setDeptWorkOrderFileName(deptfetch.getDeptWorkOrderFileName());
           department.setDeptWorkOrderFileUrl(deptfetch.getDeptWorkOrderFileUrl());
        }
//         else{
//            department.setDeptLogoFileName(deptfetch.getDeptLogoFileName());
//            department.setDeptLogoFileUrl(deptfetch.getDeptLogoFileUrl());
//            department.setDeptAdminName(deptfetch.getDeptAdminName());
//            department.setDesignation(deptfetch.getDesignation());
//            department.setDeptEmailId(deptfetch.getDeptEmailId());
//            department.setDeptMobNo(deptfetch.getDeptMobNo());
//            department.setDeptStatus(deptfetch.getDeptStatus());
//         }
            validateFlag = departmentAdminModel.validateForUpdateDept(department);
            System.out.println("validateFlag"+validateFlag);
            System.out.println("Yha aaya he");
        if(false == validateFlag) {
            Date date = new Date();
            department.setCreatedDate(date);
            System.out.println("Enter ho gya");
            encreptPassword = new AesEncrDec().encrypt(department.getDeptLoginPass(), secretKey);
            System.out.println("encreptPassword:::" + encreptPassword);
            department.setDeptLoginPass(encreptPassword);
            departmentAdminDaoImpl.insertData(department);
            System.out.println("department.getDeptDescription();...."+department.getDeptDescription());   
            Integer getdeptid = department.getDeptId();
            session.setAttribute("setdeptid", getdeptid);
            response = "Department Successfully Updated";
            System.out.println("Department Successfully Updated....");
            email.setText(message2 + " " + "http://192.168.0.103:8084/NewEprocurement");
            // comment send email code 
           // mailSender.send(email);
            System.out.println("/The Departmet id: " + department.getDeptId() + "/");
            System.out.println("logs started in insert method");
            logs.setActivity("Save Department");
            logs.setLogMessage("Department  details Updated successfully");
            logs.setIpAddress(logsAction.fetchIpAddress());
            logs.setOsName(logsAction.getOs());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setMacAddress(logsAction.fetchMacAddress());
            logsActionDao.save(logs);
            System.out.println("logs end in insert method");
            return response;
        }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            System.out.println("exception"+ ex.getMessage());
        }
        
        System.out.println("---------------method end to save department in DepartmentController----------------");
        return response;
    }
    @RequestMapping(value = "/saveLogo", method = RequestMethod.POST)
    @ResponseBody
    public String saveLogo(@ModelAttribute DepartmentAdmin department,@RequestParam Integer departmentId, Model m,  HttpSession session,  HttpServletRequest request, RedirectAttributes ra) throws FileNotFoundException, IOException {
        System.out.println("-------------------method call to save Logo in DepartmentController-----------------");
        String response = "";  
        
         
        try 
        {
        if (department.getCropedFile() != null && departmentId!= null) {
            DepartmentAdmin deptfetchlogo = departmentAdminDaoImpl.fetchData(departmentId);
            System.out.println("to update Department Logo");
            String departmentFilelogo = departmentService.saveFile(department.getCropedFile(), request, department.getDeptLogo());
            System.out.println("department.getDeptLogo()"+department.getDeptLogo());
            deptfetchlogo.setDeptLogoFileUrl(departmentFilelogo);
            deptfetchlogo.setDeptLogoFileName(department.getDeptLogo());
            departmentAdminDaoImpl.insertData(deptfetchlogo);  
            response = "Department Logo Successfully Uploaded";
            System.out.println("Department Logo Successfully Uploaded");
            return response;
        
        }
        }
        catch(Exception ex)
        {
            System.out.println("exception"+ ex.getMessage());
        }
        
        System.out.println("---------------method end to save Logo in DepartmentController----------------");
        return response;
    }
    
    
       @RequestMapping("/getOtpForAdmin")
    @ResponseBody
    public String getOtpForAdmin(HttpSession session){
        String generatedotp="";
        String deptMobNo="";
      try{
          deptMobNo=(String) session.getAttribute("deptMobNo");
          System.out.println(" "+session.getAttribute("deptMobNo"));
      
            generatedotp =  emailService.sendMessage(deptMobNo);
//            generatedotp = CommonUtil.generatePassword();
            session.setAttribute("otp_deptMobNo", generatedotp);
            System.out.println("OTP : " + generatedotp);

      
      }catch(Exception e){
      e.printStackTrace();
      }  
        
        
        return generatedotp;
    
    }
    
    
    @RequestMapping("/matchOTPAdmin")
    @ResponseBody
    public boolean matchOTPAdmin(HttpSession session,@RequestParam String enteredOtp){
        System.out.println("inside matchOTPAdmin");
        System.out.println("enteredOtp "+enteredOtp);
       
        boolean response=false;
        try{
            System.out.println(" mobile no "+session.getAttribute("deptMobNo") +" and otp is "+session.getAttribute("otp_deptMobNo"));
         String otp_deptMobNo=(String) session.getAttribute("otp_deptMobNo");
            if(otp_deptMobNo!=null || !otp_deptMobNo.equals("")){
                
                if(otp_deptMobNo.equals(enteredOtp)){
                    
                  response=true;  
                
                }
                
        
        }
        
        
        
        }catch(Exception ex){
            ex.printStackTrace();
        }
    return response;
    }
}

//*************************Naina Jain's Code END*************************//
//     List<Contractor> contractorlist = contractorDaoImpl.fetchAll();
//                        for(Contractor Contractor:contractorlist){//                            
//                            if(Contractor.getEmailid().equals(validUser)){
//                           contractorid=Contractor.getId();
//                            System.out.println("contractor id "+contractorid);
//                       } 
//}
//                        
//                       ContractorLogs ContractorLogs = contractorlogsdao.fetchDataByContId(contractorid);
//                    System.out.println(" status is "+ContractorLogs.getContstatus());
//                 
////                }else if(ContractorLogs.getContstatus().equals("suspended") ){
//                    
//                    ra.addFlashAttribute("msg3", "Suspended User Can not login");
//                    return "redirect:/";
//}
