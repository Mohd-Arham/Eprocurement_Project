/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.BidderPrivilegeDAO;
import com.eproc.dao.CitiesDAO;
import com.eproc.dao.ContractorClassDao;
import com.eproc.dao.SecondaryContractorDAO;
import com.eproc.dao.StatesDAO;
import com.eproc.daoImpl.CitiesDAOImpl;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.ContractorDesignationDAOImpl;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.CountriesDAOImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.MsmeDAOImpl;
import com.eproc.daoImpl.OrganizationTypeDAOImpl;
import com.eproc.daoImpl.SocialCategoryDAOImpl;
import com.eproc.daoImpl.StatesDAOImpl;
import com.eproc.domain.BidderPrivilege;
import com.eproc.domain.Cities;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.ContractorDesignation;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.ContractorOrganizationType;
import com.eproc.domain.Countries;
import com.eproc.domain.Logs;
import com.eproc.domain.MsmeOrg;
import com.eproc.domain.OrganizationType;
import com.eproc.domain.Secondary_Contractor;
import com.eproc.domain.SocialCategory;
import com.eproc.domain.States;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.ContractorModel;
import com.eproc.model.Secondary_ContractorModel;
import com.eproc.util.AesEncrDec;
import com.eproc.util.CommonUtil;
import com.eproc.util.EmailService;
import com.eproc.util.GsonUtility;

import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.crypto.SecretKey;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Vaishali Gupta 19-09-2018
 */
@Controller
public class SecondaryContractorController {

    static String emailFromRecipient = "info@lotusprocure.in";
    private static SecretKey secretKey;
    private String generatedotp;
    @Autowired
    BidderPrivilegeDAO bidderPrivilegeDAO;
    @Autowired
    SecondaryContractorDAO secondaryContractorDAO;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    Secondary_ContractorModel secondaryContractorModel;
    @Autowired
    ContractorDaoImpl contractordao;
    @Autowired
    EmailService emailService;
    @Autowired
    ContractorDesignationDAOImpl contractorDesignationDao;
    @Autowired
    ContractorDetailsdaoImpl contractordetailsdao;
    @Autowired
    ContractorClassDao contractorClassDao;
    @Autowired
    StatesDAO statesdao;
    @Autowired
    CitiesDAO citiesdao;
    @Autowired
    LogsAction logsAction;
    @Autowired
    LogsActionDao logsActionDao;
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
    ContractorModel contractorModel;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    DepartmentAdminDAOImpl departmentAdminDaoImpl;

    Logs logs = new Logs();
    Map<Integer, String> Tender = new LinkedHashMap<Integer, String>();
    Map<Integer, String> Auction = new LinkedHashMap<Integer, String>();

    /*
     * Show SecondaryContractor 
     * Method used to Show SecondaryContractor 
     * @param primary Contractor id
     * @return jsp page
     */
    @RequestMapping("/ManageContractor")
    public String ManageContractor(Model m, int id, HttpSession session) {
        System.out.println("managecontractor ");
        System.out.println("Primary contractor id in jsp page is: " + id);
        if (id != 0) {
            session.setAttribute("regId", id);
            m.addAttribute("regId", id);
        }

//          m.addAttribute("commonlogin", new Common_Logon_Status());
//       m.addAttribute("deptAdminLogin", new DepartmentAdmin());
        List<BidderPrivilege> bidderPrivilegeList = bidderPrivilegeDAO.fetchAll();
        for (BidderPrivilege bidderPrivilege : bidderPrivilegeList) {
            if (bidderPrivilege.getPrivilegeArea().equalsIgnoreCase("Tender")) {
                Tender.put(bidderPrivilege.getPrivilegeid(), bidderPrivilege.getPrivilegeName());
            } else if (bidderPrivilege.getPrivilegeArea().equalsIgnoreCase("Auction")) {
                Auction.put(bidderPrivilege.getPrivilegeid(), bidderPrivilege.getPrivilegeName());
            }
        }
        List<ContractorDesignation> contractorDesignationList = contractorDesignationDao.fetchAll();
        System.out.println("contractorDesignationList " + contractorDesignationList.size());
        m.addAttribute("contDesignationList", contractorDesignationList);
        m.addAttribute("Tender", Tender);
        m.addAttribute("Auction", Auction);
        m.addAttribute("bidderPrivilegeList", bidderPrivilegeList);
        m.addAttribute("secondrycontractor", new Secondary_Contractor());
        m.addAttribute("viewDetail", "contractorView");

        return "Contractor/ManageContractor";
    }

