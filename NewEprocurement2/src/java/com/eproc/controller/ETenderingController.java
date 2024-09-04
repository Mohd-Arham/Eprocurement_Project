/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.TenderKeywordDAO;
import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.dao.ContractorClassDao;
import com.eproc.dao.ContractorDao;
import com.eproc.dao.DepartmentAdminDAO;
import com.eproc.dao.DepartmentUserDao;
import com.eproc.dao.DesignationDao;
import com.eproc.dao.DivisionDAO;
import com.eproc.dao.EMD_ApplicableDao;
import com.eproc.dao.EnvelopeTypeDao;
import com.eproc.dao.SelectiveTenderDao;
import com.eproc.dao.SubDivisionDAO;
import com.eproc.dao.TenderAmendmentDao;
import com.eproc.dao.TenderAmendmentKeyDatesDao;
import com.eproc.dao.TenderCategoryDAO;
import com.eproc.dao.TenderDao;
import com.eproc.dao.TenderDocumentAmendmentDao;
import com.eproc.dao.TenderDocumentDao;
import com.eproc.dao.TenderEnvelopeADao;
import com.eproc.dao.TenderEnvelopeANameDao;
import com.eproc.dao.TenderEnvelopeBDao;
import com.eproc.dao.TenderEnvelopeBNameDao;
import com.eproc.dao.TenderEnvelopeCDao;
import com.eproc.dao.TenderEnvelopeCNameDao;
import com.eproc.dao.TenderKeyDatesDao;
import com.eproc.dao.TenderStageDao;
import com.eproc.dao.TenderSubmittedQCBSDao;
import com.eproc.dao.TenderTemporaryAmendDocumentDao;
import com.eproc.dao.TypeofTendersDao;
import com.eproc.dao.UploadSorDao;
import com.eproc.daoImpl.DepartmentSecondaryUserDaoImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.TenderStageDAOImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeBDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeCDaoImpl;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Designation;
import com.eproc.domain.Division;
import com.eproc.domain.EMD_Applicable;
import com.eproc.domain.EnvelopeType;
import com.eproc.domain.Logs;
import com.eproc.domain.SelectiveTender;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderAmendment;
import com.eproc.domain.TenderCategory;
import com.eproc.domain.TenderDocument;
import com.eproc.domain.TenderDocumentAmendment;
import com.eproc.domain.TenderEnvelopeA;
import com.eproc.domain.TenderEnvelopeANames;
import com.eproc.domain.TenderEnvelopeB;
import com.eproc.domain.TenderEnvelopeBNames;
import com.eproc.domain.TenderEnvelopeC;
import com.eproc.domain.TenderEnvelopeCNames;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderKeyDatesAmendment;
import com.eproc.domain.TenderKeyword;
import com.eproc.domain.TenderStage;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.domain.TenderSubmittedEnvelopeB;
import com.eproc.domain.TenderSubmittedEnvelopeC;
import com.eproc.domain.TenderSubmittedQCBS;
import com.eproc.domain.TypeOfTenders;
import com.eproc.domain.UploadSOR;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.TenderModel;
import com.eproc.util.FileUtility;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Gaurav Dubey
 */
@Controller
public class ETenderingController {

    @Autowired
    TenderDao tenderDao;
    @Autowired
    TenderAmendmentDao tenderAmendmentDao;
    @Autowired
    TenderStageDao tenderStage;
    @Autowired
    TenderStageDAOImpl tenderStageDaoImpl;
    @Autowired
    SelectiveTenderDao selectiveTender;
    @Autowired
    TenderCategoryDAO categoryDAO;
    @Autowired
    UploadSorDao uploadSorDao;
    @Autowired
    EnvelopeTypeDao envelopeTypeDao;
    @Autowired
    ContractorClassDao contractorClassDao;
    @Autowired
    AreaOfWorkDAO areaOfWorkDAO;
    @Autowired
    TypeofTendersDao typeofTendersDao;
    @Autowired
    EMD_ApplicableDao emdApplicableDao;
    @Autowired
    TenderKeyDatesDao tenderKeyDatesDao;
    @Autowired
    TenderAmendmentKeyDatesDao tenderAmendmentKeyDatesDao;
    @Autowired
    TenderDocumentDao documentDao;
    @Autowired
    TenderDocumentAmendmentDao documentAmendmentDao;
    @Autowired
    TenderTemporaryAmendDocumentDao tenderTemporaryAmendDocumentDao;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    FileUtility fileUtility;
    @Autowired
    TenderKeywordDAO addKeywordDAO;
    @Autowired
    TenderEnvelopeADao tenderEnvelopeADao;
    @Autowired
    TenderEnvelopeBDao tenderEnvelopeBDao;

    @Autowired
    TenderEnvelopeCDao tenderEnvelopeCDao;
    @Autowired
    TenderEnvelopeANameDao envelopeANameDao;
    @Autowired
    TenderEnvelopeBNameDao envelopeBNameDao;

    @Autowired
    TenderEnvelopeCNameDao envelopeCNameDao;

    @Autowired
    DepartmentUserDao departmentUserDao;
    @Autowired
    TenderModel tenderModel;
    @Autowired
    TenderSubmittedEnvelopeADaoImpl envelopeADaoImpl;
    @Autowired
    TenderSubmittedEnvelopeBDaoImpl envelopeBDaoImpl;
    @Autowired
    TenderSubmittedEnvelopeCDaoImpl envelopeCDaoImpl;
    @Autowired
    TenderSubmittedQCBSDao submittedQCBS;
    @Autowired
    DepartmentAdminDAO departmentDao;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    DepartmentSecondaryUserDaoImpl DepartmentSecondaryUserDao;
    @Autowired
    DivisionDAO divisionDAO;
    @Autowired
    SubDivisionDAO subDivisionDAO;
    @Autowired
    ContractorDao contractorDao;
    @Autowired
    DesignationDao designationDao;
    @Autowired
    LogsAction logsAction;
    @Autowired
    LogsActionDao logsActionDao;
    @Autowired
    JavaMailSender mailSender;
    private static final String UPLOAD_DIRECTORY = "/docs";
    private static final String UPLOAD_BUYBACKDIRECTORY = "/buybackdocument";

    @RequestMapping("/departmentUserDashboard")
    public String departmentUserDashboard(@ModelAttribute Tender tender) {
        return "DepartmentUser/DepartmentUserDashboard";
    }

