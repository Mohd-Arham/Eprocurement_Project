/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.ContractorClassDao;
import com.eproc.dao.ContractorDao;
import com.eproc.dao.ContractorDetailsDao;

import com.eproc.daoImpl.CitiesDAOImpl;
import com.eproc.daoImpl.ContractorClassSecondDaoImpl;
//import com.eproc.daoImpl.ContractorClassSecondDaoImpl;
import com.eproc.daoImpl.ContractorDesignationDAOImpl;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.ContractorLogsDaoImpl;
import com.eproc.daoImpl.CountriesDAOImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.DepartmentDaoImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.MsmeDAOImpl;
import com.eproc.daoImpl.OrganizationTypeDAOImpl;
import com.eproc.daoImpl.SocialCategoryDAOImpl;
import com.eproc.daoImpl.StatesDAOImpl;
import com.eproc.domain.Cities;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.ContractorDesignation;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.ContractorLogs;
import com.eproc.domain.ContractorOrganizationType;
import com.eproc.domain.Countries;

import com.eproc.domain.Logs;
import com.eproc.domain.MsmeOrg;
import com.eproc.domain.OrganizationType;
import com.eproc.domain.Secondary_Contractor;
import com.eproc.domain.SocialCategory;
import com.eproc.domain.States;
import com.eproc.logs.ContractorClassDaoLogs;
import com.eproc.domain.ContractorClassLogs;
import com.eproc.domain.ContractorClassSecond;
//import com.eproc.domain.ContractorClassSecond;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.logs.MsmeNsicDaoLogs;
import com.eproc.domain.MsmeNsicLogs;
import com.eproc.model.ContractorDetailsModel;
import com.eproc.model.ContractorModel;
import com.eproc.service.DepartmentService;
import com.eproc.util.AesEncrDec;
import com.eproc.util.CommonUtil;
import com.eproc.util.EmailService;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.crypto.SecretKey;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.regex.Pattern;
import javax.crypto.KeyGenerator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author Palak Tiwari ContractorDetailsController class
 *
 */
@Controller
public class ContractorDetailsController {
    
    @Value("${secret.key}")
    private String secretKey;

    @Autowired
    EmailService emailService;
    @Autowired
    JavaMailSender mailSender;
    private String generatedOTP;
    static String emailFromRecipient = "info@lotusprocure.in";
    
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    ContractorDetailsDao contractordetailsdao;
    @Autowired
    ContractorDetailsdaoImpl contractor_detailsdaoImpl;

    @Autowired
    DepartmentAdminDAOImpl departmentAdminDaoImpl;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    ContractorDao contractordao;
    @Autowired
    DepartmentDaoImpl departmentDaoImpl;
    @Autowired
    AesEncrDec aesEncrDec;
    @Autowired
    LogsAction logsAction;
    @Autowired
    LogsActionDao logsActionDao;
    @Autowired
    ContractorLogsDaoImpl contractorlogsdao;
    @Autowired
    DepartmentService deptService;
    @Autowired
    DepartmentUserDaoImpl departmentUserDAO;
    @Autowired
    ContractorDesignationDAOImpl contractorDesignationDao;
    @Autowired
    ContractorClassDao contractorClassDao;
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
    StatesDAOImpl statesdao;
    @Autowired
    ContractorModel contractorModel;
    @Autowired
    CitiesDAOImpl citiesdao;
    @Autowired
    ContractorClassDaoLogs contractorClassDaoLogs;
    @Autowired
    MsmeNsicDaoLogs msmeNsicDaoLogs;
    ContractorLogs clogs = new ContractorLogs();
    @Autowired
    ContractorDetailsModel contractorDetailsModel;
    ContractorDetails contractorDetailsFetch = new ContractorDetails();
    @Autowired
    ContractorClassSecondDaoImpl contractorClassSecondDao;

    Map<Integer, String> Tender = new LinkedHashMap<Integer, String>();
    Map<Integer, String> Auction = new LinkedHashMap<Integer, String>();
    Map map = new HashMap();

    public Map<Integer, String> getTender() {
        return Tender;
    }

    public void setTender(Map<Integer, String> Tender) {
        this.Tender = Tender;
    }

    public Map<Integer, String> getAuction() {
        return Auction;
    }

    public void setAuction(Map<Integer, String> Auction) {
        this.Auction = Auction;
    }

    Logs logs = new Logs();
    Gson gson = new Gson();
    @Autowired
    ContractorDetailsModel contractordetailsvalidator;
    private static final String UPLOAD_DIRECTORY = "/resources/docs"; //variable to store the path of file