    /*
     * add Secondary_Contractor 
     * Method used to add Secondary_Contractor 
     * @param modelAtribute Secondary_Contractor
     * @return jsp page 
     */
    @RequestMapping("/savesecondaryContractor")
    public String addsecondaryContractor(@ModelAttribute Secondary_Contractor secondary_Contractor,
            HttpServletRequest request, Model m, RedirectAttributes ra, HttpSession session) {
        System.out.println(" secondary_Contractor " + secondary_Contractor.getEmailid() + "\n" + secondary_Contractor.getFirstName());
        System.out.println("Primary contractor registration id is: " + secondary_Contractor.getPrimaryContractor_regId());
        String viewDetails = "";//for manage view in editview jsp
        boolean flag = false;
        boolean sendEmail = false;
        String result = "";
        String eamilVerification = "";
        int SecondaryContractorID = 0;//regid to send in email
        int primaryContractorId = 0; //for fetching the details of primary contractor
        

        try {
            //To Update SecondaryContractor
            if (secondary_Contractor.getContractorSecndry_regId() != 0) {

                Secondary_Contractor secondary_ContractorOld = (Secondary_Contractor) secondaryContractorDAO.fetchData(secondary_Contractor.getContractorSecndry_regId());
                secondary_Contractor.setMobileVerifyStatus(secondary_ContractorOld.getMobileVerifyStatus());
                secondary_Contractor.setEmailVerifyStatus(secondary_ContractorOld.getEmailVerifyStatus());
                secondary_Contractor.setOtpAlertStatus(secondary_ContractorOld.getOtpAlertStatus());

                if (!secondary_ContractorOld.getEmailid().equals(secondary_Contractor.getEmailid())) {
                    secondary_Contractor.setEmailVerifyStatus("NotVerified");
                    sendEmail = true;
//              logs.setHeadingMsg(secondary_ContractorOld.getEmailid()+" Changed By "+secondary_Contractor.getEmailid());   

                } else if (!secondary_ContractorOld.getMobileno().equals(secondary_Contractor.getMobileno())) {
                    secondary_Contractor.setMobileVerifyStatus("NotVerified");

//                logs.setHeadingMsg(secondary_ContractorOld.getMobileno()+" Changed By "+secondary_Contractor.getMobileno());
                }
                secondary_Contractor.setPassword(secondary_ContractorOld.getPassword());
                secondary_Contractor.setSecretKey(secondary_ContractorOld.getSecretKey());
                secondary_Contractor.setPrimaryContractor_regId(secondary_Contractor.getPrimaryContractor_regId());

                logs.setActivity("Update Secondary Contractor");
                logs.setLogMessage("Secondary Contractor Update successfully");

            } else {

                //To Save SecondaryContractor
                Date date = new Date();
                secondary_Contractor.setMobileVerifyStatus("NotVerified");
                secondary_Contractor.setEmailVerifyStatus("NotVerified");
                secondary_Contractor.setOtpAlertStatus("Enable");
                secondary_Contractor.setCreated_Date(date);
                logs.setActivity("save Secondary Contractor");
                logs.setLogMessage("Secondary Contractor saved successfully");
                sendEmail = true;

            }

            // creates a simple e-mail object
            SimpleMailMessage email = new SimpleMailMessage();
            email.setTo(secondary_Contractor.getEmailid());
            email.setFrom(emailFromRecipient);
            String message = "please click this link for email verification";

            email.setSubject("Email Confirmation");

            System.out.println("secondary_Contractor\n" + secondary_Contractor.getEmailid() + "\n" + secondary_Contractor.getMobileno() + "\n"
                    + secondary_Contractor.getFirstName() + "\n" + secondary_Contractor.getContractor_privilege());

            secondary_Contractor.setStatus("Enable");
            flag = secondaryContractorDAO.insertData(secondary_Contractor);

            if (flag == true) {

                SecondaryContractorID = secondary_Contractor.getContractorSecndry_regId();
                primaryContractorId = secondary_Contractor.getPrimaryContractor_regId();
                session.setAttribute("regId", secondary_Contractor.getPrimaryContractor_regId());
                session.setAttribute("reg_Id", secondary_Contractor.getContractorSecndry_regId());

                if (sendEmail == true) {
                    eamilVerification = "Conformation mail has been send to Registered EmailID";
                    String url = "emailverification?id=" + SecondaryContractorID;

                    email.setText(message + " http://localhost:8084/NewEprocurement/" + url);
                    System.out.println("email " + email.getText());

                } else {

                    email.setText("Profile Updated");
                    System.out.println("email " + email.getText());

                }

//             mailSender.send(email);
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setContractorId(SecondaryContractorID);
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logsActionDao.save(logs);

            }

        } catch (Exception ex) {
            System.out.println("Class:ManageContractorController \n Method:savesecondaryContractor");
            ex.printStackTrace();
        }

           //This method called to show all details in readonlyform after registration
        ra.addFlashAttribute("msg", eamilVerification);
//         ra.addFlashAttribute("regid", SecondaryContractorID);
        viewDetails = "primaryContractorView";
        ra.addFlashAttribute("viewDetails", viewDetails);
//    return updateSecndryContrctr( SecondaryContractorID, m);

        return "redirect:/updateSecondaryContractor?id=" + SecondaryContractorID;

    }

