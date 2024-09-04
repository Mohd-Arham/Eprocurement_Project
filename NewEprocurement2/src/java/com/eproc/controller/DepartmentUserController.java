package com.eproc.controller;

import com.eproc.dao.ContractorDao;
import com.eproc.dao.ContractorDetailsDao;
import com.eproc.daoImpl.CircleDAOImpl;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.ContractorLogsDaoImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.DepartmentSecondaryUserDaoImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.DesignationDaoImpl;
import com.eproc.daoImpl.DivisionDAOImpl;
import com.eproc.daoImpl.PrivilegeDaoImpl;
import com.eproc.daoImpl.SubDivisionDAOImpl;
import com.eproc.domain.Circle;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.ContractorLogs;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Designation;
import com.eproc.domain.Division;
import com.eproc.domain.Logs;
import com.eproc.domain.Privilege;
import com.eproc.domain.SubDivision;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.DepartmentUserModel;
import com.eproc.util.AesEncrDec;
import com.eproc.util.CommonUtil;
import com.eproc.util.EmailService;
import com.eproc.util.GsonUtility;
import com.eproc.util.SendEmail;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.regex.Pattern;
import javax.crypto.SecretKey;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;

/**
 * This Controller is Used to manage all DepartmentUser Operations at the time
 * of Registration
 *
 * @author Vaishali Gupta
 */
@Controller
public class DepartmentUserController {
    
    @Value("${secret.key}")
    private String secretKey;

    static String emailFromRecipient = "info@lotusprocure.in";

    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    DepartmentSecondaryUserDaoImpl DepartmentSecondaryUserDao;
    @Autowired
    PrivilegeDaoImpl PrivilegeDao;
    @Autowired
    DivisionDAOImpl Divisiondao;
    @Autowired
    SubDivisionDAOImpl subDivisionDao;
    @Autowired
    DesignationDaoImpl designationdao;
    @Autowired
    CircleDAOImpl circleDao;
    @Autowired
    EmailService emailService;
    @Autowired
    AesEncrDec aesEncrDec;
    @Autowired
    SendEmail sendEmail;
    @Autowired
    JavaMailSender mailSender;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    SessionFactory sessionFactory;
    @Autowired
    DepartmentUserModel departmentUserModel;
    @Autowired
    LogsAction logsAction;
    @Autowired
    LogsActionDao logsActionDao;
    @Autowired
    DepartmentAdminDAOImpl departmentAdminDAOImpl;
    @Autowired
    ContractorLogsDaoImpl contractorlogsdao;
    @Autowired
    ContractorDao contractordao;
    @Autowired
    ContractorDetailsDao contractordetailsdao;
    @Autowired
    ContractorDaoImpl contractorDaoImpl;

    Date date = new Date();
    Logs logs = new Logs();

    Map<Integer, String> administration = new LinkedHashMap<Integer, String>();
    Map<Integer, String> ETendering = new LinkedHashMap<Integer, String>();
//    Map<Integer, String> PreTendering = new LinkedHashMap<Integer, String>();
//    Map<Integer, String> PostTendering = new LinkedHashMap<Integer, String>();
    Map<Integer, String> EAuction = new LinkedHashMap<Integer, String>();
//    Map<Integer, String> RFX = new LinkedHashMap<Integer, String>();
    Map<Integer, String> Inventory = new LinkedHashMap<Integer, String>();
    Map<String, String> privilege = new LinkedHashMap<String, String>();

    public Map<String, String> getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Map<String, String> privilege) {
        this.privilege = privilege;
    }

    public Map<Integer, String> getAdministration() {
        return administration;
    }

    public void setAdministration(Map<Integer, String> administration) {
        this.administration = administration;
    }

    public PrivilegeDaoImpl getPrivilegeDao() {
        return PrivilegeDao;
    }

    public void setPrivilegeDao(PrivilegeDaoImpl PrivilegeDao) {
        this.PrivilegeDao = PrivilegeDao;
    }

    public Map<Integer, String> getETendering() {
        return ETendering;
    }

    public void setETendering(Map<Integer, String> ETendering) {
        this.ETendering = ETendering;
    }

//    public Map<Integer, String> getPreTendering() {
//        return PreTendering;
//    }
//
//    public void setPreTendering(Map<Integer, String> PreTendering) {
//        this.PreTendering = PreTendering;
//    }
//
//    public Map<Integer, String> getPostTendering() {
//        return PostTendering;
//    }
//
//    public void setPostTendering(Map<Integer, String> PostTendering) {
//        this.PostTendering = PostTendering;
//    }
    public Map<Integer, String> getEAuction() {
        return EAuction;
    }

    public void setEAuction(Map<Integer, String> EAuction) {
        this.EAuction = EAuction;
    }

//    public Map<Integer, String> getRFX() {
//        return RFX;
//    }
//
//    public void setRFX(Map<Integer, String> RFX) {
//        this.RFX = RFX;
//    }
    public Map<Integer, String> getInventory() {
        return Inventory;
    }

    public void setInventory(Map<Integer, String> Inventory) {
        this.Inventory = Inventory;
    }