    /*
     *@getContractorProfile Method
     *Method used to get the list that is required in Contractor Profile
     *@return contractorotherdetail page
     */
    @RequestMapping(value = "/getContractorProfile")
    public String getContractorProfile(@ModelAttribute("contractor") Contractor contractor, Model m, HttpSession session) {
        System.out.println("...............getContractorProfile controller................");

//          Integer regid = (Integer) session.getAttribute("regId");// contractor reg id for view profile
        Integer contRegId = (Integer) session.getAttribute("contRegId");// contractor reg id for empanelment
        System.out.println("The Contractor Registration id is: " + contRegId);
        if (contRegId != null) {
            contractor = (Contractor) contractordao.fetchData(contRegId);
             session.setAttribute("mobileno", contractor.getMobileno());
            System.out.println("contractor " + contractor + "contractor first name " + contractor.getFirstname() + "regId is: " + contRegId);
        }
        ContractorDetails contractordetails = null;
        try {
            List<Countries> countryList = countryDao.fetchAll();
            System.out.println("contrylist is:" + countryList);
            List<States> stateList = statesdao.fetchAll();
            List<SocialCategory> socialCategoryList = socialCategoryDao.fetchAll();
            List<OrganizationType> organizationTypeList = organizationTypeDao.fetchAll();
            List<MsmeOrg> MsmeOrgList = msmeDao.fetchAll();
            List<ContractorClassSecond> contractorClassSecondList = contractorClassSecondDao.fetchAll();//for new contractor class
            System.out.println("contractorClassSecondList  "+contractorClassSecondList);
            
            m.addAttribute("ContractorClassSecondList", contractorClassSecondList); 
            List<ContractorClass> contractorClassList = contractorClassDao.fetchAll();
            System.out.println("------contractordetails method is run------------- ");
            m.addAttribute("ContractorClassSecondList", contractorClassSecondList); 
            m.addAttribute("stateList", stateList);
            m.addAttribute("socialCategoryList", socialCategoryList);
            m.addAttribute("organizationTypeList", organizationTypeList);
            m.addAttribute("countryList", countryList);
            m.addAttribute("MsmeOrgList", MsmeOrgList);
            m.addAttribute("ContractorclassList", contractorClassList);
            m.addAttribute("contractor", contractor);
            if (contRegId != null) {
                m.addAttribute("regid", contRegId);
                contractordetails = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(contRegId);
                if (contractordetails != null) {
                    System.out.println("contractordetails" + contractordetails);
                    m.addAttribute("Contractordetails", contractordetails);//fetch data of contractor profile on second time login
                    m.addAttribute("contractorDetails", contractordetails);
                } else {
                    System.out.println("contractor details!!!!!!!!!!!!!!!!!!!!!!@@@");
                    m.addAttribute("Contractordetails", new ContractorDetails());
                }
            } else {
                System.out.println("regid is : null ");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:getContractorProfile");
        }
        return "Contractor/contractorotherdetail";
    }
    /*
     *@getCityByAjax Method
     *Method used to get the list of City
     *@Param State Id
     *@return City List
     */

    @RequestMapping(value = "/getCityByAjax", method = RequestMethod.GET)
    @ResponseBody
    public String getCityByAjax(@RequestParam Integer stateid) throws IOException {
        System.out.println("...............getCityByAjax controller................");
        System.out.println("state Id:-" + stateid);
        try {
            if (stateid != null) {
                List<Cities> citiesList = citiesdao.fetchCitiesByState(stateid);
                Gson gson = new Gson();
                String response = gson.toJson(citiesList);
                gsonUtility.writeData(response);
                return response;
            }
        } catch (Exception ex) {
            System.out.println("Exception  Method:getCityByAjax and Controller:ContractorDetails");
            ex.printStackTrace();
        }
        return null;
    }
    /*
     *@getStateByAjax Method
     *Method used to get the list of state
     *@Param Country Id
     *@return State List
     */

    @RequestMapping(value = "/ getStateByAjax", method = RequestMethod.GET)
    @ResponseBody
    public String getStateByAjax(@RequestParam Integer countryid) throws IOException {
        System.out.println("...............getStateByAjax controller................");
        System.out.println("Country Id:-" + countryid);
        try {
            if (countryid != null) {
                List<States> stateList = statesdao.fetchStates(countryid);
                Gson gson = new Gson();
                String response = gson.toJson(stateList);
                gsonUtility.writeData(response);
                return response;
            }
        } catch (Exception ex) {
            System.out.println("Exception  Method:getStateByAjax and Controller:ContractorDetails");
            ex.printStackTrace();
        }
        return null;
    }
    /*
     *@logoutContractor Method
     *Method used to logout from Contractor Profile
     *@return LotusHomePage
     */

    @RequestMapping("/logoutContractor")
    public String logoutContractor(@ModelAttribute("commonlogin") Common_Logon_Status commonlogin, HttpSession session, RedirectAttributes ra, HttpServletRequest request) {
        int commonLoginId = (int) session.getAttribute("commonLoginId");
        Integer regId=(Integer) session.getAttribute("contRegId");
        Contractor contractor=null;
        
        if(regId!=null){
          contractor=(Contractor) contractordao.fetchData(regId);
        }
        System.out.println("Common Login Id is:" + commonLoginId);
//         Common_Logon_Status commonLogon=departmentAdminDaoImpl.fetchDetails(commonLoginId);
//         System.out.println("common logon role is:"+commonLogon.getRole());
//         System.out.println("common logon currentlogin is"+commonLogon.getCurrent_Login());
//         System.out.println("common logon contractor reg id is:"+commonLogon.getContractor_regId());
        try {
            commonlogin.setIp_Address(logsAction.fetchIpAddress());
            commonlogin.setOsName(logsAction.FetchOSName());
            commonlogin.setMac_Address(logsAction.fetchMacAddress());
            commonlogin.setBrowserName(logsAction.getClientBrowser(request));
            commonlogin.setCurrent_Login((Date) session.getAttribute("Current_Login"));
            commonlogin.setRole((String) session.getAttribute("role"));

//         commonlogin.setEmailid((String) session.getAttribute("deptEmailId"));
//         commonlogin.setMobileno((String) session.getAttribute("deptMobNo"));
            Date date = new Date();
            commonlogin.setLogout_Time(date);
            commonlogin.setId(commonLoginId);
            departmentAdminDaoImpl.saveStatus(commonlogin);
            session.invalidate();
            System.out.println("session is logout");
            
                System.out.println("email is" + contractor.getEmailStatus());
                if (!contractor.getEmailStatus().equals("verified")) {
                    System.out.println("email is not verified");
                    ra.addFlashAttribute("emailid", contractor.getEmailid());
                    ra.addFlashAttribute("notVerifyEmail", "Please verify Email");
                    ra.addFlashAttribute("contVerifyRegId", contractor.getId());
                  }
                if (!contractor.getMobileStatus().equals("verified")) {
                    ra.addFlashAttribute("contMobile", contractor.getMobileno());
                     System.out.println("Mobile is not verified");
                   ra.addFlashAttribute("notVerifyMobile", "Please Verify Mobile");
                    ra.addFlashAttribute("contVerifyRegId", contractor.getId());
                }
                ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/";
    }

    /*
     *@deleteOrg Method
     *Method used to delete the data on the basis of foreign key 
     *@return boolean value
     */
    @RequestMapping("/deleteOrg")
    @ResponseBody
    public boolean deleteOrg(@RequestParam Integer contOtherId) {
        System.out.println("----------------deleteOrg Method is run--------------------");
        boolean status = false;
        List<Integer> appIds = contractordetailsdao.fetchApplicantIds(contOtherId);
        try {
            if ((appIds.size() > 0) && (appIds != null)) {
                status = contractordetailsdao.deleteApplicant(contOtherId);
            } else {
                return status;
            }
            System.out.println("status is:" + status);
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:deleteOrg() ");
        }
        System.out.println("----------------deleteOrg Method is closed-------------------");
        return status;
    }

    /**
     * @saveContractordetails Method
     * @saveContractordetails method used to save Contractor other details
     */
    @RequestMapping(value = "/saveContractordetails", method = RequestMethod.POST)
    @ResponseBody
    public String saveContractorDetails(@ModelAttribute("Contractordetails") ContractorDetails contractorDetails, HttpSession session,
            @RequestParam Integer contOtherId, int regId, String contractorType, String step, String status, Model m,
            HttpServletRequest request, RedirectAttributes ra) throws Exception {
        System.out.println("------------------saveContractordetails Method is run------------------------");
        System.out.println("step of wizard is:" + step);
        System.out.println("status of wizard is:" + status);
        System.out.println("contractorType" + contractorType);
        map.clear();
        System.out.println("saveContractorDetails : " + contractorDetails.getContOtherId() + " contOtherId : " + contOtherId);
        List<Integer> res = new ArrayList<Integer>();

        String result = contractorDetailsModel.checkValidation(contractorDetails, step, contractorType, contOtherId);
        if (!result.equals("done")) {
            System.out.println("FIELDS ARE EMPTY");
            return result;
        }
        try {
            if (contOtherId != null || contOtherId >= 0) {
                contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
            }
            if (contractorType.equalsIgnoreCase("foreign")) {
                if (step.equalsIgnoreCase("step1")) {
                    //for foreign registration certificate   
                    if (contractorDetails.getForeignRegDoc() != null) {
                        System.out.println("saving the reg doc file");
                        String foreignRegDocName = contractorDetails.getForeignRegDoc().getOriginalFilename();
                        String fregDoc = deptService.saveDepartmentFile(contractorDetails.getForeignRegDoc(), request, foreignRegDocName);
                        contractorDetails.setForeignRegDocName(foreignRegDocName);
                        contractorDetails.setForeignRegDocUrl(fregDoc);
//            map.put("foreignRdocurl",fregDoc);
//            map.put("foreignRname",foreignRegDocName);

                    } else {
                        System.out.println("updating the reg doc file");
//                        contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                        contractorDetails.setForeignRegDocName(contractorDetailsFetch.getForeignRegDocName());
                        contractorDetails.setForeignRegDocUrl(contractorDetailsFetch.getForeignRegDocUrl());
                    }
                    //for foreign tin document  
                    if (contractorDetails.getForeignTINDoc() != null) {
                        System.out.println("saving the foreign tin doc file");
                        String foreignTINDocName = contractorDetails.getForeignTINDoc().getOriginalFilename();
                        String tinDoc = deptService.saveDepartmentFile(contractorDetails.getForeignTINDoc(), request, foreignTINDocName);
                        contractorDetails.setForeignTINDocUrl(tinDoc);
                        contractorDetails.setForeignTINDocName(foreignTINDocName);
                    } else {
                        System.out.println("updating the foreign tin doc file");
//                        contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                        contractorDetails.setForeignTINDocUrl(contractorDetailsFetch.getForeignTINDocUrl());
                        contractorDetails.setForeignTINDocName(contractorDetailsFetch.getForeignTINDocName());
                    }

                }
            }
            if (step.equalsIgnoreCase("step2")) {
//                if(contractorType.equalsIgnoreCase("indian")){
//                    System.out.println("update");
//                  contractordao.updateContractorName(contractorDetails.getIndianfName(), contractorDetails.getIndianmName(),contractorDetails.getIndianlName(), regId);
//                }

                if (contractorDetails.getGistnDoc() != null) {
                    System.out.println("saving the file of gistn doc");
                    String gistnDocName = contractorDetails.getGistnDoc().getOriginalFilename();
                    System.out.println("gistnDocName :  " + gistnDocName);
                    String gistnDocUrl = deptService.saveDepartmentFile(contractorDetails.getGistnDoc(), request, gistnDocName);
                    System.out.println("gistnDocUrl :  " + gistnDocUrl);
                    contractorDetails.setGistnDocName(gistnDocName);
                    contractorDetails.setGistnDocUrl(gistnDocUrl);
                } else {
                    System.out.println("updating gistn document");
//                    if(contractorDetailsFetch.getGistnDocName() != null){
////                    contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
//                    contractorDetails.setGistnDocName(contractorDetailsFetch.getGistnDocName());
//                    contractorDetails.setGistnDocUrl(contractorDetailsFetch.getGistnDocUrl());
//                    }else{
                    contractorDetails.setGistnDocName(null);
                    contractorDetails.setGistnDocUrl(null);
//                }
                }
                System.out.println("steps 2");

                if (contractorDetails.getContCompanyType().equalsIgnoreCase("1")) {
                    System.out.println("comtype");
                    if (contractorDetails.getMsmeDoc() != null) {
                        System.out.println("saving the file");
                        String msmeDocName = contractorDetails.getMsmeDoc().getOriginalFilename();
                        System.out.println("msmeDoc:" + msmeDocName);
                        String msmeDoc = deptService.saveDepartmentFile(contractorDetails.getMsmeDoc(), request, msmeDocName);
                        contractorDetails.setMsmeDocName(msmeDocName);
                        contractorDetails.setMsmeDocUrl(msmeDoc);
                        System.out.println("expiry date is " + contractorDetails.getExpiryDate());
                        contractorDetails.setExpiryDate(contractorDetails.getExpiryDate());
                    } else {
                        System.out.println("updating the file");
//                        contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                        System.out.println("setMsmeDocName : " + contractorDetailsFetch.getMsmeDocName());
                        contractorDetails.setMsmeDocName(contractorDetailsFetch.getMsmeDocName());
                        contractorDetails.setMsmeDocUrl(contractorDetailsFetch.getMsmeDocUrl());
                        System.out.println("expiry date is " + contractorDetails.getExpiryDate());
                        contractorDetails.setExpiryDate(contractorDetails.getExpiryDate());
                    }

                } else if (contractorDetails.getContCompanyType().equalsIgnoreCase("2")) {
                    if (contractorDetails.getMsmeDoc() != null) {
                        System.out.println("saving the nsic file");
                        String msmeDocName = contractorDetails.getMsmeDoc().getOriginalFilename();
                        System.out.println("nsic" + msmeDocName);
                        String msmeDoc = deptService.saveDepartmentFile(contractorDetails.getMsmeDoc(), request, msmeDocName);
                        contractorDetails.setMsmeDocName(msmeDocName);
                        contractorDetails.setMsmeDocUrl(msmeDoc);
                        System.out.println("expiry date is " + contractorDetails.getExpiryDate());
                        contractorDetails.setExpiryDate(contractorDetails.getExpiryDate());
                    } else {
                        System.out.println("updating the nsic file");
//                        contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                        contractorDetails.setMsmeDocName(contractorDetailsFetch.getMsmeDocName());
                        contractorDetails.setMsmeDocUrl(contractorDetailsFetch.getMsmeDocUrl());
                        System.out.println("expiry date is " + contractorDetails.getExpiryDate());
                        contractorDetails.setExpiryDate(contractorDetails.getExpiryDate());
                    }
                } else {
                    contractorDetails.setMsmeDocName(null);
                    contractorDetails.setMsmeDocUrl(null);
                    contractorDetails.setExpiryDate(null);
                }
                String contClass = contractorDetails.getContractorClass();
                if (contClass != null) {
                    if (!contClass.equalsIgnoreCase("1")) {
                        if (contractorDetails.getContractorClassDoc() != null) {
                            System.out.println("saving the contractor class file");
                            String classDocName = contractorDetails.getContractorClassDoc().getOriginalFilename();
                            String classDoc = deptService.saveDepartmentFile(contractorDetails.getContractorClassDoc(), request, classDocName);
                            contractorDetails.setContractorClassDocName(classDocName);
                            contractorDetails.setContractorClassDocUrl(classDoc);
                        } else {
                            System.out.println("updating the contractor class file");
                            System.out.println("setContractorClassDocName : " + contractorDetailsFetch.getContractorClassDocName());
//                            contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                            contractorDetails.setContractorClassDocName(contractorDetailsFetch.getContractorClassDocName());
                            contractorDetails.setContractorClassDocUrl(contractorDetailsFetch.getContractorClassDocUrl());
                        }

                    }

                }
                //for Indian registration certificate   
                if (contractorDetails.getAgentRegDoc() != null) {
                    System.out.println("saving the file");
                    String agentRegDocName = contractorDetails.getAgentRegDoc().getOriginalFilename();
                    String aregDoc = deptService.saveDepartmentFile(contractorDetails.getAgentRegDoc(), request, agentRegDocName);
                    contractorDetails.setAgentRegDocName(agentRegDocName);
                    contractorDetails.setAgentRegDocUrl(aregDoc);
                } else {
                    System.out.println("updating the file");
//                    contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                    contractorDetails.setAgentRegDocName(contractorDetailsFetch.getAgentRegDocName());
                    contractorDetails.setAgentRegDocUrl(contractorDetailsFetch.getAgentRegDocUrl());
                }
                //for PAN Card certificate   
                if (contractorDetails.getAgentPANDoc() != null) {
                    System.out.println("saving the pan doc file");
                    String agentPANDocName = contractorDetails.getAgentPANDoc().getOriginalFilename();
                    String aPANDoc = deptService.saveDepartmentFile(contractorDetails.getAgentPANDoc(), request, agentPANDocName);
                    contractorDetails.setAgentPANDocName(agentPANDocName);
                    contractorDetails.setAgentPANDocUrl(aPANDoc);
                } else {
                    System.out.println("updating the pan doc file");
//                    contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                    contractorDetails.setAgentPANDocName(contractorDetailsFetch.getAgentPANDocName());
                    contractorDetails.setAgentPANDocUrl(contractorDetailsFetch.getAgentPANDocUrl());
                }

//            contractorDetails.setContractorClass(Integer.parseInt(contClass));
                contractorDetails.setContApplication(null);
                if (contractorType.equalsIgnoreCase("foreign")) {
                    System.out.println("contractor type is foreign");
//                    ContractorDetails contractordetails = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                    System.out.println("Fetching is:" + contractorDetailsFetch.getForeignRegDocName());
                    contractorDetails.setForeignRegDocName(contractorDetailsFetch.getForeignRegDocName());
                    contractorDetails.setForeignRegDocUrl(contractorDetailsFetch.getForeignRegDocUrl());
                    contractorDetails.setForeignTINDocName(contractorDetailsFetch.getForeignTINDocName());
                    contractorDetails.setForeignTINDocUrl(contractorDetailsFetch.getForeignTINDocUrl());
                } else {
                    System.out.println("contractor type is indian");
                }
                contractorDetails.setWizardStepStatus(step);
            }

//            contractorDetails.setContApplication(null);
            if (step.equalsIgnoreCase("step3")) {
//                ContractorDetails contractordetails = (ContractorDetails) contractordetailsdao.fetchData(contOtherId);
                boolean deleteStatus = contractordetailsdao.deleteApplicant(contOtherId);
                System.out.println("deleteStatus is: " + deleteStatus);
                for (ContractorOrganizationType contApplication : contractorDetails.getContApplication()) {
                    System.out.println("contractordetaisl list or is  " + contractorDetails.getContApplication().size());
                    if (contractorDetailsFetch.getContOrganization().equalsIgnoreCase("7")) {
                        contApplication.setShNo(null);
                        contApplication.setPtnrNo(null);
                        contApplication.setContAppId(null);
                        contApplication.setShAadharNo(null);
                        contApplication.setShDirName(null);
                        contApplication.setShPANNo(null);
                        contApplication.setShMobNo(null);
                        contApplication.setDinNo(null);
                    }
                    if (contractorDetailsFetch.getContOrganization().equalsIgnoreCase("4") || contractorDetailsFetch.getContOrganization().equalsIgnoreCase("5") || contractorDetailsFetch.getContOrganization().equalsIgnoreCase("6")) {
                        contApplication.setPtnrNo(null);
                        contApplication.setShNo(null);
                        contApplication.setPtnrAadharNo(null);
                        contApplication.setPtnrMobNo(null);
                        contApplication.setPtnrName(null);
                        contApplication.setPtnrPANNo(null);
                        contApplication.setPtnrPop(null);
                        contApplication.setContAppId(null);
                    }
                    System.out.println("Partner Name" + contApplication.getPtnrAadharNo());
//                    System.out.println("Director Name" + contApplication.getShDirName());
                    contApplication.setContractorOtherDetails(contractorDetails);
                }
                contractorDetails.setAgentPANDocName(contractorDetailsFetch.getAgentPANDocName());
                contractorDetails.setAgentAddress(contractorDetailsFetch.getAgentAddress());
                contractorDetails.setAgentCity(contractorDetailsFetch.getAgentCity());
                contractorDetails.setAgentContact1(contractorDetailsFetch.getAgentContact1());
                contractorDetails.setAgentContact2(contractorDetailsFetch.getAgentContact2());
                contractorDetails.setAgentPANDocUrl(contractorDetailsFetch.getAgentPANDocUrl());
                contractorDetails.setAgentPincode(contractorDetailsFetch.getAgentPincode());
                contractorDetails.setAgentRegDocName(contractorDetailsFetch.getAgentRegDocName());
                contractorDetails.setAgentRegDocUrl(contractorDetailsFetch.getAgentRegDocUrl());
                contractorDetails.setAgentRegno(contractorDetailsFetch.getAgentRegno());
                contractorDetails.setAgentCity(contractorDetailsFetch.getAgentCity());
                contractorDetails.setAgentState(contractorDetailsFetch.getAgentState());
                if (contractorDetails.getGistnNo() != null) {
                    contractorDetails.setGistnNo(contractorDetailsFetch.getGistnNo());
                    if (contractorDetails.getGistnDoc() != null) {
                        contractorDetails.setGistnDocUrl(contractorDetailsFetch.getGistnDocUrl());
                        contractorDetails.setGistnDocName(contractorDetailsFetch.getGistnDocName());
                    }
                }
                if (contractorDetails.getAgentWebsite() != null) {
                    contractorDetails.setAgentWebsite(contractorDetailsFetch.getAgentWebsite());
                }
                contractorDetails.setAgentemail(contractorDetailsFetch.getAgentemail());
                contractorDetails.setContractorClass(contractorDetailsFetch.getContractorClass());
                String contclassName = contractorDetailsFetch.getContractorClass();
                if (!contclassName.equalsIgnoreCase("1")) {
                    contractorDetails.setContractorClassDocName(contractorDetailsFetch.getContractorClassDocName());
                    contractorDetails.setContractorClassDocUrl(contractorDetailsFetch.getContractorClassDocUrl());
//                contractorDetails.setContractorClassName(contractorClass.getContractorClass_Name());
                }
                contractorDetails.setIndianOrgName(contractorDetailsFetch.getIndianOrgName());
                contractorDetails.setSocialCategory(contractorDetailsFetch.getSocialCategory());
                contractorDetails.setContOrganization(contractorDetailsFetch.getContOrganization());
                contractorDetails.setContCompanyType(contractorDetailsFetch.getContCompanyType());
                if (!contractorDetailsFetch.getContCompanyType().equals("3")) {
                    contractorDetails.setMsmeDocName(contractorDetailsFetch.getMsmeDocName());
                    contractorDetails.setMsmeDocUrl(contractorDetailsFetch.getMsmeDocUrl());
                    contractorDetails.setExpiryDate(contractorDetailsFetch.getExpiryDate());
                }
                if (contractorType.equalsIgnoreCase("foreign")) {
                    contractorDetails.setForeignAddress(contractorDetailsFetch.getForeignAddress());
                    contractorDetails.setForeignCity(contractorDetailsFetch.getForeignCity());
                    contractorDetails.setForeignContact1(contractorDetailsFetch.getForeignContact1());
                    contractorDetails.setForeignContact2(contractorDetailsFetch.getForeignContact2());
                    contractorDetails.setForeignOrgName(contractorDetailsFetch.getForeignOrgName());
                    contractorDetails.setForeignPincode(contractorDetailsFetch.getForeignPincode());
                    contractorDetails.setForeignRegDocName(contractorDetailsFetch.getForeignRegDocName());
                    contractorDetails.setForeignRegDocUrl(contractorDetailsFetch.getForeignRegDocUrl());
                    contractorDetails.setForeignRegno(contractorDetailsFetch.getForeignRegno());
                    contractorDetails.setForeignState(contractorDetailsFetch.getForeignState());
                    contractorDetails.setForeignTINDocName(contractorDetailsFetch.getForeignTINDocName());
                    contractorDetails.setForeignTINDocUrl(contractorDetailsFetch.getForeignTINDocUrl());
                    contractorDetails.setForeignTINNo(contractorDetailsFetch.getForeignTINNo());
                    contractorDetails.setForeignWebsite(contractorDetailsFetch.getForeignWebsite());
                    contractorDetails.setForeignemail(contractorDetailsFetch.getForeignemail());

                }
                contractorDetails.setWizardStepStatus("step3");
            }

            if (!contractorDetails.getContOrganization().equals("11") || contractorDetails.getContOrganization().equals("")) {
                contractorDetails.setOtherOrganization(null);
            }
            contractorDetails.setMsmeStatus("Enable");
            contractorDetails.setContractorClassStatus("Enable");
            Date date = new Date();
//            int regId = (Integer) session.getAttribute("regid");
            System.out.println("Contractor registration is" + regId);
            contractorDetails.setUpdatedOn(date);
            contractorDetails.setRegisId(regId);
            contractorDetails.setStatus(status);
            contractordetailsdao.insertData(contractorDetails);
            int id = contractorDetails.getContOtherId();
            logs.setContractorId(id);
            res.add(id);
            List ids = contractordetailsdao.fetchApplicantIds(contractorDetails.getContOtherId());
            if (ids.size() > 0) {
                System.out.println("ids condition");
                ids.add(contractorDetails.getContOrganization());
                res.addAll(ids);
                System.out.println("values in res are:" + res);
            }
// List<Integer> ids = contractordetailsdao.fetchApplicantIds(contractorDetails.getContOtherId());
//            ContractorDetails contractorDetailslogs = (ContractorDetails) contractordetailsdao.fetchData(id);
            String stepStatus = contractorDetails.getWizardStepStatus();
            System.out.println("The wizard step status is:  " + stepStatus);
            if (contOtherId != null) {
                logs.setActivity("Update Contractor Other Details of " + stepStatus);
                logs.setLogMessage("Contractor Other Details Updated Successfully");
            } else {
                logs.setActivity("Save Contractor Other Details of " + stepStatus);
                logs.setLogMessage("Contractor Other Details Save Successfully");
            }
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setIpAddress(logsAction.fetchIpAddress());
            logs.setOsName(logsAction.FetchOSName());
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setContractorId(regId);
            logsActionDao.save(logs);
            System.out.println("reg id " + contractorDetails.getRegisId());
            System.out.println("Id: " + id);
            session.setAttribute("id", id);
//            map.put("contOtherId", id);
            map.put("res", res);
            return gson.toJson(map);
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:saveContractorDetails ");
        }
        System.out.println("------------------saveContractordetails Method is end------------------------");
        return gson.toJson(res);
    }

    //------------------------------------------------------------------------------------
    /**
     * @deleteRow method Method used to delete row return status true or false
     * when row is deleted
     */
    @RequestMapping("/deleteRow")
    @ResponseBody
    public boolean deleteRow(@RequestParam Integer rowId) {
        System.out.println("----------------deleteRow Method is run--------------------");
        boolean status = false;
        try {
            System.out.println("contractor detail id is:" + rowId);
            if (rowId != null) {
                status = contractordetailsdao.removeData(rowId);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:deleteRow() ");
        }
        System.out.println("----------------deleteRow Method is closed-------------------");
        return status;
    }

//------------------------------Contractor Registration-----------------------------------------------

     /*
     *Contractor Registration
     *Method used to Register Contractor
     *return status whether the data is successfully saved or not
     */
    @RequestMapping("/Contractorsave")
    @ResponseBody
    public List contractorSave(@ModelAttribute("contractor") Contractor contractor, Model m, HttpSession session, HttpServletRequest request) throws IOException {
        boolean duplicateCheckMob;
        boolean duplicateCheckEmail;
        Integer regId = (Integer) session.getAttribute("contRegId");
        Contractor contractor1 = null;
        String encreptPassword = "";
        boolean status = false;
        String result = "";
        String result1 = "";
        List res = new ArrayList();
        ContractorLogs clogs = new ContractorLogs();
        String subject = "Registration is Successful";
      
//        System.setProperty("proxyHost", "192.168.0.2");
//        System.setProperty("proxyPort", "3128");
        try {
            SimpleMailMessage email = new SimpleMailMessage();
            email.setFrom(emailFromRecipient);
            email.setSubject(subject);
            result1 = contractorModel.validateContractor(contractor, session);
            System.out.println("result for validation is: " + result1);
            if (!result1.equals("Noerror")) {
                System.out.println("Validation is called some fields are empty");
                res.add(result1);
                return res;
             }
             //checking for updating Contractor Details
            System.out.println("session registration id is:  "+regId);
            if (regId != null) {
                contractor1 = (Contractor) contractordao.fetchData(regId);//fetch contractor data from a particular id
                contractor.setContractorType(contractor1.getContractorType());
                contractor.setPassword(contractor1.getPassword());
//                contractor.setSecretKey(contractor1.getSecretKey());
                contractor.setEmailStatus(contractor1.getEmailStatus());
                contractor.setMobileStatus(contractor1.getMobileStatus());
                contractor.setOtpStatus(contractor1.getOtpStatus());
                contractor.setId(regId);
                logs.setActivity("Update Contractor Basic Details");
                logs.setLogMessage("Contractor Registration Basic Details have been Updated");
               if (contractor.getMobileno().trim().equals(contractor1.getMobileno().trim())) {
                    contractor.setMobileno(contractor1.getMobileno().trim());
                } else {
                   String mob = contractor.getMobileno().trim();
                    duplicateCheckMob = departmentUserDAO.checkDuplicateContect(mob);
                    if (duplicateCheckMob == true) {
                        res.add("Mobile  is already registered");
                        return res;
                    }
                    contractor.setMobileno(mob);
                    contractor.setMobileStatus("Not verified");
                    res.add("Mobile is changed");
//                    res.add(generatedOTP);
                }
                if (contractor.getEmailid().equals(contractor1.getEmailid())) {
                    contractor.setEmailid(contractor1.getEmailid());
                } else {
                    duplicateCheckEmail = departmentUserDAO.checkDuplicateEmail(contractor.getEmailid());
                     if (duplicateCheckEmail == true) {
                      res.add("Emailid is already registered");
                      return res;
                      }
                    contractor.setEmailid(contractor.getEmailid());
                    contractor.setEmailStatus("Not verified");
                    res.add("EmailId is changed");
                    email.setTo(contractor.getEmailid());
                    String confirmationUrl = "/contractorVerification?EmailNo=" + contractor.getId();
                    email.setText("To verify your Email:Please click here" + " " +"<a href='http://newlotus.org.osmo/" + confirmationUrl+"</a>");
                    System.out.println(" email link " + email.getText());
                    mailSender.send(email);

                }
            } else {
                encreptPassword = new AesEncrDec().encrypt(contractor.getPassword(), secretKey);
                contractor.setPassword(encreptPassword);
//                contractor.setEmailStatus("Not verified");
//                contractor.setMobileStatus("Not verified");
                 contractor.setEmailStatus("verified");
                  contractor.setMobileStatus("verified");
                contractor.setOtpStatus("Enable");
                String emailid = contractor.getEmailid().trim();
                contractor.setEmailid(emailid);
                logs.setActivity("Save Contractor Basic Details");
                logs.setLogMessage("Contractor Registration is Successful");
            }

            String firstname = contractor.getFirstname().trim();
            System.out.println("firstname:" + firstname);
            contractor.setFirstname(firstname);
            String middlename = contractor.getMiddlename().trim();
            contractor.setMiddlename(middlename);
            String lastname = contractor.getLastname().trim();
            contractor.setLastname(lastname);
            if (!contractor.getDesignation().equalsIgnoreCase("3")) {
                contractor.setOtherDesignation(null);
            }
            String fullname = "" + contractor.getFirstname() + " " + contractor.getMiddlename() + " " + contractor.getLastname();
            System.out.println("Contractor Name is:" + fullname);
            contractor.setFullname(fullname);
            Date date = new Date();
            contractor.setDate(date);
            contractor.setRequeststatus("NotAllowed");
            status = contractordao.insertData(contractor);
           System.out.println("Contractor Registration is successful "+status);
//             }
             if (regId != null) {
                if (res.isEmpty()) {
                    System.out.println("result");
                    result = "Data Updated Successfully";
                    System.out.println("Data Updated Successfully :-" + result);
                    res.add(result);
                }
            return res;
            }
            if (status == true) {
//            session.setAttribute("contRegId", contractor.getId());
            System.out.println("Reg Id is: " + contractor.getId());
            logs.setContractorId(contractor.getId());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setOsName(logsAction.FetchOSName());
            logsActionDao.save(logs);
                clogs.setContstatus("notsuspend");
                clogs.setRequestdate(date);
                clogs.setContid(contractor.getId());
                clogs.setRequeststatus("NotAllowed");
                contractorlogsdao.insertData(clogs);
                Common_Logon_Status commonlogin = new Common_Logon_Status();
                new Date();
                commonlogin.setCurrent_Login(date);
//                commonlogin.setContractor_regId(contractor.getId());
                commonlogin.setEmailid(contractor.getEmailid());
                commonlogin.setPassword(contractor.getPassword());
                commonlogin.setMobileno(contractor.getMobileno());
                commonlogin.setBrowserName(logsAction.getClientBrowser(request));
//                commonlogin.setSecretKey(contractor.getSecretKey());
                commonlogin.setRole("Contractor");
                departmentUserDaoImpl.saveStatus(commonlogin);
                logsActionDao.save(logs);
                System.out.println("Status  : " + status);
                  result = "Data Saved Sucessfully";
                res.add(result);
                res.add(contractor.getId());
                
                email.setTo(contractor.getEmailid());
                String confirmationUrl = "/contractorVerification?EmailNo=" + contractor.getId();
                    email.setText("To verify your Email:Please click here" + " " +"<a href='http://newlotus.org.osmo/"+confirmationUrl+"'></a>");
//                   email.setText(content);
                  System.out.println("   email link " + email.getText());
                //  mailSender.send(email);
                 return res;
            }
       
        } catch (Exception e) {
            System.out.println("Exception:" + e.getMessage());
            System.out.println("ContractorController\nMethod:contractorSave");
        }

        return null;
    }

    /**
     * @contractorEmailVerification Method
     * @contractorEmailVerification method used to verify the Email and update
     * the Email verify status to verified
     * @param Contractor Registration Id
     */
    @RequestMapping("/contractorVerification")
    public String contractorEmailVerification(@RequestParam Integer EmailNo,RedirectAttributes ra) {
        try {
            System.out.println("the reg id is:" + EmailNo);
            if (EmailNo != null) {
                contractordao.emailverified(EmailNo,"verified");
            }
        } catch (Exception ex) {
            System.out.println("Exception in ContractorDetailsController Method:contractorEmailVerification()");
        }
         ra.addFlashAttribute("RegContEmailVerificationMessage", "Email Id Is Verified Successfully");
        return "redirect:/";
    }
    /*
     *checkEmail
     *Method used to check that the email id is already registered or not
     *@duplicate Emailid
     */

    @RequestMapping("/CheckEmail")
    @ResponseBody
    public String checkEmail(@RequestParam String email) {
        System.out.println("email in controller is:  " + email);
        String msg = "valid Email";
        boolean flag = false;
        try {
            flag = departmentUserDaoImpl.checkDuplicateEmail(email);
            System.out.println("Flag for checking duplicacy of email is: " + flag);
            if (flag == true) {
                msg = "Duplicate Email";
                System.out.println("duplicate useremail..........");
                return msg;
            }
        } catch (Exception ex) {
            System.out.println("Exception Method:checkEmail and Conroller:ContractorDetails");
            ex.printStackTrace();
        }
        return msg;
    }

//-------------------------CheckDuplicateNumber---------------------------------  
   /*@uniquePAN_no 
     *@Method is used to check uniqueness of PAN number of Organization
     *@PAN number
     */
    @RequestMapping("/uniqueOrgPan")
    @ResponseBody
    public String uniquePAN_no(@RequestParam String PANNo, @ModelAttribute ContractorDetails contractorDetails) {
        String msg = "valid PAN Number";
        List<ContractorDetails> contractorDetailsList = contractordetailsdao.fetchAll();
        System.out.println(".....................PAN Number is" + PANNo);
        Iterator<ContractorDetails> iterator = (Iterator<ContractorDetails>) contractorDetailsList.listIterator();
        try {
            while (iterator.hasNext()) {
                ContractorDetails cod = iterator.next();
                System.out.println("Tax Identification No from list is: " + cod.getForeignTINNo());
                if (PANNo.equalsIgnoreCase(cod.getOrgPAN())) {
                    msg = "PAN Number is already exist";
                    System.out.println("duplicate PAN Number" + " " + PANNo);
                    return msg;
                }
            }
            return msg;
        } catch (Exception ex) {
            System.out.println("Exception Method:uniquePAN_no and Conroller:ContractorDetails");
            ex.printStackTrace();
        }
        return msg;
    }

    /**
     * @uniqueTINNo Method
     * @uniqueTINNo method used to check the uniqueness of Tax Identification
     * Number from Contractor Profile table
     * @param TIN number and model attribute of ContractorDetails
     */
    @RequestMapping("/uniqueTINNo")
    @ResponseBody
    public String uniqueTINNo(@RequestParam String tinNo, @ModelAttribute ContractorDetails contractorDetails) {
        String msg = "valid TIN_no";
        try {
            List<ContractorDetails> contractorDetailsList = contractordetailsdao.fetchAll();
            System.out.println(".....................checkRegNo" + tinNo);
            Iterator<ContractorDetails> iterator = (Iterator<ContractorDetails>) contractorDetailsList.listIterator();
            while (iterator.hasNext()) {
                ContractorDetails cod = iterator.next();
                System.out.println("Tax Identification No from list is: " + cod.getForeignTINNo());
                if (tinNo.equalsIgnoreCase(cod.getForeignTINNo())) {
                    msg = "Tax Identification No. is already exist";
                    System.out.println("duplicate TIN Number" + " " + tinNo);
                    return msg;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in Class: ContractorDetails Controller Method: uniqueTINNo()");
        }
        return msg;
    }

    /**
     * @uniqueDINNo Method
     * @uniqueDINNo method used to check the uniqueness of Director
     * Identification Number from Contractor Profile table
     * @param DIN number and model attribute of ContractorDetails
     */
    @RequestMapping("/uniqueDINNo")
    @ResponseBody
    public String uniqueDINNo(@RequestParam String DINNo, @ModelAttribute ContractorDetails contractorDetails) {
        String msg = "valid DIN Number";
        try {
            List<ContractorDetails> contractorDetailsList = contractordetailsdao.fetchAll();
            System.out.println(".....................check DIN Number" + DINNo);
            Iterator<ContractorDetails> iterator = (Iterator<ContractorDetails>) contractorDetailsList.listIterator();
            while (iterator.hasNext()) {
                ContractorDetails cod = iterator.next();
                for (ContractorOrganizationType contApplication : cod.getContApplication()) {
                    if (DINNo.equalsIgnoreCase(contApplication.getDinNo())) {
                        msg = "DIN No. is already exist";
                        System.out.println("duplicate DIN Number" + " " + DINNo);
                        return msg;
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in Class: ContractorDetails Controller Method: uniqueDINNo()");
        }
        return msg;
    }

    /*
     *CheckDuplicateNumber
     *Method used to check duplicate Mobile Number
     *@duplicate Mobile Number
     */
    @RequestMapping("/checkUserContact")
    @ResponseBody
    public String checkContact(@RequestParam String mobile) {
        String msg = "valid mobile_no";
        try {
            boolean flag = false;
            flag = departmentUserDAO.checkDuplicateContect(mobile);
            if (flag == true) {
                msg = "Duplicate mobile_no";
                System.out.println("duplicate mobile_no..");
                return msg;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in Class: ContractorDetails Controller Method: checkContact()");
        }
        return msg;
    }
    /*
     *@viewPrimaryContractor Method 
     *used to view the details of Contractor Profile
     *return Contractorotherdetail jsp page
     */

    @RequestMapping("/viewPrimaryContractor")
    public String viewPrimaryContractor(Model m, HttpSession session, RedirectAttributes ra) {
        ContractorDesignation contractorDesignation = null;
        ContractorDetails contractorDetails = null; 
        Contractor contractor=null;
        States states = null;
        Cities cities = null;
        Countries countries = null;
        SocialCategory socialCategory = null;
        ContractorClass contractorClass = null;
        ContractorClassSecond contractorClassSecond=null;
        OrganizationType organizationType = null;
        MsmeOrg msmeOrg = null;
        System.out.println("-------Method called to  viewPrimaryContractor-----------");
        try {
           Integer id =(Integer) session.getAttribute("contRegId");
            System.out.println("session contractor id is :  "+id);
            System.out.println("id is:" + id );
            if(id >0){
            contractor = (Contractor) contractordao.fetchData(id);
            session.setAttribute("mobileno", contractor.getMobileno());
            }
            String designationId = contractor.getDesignation();
            System.out.println("designationId" + designationId);
            contractorDesignation = contractorDesignationDao.fetchData(Integer.parseInt(contractor.getDesignation()));
            System.out.println("contractordesigname " + contractorDesignation.getDesigName());
            contractor.setDesignationName(contractorDesignation.getDesigName());
            contractorDetails = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(id);
            String contractorType = contractor.getContractorType();
            if (contractorType.equalsIgnoreCase("foreign")) {
                countries = countryDao.fetchData(contractorDetails.getCountry());
                states = statesdao.fetchData(contractorDetails.getForeignState());
                cities = citiesdao.fetchByIdEdit(contractorDetails.getForeignCity());
                contractorDetails.setForeignCountryName(countries.getCountry_name());
                contractorDetails.setForeignStateName(states.getState_name());
                contractorDetails.setForeignCityName(cities.getCity_name());
            }
            states = statesdao.fetchData(contractorDetails.getAgentState());
            System.out.println("states name is:" + states.getState_name());
            System.out.println("city id is:" + contractorDetails.getAgentCity());
            cities = citiesdao.fetchByIdEdit(contractorDetails.getAgentCity());
            System.out.println("cities name is:" + cities.getCity_name());
//            contractorClass = (ContractorClass) contractorClassDao.fetchData(Integer.parseInt(contractorDetails.getContractorClass()));
            contractorClassSecond=contractorClassSecondDao.fetchData(Integer.parseInt(contractorDetails.getContractorClass()));//for new contractor class
            System.out.println("contractorClassSecond name: "+contractorClassSecond.getContClassName());
            socialCategory = (SocialCategory) socialCategoryDao.fetchData(Integer.parseInt(contractorDetails.getSocialCategory()));
            contractorDetails.setAgentCityName(cities.getCity_name());
            msmeOrg = msmeDao.fetchData(Integer.parseInt(contractorDetails.getContCompanyType()));
            contractorDetails.setContCompanyName(msmeOrg.getComName());
            organizationType = organizationTypeDao.fetchData(Integer.parseInt(contractorDetails.getContOrganization()));
            contractorDetails.setOrgTypeName(organizationType.getOrganizationType());
            System.out.println("social category name is:" + socialCategory.getCategoryName());
            contractorDetails.setSocialCategoryName(socialCategory.getCategoryName());
            contractorDetails.setAgentStateName(states.getState_name());
            contractorDetails.setContractorClassName(contractorClassSecond.getContClassName());//for new contractor second
//            contractorDetails.setContractorClassName(contractorClass.getContractorClass_Name());
            System.out.println("contractorDetails in view primary is:  " + contractorDetails);
            m.addAttribute("contractorDetails", contractorDetails);
            m.addAttribute("Contractordetails", contractorDetails);
            m.addAttribute("secondrycontractor", new Secondary_Contractor());
            m.addAttribute("contractor", contractor);
            m.addAttribute("regId", contractor.getId());
            List<ContractorDesignation> contractorDesignationList = contractorDesignationDao.fetchAll();
            m.addAttribute("contDesignationList", contractorDesignationList);
            session.setAttribute("contEmail", contractor.getEmailid());
            session.setAttribute("contMobile", contractor.getMobileno());
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("ContractorController\nMethod:editContractor");
        }

        System.out.println("---------------------------Method End to  viewPrimaryContractor-----------------------------------");
        return "Contractor/ViewContractorProfile";
    }

    /*
     *@showMsmeDoc Method 
     *used to retrieve MSME/NSIC documents from ContractorDetails
     *return ShowMsmeNsicDocument jsp page
     */
    @RequestMapping(value = "/showMsmeDoc")
    public String showMsmeDoc(@ModelAttribute Contractor contractor, ContractorDetails contractorDetails, Model m, HttpSession session) {
        System.out.println("...............showMsmeDoc Method run................");
        List<ContractorDetails> contractorDetailsList = null;
        List<Contractor> contractorList = new ArrayList<Contractor>();
        List<Integer> regList = new ArrayList<Integer>();
        try {

            contractorDetailsList = (List<ContractorDetails>) contractordetailsdao.fetchMsmeDoc();
            for (ContractorDetails contractordetails : contractorDetailsList) {
                System.out.println("Id is:" + contractordetails.getRegisId());
                regList.add(contractordetails.getRegisId());//adding registration id from ContractorDetails 
            }
            System.out.println("Size of id in list are:" + regList.size());

            for (Integer integer : regList) {
                System.out.println("Id in regListlist is:  " + integer);
                Contractor contractors = (Contractor) contractordao.fetchData(integer);
                contractorList.add(contractors);
            }

            System.out.println("~~~~~~ Contractor List size is:   " + contractorList.size());
            m.addAttribute("contractorList", contractorList);
            m.addAttribute("contractorDetailsList", contractorDetailsList);

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:showMsmeDoc");
        }
        return "DepartmentAdmin/ShowMsmeNsicDocument";
    }

    /*
     *@showContractorClassDoc Method 
     *used to retrieve Contractor Class documents from ContractorDetails
     *return showContractorClassDocument jsp page
     */
    @RequestMapping(value = "/showContractorClassDoc")
    public String showContractorClassDoc(@ModelAttribute Contractor contractor, ContractorDetails contractorDetails, Model m, HttpSession session) {
        System.out.println("...............showContractorClassDoc Method run................");
        List<ContractorDetails> contractorDetailsList = null;
        List<Contractor> contractorList = new ArrayList<Contractor>();
        List<Integer> regList = new ArrayList<Integer>();
        try {

            contractorDetailsList = (List<ContractorDetails>) contractordetailsdao.fetchContractorClassDoc();
            for (ContractorDetails contractordetails : contractorDetailsList) {
                System.out.println("~~~~~Id is:" + contractordetails.getRegisId());
                regList.add(contractordetails.getRegisId());
            }
            System.out.println("Size of id in list are:" + regList.size());
            for (Integer integer : regList) {
                System.out.println("Id in list is:  " + integer);
                Contractor contractors = (Contractor) contractordao.fetchData(integer);
                contractorList.add(contractors);
            }
            System.out.println("~~~~~~ Contractor List size is:   " + contractorList.size());
            m.addAttribute("contractorList", contractorList);
            m.addAttribute("contractorDetailsList", contractorDetailsList);

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:showContractorClassDoc");
        }
        return "DepartmentAdmin/showContractorClassDocument";
    }

    /*
     *@changeStatusMsmeDoc Method used to update the status of MSME/NSIC document to enable
     *@param contractor registration id
     *return viewContractorClassDoc jsp page
     */
    @RequestMapping("/changeStatusMsmeDoc")
    public String changeStatusMsmeDoc(@RequestParam Integer id, Model m, HttpSession session) {
        System.out.println("~~~~~~~~~changeStatusMsmeDoc Method run~~~~~~~~~~~~");
        System.out.println("Contractor Registration id is:" + id);
        MsmeNsicLogs msmeNsiclogs = new MsmeNsicLogs();
        ContractorClass contractorClass = null;
        Date date = new Date();

        try {
            if (id != null) {
                ContractorDetails contractorDetails = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(id);
                contractordetailsdao.changeMsmeStatusDoc(contractorDetails.getContOtherId());//update the status to enable
                Integer deptId = (Integer) session.getAttribute("deptId");
                System.out.println("Department id is: " + deptId);
                msmeNsiclogs.setDeptId(deptId);
                msmeNsiclogs.setDscNumber("4556");
                msmeNsiclogs.setId(1);
                msmeNsiclogs.setReg_Id(id);
                msmeNsiclogs.setActivity("Status has been approved");
                msmeNsiclogs.setMsmelogsDate(date);
                msmeNsicDaoLogs.saveMsmeNsicLogs(msmeNsiclogs);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/showMsmeDoc";
    }

    @RequestMapping("/viewMsmeDetails")
    public String viewMsmeDetails(@RequestParam Integer id, Model m) {
        System.out.println("~~~~~~~~~changeStatusMsmeDoc Method run~~~~~~~~~~~~");
        System.out.println("Contractor Registration id is:" + id);
        MsmeOrg msmeOrg = null;
        ContractorClass contractorClass = null;
        try {
            if (id != null) {
                contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(id);
                msmeOrg = msmeDao.fetchData(Integer.parseInt(contractorDetailsFetch.getContCompanyType()));
                contractorClass = (ContractorClass) contractorClassDao.fetchData(Integer.parseInt(contractorDetailsFetch.getContractorClass()));
                contractorDetailsFetch.setContCompanyName(msmeOrg.getComName());
                contractorDetailsFetch.setContractorClassName(contractorClass.getContractorClass_Name());
                m.addAttribute("contractorDetails", contractorDetailsFetch);
                Contractor contractor = (Contractor) contractordao.fetchData(id);
                m.addAttribute("contractor", contractor);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "DepartmentAdmin/viewMsmeNsicDoc";
    }

    /*
     *@changeStatusContractorClassDoc Method used to update the status of Contractor Class document to enable
     *@param contractor registration id
     *return viewContractorClassDoc jsp page
     */
    @RequestMapping("/changeStatusContractorClassDoc")
    public String changeStatusContractorClassDoc(@RequestParam Integer id, Model m, HttpSession session) {
        System.out.println("~~~~~~~~~changeStatusContractorClassDoc Method run~~~~~~~~~~~~");
        System.out.println("Contractor Registration id is:" + id);
        MsmeOrg msmeOrg = null;
        ContractorClass contractorClass = null;
        Date date = new Date();
        ContractorClassLogs contractorClasslogs = new ContractorClassLogs();
        try {
            if (id != null) {
                System.out.println("updated to enable");
                contractorDetailsFetch = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(id);
                contractordetailsdao.changeContractorClassStatus(contractorDetailsFetch.getContOtherId());//update the status to enable
                Integer deptId = (Integer) session.getAttribute("deptId");
                contractorClasslogs.setContClasslogsDate(date);
                contractorClasslogs.setReg_Id(id);
                contractorClasslogs.setDeptId(deptId);
                contractorClasslogs.setClassActivity("Status has been approved");
                contractorClasslogs.setId(1);
                contractorClasslogs.setDscNumber("1234");
                contractorClassDaoLogs.saveContractorClassLogs(contractorClasslogs);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/showMsmeDoc";
    }

    @RequestMapping("/viewContractorClassDetails")
    public String viewContractorClassDetails(@RequestParam Integer id, Model m) {
        System.out.println("~~~~~~~~~viewContractorClassDetails Method run~~~~~~~~~~~~");
        System.out.println("Contractor Registration id is:" + id);
        MsmeOrg msmeOrg = null;
        ContractorClass contractorClass = null;
        try {
            if (id != null) {
                ContractorDetails contractorDetails = (ContractorDetails) contractordetailsdao.fetchDatabyRegID(id);
                msmeOrg = msmeDao.fetchData(Integer.parseInt(contractorDetails.getContCompanyType()));
                contractorClass = (ContractorClass) contractorClassDao.fetchData(Integer.parseInt(contractorDetails.getContractorClass()));
                contractorDetails.setContCompanyName(msmeOrg.getComName());
                contractorDetails.setContractorClassName(contractorClass.getContractorClass_Name());
                m.addAttribute("contractorDetails", contractorDetails);
                Contractor contractor = (Contractor) contractordao.fetchData(id);
                m.addAttribute("contractor", contractor);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "DepartmentAdmin/viewContractorClassDoc";
    }

     @RequestMapping("/forgotPasswordContractor")
     public String forgotPasswordContractor(@RequestParam Integer id, String password, String confirmPassword, Model m, RedirectAttributes ra) throws IOException {
        System.out.println("~~~~~~~~~forgotPasswordContractor Method run~~~~~~~~~~~~");
        System.out.println("Contractor Registration id is:" + id);
        System.out.println("password is:  " + password + " confirm Password is: " + confirmPassword);
        Map mapForValidation = new HashMap();
        Contractor contractor=null;
        Gson gson = new Gson();
        if (password.equals("") || password == null) {
            mapForValidation.put("newEnteredPasswordError", "Please Enter Password");
        }

        if (confirmPassword.equals("") || confirmPassword == null) {
            mapForValidation.put("confirmNewPasswordError", "Please Enter Confirm Password");
        }

        Pattern passwordpattern = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$", Pattern.CASE_INSENSITIVE);
        if (!(passwordpattern.matcher(password).matches()) && !password.equals("")) {
            mapForValidation.put("newEnteredPasswordError", "Enter valid Password");
        }

        if (!password.equalsIgnoreCase(confirmPassword) && !password.equals("") && !confirmPassword.equals("")) {
            mapForValidation.put("confirmNewPasswordError", "Please Enter the Same Password");
        }
        System.out.println(" map " + mapForValidation);
        if (mapForValidation.size() >= 1) {
            String result = gson.toJson(mapForValidation);
            System.out.println("response " + result);
            gsonUtility.writeData(result);
            return result;
        }
        try {
            if (id != null) {
                contractor = (Contractor) contractordao.fetchData(id);
                 String encreptPassword = new AesEncrDec().encrypt(password, secretKey);
                if (encreptPassword != null && secretKey != null) {
                    
                 //   String statusForUpdation = contractordao.updateContractorPassword(id, encreptPassword, secretKey);
                    String statusForUpdation = contractordao.updateContractorPassword(id, password, null);
                    System.out.println("status for updating the password is:   " + statusForUpdation);
                    if (statusForUpdation.equalsIgnoreCase("true")) {
                        SimpleMailMessage email = new SimpleMailMessage();
                        email.setFrom(emailFromRecipient);
                        email.setSubject("Password changed successfully");
                        email.setTo(contractor.getEmailid());
                        String confirmationUrl = "/contractorVerification?EmailNo=" + contractor.getId();
                        email.setText("Password has been changed successfully");
                        System.out.println("   email link " + email.getText());
                        mailSender.send(email);
                        ra.addFlashAttribute("statusOfChangePwd", "true");
                    } else {
                        ra.addFlashAttribute("statusOfChangePwd", "false");
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/";
    }

    @RequestMapping("/contractorUserDashBoard")
    public String departmentUserDashBoardPage(@ModelAttribute("contractor") Contractor contractor, Model m, HttpSession session){
        System.out.println("The Department User Dash Board");
        try{
        session.invalidate();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return "Contractor/contractorotherdetail";
    }
    
    //for contractor dashboard
    
     @RequestMapping("/contractorDashboard")
    public String contractorDashboard(@ModelAttribute("contractor") Contractor contractor, Model m, HttpSession session){
        try{
         System.out.println("towards contractor dashboard");
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return "Contractor/ContractorDashboard";
    }
    
    
    
    
    
    
    @RequestMapping("/checkRegisteredContractor")
    @ResponseBody
    public String checkRegisteredContractor(@ModelAttribute("contractor") Contractor contractor, Model m, HttpSession session,RedirectAttributes ra,@RequestParam String emailId){
        System.out.println("emailId  "+emailId);
        Contractor contractor1=null;
        try{ 
            contractor1=(Contractor) contractordao.fetchIdbyEmail(emailId);
            System.out.println("contractor1 regid is:  "+contractor1.getId());
         
             if (!contractor1.getEmailStatus().equals("verified")) {
               System.out.println("Email Status is not verified");
              }
          return "Email Status is not verified";
      }catch(Exception ex){
            ex.printStackTrace();
        }
        return "Email Status is not verified";
    }
    
    
    
    /*
     *@editContractorEmailId Method used to send the verification link to the email id for edit email
     *@param contractor registration id
     *@param contractor emailId
     */
 @RequestMapping("/editContractorEmailId")
    public String  editContractorEmailId(@RequestParam String emailId,Integer id,HttpServletRequest request,RedirectAttributes ra) {
        System.out.println("editContractorEmailId method");
        String subject = "Email Id is changed successfully";
        String result="";
        Contractor contractor=null;
      try{
        contractor=(Contractor) contractordao.fetchData(id);
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(emailId);
        email.setFrom(emailFromRecipient);
        email.setSubject(subject);
        System.out.println("contractor id is:" + id);
        String confirmationUrl = "/contractorEditEmail?EmailNo=" + id +"&emailId="+emailId;
        email.setText("To verify your Email:Please click here" + "<a href='"+ request.getContextPath() + confirmationUrl+"'>Click here</a>");
        System.out.println("   email link " + email.getText());
        mailSender.send(email);
        ra.addFlashAttribute("sendVerificationLink","Verification Link has been send");
        ra.addFlashAttribute("contVerifyRegId",id);
        ra.addFlashAttribute("contMobileNo",contractor.getMobileno());
        return "redirect:/";
        }catch(Exception ex){
            ex.printStackTrace();
            System.out.println("Class:ForgotPasswordController Method:resendEmailDone  ");
        }
        return null;
    }
    
  
    
        /**
     * @contractorEditEmail Method
     * @contractorEditEmail method used to verify the Email and update the email id and
     * the Email verify status to verified
     * @param Contractor Registration Id
     */
    @RequestMapping("/contractorEditEmail")
    public String contractorEditEmail(@RequestParam Integer EmailNo,String emailId,RedirectAttributes ra) {
        System.out.println("contractorEditEmail method");
        Contractor contractor = null;
        try {
            System.out.println("the reg id is:" + EmailNo);
            if (EmailNo != null) {
             contractor=(Contractor) contractordao.fetchData(EmailNo);
            String status = contractordao.updateContractorEmailId(EmailNo, emailId);
            if(status.equalsIgnoreCase("true")){
              contractordao.emailverified(EmailNo,"verified");
              
              }
            }
            ra.addFlashAttribute("contVerifyRegId",EmailNo);
            ra.addFlashAttribute("contMobileNo",contractor.getMobileno());  
            ra.addFlashAttribute("editContEmailVerificationMessage", "Email Id is Changed and Verified Successfully");
          
        } catch (Exception ex) {
            System.out.println("Exception in ContractorDetailsController Method:contractorEmailVerification()");
        }
        return "redirect:/";
    }

}
