/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.DSCInfoDao;
import com.eproc.dao.QCBSTemplateDao;
import com.eproc.dao.TenderDao;
import com.eproc.dao.TenderEnvelopeADao;
import com.eproc.dao.TenderEnvelopeBDao;
import com.eproc.dao.TenderKeyDatesDao;
import com.eproc.dao.TenderSubmittedQCBSDao;
import com.eproc.daoImpl.BankNameDaoImpl;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.EmdDaoImpl;
import com.eproc.daoImpl.EnvelopeADataDaoImpl;
import com.eproc.daoImpl.EnvelopeBDataDaoImpl;
import com.eproc.daoImpl.EnvelopeCDataDaoImpl;
import com.eproc.daoImpl.PaymentDAOImpl;
import com.eproc.daoImpl.QcbsDataDaoImpl;
import com.eproc.daoImpl.TenderAmendmentDaoImpl;
import com.eproc.daoImpl.TenderDaoImpl;
import com.eproc.daoImpl.TenderEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderEnvelopeBDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeBDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeCDaoImpl;
import com.eproc.daoImpl.TenderSubmittedQCBSDaoImpl;
import com.eproc.daoImpl.TypeOfTendersDAOImpl;
import com.eproc.domain.BankName;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.DSCInformationForContractor;
import com.eproc.domain.DSCInformationForDepartmentUser;
import com.eproc.domain.DynamicTemplatePojo;
import com.eproc.domain.EmdPayment;
import com.eproc.domain.EnvelopeAData;
import com.eproc.domain.EnvelopeBData;
import com.eproc.domain.EnvelopeCData;
import com.eproc.domain.Logs;
import com.eproc.domain.PurchaseDetails;
import com.eproc.domain.QCBSTemplate;
import com.eproc.domain.QcbsData;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderEnvelopeA;
import com.eproc.domain.TenderEnvelopeB;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderKeyDatesAmendment;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.domain.TenderSubmittedEnvelopeB;
import com.eproc.domain.TenderSubmittedEnvelopeC;
import com.eproc.domain.TenderSubmittedQCBS;
import com.eproc.dto.EnvelopeCDto;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.EmdModel;
import com.eproc.model.TemplateModel;
import com.eproc.model.ValidateEnvelopeAModel;
import com.eproc.model.ValidateEnvelopeBModel;
import com.eproc.service.DepartmentService;
import com.eproc.util.AesEncrDec;
import com.eproc.util.CommonUtil;
//import com.eproc.util.FileDetector;
import com.eproc.util.FileUtility;
import com.eproc.util.GsonUtility;
import com.eproc.util.HashValue;
import com.eproc.util.KeyGeneratorRandom;
import com.google.gson.Gson;
import com.lincpay.merchant.util.MerchantCryptoUtil;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.persistence.Transient;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.SysexMessage;
import org.hibernate.Session;
import org.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Vaishali Gupta 06-10-2018
 */
@Controller
public class TenderBiddingController {

    @Transient
    private String template;

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    @Override
    public String toString() {
        return "{\"template\":" + template + "}";
    }

    @Autowired
    TenderKeyDatesDao tenderKeyDatesDao;

    private long timer;
    @Autowired
    PaymentDAOImpl paymentDAOImpl;
    @Autowired
    TenderDaoImpl tenderDaoImpl;
    @Autowired
    TenderSubmittedEnvelopeADaoImpl tenderSubmittedEnvelopeADaoImpl;
    @Autowired
    TenderSubmittedEnvelopeBDaoImpl tenderSubmittedEnvelopeBDaoImpl;
    @Autowired
    TenderSubmittedEnvelopeCDaoImpl tenderSubmittedEnvelopeCDaoImpl;
    @Autowired
    TenderEnvelopeADaoImpl tenderEnvelopeADaoImpl;
    @Autowired
    TenderEnvelopeBDaoImpl tenderEnvelopeBDaoImpl;
    @Autowired
    ETenderingController ETenderingController;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    EnvelopeADataDaoImpl envelopeADataDaoImpl;
    @Autowired
    EnvelopeBDataDaoImpl envelopeBDataDaoImpl;
    @Autowired
    EnvelopeCDataDaoImpl envelopeCDataDaoImpl;
    @Autowired
    FileUtility fileUtility;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    LogsAction logsAction;
    @Autowired
    LogsActionDao logsActionDao;
//    @Autowired
//    FileDetector fileDetector;
    @Autowired
    TenderEnvelopeADao tenderEnvelopeADao;
    @Autowired
    TenderEnvelopeBDao tenderEnvelopeBDao;

    @Autowired
    TenderSubmittedQCBSDao tenderQCBSDao;

    @Autowired
    TemplateModel templateModel;
    @Autowired
    TypeOfTendersDAOImpl typeOfTendersDAOImpl;
    @Autowired
    ValidateEnvelopeAModel validateEnvelopeAModel;
    @Autowired
    ValidateEnvelopeBModel validateEnvelopeBModel;

    @Autowired
    QcbsDataDaoImpl qcbsDataDaoImpl;

    Logs logs = new Logs();
    @Autowired
    EmdModel emdmodel;
    @Autowired
    EmdDaoImpl emdDaoImpl;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    ContractorDetailsdaoImpl contractorDetailsdaoImpl;
    @Autowired
    BankNameDaoImpl bankNameDaoImpl;
    @Autowired
    TenderAmendmentDaoImpl amendmentDaoImpl;

    @Autowired
    TenderSubmittedQCBSDaoImpl tenderSubmittedQCBSDaoImpl;

    @Autowired
    TenderDao tenderDao;

    @Autowired
    QCBSTemplateDao QCBSDao;

    @Autowired
    AesEncrDec aesEncrDec;

    @Autowired
    private DSCInfoDao dscInfoDao;

    private String encKey = "sdfkof344jy56ddcsjrtudjmowow78493";

//   QCBSTemplate template = new QCBSTemplate();
    private String qcbsTemplateId;

    public String getQcbsTemplateId() {
        return qcbsTemplateId;
    }

    public void setQcbsTemplateId(String qcbsTemplateId) {
        this.qcbsTemplateId = qcbsTemplateId;
    }