//    @InitBinder
//    protected void initBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method");
//        binder.addValidators(departmentUserModel);
//    }

    /*
     * Show DepartmentUser 
     * Method used to Show DepartmentUser 
     * @param 
     * @return jsp page
     */
    @RequestMapping("/manageDepartmentUser")
    public String manageDepartmentUser(@ModelAttribute("departmentUser") DepartmentUser departmentUser, Model m, HttpServletRequest request) {
        System.out.println("Manage Department User");
        HttpSession session = request.getSession(true);

        Integer deptId = (Integer) session.getAttribute("deptId");
        List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptId);
        List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID(deptId);
        List<Division> divisionList = Divisiondao.fetchAllbyDept_ID(deptId);
        List<SubDivision> subDivisionList = subDivisionDao.fetchAllbyDept_ID(deptId);
        System.out.println("circleList " + circleList.size() + " divisionList " + divisionList.size()
                + " subDivisionList " + subDivisionList.size() + " designationList " + designationList.size());

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

        List<Privilege> PrivilegeList = PrivilegeDao.fetchAll();
        m.addAttribute("PrivilegeList", PrivilegeList);
        session.getAttribute("deptId");

        return "DepartmentAdmin/ManageDepartmentUsers";
    }

    /*
     * fetch DepartmentUser Details  
     * Method used to fetch DepartmentUser Details 
     * @param 
     * @return null
     */
    @RequestMapping("/departmentDetails")
    @ResponseBody
    public String fetchDepartmentUserDetails(@RequestHeader(value = "User-Agent") String userAgent, HttpServletRequest request) {
        System.out.println("Fetching the details of Department User");
        HttpSession session = request.getSession(true);
        List departmentUsersbydept = new ArrayList<>();//This list contains all the DepartmentUser According to deptId
        String response = null;
        Integer deptId = (Integer) session.getAttribute("deptId");
        try {
            List<DepartmentUser> departmentUsers = departmentUserDaoImpl.fetchAllByDept_Id(deptId);
            List<DepartmentSecondaryUser> departmentSecondaryUser = DepartmentSecondaryUserDao.fetchAllByDept_Id(deptId);

            System.out.println("itrator start" + departmentUsers.size() + "  deptid " + session.getAttribute("deptId"));
            System.out.println("itrator start 2" + departmentSecondaryUser.size() + "  deptid " + session.getAttribute("deptId"));

            for (DepartmentUser departmentUser : departmentUsers) {
                Circle circle = circleDao.fetchData(departmentUser.getDeptcircle());
                departmentUser.setCircle(circle.getCircle());

                Division division = Divisiondao.fetchData(departmentUser.getDeptDivision());
                departmentUser.setDivision(division.getDivision());

                SubDivision subdivision = subDivisionDao.fetchData(departmentUser.getDeptSubDivision());
                departmentUser.setSubDivision(subdivision.getSubdivision());

                Designation designation = designationdao.fetchData(departmentUser.getDesignationName());
                departmentUser.setDesignations(designation.getDesignation());

                departmentUser.setFirstName(departmentUser.getFirstName() + " " + departmentUser.getLastName());
                departmentUsersbydept.add(departmentUser);
            }

            for (DepartmentSecondaryUser departmentSecondaryUsers : departmentSecondaryUser) {
                Circle circle = circleDao.fetchData(departmentSecondaryUsers.getDeptcircle());
                departmentSecondaryUsers.setCircle(circle.getCircle());

                Division division = (Division) Divisiondao.fetchData(departmentSecondaryUsers.getDeptDivision());
                departmentSecondaryUsers.setDivision(division.getDivision());

                SubDivision subdivision = subDivisionDao.fetchData(departmentSecondaryUsers.getDeptSubDivision());
                departmentSecondaryUsers.setSubDivision(subdivision.getSubdivision());

                Designation designation = designationdao.fetchData(departmentSecondaryUsers.getDesignationName());
                departmentSecondaryUsers.setDesignations(designation.getDesignation());

                departmentSecondaryUsers.setFirstName(departmentSecondaryUsers.getFirstName() + " " + departmentSecondaryUsers.getLastName());
                departmentSecondaryUsers.setReg_Id(departmentSecondaryUsers.getSecondory_reg_Id());
                departmentUsersbydept.add(departmentSecondaryUsers);
            }

            Gson gson = new Gson();
            response = gson.toJson(departmentUsersbydept);

//             gsonUtility.writeData(response);
            gsonUtility.responseData(response);

        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:fetchDepartmentUserDetails");
            ex.printStackTrace();
        }
        return response;
    }

    /*
     * add DepartmentUser 
     * Method used to add DepartmentUser 
     * @param modelAtribute DepartmentUser,String registerId
     * @return String message
     */
    @RequestMapping("/saveDepartmentUser")
    @ResponseBody
    public String saveDepartmentUser(@ModelAttribute("departmentUser") DepartmentUser departmentUser,
            @RequestParam String registerId, Model m, HttpServletRequest request) throws IOException {
        System.out.println("Save The Department User");
        String encreptPassword = "";

        HttpSession session = request.getSession(true);
        String message = "";
        String message1 = "";
        String status = "";
        String validate = "";

        try {

            // This Condition is Used to Register New Department User. 
            message = checkEmail(departmentUser.getEmailAdd(), session);
            message1 = checkContact(departmentUser.getMobNo(), session);

            if (registerId != null && !"".equals(registerId.trim())) {

                validate = departmentUserModel.validateOnUpdate(departmentUser);
                System.out.println("validateOnUpdate " + validate);
            }
            if (!message.equalsIgnoreCase("Duplicate Email") && !message1.equalsIgnoreCase("Duplicate mobile_no")) {

                validate = departmentUserModel.validate(departmentUser);
                System.out.println("validate " + validate);
            }

            String subject = "Registration Confirmation";

            // creates a simple e-mail object
            SimpleMailMessage email = new SimpleMailMessage();
            email.setTo(departmentUser.getEmailAdd());
            email.setFrom(emailFromRecipient);

            email.setSubject(subject);

            System.out.println("id :" + registerId + "   The Department User is:" + departmentUser.getFirstName() + "Last Name: " + departmentUser.getLastName()
                    + "Mobile Number: " + departmentUser.getMobNo() + "Email Id: " + departmentUser.getEmailAdd() + "Address: " + departmentUser.getAddress() + " Password: " + departmentUser.getPassword()
                    + " Pincode: " + departmentUser.getPincode() + "user privileges " + departmentUser.getUserPrivileges());

            departmentUser.setDeptId((int) session.getAttribute("deptId"));
            departmentUser.setDeptName((String) session.getAttribute("deptName"));
            departmentUser.setFirstName(departmentUser.getFirstName().toUpperCase());
            departmentUser.setLastName(departmentUser.getLastName().toUpperCase());

            if (registerId != null && !"".equals(registerId.trim())) {
                departmentUser.setReg_Id(Integer.parseInt(registerId));

            }

            System.out.println("----------------------real pass " + departmentUser.getPassword() + " encrypted pass "
                    + encreptPassword + "key  " + secretKey);

            boolean result = false;

            Date date = new Date();

            departmentUser.setDeptUserRegistrationDate(date);
            departmentUser.setStatus("Enable");
            //This Conditin is Used to Update, Only Department User Whose Email and Mobile No. is Alredy exists  
            if (registerId != null && !"".equals(registerId.trim()) && validate.equals("Noerror")) {
                DepartmentUser departmentUserData = departmentUserDaoImpl.fetchData(Integer.parseInt(registerId));

                
                
                 boolean sameEmail=departmentUserData.getEmailAdd().equals(departmentUser.getEmailAdd());
                 boolean sameContect=departmentUserData.getMobNo().equals(departmentUser.getMobNo());
                 
                 
                   String oldEmail=departmentUserData.getEmailAdd();
                   String newEmail=departmentUser.getEmailAdd();
                   String oldContect=departmentUserData.getMobNo();
                   String newContect=departmentUser.getMobNo();
                     System.out.println("sameEmail "+sameEmail);
                     System.out.println("sameContect "+sameContect);
                
                  System.out.println("departmentUserData email "+departmentUserData.getEmailAdd());
                    System.out.println("departmentUser email "+departmentUser.getEmailAdd());
                   
//                if (departmentUserData.getEmailAdd().equals(departmentUser.getEmailAdd())
//                        || departmentUserData.getMobNo().equals(departmentUser.getMobNo())) {

                    departmentUser.setPassword(departmentUserData.getPassword());
                    departmentUser.setUserType(departmentUserData.getUserType());
               //     departmentUser.setSecretKey(departmentUserData.getSecretKey());
                    departmentUser.setOtp_alertStatus(departmentUserData.getOtp_alertStatus());
                    departmentUser.setMobile_verified(departmentUserData.getMobile_verified());
                    departmentUser.setEmail_verified(departmentUserData.getEmail_verified());

                    result = departmentUserDaoImpl.insertData(departmentUser);
                     if(!sameEmail){
                    
                       int state=departmentUserDaoImpl.changeEmail(newEmail,oldEmail);
                    
                        System.out.println("state "+state);
                    
                        
                        
                    } 
                    if(!sameContect){
                    
                       int state=departmentUserDaoImpl.changeContect(newContect,oldContect);
                    
                        System.out.println("state "+state);
                    
                        
                        
                    } 

                    logs.setActivity("Update DepartmentUser");
                    logs.setLogMessage("Department User details Updated successfully");
//                    logs.setIpAddress(logsAction.fetchIpAddress());
                    logs.setOsName(logsAction.FetchOSName());
                    logs.setDeptId(departmentUser.getDeptId());
                    logs.setMacAddress(logsAction.fetchMacAddress());
                    logs.setBrowserName(logsAction.getClientBrowser(request));
                    logsActionDao.save(logs);

                    if (result == true) {
                        System.out.println("The DepartmentUser Details Updated Successfully");
                        status = "The DepartmentUser Details Updated Successfully";
//                        mailSender.send(email);
                        gsonUtility.writeData(status);
                        return status;
                    }
//                }
            }

            if (!message.equalsIgnoreCase("Duplicate Email") && !message1.equalsIgnoreCase("Duplicate mobile_no") && (validate.equals("Noerror"))) {
                departmentUser.setPassword(encreptPassword);
                //departmentUser.setSecretKey(secretKey);
                departmentUser.setUserType("primary");
                departmentUser.setOtp_alertStatus("Enable");

                result = departmentUserDaoImpl.insertData(departmentUser);

                Integer resigteredId = departmentUser.getReg_Id();
                System.out.println("result " + result);
                logs.setActivity("Save DepartmentUser");
                logs.setLogMessage("Department User details inserted successfully");
//                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logsActionDao.save(logs);
                if (result == true) {
                    System.out.println("The DepartmentUser Registration Done Successfully");
                    status = "The DepartmentUser Registration Done Successfully";
                    String confirmationUrl = "/regitrationConfirm?EmailNo=" + resigteredId;
                    email.setText(message + " " + request.getContextPath() + confirmationUrl);
                    System.out.println("Email is:-" + email.getText());
                    mailSender.send(email);

                    gsonUtility.writeData(status);
                    return status;
                }
            }
        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:saveDepartmentUser");
            ex.printStackTrace();
        }
        message = "The DepartmentUser Registration is Successfully Done";
        gsonUtility.writeData(message);
        return message;
    }

    /*
     *Method is used to check Duplicate Email
     *@param String email,DepartmentUser departmentUser
     *@return  String msg
     */
    @RequestMapping("/checkUserEmail")
    @ResponseBody
    public String checkEmail(@RequestParam String email, HttpSession session) {
        String msg = "valid Email";
        boolean flag = false;
        Integer deptId = (Integer) session.getAttribute("deptId");

        flag = departmentUserDaoImpl.checkDuplicateEmail(email, deptId);

        System.out.println("flag " + flag);

        if (flag == true) {

            msg = "Duplicate Email";
            System.out.println("duplicate useremail..........");
            return msg;
        }

        return msg;
    }

    /*
     *Method is used to check Duplicate Contect No
     *@param String mobile_no,DepartmentUser departmentUser
     *@return  String msg
     */
    @RequestMapping("/checkUserContacts")
    @ResponseBody
    public String checkContact(@RequestParam String mobile_no, HttpSession session) {
        String msg = "valid mobile_no";
        boolean flag = false;
        Integer deptId = (Integer) session.getAttribute("deptId");

        flag = departmentUserDaoImpl.checkDuplicateContect(mobile_no, deptId);

        if (flag == true) {
            msg = "Duplicate mobile_no";
            System.out.println("duplicate mobile_no..");
            return msg;
        }

        return msg;
    }

    /*
     *Method is used to show RegisterationForm
     *@param Model m, DepartmentUser departmentUser, HttpSession session
     *@return DepartmentAdmin/Tiles/DepartmentUserRegistrationForm jsp page
     */
    @RequestMapping("/register")
    public String register(Model m, DepartmentUser departmentUser, HttpSession session) {
        System.out.println("Manage Department User");

        try {
            List<Privilege> PrivilegeList = PrivilegeDao.fetchAll();
            Iterator<Privilege> iterator = PrivilegeList.listIterator();

            while (iterator.hasNext()) {
                Privilege privilege = iterator.next();
                if (privilege.getPrivilegeArea().equalsIgnoreCase("Administration")) {
                    administration.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                } else if (privilege.getPrivilegeArea().equalsIgnoreCase("E-Tendering")) {
                    ETendering.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                } //                else if (privilege.getPrivilegeArea().equalsIgnoreCase("Pre-Tendering")) {
                //                    PreTendering.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                //                } 
                //                else if (privilege.getPrivilegeArea().equalsIgnoreCase("Post-Tendering")) {
                //                    PostTendering.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                //                } 
                else if (privilege.getPrivilegeArea().equalsIgnoreCase("E-Auction")) {
                    EAuction.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                } //                else if (privilege.getPrivilegeArea().equalsIgnoreCase("RFX")) {
                //                    RFX.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                //                } 
                else if (privilege.getPrivilegeArea().equalsIgnoreCase("Inventory")) {
                    Inventory.put(privilege.getPrivilegeid(), privilege.getPrivilegeName());
                }
            }

            m.addAttribute("administration", administration);
            m.addAttribute("ETendering", ETendering);
//            m.addAttribute("PreTendering", PreTendering);
//            m.addAttribute("PostTendering", PostTendering);
            m.addAttribute("EAuction", EAuction);
//            m.addAttribute("RFX", RFX);
            m.addAttribute("Inventory", Inventory);

            Integer deptId = (Integer) session.getAttribute("deptId");
            System.out.println("session deptid is " + deptId);

            List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptId);
            List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID(deptId);

            System.out.println("deptWiseDesignation size: " + designationList.size() + " deptWiseCircle size: " + circleList.size());
            m.addAttribute("designationList", designationList);
            m.addAttribute("circleList", circleList);

            m.addAttribute("departmentUser", departmentUser);
        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:manageDepartmentUser");
            ex.printStackTrace();
        }
        return "DepartmentAdmin/Tiles/DepartmentUserRegistrationForm";
    }

    /*
     *Method is Used to Change DepartmentUser Status
     *@param String reg_Id, String status
     *@return String status
     */
    @RequestMapping("/statusValue")
    @ResponseBody
    public String statusValue(@RequestParam String reg_Id, String status, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        String[] regId = reg_Id.split(",");
        Integer reg_id = Integer.parseInt(regId[0]);
        Integer deptId = (Integer) session.getAttribute("deptId");
        if (reg_Id.contains("true")) {
            List<DepartmentSecondaryUser> departmentSecondaryUser = DepartmentSecondaryUserDao.fetchAllByDept_Id(deptId);
            for (DepartmentSecondaryUser departmentSecondaryUsers : departmentSecondaryUser) {
                if (departmentSecondaryUsers.getSecondory_reg_Id() == reg_id) {
                    status = DepartmentSecondaryUserDao.statusValue(reg_id, status);
                    return status;
                }
            }
        }
        if (reg_Id.contains("primary") || reg_Id.contains("secondary")) {
            List<DepartmentUser> departmentUsers = departmentUserDaoImpl.fetchAllByDept_Id(deptId);
            for (DepartmentUser departmentUser : departmentUsers) {
                if (departmentUser.getReg_Id() == reg_id) {
                    status = departmentUserDaoImpl.statusValue(reg_id, status);
                    return status;
                }
            }
        }

        return null;
    }

    /*
     * Update DepartmentUser 
     * Method used to Update DepartmentUser
     * @param int id
     * @return jsp page
     */
    @RequestMapping("/updateDepartmentUserEditForm")
    public String updateDepartmentUserEditForm(@RequestParam int id, String action, String userType, Model m, HttpSession session) {
        DepartmentUser departmentUser = null;
        DepartmentSecondaryUser departmentSecondaryUser = null;
        Map<String, String> privilege = new LinkedHashMap<String, String>();

        try {
            Integer deptId = (Integer) session.getAttribute("deptId");
            List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptId);
            List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID(deptId);
            List<Division> divisionList = Divisiondao.fetchAllbyDept_ID(deptId);
            List<SubDivision> subDivisionList = subDivisionDao.fetchAllbyDept_ID(deptId);

            //This Condition is Used To Fetch DepartmentUser By Id from Primary Table
            if (userType.equals("primary") || userType.equals("secondary")) {

                departmentUser = departmentUserDaoImpl.fetchData(id);
                Circle circle = circleDao.fetchData(departmentUser.getDeptcircle());
                departmentUser.setCircle(circle.getCircle());

                Division division = (Division) Divisiondao.fetchData(departmentUser.getDeptDivision());
                departmentUser.setDivision(division.getDivision());

                SubDivision subdivision = subDivisionDao.fetchData(departmentUser.getDeptSubDivision());
                departmentUser.setSubDivision(subdivision.getSubdivision());

                Designation designation = designationdao.fetchData(departmentUser.getDesignationName());
                departmentUser.setDesignations(designation.getDesignation());

                String[] privlg = departmentUser.getUserPrivileges().split(",");
                for (String s : privlg) {
                    int privilegeid = Integer.parseInt(s);

                    Privilege privileges = PrivilegeDao.fetchData(privilegeid);
                    if (privileges != null) {
                        if (privilege.containsKey(privileges.getPrivilegeArea())) {
                            System.out.println("The Privileges are: " + privileges.getPrivilegeName());
                            privilege.put(privileges.getPrivilegeArea(), privilege.get(privileges.getPrivilegeArea()) + "," + privileges.getPrivilegeName());
                        } else {

                            privilege.put(privileges.getPrivilegeArea(), privileges.getPrivilegeName());
                        }

                    }
                }
                userType = "primary";
                m.addAttribute("userType", userType);
                System.out.println("userType user " + userType);
            }
            //This Condition is Used To Fetch DepartmentUser By Id from Secondary Table
            if (userType.equals("true")) {

                departmentSecondaryUser = DepartmentSecondaryUserDao.fetchData(id);
                departmentSecondaryUser.getDeptcircle();
                Circle circle = circleDao.fetchData(departmentSecondaryUser.getDeptcircle());
                departmentSecondaryUser.setCircle(circle.getCircle());

                Division division = (Division) Divisiondao.fetchData(departmentSecondaryUser.getDeptDivision());
                departmentSecondaryUser.setDivision(division.getDivision());

                SubDivision subdivision = subDivisionDao.fetchData(departmentSecondaryUser.getDeptSubDivision());
                departmentSecondaryUser.setSubDivision(subdivision.getSubdivision());

                Designation designation = designationdao.fetchData(departmentSecondaryUser.getDesignationName());
                departmentSecondaryUser.setDesignations(designation.getDesignation());

                String[] privlg = departmentSecondaryUser.getUserPrivileges().split(",");
                for (String s : privlg) {
                    int privilegeid = Integer.parseInt(s);

                    Privilege privileges = PrivilegeDao.fetchData(privilegeid);
                    if (privileges != null) {
                        if (privilege.containsKey(privileges.getPrivilegeArea())) {
                            privilege.put(privileges.getPrivilegeArea(), privilege.get(privileges.getPrivilegeArea()) + "," + privileges.getPrivilegeName());
                        } else {
                            privilege.put(privileges.getPrivilegeArea(), privileges.getPrivilegeName());
                        }

                    }
                }
                departmentUser = new DepartmentUser();
                m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());
                BeanUtils.copyProperties(departmentUser, departmentSecondaryUser);
                System.out.println("/Department User: " + departmentUser.getUserPrivileges() + "/");
                userType = "true";
                m.addAttribute("userType", userType);
                System.out.println("userType user " + userType);
            }

            if (action.equalsIgnoreCase("readonly")) {

                m.addAttribute("privilege", privilege);
                m.addAttribute("departmentUser", departmentUser);
                m.addAttribute("userType", userType);
                m.addAttribute("action", action);
//                 m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());
                return "DepartmentAdmin/Tiles/DepartmentUserRegistrationEditForm";
            }

            if (action.equalsIgnoreCase("editbasic")) {

                m.addAttribute("designationList", designationList);
                m.addAttribute("circleList", circleList);
                m.addAttribute("divisionList", divisionList);
                m.addAttribute("subDivisionList", subDivisionList);
                m.addAttribute("privilege", privilege);
                m.addAttribute("departmentUser", departmentUser);
                m.addAttribute("action", action);
                m.addAttribute("userType", userType);
//                  m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());
                return "DepartmentAdmin/Tiles/DepartmentUserRegistrationEditForm";
            }

            if (action.equalsIgnoreCase("editprivilege")) {

                List<Privilege> PrivilegeList = PrivilegeDao.fetchAll();

                Iterator<Privilege> iterator = PrivilegeList.listIterator();
                System.out.println("itrator start " + PrivilegeList.size());
                while (iterator.hasNext()) {
                    Privilege privileges = iterator.next();
                    if (privileges.getPrivilegeArea().equalsIgnoreCase("Administration")) {
                        administration.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    } else if (privileges.getPrivilegeArea().equalsIgnoreCase("E-Tendering")) {
                        ETendering.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    } //                    else if (privileges.getPrivilegeArea().equalsIgnoreCase("Pre-Tendering")) {
                    //                        PreTendering.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    //                    }
                    //                    else if (privileges.getPrivilegeArea().equalsIgnoreCase("Post-Tendering")) {
                    //                        PostTendering.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    //                    }
                    else if (privileges.getPrivilegeArea().equalsIgnoreCase("E-Auction")) {
                        EAuction.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    } //                    else if (privileges.getPrivilegeArea().equalsIgnoreCase("RFX")) {
                    //                        RFX.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    //                    }
                    else if (privileges.getPrivilegeArea().equalsIgnoreCase("Inventory")) {
                        Inventory.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
                    }
                }

                m.addAttribute("departmentUser", departmentUser);

                m.addAttribute("administration", administration);
                m.addAttribute("ETendering", ETendering);
//                m.addAttribute("PreTendering", PreTendering);
//                m.addAttribute("PostTendering", PostTendering);
                m.addAttribute("EAuction", EAuction);
//                m.addAttribute("RFX", RFX);
                m.addAttribute("Inventory", Inventory);
                m.addAttribute("action", action);
                m.addAttribute("userType", userType);
//                  m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());

                return "DepartmentAdmin/Tiles/DepartmentUserRegistrationEditForm";

            }

        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:updateDepartmentUserEditForm");
            ex.printStackTrace();
        }

        return "DepartmentAdmin/Tiles/DepartmentUserRegistrationEditForm";
    }

    /*
     *Method is Used to check Secondary DepartmentUser 
     *@param DepartmentUser departmentUser,Model m,HttpSession session
     *@return String message
     */
    @RequestMapping("/checkdepartment")
    @ResponseBody
    public String checkdepartment(@ModelAttribute DepartmentUser departmentUser, BindingResult result, Model m, HttpSession session) {
        System.out.println(" " + departmentUser.getEmailAdd() + " " + departmentUser.getMobNo());
        DepartmentSecondaryUser departmentSecondaryUser = new DepartmentSecondaryUser();
        String message = "valid Email";
        try {
            List<DepartmentUser> departmentUsers = departmentUserDaoImpl.fetchAll();

            Iterator<DepartmentUser> iterator = departmentUsers.listIterator();
            while (iterator.hasNext()) {
                DepartmentUser dept = iterator.next();

                if (dept.getEmailAdd().equalsIgnoreCase(departmentUser.getEmailAdd()) && dept.getMobNo().equalsIgnoreCase(departmentUser.getMobNo())) {

                    departmentUser = departmentUserDaoImpl.fetchData(dept.getReg_Id());

                    departmentSecondaryUser = DepartmentSecondaryUserDao.fetchDataByReg_Id(dept.getReg_Id());
                    if (null == departmentSecondaryUser) {
                        System.out.println("departmentUser " + departmentUser.getFirstName());
                        message = "alredy exist information " + departmentUser;
                        Gson gson = new Gson();
                        List list = new ArrayList();

                        list.add(departmentUser);
                        m.addAttribute("list", list);
                        return gson.toJson(list);

                    } else {
                        System.out.println("  " + departmentSecondaryUser.getFirstName());
                        if (departmentSecondaryUser.getDeptName().equals(session.getAttribute("deptName"))) {
                            return "exists as secondary";
                        }
                    }
                    System.out.println("departmentUser " + departmentUser.getFirstName());
                    message = "alredy exist information " + departmentUser;
                    Gson gson = new Gson();
                    List list = new ArrayList();

                    list.add(departmentUser);
                    m.addAttribute("list", list);
                    return gson.toJson(list);
                }
            }
            session.setAttribute("departmentUserEmail", departmentUser.getEmailAdd());
            session.setAttribute("departmentUserMobNo", departmentUser.getMobNo());

        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:checkdepartment");
            ex.printStackTrace();
        }

        return message;
    }

    /*
     *Method is Used to Filter DepartmentUser By Privileges
     *@param String privilegeid
     *@return List in Json response 
     */
    @RequestMapping("/privilegeshort")
    @ResponseBody
    public String privilegeshort(@RequestParam String privilegeid, HttpSession session) {
        System.out.println("Fetching the details of Department User");
        System.out.println("privilegeid " + privilegeid);

        List departmentUsershort = new ArrayList<>();
        String response = null;
        try {
            List<DepartmentUser> departmentUsers = departmentUserDaoImpl.fetchAll();
            Iterator<DepartmentUser> iterator = departmentUsers.listIterator();
            System.out.println("itrator start" + departmentUsers.size());
            while (iterator.hasNext()) {
                DepartmentUser departmentUser = iterator.next();

                if (departmentUser.getUserPrivileges().contains(privilegeid) && departmentUser.getDeptId() == (int) session.getAttribute("deptId")) {
                    String[] privlg = departmentUser.getUserPrivileges().split(",");
                    for (String s : privlg) {
                        String privilegei = (s);

                        if (privilegei.equals(privilegeid)) {
                            departmentUsershort.add(departmentUser);

                            Circle circle = circleDao.fetchData(departmentUser.getDeptcircle());
                            departmentUser.setCircle(circle.getCircle());

                            Division division = (Division) Divisiondao.fetchData(departmentUser.getDeptDivision());
                            departmentUser.setDivision(division.getDivision());

                            SubDivision subdivision = subDivisionDao.fetchData(departmentUser.getDeptSubDivision());
                            departmentUser.setSubDivision(subdivision.getSubdivision());

                            Designation designation = designationdao.fetchData(departmentUser.getDesignationName());
                            departmentUser.setDesignations(designation.getDesignation());

                            departmentUser.setFirstName(departmentUser.getFirstName() + " " + departmentUser.getLastName());
                        }
                    }
                }
            }
            List<DepartmentSecondaryUser> departmentSecondaryUsers = DepartmentSecondaryUserDao.fetchAll();
            Iterator<DepartmentSecondaryUser> iteratorr = departmentSecondaryUsers.listIterator();
            while (iteratorr.hasNext()) {
                DepartmentSecondaryUser departmentSecondaryUser = iteratorr.next();

                if (departmentSecondaryUser.getUserPrivileges().contains(privilegeid) && departmentSecondaryUser.getDeptId() == (int) session.getAttribute("deptId")) {
                    String[] privlg = departmentSecondaryUser.getUserPrivileges().split(",");
                    for (String s : privlg) {
                        String privilegei = (s);

                        if (privilegei.equals(privilegeid)) {
                            departmentUsershort.add(departmentSecondaryUser);

                            Circle circle = circleDao.fetchData(departmentSecondaryUser.getDeptcircle());
                            departmentSecondaryUser.setCircle(circle.getCircle());

                            Division division = (Division) Divisiondao.fetchData(departmentSecondaryUser.getDeptDivision());
                            departmentSecondaryUser.setDivision(division.getDivision());

                            SubDivision subdivision = subDivisionDao.fetchData(departmentSecondaryUser.getDeptSubDivision());
                            departmentSecondaryUser.setSubDivision(subdivision.getSubdivision());

                            Designation designation = designationdao.fetchData(departmentSecondaryUser.getDesignationName());
                            departmentSecondaryUser.setDesignations(designation.getDesignation());

                            departmentSecondaryUser.setFirstName(departmentSecondaryUser.getFirstName() + " " + departmentSecondaryUser.getLastName());
                        }
                    }
                }
            }
            Gson gson = new Gson();
            response = gson.toJson(departmentUsershort);
            System.out.println("The Department User list size: " + departmentUsershort.size());

            gsonUtility.writeData(response);

        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:privilegeshort");
            ex.printStackTrace();
        }
        return response;
    }

    /*
     *Method is Used to Create JSON response for Reporting of EA,EB,EC Users
     */
    @RequestMapping("/reportEA,EB,EC")
    @ResponseBody
    public Map smarttable() throws IOException {
        List departments = new ArrayList<>();
        List total_departmentUser = new ArrayList<>();
        List total_Enable = new ArrayList<>();
        Map departmentUsershorts = new LinkedHashMap();

        try {
            List<DepartmentSecondaryUser> departmentSecondaryUsertotal = DepartmentSecondaryUserDao.fetchAll();
            List<DepartmentUser> departmentUsertotal = departmentUserDaoImpl.fetchAll();

            departments.addAll(departmentUsertotal);
            departments.addAll(departmentSecondaryUsertotal);
            departmentUsershorts.put("total_User", departments.size());

            List<DepartmentUser> departmentUser_EA = departmentUserDaoImpl.getEA_UERS();
            List<DepartmentSecondaryUser> departmentSecondaryUser_EA = DepartmentSecondaryUserDao.getEA_UERS();
            total_departmentUser = new ArrayList<>();
            total_departmentUser.addAll(departmentUser_EA);
            total_departmentUser.addAll(departmentSecondaryUser_EA);
            departmentUsershorts.put("total_EAUser", total_departmentUser.size());

            total_Enable = new ArrayList<>();
            for (DepartmentUser deptUser : departmentUser_EA) {
                departments = new ArrayList<>();
                if (deptUser.getStatus().equals("Enable")) {
                    departments.add(deptUser);
                }
                total_Enable.addAll(departments);
            }
            for (DepartmentSecondaryUser deptSecondaryUser : departmentSecondaryUser_EA) {
                departments = new ArrayList<>();
                if (deptSecondaryUser.getStatus().equals("Enable")) {
                    departments.add(deptSecondaryUser);
                }
                total_Enable.addAll(departments);
            }
            departmentUsershorts.put("total_EAUser_enable", total_Enable.size());
            departmentUsershorts.put("total_EAUser_disable", total_departmentUser.size() - total_Enable.size());

            List<DepartmentUser> departmentUser_EB = departmentUserDaoImpl.getEB_UERS();
            List<DepartmentSecondaryUser> departmentSecondaryUser_EB = DepartmentSecondaryUserDao.getEB_UERS();
            total_departmentUser = new ArrayList<>();
            total_departmentUser.addAll(departmentUser_EB);
            total_departmentUser.addAll(departmentSecondaryUser_EB);
            departmentUsershorts.put("total_EBUser", total_departmentUser.size());

            total_Enable = new ArrayList<>();
            for (DepartmentUser deptUser : departmentUser_EB) {
                departments = new ArrayList<>();
                if (deptUser.getStatus().equals("Enable")) {
                    departments.add(deptUser);
                }
                total_Enable.addAll(departments);
            }
            for (DepartmentSecondaryUser deptSecondaryUser : departmentSecondaryUser_EB) {
                departments = new ArrayList<>();
                if (deptSecondaryUser.getStatus().equals("Enable")) {
                    departments.add(deptSecondaryUser);
                }
                total_Enable.addAll(departments);
            }
            departmentUsershorts.put("total_EBUser_enable", total_Enable.size());
            departmentUsershorts.put("total_EBUser_disable", total_departmentUser.size() - total_Enable.size());

            List<DepartmentUser> departmentUser_EC = departmentUserDaoImpl.getEC_UERS();
            List<DepartmentSecondaryUser> departmentSecondaryUser_EC = DepartmentSecondaryUserDao.getEC_UERS();
            total_departmentUser = new ArrayList<>();
            total_departmentUser.addAll(departmentUser_EC);
            total_departmentUser.addAll(departmentSecondaryUser_EC);
            departmentUsershorts.put("total_ECUser", total_departmentUser.size());

            total_Enable = new ArrayList<>();
            for (DepartmentUser deptUser : departmentUser_EC) {
                departments = new ArrayList<>();
                if (deptUser.getStatus().equals("Enable")) {
                    departments.add(deptUser);
                }
                total_Enable.addAll(departments);
            }
            for (DepartmentSecondaryUser deptSecondaryUser : departmentSecondaryUser_EC) {
                departments = new ArrayList<>();
                if (deptSecondaryUser.getStatus().equals("Enable")) {
                    departments.add(deptSecondaryUser);
                }
                total_Enable.addAll(departments);
            }
            departmentUsershorts.put("total_ECUser_enable", total_Enable.size());
            departmentUsershorts.put("total_ECUser_disable", total_departmentUser.size() - total_Enable.size());

//            Gson gson = new Gson();
//            response = gson.toJson(departmentUsershorts);
//            gsonUtility.writeData(response);
//            gsonUtility.responseData(response);
        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:fetchDepartmentUserDetails");
            ex.printStackTrace();
        }
        return departmentUsershorts;
    }

    /*
     *Method is used to show registration Form to Secondary User
     *@param DepartmentUser departmentUser,Integer red_id, Model m,HttpSession session
     *@return DepartmentAdmin/Tiles/DepartmentUserRegistrationForm jsp page
     */
    @RequestMapping("/addnewdepartment")
    public String addnewdepartment(@ModelAttribute DepartmentUser departmentUser, @RequestParam Integer red_id, Model m, RedirectAttributes ra, HttpSession session) {

        departmentUser = departmentUserDaoImpl.fetchData(red_id);
        List<Privilege> PrivilegeList = PrivilegeDao.fetchAll();

        Iterator<Privilege> iterator = PrivilegeList.listIterator();
        System.out.println("itrator start " + PrivilegeList.size());
        while (iterator.hasNext()) {
            Privilege privileges = iterator.next();
            if (privileges.getPrivilegeArea().equalsIgnoreCase("Administration")) {
                administration.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            } else if (privileges.getPrivilegeArea().equalsIgnoreCase("E-Tendering")) {
                ETendering.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            } //            else if (privileges.getPrivilegeArea().equalsIgnoreCase("Pre-Tendering")) {
            //                PreTendering.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            //            }
            //            else if (privileges.getPrivilegeArea().equalsIgnoreCase("Post-Tendering")) {
            //                PostTendering.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            //            }
            else if (privileges.getPrivilegeArea().equalsIgnoreCase("E-Auction")) {
                EAuction.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            } //            else if (privileges.getPrivilegeArea().equalsIgnoreCase("RFX")) {
            //                RFX.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            //            }
            else if (privileges.getPrivilegeArea().equalsIgnoreCase("Inventory")) {
                Inventory.put(privileges.getPrivilegeid(), privileges.getPrivilegeName());
            }
        }
        Integer dept_Id = (Integer) session.getAttribute("deptId");
        List<Designation> designationList = designationdao.fetchAllbyDept_ID(dept_Id);
        m.addAttribute("designationList", designationList);

        List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID(dept_Id);
        m.addAttribute("circleList", circleList);
        m.addAttribute("administration", administration);
        m.addAttribute("ETendering", ETendering);
//        m.addAttribute("PreTendering", PreTendering);
//        m.addAttribute("PostTendering", PostTendering);
        m.addAttribute("EAuction", EAuction);
//        m.addAttribute("RFX", RFX);
        m.addAttribute("Inventory", Inventory);
        departmentUser.setDeptcircle(null);
        departmentUser.setDesignationName(null);

        departmentUser.setAddress("");
        departmentUser.setPincode("");
        departmentUser.setUserPrivileges("");
       // departmentUser.setSecretKey(departmentUser.getSecretKey());
        //session.setAttribute("secretkey", departmentUser.getSecretKey());
        m.addAttribute("departmentUser", departmentUser);

        return "DepartmentAdmin/Tiles/DepartmentUserRegistrationForm";
    }

    /*
     * add Secondary DepartmentUser 
     * Method used to add Secondary DepartmentUser 
     * @param modelAtribute DepartmentUser,String registerId
     * @return jsp page
     */
    @RequestMapping("/saveDepartmentSecondaryUser")
    @ResponseBody
    public String saveDepartmentSecondaryUser(@ModelAttribute DepartmentUser departmentUser,
            Model m, HttpServletRequest request, @RequestParam String registerId) throws IOException {
        DepartmentSecondaryUser departmentSecondaryUser = new DepartmentSecondaryUser();
        String validate = "";
        String validate1 = "";
    //    System.out.println("Save The Department Secondary User " + departmentUser.getSecretKey() + " password " + departmentUser.getPassword());
        HttpSession session = request.getSession(true);
        String message = "";
//        String message1 = "";
        String status = "";

        validate1 = departmentUserModel.validateOnSecondaryUserReg(departmentUser);

        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(departmentUser.getEmailAdd());
        email.setFrom(emailFromRecipient);
        email.setText("Thank you");
        email.setSubject("Registarion Information");
        try {
            System.out.println("id :" + registerId + " " + departmentUser.getReg_Id() + "   The Department User is: " + departmentUser.getFirstName() + "Last Name: " + departmentUser.getLastName()
                    + "Mobile Number: " + departmentUser.getMobNo() + "Email Id: " + departmentUser.getEmailAdd()
                    + "Address: " + departmentUser.getAddress() + " Password: " + departmentUser.getPassword()
                    + " Pincode: " + departmentUser.getPincode() + " reg_Id " + departmentUser.getReg_Id());

            departmentUser.setDeptId((int) session.getAttribute("deptId"));
            departmentUser.setDeptName((String) session.getAttribute("deptName"));
//            departmentUser.setFirstName(departmentUser.getFirstName().toUpperCase());
//            departmentUser.setLastName(departmentUser.getLastName().toUpperCase());
            DepartmentUser deptUser = departmentUserDaoImpl.fetchData(Integer.parseInt(registerId));

            boolean result = false;

            Date date = new Date();
            departmentUser.setDeptUserRegistrationDate(date);
            departmentUser.setUserType("true");
          

            System.out.println("Copying properties from fromBean to toBean");

            BeanUtils.copyProperties(departmentSecondaryUser, departmentUser);

            departmentSecondaryUser = DepartmentSecondaryUserDao.fetchDataByReg_Id(Integer.parseInt(registerId));
//                      System.out.println("departmentSecondaryUser "+departmentSecondaryUser.getReg_Id());    
//                      System.out.println("departmentSecondaryUser "+departmentUser.getReg_Id()); 
            if (departmentSecondaryUser != null && departmentSecondaryUser.getDeptId().equals(session.getAttribute("deptId"))) {
                validate = departmentUserModel.validateOnUpdate(departmentUser);
                if (validate.equals("Noerror")) {
                    boolean sameEmail=departmentSecondaryUser.getEmailAdd().equals(departmentUser.getEmailAdd());
                    boolean sameContect=departmentSecondaryUser.getMobNo().equals(departmentUser.getMobNo());
                   String oldEmail=departmentSecondaryUser.getEmailAdd();
                   String newEmail=departmentUser.getEmailAdd();
                     System.out.println("sameEmail "+sameEmail);
                   String oldContect=departmentSecondaryUser.getMobNo();
                   String newContect=departmentUser.getMobNo();
                     System.out.println("sameContect "+sameContect);
                      
                    
                    
                    departmentUser.setReg_Id(departmentSecondaryUser.getReg_Id());
                    departmentUser.setStatus(departmentSecondaryUser.getStatus());
                    
                    BeanUtils.copyProperties(departmentSecondaryUser, departmentUser);

                    result = DepartmentSecondaryUserDao.insertData(departmentSecondaryUser);
                    
                    System.out.println("departmentSecondaryUser email "+departmentSecondaryUser.getEmailAdd());
                    System.out.println("departmentUser email "+departmentUser.getEmailAdd());
                    if(!sameEmail){
                    
                       int state=departmentUserDaoImpl.changeEmail(newEmail,oldEmail);
                    
                        System.out.println("state "+state);
                    
                        
                        
                    } 
                    if(!sameContect){
                    
                       int state=departmentUserDaoImpl.changeContect(newContect,oldContect);
                    
                        System.out.println("state "+state);
                    
                        
                        
                    } 

                    if (result == true) {
                        System.out.println("The DepartmentUser Details Updated Successfully");
                        status = "The DepartmentUser Details Updated Successfully";
//                        mailSender.send(email);

                        logs.setActivity("Update DepartmentSecondaryUser");
                        logs.setLogMessage("DepartmentSecondary User details Updated successfully");
//                  logs.setIpAddress(logsAction.fetchIpAddress());
                        logs.setOsName(logsAction.FetchOSName());
                        logs.setDeptId(departmentUser.getDeptId());
                        logs.setMacAddress(logsAction.fetchMacAddress());
                        logs.setBrowserName(logsAction.getClientBrowser(request));
                        logsActionDao.save(logs);
                        gsonUtility.writeData(status);
                        return status;
                    }
                }
            } else if (departmentUserModel.validateOnSecondaryUserReg(departmentUser).equals("Noerror")) {

                departmentUser.setReg_Id(Integer.parseInt(registerId));
                departmentUser.setPassword(deptUser.getPassword());
          //      departmentUser.setSecretKey(deptUser.getSecretKey());
               
                departmentSecondaryUser = new DepartmentSecondaryUser();
                BeanUtils.copyProperties(departmentSecondaryUser, departmentUser);
                result = DepartmentSecondaryUserDao.insertData(departmentSecondaryUser);

                if (result == true) {
                    departmentUser.setUserType("secondary");
                    String userType = "secondary";
                    departmentUserDaoImpl.updateDataUserType(Integer.parseInt(registerId), userType);
                    System.out.println("The DepartmentUser Registration Done Successfully");
                    status = "The DepartmentUser Registration Done Successfully";
//                     String confirmationUrl = "/regitrationConfirm?EmailNo="+departmentSecondaryUser.getSecondory_reg_Id();
                    email.setText(message + " " + request.getContextPath() + "/regitrationConfirm?EmailNo=" + departmentSecondaryUser.getSecondory_reg_Id());

                    mailSender.send(email);

                    logs.setActivity("Save DepartmentSecondaryUser");
                    logs.setLogMessage("Department User Registration Done successfully");
                    logs.setIpAddress(logsAction.fetchIpAddress());
                    logs.setMacAddress(logsAction.fetchMacAddress());
                    logs.setOsName(logsAction.FetchOSName());
                    logs.setBrowserName(logsAction.getClientBrowser(request));
                    logsActionDao.save(logs);

                    gsonUtility.writeData(status);
                    return status;
                }

            }

        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:saveDepartmentSecondaryUser");
            ex.printStackTrace();
        }
        message = "The DepartmentUser Registration is Not Successfull";

        gsonUtility.writeData(message);
        return message;

    }
    
    
   

    /*
     * After Successfull Login 
     * Method used to Show Department option
     * @param Model m
     * @return DepartmentUser/departmentloginoption jsp page
     */
    @RequestMapping("/departmentUserLogin")
    public String departmentUserLogin(HttpSession session, Model m) {
        try{
              Map map = (Map) session.getAttribute("deptoption");
        if (map.size() == 1) {
            DepartmentUser departmentUser = new DepartmentUser();
            int deptId = (int) session.getAttribute("deptId");
            if (deptId != 0) {
                System.out.println(" ONLY ONE DEPT");
            }
            return departmentUserBydeptId(session, m, departmentUser, (String) map.keySet().toArray()[0], deptId);
        }

        m.addAttribute("deptoption", session.getAttribute("deptoption"));
        m.addAttribute("departmentUser", new DepartmentUser());
        }
        catch(NullPointerException e){
            System.out.println("Exception Null Pointer Exception"+e.getMessage());
                    
        }
      
        return "DepartmentUser/departmentloginoption";
    }

    /*
     * After Login and Seclect Department
     * Method used to Show DepartmentUserDashboard 
     * @param Integer deptId,DepartmentUser
     * @return DepartmentUser/DepartmentUserDashboard jsp page
     */
    @RequestMapping("/departmentUserBydeptId")
    public String departmentUserBydeptId(HttpSession session, Model m, @ModelAttribute("departmentUser") DepartmentUser departmentUser, @RequestParam String deptName, int deptId) {
        System.out.println(deptName + "  " + session.getAttribute("deptEmailId") + " " + session.getAttribute("deptMobNo"));
        System.out.println("/The Department Id is: " + deptId + "/");
        if (deptId != 0) {
            session.setAttribute("deptId", deptId);
        }
        Map<String, String> privilege = new LinkedHashMap<String, String>();

        List<DepartmentSecondaryUser> departmentSecondaryUsers = DepartmentSecondaryUserDao.fetchAll();

        List<DepartmentUser> departmentUsers = departmentUserDaoImpl.fetchAll();
        if (!departmentSecondaryUsers.isEmpty()) {
            for (DepartmentSecondaryUser departmentSecondaryUser : departmentSecondaryUsers) {
                String emailId = session.getAttribute("deptEmailId").toString();
                String mobileNumber = session.getAttribute("deptMobNo").toString();
                if (emailId != null) {
                    if (departmentSecondaryUser.getEmailAdd().equals(emailId)
                            && departmentSecondaryUser.getMobNo().equals(mobileNumber)
                            && departmentSecondaryUser.getDeptId().equals(deptId)) {

                        session.setAttribute("deptUserId", departmentSecondaryUser.getSecondory_reg_Id());
                        session.setAttribute("deptUserName", departmentSecondaryUser.getFirstName() + " " + departmentSecondaryUser.getLastName());
                        session.setAttribute("deptUserPrivilege", departmentSecondaryUser.getUserPrivileges());
                        session.setAttribute("deptId", departmentSecondaryUser.getDeptId());
                        session.setAttribute("deptName", departmentSecondaryUser.getDeptName());
                          session.setAttribute("commanId", departmentSecondaryUser.getSecondory_reg_Id());
                        session.setAttribute("deptUserRole", "SecondaryDeptUser");
                        session.setAttribute("circleId", departmentSecondaryUser.getDeptcircle());
                        session.setAttribute("divisionId", departmentSecondaryUser.getDeptDivision());
                        session.setAttribute("subDivisionId", departmentSecondaryUser.getDeptSubDivision());
                        String[] privlg = departmentSecondaryUser.getUserPrivileges().split(",");
                        for (String s : privlg) {
                            int privilegeid = Integer.parseInt(s);

                            Privilege privileges = PrivilegeDao.fetchData(privilegeid);
                            if (privileges != null) {
                                if (privilege.containsKey(privileges.getPrivilegeArea())) {
                                    privilege.put(privileges.getPrivilegeArea(), privilege.get(privileges.getPrivilegeArea()) + "," + privileges.getPrivilegeName());
                                } else {
                                    privilege.put(privileges.getPrivilegeArea(), privileges.getPrivilegeName());
                                }
                            }
                        }
                    }
                }

            }
        }
        if (!departmentUsers.isEmpty()) {
            System.out.println("inside for loop of departmentUser");
            for (DepartmentUser departmentUserss : departmentUsers) {
                if (departmentUserss.getEmailAdd().equals(session.getAttribute("deptEmailId").toString())
                        && departmentUserss.getMobNo().equals(session.getAttribute("deptMobNo"))
                        && departmentUserss.getDeptId().equals(deptId)) {
                    session.setAttribute("deptUserId", departmentUserss.getReg_Id());
                    session.setAttribute("deptUserName", departmentUserss.getFirstName() + " " + departmentUserss.getLastName());
                    session.setAttribute("deptUserPrivilege", departmentUserss.getUserPrivileges());
                    session.setAttribute("deptId", departmentUserss.getDeptId());
                     session.setAttribute("commanId", departmentUserss.getReg_Id());
                    session.setAttribute("deptName", departmentUserss.getDeptName());
                    session.setAttribute("deptUserRole", "PrimaryDeptUser");
                    session.setAttribute("circleId", departmentUserss.getDeptcircle());
                    session.setAttribute("divisionId", departmentUserss.getDeptDivision());
                    session.setAttribute("subDivisionId", departmentUserss.getDeptSubDivision());
                    System.out.println("inside  if of departmentUser");
                    String[] privlg = departmentUserss.getUserPrivileges().split(",");
                    for (String s : privlg) {
                        int privilegeid = Integer.parseInt(s);
                        System.out.println("privilegeid " + privilegeid);
                        Privilege privileges = PrivilegeDao.fetchData(privilegeid);
                        if (privileges != null) {
                            if (privilege.containsKey(privileges.getPrivilegeArea())) {
                                privilege.put(privileges.getPrivilegeArea(), privilege.get(privileges.getPrivilegeArea()) + "," + privileges.getPrivilegeName());
                            } else {
                                privilege.put(privileges.getPrivilegeArea(), privileges.getPrivilegeName());
                            }
                        }
                    }
                    String otpAlertStatus = departmentUserss.getOtp_alertStatus();
                    System.out.println("otpAlertStatus " + otpAlertStatus);
                    m.addAttribute("otpAlertStatus", otpAlertStatus);
                }

            }
        }
        m.addAttribute("privilege", privilege);
        System.out.println("  " + privilege);
        return "DepartmentUser/DepartmentUserDashboard";
    }

    //json for reporting of departmentUser by circle
    @RequestMapping("/departmentUserbycircle")
    @ResponseBody
    public String departmentUserbycircle() throws JSONException {
        String response = "";
        String jsonText = "";
        String jsonText1 = "";
        Map circleshort = new HashMap();
        String name = "name";
        String data = "data";

        JSONArray arreforname = new JSONArray();
        List arrayofobj = new ArrayList<>();//Array of Object
        JSONObject objfortotalusers = new JSONObject();
        JSONObject objfortotalenableusers = new JSONObject();
        JSONObject seriesobj = new JSONObject();

        JSONObject obj1 = new JSONObject(); //For Categories json object  
        JSONArray arrefordata = new JSONArray();
        JSONArray arrefordataEnable = new JSONArray();
        Map completearr = new HashMap();// For Series
        JSONArray departmentUserbyCircle = new JSONArray();

        List<DepartmentUser> departmentUserbyCircle1 = new ArrayList<>();

        List departmentUserbyDisable = new ArrayList<>();

//               arreforname.add(0, "total user");
//               arreforname.add(1, "total enable user");
        objfortotalusers.put(name, "total user");
        objfortotalenableusers.put(name, "total enable user");

        try {

            List circle = circleDao.fetchAll();
            Iterator<Circle> iterator = circle.iterator();

            while (iterator.hasNext()) {

                Circle circlelist = iterator.next();
                departmentUserbyCircle.add(circlelist.getCircle());
                List<DepartmentUser> departmentUserbyEnable = new ArrayList<>();
                departmentUserbyCircle1 = departmentUserDaoImpl.fetchAllByCircle_Id(circlelist.getCircleid());

                System.out.println("Circle " + circlelist.getCircleid() + "-totaluser " + departmentUserbyCircle1.size());

                arrefordata.add(departmentUserbyCircle1.size());
                if (departmentUserbyCircle1.isEmpty()) {

                    System.out.println("Circle " + circlelist.getCircleid() + "-total Enable user " + departmentUserbyEnable.size() + "if size 0");
//                 System.out.println("circle id "+circlelist.getCircleid()+" enable user"+departmentUserbyEnable.size());

                }

                for (DepartmentUser deptUser : departmentUserbyCircle1) {

                    if (deptUser.getStatus().equals("Enable")) {
//                    
                        departmentUserbyEnable.add(deptUser);

                    }

//                 System.out.println("circle id "+circlelist.getCircleid()+" enable user"+departmentUserbyEnable.size());
                }
                System.out.println("Circle1 " + circlelist.getCircleid() + "-total Enable user " + departmentUserbyEnable.size());
                arrefordataEnable.add(departmentUserbyEnable.size());

                System.out.println("arrefordata " + arrefordata + "arrefordataEnable " + arrefordataEnable);

            }
            objfortotalusers.put(data, arrefordata);
            objfortotalenableusers.put(data, arrefordataEnable);
            arrayofobj.add(objfortotalusers);
            arrayofobj.add(objfortotalenableusers);
//           seriesobj.put("series",arrayofobj);

            obj1.put("Categories", departmentUserbyCircle);
            obj1.put("series", arrayofobj);
            jsonText = JSONValue.toJSONString(obj1.toString());
//            circleshort.put(obj1,jsonText1);
//            jsonText= JSONValue.toJSONString(circleshort);//map object 
            System.out.println("   " + circleshort);

//            Gson gson = new Gson();
//            response = gson.toJson(circleshort);
//            gsonUtility.writeData(response);
//            gsonUtility.responseData(response);
            response = jsonText.replaceAll("\\\\", "");

        } catch (Exception ex) {
            System.out.println("Class:DepartmentUserController \n Method:fetchDepartmentUserDetails");
            ex.printStackTrace();
        }
        return response;
    }

    @RequestMapping("/registrationApprovalMaster")
    public String registrationApprovalMaster(@ModelAttribute("departmentUser") DepartmentUser departmentUser, @ModelAttribute("contractorlog") ContractorLogs contractorlog, Model m) {

        System.out.println("registrationApprovalMaster******");
        m.addAttribute("contractorlog", new ContractorLogs());
        List<ContractorLogs> ContractorLogsList = contractorlogsdao.fetchAll();
        System.out.println("ContractorLogs list " + ContractorLogsList);

        for (ContractorLogs clogs : ContractorLogsList) {
            System.out.println("inside for loop ");
            Integer cid = clogs.getContid();
            System.out.println("ContrId from logs  " + cid);
            Contractor contractor = (Contractor) contractordao.fetchData(cid);
            clogs.setContid(contractor.getId());
            clogs.setFullname(contractor.getFullname());
//            clogs.setCompanyname(contractor.getCompany());
            clogs.setEmail(contractor.getEmailid());
            System.out.println("Contrname from logs " + clogs.getFullname());
            System.out.println("ContrCompanyname from logs " + clogs.getCompanyname());
        }
        m.addAttribute("ContractorLogsList", ContractorLogsList);
        return "Contractor/RegistrationApprovalMaster";
    }

    @RequestMapping("/editCcontractorstatus")
    @ResponseBody
    public String editCcontractorstatus(@RequestParam Integer id, Model m, @ModelAttribute("contractorlog") ContractorLogs contractorlog) throws IOException {
        System.out.println("................call editCcontractorstatus Controller......................" + id);
        contractorlog = contractorlogsdao.fetchData(id);
        Contractor contractor = (Contractor) contractordao.fetchData(contractorlog.getContid());
        contractorlog.setFullname(contractor.getFullname());
        m.addAttribute("contractorlog", contractorlog);
        Gson gson = new Gson();
        gsonUtility.writeData(gson.toJson(contractorlog));
        return gson.toJson(contractorlog);
    }

    @RequestMapping("/contractorStatus")
    public String contractorStatus(@ModelAttribute("contractorlog") ContractorLogs contractorlog, Model m,
            RedirectAttributes ra, HttpSession session) {
        System.out.println("Contractorlogs class called");

        contractorlog.setRequestdate(date);
        m.addAttribute("contractorlog", new ContractorLogs());

        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        boolean flag = true;

        String suspanddate = contractorlog.getSuspendtilldate();
        String Blacklistdate = contractorlog.getBlacklisttilldate();
        String currentDate = sdf.format(date);
        Calendar cal = Calendar.getInstance();
        Date today = cal.getTime();
        System.out.println("~~ today ~~ " + today);
        cal.add(Calendar.YEAR, 2); // to get previous year add -1
        Date nextYear = cal.getTime();

        System.out.println("~~ next2Year ~~ " + nextYear);
        System.out.println("currentDate " + currentDate + "    " + "suspended date  " + contractorlog.getSuspendtilldate());
        System.out.println("currentDate " + currentDate + "    " + "Blacklisted date  " + contractorlog.getBlacklisttilldate());

        try {
//          
            if ((contractorlog.getSuspendtilldate() != null && currentDate.compareTo(contractorlog.getSuspendtilldate()) >= 0)) {
                flag = false;
                System.out.println("~~ if first for current date~~ ");
            } else if ((contractorlog.getSuspendtilldate() != null && contractorlog.getBlacklisttilldate() != null && currentDate.compareTo(contractorlog.getBlacklisttilldate()) >= 0)) {
                flag = false;
                System.out.println("~~ if second for current date~~ ");
            }

            if (contractorlog.getSuspendtilldate() != null && nextYear.after(sdf.parse(suspanddate))) {
                System.out.println("flag suspend  " + flag);
                contractorlog.setContstatus("suspended");
                contractorlogsdao.insertData(contractorlog);
                ra.addFlashAttribute("msg", "contractor has suspended");
            } else if (contractorlog.getBlacklisttilldate() != null && nextYear.after(sdf.parse(Blacklistdate))) {
                System.out.println("flag  blacklist  " + flag);
                contractorlog.setContstatus("blacklisted");
                contractorlogsdao.insertData(contractorlog);
                ra.addFlashAttribute("msg", " contractor has blacklisted");

            } else if (contractorlog.getBlacklisttilldate() != null && !nextYear.after(sdf.parse(Blacklistdate))) {
                ra.addFlashAttribute("msg2", " can't Blacklisted more then 2 years ");
            } else if (contractorlog.getSuspendtilldate() != null && !nextYear.after(sdf.parse(suspanddate))) {
                ra.addFlashAttribute("msg2", " can't Suspended more then 2 years");
            }

        } catch (Exception ex) {
            System.out.println("Department user controller" + ex.getMessage());
            ex.printStackTrace();
        }

        List<ContractorLogs> ContractorLogsList = contractorlogsdao.fetchAll();
        m.addAttribute("ContractorLogsList", ContractorLogsList);
        return "redirect:/registrationApprovalMaster";
    }

    @RequestMapping("/viewContractordetails")
    public String viewContractordetails(@ModelAttribute("contractordetails") ContractorDetails contractordetails, @RequestParam Integer id, Model m) {
        try {
            ContractorLogs contractorlog = contractorlogsdao.fetchData(id);
            Contractor contractor = (Contractor) contractordao.fetchData(id);
            contractordetails = (ContractorDetails) contractordetailsdao.fetchData(contractorlog.getContid());
            contractordetails.setFullName(contractor.getFullname());
            System.out.println("Contractor Name from contractordetails    " + contractordetails.getFullName());
            m.addAttribute("contractordetails", contractordetails);
        } catch (Exception ex) {
            System.out.println("Department user controller" + ex.getMessage());
            ex.printStackTrace();
        }
        return "Contractor/ViewContractorDetails";
    }

    /*show Create Password page after click a link,send in email
     *@param Integer EmailNo(reg_id)
     *return jsp page
     */
   @RequestMapping("/regitrationConfirm")
    public String regitrationConfirm(@RequestParam Integer EmailNo,Model m,RedirectAttributes ra){
      String msgFordeptUser="";
        try {
            System.out.println("Email Id is: " + EmailNo);
//        DepartmentSecondaryUserDao.Emailverified(EmailNo);
            departmentUserDaoImpl.emailverified(EmailNo);
            DepartmentUser deptUser = departmentUserDaoImpl.fetchData(EmailNo);
            if (deptUser.getPassword() == null || deptUser.getPassword().equals("")) {
                ra.addFlashAttribute("reg_Id", EmailNo);
                ra.addFlashAttribute("deptUser", "deptUserCreatePassword");
                return "redirect:/";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        msgFordeptUser="You Have Alredy Created your Password";
        //this string show the when user has already created password
        ra.addFlashAttribute("msgFordeptUser", msgFordeptUser);
        return "redirect:/";
    }

    /*This method is used to Encrypt and Save Password
     *@param int reg_Id,String Password
     *return LotusHome jsp
     */
   
   @RequestMapping("/createNewPassword")
    public String createNewPassword(@RequestParam int reg_Id,String password,String cPassword,RedirectAttributes ra){
       System.out.println("Inside createNewPassword \npassword "+password+"\ncPassword "+cPassword+"\nreg_Id "+reg_Id);
       DepartmentUser departmentUser = new DepartmentUser();
       String encreptPassword = "";
       Map mapForValidation = new HashMap();
       Gson gson = new Gson();
       String msgFordeptUser="";
       try{
      if(password.equals("") ||password == null){
     mapForValidation.put("PasswordError", "Please Enter Password");
     }
     
      if(cPassword.equals("")||cPassword == null ){
     mapForValidation.put("cPasswordError", "Please Enter Address");
     }
     
       Pattern passwordpattern = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$",Pattern.CASE_INSENSITIVE);
      if (!(passwordpattern.matcher(password).matches())&& !password.equals("")) {
         mapForValidation.put("PasswordError", "Enter valid Password");
      }
      
      if(!password.equalsIgnoreCase(cPassword)&& !password.equals("")&&!cPassword.equals("")){
       mapForValidation.put("PasswordError", "Please Enter the Same Password");
      }
      
     System.out.println(" map "+mapForValidation);
      if (mapForValidation.size() >= 1) {
                 String result = gson.toJson(mapForValidation);
                System.out.println("response "+result);
                gsonUtility.writeData(result);
                return result;
            }else{
      
         departmentUser=departmentUserDaoImpl.fetchData(reg_Id);
      
        
                encreptPassword = new AesEncrDec().encrypt(password, secretKey);

                departmentUserDaoImpl.createPassword(reg_Id, encreptPassword, secretKey);
                Common_Logon_Status commonlogin = new Common_Logon_Status();
                commonlogin.setCurrent_Login(date);             
                commonlogin.setDeptId(departmentUser.getDeptId());
                commonlogin.setDeptName(departmentUser.getDeptName());
                commonlogin.setEmailid(departmentUser.getEmailAdd());
                commonlogin.setPassword(encreptPassword);
                commonlogin.setMobileno(departmentUser.getMobNo());
                //commonlogin.setSecretKey(secretKey);
                commonlogin.setUserRegID(departmentUser.getReg_Id());
                commonlogin.setRole("DepartmentUser");                
                departmentUserDaoImpl.saveStatus(commonlogin);
            System.out.println("----------------------real " +"encrypted pass "
                    + encreptPassword + "key  " + secretKey);
      }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       msgFordeptUser="You Have Successfully Created your Password .";
      ra.addFlashAttribute("msgFordeptUser", msgFordeptUser);
    return "redirect:/";
    }

    /*This Method is used to Enable/Disable Otp alert
     *@param 
     *otp alert status
     */
    @RequestMapping("/otpAlert")
    @ResponseBody
    public String otpAlert(Model m, HttpSession session, @RequestParam String emailid, String otpstatus) {
//        String emailid= session.getAttribute("deptEmailId");
        System.out.println("emailid  " + emailid + " otpstatus   " + otpstatus);
        departmentUserDaoImpl.otpAlertStatus(emailid, otpstatus);
        return otpstatus;

    }

    @RequestMapping("/showAmmendmentPrivilegeOfficer")
    @ResponseBody
    public Map showAmmendmentPrivilegeOfficer(HttpSession session) {
        List<DepartmentUser> departmentUsers = new ArrayList<>();
        List<DepartmentSecondaryUser> departmentSecondaryUsers = new ArrayList<>();
        Map<Integer, String> map = new HashMap<>();
        Integer deptId = 0;
        try {

            deptId = Integer.parseInt(session.getAttribute("deptId").toString());
            if (deptId != null) {
                departmentUsers = departmentUserDaoImpl.userOfAmmendmentPrivilege(deptId, "Enable");
                System.out.println("The Department User are from Primary table: " + departmentUsers.size());
                departmentSecondaryUsers = DepartmentSecondaryUserDao.userOfAmmendmentPrivilege(deptId, "Enable");
                System.out.println("The Department User are from Secondary table: " + departmentSecondaryUsers.size());
                for (DepartmentUser departmentUser : departmentUsers) {
                    map.put(departmentUser.getReg_Id(), departmentUser.getFirstName() + " " + departmentUser.getLastName());
                }
                for (DepartmentSecondaryUser departmentSecondaryUser : departmentSecondaryUsers) {
                    map.put(departmentSecondaryUser.getReg_Id(), departmentSecondaryUser.getFirstName() + " " + departmentSecondaryUser.getLastName());
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/logoutDeptUser")
    public String logoutDeptAdmin(HttpServletRequest request, RedirectAttributes ra) {
        HttpSession session = request.getSession(true);

        try {
//            List<Common_Logon_Status> common_logonList = departmentAdminDaoImpl.fetchAllLogonStatus();
//            Iterator<Common_Logon_Status> iterator = common_logonList.iterator();
//            while (iterator.hasNext()) {
//                Common_Logon_Status cls = iterator.next();
//                int id = (int) session.getAttribute("Id");
//                if (cls.getId() == id) {
//                    commonlogin.setIp_Address(logsAction.fetchIpAddress());
//                    commonlogin.setOsName(logsAction.FetchOSName());
//                    commonlogin.setMac_Address(logsAction.fetchMacAddress());
//                    commonlogin.setBrowserName(logsAction.getClientBrowser(request));
//                    commonlogin.setCurrent_Login((Date) session.getAttribute("Current_Login"));
//                    commonlogin.setRole((String) session.getAttribute("role"));
//                    commonlogin.setEmailid((String) session.getAttribute("deptEmailId"));
//                    commonlogin.setMobileno((String) session.getAttribute("deptMobNo"));
//                    Date date = new Date();
//                    commonlogin.setLogout_Time(date);
//                    commonlogin.setId(id);
//                    departmentAdminDaoImpl.saveStatus(commonlogin);
//                    session.invalidate();
//                    System.out.println("");
//                }
//            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        ra.addFlashAttribute("msg", "Logged Out SuccessFully");
        return "redirect:/";
    }

    @RequestMapping("/departmentUserDashBoard")
    public String departmentUserDashBoardPage(HttpSession session) {
        System.out.println("The Department User Dash Board");
        try {
            System.out.println("Redirect to Dashboard Department User");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/departmentUserLogin";
    }

    @RequestMapping("/logoutDepartmentUserDashBoard")
    public String logoutDepartmentUserDashBoard(HttpSession session) {
        System.out.println("The Department User Logout");
        try {
            session.invalidate();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "DepartmentAdmin/AdminDashboard";
    }
    
    
    @RequestMapping("/deptUserProfile")
     public String deptUserProfile(HttpSession session,Model m){
           DepartmentUser departmentUser = null;
        DepartmentSecondaryUser departmentSecondaryUser = null;
        Map<String, String> privilege = new LinkedHashMap<String, String>();

      
        System.out.println("inside deptUserProfile");
//        int deptId = 0;
//        int reg_Id=0;
        String deptUserRole = "";
        String privilegess="";
     try{
      if(session!=null){
          int deptId=  (int) session.getAttribute("deptId");
           int reg_Id= (int) session.getAttribute("deptUserId");
      
         System.out.println(" // deptId // "+session.getAttribute("deptId")+"\n"+"reg id"+ session.getAttribute("deptUserId")+"\n"+session.getAttribute("deptUserRole"));
         
           session.getAttribute("deptUserId");
                session.getAttribute("deptUserName");
                session.getAttribute("deptId");
                session.getAttribute("deptName");
              deptUserRole=  (String) session.getAttribute("deptUserRole");
//                session.getAttribute("deptUserRole", "SecondaryDeptUser");
                session.getAttribute("circleId");
                session.getAttribute("divisionId");
                session.getAttribute("subDivisionId");
//                 session.setAttribute("deptUserRole", "PrimaryDeptUser");
       
        if((deptUserRole!=""||deptUserRole!=null) && deptUserRole.equals("SecondaryDeptUser")){
        privilegess=DepartmentSecondaryUserDao.getPrivileges(reg_Id, deptId);
       
        
        
        }else if((deptUserRole!=""||deptUserRole!=null) && deptUserRole.equals("PrimaryDeptUser")){
         privilegess=departmentUserDaoImpl.getPrivileges(reg_Id, deptId);
        
        }
               if(privilegess!=""||privilegess!=null){
               String[] privlg = privilegess.split(",");
                for (String id : privlg) {
                    int privilegeid = Integer.parseInt(id);

                    Privilege privileges = PrivilegeDao.fetchData(privilegeid);
                    if (privileges != null) {
                        if (privilege.containsKey(privileges.getPrivilegeArea())) {
                            privilege.put(privileges.getPrivilegeArea(), privilege.get(privileges.getPrivilegeArea()) + "," + privileges.getPrivilegeName());
                        } else {
                            privilege.put(privileges.getPrivilegeArea(), privileges.getPrivilegeName());
                        }
                    }
                }
               
               }
            List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptId);
            List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID(deptId);
            List<Division> divisionList = Divisiondao.fetchAllbyDept_ID(deptId);
            List<SubDivision> subDivisionList = subDivisionDao.fetchAllbyDept_ID(deptId);

            //This Condition is Used To Fetch DepartmentUser By Id from Primary Table
            if (deptUserRole.equals("PrimaryDeptUser") || deptUserRole.equals("secondary")) {

                departmentUser = departmentUserDaoImpl.fetchData(reg_Id);
                 Circle circle = circleDao.fetchData(departmentUser.getDeptcircle());
                            departmentUser.setCircle(circle.getCircle());

                            Division division = (Division) Divisiondao.fetchData(departmentUser.getDeptDivision());
                            departmentUser.setDivision(division.getDivision());

                            SubDivision subdivision = subDivisionDao.fetchData(departmentUser.getDeptSubDivision());
                            departmentUser.setSubDivision(subdivision.getSubdivision());

                            Designation designation = designationdao.fetchData(departmentUser.getDesignationName());
                            departmentUser.setDesignations(designation.getDesignation());
               
            }
            //This Condition is Used To Fetch DepartmentUser By Id from Secondary Table
            if (deptUserRole.equals("SecondaryDeptUser")) {

                departmentSecondaryUser = DepartmentSecondaryUserDao.fetchData(reg_Id);
              
//                
                            Circle circle = circleDao.fetchData(departmentSecondaryUser.getDeptcircle());
                            departmentSecondaryUser.setCircle(circle.getCircle());

                            Division division = (Division) Divisiondao.fetchData(departmentSecondaryUser.getDeptDivision());
                            departmentSecondaryUser.setDivision(division.getDivision());

                            SubDivision subdivision = subDivisionDao.fetchData(departmentSecondaryUser.getDeptSubDivision());
                            departmentSecondaryUser.setSubDivision(subdivision.getSubdivision());

                            Designation designation = designationdao.fetchData(departmentSecondaryUser.getDesignationName());
                            departmentSecondaryUser.setDesignations(designation.getDesignation());
                            
                            
                departmentUser = new DepartmentUser();
                m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());
                BeanUtils.copyProperties(departmentUser, departmentSecondaryUser);
                System.out.println("/Department User: " + departmentUser.getUserPrivileges() + "/");
//                deptUserRole = "true";
//                m.addAttribute("deptUserRole", deptUserRole);
//                System.out.println("userType user " + deptUserRole);
            }
                m.addAttribute("departmentUser", departmentUser);
                m.addAttribute("deptUserRole", deptUserRole);
             
//                 m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());
             
//                  m.addAttribute("secondaryId", departmentSecondaryUser.getSecondory_reg_Id());
                m.addAttribute("designationList", designationList);
                m.addAttribute("circleList", circleList);
              
     
        m.addAttribute("privilege", privilege);
         System.out.println("privilege "+privilege);
      }
     }catch(Exception e){
         e.printStackTrace();
     }
     
     return "DepartmentUser/DeptUserProfile";
     }
     
     
     @RequestMapping("/getOtpForDeptUser")
     @ResponseBody
     public String getOtpForDeptUser(HttpSession session){
         System.out.println("inside getOtpForDeptUser");
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
     
      @RequestMapping("/matchOTPDeptUser")
    @ResponseBody
    public boolean matchOTPDeptUser(HttpSession session,@RequestParam String enteredOtp){
        System.out.println("inside matchOTPDeptUser");
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