    /*
  * eTendering 
  * fetch the tender label and information before processing the e-Tendering page
  * @param Tender, TenderKeyDates object
  * @return E_TenderingDashboard page
  * @created 2 June 2018
  * @version 2.0.0
     */
    @RequestMapping(value = {
        "/eTendering"
    })
    public String eTendering(@ModelAttribute Tender tender, TenderKeyDates keyDates, @ModelAttribute("submittedEnvelopeA") TenderSubmittedEnvelopeA submittedEnvelopeA, Model m, HttpSession session) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::::::E-Tendering Process::::::::::::::::::::::::::::::::::::::::/");
        ModelAndView andView = new ModelAndView();
        List<Tender> fetchAllTender = new ArrayList<>();
        List<TenderAmendment> fetchAllAmmendedTender = new ArrayList<>();
        List<Tender> fetchAllTenders = new ArrayList<>();
        List<Tender> fetchAllCreatedTender = new ArrayList<>();
        List<Tender> fetchAllSentForApprovalTender = new ArrayList<>();
        List<Tender> fetchAllApprovedTender = new ArrayList<>();
        List<Tender> fetchAllLiveInprocessTender = new ArrayList<>();
        List<Tender> fetchAllAmendedTender = new ArrayList<>();
        List<Tender> fetchAllClosedOpenedTender = new ArrayList<>();
        List<Tender> fetchAllCancelledTender = new ArrayList<>();
        List<Tender> fetchAllCanceledTender = new ArrayList<>();
        List<TenderKeyDates> tenderKeyDateses = new ArrayList<>();
        List<TenderKeyDatesAmendment> tenderKeyDatesAmendments = new ArrayList<>();
        Map<String, String> privileges = new HashMap<>();
        List<DepartmentUser> departmentUserss = new ArrayList<>();
        List<DepartmentSecondaryUser> departmentSecondaryUser = new ArrayList<>();
        Map<String, String> departmentUserList = new HashMap<>();
        try {
            if (session.getAttribute("deptId") != null) {
                //Fetch Department Id
                Integer deptId = Integer.parseInt(session.getAttribute("deptId").toString());
                System.out.println("The Department Id is: " + deptId);
                String tenderMasterId = session.getAttribute("deptUserId").toString();
                System.out.println("The Tender Master Id is: " + tenderMasterId);

                //Fetch the Privileges of Department User for E-Tendering 
                String userPrivileges = session.getAttribute("deptUserPrivilege").toString();
                System.out.println("The User Privileges are: " + userPrivileges);
                String[] privilegesArray = userPrivileges.split(",");
                for (String pri : privilegesArray) {
                    if (pri.trim().equalsIgnoreCase("4")) {
                        m.addAttribute("tenderCreation", "Tender Creation");
                        System.out.print("Tender Creation Privilegs");
                    }
                    if (pri.trim().equalsIgnoreCase("5")) {
                        m.addAttribute("tenderReleaseandAmendment", "Tender Release and Amendment");
                        System.out.print("Tender Release And Ammendment Privilegs");
                    }
                    if (pri.trim().equalsIgnoreCase("6")) {
                        m.addAttribute("tenderAmendment", "Tender Amendment");
                        System.out.print("Tender Amendment Privilegs");
                    }
                }

                //Fetching the officer List for searching by deptId only
                departmentUserss = departmentUserDao.fetchAllByDept_Id(deptId);
                departmentSecondaryUser = DepartmentSecondaryUserDao.fetchAllByDept_Id(deptId);
                if (departmentUserss != null) {
                    for (DepartmentUser departmentUser : departmentUserss) {
                        departmentUserList.put(String.valueOf(departmentUser.getReg_Id()), departmentUser.getFirstName() + " " + departmentUser.getLastName());
                    }
                }
                if (departmentSecondaryUser != null) {
                    for (DepartmentSecondaryUser departmentUser : departmentSecondaryUser) {
                        departmentUserList.put(String.valueOf(departmentUser.getReg_Id()), departmentUser.getFirstName() + " " + departmentUser.getLastName());
                    }
                }
                m.addAttribute("departmentUserList", departmentUserList);

                //Fetch the details for the wizard information(Like:- Drop down and multiselector)  
                this.wizardDataFetching(m, session);

                //Fetch the details for all tender according status
                fetchAllTender = tenderDao.readAll(deptId);
                System.out.println("The Table Of Tender Creation Data: " + fetchAllTender.size());
                //Fetch the key date of all tender 
                tenderKeyDateses = tenderKeyDatesDao.readAllKeyDates();

                //Fetch The details for canceled tender
                fetchAllCanceledTender = tenderDao.readAllCanceledTender(deptId);
                for (Tender amendment : fetchAllCanceledTender) {
                    Tender tender2 = new Tender();
                    BeanUtils.copyProperties(amendment, tender2);
                    //BeanUtils.copyProperties(tender2, tender1);  
                    fetchAllTender.add(tender2);
                }

                /**
                 * The Current date object
                 */
                Date d = new Date();
                System.out.println("//The Currenct Date is " + d + "//");

                //Fetch the details for all Ammended Tender
                fetchAllAmmendedTender = tenderAmendmentDao.readAll(deptId);
                System.out.println("The Table Of Tender Ammendment Data: " + fetchAllAmmendedTender.size());

                for (TenderAmendment amendment : fetchAllAmmendedTender) {
                    TenderAmendment tender1 = new TenderAmendment();
                    Tender tender2 = new Tender();
                    BeanUtils.copyProperties(amendment, tender2);
                    //BeanUtils.copyProperties(tender2, tender1);  
                    fetchAllTender.add(tender2);
                }

                //Fetch the key date of all Ammended tender 
                //tenderKeyDatesAmendments = tenderAmendmentKeyDatesDao.readAllKeyDates();
                System.out.println("The Tender size are: " + fetchAllTender.size() + "\nTender Key Dates are: " + tenderKeyDateses.size());
                Iterator<Tender> iterator = fetchAllTender.iterator();
                while (iterator.hasNext()) {
                    Tender tender1 = iterator.next();

                    /**
                     * Managing the Department User by inserting in tender List
                     */
                    if (tender1.getApprovalOfficer() != null) {
                        List<DepartmentUser> departmentUsers = new ArrayList<>();
                        String[] officer = tender1.getApprovalOfficer().split(",");
                        for (String office : officer) {
                            DepartmentUser departmentUser = new DepartmentUser();
                            System.out.println("The Officer Reg_Id is: " + office);
                            departmentUser = departmentUserDaoImpl.fetchData(Integer.parseInt(office.trim()));
                            System.out.println("The DepartmentUser: " + departmentUser);
                            departmentUsers.add(departmentUser);
                        }
                        tender1.setAmmendmentPrivilegeOfficerList(departmentUsers);
                    }

                    /**
                     * Managing the live tenders
                     */
                    switch (tender1.getTenderStatus()) {
                        case "Created":
                        case "Sent For Approval":
                            System.out.println("The Tender Sent For Approval Key Dates");
                            tenderKeyDateses.forEach((dates) -> {
                                if (tender1.getTender_Id() == Integer.parseInt(dates.getTender_Id())) {
                                    tender1.setTenderKeyDates(dates);
                                }
                            });
                            break;

                        case "Approved":
                            System.out.println("The Tender Approved Key Dates");
                            tenderKeyDateses.forEach((dates) -> {
                                if (tender1.getTender_Id() == Integer.parseInt(dates.getTender_Id())) {
                                    tender1.setTenderKeyDates(dates);
                                    SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
                                    String[] purchaseDate = dates.getTenderPurchaseDate().split("/");
                                    Date startDate = new Date(purchaseDate[0].trim());
                                    Date endDate = new Date(purchaseDate[1].trim());
                                    System.out.println("The Purchase date is: " + dates.getTenderPurchaseDate());
                                    if (startDate.getTime() <= d.getTime() && d.getTime() <= endDate.getTime() && endDate.getTime() > startDate.getTime()) {
                                        fetchAllLiveInprocessTender.add(tender1);
                                    }
                                }
                            });
                            break;

                        case "Amended":
                            System.out.println("The Tender Ammend Key Dates");
                            TenderKeyDatesAmendment amendment = new TenderKeyDatesAmendment();
                            amendment = tenderAmendmentKeyDatesDao.readLastKeyDate(tender1.getTender_Id());
                            TenderKeyDates dates = new TenderKeyDates();
                            if (amendment != null) {
                                BeanUtils.copyProperties(amendment, dates);
                                tender1.setTenderKeyDates(dates);
                                SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
                                String[] purchaseDate = dates.getTenderPurchaseDate().split("/");
                                Date startDate = new Date(purchaseDate[0].trim());
                                Date endDate = new Date(purchaseDate[1].trim());
                                if (startDate.getTime() <= d.getTime() && d.getTime() <= endDate.getTime() && endDate.getTime() > startDate.getTime()) {
                                    fetchAllLiveInprocessTender.add(tender1);
                                }
                            }
                            break;
                    }

                    /**
                     * Managing the Tender list according to there status
                     */
                    switch (tender1.getTenderStatus()) {

                        case "Created":
                            System.out.println("Create condition");
                            if (tender1.getTenderMasterId().equalsIgnoreCase(tenderMasterId)) {
                                fetchAllCreatedTender.add(tender1);
                                fetchAllTenders.add(tender1);
                            }
                            break;

                        case "Sent For Approval":
                            System.out.println("Sent For Approval");
                            if (tender1.getTenderMasterId().equalsIgnoreCase(tenderMasterId)) {
                                tender1.setStatusManaging(true);
                                System.out.println("The Tender Master is: " + tender1.getTenderMasterId());
                                fetchAllSentForApprovalTender.add(tender1);
                                fetchAllTenders.add(tender1);
                            }
                            if (tender1.getApprovalOfficer() != null) {
                                String[] officer = tender1.getApprovalOfficer().trim().split(",");
                                for (String off : officer) {
                                    if (off.equalsIgnoreCase(tenderMasterId)) {
                                        System.out.println("The Approval Master is: " + off);
                                        tender1.setStatusManaging(false);
                                        fetchAllSentForApprovalTender.remove(tender1);
                                        fetchAllSentForApprovalTender.add(tender1);
                                        fetchAllTenders.remove(tender1);
                                        fetchAllTenders.add(tender1);
                                    }
                                }
                            }
                            break;

                        case "Approved":
                            System.out.println("Approved");
                            if (tender1.getTenderMasterId().equalsIgnoreCase(tenderMasterId)) {
                                tender1.setStatusManaging(true);
                                System.out.println("The Tender Master is: " + tender1.getTenderMasterId());
                                fetchAllApprovedTender.add(tender1);
                                fetchAllTenders.add(tender1);
                            }
                            if (tender1.getApprovalOfficer() != null) {
                                String[] officer = tender1.getApprovalOfficer().trim().split(",");
                                for (String off : officer) {
                                    if (off.equalsIgnoreCase(tenderMasterId)) {
                                        System.out.println("The Approval Master is: " + off);
                                        fetchAllApprovedTender.remove(tender1);
                                        fetchAllApprovedTender.add(tender1);
                                        tender1.setStatusManaging(false);
                                        fetchAllTenders.remove(tender1);
                                        fetchAllTenders.add(tender1);
                                    }
                                }
                            }
                            System.out.println("Ammendment Privilege Officer is: " + tender1.getAmmendmentPrivilegeOfficer() + "\nAmmendment Privilege is: " + tender1.getAmmendmentPrivilege() + "\nTender Id: " + tender1.getTender_Id());
                            if (tender1.getAmmendmentPrivilegeOfficer() != null || tender1.getAmmendmentPrivilege().equalsIgnoreCase("Allowed")) {

                                String[] officer = tender1.getAmmendmentPrivilegeOfficer().trim().split(",");
                                for (String off : officer) {
                                    if (off.equalsIgnoreCase(tenderMasterId)) {
                                        System.out.println("The Ammendment Master is: " + off);
                                        tender1.setStatusManaging(false);
                                        fetchAllApprovedTender.remove(tender1);
                                        fetchAllApprovedTender.add(tender1);
                                        fetchAllTenders.remove(tender1);
                                        fetchAllTenders.add(tender1);
                                    }
                                }
                            }
                            break;

                        case "Amended":
                            System.out.println("Amended");
                            System.out.println("The Tender Master Id is: " + tender1.getTenderMasterId() + " : " + tenderMasterId);
                            if (tender1.getTenderMasterId() != null) {
                                if (tender1.getTenderMasterId().equalsIgnoreCase(tenderMasterId)) {
                                    tender1.setStatusManaging(true);
                                    fetchAllAmendedTender.add(tender1);
                                    fetchAllTenders.add(tender1);
                                }
                            }
                            if (tender1.getApprovalOfficer() != null) {
                                String[] officer = tender1.getApprovalOfficer().trim().split(",");
                                for (String off : officer) {
                                    if (off.equalsIgnoreCase(tenderMasterId)) {
                                        System.out.println("The Approval Master is: " + off);
                                        fetchAllAmendedTender.remove(tender1);
                                        tender1.setStatusManaging(false);
                                        fetchAllAmendedTender.add(tender1);
                                        fetchAllTenders.remove(tender1);
                                        fetchAllTenders.add(tender1);
                                    }
                                }
                            }
                            System.out.println("The Ammendment Privilege: " + tender1.getAmmendmentPrivilegeOfficer() + ": " + tender1.getTender_Id());
                            if (tender1.getAmmendmentPrivilegeOfficer() != null || tender1.getAmmendmentPrivilege().equalsIgnoreCase("Allowed")) {
                                String[] officer = tender1.getAmmendmentPrivilegeOfficer().trim().split(",");
                                for (String off : officer) {
                                    if (off.equalsIgnoreCase(tenderMasterId)) {
                                        System.out.println("The Ammend Master is: " + off);
                                        tender1.setStatusManaging(false);
                                        fetchAllAmendedTender.remove(tender1);
                                        fetchAllAmendedTender.add(tender1);
                                        fetchAllTenders.remove(tender1);
                                        fetchAllTenders.add(tender1);
                                    }
                                }
                            }
                            break;

                        case "Canceled":
                            System.out.println("Canceled");
                            if (tender1.getTenderMasterId().equalsIgnoreCase(tenderMasterId)) {
                                tender1.setStatusManaging(true);
                                fetchAllCancelledTender.add(tender1);
                                fetchAllTenders.add(tender1);
                            }
                            System.out.println("The Canceled Tender Size is: " + fetchAllCancelledTender.size());
                            break;

                        default:
                    }
                }

                m.addAttribute("fetchAllTender", fetchAllTenders);
                m.addAttribute("fetchAllCreatedTender", fetchAllCreatedTender);
                m.addAttribute("fetchAllSentForApprovalTender", fetchAllSentForApprovalTender);
                m.addAttribute("fetchAllApprovedTender", fetchAllApprovedTender);
                m.addAttribute("fetchAllLiveInprocessTender", fetchAllLiveInprocessTender);
                m.addAttribute("fetchAllAmendedTender", fetchAllAmendedTender);
                m.addAttribute("fetchAllClosedOpenedTender", fetchAllClosedOpenedTender);
                m.addAttribute("fetchAllCancelledTender", fetchAllCancelledTender);
            } else {
                System.out.println("/Session Time Out/");
                session.invalidate();
                return "redirect:/";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "DepartmentUser/E-TenderingDashboard";
    }

//   
//  /*
//  * wizardDataFetching
//  * Method call to fetch the details for wizard
//  * @param Model
//  * @created 13 Aug 2018
//  * @version 2.0.0
//  *
//  */
    public void wizardDataFetching(Model model, HttpSession session) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::::::Fetch the Data for the wizard::::::::::::::::::::::::::::::::::::::::/");
        List<TenderStage> tenderStagesList = new LinkedList<TenderStage>();
        List<SelectiveTender> selectiveTenderList = new ArrayList<SelectiveTender>();
        Map<Integer, String> selectiveTenderMap = new HashMap<Integer, String>();
        List<TenderCategory> tenderCategoryList = new LinkedList<TenderCategory>();
        List<UploadSOR> uploadSORList = new LinkedList<UploadSOR>();
        List<EnvelopeType> envelopeTypeList = new LinkedList<EnvelopeType>();
        List<ContractorClass> contractorClassList = new LinkedList<ContractorClass>();
        List<TypeOfTenders> typeOfTendersList = new LinkedList<TypeOfTenders>();
        List<EMD_Applicable> emdApplicableList = new LinkedList<EMD_Applicable>();
        List<Division> division = new LinkedList<Division>();
        List<DepartmentUser> departmentUsers = new ArrayList<>();
        List<DepartmentSecondaryUser> departmentSecondaryUsers = new ArrayList<>();
        Map<Integer, String> map = new HashMap<>();
        try {
            if (session.getAttribute("deptId") != null) {
                Integer deptId = Integer.parseInt(session.getAttribute("deptId").toString());
                System.out.println("The Department Id is: " + deptId);
                Integer circleId = Integer.parseInt(session.getAttribute("circleId").toString());
                System.out.println("The Circle Id of Department User: " + circleId);

                //Fetch Details for drop down in wizard
                tenderStagesList = tenderStage.fetchAll();
                System.out.println("The Tender Stage List size: " + tenderStagesList.size());

                selectiveTenderList = selectiveTender.fetchAll();
                System.out.println("The Selective Tender List size: " + selectiveTenderList.size());
                selectiveTenderList.forEach((selectiveTender) -> {
                    selectiveTenderMap.put(selectiveTender.getSelectiveTender_id(), selectiveTender.getSelectivetender_Name());
                });

                tenderCategoryList = categoryDAO.fetchAll();
                System.out.println("The Tender Category List size: " + tenderCategoryList.size());

                if (deptId != null) {
                    uploadSORList = uploadSorDao.fetchSORDocumentByDeptId(deptId);
//          UploadSOR oR = new UploadSOR();
//          oR.setId(uploadSORList.size()+1);
//          oR.setFileName("<a href='#'>dgfsdgfsdg</a>");
//          oR.setFilePath("");
//          uploadSORList.add(oR);
                    System.out.println("The Upload SOR Document List size: " + uploadSORList.size());
                }

                envelopeTypeList = envelopeTypeDao.fetchAll();
                System.out.println("The Envelope List size: " + envelopeTypeList.size());

                contractorClassList = contractorClassDao.fetchAll();
                System.out.println("The Contractor Class List size: " + contractorClassList.size());

                typeOfTendersList = typeofTendersDao.fetchAll();
                System.out.println("The Type Of Tender List size: " + typeOfTendersList.size());

                emdApplicableList = emdApplicableDao.fetchAll();
                System.out.println("The EMD Applicable List size: " + emdApplicableList.size());

                if (deptId != null) {
                    division = divisionDAO.fetchDivision(circleId, deptId);
                    System.out.println("The Division List Size: " + division.size());
                }

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

                model.addAttribute("tenderStagesList", tenderStagesList);
                model.addAttribute("selectiveTenderList", selectiveTenderList);
                model.addAttribute("tenderCategoryList", tenderCategoryList);
                model.addAttribute("uploadSORList", uploadSORList);
                model.addAttribute("envelopeTypeList", envelopeTypeList);
                model.addAttribute("contractorClassList", contractorClassList);
                model.addAttribute("typeOfTendersList", typeOfTendersList);
                model.addAttribute("emdApplicableList", emdApplicableList);
                model.addAttribute("division", division);
                model.addAttribute("amendmentPrivilege", map);
            } else {
                System.out.println("Session Time Out");
                session.invalidate();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /*
  * generateTenderNumber
  * create the new tender number before the tender creation process is start
  * @param null
  * @Created 24 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/generateTenderNumber")
    @ResponseBody
    public String generateTenderNumber(HttpSession session, DepartmentAdmin departmentAdmin) {
        System.out.println("/:::::::::::::::::::::::::::::::Generating the New Tender Number::::::::::::::::::::::/");
        String newTenderNumber = null;
        String newVersion = null;

        try {
            Integer deptId = 0;
            deptId = (Integer) session.getAttribute("deptId");
            //Temporary Change
            if (deptId == null) {
                deptId = 2;
            }
            System.out.println("The Department Admin Id: " + deptId);
            newVersion = this.tenderNumberGenerating(deptId, departmentAdmin);
            gsonUtility.writeData(newVersion);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public String tenderNumberGenerating(int deptId, DepartmentAdmin departmentAdmin) {
        int length = 10;
        String newTenderNumber = null;
        int lastTenderNumberGen = 0;
        List<String> tendernumber = new ArrayList<>();
        String newVersion = null;
        try {

            //generatedTenderNumber = (String) UUID.randomUUID().toString().subSequence(0, length);
            if (deptId != 0) {
                tendernumber = tenderDao.readAlltenderNo(deptId);
            }
            if (tendernumber.isEmpty()) {
                if (deptId != 0) {
                    departmentAdmin = departmentDao.fetchData(deptId);
                }
                System.out.println("The Tender Prefix is: " + departmentAdmin.getTenderPrefix());
                System.out.println("The Tender Starting No.: " + departmentAdmin.getTenderStartingNo());
                newVersion = departmentAdmin.getTenderPrefix() + "/" + departmentAdmin.getTenderStartingNo();
                System.out.println("The New Generated Tender Number: " + newVersion);
            } else {
                String tenderingNum = null;
                System.out.println("The Tender List is: " + tendernumber.size());
                tenderingNum = tendernumber.get(tendernumber.size() - 1);
                System.out.println("The last tender Number is: " + tenderingNum);
                String[] splittingNumber = tenderingNum.split("/");
                int increasingSequnceBy = Integer.parseInt(splittingNumber[1]) + 1;
                newTenderNumber = splittingNumber[0] + "/" + String.valueOf(increasingSequnceBy);
                System.out.println("Before Sending Tender Number: " + newTenderNumber);
                newVersion = newTenderNumber;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return newVersion;
    }

    /*
  * fetchPreviousTenderNumber
  * Method call to fetch the previous tenders for copy tenders
  * @param null
  * @return list
     */
    @RequestMapping("/fetchPreviousTenderNumber")
    @ResponseBody
    public List fetchPreviousTenderNumber() {
        List<Tender> tendersList = new ArrayList<>();
        try {
            tendersList = tenderDao.readAll();
            System.out.println("The Total Tender are: " + tendersList.size());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tendersList;
    }

    /*
  * fetchPreviouTenderDetails
  * Method call to fetch the previous tender Summary
  * @param tender_Id
  * @return Tender
     */
    @RequestMapping("/fetchPreviouTenderDetails")
    @ResponseBody
    public Tender fetchPreviouTenderDetails(@RequestParam int tender_Id) {
        Tender tendersList = new Tender();
        TenderStage tenderStages = new TenderStage();
        SelectiveTender selectiveTender = new SelectiveTender();
        EnvelopeType envelopeType = new EnvelopeType();
        TypeOfTenders ofTenders = new TypeOfTenders();
        TenderCategory category = new TenderCategory();
        AreaOfWork aow = new AreaOfWork();
        TenderKeyDates keyDates = new TenderKeyDates();
        TenderSubmittedEnvelopeA envelopeA = new TenderSubmittedEnvelopeA();
        TenderSubmittedEnvelopeB envelopeB = new TenderSubmittedEnvelopeB();
        TenderSubmittedEnvelopeC envelopeC = new TenderSubmittedEnvelopeC();
        Map<Integer, String> envelopeAOfficersName = new HashMap<>();
        Map<Integer, String> envelopeBOfficersName = new HashMap<>();
        Map<Integer, String> envelopeCOfficersName = new HashMap<>();

        try {
            tendersList = tenderDao.read(tender_Id);
            System.out.println("The Tender is: " + tendersList);
            if (tendersList.getTenderStage() != null) {
                //Fetch the name of Tender Stage by tender Stage Id.
                System.out.println("The Tender Stage is: " + tendersList.getTenderStage());
                tenderStages = (TenderStage) this.tenderStage.fetchData(Integer.parseInt(tendersList.getTenderStage()));
                if (tenderStages != null) {
                    System.out.println("The Tender Stage is: " + tenderStages.getTenderStage_Name());
                    tendersList.setTenderStageName(tenderStages.getTenderStage_Name());
                }
            }

            if (tendersList.getSelectiveTender() != null) {
                System.out.println("The Tender Stage is: " + tendersList.getSelectiveTender());
                selectiveTender = (SelectiveTender) this.selectiveTender.fetchData(Integer.parseInt(tendersList.getSelectiveTender()));
                if (selectiveTender != null) {
                    System.out.println("The Selective Tender Name:" + selectiveTender);
                    tendersList.setSelectiveTenderName(selectiveTender.getSelectivetender_Name());
                }
            }

            if (tendersList.getEnvelopeType() != null) {
                System.out.println("The Envelope Type is: " + tendersList.getEnvelopeType());
                envelopeType = (EnvelopeType) this.envelopeTypeDao.fetchData(Integer.parseInt(tendersList.getEnvelopeType()));
                if (envelopeType != null) {
                    System.out.println("The Envelope Type Name :" + envelopeType.getEnvelopeType_Name());
                    tendersList.setEnvelopeTypeName(envelopeType.getEnvelopeType_Name());
                }
            }

            if (tendersList.getTypeOfTender() != null) {
                System.out.println("The Type of Tender is: " + tendersList.getTypeOfTender());
                ofTenders = (TypeOfTenders) this.typeofTendersDao.fetchData(Integer.parseInt(tendersList.getTypeOfTender()));
                if (ofTenders != null) {
                    System.out.println("The Type Of Tender Name: " + ofTenders.getTypeOfTenders_Name());
                    tendersList.setTypeOfTenderName(ofTenders.getTypeOfTenders_Name());
                }
            }

            if (tendersList.getTenderCategory() != null) {
                System.out.println("The Tender Category is: " + tendersList.getTenderCategory());
                category = this.categoryDAO.fetchData(Integer.parseInt(tendersList.getTenderCategory()));
                if (category != null) {
                    System.out.println("The Tender Category Name is: " + category.getTender_category_name());
                    tendersList.setTenderCategoryName(category.getTender_category_name());
                }
            }

            if (tendersList.getAreaOfWork() != null) {
                System.out.println("The Area Of Work is: " + tendersList.getAreaOfWork());
                aow = this.areaOfWorkDAO.fetchData(Integer.parseInt(tendersList.getAreaOfWork()));
                if (aow != null) {
                    System.out.println("The Area Of Work Name is: " + aow.getAreaofwork_name());
                    tendersList.setAreaOfWorkName(aow.getAreaofwork_name());
                }
            }

            //Fetch Tender Key Dates
            keyDates = this.tenderKeyDatesDao.readKeyDate(tender_Id);
            System.out.println("The Key dates are: " + keyDates);
            if (keyDates != null) {
                tendersList.setTenderKeyDates(keyDates);
            }

            //Fetch Envelope A Officers Name
            envelopeA = this.envelopeADaoImpl.read(tender_Id);
            System.out.println("The Envelope A is: " + envelopeA.getEnvelopeAOfficers());
            if (envelopeA != null) {
                String envelopeAOfficer[] = envelopeA.getEnvelopeAOfficers().split(",");
                for (String officerA : envelopeAOfficer) {
                    DepartmentUser departmentUser = new DepartmentUser();
                    departmentUser = (DepartmentUser) this.departmentUserDao.fetchData(Integer.parseInt(officerA));
                    System.out.println("The Department User is: " + departmentUser.getFirstName() + " " + departmentUser.getLastName());
                    envelopeAOfficersName.put(departmentUser.getReg_Id(), departmentUser.getFirstName() + " " + departmentUser.getLastName());
                }
                tendersList.setEnvelopeAOfficersName(envelopeAOfficersName);
            }

            //Fetch Envelope B officers Name
            envelopeB = this.envelopeBDaoImpl.read(tender_Id);
            //     System.out.println("The Envelope B is: "+envelopeB.getEnvelopeBOfficers());
            if (envelopeB != null) {
                String envelopeBOfficer[] = envelopeB.getEnvelopeBOfficers().split(",");
                for (String officerB : envelopeBOfficer) {
                    DepartmentUser departmentUser = new DepartmentUser();
                    departmentUser = (DepartmentUser) this.departmentUserDao.fetchData(Integer.parseInt(officerB));
                    System.out.println("The Department User is: " + departmentUser.getFirstName() + " " + departmentUser.getLastName());
                    envelopeBOfficersName.put(departmentUser.getReg_Id(), departmentUser.getFirstName() + " " + departmentUser.getLastName());
                }
                tendersList.setEnvelopeBOfficersName(envelopeBOfficersName);
            }

            //Fetch Envelope C officers Name 
            envelopeC = this.envelopeCDaoImpl.read(tender_Id);
            System.out.println("The Envelope C is: " + envelopeC.getEnvelopeCOfficers());
            if (envelopeC != null) {
                String envelopeCOfficer[] = envelopeC.getEnvelopeCOfficers().split(",");
                for (String officerC : envelopeCOfficer) {
                    DepartmentUser departmentUser = new DepartmentUser();
                    departmentUser = (DepartmentUser) this.departmentUserDao.fetchData(Integer.parseInt(officerC));
                    System.out.println("The Department User is: " + departmentUser.getFirstName() + " " + departmentUser.getLastName());
                    envelopeCOfficersName.put(departmentUser.getReg_Id(), departmentUser.getFirstName() + " " + departmentUser.getLastName());
                }
                tendersList.setEnvelopeCOfficersName(envelopeCOfficersName);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tendersList;
    }

    /*
  * copyTenderNumbers
  * Copy all details of previous Tender
  * @param TenderNumber, noOfCopy
  * @return string
  * @Created 10 Sep 2018
     */
    @RequestMapping("/copyTenderNumbers")
    @ResponseBody()
    public String copyTenderNumbers(@RequestParam String tender_Id, @RequestParam String noOfCopy, @RequestParam String nitDate, @RequestParam String nitNumber, Tender tender, Tender tender1, HttpSession session, DepartmentAdmin departmentAdmin) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::Copy Tender number is call::::::::::::::::::::::::::::::::::/");
        System.out.println("The Tender No to copy: /nNumber Of Copy: " + noOfCopy + "/nTender Id: " + tender_Id);
        String generatedTenderNumber = null;
        String newVersion = null;
        try {
            if (session.getAttribute("deptId") != null) {
                tender = tenderDao.read(Integer.parseInt(tender_Id));
                System.out.println("The Department Id is: " + tender.getDeptId() + " Department Id in session: " + session.getAttribute("deptId").toString());
                if (tender != null && tender.getDeptId() == Integer.parseInt(session.getAttribute("deptId").toString())) {
                    for (int i = 1; i <= Integer.parseInt(noOfCopy); i++) {
                        //Copy the object into another object
                        BeanUtils.copyProperties(tender, tender1);
                        if (tender1 != null) {
                            newVersion = this.tenderNumberGenerating(2, departmentAdmin);
                            System.out.println("  The Tender Number is: " + newVersion);
                        } else {
                            newVersion = generatedTenderNumber;
                        }
                        tender1.setTenderNumber(newVersion);
                        tender1.setTender_Id(0);
                        tender1.setNitDate(nitDate);
                        tender1.setNitNumber(nitNumber);
                        tender1.setTenderStatus("Created");
                        tender1.setWizardStep("step1");
                        tenderDao.create(tender1);
                    }
                }

            } else {
                System.out.println("Session Time Out");
                session.invalidate();
                return "redirect:/";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

//  /*
//  * checkTenderNumberExistence
//  * Method call to check the Existence of Tender Number
//  * @Created 7 Sep 2018
//  @Version 2.0.0
//  */
//  @RequestMapping("/checkTenderNumberExistence")
//  @ResponseBody
//  public boolean checkTenderNumberExistence(@RequestParam String tenderNumber){
//      boolean existence = false;
//      System.out.println("The Tender Number: "+tenderNumber);
//      try{
//         existence = tenderModel.chechTenderNumberExistence(tenderNumber);
//          System.out.println("The Existence is: "+existence);
//      }catch(Exception ex){
//          ex.printStackTrace();
//      }
//      return existence;
//  }
    /*
  * tenderCreation 
  * insert the data from the tender to database step by step
  * @param Tender, step, tender_Id
  * @return null
  * @created 12 June 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderCreation")
    @ResponseBody
    public String tenderCreation(@ModelAttribute Tender tender,Model model, @RequestParam String step, @RequestParam Integer tender_Id, @RequestParam Integer keyDatesId, HttpSession session) {
        Tender previousTender = new Tender();
        System.out.println("/:::::::::::::::::::::::::::::::::::::::::Tender Creation Wizard::::::::::::::::::::::::::::::::::::::::/");
        System.out.println("1:-Tender NIT Number: " + tender.getTender_Id() + "\n2:-Tender Number: " + tender.getTenderNumber()
                + "\n3:-NIT Date: " + tender.getNitDate() + "\n4:-NIT Number: " + tender.getNitNumber() + "\n5:-Selective Tender: " + tender.getSelectiveTender()
                + "\n6:-Tender Category: " + tender.getTenderCategory() + "\n7:-Area Of Work: " + tender.getAreaOfWork() + "\n8:-Tender Keywords: "
                + tender.getTenderKeywords() + "\n9:-SOR Document: " + tender.getSorDocument() + "\n10:-Buy Back Policy: " + tender.getBuyBackPolicy()
                + "\n11:-Name Of Work: " + tender.getNameOfWork() + "\n12:-Description: " + tender.getDescriptionOfWork() + "\n13:-Estimate Value: "
                + tender.getEstimateValueInFig() + "\n14:-Estimate Value in words: " + tender.getEstimateValueInWord() + "\n15:-Tender Fee: "
                + tender.getTenderFeeInFig() + "\n16:-Tender Fee in words: " + tender.getTenderFeeInWord() + "\n17:-Bid Validate Type: "
                + tender.getBidValidateType() + "\n18:-Bid Validate Period: " + tender.getBidValidatePeriod() + "\n19:-Work Completion type: "
                + tender.getWorkCompletionType() + "\n20:-Work Completion Period: " + tender.getWorkCompletionPeriod() + "\n21:-Rainy Season: "
                + tender.getRainySeason() + "\n22:-Envelope Type: " + tender.getEnvelopeType() + "\n23:-Contractor Class: " + tender.getContractorClass()
                + "\n24:-Type Of Tender: " + tender.getTypeOfTender() + "\n25:-EMD Applicable: " + tender.getEmdApplicable() + "\n26:-EMD In Fig: "
                + tender.getEmdInFig() + "\n27:-EMD in words: " + tender.getEmdInWords() + "\n28:-Tender Notice: " + tender.getTenderNotice()
                + "\n29:-Tender Master: " + tender.getTenderMaster() + "\n30:-Tender Status: " + tender.getTenderStatus() + "\n31:-Step is: " + step
                + "\n32:-Tender Mode of payment for Tender Fee: " + tender.getModeOfFeeForTenderFee() + "\n Mode of payment for EMD " + tender.getModeOfFeeForEMDApplicable() + "\n33:-Ammendment Privilege: " + tender.getAmmendmentPrivilege()
                + "\n34:-Tender Re Bid: " + tender.getTenderRebid() + "\n35:-MSMEExemption: " + tender.getMsmensicExemption() + "\n36:-MSMEEMDExemption: " + tender.getEmdMSMENSICExemption()
                + "\n37:-SC/ST Exemption: " + tender.getScstExemption() + "\n38:- EMD for SC/ST Exemption: " + tender.getTenderfeeSCSTExemption()
                + "\n39:-SC/ST Tender Fee Exemption: " + tender.getEmdTenderSCSTFeeExemption() + "\n40:-OBC Exemption: " + tender.getObcExemption()
                + "\n41:-OBC Tender Fee Exemption: " + tender.getTenderfeeOBCExemption() + "\n42:-OBC EMD Exmpetion:" + tender.getEmdTenderOBCFeeExemption()
                + "\n43:-Tender Bid-WithDraw: " + tender.getTenderBidWithdraw() + "\n44:- Ammendment Officer: " + tender.getAmmendmentPrivilegeOfficer() + "\nTender Id: " + tender_Id + "\n 45:-Tender Status: " 
                + tender.getTenderStatus() +
                "\n46:- Tender Step: " + tender.getWizardStep()+"\n47:- Tender Stage:"+tender.getTenderStage()+
                "\n48:- QCBS Weightage: "+tender.getQualificationWeightage()+"\n49:- QCBS Weightage Percent: "+ tender.getQualificationWeightagePercent()+
                "\n50:- QCBS Qualification: "+tender.getMinimiumQualification());
        Integer deptId = 0;
        String departmentName = null;
        String tenderMasterId = null;
        String tenderMasterName = null;
        String circleId = null;
        String divisionId = null;
        String subDivisionId = null;

        System.out.println("//////The Key Dates Are://///");
        System.out.println("\n1:- Tender Release: " + tender.getTenderKeyDates().getTenderPurchaseDate() + "\n:2:- Tender Purchase: " + 
                tender.getTenderKeyDates().getTenderPurchaseDate() + "\n3:- Tender Opening EA: " +
                tender.getTenderKeyDates().getOpeningEA() + "\n4:- Tender Opening EB: " + 
                tender.getTenderKeyDates().getOpeningEB() + "\n5:- Tender Opening EC: " + 
                tender.getTenderKeyDates().getOpeningEC() + "\n6:- Opening EC Authority: " + 
                tender.getTenderKeyDates().getOpeningECaftertechopening() + "\n7:- Tender Key Dates Id: " +
                tender.getTenderKeyDates().getKeyDatesId()+"\n8:- Tender EC SUBMISSION DATE"
        +tender.getTenderKeyDates().getEcBidSubmissionDate());
        try {
            tender.setPortalCharge("10000");
            tender.setTenderDocumentFees("10000");
            tender.setServiceTax("10000");
            //Managing the Dept Id
            if (deptId != null) {
                deptId = Integer.parseInt(session.getAttribute("deptId").toString());
                System.out.println("The Dept Id is: " + deptId);
            }
            if (deptId != 0) {
                System.out.println("The Department Id is: " + deptId);
                tender.setDeptId(deptId);
            }

            //Managing the Circle Id
            circleId = session.getAttribute("circleId").toString();
            System.out.println("The Circle Id is: " + circleId);
            if (circleId != null) {
                tender.setCircle(circleId);
            }

            //Managing the Division Id
            divisionId = session.getAttribute("divisionId").toString();
            System.out.println("The Division Id is: " + divisionId);
            if (divisionId != null) {
                tender.setDivision(divisionId);
            }

            //Managing the Sub Division Id
            subDivisionId = session.getAttribute("subDivisionId").toString();
            System.out.println("The Division Id is: " + subDivisionId);
            if (subDivisionId != null) {
                tender.setSubDivision(subDivisionId);
            }

            //Managing Tender Master Details
            tenderMasterName = session.getAttribute("deptUserName").toString();
            System.out.println("The Department User name is: " + tenderMasterName);
            if (tenderMasterName != null) {
                tender.setTenderMaster(tenderMasterName);
            }

            //Managing Tender Master Id
            tenderMasterId = session.getAttribute("deptUserId").toString();
            System.out.println("The Department User name is: " + tenderMasterId);
            if (tenderMasterId != null) {
                tender.setTenderMasterId(tenderMasterId);
            }

            //Managing Department Name 
            departmentName = session.getAttribute("deptName").toString();
            System.out.println("The Department Name is: " + departmentName);
            if (departmentName != null) {
                tender.setDeptName(departmentName);
            }

//          //Fetch Previous tender which is already created and step is 8
//          if(tender.getTenderStatus().equalsIgnoreCase("Created") && tender_Id!=0){
//           previousTender = tenderDao.read(tender_Id);
//           if(previousTender!=null){
//            if(!previousTender.getTenderStage().trim().equalsIgnoreCase("0")){
//             tender.setTenderStage(previousTender.getTenderStage());   
//            }
//            if(!previousTender.getSelectiveTender().trim().equalsIgnoreCase("0")){
//             tender.setSelectiveTender(previousTender.getSelectiveTender());   
//            }
//            if(!previousTender.getEnvelopeType().trim().equalsIgnoreCase("0")){
//             tender.setEnvelopeType(previousTender.getEnvelopeType());   
//            }
//           }
//          }
            if (tender_Id != 0) {
                tender.setTender_Id(tender_Id);
            }

            //Managing the EMD Applicable drop down because its disabled status
            if (tender.getEmdApplicable() == null || !tender.getEmdApplicable().equalsIgnoreCase("2")) {
                tender.setEmdApplicable("1");
            }

            //Managing The EMD Applicable drop down for ITEW Wise
            if (tender.getEmdApplicable().equalsIgnoreCase("2")) {
                tender.setEmdInFig("");
                tender.setEmdInWords("");
                tender.setModeOfFeeForEMDApplicable("online");
            }

            //Managing signed PDF status
            if (tender.getSingedPDF() == null) {
                tender.setSingedPDF("yes");//while yes means the master uploaded the singed document
            }

            //Managing SOR Document And Buy Back Documents
            //If Category is Work and Service
            if (tender.getTenderCategory() != null) {
                if (tender.getTenderCategory().equalsIgnoreCase("1") || tender.getTenderCategory().equalsIgnoreCase("3")) {
                    System.out.println("/nThe Buy Back Document: " + tender.getBuyBackDocument());
                    //If SOR Document not checked as yes
                    if (tender.getBuyBackPolicy().equalsIgnoreCase("no")) {
                        System.out.println("/nThe Buy Back Policy: " + tender.getBuyBackPolicy());
                        tender.setBuyBackDocument(null);
                    }
                }
            }

            //If Category is Procurement
            if (tender.getTenderCategory().equalsIgnoreCase("2")) {
                tender.setSorDocument("0");
            }

//          //Managing the tender Status
//          if(tender.getTenderStage() == null){
//          tender.setTenderStatus("Created");
//          }
            //Managing The Envelope type on wizards Step Changing
//          if(tender.getEnvelopeType()!=null){
//              if(tender.getEnvelopeType().equalsIgnoreCase("1") || tender.getEnvelopeType().equalsIgnoreCase("2")){
//                 //Deleting Envelope B if user change there Envelope Type
//                 //Condition 3Envelope to 2Envelope
//                  System.out.println("The Envelope Delete On the basis of type");
//                 envelopeBDaoImpl.delete(tender.getTender_Id());
//              }
//          }
            //Managing the Contractor Class on the basis of Selective Tender
            if (tender.getSelectiveTender() != null) {
                if (tender.getSelectiveTender().equalsIgnoreCase("1")) {
                    tender.setContractorClass("4");
                } else if (tender.getSelectiveTender().equalsIgnoreCase("2")) {
                    tender.setContractorClass("6");
                } else if (tender.getSelectiveTender().equalsIgnoreCase("3")) {
                    System.out.println("The Selective tender is: " + tender.getContractorClass());
                } else if (tender.getSelectiveTender().equalsIgnoreCase("4")) {
                    tender.setContractorClass("6");
                } else if (tender.getSelectiveTender().equalsIgnoreCase("5")) {
                    tender.setContractorClass("5");
                }
            }

            //for tender call status
            tender.setTenderCallStatus("First");

            //tender step managing 
            tender.setWizardStep(step);

            //set teh tender notice value
            // tender.setTenderNotice(tenderNotice);
            //Managing the payament Mode for Tender Fee
            if (tender.getModeOfFeeForTenderFee() == null) {
                tender.setModeOfFeeForTenderFee("offline");
            }

            //Managing the payament Mode for EMD
            if (tender.getModeOfFeeForEMDApplicable() == null) {
                tender.setModeOfFeeForEMDApplicable("offline");
            }

            //Managing Tender Ammendement Privilege
            if (tender.getAmmendmentPrivilege() == null) {
                tender.setAmmendmentPrivilege("Not Allowed");
            }

            //Managing Tender Re-Bid 
            if (tender.getTenderRebid() == null) {
                tender.setTenderRebid("Not Allowed");
            }

            if (tender.getTenderBidWithdraw() == null) {
                tender.setTenderBidWithdraw("Not Allowed");
            }

            //Managing MSME/NSIC Exmeption
            if (tender.getMsmensicExemption() == null) {
                tender.setMsmensicExemption("Not Allowed");
            }

            //Managing SC/ST Exemption
            if (tender.getScstExemption() == null) {
                tender.setScstExemption("Not Allowed");
            }

            //Managing OBC Exemption
            if (tender.getObcExemption() == null) {
                tender.setObcExemption("Not Allowed");
            }

            //Managing Pre Bid Status
            if (tender.getPreBidMeetingStatus() == null) {
                tender.setPreBidMeetingStatus("no");
            }

            //Managing Pre Bid Date and Venue
            if (tender.getPreBidMeetingStatus().equalsIgnoreCase("no")) {
                tender.setPreBidMeetingVenue("");
                tender.setPreBidMeetingDate("");
            }

            if (keyDatesId > 0) {
                System.out.println("//The Key Date is:" + keyDatesId + "//");
                tender.getTenderKeyDates().setKeyDatesId(keyDatesId);
            }

            //Saving the Tender Key Dates
            if (step.equalsIgnoreCase("step7") || step.equalsIgnoreCase("step8")) {
                if (tender.getTenderKeyDates() != null) {
                    if (tender.getTenderStage().equalsIgnoreCase("2")) {
                        
                    }
                }
                String keyDateId = this.tenderKeyDatesSave(tender.getTenderKeyDates(), step, String.valueOf(tender_Id));
                System.out.println("The Key Date Id is: " + keyDateId);
                tender.getTenderKeyDates().setKeyDatesId(Integer.parseInt(keyDateId));
                keyDatesId = Integer.parseInt(keyDateId);
            }

            if (keyDatesId == 0) {
                tender.getTenderKeyDates().setKeyDatesId(0);
            }

            //Checked Whether the tender is approved 
            if (tender.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {
                previousTender = tenderDao.read(tender_Id);
                if (previousTender.getApprovalOfficer() != null) {
                    tender.setApprovalOfficer(previousTender.getApprovalOfficer());
                }
            }

            System.out.println("Selective Tenderer: " + tender.getSelectiveTender());

            //Saving Tender Data
            tender.setSorDocument("10");
            tenderDao.create(tender);
            System.out.println("TENDER CREATE IS");

            //Logs generation is here.........
            Logs logs = logsAction.generatingLogs(0, 0, 0, tender.getTender_Id(), "Tender Creation Process at " + step, 0, 0, "0", "", step + " Is begin to creating tender", "Tender Creation", "Tender Creation");
            if (logs != null) {
                logsActionDao.save(logs);
            }

            System.out.println("The Tender Id is: " + tender.getTender_Id());
            System.out.println("TENDER STAGE ID-:"+tender.getTenderStage());
            String s = tender.getTenderStage();
           
            session.setAttribute("tenderStage",s);
            Gson gson = new Gson();

            String response = gson.toJson(tender);
            gsonUtility.writeData(response);
            System.out.println("RESPONSE"+response);
           
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * tenderStatusManaging
  * Managing the tender status through this method
  * @param tenderStatus, tender_Id
  * @return redirect on other method
  * @created 18 Aug 2018
     */
    @RequestMapping("/tenderStatusManaging/{tenderStatus}/{tender_Id}")
    public String shas(@PathVariable("tenderStatus") String tenderStatus, @PathVariable("tender_Id") int tender_Id, HttpServletRequest request) {
        System.out.println("/::::::::::::::::::::::::::::::::::::::Tender Status Managing::::::::::::::::::::::/");
        System.out.println("The Tender Status is: " + tenderStatus + " \n Tender Id: " + tender_Id);
        try {
            tenderDao.tenderStatusCreate(tenderStatus, tender_Id);
            tenderStageDaoImpl.downloadpdf(tender_Id, request);
            Logs logs = logsAction.generatingLogs(0, 0, 0, tender_Id, "Tender is send for " + tenderStatus, 0, 0, "0", "", "Tender is send for the process of " + tenderStatus, "Tender Status changed", tenderStatus);
            if (logs != null) {
                logsAction.saveLogs(logs);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/eTendering";
    }

//  
//  
//  /*
//  * tenderNoticeSave 
//  * insert the tender Notice according tender_Id
//  * @param tenderNotice, tender_Id
//  * @return null
//  * @created 17 Aug 2018
//  * @version 2.0.0
//  */
//  @RequestMapping(value="/tenderNoticeSave", method = RequestMethod.POST)
//  @ResponseBody
//  public String tenderNoticeSave(String tenderNotice, String tender_Id){
//      System.out.println("/:::::::::::::::::::::::::::::::Tender Notice Create:::::::::::::::::::::::::::::::::/");
//      System.out.println("The Tender Notice is: "+tenderNotice+"\nTender Id is: "+tender_Id);
//      try{
//          tenderDao.tenderNoticeCreate(tenderNotice, Integer.parseInt(tender_Id));
//      }catch(Exception ex){
//          ex.printStackTrace();
//      }
//      return null;
//  }
    /*
  * tenderKeyDatesSave 
  * insert the tender Key Dates from the tender to database step by step
  * @param TenderKeyDates, step, tender_Id, keyDatesId
  * @return null
  * @created 15 June 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderKeyDates")
    @ResponseBody
    public String tenderKeyDatesSave(@ModelAttribute TenderKeyDates tenderKeyDates, @RequestParam("step") String step, @RequestParam("tender_Id") String tender_Id) {
        String keyDatesId = "0";
        System.out.println("/::::::::::::::::::::::::::::::::::Tender Key Dates:::::::::::::::::::::::::::::::/");
        System.out.println("1:- Tender Release Date: " + tenderKeyDates.getTenderReleaseDate() + "\n2:- Tender Purchase Date: "
                + tenderKeyDates.getTenderPurchaseDate() + "\n3:- Bid Submission Date: " + tenderKeyDates.getBidSubmissionDate()
                + "\n4:- Opening EA: " + tenderKeyDates.getOpeningEA() + "\n5:- Opening EB: " + tenderKeyDates.getOpeningEB() + "\n6:- Opening EC: " + tenderKeyDates.getOpeningEC() + "\n7:- Step: " + step + "\n8:- Tender Id: " + tender_Id
                + "\n9:- Tender Id in key Date Object: " + tenderKeyDates.getTender_Id() + "\n10:- Tender Key Dates Id: " + keyDatesId);

        try {
            //Mentioning tender Id in tender Key dates   
            if (tender_Id != null) {
                tenderKeyDates.setTender_Id(tender_Id);
            }

            //Managing key dates Id for updating key dates
//       keyDatesId = keyDatesId.substring(keyDatesId.lastIndexOf(',') + 1);
//          System.out.println("The Key Dates are: "+keyDatesId);
//       if(!keyDatesId.equalsIgnoreCase("0")){
//          tenderKeyDates.setKeyDatesId(Integer.parseInt(keyDatesId));
//       }else{
//          tenderKeyDates.setKeyDatesId(Integer.parseInt(keyDatesId)); 
//       }
            // tenderKeyDates.setKeyDatesId(Integer.parseInt(keyDatesId)); 
            //Managing EC Opening after techincal bid
            if (tenderKeyDates.getOpeningECaftertechopening() == null) {
                tenderKeyDates.setOpeningECaftertechopening("no");
            }

            tenderKeyDatesDao.create(tenderKeyDates);

            //getting tender key date Id for resending in wizard
            if (keyDatesId != null) {
                keyDatesId = String.valueOf(tenderKeyDates.getKeyDatesId());

                System.out.println("The Key Dates after Update or save: " + keyDatesId);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return keyDatesId;
    }

    /*
  * tenderBuyBackDocument 
  * insert the buy back document details from the tender to database separately
  * @param tender_Id, BuyBackDocument 
  * @return null
  * @created 22 June 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderBuyBackDocument")
    @ResponseBody
    public String tenderBuyBackDocument(@RequestParam("file") MultipartFile file, @RequestParam String tender_Id, HttpSession session) {
        System.out.println("/:::::::::::::::::::::::::::::Buy Back Document Upload:::::::::::::::::::::::/");
        System.out.println("1:-The Buy Back File is: " + file.getOriginalFilename() + "\n2:-Tender Id is: " + tender_Id);
        String fileconvertedName = null;
        try {
            if (tender_Id != null) {
                fileconvertedName = fileUtility.fileUploadingUtil(file, FileUtility.UPLOAD_BUYBACKDIRECTORY);
                System.out.println("The File status is: " + fileconvertedName);
                tenderDao.buyBackDocumentCreate(fileconvertedName, Integer.parseInt(tender_Id));
                gsonUtility.responseData(fileconvertedName);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return fileconvertedName;
    }

    /*
  * tenderDocumentUpload 
  * insert the document of tender from the tender to database separately
  * @param tender_Id, documentName, File array 
  * @return null
  * @created 28 June 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderDocument")
    @ResponseBody
    public String tenderDocumentUpload(@RequestParam("file") MultipartFile[] files,
            @RequestParam("documentName") String documentName, String tender_Id,
            HttpSession session, TenderDocument tenderDocument) {
        System.out.println("/::::::::::::::::::::::::::::::::::Tender Document Upload:::::::::::::::::::::::::::::::/");
        System.out.println("1:-tender_Id : " + tender_Id + "\n2:-Document Name: " + tenderDocument + "\n3:-Tender Document Id: "
                + tenderDocument.getDoc_Id());
        String fileconvertedName = null;
        String response = null;
        try {
            for (int i = 0; i < files.length; i++) {
                tenderDocument.setDoc_Name(documentName);
                MultipartFile file = files[i];
                fileconvertedName = fileUtility.fileUploadingUtil(file, FileUtility.UPLOAD_TENDERDOCUMENTDIRECTORY);
                tenderDocument.setDept_id("0");
                tenderDocument.setDoc_Converted_Name(fileconvertedName);
                tenderDocument.setDoc_OrignalName(file.getOriginalFilename());
                tenderDocument.setTender_id(tender_Id);
                tenderDocument.setTender_no(tender_Id);
            }
            if (tenderDocument != null) {
                documentDao.createTenderDocument(tenderDocument);
                Gson gson = new Gson();
                response = gson.toJson(tenderDocument);
                gsonUtility.writeData(response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
  * removeTenderDocument 
  * remove tender document by document sequence and tender Id
  * @param tender_Id, docSequnceId 
  * @return null
  * @created 2 July 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderDocumentRemove")
    @ResponseBody
    public String removeTenderDocument(@RequestParam("tender_Id") String tender_Id, @RequestParam("docSequnceId") int docSequnceId, HttpSession session) {
        System.out.println("/::::::::::::::::::::::::::::::Tender Document Remove:::::::::::::::::::::::::::::::/");
        System.out.println("1:-Tender Id: " + tender_Id + "\n2:-Document Id: " + docSequnceId);
        TenderDocument tenderDocument = null;
        try {
            tenderDocument = documentDao.fetchTenderDocumentByTenderIdAndDocSeq(Integer.parseInt(tender_Id), docSequnceId);
            System.out.println("The Tender Document is: " + tenderDocument.getDoc_Converted_Name());
            ServletContext context = session.getServletContext();
            String path = context.getRealPath(UPLOAD_DIRECTORY);
            System.out.println("Path of the file is:" + path);
            File file = new File(path + File.separator + tenderDocument.getDoc_Converted_Name());
            boolean fileDeleted = file.delete();
            System.out.println("The Document are deleted: " + fileDeleted);
            documentDao.deleteTenderDocumentByTenderIdAndDocSeq(Integer.parseInt(tender_Id), docSequnceId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * removeAllTenderDocument
  * remove Tender Document by tender Id
  * @param tender_Id
  * @return String
     */
    @RequestMapping("/removeAllTenderDocument")
    @ResponseBody
    public String removeAllTenderDocument(@RequestParam String tender_Id) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::::Removing all tender Document:::::::::::::::/");
        System.out.println("Tender Id to remove: " + tender_Id);
        try {
            documentDao.deleteTenderDocumentByTenderId(Integer.parseInt(tender_Id));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * documentAfterPurchaseTenderStageDao 
  * Mention the document Status for purchase
  * @param documentVisibility, tender_Id, docSequnceId
  * @return null
  * @created 24 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/documentAfterPurchase")
    @ResponseBody
    public String documentAfterPurchase(@RequestParam String documentVisibility, int tender_Id, int docSequnceId) {
        System.out.println("/::::::::::::::::::::::::::::Document After Purchase::::::::::::::::::::::::::::::/");
        System.out.println("The Tender id: " + tender_Id + " After Purchase: " + documentVisibility
                + "Document Sequnce Id: " + docSequnceId);
        try {
            documentDao.updateTenderDocumentStatus(tender_Id, documentVisibility, docSequnceId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * viewCreatedTenderDetails 
  * fetch the tender information by tender_Id
  * @param tender_Id 
  * @return null
  * @created 7 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping(value = {
        "/viewCreatedTenderDetails",
        "/viewAmendedTenderDetails"
    })
    public ModelAndView viewCreatedTenderDetails(@RequestParam("tender_Id") String tender_Id, @ModelAttribute Tender tender, TenderKeyDates tenderKeyDates, Model model, HttpSession session) throws Exception {
        System.out.println("/:::::::::::111111::::::::::::::::::::Showing the created tender details:::::::::::::::::::::::/");
        TenderStage tenderStages;
        SelectiveTender selectiveTenders;
        TenderCategory tenderCategory;
        EnvelopeType envelopeType;
        TypeOfTenders typeOfTenders;
        AreaOfWork areaOfWork;
        UploadSOR uploadSOR;
        ContractorClass contractorClass;
        List<TenderDocument> tenderDocuments = new ArrayList<>();
        List<TenderKeyDates> tenderKeyDateses = new ArrayList<>();
        List<TenderKeyword> addKeywordsList = new ArrayList<>();
        List<TenderKeyword> addKeywordses = new ArrayList<>();
        List<Contractor> empanelContractorList = new ArrayList<>();
        Tender tender1 = null;
        List<TenderAmendment> tenderAmendment = new ArrayList<>();
        List<TenderDocumentAmendment> tenderDocumentAmendments = new ArrayList<>();
        List<TenderKeyDatesAmendment> tenderKeyDatesAmendments = new ArrayList<>();
        TenderSubmittedEnvelopeA submittedEnvelopeA = null;
        TenderSubmittedEnvelopeB submittedEnvelopeB = null;
        TenderSubmittedEnvelopeC submittedEnvelopeC = null;
        TenderSubmittedQCBS submittedQCBS = null;
        List<DepartmentUser> departmentUsersA = new ArrayList<>();
        List<DepartmentUser> departmentUsersB = new ArrayList<>();
        List<DepartmentUser> departmentUsersC = new ArrayList<>();
        List<DepartmentUser> ammendmentOfficerList = new ArrayList<>();
        List<DepartmentUser> approvalOfficerList = new ArrayList<>();
        List<TenderKeyDatesAmendment> keyDatesAmendments = new ArrayList<>();
        ModelAndView modelAndView = new ModelAndView();
        Integer deptId = 0;
          String biddingstartdate = "";
        String biddingenddate = "";
        boolean results=false;
         SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        try {
            if (session.getAttribute("deptId") != null) {
                
                deptId = Integer.parseInt(session.getAttribute("deptId").toString());

                System.out.println("The Tender Id is: " + tender.getTender_Id());
                System.out.println("The Tender Id Request Param is: " + tender_Id);
                
                //Fetch the details for the wizard
                this.wizardDataFetching(model, session);

                //Fetch the tender detail by tender Id.
                tender1 = tenderDao.read(tender.getTender_Id());

                //Removing Temporary Document By tender_Id
                if (tender1.getTenderStatus().equalsIgnoreCase("Approved") || tender1.getTenderStatus().equalsIgnoreCase("Amended")) {
                    tenderTemporaryAmendDocumentDao.deleteTenderTemporaryDocument(tender1.getTender_Id());
                    System.out.println("The Temporary Document Delete Successfully");
                }

                System.out.println("The Tender Source is: " + tender1);
                System.out.println("Fetching the details from Tender");
                //Copy the object into another object
                BeanUtils.copyProperties(tender1, tender);
                System.out.println("The Tender Target is: " + tender.getTenderStatus());

                if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                    System.out.println("Fetching the details from TenderAmendment");
                    tenderAmendment = tenderAmendmentDao.readAll(Integer.parseInt(tender_Id));
                    //Copy the object into another object
                    tenderAmendment.forEach((amendment) -> {
                        BeanUtils.copyProperties(amendment, tender);
                    });
                }

                if (tender.getTenderStage() != null) {
                    //Fetch the name of Tender Stage by tender Stage Id.
                    System.out.println("The Tender Stage is: " + tender.getTenderStage());
                    tenderStages = (TenderStage) this.tenderStage.fetchData(Integer.parseInt(tender.getTenderStage()));
                    if (tenderStages != null) {
                        System.out.println("The Tender Stage is: " + tenderStages.getTenderStage_Name());
                        tender.setTenderStageName(tenderStages.getTenderStage_Name());
                    }
                }

                if (tender.getSelectiveTender() != null) {
                    //Fetch the name of Selective Tender by Selective tender Id.
                    selectiveTenders = (SelectiveTender) this.selectiveTender.fetchData(Integer.parseInt(tender.getSelectiveTender()));
                    System.out.println("The Selective Tender is: " + selectiveTenders.getSelectivetender_Name());
                    tender.setSelectiveTenderName(selectiveTenders.getSelectivetender_Name());
                }

                if (tender.getEnvelopeType() != null) {
                    //Fetch the name of Envelope Type by Envelope Type Id.
                    envelopeType = (EnvelopeType) this.envelopeTypeDao.fetchData(Integer.parseInt(tender.getEnvelopeType()));
                    System.out.println("The Envelope Type is: " + envelopeType.getEnvelopeType_Name());
                    tender.setEnvelopeTypeName(envelopeType.getEnvelopeType_Name());
                }
                if(tender.getTender_Id()!=null){
                   tender1=tenderDao.read(Integer.parseInt(tender_Id));
                    System.out.println("TENDER ID DDDDDD"+tender1.getEnvelopeType());
                    tender.setEnvelopeType(tender1.getEnvelopeType());
                }

                if (tender.getTypeOfTender() != null) {
                    //Fetch the name of Type Of Tender by Type Of Tender Id.
                    typeOfTenders = (TypeOfTenders) this.typeofTendersDao.fetchData(Integer.parseInt(tender.getTypeOfTender()));
                    System.out.println("The Type Of Tender is: " + typeOfTenders.getTypeOfTenders_Name());
                    tender.setTypeOfTenderName(typeOfTenders.getTypeOfTenders_Name());
                }

                if (tender.getTenderCategory() != null) {
                    //Fetch the name of Tender Category by tender category Id.
                    tenderCategory = (TenderCategory) this.categoryDAO.fetchData(Integer.parseInt(tender.getTenderCategory()));
                    System.out.println("The Tender Category is: " + tenderCategory.getTender_category_name());
                    tender.setTenderCategoryName(tenderCategory.getTender_category_name());
                }

                if (tender.getAreaOfWork() != null) {
                    //Fetch the name of Area of Work by area of work Id.
                    System.err.println(tender.getAreaOfWork() + "ENTER IS ");
                    System.err.println(tender.getAreaOfWork() + "ENTER IS agya he sdata  ");
                    areaOfWork = this.areaOfWorkDAO.fetchData(Integer.parseInt(tender.getAreaOfWork()));
                    System.out.println("The Area Of Work is: " + areaOfWork.getAreaofwork_name());
                    tender.setAreaOfWorkName(areaOfWork.getAreaofwork_name());
                }
          
                if (tender.getTenderKeywords() != null) {
                    //Fetch the name of tender keywords by keywords Id.
               
                    addKeywordsList = this.addKeywordDAO.fetchAll();
                    String[] keywordsArray = tender.getTenderKeywords().split(",");
                     System.out.println("3333333333");
                    for (String keyword : keywordsArray) {
                        System.out.println("The keyword id are: " + keyword);
                        Iterator<TenderKeyword> iterator = addKeywordsList.iterator();
                        while (iterator.hasNext()) {
                            TenderKeyword addKeywords = iterator.next();
                            System.out.println("The total keywords id are: " + addKeywords.getTenderKeyWordsId());
                            if (Integer.parseInt(keyword) == addKeywords.getTenderKeyWordsId()) {
                                System.out.println("The contains keywords are: " + addKeywords.getTenderKeyWordsName());
                                addKeywordses.add(addKeywords);
                            }
                        }
                    }
                    tender.setTenderKeywordsNameList(addKeywordses);
                    System.out.println("Tender Keywords List: " + tender.getTenderKeywordsNameList().size());
                }

                if (tender.getSelectiveTender() != null) {
                    if (tender.getSelectiveTender().equalsIgnoreCase("2") || tender.getSelectiveTender().equalsIgnoreCase("4")) {
                        System.out.println("The Empanel Contractor are: " + tender.getEmpanelContrators());
                        //List<Contractor> contractors = new ArrayList<>();
                        if (tender.getEmpanelContrators() != null) {
                            String contractor[] = tender.getEmpanelContrators().split(",");
                            for (String cont : contractor) {
                                Contractor c = new Contractor();
                                c = (Contractor) contractorDao.fetchData(Integer.parseInt(cont));
                                System.out.println("The Contractor Details is: " + c);
                                empanelContractorList.add(c);
                            }
                            System.out.println("The Empanel Contractor List size are: " + empanelContractorList.size());
                            tender.setEmpanelContractorList(empanelContractorList);
                        }
                    }
                }

                if (tender.getSorDocument() != null) {
                    if (!tender.getSorDocument().equalsIgnoreCase("notApplicable")) {
                        //Fetch the Sor Document Details according to tender Id. 
                        System.out.println("The SOR Documents: " + tender.getSorDocument());
                        List<UploadSOR> uploadSORsList = new ArrayList<>();
                        String uploadSORDoc[] = tender.getSorDocument().trim().split(",");
                        for (String uploadSORs : uploadSORDoc) {
                            System.out.println("The Officer Id is: " + uploadSORs);
                            UploadSOR uploadSOR1 = new UploadSOR();
                            uploadSOR1 = this.uploadSorDao.fecthSORDocumentByIdDeptIdAndStatus(Integer.parseInt(uploadSORs), deptId, "true");

                            uploadSORsList.add(uploadSOR1);
                        }
                        tender.setUploadSorList(uploadSORsList);
                    }
                }

                if (tender.getBuyBackPolicy() != null) {
                    System.out.println("The Buy Back Document are: " + tender.getBuyBackDocument());
                }

                if (tender.getEmdApplicable() != null) {
                    //Fetch the EMD Applicable Details according EMD Applicable Id.
                    String emdApplicable = tender.getEmdApplicable();
                    if (emdApplicable.equalsIgnoreCase("1")) {
                        emdApplicable = "Tender Wise";
                        System.out.println("Set as Tender Wise");
                    }
                    if (emdApplicable.equalsIgnoreCase("2")) {
                        emdApplicable = "Item Wise";
                        System.out.println("Set as Item Wise");
                    }
                    System.out.println("The EMD Applicable on: " + emdApplicable);
                    tender.setEmdApplicableName(emdApplicable);
                }

                if (tender.getContractorClass() != null) {
                    if (!tender.getContractorClass().equalsIgnoreCase("0")) {
                        //Fetch the contractor Class name by contractor Class Id.
                        System.out.println("The Contractor Class value is: " + tender.getContractorClass());
                        contractorClass = (ContractorClass) this.contractorClassDao.fetchData(Integer.parseInt(tender.getContractorClass()));
                        if (contractorClass.getContractorClass_Name() != null) {
                            System.out.println("The Contractor Class is: " + contractorClass.getContractorClass_Name());
                            tender.setContractorClassName(contractorClass.getContractorClass_Name());
                        }
                    } else {
                        tender.setContractorClassName("Select");
                        model.addAttribute("contractorClassMessage", "Please Update Contractor Class");
                    }
                }

                if (tender.getBidValidateType() != null) {
                    //Set the value in Bid Validate Type
                    String bidValidateType = tender.getBidValidateType();
                    if (bidValidateType.equalsIgnoreCase("1")) {
                        bidValidateType = "Days";
                    }
                    if (bidValidateType.equalsIgnoreCase("2")) {
                        bidValidateType = "Month";
                    }
                    tender.setBidValidateType(bidValidateType);
                }

                if (tender.getWorkCompletionType() != null) {
                    //Set the value in Bid Validate Type
                    String workCompletionType = tender.getWorkCompletionType();
                    if (workCompletionType.equalsIgnoreCase("1")) {
                        workCompletionType = "Days";
                    }
                    if (workCompletionType.equalsIgnoreCase("2")) {
                        workCompletionType = "Month";
                    }
                    tender.setWorkCompletionType(workCompletionType);
                }

                if (tender.getTenderSelectedDivision() != null || tender.getTenderSelectedSubDivision() != null) {
                    if (!tender.getTenderSelectedDivision().equalsIgnoreCase("0") || !tender.getTenderSelectedSubDivision().equalsIgnoreCase("0")) {
                        String division = null;
                        String subDivision = null;
                        division = divisionDAO.divisionName(Integer.parseInt(tender.getTenderSelectedDivision()));
                        tender.setTenderSelectedDivision(division);
                        subDivision = subDivisionDAO.subDivisionName(Integer.parseInt(tender.getTenderSelectedSubDivision()));
                        tender.setTenderSelectedSubDivision(subDivision);
                    }
                }

                //Fetch the officer of ammendment privilege
                if (tender.getAmmendmentPrivilege().equalsIgnoreCase("Allowed") || tender.getAmmendmentPrivilegeOfficer() != null) {
                    String officer[] = tender.getAmmendmentPrivilegeOfficer().trim().split(",");
                    for (String officerId : officer) {
                        System.out.println("The Officer Id is: " + officerId);
                        DepartmentUser officerName = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerId));
                        ammendmentOfficerList.add(officerName);
                    }
                    tender.setAmmendmentPrivilegeOfficerList(ammendmentOfficerList);
                }

//                System.out.println("The Tender Status is : " + tender.getTenderStatus());
                //If the Tender in Amended & Approved state then it move on
                //ViewProcessForAmmendTender Page
                if (tender.getTenderStatus().equalsIgnoreCase("Amended") || tender.getTenderStatus().equalsIgnoreCase("Approved")) {
                    System.out.println("///Moving towards the DepartmentUser/ViewAmendedTenderDetailsTemplate///");
                    modelAndView.setViewName("DepartmentUser/ViewProcessForAmmendTender");
                }

                //If the Tender in Created & Sent For Approval state then it move on
                //ViewTenderDetail Page
                if (tender.getTenderStatus().equalsIgnoreCase("Created") || tender.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {
                    System.out.println("///Moving towards the DepartmentUser/ViewTenderDetails///");
                    
                    modelAndView.setViewName("DepartmentUser/ViewTenderDetail");
                    
                    TenderKeyDates date=tenderKeyDatesDao.readKeyDate(Integer.parseInt(tender_Id));
                    System.out.println("TENDER KEY DATES"+date.getTenderPurchaseDate());
                     biddingstartdate=date.getTenderPurchaseDate().trim().split("/")[0];
         biddingenddate=date.getTenderPurchaseDate().trim().split("/")[1];
         
         System.out.println("TENDER KEY DATES"+" "+biddingstartdate+" "+biddingenddate);
         
         Date date1 = new Date(biddingstartdate);

         Date date2 = new Date(biddingenddate);
         
                  System.out.println("Start date: " + date1 + "End Date: " + date2);
                  
 if (sdf.parse(sdf.format(new Date())).getTime() >= date1.getTime()
         && sdf.parse(sdf.format(new Date())).getTime() <= date2.getTime()) {
                        System.out.println("DATE IS TRUE");
                      results=true;
                }
 else{
     System.out.println("FALSEEE");
      results=false;
 }
                }
                //This model having the data realated to Tender Details
                model.addAttribute("tender", tender);
//                model.addAttribute("result",results);
                //Fetch the Data For the Tender Documents by tender Id.
                if (tender.getTenderStatus().equalsIgnoreCase("Approved") || tender.getTenderStatus().equalsIgnoreCase("Created") || tender.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {
                    tenderDocuments = documentDao.fetchTenderDocumentByTenderId(tender.getTender_Id());
                    System.out.println("The Tender Document are: " + tenderDocuments.size());
                    if (!tenderDocuments.isEmpty()) {
                        model.addAttribute("tenderDocument", tenderDocuments);
                    }
                }

                System.out.println("The Status of tender is: " + tender.getTenderStatus());

                //Fetch Tender Document from Ammnedment Table if tender is ammnedment
                if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                    tenderDocumentAmendments = documentAmendmentDao.fetchTenderDocumentByTenderId(Integer.parseInt(tender_Id));
                    System.out.println("The Ammendment Documents are: " + tenderDocumentAmendments.size());
                    if (!tenderDocumentAmendments.isEmpty()) {
                        model.addAttribute("tenderDocument", tenderDocumentAmendments);
                    }

                    if (!tenderDocumentAmendments.isEmpty()) {
                        for (TenderDocumentAmendment amendedDocuments : tenderDocumentAmendments) {
                            TenderDocument td = new TenderDocument();
                            BeanUtils.copyProperties(amendedDocuments, td);
                            tenderDocuments.add(td);
                        }
                        if (!tenderDocuments.isEmpty()) {
                            model.addAttribute("tenderDocument", tenderDocuments);
                        }
                    }

                }

                //Fetch Tender Key Dates By tender Id.
                tenderKeyDateses = tenderKeyDatesDao.readAllKeyDates(tender.getTender_Id());
                System.out.println("The Tender Key Dates are:" + tenderKeyDateses.size());
               
                if (!tenderKeyDateses.isEmpty()) {
                    String s="Ammendment";
                  
                    model.addAttribute("tenderKeyDateses", tenderKeyDateses);
                    model.addAttribute("Ammendment",s);
                }

                //Fetch the Tender Key Dates if tender is amended
                if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                    tenderKeyDatesAmendments = tenderAmendmentKeyDatesDao.readAllKeyDates(Integer.parseInt(tender_Id));
                    System.out.println("The Tender Amended KeyDates are: " + tenderKeyDatesAmendments.size());
                    if (!tenderKeyDatesAmendments.isEmpty()) {
                        //putting the last object into list to show the tenderAmendedKeyDates
                        keyDatesAmendments.add(tenderKeyDatesAmendments.get(tenderKeyDatesAmendments.size() - 1));
                        model.addAttribute("tenderKeyDateses", keyDatesAmendments);
                    }
                }

                System.out.println("The Tender Id to check again for Envelope Process: " + tender_Id);

                //Fetch the Envelope A Details
                submittedEnvelopeA = envelopeADaoImpl.read(tender.getTender_Id());
                System.out.println("The Envelope A Details: " + submittedEnvelopeA);
                // System.out.println("The Envelope A officers are: " + submittedEnvelopeA.getEnvelopeAOfficers());
                //Fetch the list of officer for Envelope A
                if (submittedEnvelopeA != null) {
                    if (submittedEnvelopeA.getEnvelopeAOfficers() != null) {
                        List<String> result2 = Arrays.asList(submittedEnvelopeA.getEnvelopeAOfficers().trim().split(","));
                        if (!result2.isEmpty()) {
                            result2.stream().forEach((officerA) -> {
                                System.out.println("The Envelope A Officer are: " + officerA);
                                DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerA));
                                departmentUsersA.add(departmentUser);
                            });
                        }
                        model.addAttribute("departmentUserEnvelopeA", departmentUsersA);
                        model.addAttribute("submittedEnvelopeA", submittedEnvelopeA);
                    }
                }

                if (tender.getEnvelopeType().equalsIgnoreCase("3")) {
                    //Fetch the Envlope B Details
                    submittedEnvelopeB = envelopeBDaoImpl.read(tender.getTender_Id());
                    System.out.println("The Envelope B Details: " + submittedEnvelopeB);
//                    System.out.println("The Envelope B officers are: " + submittedEnvelopeB.getEnvelopeBOfficers());
                    //Fetch the list of officer for Envelope B
                    if (submittedEnvelopeB != null) {
                        if (submittedEnvelopeB.getEnvelopeBOfficers() != null) {
                            List<String> result2 = Arrays.asList(submittedEnvelopeB.getEnvelopeBOfficers().trim().split(","));
                            if (!result2.isEmpty()) {
                                result2.stream().forEach((officerB) -> {
                                    System.out.println("The Envelope B Officer are: " + officerB);
                                    DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerB));
                                    departmentUsersB.add(departmentUser);
                                });
                            }
                            model.addAttribute("departmentUserEnvelopeB", departmentUsersB);
                            model.addAttribute("submittedEnvelopeB", submittedEnvelopeB);
                        }
                    }
                }

                if (tender.getEnvelopeType().equalsIgnoreCase("4")) {
                    //Fetch the Envlope B Details For QCBS
                    submittedQCBS = this.submittedQCBS.read(tender.getTender_Id());
//                    System.out.println("The QCBS officer are: " + submittedQCBS.getQCBSOfficers());
                    if (submittedQCBS != null) {
                        if (submittedQCBS.getQCBSOfficers() != null) {
                            List<String> result2 = Arrays.asList(submittedQCBS.getQCBSOfficers().split(","));
                            if (!result2.isEmpty()) {
                                result2.stream().forEach((officerB) -> {
                                    System.out.println("The Envelope B QCBS Officer are: " + officerB);
                                    DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerB));
                                    departmentUsersB.add(departmentUser);
                                });
                            }
                            model.addAttribute("departmentUserEnvelopeB", departmentUsersB);
                            model.addAttribute("submittedEnvelopeB", submittedQCBS);
                        }
                    }
                }

                submittedEnvelopeC = envelopeCDaoImpl.read(tender.getTender_Id());
                if (submittedEnvelopeC != null) {
                    System.out.println("The Submitted Officer are: " + submittedEnvelopeC.getEnvelopeCOfficers());
                    if (submittedEnvelopeC.getEnvelopeCOfficers() != null) {
                        List<String> result = Arrays.asList(submittedEnvelopeC.getEnvelopeCOfficers().trim().split(","));

                        result.forEach((officerC) -> {
                            System.out.println("The Officer are: " + officerC);
                            DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerC));
                            departmentUsersC.add(departmentUser);

                        });
                    }
                    model.addAttribute("departmentUserEnvelopeC", departmentUsersC);
                    model.addAttribute("submittedEnvelopeC", submittedEnvelopeC);
                }

                List<Object> approvalAuthority = this.showApprovalPrivilegeOfficer(deptId);
                System.out.println("The Total Approval Authority are: " + approvalAuthority.size());
                model.addAttribute("approvalAuthority", approvalAuthority);

                //Fetch the approval authority selected in tender
                if (tender.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {
                    if (tender.getApprovalOfficer() != null) {
                        List<String> approvalAuthoritys = Arrays.asList(tender.getApprovalOfficer().replaceAll("\\s", "").split(","));
                        approvalAuthoritys.forEach(new Consumer<String>() {

                            public void accept(String officerAre) {
                                DepartmentUser departmentUser = new DepartmentUser();
                                Designation designation = new Designation();
                                System.out.println("The Officer Are for Approval is: " + officerAre);
                                departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerAre));
                                approvalOfficerList.add(departmentUser);
                            }
                        });
                    }
                    model.addAttribute("approvalAuthority", approvalOfficerList);
                }
             }
                else {
                System.out.println("\\The Session Time Out\\");
                session.invalidate();
                modelAndView.setViewName("redirect:/");
                }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return modelAndView;
    }

    /*
    * fetchingAppovalAuthority
    * Method Call to fetch all department User by Tender Release And Ammendment Privileges
    * 10 Oct 2018
     */
    public List showApprovalPrivilegeOfficer(Integer deptId) {
        System.out.println("/:::::::::::::::Method call to fetch the Approval Officer:::::::::::::::::/");
        List<DepartmentUser> departmentUsers = new ArrayList<>();
        List<DepartmentSecondaryUser> departmentSecondaryUsers = new ArrayList<>();
        List<Object> list = new LinkedList<>();
        try {
            System.out.println("The Department Is: " + deptId);
            if (deptId != 0) {
                departmentUsers = departmentUserDaoImpl.userOfTenderApproval(deptId, "Enable");
                System.out.println("The Department User are from Primary table: " + departmentUsers.size());
                departmentSecondaryUsers = DepartmentSecondaryUserDao.userOfTenderApproval(deptId, "Enable");
                System.out.println("The Department User are from Secondary table: " + departmentSecondaryUsers.size());
                for (DepartmentUser departmentUser : departmentUsers) {
                    list.add(departmentUser);
                }
                for (DepartmentSecondaryUser departmentSecondaryUser : departmentSecondaryUsers) {
                    list.add(departmentSecondaryUser);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    @RequestMapping("/sentForApprovalProcess")
    public String sentForApprovalProcess(@ModelAttribute("tender") Tender tender, HttpSession session) {
        System.out.println("/::::::::::::::::::::::::The Sent For Approval Process::::::::::::::::::::/");
        System.out.println("The Approval Officer are: " + tender.getApprovalOfficer() + "\n Tender Id: " + tender.getTender_Id());
        SimpleMailMessage email = new SimpleMailMessage();
        try {
            Integer deptId = (Integer) session.getAttribute("deptId");
            if (deptId != null) {
                int tender_Id = tenderDao.updateApprovalOfficers(tender.getApprovalOfficer(), tender.getTender_Id());
                if (tender_Id != 0) {
                    String[] officerForApproval = tender.getApprovalOfficer().split(",");
//           for(String off:officerForApproval){
//               System.out.println("Get Department User to send the mail");
//                DepartmentUser departmentUser = new DepartmentUser();
//                departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(off), deptId);
//                System.out.println("The Department User is :"+departmentUser.getFirstName()+" "+departmentUser.getLastName());
////                email.setTo(departmentUser.getEmailAdd());
////                //email.setFrom(SendEmail.emailFromRecipient);
////                email.setSubject("Selected as Approval Authority");
////                email.setText("Respected Sir, "
////                        + "This is kindly inform you that you has been selected as the Approval Authority for the tender No."+tender.getTenderNumber());
////                //mailSender.send(email);
//           }
                }
                System.out.println("The Tender Id: " + tender.getTender_Id());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/tenderStatusManaging/Sent For Approval/" + tender.getTender_Id();
    }

    /*
  * fetchTenderData 
  * fetch the tender information by tender_Id for ajax
  * @param tender_Id 
  * @return null
  * @created 10 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/fetchTenderData")
    @ResponseBody
    public String fetchTenderData(@RequestParam("tender_Id") String tender_Id, Tender tender, TenderKeyDates tenderKeyDates, HttpSession session
    ) {
        System.out.println("/:::::::::::::::::::::Fetch the Tender details by tender Id::::::::::::::::::/");
        System.out.println("The Tender_id: " + tender_Id);
        String response = "fetchTenderData";
        List<TenderKeyword> keywords = new ArrayList<>();
        try {
            if (session.getAttribute("deptId") != null) {
                tender = tenderDao.read(Integer.parseInt(tender_Id));
                System.out.println("The Tender Details is: " + tender.getTenderKeywords());
                if (tender.getTenderKeywords() != null) {
                    String[] keyWords = tender.getTenderKeywords().split(",");
                    for (String key : keyWords) {
                        TenderKeyword word = null;
                        System.out.println("The Key word Id is: " + key);
                        word = addKeywordDAO.read(Integer.parseInt(key.trim()));
                        keywords.add(word);
                        System.out.println("The Tender Keywords:" + word.getTenderKeyWordsName());
                    }
                    tender.setTenderKeywordsNameList(keywords);
                }
                tenderKeyDates = tenderKeyDatesDao.readKeyDate(Integer.parseInt(tender_Id));
                System.out.println("The Tender Key Date size is: " + tenderKeyDates);
                tender.setTenderKeyDates(tenderKeyDates);

                //Fetch The Envelope on the basis of tender_Id
                Gson gson = new Gson();
                response = gson.toJson(tender);
                gsonUtility.writeData(response);
            } else {
                session.invalidate();
                System.out.println("Session Time Out");
                return "redirect:/";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    @RequestMapping("/fetchTenderDocumentData")
    @ResponseBody
    public String fetchTenderDocumentData(@RequestParam("tender_Id") String tender_Id) {
        System.out.println("/:::::::::::::::::::::Fetch the Tender Document details by tender Id::::::::::::::::::/");
        List<TenderDocument> tenderDocument = new ArrayList<>();
        String response = null;
        System.out.println("The Tender Id is: " + tender_Id);
        try {
            tenderDocument = documentDao.fetchTenderDocumentByTenderId(Integer.parseInt(tender_Id));
            System.out.println("The Tender Document List size: " + tenderDocument.size());
            Gson gson = new Gson();
            response = gson.toJson(tenderDocument);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

//  @RequestMapping("/fetchTenderKeyDateData")
//  @ResponseBody
//  public String fetchTenderKeyDateData(@RequestParam("tender_Id") String tender_Id, TenderKeyDates tenderKeyDates){
//     System.out.println("/:::::::::::::::::::::Fetch the Tender Key Date details by tender Id::::::::::::::::::/");
//     String response = null;
//     try{
//        tenderKeyDates = tenderKeyDatesDao.readKeyDate(Integer.parseInt(tender_Id));
//        System.out.println("The Tender Key Date size is: "+tenderKeyDates);
//        Gson gson = new Gson();
//        response = gson.toJson(tenderKeyDates);
//        gsonUtility.writeData(response);
//     }catch(Exception ex){
//         ex.printStackTrace();
//     }
//     return response;
//  }
    /*
  * saveEnvelopeA 
  * Method call to save the user information in Envelope A
  * @param TenderEnvelopeA, envelopeATemplateName 
  * @return null
  * @created 27 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/saveEnvelopeA")
    @ResponseBody
    public int saveEnvelopeA(@ModelAttribute TenderEnvelopeA envelopeA, String envelopeATemplateName, int tender_Id, TenderEnvelopeANames envelopeANames) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::::Save Envelope A:::::::::::::::::::::::::::/");
        System.out.println("The Template Name: " + envelopeATemplateName + "\n Envelope A Name: " + envelopeA.getLabelNameAList()
                + "\nEnvelope A Type: " + envelopeA.getLabelTypeAList() + " \n Envelope A Mandatory: " + envelopeA.getLabelMandatoryAList()
                + "\nEnvelope A Id: " + envelopeA.getTender_EnvelopeA_Id() + "\n ENvelope A Sequnce Id: " + envelopeA.getTender_EnvelopeA_SequnceIdList()
                + "\ntender_Id: " + tender_Id);
        int tender_EnvelopeAName_Id = 0;
        try {
            if (envelopeA.getEnvelopeATemplateName() != null) {
                envelopeANames.setEnvelopeATemplateName(envelopeA.getEnvelopeATemplateName());
                envelopeANames.setDepartmentUserName("Deepak Verma");
                envelopeANames.setDeptId("1");
            }
            tender_EnvelopeAName_Id = envelopeANameDao.create(envelopeANames);
            System.out.println("The Tender Envelope A Name Id is: " + tender_EnvelopeAName_Id);

            for (int i = 0; i < envelopeA.getLabelNameAList().size(); i++) {
                envelopeA.setTender_EnvelopeA_Id(0);
                envelopeA.setTender_EnvelopeAName_Id(tender_EnvelopeAName_Id);
                envelopeA.setLabelNameA(envelopeA.getLabelNameAList().get(i));
                envelopeA.setLabelTypeA(envelopeA.getLabelTypeAList().get(i));
                envelopeA.setTender_EnvelopeA_SequnceId(Integer.parseInt(envelopeA.getTender_EnvelopeA_SequnceIdList().get(i)));
                envelopeA.setLabelMandatoryA(envelopeA.getLabelMandatoryAList().get(i).toString());
                tenderEnvelopeADao.create(envelopeA);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tender_EnvelopeAName_Id;
    }

    /*
  * saveEnvelopeB 
  * Method call to save the user information in Envelope A
  * @param TenderEnvelopeA, envelopeATemplateName 
  * @return null
  * @created 27 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/saveEnvelopeB")
    @ResponseBody
    public String saveEnvelopeB(@ModelAttribute TenderEnvelopeB envelopeB, String envelopeATemplateName, int tender_Id, TenderEnvelopeBNames envelopeBNames) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::::Save Envelope A:::::::::::::::::::::::::::/");
        System.out.println("The Template Name: " + envelopeATemplateName + "\n Envelope A Name: " + envelopeB.getLabelNameAList()
                + "\nEnvelope A Type: " + envelopeB.getLabelTypeAList() + " \n Envelope A Mandatory: " + envelopeB.getLabelMandatoryAList()
                + "\nEnvelope A Id: " + envelopeB.getTender_EnvelopeA_Id() + "\n ENvelope A Sequnce Id: " + envelopeB.getTender_EnvelopeA_SequnceIdList()
                + "\ntender_Id: " + tender_Id);
        int tender_EnvelopeAName_Id = 0;
        try {
            if (envelopeB.getEnvelopeATemplateName() != null) {
                envelopeBNames.setEnvelopeATemplateName(envelopeB.getEnvelopeATemplateName());
                envelopeBNames.setDepartmentUserName("Deepak Verma");
                envelopeBNames.setDeptId("1");
            }
            tender_EnvelopeAName_Id = envelopeBNameDao.create(envelopeBNames);
            System.out.println("The Tender Envelope A Name Id is: " + tender_EnvelopeAName_Id);

            for (int i = 0; i < envelopeB.getLabelNameAList().size(); i++) {
                envelopeB.setTender_EnvelopeA_Id(0);
                envelopeB.setTender_EnvelopeAName_Id(tender_EnvelopeAName_Id);
                envelopeB.setLabelNameA(envelopeB.getLabelNameAList().get(i));
                envelopeB.setLabelTypeA(envelopeB.getLabelTypeAList().get(i));
                envelopeB.setTender_EnvelopeA_SequnceId(Integer.parseInt(envelopeB.getTender_EnvelopeA_SequnceIdList().get(i)));
                if (envelopeB.getLabelMandatoryAList().get(i) != null) {
                    envelopeB.setLabelMandatoryA(envelopeB.getLabelMandatoryAList().get(i));
                } else {
                    envelopeB.setLabelMandatoryA("no");
                }
                tenderEnvelopeBDao.create(envelopeB);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return String.valueOf(tender_EnvelopeAName_Id);
    }

    /*
  * fetchOfficerForEnvelopeA 
  * Method call to fetch the Department Users For Envelope A
  * @param null
  * @return List
  * @created 28 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/fetchOfficerForEnvelopeA")
    @ResponseBody
    public String fetchOfficerForEnvelopeA() {
        List<DepartmentUser> departmentUsersForEnvelopeA = new ArrayList<>();
        String response = null;
        try {
            departmentUsersForEnvelopeA = departmentUserDao.getEA_UERS();
            System.out.println("The Department User For Envelope A are: " + departmentUsersForEnvelopeA.size());
            Gson gson = new Gson();
            response = gson.toJson(departmentUsersForEnvelopeA);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
  * fetchOfficerForEnvelopeB 
  * Method call to fetch the Department Users For Envelope B
  * @param null
  * @return List
  * @created 30 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/fetchOfficerForEnvelopeB")
    @ResponseBody
    public String fetchOfficerForEnvelopeB() {
        List<DepartmentUser> departmentUsersForEnvelopeB = new ArrayList<>();

        String response = null;
        try {
            departmentUsersForEnvelopeB = departmentUserDao.getEB_UERS();
            System.out.println("The Department User For Envelope B are: " + departmentUsersForEnvelopeB.size());
            Gson gson = new Gson();
            response = gson.toJson(departmentUsersForEnvelopeB);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
  * fetchOfficerForEnvelopeC 
  * Method call to fetch the Department Users For Envelope B
  * @param null
  * @return List
  * @created 30 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/fetchOfficerForEnvelopeC")
    @ResponseBody
    public String fetchOfficerForEnvelopeC() {
        List<DepartmentUser> departmentUsersForEnvelopeC = new ArrayList<>();

        String response = null;
        try {
            departmentUsersForEnvelopeC = departmentUserDao.getEC_UERS();
            System.out.println("The Department User For Envelope C are: " + departmentUsersForEnvelopeC.size());
            Gson gson = new Gson();
            response = gson.toJson(departmentUsersForEnvelopeC);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
  * showEnvelopeANames 
  * Method call to fetch the Envelope A Names
  * @param null
  * @return List
  * @created 1 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/showEnvelopeANames")
    @ResponseBody
    public String showEnvelopeANames() {
        List<TenderEnvelopeANames> envelopeANameses = new ArrayList<>();
        Map<String, String> officerEnvelopeADetails = new HashMap<>();
        String response = null;
        try {
            envelopeANameses = envelopeANameDao.readAll(1);
            System.out.println("The Template Name for Envelope A: " + envelopeANameses.size());
            Gson gson = new Gson();
            response = gson.toJson(envelopeANameses);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
  * showEnvelopeBNames 
  * Method call to fetch the Envelope B Names
  * @param null
  * @return List
  * @created 1 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/showEnvelopeBNames")
    @ResponseBody
    public String showEnvelopeBNames() {
        List<TenderEnvelopeBNames> envelopeBNameses = new ArrayList<>();
        String response = null;
        try {
            envelopeBNameses = envelopeBNameDao.readAll(1);
            System.out.println("The Template Name for Envelope A: " + envelopeBNameses.size());
            Gson gson = new Gson();
            response = gson.toJson(envelopeBNameses);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
  * showDynamicTemplateA 
  * Method call to fetch the Dynamic Template A Data
  * @param null
  * @return List
  * @created 3 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/showDynamicTemplateA")
    @ResponseBody
    public String showDynamicTemplateA(@RequestParam int tender_EnvelopeA_Id) throws IOException {
        List<TenderEnvelopeA> envelopeAsToShow = new ArrayList<>();
        String response = null;
        System.out.println("The Tender Envelope A Id: " + tender_EnvelopeA_Id);
        try {
            envelopeAsToShow = tenderEnvelopeADao.readAll(tender_EnvelopeA_Id);
            System.out.println("The Size of ENvelope A: " + envelopeAsToShow.size());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        Gson gson = new Gson();
        response = gson.toJson(envelopeAsToShow);
        gsonUtility.writeData(response);
        return response;
    }

    @RequestMapping("/checkedDynamicTemplateA")
    @ResponseBody
    public String checkedDynamicTemplateA(@RequestParam int sequnceId, @RequestParam int tender_Id) {
        try {

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * showDynamicTemplateB 
  * Method call to fetch the Dynamic Template B Data
  * @param null
  * @return List
  * @created 3 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/showDynamicTemplateB")
    @ResponseBody
    public String showDynamicTemplateB(@RequestParam int tender_EnvelopeA_Id) throws IOException {
        List<TenderEnvelopeB> envelopeBsToShow = new ArrayList<>();
        String response = null;
        System.out.println("The Tender Envelope B Id: " + tender_EnvelopeA_Id);
        try {
            envelopeBsToShow = tenderEnvelopeBDao.readAll(tender_EnvelopeA_Id);
            System.out.println("The Size of ENvelope A: " + envelopeBsToShow.size());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        Gson gson = new Gson();
        response = gson.toJson(envelopeBsToShow);
        gsonUtility.writeData(response);
        return response;
    }

    /*
  * checkTemplateDuplicateNameA 
  * Method call to check Template Duplicate Name 
  * @param String Envelope Name
  * @return String
  * @created 18 Dec 2018
  * @version 2.0.0
     */
    @RequestMapping("/checkTemplateDuplicateNameA")
    @ResponseBody
    public Boolean checkTemplateDuplicateNameA(@RequestParam String envelopeName) {
        Boolean status = true;
        try {
            System.out.println("The Envelope A Name is: " + envelopeName);
            status = envelopeANameDao.checkDuplicateEnvelopeAName(envelopeName.trim());
            System.out.println("The status is :" + status);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    /*
  * checkTemplateDuplicateNameB 
  * Method call to check Template Duplicate Name 
  * @param String Envelope Name
  * @return String
  * @created 18 Dec 2018
  * @version 2.0.0
     */
    @RequestMapping("/checkTemplateDuplicateNameB")
    @ResponseBody
    public Boolean checkTemplateDuplicateNameB(@RequestParam String envelopeName) {
        Boolean status = true;
        try {
            System.out.println("The Envelope B Name is: " + envelopeName);
            status = envelopeBNameDao.checkDuplicateEnvelopeBName(envelopeName.trim());
            System.out.println("The status is :" + status);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    /*
  * saveTemplateDataA 
  * Method call to save Template A Data
  * @param null
  * @return List
  * @created 3 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/saveTemplateDataA")
    @ResponseBody
    public int saveTemplateDataA(@ModelAttribute("saveEnvelopeASubmit") TenderSubmittedEnvelopeA submittedEnvelopeA, int tender_Id, int submittedEnvelopeA_Id) {
        System.out.println("The Envelope A Id : " + submittedEnvelopeA.getEnvelopeAId() + " \n Tender Id is: " + tender_Id + ""
                + "\n Officer For Envelope A: " + submittedEnvelopeA.getEnvelopeAOfficers() + "\n Submitted Envelope A: "
                + submittedEnvelopeA.getSubmittedEnvelopeA_Id() + "\n Other Value For Submitted Envelope A: " + submittedEnvelopeA_Id);
        int envelopeA_Id = 0;
        try {
            envelopeA_Id = envelopeADaoImpl.create(submittedEnvelopeA);
            //gsonUtility.writeData(String.valueOf(envelopeA_Id));

            //Logs for Envelope A Submission
            Logs logs = logsAction.generatingLogs(0, 0, 0, tender_Id, "Envelope A Submission", 0, 0, "0", "", "Submitting Envelope A Data", "Envelope A Submission", "Submitting");
            logsAction.saveLogs(logs);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return envelopeA_Id;
    }

    /*
  * saveTemplateDataB 
  * Method call to save Template B Data
  * @param null
  * @return List
  * @created 3 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/saveTemplateDataB")
    @ResponseBody
    public int saveTemplateDataB(@ModelAttribute("saveEnvelopeBSubmit") TenderSubmittedEnvelopeB submittedEnvelopeB, int tender_Id, int submittedEnvelopeB_Id) {
        System.out.println("The Envelope B Id : " + submittedEnvelopeB.getEnvelopeBId() + " \n Tender Id is: " + tender_Id + ""
                + "\n Officer For Envelope B: " + submittedEnvelopeB.getEnvelopeBOfficers() + "\n Submitted Envelope B: "
                + submittedEnvelopeB.getSubmittedEnvelopeB_Id() + "\n Other Value For Submitted Envelope B: " + submittedEnvelopeB_Id);
        String message = null;
        int envelopeB_Id = 0;
        try {
            envelopeB_Id = envelopeBDaoImpl.create(submittedEnvelopeB);
            message = "Envelope B Save Successfully";
            //gsonUtility.writeData(message);

            //Logs for Envelope B Submission
            Logs logs = logsAction.generatingLogs(0, 0, 0, tender_Id, "Envelope B Submission", 0, 0, "0", "", "Submitting Envelope B Data", "Envelope B Submission", "Submitting");
            logsAction.saveLogs(logs);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return envelopeB_Id;
    }

    /*
  * deleteEnvelopeBOnChangeOfEnvelopeType
  * Method call to delete Template B Data
  * @param int tender_Id
  * @return null
  * @created 21Jan2019
  * @version 2.0.0
     */
    @RequestMapping("/deleteEnvelopeBOnChangeOfEnvelopeType")
    @ResponseBody
    public String deleteEnvelopeBOnChangeOfEnvelopeType(int tender_Id, HttpSession httpSession) {
        System.out.println("The Tender Id is: " + tender_Id);
        try {
            if (httpSession.getAttribute("deptId") != null) {
                envelopeBDaoImpl.delete(tender_Id);
            } else {
                System.out.println("Session Time Out");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * saveTemplateDataB 
  * Method call to save Template B Data
  * @param null
  * @return List
  * @created 3 Sep 2018
  * @version 2.0.0
     */
    @RequestMapping("/saveTemplateDataC")
    @ResponseBody
    public int saveTemplateDataB(@ModelAttribute("saveEnvelopeCSubmit") TenderSubmittedEnvelopeC submittedEnvelopeC, int tender_Id, int submittedEnvelopeC_Id) {
        System.out.println("The Envelope C Id : " + submittedEnvelopeC.getEnvelopeCId() + " \n Tender Id is: " + tender_Id + ""
                + "\n Officer For Envelope C: " + submittedEnvelopeC.getEnvelopeCOfficers() + "\n Submitted Envelope C: "
                + submittedEnvelopeC.getSubmittedEnvelopeC_Id() + "\n Other Value For Submitted Envelope C: " + submittedEnvelopeC_Id);
        String message = null;
        int envelopeC_Id = 0;
        try {
            envelopeC_Id = envelopeCDaoImpl.create(submittedEnvelopeC);
            message = "Envelope C Save Successfully";

            //Logs for Envelope C Submission
            Logs logs = logsAction.generatingLogs(0, 0, 0, tender_Id, "Envelope C Submission", 0, 0, "0", "", "Submitting Envelope C Data", "Envelope C Submission", "Submitting");
            logsAction.saveLogs(logs);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return envelopeC_Id;
    }

    /*
    * fetchingDataForTemplateA
    * Method call to fetch Template A Details by tender_Id
    * @param tender_Id
    * @created 7 Sep 2018
    * @version 2.0.0
     */
    @RequestMapping("/fetchingDataForTemplateA")
    @ResponseBody
    public String fetchingDataForTemplateA(@RequestParam String tender_Id, TenderSubmittedEnvelopeA submittedEnvelopeA) {
        System.out.println("/:::::::::::::::::::::::::::Method Call to fetch the Template A details::::::::::::::::::::::::::::::::/");
        System.out.println("The Tender Id is: " + tender_Id);
        String response = null;
        try {
            submittedEnvelopeA = envelopeADaoImpl.read(Integer.parseInt(tender_Id));
            System.out.println("The Submitted Envelope A: " + submittedEnvelopeA);
            Gson gson = new Gson();
            response = gson.toJson(submittedEnvelopeA);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
    * fetchingDataForTemplateA
    * Method call to fetch Template A Details by tender_Id
    * @param tender_Id
    * @created 7 Sep 2018
    * @version 2.0.0
     */
    @RequestMapping("/fetchingDataForTemplateB")
    @ResponseBody
    public String fetchingDataForTemplateB(@RequestParam String tender_Id, TenderSubmittedEnvelopeB submittedEnvelopeB) {
        System.out.println("/:::::::::::::::::::::::::::Method Call to fetch the Template B details::::::::::::::::::::::::::::::::/");
        System.out.println("The Tender Id is: " + tender_Id);
        String response = null;
        try {
            submittedEnvelopeB = envelopeBDaoImpl.read(Integer.parseInt(tender_Id));
            System.out.println("The Submitted Envelope A: " + submittedEnvelopeB);
            Gson gson = new Gson();
            response = gson.toJson(submittedEnvelopeB);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
    * fetchingDataForTemplateA
    * Method call to fetch Template A Details by tender_Id
    * @param tender_Id
    * @created 7 Sep 2018
    * @version 2.0.0
     */
    @RequestMapping("/fetchTemplateBQCBSDetails")
    @ResponseBody
    public TenderSubmittedQCBS fetchTemplateBQCBSDetails(@RequestParam String tender_Id, TenderSubmittedQCBS submittedQCBS) {
        System.out.println("/:::::::::::::::::::::::::::Method Call to fetch the Template B details::::::::::::::::::::::::::::::::/");
        System.out.println("The Tender Id is: " + tender_Id);
        String response = null;
        try {
            submittedQCBS = this.submittedQCBS.read(Integer.parseInt(tender_Id));
            System.out.println("The Submitted Envelope A: " + submittedQCBS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return submittedQCBS;
    }

    @RequestMapping("/fetchingDataForTemplateC")
    @ResponseBody
    public TenderSubmittedEnvelopeC fetchingDataForTemplateC(@RequestParam String tender_Id, TenderSubmittedEnvelopeC submittedEnvelopeC) {
        System.out.println("/:::::::::::::::::::::::::::Method Call to fetch the Template C details::::::::::::::::::::::::::::::::/");
        System.out.println("The Tender Id is: " + tender_Id);
        try {
            submittedEnvelopeC = envelopeCDaoImpl.read(Integer.parseInt(tender_Id));
            System.out.println("The Submitted Envelope C: " + submittedEnvelopeC);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return submittedEnvelopeC;
    }

//    /*
//    * validatingTender 
//    * Method call to validating Tender
//    * @param null
//    * @return List
//    * @created 5 Sep 2018
//    * @version 2.0.0
//    */
//    @RequestMapping("/tenderValidationURL")
//    @ResponseBody
//    public Map<String, String> validatingTender(@ModelAttribute("formData")@Nullable Tender formData,
//            @RequestParam("step")String step,@ModelAttribute("keyDateData")@Nullable TenderKeyDates tenderKeyDates){
//        Map<String, String> tenders = new HashMap<>();
//        try{ 
//            System.out.println("The Validation call begin: "+formData+"\nStep: "+step);
//            formData.setTenderKeyDates(tenderKeyDates);
//            tenders = tenderModel.validatingTender(formData, step);
//            System.out.println("The Size of tender Creation data: "+tenders.size());
//            Gson gson = new Gson();
//            String response = gson.toJson(tenders);
//            gsonUtility.writeData(response);
//        }catch(Exception ex){
//            ex.printStackTrace();
//        }
//        return tenders;
//    }    
//    
//   
//    
//  @RequestMapping("/DyanmicaTemplate")
//  public String dynamicTemplate(){
//      return "DepartmentUser/DynamicTemplate";
//  }
    @RequestMapping("/FetchServerDate")
    @ResponseBody
    public Map<String, String> fetchServerDate(@ModelAttribute Tender tender, HttpServletResponse responses) {
        Map<String, String> clockMap = new HashMap<>();
        try {
            ZoneId zoneId = ZoneId.of("Asia/Kolkata");
            LocalDateTime dateTime = LocalDateTime.now(zoneId);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss a");
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("EEE | dd-MM-yyyy");
            String formattedTime = dateTime.format(formatter);
            String formattedTime2 = dateTime.format(formatter2);
            clockMap.put("time", formattedTime);
            clockMap.put("date", formattedTime2);
            //System.out.println("Current time of the day is: " + formattedTime);
            // PrintWriter response = responses.getWriter();
            //Long result = new Date().getTime();
            // System.out.println("date is : " + result);
            //response.print(formattedTime);
            //response.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return clockMap;
    }

    @RequestMapping("/tenderResetProcess")
    public String tenderResetProcess(@RequestParam int tender_Id, @RequestParam String tender_Number, @RequestParam String nitNumber, @RequestParam String nitDate, RedirectAttributes ra) {
        System.out.println("/:::::::::::Tender Reset Process:::::::::::::::::/");
        System.out.println("The Tender Id: " + tender_Id + "\n Tender Number: " + tender_Number + "\n Tender date: " + nitDate + "\n NIT Number: " + nitNumber);
        Tender tender = new Tender();
        try {
            tender.setWizardStep("step1");
            tender.setTenderStatus("Creating");
            tender.setTender_Id(tender_Id);
            tender.setTenderNumber(tender_Number);
            tender.setNitDate(nitDate);
            tender.setNitNumber(nitNumber);

            tenderDao.create(tender);
            ra.addFlashAttribute("message", "RESETPROCESS");
            ra.addFlashAttribute("nitNumber", nitNumber);
            ra.addFlashAttribute("nitDate", nitDate);
            ra.addFlashAttribute("tenderNumber", tender_Number);
            ra.addFlashAttribute("tender_Id", tender_Id);
            System.out.println("The Tender Id To Make reset is: " + tender_Id);
        } catch (Exception ex) {
            //this.eTendering(tender, keyDates,submittedEnvelopeA, m, session);  
        }
        return "redirect:/eTendering";
    }

    @RequestMapping("/fetchDynamicTemplateDataA")
    @ResponseBody
    public List<TenderEnvelopeA> fetchDynamicTemplateDataA(@RequestParam Integer envelopeAId) {
        List<TenderEnvelopeA> envelopeAs = new ArrayList<>();
        try {
            if (envelopeAId != null) {
                envelopeAs = this.tenderEnvelopeADao.readAll(envelopeAId);
            }
            System.out.println("The Envelope A as : " + envelopeAs.size());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return envelopeAs;
    }

    @RequestMapping("/fetchDynamicTemplateDataB")
    @ResponseBody
    public List<TenderEnvelopeB> fetchDynamicTemplateDataB(@RequestParam Integer envelopeBId) {
        List<TenderEnvelopeB> envelopeBs = new ArrayList<>();
        try {
            if (envelopeBId != null) {
                envelopeBs = this.tenderEnvelopeBDao.readAll(envelopeBId);
            }
            System.out.println("The Envelope A as : " + envelopeBs.size());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return envelopeBs;
    }

    @RequestMapping("/showEnvelopeCNames")
    @ResponseBody
    public String showEnvelopeCNames() {
        List<TenderEnvelopeCNames> envelopeBNameses = new ArrayList<>();
        String response = null;
        try {
            envelopeBNameses = envelopeCNameDao.readAll(1);
            System.out.println("The Template Name for Envelope A: " + envelopeBNameses.size());
            Gson gson = new Gson();
            response = gson.toJson(envelopeBNameses);
            gsonUtility.writeData(response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    @RequestMapping("/checkTemplateDuplicateNameC")
    @ResponseBody
    public Boolean checkTemplateDuplicateNameC(@RequestParam String envelopeName) {
        Boolean status = true;
        try {
            System.out.println("The Envelope A Name is: " + envelopeName);
            status = envelopeCNameDao.checkDuplicateEnvelopeBName(envelopeName.trim());
            System.out.println("The status is :" + status);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
//    @RequestMapping("/saveEnvelopeC")
//    @ResponseBody
//    public String saveEnvelopeC(@ModelAttribute TenderEnvelopeB envelopeB, String envelopeATemplateName, int tender_Id, TenderEnvelopeBNames envelopeBNames) {
//        System.out.println("/:::::::::::::::::::::::::::::::::::::::Save Envelope A:::::::::::::::::::::::::::/");
//        System.out.println("The Template Name: " + envelopeATemplateName + "\n Envelope A Name: " + envelopeB.getLabelNameAList()
//                + "\nEnvelope A Type: " + envelopeB.getLabelTypeAList() + " \n Envelope A Mandatory: " + envelopeB.getLabelMandatoryAList()
//                + "\nEnvelope A Id: " + envelopeB.getTender_EnvelopeA_Id() + "\n ENvelope A Sequnce Id: " + envelopeB.getTender_EnvelopeA_SequnceIdList()
//                + "\ntender_Id: " + tender_Id);
//        int tender_EnvelopeAName_Id = 0;
//        try {
//            if (envelopeB.getEnvelopeATemplateName() != null) {
//                envelopeBNames.setEnvelopeATemplateName(envelopeB.getEnvelopeATemplateName());
//                envelopeBNames.setDepartmentUserName("Deepak Verma");
//                envelopeBNames.setDeptId("1");
//            }
//            tender_EnvelopeAName_Id = envelopeCNameDao.create(envelopeBNames);
//            System.out.println("The Tender Envelope A Name Id is: " + tender_EnvelopeAName_Id);
//
//            for (int i = 0; i < envelopeB.getLabelNameAList().size(); i++) {
//                envelopeB.setTender_EnvelopeA_Id(0);
//                envelopeB.setTender_EnvelopeAName_Id(tender_EnvelopeAName_Id);
//                envelopeB.setLabelNameA(envelopeB.getLabelNameAList().get(i));
//                envelopeB.setLabelTypeA(envelopeB.getLabelTypeAList().get(i));
//                envelopeB.setTender_EnvelopeA_SequnceId(Integer.parseInt(envelopeB.getTender_EnvelopeA_SequnceIdList().get(i)));
//                if (envelopeB.getLabelMandatoryAList().get(i) != null) {
//                    envelopeB.setLabelMandatoryA(envelopeB.getLabelMandatoryAList().get(i));
//                } else {
//                    envelopeB.setLabelMandatoryA("no");
//                }
//                tenderEnvelopeBDao.create(envelopeB);
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return String.valueOf(tender_EnvelopeAName_Id);
//    }

    @RequestMapping("/saveEnvelopeC")
    @ResponseBody
    public String saveEnvelopeC(@ModelAttribute TenderEnvelopeC envelopeB, String envelopeCTemplateName, int tender_Id, TenderEnvelopeCNames envelopeBNames) {
        System.out.println("/:::::::::::::::::::::::::::::::::::::::Save Envelope C:::::::::::::::::::::::::::/");
        System.out.println("The Template Name: " + envelopeCTemplateName);
        System.out.println("Enter");
        int tender_EnvelopeAName_Id = 0;
        try {
            if (envelopeB.getEnvelopeCTemplateName() != null) {
                envelopeBNames.setEnvelopeCTemplateName(envelopeB.getEnvelopeCTemplateName());
                envelopeBNames.setDepartmentUserName("Deepak Verma");
                envelopeBNames.setDeptId("1");
            }
            tender_EnvelopeAName_Id = envelopeCNameDao.create(envelopeBNames);
            System.out.println("The Tender Envelope A Name Id is: " + tender_EnvelopeAName_Id);

            envelopeB.setTender_EnvelopeC_Id(0);
            envelopeB.setTender_EnvelopeCName_Id(tender_EnvelopeAName_Id);
//                envelopeB.setTender_EnvelopeA_SequnceId(Integer.parseInt(envelopeB.getTender_EnvelopeA_SequnceIdList().get(i)));

            tenderEnvelopeCDao.create(envelopeB);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return String.valueOf(tender_EnvelopeAName_Id);
    }
}