    /*
     * Update SecondaryContractor 
     * Method used to Update SecondaryContractor
     * @param int id
     * @return jsp page
     */
    @RequestMapping("/updateSecondaryContractor")
    public String updateSecndryContrctr(@RequestParam int id, Model m, HttpSession session) {
        Integer regId = (Integer) session.getAttribute("regId");
        System.out.println(" Secondary contractor  id is:  " + id + "  Primary contractor id is:  " + regId);
        String action = "";

        Map<String, String> privilege = new LinkedHashMap<String, String>();
        Secondary_Contractor secondary_Contractor = null;
        ContractorDesignation contractorDesignation = null;
        ContractorDetails contractorDetails = null;
        States states = null;
        Cities cities = null;
        Countries countries = null;
        SocialCategory socialCategory = null;
        ContractorClass contractorClass = null;
        OrganizationType organizationType = null;
        MsmeOrg msmeOrg = null;
        System.out.println("-------Method called to  viewPrimaryContractor-----------");
        try {
            System.out.println("id is:" + id);
            Contractor contractor = (Contractor) contractordao.fetchData(regId);
            String designationId = contractor.getDesignation();
            System.out.println("designationId" + designationId);
            contractorDesignation = contractorDesignationDao.fetchData(Integer.parseInt(contractor.getDesignation()));
            System.out.println("contractordesigname " + contractorDesignation.getDesigName());
            contractor.setDesignationName(contractorDesignation.getDesigName());
            contractorDetails = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(regId);
            String contractorType = contractor.getContractorType();
            if (contractorType.equalsIgnoreCase("foreign")) {
                countries = countryDao.fetchData(contractorDetails.getCountry());
                states = (States) statesdao.fetchData(contractorDetails.getForeignState());
                cities = (Cities) citiesdao.fetchByIdEdit(contractorDetails.getForeignCity());
                contractorDetails.setForeignCountryName(countries.getCountry_name());
                contractorDetails.setForeignStateName(states.getState_name());
                contractorDetails.setForeignCityName(cities.getCity_name());
            }
            states = (States) statesdao.fetchData(contractorDetails.getAgentState());
            System.out.println("states name is:" + states.getState_name());
            System.out.println("city id is:" + contractorDetails.getAgentCity());
            cities = (Cities) citiesdao.fetchByIdEdit(contractorDetails.getAgentCity());
            System.out.println("cities name is:" + cities.getCity_name());
            contractorClass = (ContractorClass) contractorClassDao.fetchData(Integer.parseInt(contractorDetails.getContractorClass()));
            socialCategory = (SocialCategory) socialCategoryDao.fetchData(Integer.parseInt(contractorDetails.getSocialCategory()));
            contractorDetails.setAgentCityName(cities.getCity_name());
            msmeOrg = msmeDao.fetchData(Integer.parseInt(contractorDetails.getContCompanyType()));
            contractorDetails.setContCompanyName(msmeOrg.getComName());
            organizationType = organizationTypeDao.fetchData(Integer.parseInt(contractorDetails.getContOrganization()));
            contractorDetails.setOrgTypeName(organizationType.getOrganizationType());
            System.out.println("social category name is:" + socialCategory.getCategoryName());
            contractorDetails.setSocialCategoryName(socialCategory.getCategoryName());
            contractorDetails.setAgentStateName(states.getState_name());
            contractorDetails.setContractorClassName(contractorClass.getContractorClass_Name());
            System.out.println("contractorDetails in view primary is:  " + contractorDetails);
            m.addAttribute("contractorDetails", contractorDetails);
            m.addAttribute("contractor", contractor);
            m.addAttribute("regId", contractor.getId());
            m.addAttribute("reg_Id", id);

            secondary_Contractor = (Secondary_Contractor) secondaryContractorDAO.fetchData(id);
            System.out.println(" secondary_Contractor " + secondary_Contractor);

//          String[] privlg = secondary_Contractor.getContractor_privilege().split(",");
//                for (String s : privlg) {
//                    int privilegeid = Integer.parseInt(s);
//
//                   BidderPrivilege privileges = (BidderPrivilege) bidderPrivilegeDAO.fetchData(privilegeid);
//                    if (privileges != null) {
//                        if (privilege.containsKey(privileges.getPrivilegeArea())) {
//                            System.out.println("The Privileges are: "+privileges.getPrivilegeName());
//                            privilege.put(privileges.getPrivilegeArea(), privilege.get(privileges.getPrivilegeArea()) + "," + privileges.getPrivilegeAction());
//                        } else {
//
//                            privilege.put(privileges.getPrivilegeArea(), privileges.getPrivilegeAction());
//                        }
//
//                    }
//                }
//                  List<BidderPrivilege> bidderPrivilegeList = bidderPrivilegeDAO.fetchAll();
//
//        for (BidderPrivilege bidderPrivilege : bidderPrivilegeList) {
//            if (bidderPrivilege.getPrivilegeArea().equalsIgnoreCase("Tender")) {
//                Tender.put(bidderPrivilege.getPrivilegeid(), bidderPrivilege.getPrivilegeName());
//            } else if (bidderPrivilege.getPrivilegeArea().equalsIgnoreCase("Auction")) {
//                Auction.put(bidderPrivilege.getPrivilegeid(), bidderPrivilege.getPrivilegeName());
//            }
//        }
            List<ContractorDesignation> contractorDesignationList = contractorDesignationDao.fetchAll();
            System.out.println("contractorDesignationList " + contractorDesignationList.size());

            ContractorDesignation ContractorDesignation = contractorDesignationDao.fetchData(Integer.parseInt(secondary_Contractor.getDesignation()));
            secondary_Contractor.setDesignationName(ContractorDesignation.getDesigName());
            m.addAttribute("contDesignationList", contractorDesignationList);

            action = "edit";
            m.addAttribute("secondrycontractor", secondary_Contractor);
            m.addAttribute("action", action);

            m.addAttribute("viewDetail", "contractorView");
//        m.addAttribute("privilege", privilege);        
//        m.addAttribute("Tender", Tender);
//        m.addAttribute("Auction", Auction);

        } catch (Exception ex) {
            System.out.println("Class:ManageContractorController \n Method:updateSecondaryContractor");
            ex.printStackTrace();
        }

        return "Contractor/SecondaryContractorEditView";
    }

