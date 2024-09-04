/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;
import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.dao.ContractorClassDao;
import com.eproc.dao.DepartmentUserDao;
import com.eproc.dao.EMD_ApplicableDao;
import com.eproc.dao.EnvelopeTypeDao;
import com.eproc.dao.SelectiveTenderDao;
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
import com.eproc.dao.TenderKeyDatesDao;
import com.eproc.dao.TenderKeywordDAO;
import com.eproc.dao.TenderStageDao;
import com.eproc.dao.TenderTemporaryAmendDocumentDao;
import com.eproc.dao.TypeofTendersDao;
import com.eproc.dao.UploadSorDao;
import com.eproc.daoImpl.TenderSubmittedEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeBDaoImpl;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.EnvelopeType;
import com.eproc.domain.SelectiveTender;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderAmendment;
import com.eproc.domain.TenderCategory;
import com.eproc.domain.TenderDocument;
import com.eproc.domain.TenderDocumentAmendment;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderKeyDatesAmendment;
import com.eproc.domain.TenderKeyword;
import com.eproc.domain.TenderStage;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.domain.TenderSubmittedEnvelopeB;
import com.eproc.domain.TenderTemporaryAmendDocument;
import com.eproc.domain.TypeOfTenders;
import com.eproc.domain.UploadSOR;
import com.eproc.logs.LogsAction;
import com.eproc.model.TenderModel;
import com.eproc.util.DateTimeUtil;
import com.eproc.util.FileUtility;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.antlr.v4.runtime.misc.Nullable;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Gaurav Dubey
 */
@Controller
public class ETenderingAmendmentController {

    @Autowired
    TenderDao tenderDao;
    @Autowired
    TenderAmendmentDao tenderAmendmentDao;
    @Autowired
    TenderStageDao tenderStage;
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
    TenderDocumentDao documentDao;
    @Autowired
    TenderDocumentAmendmentDao tenderDocumentAmendmentDao;
    @Autowired
    TenderTemporaryAmendDocumentDao tenderTemporaryAmendDocumentDao;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    FileUtility fileUtility;
    @Autowired
    TenderKeywordDAO addKeywordDAO;
    @Autowired
    TenderAmendmentKeyDatesDao tenderAmendmentKeyDatesDao;
    @Autowired
    TenderEnvelopeADao tenderEnvelopeADao;
    @Autowired
    TenderEnvelopeBDao tenderEnvelopeBDao;
    @Autowired
    TenderEnvelopeANameDao envelopeANameDao;
    @Autowired
    TenderEnvelopeBNameDao envelopeBNameDao;
    @Autowired
    DepartmentUserDao departmentUserDao;
    @Autowired
    TenderModel tenderModel;
    @Autowired
    TenderSubmittedEnvelopeADaoImpl envelopeADaoImpl;
    @Autowired
    TenderSubmittedEnvelopeBDaoImpl envelopeBDaoImpl;
    @Autowired
    LogsAction logsAction;