    /*
     * Check Tender bidding StartDate and EndDate 
     * Method used to Show Purchased Tender's bidding availability
     * @param 
     * @return purchased Tender List 
     */
    public List purchasedTenderList(HttpSession session) {
        List<Tender> purchasedTenderList = new ArrayList();
        List<TenderKeyDatesAmendment> datesAmendment = new ArrayList<>();
        TenderKeyDatesAmendment amendment = new TenderKeyDatesAmendment();
        TenderKeyDates dates = new TenderKeyDates();
        String biddingstartdate = "";
        String biddingenddate = "";

        List<PurchaseDetails> purchaseDetailsList = new ArrayList<>();
        List<TenderKeyDates> tenderKeyDateses = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        try {
            int contloginid = (int) session.getAttribute("contRegId");
            System.out.println("Contractor Id: " + contloginid);
            if (contloginid != 0) {
                purchaseDetailsList = paymentDAOImpl.fetchAllPurchaseDetailsByContId(contloginid);
            }

            for (PurchaseDetails purchaseDetails : purchaseDetailsList) {
                System.out.println("Tender Id" + purchaseDetails.getTender_Id());

                if (purchaseDetails.getTender_Id() != 0) {

                    Tender tender = tenderDaoImpl.read(purchaseDetails.getTender_Id());
                    //System.out.println("The tender Status is:"+tender.getTenderStatus());
                    if (tender.getTenderStatus().equalsIgnoreCase("Approved") || tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                        if (tender.getTenderStatus().equalsIgnoreCase("Approved")) {
                            tender.setTenderKeyDates(tenderDaoImpl.readKeyDate(purchaseDetails.getTender_Id()));
                            System.out.println("TENDER STAGE" + tender.getTenderStage());
                        }
                        if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                            datesAmendment = amendmentDaoImpl.readAllKeyDates(purchaseDetails.getTender_Id());
                            for (TenderKeyDatesAmendment amendments : datesAmendment) {
                                amendment = amendments;
                            }
                            BeanUtils.copyProperties(amendment, dates);
                            // System.out.println("The Amended date is:"+dates.getBidSubmissionDate());
                            tender.setTenderKeyDates(dates);
                        }

                        if ("2".equals(tender.getTenderStage()) && !purchaseDetails.getPurchaseDate().isEmpty()
                                && tender.getTenderKeyDates().getEcBidSubmissionDate() != null) {
                            System.out.println("TENDER");

                            String bidSubmissionDate = tender.getTenderKeyDates().getEcBidSubmissionDate().trim();
                            String[] bidDates = bidSubmissionDate.split("/");

                            if (bidDates.length >= 2) {
                                String s1 = bidDates[0];
                                String s2 = bidDates[1];
                                System.out.println("S1" + s1 + " " + "S2" + s2);
                                // Further processing using s1 and s2

                                Date d1 = new Date(s1);
                                Date d2 = new Date(s2);
                                System.out.println("DATE D1" + " " + d1 + " " + "DATE2" + d2);
                                if (sdf.parse(sdf.format(new Date())).getTime() >= d1.getTime() && sdf.parse(sdf.format(new Date())).getTime() <= d2.getTime()) {
                                    tender.setProcesstoCBid(true);
                                    tender.setProceedtoBid(true);
                                    System.out.println("CCCCCCCCC " + tender.getTender_Id() + " " + tender.isProcesstoCBid() + " " + tender.isProceedtoBid());
                                    if (sdf.parse(sdf.format(new Date())).getTime() >= d2.getTime()) {
                                        tender.setViewOnly(true);
                                    }
                                } else {
                                    System.out.println("ECCCC  FLASE");
                                    tender.setProcesstoCBid(false);
                                }

                            } else {
                                System.out.println("Error: Bid submission date is not in the expected format");
                                // Handle the case when the array doesn't have enough elements
                            }
                        }

                        biddingstartdate = tender.getTenderKeyDates().getBidSubmissionDate().trim().split("/")[0];
                        biddingenddate = tender.getTenderKeyDates().getBidSubmissionDate().trim().split("/")[1];
                        System.out.println("The Bidding Start date: " + biddingstartdate + "\nThe Bidding End date: " + biddingenddate);

                        Date date1 = new Date(biddingstartdate);

                        Date date2 = new Date(biddingenddate);
                        System.out.println("Start date: " + date1 + "End Date: " + date2);
                        if (sdf.parse(sdf.format(new Date())).getTime() >= date1.getTime() && sdf.parse(sdf.format(new Date())).getTime() <= date2.getTime()) {
                            tender.setProceedtoBid(true);
                            System.out.println("llllllllllllll " + tender.getTender_Id() + " " + tender.isProceedtoBid());

                            if (sdf.parse(sdf.format(new Date())).getTime() >= date2.getTime()) {

                                tender.setViewOnly(true);
                            }
                        } else {

                            tender.setProceedtoBid(false);
                            //  System.out.println("? " + tender.getTender_Id() + " " + tender.isProceedtoBid());
                        }

                        //   System.out.println("tender  nit 11" + tender.getTenderKeyDates().getBidSubmissionDate());
                        purchasedTenderList.add(tender);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return purchasedTenderList;
    }

    /*
     * Show Purchased Tenders
     * Method used to Show Purchased Tenders
     * @param 
     * @return jsp page
     */
    @RequestMapping("/myTender")
    public String myTender(HttpSession session, Model m) {

        System.out.println("inside MYTENDER");
        List<Tender> purchasedTenderList = new ArrayList<>();
        try {
            purchasedTenderList = purchasedTenderList(session);
            m.addAttribute("DynamicTemplatePojo", new DynamicTemplatePojo());
            m.addAttribute("envelopeCData", new EnvelopeCData());
            m.addAttribute("purchasedTenderList", purchasedTenderList);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "Contractor/MyTender";
    }

    /*
     * Select the perticulor Tender for biddind
     * Method used to Select the perticulor Tender for biddind
     * @param int tenderId
     * @return jsp page
     */
    @RequestMapping("/proceedtoBid")
    public String proceedtoBid(@RequestParam int tenderId, HttpSession session, Model m) throws ParseException {
        System.out.println("inside proseed to bid tender id " + tenderId);
        Map<Integer, String> percentRateList = new LinkedHashMap<>();
        List<TenderEnvelopeA> envelopeAToShow = new ArrayList<>();
        List<TenderEnvelopeB> envelopeBToShow = new ArrayList<>();
        List<QCBSTemplate> qcbsToShow = new ArrayList<>();
        ContractorDetails contdetail = new ContractorDetails();
        int envelopeAId = 0;
        int envelopeBId = 0;
        int qcbsId = 0;
        String action = "";
        String envelopeCfor = "";
//         Tender tender = null;
//        int contRegId = 0;
        EmdPayment emdPayment = new EmdPayment();
        try {
            int contloginid = (int) session.getAttribute("contRegId");
            System.out.println("contRegId :::" + contloginid);
            session.setAttribute("tenderId", tenderId);
            Tender tender = tenderDaoImpl.read(tenderId);
            m.addAttribute("contId", contloginid);
            if (contloginid != 0) {
                contdetail = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(contloginid);
            }
            //System.out.println("contdetail.getSocialCategory():::" + contdetail.getSocialCategory() + "id" + contdetail.getContOtherId());
            m.addAttribute("emdPayment", new EmdPayment());
            String status = tender.getModeOfFeeForEMDApplicable();
            m.addAttribute("status", status);
            String emdApplicable = tender.getEmdApplicable();
            m.addAttribute("emdApplicable", emdApplicable);
            double emdvalue = Double.parseDouble(tender.getEmdInFig());
            m.addAttribute("emdvalue", emdvalue);
            List<BankName> banknamelist = bankNameDaoImpl.fetchAll();
            m.addAttribute("banknamelist", banknamelist);
            String msmensicExemtion = tender.getMsmensicExemption();
            m.addAttribute("msmeExemtion", msmensicExemtion);
            String scstExemtion = tender.getScstExemption();
            m.addAttribute("scstExemtion", scstExemtion);
            String obcExemtion = tender.getObcExemption();
            m.addAttribute("obcExemtion", obcExemtion);

            if ((contdetail.getSocialCategory().equals("1") || contdetail.getSocialCategory().equals("2")) && (contdetail.getContCompanyType().equals("1") || contdetail.getContCompanyType().equals("2"))) {
                System.out.println("msme scst register");
                if (tender.getMsmensicExemption().equals("Allowed") && tender.getScstExemption().equals("Allowed")) {
                    System.out.println("msme scst allow");
                    if (tender.getEmdMSMENSICExemption() != null) {
                        double emdMsmeNsic = Double.parseDouble(tender.getEmdMSMENSICExemption());
                        System.out.println("emdMsmeNsic::" + emdMsmeNsic);
                        m.addAttribute("emdMsmeNsic", emdMsmeNsic);
                        double TotalEmdMsme = (emdvalue * emdMsmeNsic) / 100;
                        double remainEmdMsmee = emdvalue - TotalEmdMsme;
                        System.out.println("remainEmdMsmee" + remainEmdMsmee);
                        emdPayment.setEmdExemption(Double.toString(emdMsmeNsic));
                        String remainEmdMsme = new DecimalFormat("##.##").format(remainEmdMsmee);
                        m.addAttribute("remainEmdMsme", remainEmdMsme);
                    }
                    if (tender.getEmdTenderSCSTFeeExemption() != null) {
                        double emdScst = Double.parseDouble(tender.getEmdTenderSCSTFeeExemption());
                        System.out.println("emdScst" + emdScst);
                        m.addAttribute("emdScst", emdScst);
                        double TotalEmdScst = (emdvalue * emdScst) / 100;
                        double remainEmdScstt = emdvalue - TotalEmdScst;
                        System.out.println("remainEmdScstt" + remainEmdScstt);
                        emdPayment.setEmdExemption(Double.toString(emdScst));
                        String remainEmdScst = new DecimalFormat("##.##").format(remainEmdScstt);
                        String scstStatus = "SCST";
                        m.addAttribute("remainEmdScst", remainEmdScst);
                        m.addAttribute("scstStatus", scstStatus);

                    }

                }
            } else if (contdetail.getSocialCategory().equals("4") && (contdetail.getContCompanyType().equals("1") || contdetail.getContCompanyType().equals("2"))) {
                System.out.println("msme obc register");
                if (tender.getMsmensicExemption().equals("Allowed") && tender.getObcExemption().equals("Allowed")) {
                    System.out.println("msme obc allow");
                    // System.out.println("in OBC if condition::: " + contdetail.getSocialCategory());

                    if (tender.getEmdMSMENSICExemption() != null) {
                        double emdMsmeNsic = Double.parseDouble(tender.getEmdMSMENSICExemption());
                        System.out.println("emdMsmeNsic::" + emdMsmeNsic);
                        m.addAttribute("emdMsmeNsic", emdMsmeNsic);
                        double TotalEmdMsme = (emdvalue * emdMsmeNsic) / 100;
                        double remainEmdMsmee = emdvalue - TotalEmdMsme;
                        System.out.println("remainEmdMsmee" + remainEmdMsmee);
                        emdPayment.setEmdExemption(Double.toString(emdMsmeNsic));
                        String remainEmdMsme = new DecimalFormat("##.##").format(remainEmdMsmee);
                        m.addAttribute("remainEmdMsme", remainEmdMsme);
                    }
                    if (tender.getEmdTenderOBCFeeExemption() != null) {
                        double emdObc = Double.parseDouble(tender.getEmdTenderOBCFeeExemption());
                        System.out.println("emdObc" + emdObc);
                        m.addAttribute("emdObc", emdObc);
                        double TotalEmdObc = (emdvalue * emdObc) / 100;
                        double remainEmdObcc = emdvalue - TotalEmdObc;
                        System.out.println("remainEmdObcc" + remainEmdObcc);
                        emdPayment.setEmdExemption(Double.toString(emdObc));
                        String remainEmdObc = new DecimalFormat("##.##").format(remainEmdObcc);
                        m.addAttribute("remainEmdObc", remainEmdObc);
                        String obcStatus = "OBC";
                        m.addAttribute("obcStatus", obcStatus);

                    }

                }
            } else if ((contdetail.getSocialCategory().equals("1") || contdetail.getSocialCategory().equals("2")) && contdetail.getContCompanyType().equals("3")) {
                System.out.println("scst register ");
                if (tender.getScstExemption().equals("Allowed")) {
                    System.out.println("scst allow");
                    if (tender.getEmdTenderSCSTFeeExemption() != null) {
                        double emdScst = Double.parseDouble(tender.getEmdTenderSCSTFeeExemption());
                        System.out.println("emdScst" + emdScst);
                        m.addAttribute("emdScst", emdScst);
                        double TotalEmdScst = (emdvalue * emdScst) / 100;
                        double remainEmdScstt = emdvalue - TotalEmdScst;
                        System.out.println("remainEmdScstt" + remainEmdScstt);
                        emdPayment.setEmdExemption(Double.toString(emdScst));
                        String remainEmdScst = new DecimalFormat("##.##").format(remainEmdScstt);
                        m.addAttribute("remainEmdScst", remainEmdScst);
                        String scstStatus = "SCST";
                        m.addAttribute("scstStatus", scstStatus);
                    }
                }
            } else if (contdetail.getSocialCategory().equals("4") && contdetail.getContCompanyType().equals("3")) {
                System.out.println("obc register");

                if (tender.getObcExemption().equals("Allowed")) {
                    if (tender.getEmdTenderOBCFeeExemption() != null) {
                        double emdObc = Double.parseDouble(tender.getEmdTenderOBCFeeExemption());
                        System.out.println("emdObc" + emdObc);
                        m.addAttribute("emdObc", emdObc);
                        double TotalEmdObc = (emdvalue * emdObc) / 100;
                        double remainEmdObcc = emdvalue - TotalEmdObc;
                        System.out.println("remainEmdObcc" + remainEmdObcc);
                        emdPayment.setEmdExemption(Double.toString(emdObc));
                        String remainEmdObc = new DecimalFormat("##.##").format(remainEmdObcc);
                        m.addAttribute("remainEmdObc", remainEmdObc);
                        String obcStatus = "OBC";
                        m.addAttribute("obcStatus", obcStatus);
                    }
                }
            }

            TenderSubmittedEnvelopeA submittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            TenderSubmittedEnvelopeB submittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);
            TenderSubmittedEnvelopeC submittedEnvelopeC = tenderSubmittedEnvelopeCDaoImpl.read(tenderId);
            String ten = tender.getEnvelopeType();
            System.out.println("TENDERRRRRRRRR" + ten);
            if ("4".equals(tender.getEnvelopeType())) {
                String s = tender.getTenderMasterId();
                System.out.println("Tender Mater Id" + s);
                TenderSubmittedQCBS submittedEnvelopQCBS = tenderSubmittedQCBSDaoImpl.read(tenderId);
                System.out.println("TEMPLATE ID" + submittedEnvelopQCBS.getTemplateId());
                String templateId = String.valueOf(submittedEnvelopQCBS.getTemplateId());

                m.addAttribute("templateId", templateId);
                m.addAttribute("DeptUserId", s);
            }
            if (submittedEnvelopeA != null) {

                envelopeAId = (submittedEnvelopeA.getEnvelopeAId());
                session.setAttribute("envelopeAId", envelopeAId);
                envelopeAToShow = tenderEnvelopeADao.readAll(envelopeAId);

            }
            if (submittedEnvelopeB != null) {

                envelopeBId = (submittedEnvelopeB.getEnvelopeBId());
                session.setAttribute("envelopeBId", envelopeBId);
                envelopeBToShow = tenderEnvelopeBDao.readAll(envelopeBId);

            }
            if (submittedEnvelopeC != null) {

                envelopeCfor = checkEnvelopeCType(tenderId);

                System.out.println("envelope C for " + envelopeCfor);
//            envelopeAId = (submittedEnvelopeC.getEnvelopeCId());
//  session.setAttribute("envelopeBId", submittedEnvelopeB.getEnvelopeBId());
//              envelopeAsToShow = tenderEnvelopeCDao.readAll(envelopeAId);
                m.addAttribute("envelopeCfor", envelopeCfor);

//            session.setAttribute("envelopeAId", submittedEnvelopeA.getEnvelopeAId());
            }

            TenderKeyDates dates = tenderKeyDatesDao.readKeyDate(tenderId);

            SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
            //Stage 2 envelop 2
            if ("2".equals(tender.getTenderStage()) && dates.getOpeningEA() != null && "2".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE " + tender.getTenderStage());
                if (dates.getOpeningEA() != null) {
                    System.out.println("STAGE @" + tender.getTenderStage());

                    String ECDate = dates.getOpeningEA().trim().split("/")[0]; // Handle parse exception
                    System.out.println("The EC DATE: " + ECDate);
                    // Assuming ECDate is in a format that Date constructor can parse.
                    // If not, you might need to use SimpleDateFormat to parse it properly.
                    Date date1 = new Date(ECDate);  // Adjust the date format as needed
                    System.out.println("EC DATE: " + date1);
                    // Compare current date with ECDate
                    if (sdf.parse(sdf.format(new Date())).getTime() <= date1.getTime()) {

                        m.addAttribute("showEC", false);
                        m.addAttribute("showEA", true);
                        System.out.println("SHOWEC TRUE");
                    } else {
                        m.addAttribute("showEC", true);
                        m.addAttribute("showEA", false);
                        System.out.println("ECCCC FALSE");
                    }
                } else {
                    System.out.println("Opening EC date is null, running next code...");
                    // Add your additional logic here for the null case
                    m.addAttribute("showEC", false); // Example of setting a default value
                }

            }

//             String openingEc = dates.getOpeningEC();
//            if("1".equals(tender.getTenderStage())&&openingEc.equals("")){
//                m.addAttribute("showEC", false);
//                System.out.println("arhammmmmmmmmmmmmmmmmm"+false);
//            }
//            else{
//                m.addAttribute("showEC", true);
//                System.out.println("SHOWEC TRUE");
//                System.out.println("TENDER STAGE"+tender.getTenderStage());
//                        
//            }
//            if(dates.getEcBidSubmissionDate()==null&&"2".equals(tender.getTenderStage())){
//                System.out.println("EAA FALSE");
//                m.addAttribute("showEA",false);
//                  m.addAttribute("showEB",false);
//                
//            }
//            else{
//                System.out.println("EAA TRUE");
//               m.addAttribute("showEA",true);
//              
//            }
            // stage 2 EC Date
            //stage 1 envelop 2 
            if ("1".equals(tender.getTenderStage()) && "2".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                m.addAttribute("showEA", true);
                m.addAttribute("showEC", true);
                System.out.println("EAAAAAAA is TRUE");
            } else if ("1".equals(tender.getTenderStage()) && "2".equals(tender.getEnvelopeType())) {
                m.addAttribute("showEA", false);
                System.out.println("EAAAAAAA is FALSE");
            } else {
                System.out.println("NOOOOO");
            }
            //stage 1 envelop 3
            if ("1".equals(tender.getTenderStage()) && "3".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                m.addAttribute("showEA", true);
                m.addAttribute("showEB", true);
                m.addAttribute("showEC", true);

                System.out.println("EA EB EC is TRUE");
            } else if ("1".equals(tender.getTenderStage()) && "3".equals(tender.getEnvelopeType())) {
                m.addAttribute("showEA", false);
                m.addAttribute("showEB", false);
                m.addAttribute("showEC", false);
                System.out.println("EA EB EC  is FALSE");
            } else {
                System.out.println("NAAAAAA");
            }

            //Stage 2 envelop 3
            if ("2".equals(tender.getTenderStage()) && dates.getOpeningEC() != null && "3".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE " + tender.getTenderStage());
                if (dates.getOpeningEC() != null) {
                    System.out.println("STAGE @" + tender.getTenderStage());

                    String ECDate = dates.getOpeningEC().trim().split("/")[0]; // Handle parse exception
                    System.out.println("The EC DATE: " + ECDate);
                    // Assuming ECDate is in a format that Date constructor can parse.
                    // If not, you might need to use SimpleDateFormat to parse it properly.
                    Date date1 = new Date(ECDate);  // Adjust the date format as needed
                    System.out.println("EC DATE: " + date1);
                    // Compare current date with ECDate
                    if (sdf.parse(sdf.format(new Date())).getTime() <= date1.getTime()) {

                        m.addAttribute("showEC", true);
                        System.out.println("SHOWEC TRUE");
                    } else {
                        m.addAttribute("showEC", false);
                        m.addAttribute("showEA", true);
                        m.addAttribute("showEB", true);

                        System.out.println("ECCCC FALSE");
                    }
                } else {
                    System.out.println("Opening EC date is null, running next code...");
                    // Add your additional logic here for the null case
                    m.addAttribute("showEC", false); // Example of setting a default value
                }

            }

            if ("1".equals(tender.getTenderStage()) && "1".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                m.addAttribute("showEA", true);
                m.addAttribute("showEB", false);
                m.addAttribute("showEC", false);

                System.out.println("11111EA EB EC is TRUE");
            } else {
                System.out.println("NAAAAAA");
            }

            if ("1".equals(tender.getTenderStage()) && "4".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                m.addAttribute("showEA", true);
                m.addAttribute("showEB", true);
                m.addAttribute("showEC", true);

                System.out.println("EA EB EC is TRUE");
            } else {
                System.out.println("NAAAAAA");
            }

            if ("1".equals(tender.getTenderStage()) && "4".equals(tender.getEnvelopeType())) {
                System.out.println("4444");
                m.addAttribute("showQCBS", true);
                m.addAttribute("showEB", false);
                System.out.println("BBBBBBBB");
            } else if ("1".equals(tender.getTenderStage()) && "4".equals(tender.getEnvelopeType())) {
                m.addAttribute("showQCBS", false);
                m.addAttribute("showEB", true);
                System.out.println("BBBBBBBB");
            } else {
                System.out.println("BBBBBBBB");
            }

//                String openingEb = dates.getOpeningEB();
//            if(openingEb.equals(""))
//            {
//             m.addAttribute("showEB", false);
//
//                System.out.println("SHOW EB FALSE");
//            }
//            else if("2".equals(tender.getTenderStage())&& "3".equals(tender.getEnvelopeType())&&dates.getEcBidSubmissionDate()!=null){
//                System.out.println("@ STAGE");
//                  
//                m.addAttribute("showEB", false);
//            }
//            else
//            {
//                
//                m.addAttribute("showEB", true);
//                     System.out.println("SHOW EB TRUE");
//            } 
//               if (session.getAttribute("contRegId") != "" || session.getAttribute("contRegId") != null) {
//                contRegId = (int) session.getAttribute("contRegId");
//
//            }
//            tender = tenderDaoImpl.read(tenderId);
            List<EnvelopeAData> envelopeAData = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, contloginid);

            List<EnvelopeBData> envelopeBData = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, contloginid);

            List<EnvelopeCData> envelopeCData = envelopeCDataDaoImpl.fetchEnvelopeCById(tenderId, contloginid);

            if (!envelopeAData.isEmpty()) {
                System.err.println("A data is Submiited");
                m.addAttribute("showEAData", false);
            } else {
                m.addAttribute("showEAData", true);
            }
            if (!envelopeBData.isEmpty()) {
                m.addAttribute("showEBData", false);
            } else {
                m.addAttribute("showEBData", true);
            }
            if (!envelopeCData.isEmpty()) {
                m.addAttribute("showECData", false);
            } else {
                m.addAttribute("showECData", true);
            }

            percentRateList = percentRate();
            m.addAttribute("DynamicTemplatePojo", new DynamicTemplatePojo());
            m.addAttribute("envelopeCData", new EnvelopeCData());
            m.addAttribute("submitBid", "submit");
            m.addAttribute("percentRateList", percentRateList);
            m.addAttribute("envelopeAToShow", envelopeAToShow);
            m.addAttribute("envelopeBToShow", envelopeBToShow);
            m.addAttribute("tenderId", tenderId);
            m.addAttribute("tender", tender);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "Contractor/ShowEnvelope1";
    }

    /*
     * upload Envelope files to server during bidding
     * Method used to upload Envelope files to server during bidding
     * @param MultipartFile files,String fieldName(of file)
     * @return jsp page
     */
 /*
     * update Envelope files to server during bidding
     * Method used to update Envelope files to server during bidding
     * @param MultipartFile files,String fieldName(of file)
     * @return jsp page
     */
 /*
     * saveEnvelopeAData 
     * Method used to save Envelope A Data
     * @param DynamicTemplatePojo dynamicTemplatePojo
     * @return Json response
     */
 /*
     * saveEnvelopBData 
     * Method used to save Envelope B Data
     * @param DynamicTemplatePojo dynamicTemplatePojo
     * @return Json response
     */
 /*
     * fetchEnvelopeAData 
     * Method used to fetch Envelope A Data
     * @param 
     * @return List
     */
 /*
     * checkRebid 
     * Method used to check tender Re-bidding and BidwithDraw status 
     * @param 
     * @return response
     */
    @RequestMapping("/SaveEnvelopBData")
    @ResponseBody
    public String saveOrUpdateQCBSTemplate(MultipartHttpServletRequest request, HttpSession session, String template) {
        String response = "";
          Tender tender = new Tender();
        Integer departmentUserId = 0;
        TenderSubmittedQCBS submittedQcbs=null;
        try {

            String status = "";
            String question = "";
            String convertedName = "";
            QcbsData qcbs = new QcbsData();

            String tenderId = request.getParameter("tenderId");
            Integer templateId = Integer.parseInt(request.getParameter("templateId"));
            Integer contId = Integer.parseInt(request.getParameter("contId"));
            String deptUserID = request.getParameter("deptUserId");
            Integer deptUsersIdd = Integer.parseInt(deptUserID);
            System.out.println("THE Department ID" + deptUserID);
            System.out.println("The TenderID Name is : " + tenderId);
            System.out.println("The Template Name is : " + templateId);
            System.out.println("Contractor Id: " + contId);

            String url = FileUtility.UPLOAD_TEMPORARYDOCUMENT;

            List<Tender> tenderList = tenderDao.readAll();
            List<String> list1 = new ArrayList<>();
            list1.add(template);

            // Process each row of data in the received list
            qcbs.setTemplate("[{\"template\"" + ":" + template + "}]");

            System.out.println("LLL" + qcbs.getTemplate());

            Map<String, MultipartFile> files = request.getFileMap();
            int index = 0; // Initialize an index to keep track of the files

            List<String> list = new ArrayList<>();
            int count = 0;
            String json1 = "";
            for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {

                String paramName = entry.getKey();
                MultipartFile file = entry.getValue();
                question = paramName; // Assume the question text is the parameter name itself

                System.out.println("ENTRY" + entry);
                // Handle file upload logic here
                if (file != null && !file.isEmpty()) {
                    String fileName = file.getOriginalFilename();

                    // Display question
                    System.out.println("File Name: " + fileName);

                    // Your file handling logic here
                    convertedName = fileUtility.fileUploadingUtil(file, url);
                    session.setAttribute("convertedName" + index, convertedName);
                    System.out.println("URL: " + servletContext.getContextPath() + url + File.separator + convertedName);

                    list.add(convertedName);

                    Gson gson1 = new Gson();
                    json1 = gson1.toJson(list);
                    System.out.println("JSON111111: " + json1);

                } else {
                    convertedName = (String) session.getAttribute("convertedName" + index);
                    System.out.println("CONVERTED FILE NAME: " + convertedName);
                }
//                    if (tenderId != null && contId != 0) {
//
//                submittedQcbs = tenderSubmittedQCBSDaoImpl.read(Integer.parseInt(tenderId));
//                tender = tenderDaoImpl.read(Integer.parseInt(tenderId));
//
//            }
//                  String randomKey =KeyGeneratorRandom.generateRandomKey();
//            String officer[] = submittedQcbs.getQCBSOfficers().split(",");
//             for (int i = 0; i < officer.length; i++) {      
//                String dpUserKey = "";
//                String conKey = "";
//                List<DSCInformationForDepartmentUser> dpUserDscList = dscInfoDao.getDepartmentUserData(officer[i], "Encryption");
//                if (!dpUserDscList.isEmpty()) {
//                    DSCInformationForDepartmentUser dSCInformationForDepartmentUser = dpUserDscList.get(0);
//
//                    dpUserKey = aesEncrDec.encrypt(randomKey, dSCInformationForDepartmentUser.getDscPublicKey());
//                }
//
//                List<DSCInformationForContractor> conDscList = dscInfoDao.getBidderData(String.valueOf(contId), "Encryption");
//                if (!conDscList.isEmpty()) {
//                    DSCInformationForContractor dSCInformationForContractor = conDscList.get(0);
//                    conKey = aesEncrDec.encrypt(randomKey, dSCInformationForContractor.getDscPublicKey());
//
//                }
//                
//                
//             }
            
                qcbs.setTenderId(tenderId);
                qcbs.setTemplateId(templateId);
                qcbs.setContractorId(contId);
                qcbs.setFileName(json1);
                qcbs.setFilePath(servletContext.getContextPath() + url + File.separator);
                qcbs.setTemplate("[{\"template\"" + ":" + template + "}]");
                qcbs.setFileNumber(question);
                qcbs.setDepartmentUserId(deptUsersIdd);

//                System.out.println("Tender Id" + qcbs.getTenderId());
//                System.out.println("Template Id" + qcbs.getTemplateId());
//                System.out.println("Contractor Id" + qcbs.getContractorId());
//                System.out.println("JSONDATA" + qcbs.getTemplate());
//                System.out.println("FILE PATH" + qcbs.getFilePath());
//                System.out.println("FILE NUMBER" + qcbs.getFileNumber());
//                System.out.println("DEPARTMENT " + qcbs.getDepartmentUserId());
//                System.out.println("");
//                String encryptionKey = "ixbd6cm5ybclt6hojwy3px1802cnddjr";
//                Gson g = new Gson();
//                String plainText = qcbs.getTenderId();
//                System.out.println("This is plain text" + plainText);
//                String encryptData = new MerchantCryptoUtil().encryptMData(plainText, encryptionKey);
//                System.out.println("encrypted String: " + encryptData);
//                String decryptedData = new MerchantCryptoUtil().decryptMData(encryptData, encryptionKey);
//                System.out.println("Decrypted String"+decryptedData);
                    boolean flag1 = checkTenderBiddingDate(Integer.parseInt(tenderId));
                System.out.println(" flag1 " + flag1);

              
                if (flag1 == true) {
                       status = qcbsDataDaoImpl.create(qcbs);
                response = "success";
                logs.setActivity("Bid on Envelope B");
                logs.setLogMessage("Envelope B bidding is Submitted");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contId);
                logs.setTenderId(Integer.parseInt(tenderId));
               
                logs.setEnvelope("QCBS");
               int n= logsActionDao.save(logs);
                if(n==1){
                    System.out.println("11111111111");
                }
                else{
                    System.out.println("00000000000");
                }
                   
            }
                       
                index++; // Increment the index for the next iteration
                count++;
            }
            System.out.println("COUNTTT" + count);
            System.out.println("FILEEEE" + list);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    @RequestMapping("/checkRebid")
    @ResponseBody
    public String checkRebid(HttpSession session) {
        String response = "";
        try {
            //int tender_Id = (int)session.getAttribute("tenderId");
            int tender_Id = 0;
            Map<String, Boolean> checkRebid = new LinkedHashMap<String, Boolean>();
            boolean reBid = false;
            boolean bidWithDraw = false;

            Tender tender = new Tender();
            tender_Id = 100;
            if (tender_Id != 0) {

                tender = tenderDaoImpl.read(tender_Id);

                if (tender.getTenderRebid().equalsIgnoreCase("Allowed")) {
                    reBid = true;
                    checkRebid.put("reBid", reBid);
                } else {
                    checkRebid.put("reBid", reBid);
                }

                if (tender.getTenderBidWithdraw().equalsIgnoreCase("Allowed")) {

                    bidWithDraw = true;
                    checkRebid.put("bidWithDraw", bidWithDraw);

                } else {

                    checkRebid.put("bidWithDraw", bidWithDraw);
                }
            }
            Gson gson = new Gson();
            response = gson.toJson(checkRebid);
            gsonUtility.responseData(response);
            System.out.println("response " + response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }

    /*
     * viewBid 
     * Method used to fetch Envelope A, Envelope B,Envelope C
     * @param int tenderId
     * @return jsp page
     */
    @RequestMapping("/viewBid")
    public String viewBid(@RequestParam int tenderId, HttpSession session, Model m, @ModelAttribute EnvelopeCData envelopeCData) {
        Map<Integer, String> percentRateList = new LinkedHashMap<>();
        List<EnvelopeAData> envelopeAToShow = new ArrayList<>();
        List<EnvelopeBData> envelopeBToShow = new ArrayList<>();
        boolean bidWithDraw = false;
        boolean bidWithDrawnByContractor = false;
        boolean showA = false;
        boolean showB = false;
        boolean showC = false;
        String checkSum = "";

        ContractorDetails contdetail = new ContractorDetails();
        int envelopeAId = 0;
        int envelopeBId = 0;
        String action = "";
        String envelopeCfor = "";
        int deprtmentUserId = 0;
        boolean reBidd = false;
        Tender tender = null;

        try {

            int contloginid = (int) session.getAttribute("contRegId");
            System.out.println("contRegId :::" + contloginid);
            session.setAttribute("tenderId", tenderId);
            tender = tenderDaoImpl.read(tenderId);
            if (contloginid != 0) {
                contdetail = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(contloginid);
            }
            m.addAttribute("emdPayment", new EmdPayment());
            String status = tender.getModeOfFeeForEMDApplicable();
            m.addAttribute("status", status);
            String emdApplicable = tender.getEmdApplicable();
            m.addAttribute("emdApplicable", emdApplicable);
            double emdvalue = Double.parseDouble(tender.getEmdInFig());
            m.addAttribute("emdvalue", emdvalue);
            List<BankName> banknamelist = bankNameDaoImpl.fetchAll();
            m.addAttribute("banknamelist", banknamelist);
            String msmeReg = contdetail.getContCompanyType();
            System.out.println("msmeReg :::" + msmeReg);
            m.addAttribute("msmeReg", msmeReg);
            String msmensicExemtion = tender.getMsmensicExemption();
            m.addAttribute("msmeExemtion", msmensicExemtion);
            String scstExemtion = tender.getScstExemption();
            m.addAttribute("scstExemtion", scstExemtion);
            String obcExemtion = tender.getObcExemption();
            m.addAttribute("obcExemtion", obcExemtion);

            if ("Not Allowed".equals(tender.getMsmensicExemption())) {

            } else if (contdetail.getSocialCategory().equals("1") || contdetail.getSocialCategory().equals("2")) {
                //System.out.println("in  sc st if condition::: " + contdetail.getSocialCategory());
                if (Double.parseDouble(tender.getEmdMSMENSICExemption()) > Double.parseDouble(tender.getEmdTenderSCSTFeeExemption())) {
                    System.out.println("MSME is greater than scst:::");
                    double emdMsmeNsic = Double.parseDouble(tender.getEmdMSMENSICExemption());
                    System.out.println("emdMsmeNsic::" + emdMsmeNsic);
                    m.addAttribute("emdMsmeNsic", emdMsmeNsic);
                    double TotalEmdMsme = (emdvalue * emdMsmeNsic) / 100;
                    double remainEmdMsme = emdvalue - TotalEmdMsme;
                    System.out.println("remainEmdMsme" + remainEmdMsme);
//                  DecimalFormat df2 = new DecimalFormat("#.##");
//                  double remainEmdMsmee = Double.valueOf(df2.format(remainEmdMsme));
                    m.addAttribute("remainEmdMsme", remainEmdMsme);
                } else {
                    System.out.println("SCST is greater::: ");
                    double emdScst = Double.parseDouble(tender.getEmdTenderSCSTFeeExemption());
                    System.out.println("emdScst" + emdScst);
                    m.addAttribute("emdScst", emdScst);
                    double TotalEmdScst = (emdvalue * emdScst) / 100;
                    double remainEmdScst = emdvalue - TotalEmdScst;
                    System.out.println("remainEmdScst" + remainEmdScst);
//                 double remainEmdScstt = Double.valueOf(df2.format(remainEmdScst));
                    m.addAttribute("remainEmdScst", remainEmdScst);
                }
            } else if (contdetail.getSocialCategory().equals("3")) {
                //  System.out.println("in OBC if condition::: " + contdetail.getSocialCategory());
                if (Double.parseDouble(tender.getEmdMSMENSICExemption()) > Double.parseDouble(tender.getEmdTenderOBCFeeExemption())) {
                    System.out.println("MSME is greater than obc");
                    double emdMsmeNsic = Double.parseDouble(tender.getEmdMSMENSICExemption());
                    System.out.println("emdMsmeNsic::" + emdMsmeNsic);
                    m.addAttribute("emdMsmeNsic", emdMsmeNsic);
                    double TotalEmdMsme = (emdvalue * emdMsmeNsic) / 100;
                    double remainEmdMsme = emdvalue - TotalEmdMsme;
                    System.out.println("remainEmdMsme" + remainEmdMsme);
                    m.addAttribute("remainEmdMsme", remainEmdMsme);
                } else {
                    System.out.println("OBC is greater than msme:::");
                    double emdObc = Double.parseDouble(tender.getEmdTenderOBCFeeExemption());
                    System.out.println("emdObc" + emdObc);
                    m.addAttribute("emdObc", emdObc);
                    double TotalEmdObc = (emdvalue * emdObc) / 100;
                    double remainEmdObc = emdvalue - TotalEmdObc;
                    System.out.println("remainEmdObc" + remainEmdObc);
                    m.addAttribute("remainEmdObc", remainEmdObc);
                }
            }
            EmdPayment emdpayment = emdDaoImpl.fetchEmdById(tenderId, contloginid);
            m.addAttribute("emdpayment", emdpayment);
//             emdDaoImpl.insertData(emdpayment);
//        int tender_Id = 100;

            if (contloginid != 0 && tenderId != 0) {
                tender = tenderDaoImpl.read(tenderId);
                TenderSubmittedEnvelopeA submittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
                String officerA[] = submittedEnvelopeA.getEnvelopeAOfficers().split(",");
                for (int i = 0; i < officerA.length; i++) {
                    deprtmentUserId = Integer.parseInt(officerA[i]);
                }
                System.out.println("deprtmentUserId for A" + deprtmentUserId);
                envelopeAToShow = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, contloginid, deprtmentUserId);
                for (EnvelopeAData envelopeAData : envelopeAToShow) {
                    if (envelopeAData.getContractor_status() != null && envelopeAData.getContractor_status().equals("BidWithDrawn")) {
                        bidWithDrawnByContractor = true;
                    }

                }

                TenderSubmittedEnvelopeB submittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);
                if (submittedEnvelopeB != null) {
                    String officerB[] = submittedEnvelopeB.getEnvelopeBOfficers().split(",");
                    for (int i = 0; i < officerB.length; i++) {
                        deprtmentUserId = Integer.parseInt(officerB[i]);

                    }
                }
                System.out.println("deprtmentUserId for B" + deprtmentUserId);
                envelopeBToShow = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, contloginid, deprtmentUserId);

                TenderSubmittedEnvelopeC submittedEnvelopeC = tenderSubmittedEnvelopeCDaoImpl.read(tenderId);
                String officerC[] = submittedEnvelopeC.getEnvelopeCOfficers().split(",");
                for (int i = 0; i < officerC.length; i++) {
                    deprtmentUserId = Integer.parseInt(officerC[i]);

                }

                System.out.println("deprtmentUserId for C" + deprtmentUserId);

                envelopeCData = envelopeCDataDaoImpl.fetchEnvelopeCById(tenderId, contloginid, deprtmentUserId);
                if (envelopeCData != null) {
                    checkSum = CommonUtil.getCheckSum(envelopeCData.getEncryptedBidByContractor());
                    envelopeCfor = checkEnvelopeCType(tenderId);
                }
            }

            if (tender.getTenderRebid().equalsIgnoreCase("Allowed")) {
                reBidd = true;
            }
            if (tender.getTenderBidWithdraw().equalsIgnoreCase("Allowed")) {
                bidWithDraw = true;
            }

            m.addAttribute("DynamicTemplatePojo", new DynamicTemplatePojo());
            if (envelopeCData != null) {
                m.addAttribute("envelopeCData", envelopeCData);
            }
            TenderKeyDates dates = tenderKeyDatesDao.readKeyDate(tenderId);
            String openingEb = dates.getOpeningEB();
            if (openingEb.equals("")) {
                tender.setShowEB(false);
                m.addAttribute("showEB", false);
            } else {
                tender.setShowEB(true);
                m.addAttribute("showEB", true);
            }
            percentRateList = percentRate();
            action = "showBid";
            m.addAttribute("action", action);
            m.addAttribute("percentRateList", percentRateList);
            m.addAttribute("envelopeAToShow", envelopeAToShow);
            m.addAttribute("envelopeBToShow", envelopeBToShow);
            m.addAttribute("envelopeCfor", envelopeCfor);
            m.addAttribute("reBidd", reBidd);
            m.addAttribute("tender", tender);
            m.addAttribute("bidWithDraw", bidWithDraw);
            m.addAttribute("bidWithDrawnByContractor", bidWithDrawnByContractor);
        } catch (Exception e) {
            e.printStackTrace();

        }

        return "Contractor/ShowEnvelope1";

    }

    /*
     * checkBidButton 
     * Method used to check bidding button on MyTender
     * @param 
     * @return List
     */
    @RequestMapping("/checkBidButton")
    @ResponseBody
    public String checkBidButton(HttpSession session) {
        List<EnvelopeAData> envelopeAList = new ArrayList<>();
        List<EnvelopeBData> envelopeBList = new ArrayList<>();
        List<EnvelopeCData> envelopeCList = new ArrayList<>();
        EnvelopeCData envelopeCData = new EnvelopeCData();
        List<Tender> purchasedTenderList = new ArrayList<>();
        Map<Integer, String> bidbutton = new LinkedHashMap();
        String response = "";
        try {
            purchasedTenderList = purchasedTenderList(session);
            for (Tender purchasedTenderList1 : purchasedTenderList) {
                int contloginid = (int) session.getAttribute("contRegId");
                if (contloginid != 0) {
                    envelopeAList = envelopeADataDaoImpl.fetchEnvelopeAById(purchasedTenderList1.getTender_Id(), contloginid);
                    envelopeBList = envelopeBDataDaoImpl.fetchEnvelopeBById(purchasedTenderList1.getTender_Id(), contloginid);
                    envelopeCList = envelopeCDataDaoImpl.fetchEnvelopeCById(purchasedTenderList1.getTender_Id(), contloginid);

                    envelopeCList.add(envelopeCData);
                    if (!envelopeAList.isEmpty() && !envelopeBList.isEmpty() && !envelopeCList.isEmpty()) {

                        bidbutton.put(purchasedTenderList1.getTender_Id(), "viewBid");
                        System.out.println("viewBid");
                    } else {
                        bidbutton.put(purchasedTenderList1.getTender_Id(), "proceedtoBid");
                        System.out.println("proceedtoBid");
                    }

                }

            }

            System.out.println("Map " + bidbutton);
            Gson gson = new Gson();
            response = gson.toJson(bidbutton);

//             gsonUtility.writeData(response);
            gsonUtility.responseData(response);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return response;
    }

    /*
     * updateEnvelopeAData 
     * Method used to update Envelope A Data
     * @param DynamicTemplatePojo dynamicTemplatePojo
     * @return json response
     */
 /*
     * updateEnvelopeBData 
     * Method used to update Envelope B Data
     * @param DynamicTemplatePojo dynamicTemplatePojo 
     * @return Json response
     */
//   
    /*
     * checkEnvelopeCType 
     * Method used to check Envelope C Type 
     * @param 
     * @return List
     */
    public String checkEnvelopeCType(int tenderId) {

        System.out.println(" inside checkEnvelopeCType");
        Tender tender = null;

        String result = "";
        try {

            if (tenderId != 0) {
                tender = tenderDaoImpl.read(tenderId);

                if (Integer.parseInt(tender.getTypeOfTender()) == 1) {
                    result = "Persentage Rate Tender";

                } else if (Integer.parseInt(tender.getTypeOfTender()) == 2) {
                    result = "Lumpsum Tender";

                }
            }
            System.out.println(" result " + result);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return result;
    }

    /*
     * getSaveEnvelopeC 
     * Method used to save Envelope C Data
     * @param EnvelopeCData envelopeCData 
     * @return Json response
     */
    @RequestMapping("/getSaveEnvelopeC")
    @ResponseBody
    public String getSaveEnvelopeC(@ModelAttribute("envelopeCData") EnvelopeCData envelopeCData, HttpSession session, HttpServletRequest request, Model m) {
        System.out.println("inside getSaveEnvelopeC " + envelopeCData.getEncryptedBidByContractor() + " " + envelopeCData.getEnvelopeCFieldId());

        boolean flag = false;
        String response = "";
        String checkSum = "";
        Map<String, String> responseData = new HashMap<String, String>();
        Date date = new Date();
        int tenderId = 0;
        int contloginid = 0;
        TenderSubmittedEnvelopeC submittedEnvelopeC = null;
        Tender tender = null;

        try {
//         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
//          String currentDate = sdf.format(date);
//          System.out.println("currentDate "+currentDate);

            tenderId = (int) session.getAttribute("tenderId");
            contloginid = (int) session.getAttribute("contRegId");

            if (tenderId != 0 && contloginid != 0) {

                submittedEnvelopeC = tenderSubmittedEnvelopeCDaoImpl.read(tenderId);
                tender = tenderDaoImpl.read(tenderId);
            }
            String officer[] = submittedEnvelopeC.getEnvelopeCOfficers().split(",");
            System.out.println("length " + officer.length + " officers " + submittedEnvelopeC.getEnvelopeCOfficers());
            for (int i = 0; i < officer.length; i++) {

                System.out.println("officer " + officer[i]);
                envelopeCData.setDepartmentUserId(officer[i]);
                //    System.out.println("setDepartmentUserId " + envelopeCData.getDepartmentUserId());

                envelopeCData.setDepartmentId(tender.getDeptId());
                envelopeCData.setDepartmentAdminId(tender.getDeptId());
                envelopeCData.setTenderNumber(tender.getTenderNumber());

                envelopeCData.setTenderId(tenderId);
                envelopeCData.setContractorId(contloginid);
                response = checkEnvelopeCType(tenderId);
                envelopeCData.setEnvelopeCType(response);
                System.out.println(" response " + response);
                String dateOfBidding = envelopeCData.getDateOfBidding();
                String encryptedBidByContractor = envelopeCData.getEncryptedBidByContractor();
                System.out.println("encryptedBidByContractor" + encryptedBidByContractor);
                String tenderNumber = envelopeCData.getTenderNumber();

                Gson gson = new Gson();
                String jsonData = gson.toJson(new EnvelopeCDto(dateOfBidding, encryptedBidByContractor, tenderNumber));
                HashValue hash = new HashValue();

                // Generate SHA-256 hash
                String hashValue = hash.getSHA256(jsonData);
                System.out.println("Hash Value: " + hashValue);
//                  m.addAttribute("hash", hashValue);
                responseData.put("hash", hashValue);
                checkSum = CommonUtil.getCheckSum(envelopeCData.getEncryptedBidByContractor());
                if (response.equalsIgnoreCase("Persentage Rate Tender")) {
                    envelopeCData.setCheckSum(checkSum);
                    envelopeCData.setHashValue(hashValue);

                    envelopeCData.setEncryptedDeviationByContractor(envelopeCData.getEncryptedDeviationByContractor());
                    System.out.println("ENVELOP Ccccccccc" + envelopeCData.getEncryptedBidByContractor());
                    envelopeCData.setEncryptedDeviationByDepartmentAdmin(envelopeCData.getEncryptedDeviationByContractor());
                    envelopeCData.setEncryptedDeviationByDepartmentUser(envelopeCData.getEncryptedDeviationByContractor());

                    envelopeCData.setEncryptedBidByContractor(envelopeCData.getEncryptedBidByContractor());
                    System.out.println("ENVELOP Ccccccc" + envelopeCData.getEncryptedBidByContractor());
                    envelopeCData.setEncryptedBidByDepartmentAdmin(envelopeCData.getEncryptedBidByContractor());
                    envelopeCData.setEncryptedBidByDepartmentUser(envelopeCData.getEncryptedBidByContractor());

                } else if (response.equalsIgnoreCase("Lumpsum Tender")) {
                    envelopeCData.setHashValue(hashValue);
                    envelopeCData.setEncryptedBidByContractor(envelopeCData.getEncryptedBidByContractor());
                    System.out.println("LUMPSUM" + envelopeCData.getEncryptedBidByContractor());
                    envelopeCData.setEncryptedBidByDepartmentAdmin(envelopeCData.getEncryptedBidByContractor());
                    System.out.println("LUMPSUM" + envelopeCData.getEncryptedBidByDepartmentAdmin());
                    envelopeCData.setEncryptedBidByDepartmentUser(envelopeCData.getEncryptedBidByContractor());
                    System.out.println("LUMPSUM" + envelopeCData.getEncryptedBidByDepartmentUser());
                    envelopeCData.setEncryptedBidInWordByContractor(envelopeCData.getEncryptedBidInWordByContractor());
                    envelopeCData.setEncryptedBidInWordByDepartmentAdmin(envelopeCData.getEncryptedBidInWordByContractor());
                    envelopeCData.setEncryptedBidInWordByDepartmentUser(envelopeCData.getEncryptedBidInWordByContractor());

                }
                envelopeCData.setHashValue(hashValue);
                envelopeCData.setDateOfBidding(date.toString());

                System.out.println("");
                boolean flag1 = checkTenderBiddingDate(envelopeCData.getTenderId());
                System.out.println(" flag1 " + flag1);

                if (flag1 == true) {
                    flag = envelopeCDataDaoImpl.insertData(envelopeCData);

                } else {
                    response = "bidding is not allowed";
                    System.out.println("bidding is not allowed for c");
                    gsonUtility.writeData(response);

                    return response;
                }
            }

            System.out.println(" flg " + flag);
            if (flag == true) {
                logs.setActivity("Bid on Envelope C");
                logs.setLogMessage("Envelope C bidding is Submitted");
                logs.setOsName(logsAction.FetchOSName());
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setDeptId(envelopeCData.getDepartmentAdminId());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(envelopeCData.getContractorId());
                logs.setTenderId(envelopeCData.getTenderId());
                logs.setEnvelope("EC");
                logsActionDao.save(logs);
//                   
                response = "Envelope C Submitted";
                System.out.println("bidding is not allowed for c");
                responseData.put("msg", response);
                Gson g = new Gson();
                String rData = g.toJson(responseData);
                System.out.println("Submitted Response is  ---->" + rData);
                return rData;

            }
        } catch (Exception ex) {
            //  System.out.println("class: MyTender_AuctionController \n Method : saveEnvelopeCData  " + ex.getMessage());
            ex.printStackTrace();

        }

        return response;
    }

    /*
     * updateEnvelopeCData 
     * Method used to update Envelope C Data
     * @param EnvelopeCData envelopeCData 
     * @return Json response
     */
    @RequestMapping("/updateEnvelopeC")
    @ResponseBody
    public String updateEnvelopeC(@ModelAttribute("envelopeCData") EnvelopeCData envelopeCData, HttpSession session, HttpServletRequest request, Model m) throws IOException {
        //  System.out.println("  " + envelopeCData.getEncryptedBidByContractor() + " " + envelopeCData.getEnvelopeCFieldId());

        boolean flag = false;
        String response = "";
        EnvelopeCData envelopeCData1 = null;
        Date date = new Date();
        int tenderId = 0;
        int contloginid = 0;
        TenderSubmittedEnvelopeC submittedEnvelopeC = null;
        Tender tender = null;
        Map<String, String> responseData = new HashMap<String, String>();

        try {
//         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
//          String currentDate = sdf.format(date);
//          System.out.println("currentDate "+currentDate);

            tenderId = (int) session.getAttribute("tenderId");
            contloginid = (int) session.getAttribute("contRegId");

            if (tenderId != 0 && contloginid != 0) {

                submittedEnvelopeC = tenderSubmittedEnvelopeCDaoImpl.read(tenderId);
                tender = tenderDaoImpl.read(tenderId);
            }
            String officer[] = submittedEnvelopeC.getEnvelopeCOfficers().split(",");
            //   System.out.println("length " + officer.length + " officers " + submittedEnvelopeC.getEnvelopeCOfficers());
            for (int i = 0; i < officer.length; i++) {
                int deprtUserId = Integer.parseInt(officer[i]);
                envelopeCData1 = envelopeCDataDaoImpl.fetchEnvelopeCById(tenderId, contloginid, deprtUserId);
                System.out.println("officer " + officer[i]);
                envelopeCData1.setDepartmentUserId(officer[i]);
                //    System.out.println("setDepartmentUserId " + envelopeCData.getDepartmentUserId());
                String dateOfBidding = envelopeCData.getDateOfBidding();
                String encryptedBidByContractor = envelopeCData.getEncryptedBidByContractor();
                String tenderNumber = envelopeCData.getTenderNumber();

                Gson gson = new Gson();
                String jsonData = gson.toJson(new EnvelopeCDto(dateOfBidding, encryptedBidByContractor, tenderNumber));
                HashValue hash = new HashValue();

                // Generate SHA-256 hash
                String hashValue = hash.getSHA256(jsonData);
                System.out.println("Hash Value: " + hashValue);
                envelopeCData1.setHashValue(hashValue);
                m.addAttribute("hash", hashValue);
                responseData.put("hash", hashValue);
                if (envelopeCData1.getEnvelopeCType().equalsIgnoreCase("Persentage Rate Tender")) {

                    envelopeCData1.setEncryptedDeviationByContractor(envelopeCData.getEncryptedDeviationByContractor());
                    envelopeCData1.setEncryptedDeviationByDepartmentAdmin(envelopeCData.getEncryptedDeviationByContractor());
                    envelopeCData1.setEncryptedDeviationByDepartmentUser(envelopeCData.getEncryptedDeviationByContractor());

                    envelopeCData1.setEncryptedBidByContractor(envelopeCData.getEncryptedBidByContractor());
                    envelopeCData1.setEncryptedBidByDepartmentAdmin(envelopeCData.getEncryptedBidByContractor());
                    envelopeCData1.setEncryptedBidByDepartmentUser(envelopeCData.getEncryptedBidByContractor());

                } else if (envelopeCData1.getEnvelopeCType().equalsIgnoreCase("Lumpsum Tender")) {

                    envelopeCData1.setEncryptedBidByContractor(envelopeCData.getEncryptedBidByContractor());
                    envelopeCData1.setEncryptedBidByDepartmentAdmin(envelopeCData.getEncryptedBidByContractor());
                    envelopeCData1.setEncryptedBidByDepartmentUser(envelopeCData.getEncryptedBidByContractor());

                    envelopeCData1.setEncryptedBidInWordByContractor(envelopeCData.getEncryptedBidInWordByContractor());
                    envelopeCData1.setEncryptedBidInWordByDepartmentAdmin(envelopeCData.getEncryptedBidInWordByContractor());
                    envelopeCData1.setEncryptedBidInWordByDepartmentUser(envelopeCData.getEncryptedBidInWordByContractor());

                }
                envelopeCData1.setModifyDateOfBidding(date.toString());
                boolean flag1 = checkTenderBiddingDate(tenderId);
                System.out.println(" flag1 " + flag1);

                if (flag1 == true && envelopeCData.getEnvelopeCFieldId() != 0) {

                    flag = envelopeCDataDaoImpl.updateData(envelopeCData1);

                } else {
                    response = "bidding is not allowed";
                    System.out.println("bidding is not allowed for c");
                }
            }

            System.out.println(" flg " + flag);
            if (flag == true) {
                logs.setActivity("Re Bidding on Envelope C");
                logs.setLogMessage("Envelope C Re-bidding is Submitted");
                logs.setOsName(logsAction.FetchOSName());
//                  logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setDeptId(envelopeCData.getDepartmentAdminId());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contloginid);
                logs.setTenderId(tenderId);
                logs.setEnvelope("EC");
                logsActionDao.save(logs);
//                   
                response = "Envelope C Re bidd is Submitted";
                System.out.println("bidding is not allowed for c");

            }
        } catch (Exception ex) {
            //  System.out.println("class: MyTender_AuctionController \n Method : saveEnvelopeCData  " + ex.getMessage());
            ex.printStackTrace();
        }
        Map<String, String> data = new HashMap<String, String>();

        responseData.put("msg", response);

        Gson g = new Gson();
        String rData = g.toJson(responseData);
        System.out.println("Response is---->" + rData);
        return rData;
    }

    /*
     * percentRate 
     * Method used to percent Rate options
     * @param 
     * @return List
     */
    public Map percentRate() {
        Map<Integer, String> percentRateList = new LinkedHashMap<>();
        try {
        } catch (Exception e) {
            e.printStackTrace();

        }
        percentRateList.put(0, "Select Percent Rate");
        percentRateList.put(1, "Below PAR");
        percentRateList.put(2, "At PAR");
        percentRateList.put(3, "Above PAR");

        return percentRateList;
    }

    /*
     * submittedEnvelopeDataStatus 
     * Method used to submitted Envelope Data Status
     * @param 
     * @return Json response
     */
    @RequestMapping("/submittedEnvelopeDataStatus")
    @ResponseBody
    public String submittedEnvelopeDataStatus(HttpSession session) {

        int contId = (int) session.getAttribute("contRegId");
        int tenderId = (int) session.getAttribute("tenderId");
        String response = "";
        Map<String, Boolean> envelopeSubmittedStatus = new HashMap<>();
        try {

            List<EnvelopeAData> envelopeAData = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, contId);
            System.out.println("envelopeAData List size submitted " + envelopeAData.size());
            List<EnvelopeBData> envelopeBData = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, contId);
            System.out.println("envelopeBData List size submitted " + envelopeBData.size());
            List<EnvelopeCData> envelopeCData = envelopeCDataDaoImpl.fetchEnvelopeCById(tenderId, contId);

            if (envelopeAData.isEmpty()) {
                envelopeSubmittedStatus.put("EnvelopeASubmittedStatus", false);

            } else {
                envelopeSubmittedStatus.put("EnvelopeASubmittedStatus", true);
            }
            if (envelopeBData.isEmpty()) {
                envelopeSubmittedStatus.put("EnvelopeBSubmittedStatus", false);

            } else {
                envelopeSubmittedStatus.put("EnvelopeBSubmittedStatus", true);
            }

            if (envelopeCData.isEmpty()) {
                System.out.println(" Envelope c submitted");
                envelopeSubmittedStatus.put("EnvelopeCSubmittedStatus", true);
            } else {
                System.out.println("Not Submitted");
                envelopeSubmittedStatus.put("EnvelopeCSubmittedStatus", false);
            }
            System.out.println("Map " + envelopeSubmittedStatus);
            Gson gson = new Gson();
            response = gson.toJson(envelopeSubmittedStatus);

//             gsonUtility.writeData(response);
            gsonUtility.responseData(response);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return response;
    }

    /*
     * checkTenderBiddingDate 
     * Method used to check Tender Bidding Date
     * @param 
     * @return Json response
     */
    @RequestMapping(value = "/checkTenderBiddingDate", method = RequestMethod.POST)
    public boolean checkTenderBiddingDate(@RequestParam int tenderId) {
        System.out.println("tenderId " + tenderId);
        TenderKeyDates tenderKeyDateses = null;
        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        boolean flag = false;
        String biddingDate = "";
        String biddingstartdate = "";
        String biddingenddate = "";
        Tender tender = null;
        try {
            tenderKeyDateses = tenderDaoImpl.readKeyDate(tenderId);
            tender = tenderDaoImpl.read(tenderId);
            System.out.println("TENDERRRRRR" + tender.getTenderStage());
            if ("2".equals(tender.getTenderStage()) && tenderKeyDateses.getEcBidSubmissionDate() != null) {
                tenderKeyDateses = tenderDaoImpl.readKeyDate(tenderId);
                biddingDate = tenderKeyDateses.getEcBidSubmissionDate();
                System.out.println("ECCCCCCCCCCCCCC");
//            System.out.println("biddingDate "+biddingDate);

                biddingstartdate = biddingDate.split("/")[0];
                Date startDate = new Date(biddingstartdate);
                biddingenddate = biddingDate.split("/")[1];
                Date endDate = new Date(biddingenddate);

                if (sdf.parse(sdf.format(new Date())).getTime() >= startDate.getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endDate.getTime()) {
                    flag = true;
                    System.out.println("bidding is allowed " + flag);
                } else {
                    System.out.println("bidding is not allowed " + flag);

                }

            } else {
                System.out.println("NOT CCCCCCCCCCCCC");
                tenderKeyDateses = tenderDaoImpl.readKeyDate(tenderId);
                biddingDate = tenderKeyDateses.getBidSubmissionDate();
//            System.out.println("biddingDate "+biddingDate);

                biddingstartdate = biddingDate.split("/")[0];
                Date startDate = new Date(biddingstartdate);
                biddingenddate = biddingDate.split("/")[1];
                Date endDate = new Date(biddingenddate);

                if (sdf.parse(sdf.format(new Date())).getTime() >= startDate.getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endDate.getTime()) {
                    flag = true;
                    System.out.println("bidding is allowed " + flag);
                } else {
                    System.out.println("bidding is not allowed " + flag);

                }
            }
        } catch (Exception e) {

            e.printStackTrace();

        }

        return flag;
    }

    @RequestMapping(value = "/deleteFileFromEnvelopeA", method = RequestMethod.POST)
    @ResponseBody
    public String deleteFileFromEnvelopeA(@RequestParam int fileId) {
        System.out.println("fileId " + fileId);

        return null;
    }

    @RequestMapping(value = "/deleteFileFromEnvelopeB", method = RequestMethod.POST)
    @ResponseBody
    public String deleteFileFromEnvelopeB(@RequestParam int fileId) {
        System.out.println("fileId " + fileId);

        return null;
    }

    @RequestMapping(value = "/getSaveEnvelopeA", method = RequestMethod.POST)
    @ResponseBody
    public String getSaveEnvelopeA(@ModelAttribute("form") DynamicTemplatePojo dynamicTemplatePojo, HttpSession session, HttpServletRequest request) throws IOException {
        System.out.println("inside SaveEnvelopeA ");
        TenderEnvelopeA tenderEnvelopeA = new TenderEnvelopeA();
        List<TenderEnvelopeA> envelopeAToShow = new ArrayList<>();
        boolean flag = false;
        Tender tender = new Tender();
        String response = "";
        int envelopeAId = 0;
        int theIndex = 0;
        int contId = 0;
        int tenderId = 0;
        TenderSubmittedEnvelopeA submittedEnvelopeA = null;
        String url = FileUtility.UPLOAD_TEMPORARYDOCUMENT;
        try {

            if(!url==null){
                System.out.print("HHHH");
            }
            else{
                System.out.print("HHHH");
            }
//            validateEnvelopeAModel.validate(dynamicTemplatePojo, session);
            //  System.out.println("  " + dynamicTemplatePojo.getDatalist().size());
            envelopeAId = (int) session.getAttribute("envelopeAId");
            if (envelopeAId != 0) {
                envelopeAToShow = tenderEnvelopeADao.readAll(envelopeAId);
            }
            tenderId = (int) session.getAttribute("tenderId");
            contId = (int) session.getAttribute("contRegId");
            if (tenderId != 0 && contId != 0) {

                submittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
                tender = tenderDaoImpl.read(tenderId);

            }
            String officer[] = submittedEnvelopeA.getEnvelopeAOfficers().split(",");
            //   System.out.println("length " + officer.length + " officers " + submittedEnvelopeA.getEnvelopeAOfficers());

            for (int i = 0; i < officer.length; i++) {

                for (DynamicTemplatePojo dynamicTemplatePojo1 : dynamicTemplatePojo.getDatalist()) {
                    theIndex = dynamicTemplatePojo.getDatalist().indexOf(dynamicTemplatePojo1);
                    System.out.println(" index " + theIndex);
                    EnvelopeAData envelopeAData1 = new EnvelopeAData();

                    tenderEnvelopeA = envelopeAToShow.get(theIndex);
                    envelopeAData1.setDepartmentUserId(Integer.parseInt(officer[i]));
                    envelopeAData1.setContractorId(contId);
                    envelopeAData1.setTenderId(tender.getTender_Id());
                    envelopeAData1.setDepartmentAdminId(tender.getDeptId());
                    envelopeAData1.setFieldLabel(tenderEnvelopeA.getLabelNameA());
                    envelopeAData1.setFieldType(tenderEnvelopeA.getLabelTypeA());
                    envelopeAData1.setTender_EnvelopeA_SequnceId(tenderEnvelopeA.getTender_EnvelopeA_SequnceId());
                    envelopeAData1.setTemplateName(tenderEnvelopeA.getEnvelopeATemplateName());
                    envelopeAData1.setLabelMandatoryA(tenderEnvelopeA.getLabelMandatoryA());

                    //  System.out.println(" TenderEnvelopeA labelType  " + tenderEnvelopeA.getLabelTypeA());
                    if (tenderEnvelopeA.getLabelTypeA().equals("3")) {
                        //   System.out.println(" file  " + dynamicTemplatePojo1.getFiles().getOriginalFilename());

                        if (i == 0) {
                            String convertedName = fileUtility.fileUploadingUtil(dynamicTemplatePojo1.getFiles(), url);

                            envelopeAData1.setFileName(dynamicTemplatePojo1.getFiles().getOriginalFilename());
                            envelopeAData1.setFilePath(servletContext.getContextPath() + url + File.separator + convertedName);
                            envelopeAData1.setConvertedFileName(convertedName);

                            session.setAttribute("convertedName" + theIndex, convertedName);
                            session.setAttribute("filePath" + theIndex, envelopeAData1.getFilePath());
                            session.setAttribute("fileName" + theIndex, envelopeAData1.getFileName());
                        } else {
                            String convertedName = (String) session.getAttribute("convertedName" + theIndex);
                            String filePath = (String) session.getAttribute("filePath" + theIndex);
                            String fileName = (String) session.getAttribute("fileName" + theIndex);
//
                            if (convertedName != null || filePath != null || fileName != null && convertedName != "" || filePath != "" || fileName != "") {
                                envelopeAData1.setFileName(fileName);
                                envelopeAData1.setFilePath(filePath);
                                envelopeAData1.setConvertedFileName(convertedName);
                            }
                        }
                    } else {
                        envelopeAData1.setFieldValueOfContractor(dynamicTemplatePojo1.getTextfield());
                        envelopeAData1.setFieldValueOfDepartmentAdmin(dynamicTemplatePojo1.getTextfield());
                        envelopeAData1.setFieldValueOfDepartmentUser(dynamicTemplatePojo1.getTextfield());

                        if (tenderEnvelopeA.getLabelTypeA().equals("4")) {

                            envelopeAData1.setFieldValueInWordsOfContractor(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeAData1.setFieldValueInWordsOfDepartmentAdmin(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeAData1.setFieldValueInWordsOfDepartmentUser(dynamicTemplatePojo1.getTextfieldInWords());
                        }

                    }

                    boolean flag1 = checkTenderBiddingDate(tenderId);
                    if (flag1 == true) {
                        flag = envelopeADataDaoImpl.insertData(envelopeAData1);

                    } else {
                        response = "bidding is not allowed";
                    }
                }
            }
            if (flag == true) {
                response = "Envelope A Submitted";
                logs.setActivity("Bid on Envelope A");
                logs.setLogMessage("Envelope A bidding is Submitted");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contId);
                logs.setTenderId(tenderId);
                logs.setDeptId(tender.getDeptId());
                logs.setEnvelope("EA");
                logsActionDao.save(logs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        gsonUtility.writeData(response);
        System.out.println("response " + response);
        return response;
    }

    @RequestMapping(value = "/getSaveEnvelopeB", method = RequestMethod.POST)
    @ResponseBody
    public String getSaveEnvelopeB(@ModelAttribute("form") DynamicTemplatePojo dynamicTemplatePojo, HttpSession session, HttpServletRequest request) throws IOException {
        System.out.println("inside SaveEnvelopeB ");
        TenderEnvelopeB tenderEnvelopeB = new TenderEnvelopeB();
        List<TenderEnvelopeB> envelopeBToShow = new ArrayList<>();
        boolean flag = false;
        Tender tender = new Tender();
        String response = "";
        int envelopeBId = 0;
        int theIndex = 0;
        int contId = 0;
        int tenderId = 0;
        TenderSubmittedEnvelopeB submittedEnvelopeB = null;
        String url = FileUtility.UPLOAD_TEMPORARYDOCUMENT;
        try {
//            validateEnvelopeBModel.validate(dynamicTemplatePojo, session);
//            System.out.println("  " + dynamicTemplatePojo.getDatalist().size());
            envelopeBId = (int) session.getAttribute("envelopeBId");
            System.out.println("envelopeBId " + envelopeBId);
            if (envelopeBId != 0) {

                envelopeBToShow = tenderEnvelopeBDao.readAll(envelopeBId);
            }
            tenderId = (int) session.getAttribute("tenderId");
            System.out.println("tenderId " + tenderId);
            if (tenderId != 0) {

                tender = tenderDaoImpl.read(tenderId);
                submittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);

            }
            String officer[] = submittedEnvelopeB.getEnvelopeBOfficers().split(",");
            //System.out.println("length " + officer.length + " officers " + submittedEnvelopeB.getEnvelopeBOfficers());

            for (int i = 0; i < officer.length; i++) {

                for (DynamicTemplatePojo dynamicTemplatePojo1 : dynamicTemplatePojo.getDatalist()) {
                    theIndex = dynamicTemplatePojo.getDatalist().indexOf(dynamicTemplatePojo1);
                    EnvelopeBData envelopeBData1 = new EnvelopeBData();
                    envelopeBData1.setDepartmentUserId(Integer.parseInt(officer[i]));
                    tenderEnvelopeB = envelopeBToShow.get(theIndex);
                    contId = (int) session.getAttribute("contRegId");
                    if (contId != 0) {
                        envelopeBData1.setContractorId(contId);
                    }
                    envelopeBData1.setTenderId(tender.getTender_Id());
                    envelopeBData1.setDepartmentAdminId(tender.getDeptId());
                    envelopeBData1.setFieldLabel(tenderEnvelopeB.getLabelNameA());
                    envelopeBData1.setFieldType(tenderEnvelopeB.getLabelTypeA());
                    envelopeBData1.setTender_EnvelopeA_SequnceId(tenderEnvelopeB.getTender_EnvelopeA_SequnceId());
                    envelopeBData1.setTemplateName(tenderEnvelopeB.getEnvelopeATemplateName());
                    envelopeBData1.setLabelMandatoryA(tenderEnvelopeB.getLabelMandatoryA());

                    //System.out.println(" TenderEnvelopeA labelType  " + tenderEnvelopeB.getLabelTypeA());
                    if (tenderEnvelopeB.getLabelTypeA().equals("3")) {
                        if (i == 0) {
                            String convertedName = fileUtility.fileUploadingUtil(dynamicTemplatePojo1.getFiles(), url);

                            envelopeBData1.setFileName(dynamicTemplatePojo1.getFiles().getOriginalFilename());
                            envelopeBData1.setFilePath(servletContext.getContextPath() + url + File.separator + convertedName);
                            envelopeBData1.setConvertedFileName(convertedName);

                            session.setAttribute("convertedName" + theIndex, convertedName);
                            session.setAttribute("filePath" + theIndex, envelopeBData1.getFilePath());
                            session.setAttribute("fileName" + theIndex, envelopeBData1.getFileName());
                        } else {
                            String convertedName = (String) session.getAttribute("convertedName" + theIndex);
                            String filePath = (String) session.getAttribute("filePath" + theIndex);
                            String fileName = (String) session.getAttribute("fileName" + theIndex);
//
                            if (convertedName != null || filePath != null || fileName != null && convertedName != "" || filePath != "" || fileName != "") {
                                envelopeBData1.setFileName(fileName);
                                envelopeBData1.setFilePath(filePath);
                                envelopeBData1.setConvertedFileName(convertedName);
                            }
                        }

                    } else {
                        envelopeBData1.setFieldValueOfContractor(dynamicTemplatePojo1.getTextfield());
                        envelopeBData1.setFieldValueOfDepartmentAdmin(dynamicTemplatePojo1.getTextfield());
                        envelopeBData1.setFieldValueOfDepartmentUser(dynamicTemplatePojo1.getTextfield());

                        if (tenderEnvelopeB.getLabelTypeA().equals("4")) {

                            envelopeBData1.setFieldValueInWordsOfContractor(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeBData1.setFieldValueInWordsOfDepartmentAdmin(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeBData1.setFieldValueInWordsOfDepartmentUser(dynamicTemplatePojo1.getTextfieldInWords());
                        }

                    }
                    boolean flag1 = checkTenderBiddingDate(tenderId);
                    if (flag1 == true) {
                        flag = envelopeBDataDaoImpl.insertData(envelopeBData1);

                    } else {

                        response = "bidding is not allowed";
                    }
                }
            }
            if (flag = true) {
                response = "Envelope B Submitted";
                logs.setActivity("Bid on Envelope B");
                logs.setLogMessage("Envelope B bidding is Submitted");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contId);
                logs.setTenderId(tenderId);
                logs.setDeptId(tender.getDeptId());
                logs.setEnvelope("EB");
                logsActionDao.save(logs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        gsonUtility.writeData(response);
        System.out.println("response " + response);
        return response;
    }

    @RequestMapping(value = "/updateEnvelopeA", method = RequestMethod.POST)
    @ResponseBody
    public String updateEnvelopeA(@ModelAttribute("form") DynamicTemplatePojo dynamicTemplatePojo, HttpSession session, HttpServletRequest request) throws IOException {
        System.out.println("inside updateEnvelopeA ");
        TenderEnvelopeA tenderEnvelopeA = new TenderEnvelopeA();
        List<EnvelopeAData> envelopeAData1 = new ArrayList<>();

        boolean flag = false;
        int tenderId = 0;
        int contId = 0;
        String response = "";
        int theIndex = 0;
        int theIndexforFile = 0;
        TenderSubmittedEnvelopeA submittedEnvelopeA = null;
        String url = FileUtility.UPLOAD_TEMPORARYDOCUMENT;
        try {

            tenderId = (int) session.getAttribute("tenderId");
            contId = (int) session.getAttribute("contRegId");
            if (tenderId != 0) {

                submittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            }
            String officer[] = submittedEnvelopeA.getEnvelopeAOfficers().split(",");
            //System.out.println("length " + officer.length + " officers " + submittedEnvelopeA.getEnvelopeAOfficers());

            for (int i = 0; i < officer.length; i++) {
                envelopeAData1 = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, contId, Integer.parseInt(officer[i]));

                for (DynamicTemplatePojo dynamicTemplatePojo1 : dynamicTemplatePojo.getDatalist()) {
                    theIndex = dynamicTemplatePojo.getDatalist().indexOf(dynamicTemplatePojo1);
                    System.out.println(" theIndex " + theIndex);

                    if (envelopeAData1.get(theIndex).getLabelTypeA().equals("3")) {
                        //    System.out.println(" file hai " + dynamicTemplatePojo1.getFileFlag());

                        if ("".equals(dynamicTemplatePojo1.getFileFlag()) || dynamicTemplatePojo1.getFileFlag() != null) {
                            System.out.println("file is  changed ");
                            if (i == 0) {
                                String convertedName = "";
                                convertedName = fileUtility.fileUploadingUtil(dynamicTemplatePojo1.getFiles(), url);
                                System.out.println("The Converted Name: " + convertedName);
                                envelopeAData1.get(theIndex).setFileName(dynamicTemplatePojo1.getFiles().getOriginalFilename());
                                envelopeAData1.get(theIndex).setFilePath(servletContext.getContextPath() + url + File.separator + convertedName);
                                envelopeAData1.get(theIndex).setConvertedFileName(convertedName);
                                session.setAttribute("convertedName" + theIndex, convertedName);
                                session.setAttribute("filePath" + theIndex, envelopeAData1.get(theIndex).getFilePath());
                                session.setAttribute("fileName" + theIndex, envelopeAData1.get(theIndex).getFileName());

                            } else {
                                String convertedName = (String) session.getAttribute("convertedName" + theIndex);
                                String filePath = (String) session.getAttribute("filePath" + theIndex);
                                String fileName = (String) session.getAttribute("fileName" + theIndex);
//
                                if (convertedName != null || filePath != null || fileName != null && convertedName != "" || filePath != "" || fileName != "") {
                                    envelopeAData1.get(theIndex).setFileName(fileName);
                                    envelopeAData1.get(theIndex).setFilePath(filePath);
                                    envelopeAData1.get(theIndex).setConvertedFileName(convertedName);
                                }
                            }
                        } else {
                            System.out.println("file is not changed ");
                        }
                    } else {
                        envelopeAData1.get(theIndex).setFieldValueOfContractor(dynamicTemplatePojo1.getTextfield());
                        envelopeAData1.get(theIndex).setFieldValueOfDepartmentAdmin(dynamicTemplatePojo1.getTextfield());
                        envelopeAData1.get(theIndex).setFieldValueOfDepartmentUser(dynamicTemplatePojo1.getTextfield());

                        if (envelopeAData1.get(theIndex).getLabelTypeA().equals("4")) {

                            envelopeAData1.get(theIndex).setFieldValueInWordsOfContractor(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeAData1.get(theIndex).setFieldValueInWordsOfDepartmentAdmin(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeAData1.get(theIndex).setFieldValueInWordsOfDepartmentUser(dynamicTemplatePojo1.getTextfieldInWords());
                        }

                    }
                    boolean flag1 = checkTenderBiddingDate(envelopeAData1.get(theIndex).getTenderId());
                    if (flag1 == true) {
                        flag = envelopeADataDaoImpl.insertData(envelopeAData1.get(theIndex));

                    } else {
                        response = "bidding is not allowed";
                    }
                }
            }
            if (flag == true) {
                response = "Envelope A Re-bid Submitted";
                logs.setActivity("ReBid on Envelope A");
                logs.setLogMessage("Envelope A Re-bidding is Submitted");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contId);
                logs.setTenderId(tenderId);
                logs.setEnvelope("EA");
                logsActionDao.save(logs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        gsonUtility.writeData(response);
        System.out.println("response " + response);
        return response;
    }

    @RequestMapping(value = "/updateEnvelopeB", method = RequestMethod.POST)
    @ResponseBody
    public String updateEnvelopeB(@ModelAttribute("form") DynamicTemplatePojo dynamicTemplatePojo, HttpSession session, HttpServletRequest request) throws IOException {
        System.out.println("inside updateEnvelopeB ");
        boolean flag = false;
        TenderSubmittedEnvelopeB submittedEnvelopeB = null;
        List<EnvelopeBData> envelopeBData1 = new ArrayList<>();
        String response = "";
        int theIndex = 0;
        int contId = 0;
        int tenderId = 0;
        String url = FileUtility.UPLOAD_TEMPORARYDOCUMENT;
        try {

            tenderId = (int) session.getAttribute("tenderId");
            contId = (int) session.getAttribute("contRegId");
            if (tenderId != 0) {

                submittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);
            }
            String officer[] = submittedEnvelopeB.getEnvelopeBOfficers().split(",");
            //   System.out.println("length " + officer.length + " officers " + submittedEnvelopeB.getEnvelopeBOfficers());

            for (int i = 0; i < officer.length; i++) {

                envelopeBData1 = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, contId, Integer.parseInt(officer[i]));
                for (DynamicTemplatePojo dynamicTemplatePojo1 : dynamicTemplatePojo.getDatalist()) {
                    theIndex = dynamicTemplatePojo.getDatalist().indexOf(dynamicTemplatePojo1);
                    //  System.out.println("   id " + dynamicTemplatePojo1.getEnvelopeBDataId());

                    //   System.out.println(" TenderEnvelopeA labelType  " + envelopeBData1.get(theIndex).getLabelTypeA());
                    if (envelopeBData1.get(theIndex).getLabelTypeA().equals("3")) {
                        if ("".equals(dynamicTemplatePojo1.getFileFlag()) || dynamicTemplatePojo1.getFileFlag() != null) {
                            System.out.println("file is  changed ");
                            if (i == 0) {
                                String convertedName = fileUtility.fileUploadingUtil(dynamicTemplatePojo1.getFiles(), url);

                                envelopeBData1.get(theIndex).setFileName(dynamicTemplatePojo1.getFiles().getOriginalFilename());
                                envelopeBData1.get(theIndex).setFilePath(servletContext.getContextPath() + url + File.separator + convertedName);
                                envelopeBData1.get(theIndex).setConvertedFileName(convertedName);

                                session.setAttribute("convertedName" + theIndex, convertedName);
                                session.setAttribute("filePath" + theIndex, envelopeBData1.get(theIndex).getFilePath());
                                session.setAttribute("fileName" + theIndex, envelopeBData1.get(theIndex).getFileName());
                            } else {
                                String convertedName = (String) session.getAttribute("convertedName" + theIndex);
                                String filePath = (String) session.getAttribute("filePath" + theIndex);
                                String fileName = (String) session.getAttribute("fileName" + theIndex);
//
                                if (convertedName != null || filePath != null || fileName != null && convertedName != "" || filePath != "" || fileName != "") {
                                    envelopeBData1.get(theIndex).setFileName(fileName);
                                    envelopeBData1.get(theIndex).setFilePath(filePath);
                                    envelopeBData1.get(theIndex).setConvertedFileName(convertedName);
                                }
                            }
                        } else {
                            System.out.println("file is not changed ");
                        }
                    } else {
                        envelopeBData1.get(theIndex).setFieldValueOfContractor(dynamicTemplatePojo1.getTextfield());
                        envelopeBData1.get(theIndex).setFieldValueOfDepartmentAdmin(dynamicTemplatePojo1.getTextfield());
                        envelopeBData1.get(theIndex).setFieldValueOfDepartmentUser(dynamicTemplatePojo1.getTextfield());

                        if (envelopeBData1.get(theIndex).getLabelTypeA().equals("4")) {

                            envelopeBData1.get(theIndex).setFieldValueInWordsOfContractor(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeBData1.get(theIndex).setFieldValueInWordsOfDepartmentAdmin(dynamicTemplatePojo1.getTextfieldInWords());
                            envelopeBData1.get(theIndex).setFieldValueInWordsOfDepartmentUser(dynamicTemplatePojo1.getTextfieldInWords());
                        }

                    }
                    boolean flag1 = checkTenderBiddingDate(envelopeBData1.get(theIndex).getTenderId());
                    if (flag1 == true) {
                        flag = envelopeBDataDaoImpl.insertData(envelopeBData1.get(theIndex));

                    } else {
                        response = "bidding is not allowed";
                    }
                }
            }
            if (flag == true) {
                response = "Envelope B Re-bid Submitted";
                logs.setActivity("ReBid on Envelope B");
                logs.setLogMessage("Envelope B Re-bidding is Submitted");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contId);
                logs.setEnvelope("EB");
                logs.setTenderId(tenderId);

                logsActionDao.save(logs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        gsonUtility.writeData(response);
        System.out.println("response " + response);
        return response;
    }

    @RequestMapping(value = "/saveEmdData", method = RequestMethod.POST)
    @ResponseBody
    public String saveEmdData(@ModelAttribute("emdPayment") EmdPayment emdPayment, HttpServletRequest request, HttpSession session, Model m, RedirectAttributes ra) {
        System.out.println("-------------------method call to saveEmdData in Controller-----------------");
        String response = null;
        boolean flag = true;
        //   System.out.println("multipart  " + emdPayment.getEmdCopyFile());
        try {

            Integer contloginid = (Integer) session.getAttribute("contRegId");
            Integer tender_Id = (Integer) session.getAttribute("tenderId");
            System.out.println("tender id" + tender_Id);
            if (emdPayment.getEmdCopyFile() != null && emdPayment.getEmdId() == null) {
                System.out.println("to save EMD in if");
                String File = emdPayment.getEmdCopyFile().getOriginalFilename();
                String newfile = departmentService.saveFile(emdPayment.getEmdCopyFile(), request, File);
                String convname = departmentService.convName(emdPayment.getEmdCopyFile(), File);
                emdPayment.setEmdCopyUrl(newfile);
                emdPayment.setEmdCopy(File);
                flag = emdmodel.validateEmd(emdPayment);
            } else if (emdPayment.getEmdCopyFile() == null && emdPayment.getEmdId() == null) {
                System.out.println("to save emd in else");
                flag = emdmodel.validateEmd(emdPayment);
            } else if (emdPayment.getEmdCopyFile() == null && emdPayment.getEmdId() != null) {
                System.out.println("to update EMD in if");
                EmdPayment emdpaymentfetch = emdDaoImpl.fetchEmdById(tender_Id, contloginid);
                ///     System.out.println("emdpaymentfetch " + emdpaymentfetch.getContractorId());
                emdPayment.setEmdCopyUrl(emdpaymentfetch.getEmdCopyUrl());
                emdPayment.setEmdCopy(emdpaymentfetch.getEmdCopy());
                flag = emdmodel.validateEmdForUpdate(emdPayment);
            } else if (emdPayment.getEmdCopyFile() != null && emdPayment.getEmdId() != null) {
                System.out.println("to update EMD in else");
                String File = emdPayment.getEmdCopyFile().getOriginalFilename();
                String newfile = departmentService.saveFile(emdPayment.getEmdCopyFile(), request, File);
                String convname = departmentService.convName(emdPayment.getEmdCopyFile(), File);
                emdPayment.setEmdCopyUrl(newfile);
                emdPayment.setEmdCopy(File);
                flag = emdmodel.validateEmdForUpdate(emdPayment);
            }
            //  System.out.println(" emdPayment.getEmdCopy()  " + emdPayment.getEmdCopy());
            emdPayment.setTender_Id(tender_Id);
            emdPayment.setContractorId(contloginid);
            emdPayment.setStatus("success");
            System.out.println("flag" + flag);
            Date date = new Date();
            emdPayment.setCreatedDate(date);
            if (flag == true) {
                emdDaoImpl.insertData(emdPayment);
                response = "Tender Wise Emd successfully saved";
                logs.setActivity("Save EMD");
                logs.setLogMessage("EMD is Submitted");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contloginid);
                logs.setTenderId(tender_Id);
                logsActionDao.save(logs);
//                m.addAttribute("response", response);
//                System.out.println("response "+response);
                System.out.println("saved successfully emd");
                return response;
            }

            Integer emdid = emdPayment.getEmdId();
            System.out.println("emdid after inserting Emd" + emdid);
            session.setAttribute("emdidd", emdid);
            gsonUtility.writeData(response);
        } catch (Exception e) {
            e.getMessage();
            System.out.println("Exception in saveTemplateData" + e.getMessage());
        }
        System.out.println("---------------method end to saveEmdData in Controller----------------");
        return response;
    }

    //timer clock for bidding remaining time 
    @RequestMapping("/countDownTimer")
    public String countDownTimers(@RequestParam int tenderId) {
        System.out.println("countDownTimer countDownTimer countDownTimer  " + tenderId);
        TenderKeyDates keyDate = null;

        Session session = null;
        String response = "";
        try {
            keyDate = tenderDaoImpl.readKeyDate(tenderId);
            int tender_Id = Integer.parseInt(keyDate.getTender_Id());

            Tender tender = tenderDaoImpl.read(tender_Id);

            SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
            if ("2".equals(tender.getTenderStage()) && keyDate.getEcBidSubmissionDate() != null) {

                String date1 = keyDate.getEcBidSubmissionDate();

                String[] parts = date1.split("/");
//            System.out.println("Time: " + parts[1]);
                String dates = parts[1];

//            System.out.println("keyDate keyDate  " + dates);
                //bidDate = sdf.parse(dates);
                Date bidDate = new Date(dates);

                this.timer = countDateDiff(new Date(), bidDate, TimeUnit.SECONDS);

                Gson gson = new Gson();
                response = gson.toJson(timer);
                gsonUtility.writeData(response);

            } else {
                if (keyDate != null) {

                    String date = keyDate.getBidSubmissionDate();
                    String date1 = keyDate.getEcBidSubmissionDate();

                    String[] parts = date.split("/");
//            System.out.println("Time: " + parts[1]);
                    String dates = parts[1];

//            System.out.println("keyDate keyDate  " + dates);
                    //bidDate = sdf.parse(dates);
                    Date bidDate = new Date(dates);

                    this.timer = countDateDiff(new Date(), bidDate, TimeUnit.SECONDS);

                    Gson gson = new Gson();
                    response = gson.toJson(timer);
                    gsonUtility.writeData(response);
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return response;
    }

    public static long countDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
        long diffInMillies = date2.getTime() - date1.getTime();
        return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }

    @RequestMapping("/bidWithDrawForm")
    public String bidWithDrawForm() {
        System.out.println("Inside bidwithDraw");
        try {

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Contractor/BidWithDrawForm";
    }

    @RequestMapping("/saveBidWithDrawRequest")
    @ResponseBody
    public String saveBidWithDrawRequest(@RequestParam("remark") String remark, @RequestParam("uploadfileName") CommonsMultipartFile uploadfileName, HttpSession session, HttpServletRequest request) {
        //    System.out.println("inside saveBidWithDrawRequest   " + remark+ "remark file name "+uploadfileName.getOriginalFilename());
        List<EnvelopeAData> envelopeAData1 = new ArrayList<>();
        int tenderId = 0;
        int contId = 0;
        boolean flag = false;
        String response = "";
        try {
            String fileurl = FileUtility.UPLOAD_TEMPORARYDOCUMENT;
            String uploadfile = uploadfileName.getOriginalFilename();
            String uploadfileconvertedname = fileUtility.fileUploadingUtil(uploadfileName, fileurl);
            String uploadfilepath = servletContext.getContextPath() + fileurl + File.separator + uploadfileconvertedname;

            tenderId = (int) session.getAttribute("tenderId");
            contId = (int) session.getAttribute("contRegId");
            envelopeAData1 = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, contId);
            for (EnvelopeAData envelopeAData : envelopeAData1) {
                envelopeAData.setContractor_status("BidWithDrawn");
                envelopeAData.setBidwithDrawRemark(remark);
                envelopeAData.setUploadfileName(uploadfile);
                envelopeAData.setUploadfileConvertedNAme(uploadfileconvertedname);
                envelopeAData.setUploadfilePath(uploadfilepath);
                flag = envelopeADataDaoImpl.updateData(envelopeAData);
            }

            if (flag == true) {
                response = "Your Bid has been WithDrawn";
                logs.setActivity("BidWithDrawn");
                logs.setLogMessage("BidWithDrawn by Contractor");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setContractorId(contId);
                logs.setTenderId(tenderId);
                logsActionDao.save(logs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("response " + response);

        return response;
    }

    @RequestMapping(value = "/getTenderDetail", method = RequestMethod.POST)
    @ResponseBody
    public String getTenderDetail(@RequestParam int tenderId, HttpSession session) {
        System.out.println("tenderIdsss " + tenderId);
        String response = "";
        Tender tender = null;
        int contRegId = 0;

        try {

            if (session.getAttribute("contRegId") != "" || session.getAttribute("contRegId") != null) {
                contRegId = (int) session.getAttribute("contRegId");

            }
            tender = tenderDaoImpl.read(tenderId);

            List<EnvelopeAData> envelopeAData = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, contRegId);

            List<EnvelopeBData> envelopeBData = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, contRegId);

            List<EnvelopeCData> envelopeCData = envelopeCDataDaoImpl.fetchEnvelopeCById(tenderId, contRegId);

            List<QcbsData> envelopQcbs = qcbsDataDaoImpl.fetchQcbsById(String.valueOf(tenderId), contRegId);

            System.out.println("envelopeAData size submitted " + envelopeAData.size() + ""
                    + "\n envelopeBData size submitted " + envelopeBData.size() + ""
                    + "\nenvelopeCData size submitted " + envelopeCData.size());

            if (envelopeAData.isEmpty()) {
                tender.setEnvelopeASubmittStatus(false);

            } else {
                tender.setEnvelopeASubmittStatus(true);
                tender.setEnvelopeA_Logs(logsActionDao.fetchData(tenderId, contRegId, "EA"));
            }
            TenderKeyDates dates = tenderKeyDatesDao.readKeyDate(tenderId);
            String openingEb = dates.getOpeningEB();
//            String openingEc=dates.getOpeningEC();
//            if(openingEc.equals("")){
//                tender.setShowEC(false);
//                System.out.println("tttttttttttttttttttt"+false);
//            }
//            else{
//                tender.setShowEC(true);
//            }
            if (openingEb.equals("")) {
                tender.setShowEB(false);
            } else {
                tender.setShowEB(true);
            }

            SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
            //Stage 2 envelop 2
            if ("2".equals(tender.getTenderStage()) && dates.getOpeningEA() != null && "2".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE " + tender.getTenderStage());
                if (dates.getOpeningEC() != null) {
                    System.out.println("STAGE @" + tender.getTenderStage());

                    String ECDate = dates.getOpeningEA().trim().split("/")[0]; // Handle parse exception
                    System.out.println("The EC DATE: " + ECDate);
                    // Assuming ECDate is in a format that Date constructor can parse.
                    // If not, you might need to use SimpleDateFormat to parse it properly.
                    Date date1 = new Date(ECDate);  // Adjust the date format as needed
                    System.out.println("EC DATE: " + date1);
                    // Compare current date with ECDate
                    if (sdf.parse(sdf.format(new Date())).getTime() <= date1.getTime()) {

                        tender.setShowEC(false);

                        System.out.println("SHOWEC TRUE");
                    } else {
                        tender.setShowEC(true);
                        System.out.println("ECCCC FALSE");
                    }
                } else {
                    System.out.println("Opening EC date is null, running next code...");
                    // Add your additional logic here for the null case
                    // Example of setting a default value
                }

            }

            if ("2".equals(tender.getTenderStage()) && dates.getOpeningEC() != null && "3".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE " + tender.getTenderStage());
                if (dates.getOpeningEC() != null) {
                    System.out.println("STAGE @" + tender.getTenderStage());

                    String ECDate = dates.getOpeningEC().trim().split("/")[0]; // Handle parse exception
                    System.out.println("The EC DATE: " + ECDate);
                    // Assuming ECDate is in a format that Date constructor can parse.
                    // If not, you might need to use SimpleDateFormat to parse it properly.
                    Date date1 = new Date(ECDate);  // Adjust the date format as needed
                    System.out.println("EC DATE: " + date1);
                    // Compare current date with ECDate
                    if (sdf.parse(sdf.format(new Date())).getTime() <= date1.getTime()) {

                        tender.setShowEC(true);
                        System.out.println("SHOWEC TRUE33");
                    } else {
                        tender.setShowEC(false);

                        System.out.println("ECCCC FALSE33");
                    }
                }
            }

            if ("1".equals(tender.getTenderStage()) && "2".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());

                tender.setShowEC(true);
                System.out.println("EAAAAAAA is TRUE");
            } else {
                System.out.println("NOOOOO");
            }

            if ("1".equals(tender.getTenderStage()) && "3".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                tender.setShowEB(true);
                tender.setShowEC(true);

                System.out.println("EA EB EC is TRUE");
            } else {
                System.out.println("NAAAAAA");

            }

            if ("1".equals(tender.getTenderStage()) && "4".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                tender.setShowEB(true);
                tender.setShowEC(true);

                System.out.println("EA EB EC is TRUE");
                System.out.println("TENDER ENVELOPE YEH HAI" + tender.getEnvelopeType());
            } else {
                System.out.println("NAAAAAA");

            }

            if ("1".equals(tender.getTenderStage()) && "1".equals(tender.getEnvelopeType())) {
                System.out.println("TENDER STAGE" + tender.getTenderStage());
                System.out.println("tender ENvelope " + tender.getEnvelopeType());
                tender.setShowEB(false);
                tender.setShowEC(false);

                System.out.println("EA EB EC is TRUE");
                System.out.println("TENDER ENVELOPE YEH HAI" + tender.getEnvelopeType());
            } else {
                System.out.println("NAAAAAA");

            }

            if (envelopeBData.isEmpty()) {
                tender.setEnvelopeBSubmittStatus(false);

            } else {
                tender.setEnvelopeBSubmittStatus(true);
                tender.setEnvelopeB_Logs(logsActionDao.fetchData(tenderId, contRegId, "EB"));
            }
            if (envelopQcbs.isEmpty()) {
                tender.setEnvelopeBSubmittStatus(false);
                System.out.println("QCBS FALSE");

            } else {
                tender.setEnvelopeBSubmittStatus(true);
                System.out.println("QCBS TRUE");
                tender.setEnvelopeB_Logs(logsActionDao.fetchData(tenderId, contRegId, "QCBS"));
            }

            if (envelopeCData.isEmpty()) {
                tender.setEnvelopeCSubmittStatus(false);
                System.out.println("envelopeCData");
            } else {
                tender.setEnvelopeCSubmittStatus(true);
                System.out.println("envelopeCData      TRUE");
                tender.setEnvelopeC_Logs(logsActionDao.fetchData(tenderId, contRegId, "EC"));
            }

            if (openingEb.equals("")) {
                if (!envelopeAData.isEmpty() || !envelopeCData.isEmpty()) {
                    tender.setViewBid(true);
                } else {
                    tender.setViewBid(false);
                }
                if (!envelopeAData.isEmpty() && !envelopeCData.isEmpty()) {
                    tender.setProceedtoBid(false);
                    tender.setProcesstoCBid(false);
                    System.out.println("envelopeCData      FALSE");
                } else {
                    tender.setProceedtoBid(true);
                    tender.setProcesstoCBid(true);
                    System.out.println("envelopeCData    TRUE");
                    System.out.println("STTAGE" + tender.getTenderStage());

                }

            } else {
                if (!envelopeAData.isEmpty() || !envelopeBData.isEmpty() || !envelopeCData.isEmpty()) {
                    tender.setViewBid(true);
                } else {
                    tender.setViewBid(false);
                }
                if (!envelopeAData.isEmpty() && !envelopeBData.isEmpty() && !envelopeCData.isEmpty()) {
                    tender.setProceedtoBid(true);
                    System.out.println("envelopeCData       FALSE");
                } else {
                    tender.setProceedtoBid(true);
                    System.out.println("envelopeCData      TRUE");

                }
            }

            Gson gson = new Gson();
            response = gson.toJson(tender);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("response is ----> " + response);
        return response;
    }

}