    /*
     * fetch secondaryContractor Details   
     * Method used to fetch secondaryContractor Details  
     * @param 
     * @return json response
     */
    @RequestMapping("/secondaryContractorDetails")
    @ResponseBody
    public String secondaryContractorDetails(HttpSession session) {
        String response = "";
        int primaryContId = 1;
//        primaryContId=(int) session.getAttribute("regId");
        System.out.println("secondaryContractorlist for contractorReg_Id " + primaryContId);
        List<Secondary_Contractor> secondaryContractorlist = new ArrayList<>();
        try {
            if (primaryContId != 0) {
                secondaryContractorlist = secondaryContractorDAO.fetchAllByPrimaryContractor(primaryContId);

                for (Secondary_Contractor secondary_Contractor : secondaryContractorlist) {
                    secondary_Contractor.setFirstName(secondary_Contractor.getFirstName() + " " + secondary_Contractor.getLastName());

                }
                System.out.println("secondaryContractorlist size " + secondaryContractorlist.size());
                Gson gson = new Gson();
                response = gson.toJson(secondaryContractorlist);

//             gsonUtility.writeData(response);
                gsonUtility.responseData(response);
            }

        } catch (Exception ex) {
            System.out.println("Class:ManageContractorController \n Method:secondaryContractorDetails");
            ex.printStackTrace();
        }
        return response;
    }