    /*
  * updateTenderDetailsForAmmendment
  * This method is called when data is updated on model of ammendment tender
  * @created 26 Aug 2018
  * @version 2.0.0
     */
    @RequestMapping("/updateTenderDetailsForAmmendment")
    public String updateTenderDetailsForAmmendment(@ModelAttribute @Nullable Tender tender1, Model m, HttpSession session) {
        System.out.println("/:::::::::::::::::::::::::::::Tender Amendment Changes Start from here::::::::::::::::::::/");
        System.out.println("\n1:- The Tender Id: " + tender1.getTender_Id() + "\n2:- Name of Work: " + tender1.getNameOfWork()
                + "\n3:- Description of work: " + tender1.getDescriptionOfWork() + "\n4:- Estimate Value: " + tender1.getEstimateValueInFig()
                + "\n5:- Estimate Value in words: " + tender1.getEstimateValueInWord() + "\n6:- Tender Fee in fig: " + tender1.getTenderFeeInFig()
                + "\n7:- Tender Fee in words: " + tender1.getTenderFeeInWord() + "\n8:- Bid Validate Type: " + tender1.getBidValidateType()
                + "\n9:- Bid Validate Period: " + tender1.getBidValidatePeriod() + "\n10:= Work Completion Type: " + tender1.getWorkCompletionType()
                + "\n11:- Work Completion Period: " + tender1.getWorkCompletionPeriod() + "\n12 Tender Notice: " + tender1.getTenderNotice());
        System.out.println("::::::::::::::::::::::::::::::::Tender Key Dates are:::::::::::::::::::::::::::::");
        System.out.println("\n1:- Tender Release Date:" + tender1.getTenderNotice() + " \n2:- Tender Purchase Date: " + tender1.getTenderKeyDates().getTenderPurchaseDate()
                + "\n3:- Bid Submission Date: " + tender1.getTenderKeyDates().getBidSubmissionDate() + "\n 4:- Opening(EA): " + tender1.getTenderKeyDates().getOpeningEA()
                + "\n5:- Opening(EB): " + tender1.getTenderKeyDates().getOpeningEB()+"\n6:- Submission(EC): " + tender1.getTenderKeyDates().getEcBidSubmissionDate()+ "\n7:- Opening(EC): " + tender1.getTenderKeyDates().getOpeningEC() + "\n8:-Ec Opening After Technical Bid: " + tender1.getTenderKeyDates().getOpeningECaftertechopening());
       
        ModelAndView modelAndView = new ModelAndView();
        Tender tender = new Tender();
        Tender tender2;
        String bidValidateTypeName = null;
        String workCompletionTypeName = null;
        TenderStage tenderStages;
        SelectiveTender selectiveTenders;
        TenderCategory tenderCategory;
        EnvelopeType envelopeType;
        TypeOfTenders typeOfTenders;
        AreaOfWork areaOfWork;
        UploadSOR uploadSOR;
        ContractorClass contractorClass;
        List<TenderDocument> tenderDocuments = new ArrayList<>();
        List<TenderTemporaryAmendDocument> tenderTemporaryAmendDocuments = new ArrayList<>();
        List<TenderDocumentAmendment> tenderDocumentAmendments = new ArrayList<>();
        List<TenderKeyDates> tenderKeyDateses = new ArrayList<>();
        List<TenderKeyword> addKeywordsList = new ArrayList<>();
        List<TenderKeyword> addKeywordses = new ArrayList<>();
        TenderSubmittedEnvelopeA submittedEnvelopeA = null;
        TenderSubmittedEnvelopeB submittedEnvelopeB = null;
        List<DepartmentUser> departmentUsersA = new ArrayList<>();
        List<DepartmentUser> departmentUsersB = new ArrayList<>();
        List<DepartmentUser> ammendmentOfficerList = new ArrayList<>();
        Integer deptId = 0;
        try {
            if (session.getAttribute("deptId") != null) {
                deptId = Integer.parseInt(session.getAttribute("deptId").toString());
                //Fetch the tender detail by tender Id.
                tender2 = tenderDao.read(tender1.getTender_Id());
               
                BeanUtils.copyProperties(tender2, tender);
                System.out.println("The Tender details are: " + tender2.getEmdApplicable());
          
                if (tender1 != null) {
                    tender.setNameOfWork(tender1.getNameOfWork());
                    tender.setDescriptionOfWork(tender1.getDescriptionOfWork());
                    tender.setEstimateValueInFig(tender1.getEstimateValueInFig());
                    tender.setEstimateValueInWord(tender1.getEstimateValueInWord());
                    tender.setTenderFeeInFig(tender1.getTenderFeeInFig());
                    tender.setTenderFeeInWord(tender1.getTenderFeeInWord());
                    tender.setBidValidatePeriod(tender1.getBidValidatePeriod());
                    tender.setWorkCompletionPeriod(tender1.getWorkCompletionPeriod());
                    String bidValidateType = tender1.getBidValidateType();
                    if (bidValidateType.equalsIgnoreCase("1")) {
                        bidValidateTypeName = "Days";
                    }
                    if (bidValidateType.equalsIgnoreCase("2")) {
                        bidValidateTypeName = "Month";
                    }

                    String workCompletionType = tender1.getWorkCompletionType();
                    if (workCompletionType.equalsIgnoreCase("1")) {
                        workCompletionTypeName = "Days";
                    }
                    if (workCompletionType.equalsIgnoreCase("2")) {
                        workCompletionTypeName = "Month";
                    }
                    tender.setBidValidateType(bidValidateTypeName);
                    tender.setWorkCompletionType(workCompletionTypeName);
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
                    areaOfWork = this.areaOfWorkDAO.fetchData(Integer.parseInt(tender.getAreaOfWork()));
                    System.out.println("The Area Of Work is: " + areaOfWork.getAreaofwork_name());
                    tender.setAreaOfWorkName(areaOfWork.getAreaofwork_name());
                }

                if (tender.getTenderKeywords() != null) {
                    //Fetch the name of tender keywords by keywords Id.
                    addKeywordsList = this.addKeywordDAO.fetchAll();
                    String[] keywordsArray = tender.getTenderKeywords().split(",");
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

//          if(tender.getSorDocument() != null){
//          //Fetch the Sor Document Details according to tender Id. 
//          uploadSOR = this.uploadSorDao.fecthSORDocumentByIdDeptIdAndStatus(Integer.parseInt(tender.getSorDocument()), deptId, "true");
//          if(uploadSOR != null){
//          System.out.println("The Upload SOR Document is: "+uploadSOR.getUploadSorFileName());
//          tender.setUploadSOR(uploadSOR);
//          }
//          }
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
                    tender.setEmdApplicable(emdApplicable);
                }

                if (tender.getContractorClass() != null) {
                    //Fetch the contractor Class name by contractor Class Id.
                    contractorClass = (ContractorClass) this.contractorClassDao.fetchData(Integer.parseInt(tender.getContractorClass()));
                    System.out.println("The Contractor Class is: " + contractorClass.getContractorClass_Name());
                    tender.setContractorClassName(contractorClass.getContractorClass_Name());
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

                //Tender Notice Update 
                if (tender1.getTenderNotice() != null) {
                    tender.setTenderNotice(tender1.getTenderNotice());
                }

                //Fetch the Data For the Tender Documents by tender Id.
                if (tender.getTenderStatus().equalsIgnoreCase("Approved")) {
                    tenderDocuments = documentDao.fetchTenderDocumentByTenderId(tender.getTender_Id());
                    System.out.println("The Tender Document are: " + tenderDocuments.size());
                }

                //Fetch Tender Document from Ammnedment Table if tender is ammnedment
                if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                    tenderDocumentAmendments = tenderDocumentAmendmentDao.fetchTenderDocumentByTenderId(tender.getTender_Id());
                    System.out.println("The Ammendment Documents are: " + tenderDocumentAmendments.size());
                    if (!tenderDocumentAmendments.isEmpty()) {
                        m.addAttribute("tenderDocument", tenderDocumentAmendments);
                    }

                    if (!tenderDocumentAmendments.isEmpty()) {
                        for (TenderDocumentAmendment amendedDocuments : tenderDocumentAmendments) {
                            TenderDocument td = new TenderDocument();
                            BeanUtils.copyProperties(amendedDocuments, td);
                            tenderDocuments.add(td);
                        }
                        if (!tenderDocuments.isEmpty()) {
                            m.addAttribute("tenderDocument", tenderDocuments);
                        }
                    }

                }

                //Fetch Tender Temporary Document
                tenderTemporaryAmendDocuments = tenderTemporaryAmendDocumentDao.fetchTenderTemporaryDocumentByTenderId(tender1.getTender_Id());
                System.out.println("The Temporary Document is: " + tenderTemporaryAmendDocuments.size());
                if (!tenderTemporaryAmendDocuments.isEmpty()) {
                    for (TenderTemporaryAmendDocument amendDocument : tenderTemporaryAmendDocuments) {
                        TenderDocument td = new TenderDocument();
                        System.out.println("The Tender Temporary Document Id: " + amendDocument.getDoc_Id());
                        td.setDoc_Name(amendDocument.getDoc_Name());
                        td.setDocSequnceId(amendDocument.getDocSequnceId());
                        td.setDoc_OrignalName(amendDocument.getDoc_OrignalName());
                        td.setDoc_Path(amendDocument.getDoc_Path());
                        td.setDocumentVisibility(amendDocument.getDocumentVisibility());
                        tenderDocuments.add(td);
                    }
                }

                if (!tenderDocuments.isEmpty()) {
                    m.addAttribute("tenderDocument", tenderDocuments);
                }

                //Fetch Tender Key Dates By tender Id.
                tenderKeyDateses = tenderKeyDatesDao.readAllKeyDates(tender.getTender_Id());
                   System.out.println("TTTTTTTTTTTTTTTTTTTTT"+tenderKeyDateses);
                
                
                System.out.println("The Tender Key Dates are:" + tenderKeyDateses.size());
                if (!tenderKeyDateses.isEmpty()) {
                    for (TenderKeyDates tenderKeyDates2 : tenderKeyDateses) {
                        tenderKeyDates2.setTenderReleaseDate(tender1.getTenderKeyDates().getTenderReleaseDate());
                        tenderKeyDates2.setTenderPurchaseDate(tender1.getTenderKeyDates().getTenderPurchaseDate());
                        tenderKeyDates2.setBidSubmissionDate(tender1.getTenderKeyDates().getBidSubmissionDate());
                        tenderKeyDates2.setOpeningEA(tender1.getTenderKeyDates().getOpeningEA());
                        tenderKeyDates2.setOpeningEB(tender1.getTenderKeyDates().getOpeningEB());
                        tenderKeyDates2.setOpeningEC(tender1.getTenderKeyDates().getOpeningEC());
                        tenderKeyDates2.setEcBidSubmissionDate(tender1.getTenderKeyDates().getEcBidSubmissionDate());

                        int i = tenderKeyDatesDao.create(tenderKeyDates2);
                        if (i > 0) {
                            System.err.println("Key dates updated");
                        } else {
                            System.err.println("Key dates updated");
                        }
                    }

                    m.addAttribute("tenderKeyDateses", tenderKeyDateses);
                }

                int k = tenderDao.create(tender);
                if (k > 0) {
                    System.err.println("Tender update");
                } else {
                    System.err.println("Tender not update");
                }
                session.setAttribute("tender", tender);
                session.setAttribute("tenderKeyDateses", tenderKeyDateses);

//        if(tender.getTenderStatus().equalsIgnoreCase("Amended")){
//        modelAndView.setViewName("DepartmentUser/ViewAmendedTenderDetailsTemplate");
//        } 
                m.addAttribute("processToAmmendmentButton", "show");

                System.out.println("The Tender data after fetching details is : " + tender1);
                System.out.println("The Tender details are: " + tender.getAmmendmentPrivilege());
                m.addAttribute(tender);
                modelAndView.setViewName("DepartmentUser/ViewProcessForAmmendTender");
            } else {
                System.out.println("Session Time Out");
                session.invalidate();
                return "redirect:/";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "DepartmentUser/ViewProcessForAmmendTender";
    }

    /*
  * amendmentTenderCreation
  * This method is called when ammendment process is excuted 
  * @Created 26 Aug 2018
  * @Version 2.0.0
     */
    @RequestMapping("/amendmentTenderCreation")
    public String amendmentTenderCreation(@ModelAttribute Tender tender, @RequestParam int tender_Id, TenderAmendment amendment, TenderKeyDatesAmendment tenderKeyDatesAmendment, TenderDocumentAmendment tenderDocumentAmendment, @Nullable @RequestParam("statusFiles") MultipartFile statusFiles, HttpSession session) {
        System.out.println("The Tender Number is: " + tender.getTenderNumber() + "\n 2:- Remark: " + tender.getRemarks() + "\n3:- File:" + statusFiles + " \n4:- The NIT Date: " + tender.getNitNumber() + "\n5:- Tender Id: " + tender_Id
                + "\n6:- Ammendment Corrigendum: " + tender.getAmmendmentCorrigendum());

        System.out.println("/////////The Tender Details thats are changed://////////"
                + "\n1:Tender Description: " + tender.getDescriptionOfWork() + "\n2:Tender Name of Work: " + tender.getNameOfWork() + "\n3:Estimate Value(In Fig): " + tender.getEstimateValueInFig() + "\n4:Estimate Value(In Words): " + tender.getEstimateValueInWord() + "\n5:Tender Fee(In Fig): " + tender.getTenderFeeInFig() + "\n6:" + "Tender Fee(In Words): " + tender.getTenderFeeInWord() + "\n7:Bid Validate Type: " + tender.getBidValidateType() + "\n8:Bid Validate Period: " + tender.getBidValidatePeriod() + "\n9:Work Completion Type:" + tender.getWorkCompletionType() + "\n10:Work Completion Period: " + tender.getWorkCompletionPeriod());

        System.out.println("\n1:- The Tender Release Key Dates: " + tender.getTenderKeyDates().getTenderReleaseDate()
                + "\n2:- The Tender Purcahse Key dates: " + tender.getTenderKeyDates().getTenderPurchaseDate()
                + "\n3:- The Tender Bid Submission Key Dates: " + tender.getTenderKeyDates().getBidSubmissionDate()
                + "\n4:- The Tender Opening EA: " + tender.getTenderKeyDates().getOpeningEA()
                + "\n5:- The Tender Opening EB: " + tender.getTenderKeyDates().getOpeningEB()
                + "\n6:- The Tender Opneing EC: " + tender.getTenderKeyDates().getOpeningEC());
        ModelAndView modelAndView = new ModelAndView();
        String fileconvertedName = null;
        int tenderAmendId = 0;
        int tender_KeyDateId = 0;
        List<TenderDocument> tenderDocuments = new ArrayList<>();
        List<TenderTemporaryAmendDocument> tenderTemporaryAmendDocuments = new ArrayList<>();
        try {

            Tender tender1 = (Tender) session.getAttribute("tender");
            List<TenderKeyDates> keyDates = (List<TenderKeyDates>) session.getAttribute("tenderKeyDateses");
            System.out.println("The Tender Object From session is: " + tender1);
            System.out.println("The TenderKeyDates Object From session is: " + keyDates);

            if (tender1 != null) {
                tender1.setTenderAmend_Id(0);
                BeanUtils.copyProperties(tender1, amendment);
            } else {
                tender1 = tenderDao.read(tender.getTender_Id());
                tender.setNameOfWork(tender1.getNameOfWork());
                tender.setDescriptionOfWork(tender1.getDescriptionOfWork());
                tender.setEstimateValueInFig(tender1.getEstimateValueInFig());
                tender.setEstimateValueInWord(tender1.getEstimateValueInWord());
                tender.setTenderFeeInFig(tender1.getTenderFeeInFig());
                tender.setTenderFeeInWord(tender1.getTenderFeeInWord());
                tender.setBidValidatePeriod(tender1.getBidValidatePeriod());
                tender.setBidValidateType(tender1.getBidValidateType());
                tender.setWorkCompletionType(tender1.getWorkCompletionType());
                tender.setTenderStatus("Amended");
                tender1.setTenderAmend_Id(0);
                BeanUtils.copyProperties(tender1, amendment);
            }

            if (keyDates != null) {
                keyDates.forEach((tenderKeyDates2) -> {
                    BeanUtils.copyProperties(tenderKeyDates2, tenderKeyDatesAmendment);
                });
            } else {
                tenderKeyDatesAmendment.setTenderPurchaseDate(tender.getTenderKeyDates().getTenderPurchaseDate());
                tenderKeyDatesAmendment.setBidSubmissionDate(tender.getTenderKeyDates().getBidSubmissionDate());
                tenderKeyDatesAmendment.setOpeningEA(tender.getTenderKeyDates().getOpeningEA());
                tenderKeyDatesAmendment.setOpeningEB(tender.getTenderKeyDates().getOpeningEB());
                tenderKeyDatesAmendment.setOpeningEC(tender.getTenderKeyDates().getOpeningEC());
                BeanUtils.copyProperties(tenderKeyDatesAmendment, tenderKeyDatesAmendment);
            }

            if (!statusFiles.isEmpty()) {
                fileconvertedName = fileUtility.fileUploadingUtil(statusFiles, FileUtility.UPLOAD_TENDERAMENDMENTDOCUMENT);
                System.out.println("The Ammendment Document is: " + fileconvertedName);
                amendment.setStatusDocumentAmmendment(fileconvertedName);
            }

            System.out.println("The Key Dates: " + amendment.getDescriptionOfWork() + "\n2:- fileconvertedName: " + fileconvertedName);
            if (amendment != null) {
                amendment.setTenderStatus("Amended");
                amendment.setAmmendmentDate(DateTimeUtil.currentDateInString());
                amendment.setRemarks(tender.getRemarks());
                amendment.setAmmendmentCorrigendum(tender.getAmmendmentCorrigendum());
                tenderAmendId = tenderAmendmentDao.create(amendment);
                System.out.println("The Tender Ammendment Id : " + tenderAmendId);
            }
            if (tenderKeyDatesAmendment != null) {
                tender_KeyDateId = tenderAmendmentKeyDatesDao.create(tenderKeyDatesAmendment);
                System.out.println("The Tender Key Dates Ammendment Id : " + tender_KeyDateId);
            }

            tenderDocuments = documentDao.fetchTenderDocumentByTenderId(tender.getTender_Id());
            System.out.println("The Tender Document are: " + tenderDocuments.size());
            if (!tenderDocuments.isEmpty() && ("Approved").equalsIgnoreCase(tender.getTenderStatus())) {
                tenderDocuments.forEach((documentOfTender) -> {
                    BeanUtils.copyProperties(documentOfTender, tenderDocumentAmendment);
                    tenderDocumentAmendment.setDoc_Id(0);
                    tenderDocumentAmendmentDao.createTenderDocument(tenderDocumentAmendment);
                });
            }

            tenderTemporaryAmendDocuments = tenderTemporaryAmendDocumentDao.fetchTenderTemporaryDocumentByTenderId(tender.getTender_Id());
            System.out.println("The Temporary Document size is: " + tenderTemporaryAmendDocuments.size());
            if (!tenderTemporaryAmendDocuments.isEmpty()) {
                for (TenderTemporaryAmendDocument temporaryAmendDocument : tenderTemporaryAmendDocuments) {
                    BeanUtils.copyProperties(temporaryAmendDocument, tenderDocumentAmendment);
                    tenderDocumentAmendment.setDoc_Id(0);
                    tenderDocumentAmendmentDao.createTenderDocument(tenderDocumentAmendment);
                    removeTenderAmendmentDocument(String.valueOf(tender.getTender_Id()), tenderDocumentAmendment.getDocSequnceId(), session);
                }
            }
            //modelAndView.setViewName("tenderStatusManaging/Ammendment/"+tender.getTender_Id());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/tenderStatusManaging/Amended/" + String.valueOf(tender.getTender_Id());
    }

    /*
  * fetchPreviouTenderDetails
  * Method call to fetch the previous tender Summary
  * @param tender_Id
  * @return Tender
     */
    @RequestMapping("/fetchPreviouTenderDetailsAmendment")
    @ResponseBody
    public TenderAmendment fetchPreviouTenderDetailsAmendment(@RequestParam int tenderAmend_Id) {
        TenderAmendment tendersList = new TenderAmendment();
        TenderStage tenderStages = new TenderStage();
        SelectiveTender selectiveTender = new SelectiveTender();
        EnvelopeType envelopeType = new EnvelopeType();
        TypeOfTenders ofTenders = new TypeOfTenders();
        TenderCategory category = new TenderCategory();
        AreaOfWork aow = new AreaOfWork();
        TenderKeyDatesAmendment keyDates = new TenderKeyDatesAmendment();
        TenderSubmittedEnvelopeA envelopeA = new TenderSubmittedEnvelopeA();
        TenderSubmittedEnvelopeB envelopeB = new TenderSubmittedEnvelopeB();
        Map<Integer, String> envelopeAOfficersName = new HashMap<>();
        Map<Integer, String> envelopeBOfficersName = new HashMap<>();
        try {
            tendersList = tenderAmendmentDao.read(tenderAmend_Id);
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
            keyDates = this.tenderAmendmentKeyDatesDao.readLastKeyDate(tendersList.getTender_Id());
            System.out.println("The Key dates are: " + keyDates);
            if (keyDates != null) {
                TenderKeyDates dates = new TenderKeyDates();
                BeanUtils.copyProperties(keyDates, dates);
                tendersList.setTenderKeyDates(dates);
            }

            //Fetch Envelope A Officers Name
            envelopeA = this.envelopeADaoImpl.read(tendersList.getTender_Id());
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
            envelopeB = this.envelopeBDaoImpl.read(tendersList.getTender_Id());
            //       System.out.println("The Envelope A is: "+envelopeB.getEnvelopeBOfficers());
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

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tendersList;
    }

    /*
  * tenderAmendmentDocument 
  * This method is called when to save the document for ammnedment
  * @Created 26 Aug 2018
  *  @Verison 2.0.0
     */
    @RequestMapping("/tenderAmendmentDocument")
    @ResponseBody
    public TenderTemporaryAmendDocument tenderAmendmentDocument(@ModelAttribute("formData") TenderTemporaryAmendDocument document, HttpSession session) {
        System.out.println("/::::::::::::::::::::::::::::::::::Tender Amendment Document Upload:::::::::::::::::::::::::::::::/");
        System.out.println("1:-tender_Id : " + document.getTender_id() + "\n2:-Document Name: " + document + "\n3:-Tender Document Id: " + document.getDoc_Id());
        String fileconvertedName = null;
        String response = null;
        Integer deptId = 0;
        try {
            if (session.getAttribute("deptId") != null) {
                deptId = (Integer) session.getAttribute("deptId");
                // tenderTemporaryAmendDocument.setDoc_Name(documentName);    
                MultipartFile file = document.getFile();
                if (file.getSize() > 0) {
                    fileconvertedName = fileUtility.fileUploadingUtil(file, FileUtility.UPLOAD_TENDERTEMPORARYAMENDMENTDOCUMENT);
                    document.setDoc_Converted_Name(fileconvertedName);
                    document.setDept_id(String.valueOf(deptId));
                    document.setDoc_OrignalName(file.getOriginalFilename());
                    document.setDoc_Path(FileUtility.UPLOAD_TENDERTEMPORARYAMENDMENTDOCUMENT + "/" + fileconvertedName);
                }
                tenderTemporaryAmendDocumentDao.createTenderTemporaryDocument(document);
            } else {
                session.invalidate();
                System.out.println("Session Time Out");
                this.sessionTimeOut();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return document;
    }

    public String sessionTimeOut() {
        System.out.println("Session Time Out");
        return "redirect:/";
    }

    /*
  * removeTenderDocument 
  * remove tender document by document sequence and tender Id
  * @param tender_Id, docSequnceId 
  * @return null
  * @created 2 July 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderDocumentAmendmentRemove")
    @ResponseBody
    public String removeTenderAmendmentDocument(@RequestParam("tender_Id") String tender_Id, @RequestParam("docSequnceId") int docSequnceId, HttpSession session) {
        System.out.println("/::::::::::::::::::::::::::::::Tender Amendment Document Remove:::::::::::::::::::::::::::::::/");
        System.out.println("1:-Tender Id: " + tender_Id + "\n2:-Document Id: " + docSequnceId);
        TenderTemporaryAmendDocument tenderTemporaryAmendDocument = null;
        try {
            tenderTemporaryAmendDocument = tenderTemporaryAmendDocumentDao.fetchTenderTemporaryDocumentByTenderIdAndDocSeq(Integer.parseInt(tender_Id), docSequnceId);
            System.out.println("The Tender Document is: " + tenderTemporaryAmendDocument.getDoc_Converted_Name());
            ServletContext context = session.getServletContext();
            String path = context.getRealPath(FileUtility.UPLOAD_TENDERTEMPORARYAMENDMENTDOCUMENT);
            System.out.println("Path of the file is:" + path);
            File file = new File(path + File.separator + tenderTemporaryAmendDocument.getDoc_Converted_Name());
            boolean fileDeleted = file.delete();
            System.out.println("The Document are deleted: " + fileDeleted);
            tenderTemporaryAmendDocumentDao.deleteTenderTemporaryDocumentByTenderIdAndDocSeq(Integer.parseInt(tender_Id), docSequnceId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/ViewAmendmentHistoryOfTender")
    @ResponseBody
    public List viewAmendmentHistoryOfTender(@RequestParam int tender_Id, Model model) {
        List<TenderAmendment> tenderAmendment = new ArrayList<TenderAmendment>();
        Tender tender = new Tender();
        String message = null;
        try {
            tenderAmendment = tenderAmendmentDao.readAll(tender_Id);
            tender = tenderDao.read(tender_Id);
            if (tender != null) {
                TenderAmendment ta = new TenderAmendment();
                tender.setTenderAmend_Id(0);
                BeanUtils.copyProperties(tender, ta);
                tenderAmendment.add(ta);
            }
            System.out.println("The Amend Tender Data: " + tenderAmendment.size());
            if (tenderAmendment.size() <= 1) {
                System.out.println("Previous Tender");
                model.addAttribute(message, "No Details Found");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tenderAmendment;
    }

    @RequestMapping("/searchingTenderProcess")
    @ResponseBody
    public List searchingTender(@RequestParam String tenderNoSearch, @RequestParam String statusSearch, @RequestParam String officerNameSearch, @RequestParam String nitDateSearch, HttpSession session) {
        System.out.println("Tender no: " + tenderNoSearch + "\nStatus: " + statusSearch + "\nOfficer Name: " + officerNameSearch + "\nNIT date: " + nitDateSearch);
        try {
            if (session.getAttribute("deptId") != null) {
                String deptId = session.getAttribute("deptId").toString();
            } else {
                System.out.println("Session Time Out");
                session.invalidate();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * documentAfterPurchaseTenderAmmendment 
  * Mention the document Status for purchase
  * @param documentVisibility, tender_Id, docSequnceId
  * @return null
  * @created 17 Jan 2019
  * @version 2.0.0
     */
    @RequestMapping("/documentAfterPurchaseAmmendmentTemporary")
    @ResponseBody
    public String documentAfterPurchaseAmmendmentTemporary(@RequestParam String documentVisibility, int tender_Id, int docSequnceId) {
        System.out.println("/::::::::::::::::::::::::::::Document After Purchase::::::::::::::::::::::::::::::/");
        System.out.println("The Tender id: " + tender_Id + " After Purchase: " + documentVisibility
                + "Document Sequnce Id: " + docSequnceId);
        try {
            tenderTemporaryAmendDocumentDao.updateTenderTemporaryDocumentStatus(tender_Id, documentVisibility, docSequnceId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /*
  * removeTenderDocument 
  * remove tender document by document sequence and tender Id
  * @param tender_Id, docSequnceId 
  * @return null
  * @created 2 July 2018
  * @version 2.0.0
     */
    @RequestMapping("/tenderTemporaryDocumentRemove")
    @ResponseBody
    public String removeTenderTemporaryDocument(@RequestParam("tender_Id") Integer tender_Id, HttpSession session) {
        System.out.println("/::::::::::::::::::::::::::::::Tender temporary Document Remove:::::::::::::::::::::::::::::::/");
        System.out.println("1:-Tender Id: " + tender_Id);
        TenderTemporaryAmendDocument tenderTemporaryAmendDocument = null;
        try {
            tenderTemporaryAmendDocumentDao.deleteTenderTemporaryDocument(tender_Id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