    /*
     *Method is Used to Change secondary Contractor Status
     *@param String reg_Id, String status
     *@return String status
     */
    @RequestMapping("/statusChange")
    @ResponseBody
    public String statusChange(@RequestParam int reg_Id, String status) {
        System.out.println(" reg_Id " + reg_Id + " status " + status);
        status = secondaryContractorDAO.statusValue(reg_Id, status);
        return status;

    }

    /*
     *Method is used to check Duplicate Email of secondaryContractor
     *@param String email
     *@return  String msg
     */
    @RequestMapping("/checkEmail")
    @ResponseBody
    public String checkEmail(@RequestParam String email, HttpSession session) {
        String msg = "valid Email";
        boolean flag = false;
//         Integer deptId=(Integer) session.getAttribute("deptId");

        flag = secondaryContractorDAO.checkDuplicateEmail(email);

        System.out.println("flag " + flag);

        if (flag == true) {

            msg = "Duplicate Email";
            System.out.println("duplicate useremail..........");
            return msg;
        }

        return msg;
    }

    /*
     *Method is used to check Duplicate Contect No of Secondary Contractor
     *@param String mobile_no
     *@return  String msg
     */
    @RequestMapping("/checkContacts")
    @ResponseBody
    public String checkContact(@RequestParam String mobile_no, HttpSession session) {
        String msg = "valid mobile_no";
        boolean flag = false;
        Integer deptId = (Integer) session.getAttribute("deptId");

        flag = secondaryContractorDAO.checkDuplicateContect(mobile_no);

        if (flag == true) {
            msg = "Duplicate mobile_no";
            System.out.println("duplicate mobile_no..");
            return msg;
        }

        return msg;
    }

    /*This method is used to verified email id by clicking on link, Send in respective Email
     *@param int reg_id
     *return jsp page to create Password or LotusHome
     */
    @RequestMapping("/emailverification")
    public String emailverification(@RequestParam int id, HttpSession session, Model m, RedirectAttributes ra) {
        boolean flag = false;
        try {
            System.out.println("reg Id is: " + id);

            Secondary_Contractor secondarycont = (Secondary_Contractor) secondaryContractorDAO.fetchData(id);

            if (secondarycont.getEmailVerifyStatus().equalsIgnoreCase("verified")) {

                ra.addFlashAttribute("msg2", "You Have Already Created Your Password");
                System.out.println("You Have Already Created Your Password");
                return "redirect:/";

            }

//     generatedotp =  emailService.sendMessage(secondarycont.getMobileno());
            generatedotp = CommonUtil.generatePassword();
            System.out.println("OTP : " + generatedotp + " on " + secondarycont.getMobileno());

            String otp = generatedotp;
            session.setAttribute("OTPOnMobile", otp);
            session.setAttribute("SecondarycontractorMob", secondarycont.getMobileno());
//                session.setAttribute("OTP", generatedotp);
            System.out.println("OTP : " + generatedotp);
            flag = secondaryContractorDAO.emailverified(id);
            session.setAttribute("contRegId", secondarycont.getPrimaryContractor_regId());
            session.setAttribute("reg_Id", id); //for creating new Password
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        ra.addFlashAttribute("generatedotp", generatedotp);
        ra.addFlashAttribute("otpContractor", "secondaryContractor");//palak 
//          ra.addFlashAttribute("regId", id);

        session.setAttribute("afterOTP", "createPassword");
        System.out.println("afterOTP " + session.getAttribute("afterOTP"));
        return "redirect:/";
    }

    @RequestMapping("/SecondaryContractorOTP")
    public String SecondaryContractorOTP(@RequestParam String verifyingotp, String generatedotp, int id, HttpSession session, RedirectAttributes ra, Model m) {
        Common_Logon_Status commonlogin = new Common_Logon_Status();
        Boolean flag = false;
        System.out.println("######### generatedotp" + generatedotp);
        System.out.println("~~~~~~~~~ verifyingotp" + verifyingotp);
        String OTP_OnMobile = (String) session.getAttribute("OTPOnMobile");
        String afterotp = (String) session.getAttribute("afterOTP");
        try {
//            if (verifyingotp.equals(OTP_OnMobile)) { //for original mobile
            if (verifyingotp.equals(generatedotp)) {
                secondaryContractorDAO.mobileverified(id);
                flag = true;
            }
        if (flag == true && afterotp.equalsIgnoreCase("createPassword")) {
                m.addAttribute("reg_Id", id);
                m.addAttribute("secondaryContractor", "secondaryContractor");
                return "createPassword";
            }

            Secondary_Contractor secondaryContractor = (Secondary_Contractor) secondaryContractorDAO.fetchData(id);
            if (flag == true && afterotp.equalsIgnoreCase("getSecondaryContractorProfile")) {

                Date date = new Date();
                commonlogin.setCurrent_Login(date);
                commonlogin.setPassword("");
                commonlogin.setEmailid(secondaryContractor.getEmailid());
                commonlogin.setMobileno(secondaryContractor.getMobileno());
                commonlogin.setRole("SecondaryContractor");
                commonlogin.setUserRegID(secondaryContractor.getContractorSecndry_regId());

                departmentAdminDaoImpl.saveStatus(commonlogin);

                session.setAttribute("secondaryContractorEmail", commonlogin.getEmailid());
                session.setAttribute("secondaryContractorMobileNo", commonlogin.getMobileno());
                session.setAttribute("Current_Login", commonlogin.getCurrent_Login());
                session.setAttribute("role", commonlogin.getRole());
                session.setAttribute("Id", commonlogin.getId());

                session.setAttribute("contractorReg_Id", secondaryContractor.getContractorSecndry_regId());
//                             ra.addFlashAttribute("contractor",secondaryContractor);
                ra.addFlashAttribute("regid", secondaryContractor.getContractorSecndry_regId());
                ra.addFlashAttribute("contractor", "secondaryContractor");
                System.out.println("return getSecondaryContractorProfile");
                return "redirect:/getSecondaryContractorProfile";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        ra.addFlashAttribute("msg2", "Somthing Went Wrong");
        return "redirect:/";

    }

//        if(secondarycont.getPassword()==null||secondarycont.getPassword().equals("")){
//           flag= secondaryContractorDAO.emailverified(id); 
//             m.addAttribute("reg_Id", id);
//          m.addAttribute("secondaryContractor", "secondaryContractor");
//        return "createPassword";
//       } 
//         } catch (Exception ex) {
//            System.out.println("Class:ManageContractorController \n Method:emailverification");
//            ex.printStackTrace();
//        }
//        //this string show the when user has already created password
//        ra.addFlashAttribute("msg2", "You Have Alredy Created your Password !! ");
//      
//        return "redirect:/";
//    } 
    /*This method is used to encrypt and save the password
     *@param reg_id,String Password
     *return opt verification jsp page
     */
    @RequestMapping("/createNewPasswordd")
    public String createNewPassword(@RequestParam Integer reg_Id, String password, String cPassword, HttpSession session, Model m, RedirectAttributes ra) {

        System.out.println("Inside createNewPassword \npassword " + password + "\ncPassword " + cPassword + "\nreg_Id " + reg_Id);
        Secondary_Contractor secondaryContractor = null;
        String encreptPassword = "";
        Map mapForValidation = new HashMap();
        Gson gson = new Gson();

        try {

            if (password.equals("") || password == null) {
                mapForValidation.put("passwordError", "Please Enter Password");
            }

            if (cPassword.equals("") || cPassword == null) {
                mapForValidation.put("cPasswordError", "Please Enter Confirm Password");
            }

            Pattern passwordpattern = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$", Pattern.CASE_INSENSITIVE);
            if (!(passwordpattern.matcher(password).matches()) && !password.equals("")) {
                mapForValidation.put("passwordError", "Enter valid Password");
            }

            if (!password.equalsIgnoreCase(cPassword) && !password.equals("") && !cPassword.equals("")) {
                mapForValidation.put("passwordError", "Please Enter the Same Password");
            }

            System.out.println(" map " + mapForValidation);
            if (mapForValidation.size() >= 1) {
                String result = gson.toJson(mapForValidation);
                System.out.println("response " + result);
                gsonUtility.writeData(result);
                return result;
            } else {

                secondaryContractor = (Secondary_Contractor) secondaryContractorDAO.fetchData(reg_Id);

                encreptPassword = new AesEncrDec().encrypt(password, "");
                secondaryContractorDAO.createPassword(reg_Id, encreptPassword, secretKey);
                System.out.println("----------------------real " + "encrypted pass "
                        + encreptPassword + "key  " + secretKey);
                ra.addFlashAttribute("successMsgForPwd", "Password Created Successfully");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "redirect:/";
    }

    /*This method is used to match Generated Otp and Entered otp
     *@param String verifyingotp, String generatedotp,
     *return 
     */
    @RequestMapping("/verifyOTPSecondaryContractor")
    public String verifyOTPSecondaryContractor(@RequestParam String verifyingotp, String generatedotp, int id, HttpSession session,
            RedirectAttributes ra) {
        System.out.println("######### generatedotp" + generatedotp);
        System.out.println("~~~~~~~~~ verifyingotp" + verifyingotp);
        String OTP_OnMobile = (String) session.getAttribute("OTPOnMobile");
        String mobileno = (String) session.getAttribute("SecondarycontractorMob");
        try {
//            if (verifyingotp.equals(OTP_OnMobile)) { //for original mobile
            if (verifyingotp.equals(generatedotp)) {
                secondaryContractorDAO.mobileverified(id);

                String otpReturnHome = (String) session.getAttribute("otpReturnHome");
                System.out.println(" otpReturnHome " + otpReturnHome);
                if (otpReturnHome != null) {

                    ra.addFlashAttribute("contractor", "secondaryContractor");
                    return "redirect:/getSecondaryContractorProfile";

                }
                System.out.println("1 otpReturnHome " + otpReturnHome);
                ra.addFlashAttribute("msg", "Your Mobile No. verified ");
                return "redirect:/";

            }
            ra.addFlashAttribute("verifyMobileno", "OTP is not verified from your Mobile No. Please ReLogin");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";

    }

    /*This methos is used to show SecondaryContractor Deshboard after successfull login
     *@getContractorProfile Method
     *@param int reg_id by Session
     *@return secondContractorotherdetail page
     */
    @RequestMapping(value = "/getSecondaryContractorProfile")
    public String getSecondaryContractorProfile(Model m, HttpSession session) {
        System.out.println("...............getContractorProfile controller................");
        int regId = 0;

        if (session != null) {
            regId = (int) session.getAttribute("contractorReg_Id");

            System.out.println("contracor reg id is:" + regId);
        }
        try {

            m.addAttribute("regid", regId);
            m.addAttribute("contractor", "secondaryContractor");

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:SecondaryContractorController and Method:getSecondaryContractorProfile");
        }

        return "Contractor/secondContractorotherdetail";
    }

    /*This method is used to Show secondaryContractor's Details(profile)
     *@param int reg_id
     *return SecondaryContractorEditView page
     */
    @RequestMapping("/viewSecondContractor")
    public String viewSecondContractor(@RequestParam int id, Model m) {
        String action = "";
        Secondary_Contractor secondary_Contractor = (Secondary_Contractor) secondaryContractorDAO.fetchData(id);

        if (secondary_Contractor != null) {
            System.out.println("secondary_Contractor id " + secondary_Contractor.getPrimaryContractor_regId());

            Contractor contractor = (Contractor) contractordao.fetchData(secondary_Contractor.getPrimaryContractor_regId());

            if (contractor != null) {
                System.out.println("contractor regid " + contractor.getId());
                ContractorDetails contractorDetails = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(contractor.getId());
                System.out.println("contractor type is:" + contractor.getContractorType());
                m.addAttribute("contractor", contractor);

                if (contractorDetails != null) {
                    States states = (States) statesdao.fetchData(contractorDetails.getAgentState());
                    System.out.println("states name is:" + states.getState_name());

                    System.out.println("city id is:" + contractorDetails.getAgentCity());
                    Cities cities = (Cities) citiesdao.fetchByIdEdit(contractorDetails.getAgentCity());
                    System.out.println("cities name is:" + cities.getCity_name());
                    ContractorClass contractorClass = (ContractorClass) contractorClassDao.fetchData(Integer.parseInt(contractorDetails.getContractorClass()));
                    contractorDetails.setAgentCityName(cities.getCity_name());
                    contractorDetails.setAgentStateName(states.getState_name());
                    contractorDetails.setContractorClassName(contractorClass.getContractorClass_Name());
                    m.addAttribute("contractorDetails", contractorDetails);
                    System.out.println("contractor details is:" + contractorDetails.getAgentAddress());
                }
            }

        }
        ContractorDesignation contractorDesignation = (ContractorDesignation) contractorDesignationDao.fetchData(Integer.parseInt(secondary_Contractor.getDesignation()));
        secondary_Contractor.setDesignationName(contractorDesignation.getDesigName());
        m.addAttribute("secondrycontractor", secondary_Contractor);
        action = "readonly";

        m.addAttribute("action", action);
        m.addAttribute("viewDetails", "secondaryContractor");

        return "Contractor/SecondaryContractorEditView";
    }

    @RequestMapping("/editPassword")
    public String editPassword(@RequestParam int id, HttpSession session, Model m, RedirectAttributes ra) {
        boolean flag = false;
        try {
            System.out.println("reg Id is: " + id);

            Secondary_Contractor secondarycont = (Secondary_Contractor) secondaryContractorDAO.fetchData(id);

//     generatedotp =  emailService.sendMessage(secondarycont.getMobileno());
            generatedotp = CommonUtil.generatePassword();
            System.out.println("OTP : " + generatedotp + " on " + secondarycont.getMobileno());

            String otp = generatedotp;
            session.setAttribute("OTPOnMobile", otp);
            session.setAttribute("SecondarycontractorMob", secondarycont.getMobileno());
//                session.setAttribute("OTP", generatedotp);
            System.out.println("OTP : " + generatedotp);
            flag = secondaryContractorDAO.emailverified(id);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        m.addAttribute("generatedotp", generatedotp);
        m.addAttribute("contractor", "secondaryContractor");
        m.addAttribute("regId", id);
        session.setAttribute("afterOTP", "createPassword");
        System.out.println("afterOTP " + session.getAttribute("afterOTP"));
        return "Contractor/OTPVerificationContractor";
    }

}
