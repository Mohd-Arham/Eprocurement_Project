/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.dao.DepartmentUserDao;
import com.eproc.dao.DivisionDAO;
import com.eproc.dao.EnvelopeTypeDao;
import com.eproc.dao.SelectiveTenderDao;
import com.eproc.dao.SubDivisionDAO;
import com.eproc.dao.TenderAmendmentKeyDatesDao;
import com.eproc.dao.TenderCategoryDAO;
import com.eproc.dao.TenderDocumentAmendmentDao;
import com.eproc.dao.TenderDocumentDao;
import com.eproc.dao.TenderKeyDatesDao;
import com.eproc.dao.TenderKeywordDAO;
import com.eproc.dao.TenderStageDao;
import com.eproc.dao.TenderSubmittedQCBSDao;
import com.eproc.dao.TypeofTendersDao;
import com.eproc.dao.UploadSorDao;
import com.eproc.daoImpl.AddToCartDaoImpl;
import com.eproc.daoImpl.AuctionDaoImpl;
import com.eproc.daoImpl.ContractorClassDAOImpl;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.PaymentDAOImpl;
import com.eproc.daoImpl.SelectiveTenderDAOImpl;
import com.eproc.daoImpl.TenderAmendmentDaoImpl;
import com.eproc.daoImpl.TenderCategoryDAOImpl;
import com.eproc.daoImpl.TenderDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeBDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeCDaoImpl;
import com.eproc.domain.AddToCart;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.Auction;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Designation;
import com.eproc.domain.EnvelopeType;
import com.eproc.domain.PurchaseDetails;
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
import com.eproc.domain.TenderSubmittedEnvelopeC;
import com.eproc.domain.TenderSubmittedQCBS;
import com.eproc.domain.TypeOfTenders;
import com.eproc.domain.UploadSOR;
import com.eproc.util.EmailService;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Naina Jain
 */
@Controller
public class LiveTenderAuctionInfoController {

    @Autowired
    DepartmentAdminDAOImpl departmentAdminDaoImpl;

    @Autowired
    SelectiveTenderDAOImpl selectiveTenderDAOImpl;

    @Autowired
    TenderCategoryDAOImpl tenderCatDAOImpl;

    @Autowired
    ContractorClassDAOImpl contractorClassDAOImpl;

    @Autowired
    TenderDaoImpl tenderDaoImpl;

    @Autowired
    AuctionDaoImpl auctionDaoImpl;

    @Autowired
    AddToCartDaoImpl addToCartDaoImpl;

    @Autowired
    ContractorDaoImpl contractorDaoImpl;

    @Autowired
    PaymentDAOImpl paymentDAOImpl;

    @Autowired
    TenderAmendmentDaoImpl tenderAmendmentDaoImpl;

    @Autowired
    TenderStageDao tenderStage;
    @Autowired
    SelectiveTenderDao selectiveTender;
    @Autowired
    EnvelopeTypeDao envelopeTypeDao;
    @Autowired
    TypeofTendersDao typeofTendersDao;
    @Autowired
    AreaOfWorkDAO areaOfWorkDAO;
    @Autowired
    TenderKeywordDAO addKeywordDAO;
    @Autowired
    TenderCategoryDAO categoryDAO;
    @Autowired
    DivisionDAO divisionDAO;
    @Autowired
    SubDivisionDAO subDivisionDAO;
    @Autowired
    TenderSubmittedEnvelopeADaoImpl envelopeADaoImpl;
    @Autowired
    TenderSubmittedEnvelopeBDaoImpl envelopeBDaoImpl;
    @Autowired
    TenderSubmittedEnvelopeCDaoImpl envelopeCDaoImpl;
    @Autowired
    TenderSubmittedQCBSDao submittedQCBS;
    @Autowired
    DepartmentUserDao departmentUserDao;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    UploadSorDao uploadSorDao;
    @Autowired
    TenderDocumentDao documentDao;
    @Autowired
    TenderDocumentAmendmentDao documentAmendmentDao;
    @Autowired
    TenderKeyDatesDao tenderKeyDatesDao;
    @Autowired
    TenderAmendmentKeyDatesDao tenderAmendmentKeyDatesDao;
    @Autowired
    EmailService emailService;

    @RequestMapping("/liveTenderAuction")
    public String liveTenderAuction(Model m, HttpSession session) {
        System.out.println("##### inside liveTenderAuction() LiveTenderAuctionInfoController ####");
        List<DepartmentAdmin> deptList = null;
        List<TenderCategory> categoryList = null;
        List<SelectiveTender> SelectiveTenderList = null;
        List<ContractorClass> contractorClassList = null;
        String str1 = "Approved", str2 = "Amended";
        try {
            deptList = departmentAdminDaoImpl.fetchAllDeptName();
            contractorClassList = contractorClassDAOImpl.fetchAll();
            categoryList = tenderCatDAOImpl.fetchAll();
            SelectiveTenderList = selectiveTenderDAOImpl.fetchAll();

            List<Tender> tenderList = tenderDaoImpl.fetchTenderStatus(str1, str2);
            System.out.println("The Tender List is: " + tenderList.size());
            List<Auction> auctionList = auctionDaoImpl.fetchAuctionStatus(str1, str2);
            System.out.println("Auction List is: " + auctionList);
            if (tenderList.size() == 0 && auctionList.size() == 0) {
                m.addAttribute("NODataMsg", "No Data Is Available");
                return "Contractor/new_livetenderauctioninfo";
            }
            List<Tender> tenderList2 = addToCartDaoImpl.liveTenderList(tenderList);
            String tenderIdList = "";
            for (Tender tn22 : tenderList2) {
                int tender_Id = tn22.getTender_Id();
                System.out.println("~~~~~inside condition null~~~~");
                tenderIdList = tenderIdList + "," + tender_Id;
            }

            List<Auction> auctionList2 = addToCartDaoImpl.liveAuctionList(auctionList);
            String auctionIdList = "";
            for (Auction an22 : auctionList2) {
                int auctionId = an22.getAuctionId();
                auctionIdList = auctionIdList + "," + auctionId;
            }
            System.out.println("tenderIdList~~~~~~~~~~~~ " + tenderIdList);
            System.out.println("auctionIdList~~~~~~~~~~~~ " + auctionIdList);
            m.addAttribute("tenderRole", "Tender");
            m.addAttribute("auctionRole", "Auction");
            m.addAttribute("deptList", deptList);
            m.addAttribute("categoryList", categoryList);
            m.addAttribute("contClassList", contractorClassList);
            m.addAttribute("SelectiveTenderList", SelectiveTenderList);
            m.addAttribute("tenderIdList", tenderIdList);
            m.addAttribute("auctionIdList", auctionIdList);
            m.addAttribute("tenderList", tenderList2);
            m.addAttribute("auctionList", auctionList2);
            m.addAttribute("msg2", "You have to check the Checkboxes to Purchase");
//        return "Contractor/livetenderauctioninfo";
        } catch (Exception ex) {
            System.out.println("class: LiveTenderAuctionInfoController and method: liveTenderAuction");
            System.out.println("Exception in liveTenderAuction() LiveTenderAuctionInfoController " + ex.getMessage());
            ex.printStackTrace();
        }
        return "Contractor/new_livetenderauctioninfo";
    }

    @RequestMapping("/addToPurchaseAll")
    public String addToPurchaseAll(Model m, @RequestParam String tenderIdListVal, @RequestParam String auctionIdListVal, @RequestParam String tenderRole,
            @RequestParam String auctionRole, HttpSession session) throws Exception {
        System.out.println("~~~inside add To *Purchase* All Selected Tender ~~~");
        List tenderIdList = new ArrayList<>();
        List auctionIdList = new ArrayList();
        List tntotaldocfeewithtaxList = new ArrayList<>();
        List antotaldocfeewithtaxList = new ArrayList<>();
        PurchaseDetails purchaseDetails = new PurchaseDetails();
        long grandtotaldocfeewithtax = 0;
        try {
            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);
            m.addAttribute("orderId", orderId);
            int contloginid = (int) session.getAttribute("contRegId");
            String[] tenderauctionIdListvalue = tenderIdListVal.split(",");
            System.out.println("The sizeeeeeeeeee is "+tenderauctionIdListvalue.length);
            for (int i = 1; i < tenderauctionIdListvalue.length; i++) {
                String tenderauctionIdListData = tenderauctionIdListvalue[i];
                System.out.println("~~~~ tenderauctionIdListData ~~~~~  " + tenderauctionIdListData);
                List<Tender> tenderList2 = addToCartDaoImpl.liveTenderList(Integer.parseInt(tenderauctionIdListData));
                for (Tender tn : tenderList2) {
                    purchaseDetails = paymentDAOImpl.fetchAllBidderByTenderIdContId(tn.getTender_Id(), contloginid);
                    if (purchaseDetails != null) {
                        if ("unsuccess".equals(purchaseDetails.getBankStatus())) {
                            long tnportalCharge = Long.parseLong(tn.getPortalCharge());
                            long tnportalchargewithtax = ((tnportalCharge * 18) / 100);
                            long tenderDocumentFees = Long.parseLong(tn.getTenderFeeInFig());
                            long tntotaldocfeewithtax = tenderDocumentFees + tnportalchargewithtax + tnportalCharge;
                            grandtotaldocfeewithtax = tntotaldocfeewithtax + grandtotaldocfeewithtax;
                            tntotaldocfeewithtaxList.add(tntotaldocfeewithtax);
                            tenderIdList.add(tn);
                            AddToCart addToCart = new AddToCart();
                            BeanUtils.copyProperties(addToCart, tn);
                            if (contloginid != 0) {
                                addToCart.setContractorId(contloginid);
                            }
                            AddToCart addToCartData = addToCartDaoImpl.fetchTnDataWithContId(Integer.parseInt(tenderauctionIdListData), contloginid);
                            if (addToCartData == null) {
                                addToCartDaoImpl.insertData(addToCart);
                                m.addAttribute("msg", "Selected Tender/Auction successfully Added to Purchase");
                            }

                        }
                    } else {
                        long tnportalCharge = Long.parseLong(tn.getPortalCharge());
                        long tnportalchargewithtax = ((tnportalCharge * 18) / 100);
                        long tenderDocumentFees = Long.parseLong(tn.getTenderDocumentFees());
                        long tntotaldocfeewithtax = tenderDocumentFees + tnportalchargewithtax + tnportalCharge;
                        grandtotaldocfeewithtax = tntotaldocfeewithtax + grandtotaldocfeewithtax;
                        tntotaldocfeewithtaxList.add(tntotaldocfeewithtax);
                        tenderIdList.add(tn);
                        AddToCart addToCart = new AddToCart();
                        BeanUtils.copyProperties(addToCart, tn);
                        if (contloginid != 0) {
                            addToCart.setContractorId(contloginid);
                        }
                        AddToCart addToCartData = addToCartDaoImpl.fetchTnDataWithContId(Integer.parseInt(tenderauctionIdListData), contloginid);
                        if (addToCartData == null) {
                            addToCartDaoImpl.insertData(addToCart);
                            m.addAttribute("msg", "Selected Tender/Auction successfully Added to Purchase");
                        }
                    }
                }
            }
            String[] auctionIdListvalue = auctionIdListVal.split(",");
            for (int i = 1; i < auctionIdListvalue.length; i++) {
                String auctionIdListData = auctionIdListvalue[i];
                System.out.println("~~~~ auctionIdListData ~~~~~  " + auctionIdListData);
                List<Auction> auctionList2 = addToCartDaoImpl.liveAuctionList(Integer.parseInt(auctionIdListData));
                for (Auction an : auctionList2) {
                    long anportalCharge = Long.parseLong(an.getPortalCharge());
                    long anportalchargewithtax = ((anportalCharge * 18) / 100);
                    long auctionDocumentFees = Long.parseLong(an.getAuctionFees());
                    long antotaldocfeewithtax = auctionDocumentFees + anportalchargewithtax + anportalCharge;
                    grandtotaldocfeewithtax = antotaldocfeewithtax + grandtotaldocfeewithtax;
                    antotaldocfeewithtaxList.add(antotaldocfeewithtax);
                    auctionIdList.add(an);
                    AddToCart addToCart = new AddToCart();
                    BeanUtils.copyProperties(addToCart, an);
                    addToCart.setContractorId(contloginid);
                    AddToCart addToCartData = addToCartDaoImpl.fetchAnDataWithContId(Integer.parseInt(auctionIdListData), contloginid);
                    if (addToCartData == null) {
                        addToCartDaoImpl.insertData(addToCart);
                        m.addAttribute("msg", "Selected Tender/Auction successfully Added to Purchase");
                    }
                }
            }
            if (tenderIdList.isEmpty()) {
                m.addAttribute("notenderavail", "All are purchased");
            } else {
                m.addAttribute("tenderList", tenderIdList);
            }

            m.addAttribute("tenderRole", tenderRole);
            m.addAttribute("auctionRole", auctionRole);
            m.addAttribute("tntotaldocfeewithtaxList", tntotaldocfeewithtaxList);
            m.addAttribute("antotaldocfeewithtaxList", antotaldocfeewithtaxList);

            m.addAttribute("auctionList", auctionIdList);
            m.addAttribute("tenderIdList", tenderIdListVal);
            m.addAttribute("auctionIdList", auctionIdListVal);
            m.addAttribute("grandtotaldocfeewithtax", grandtotaldocfeewithtax);
//        return "Contractor/viewpurchasealltenderauction";
        } catch (Exception ex) {
            System.out.println("class: LiveTenderAuctionInfoController and method: addToPurchaseAll");
            System.out.println("Exception in addToPurchaseAll() LiveTenderAuctionInfoController " + ex.getMessage());
            ex.printStackTrace();
        }
        return "Contractor/new_viewpurchasealltenderauction";
    }

    @RequestMapping("/removeselectedtender")
    public String removeselectedtender(Model m, @RequestParam int tender_Id, @RequestParam String tenderRole, @RequestParam String auctionRole, @RequestParam String tenderIdListVal, @RequestParam String auctionIdListVal, HttpSession session) throws Exception {
        System.out.println("~~~inside Remove Selected Tender ~~~");
        List tenderIdList = new ArrayList();
        List auctionIdList = new ArrayList();
        List tntotaldocfeewithtaxList = new ArrayList<>();
        List antotaldocfeewithtaxList = new ArrayList<>();
        Tender tn = null;
        Auction an = null;
        long grandtotaldocfeewithtax = 0;
        try {
            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);
            m.addAttribute("orderId", orderId);
            int contloginid = (int) session.getAttribute("contRegId");
            addToCartDaoImpl.deleteTenderFromCart(tender_Id, contloginid);
            List<AddToCart> tenderauctionIdListvalue = addToCartDaoImpl.fetchAll();
            tenderIdListVal = tenderIdListVal.replace(String.valueOf(tender_Id + ","), "");
            System.out.println("!!!!!!!!!!!!!111111111111........ " + tenderIdListVal + "@@@@@@");
            for (AddToCart addToCart : tenderauctionIdListvalue) {

                String[] tenderIdListvalue = tenderIdListVal.split(",");
                for (int i = 1; i < tenderIdListvalue.length; i++) {
                    String tenderIdListData = tenderIdListvalue[i];
                    System.out.println("~~~~ tenderIdListData ~~~~~  " + tenderIdListData + "~~addToCart.getTender_Id()~~  " + addToCart.getTender_Id());
                    if (Integer.parseInt(tenderIdListData) == addToCart.getTender_Id()) {
                        System.out.println("inside if");
                        tn = tenderDaoImpl.read(Integer.parseInt(tenderIdListData));
                        long tnportalCharge = Long.parseLong(tn.getPortalCharge());
                        long tnportalchargewithtax = ((tnportalCharge * 18) / 100);
                        long tenderDocumentFees = Long.parseLong(tn.getTenderDocumentFees());
                        long tntotaldocfeewithtax = tenderDocumentFees + tnportalchargewithtax + tnportalCharge;
                        tntotaldocfeewithtaxList.add(tntotaldocfeewithtax);
                        grandtotaldocfeewithtax = tntotaldocfeewithtax + grandtotaldocfeewithtax;
                        tn.setTotalDocFeeWithTax(tntotaldocfeewithtax);
                        tenderIdList.add(tn);
                    }
                }
            }
            for (AddToCart addToCart : tenderauctionIdListvalue) {
                System.out.println("inside else");
                String[] auctionIdListvalue = auctionIdListVal.split(",");
                for (int j = 1; j < auctionIdListvalue.length; j++) {
                    String auctionIdListData = auctionIdListvalue[j];
                    System.out.println("~~~~ auctionIdListData ~~~~~  " + auctionIdListData + "~~addToCart.getAuctionId()~~  " + addToCart.getAuctionId());
                    if (Integer.parseInt(auctionIdListData) == addToCart.getAuctionId()) {
                        an = auctionDaoImpl.editAuctionData(addToCart.getAuctionId());
                        System.out.println("an :::::   " + an + "  portal ::: " + an.getPortalCharge());
                        long anportalCharge = Long.parseLong(an.getPortalCharge());
                        long anportalchargewithtax = ((anportalCharge * 18) / 100);
                        long auctionDocumentFees = Long.parseLong(an.getAuctionFees());
                        long antotaldocfeewithtax = auctionDocumentFees + anportalchargewithtax;
                        grandtotaldocfeewithtax = antotaldocfeewithtax + grandtotaldocfeewithtax;
                        antotaldocfeewithtaxList.add(antotaldocfeewithtax);
                        auctionIdList.add(an);
                    }
                }
            }
            m.addAttribute("tntotaldocfeewithtaxList", tntotaldocfeewithtaxList);
            m.addAttribute("antotaldocfeewithtaxList", antotaldocfeewithtaxList);
            m.addAttribute("tenderRole", tenderRole);
            m.addAttribute("auctionRole", auctionRole);
            m.addAttribute("tenderList", tenderIdList);
            m.addAttribute("auctionList", auctionIdList);
            m.addAttribute("tenderIdList", tenderIdListVal);
            m.addAttribute("auctionIdList", auctionIdListVal);
            m.addAttribute("grandtotaldocfeewithtax", grandtotaldocfeewithtax);
            m.addAttribute("msg", "Selected Tender removed successfully from Cart");
//        return "Contractor/viewpurchasealltenderauction";
        } catch (Exception ex) {
            System.out.println("class: LiveTenderAuctionInfoController and method: removeselectedtender");
            System.out.println("Exception in removeselectedtender() LiveTenderAuctionInfoController " + ex.getMessage());
            ex.printStackTrace();
        }
        return "Contractor/new_viewpurchasealltenderauction";
    }

    @RequestMapping("/removeselectedauction")
    public String removeselectedauction(Model m, @RequestParam int auctionId, @RequestParam String tenderRole, @RequestParam String auctionRole, @RequestParam String tenderIdListVal, @RequestParam String auctionIdListVal, HttpSession session) throws Exception {
        System.out.println("~~~inside Remove Selected Auction ~~~");
        List tenderIdList = new ArrayList();
        List auctionIdList = new ArrayList();
        List tntotaldocfeewithtaxList = new ArrayList<>();
        List antotaldocfeewithtaxList = new ArrayList<>();
        Tender tn = null;
        Auction an = null;
        long grandtotaldocfeewithtax = 0;
        try {
            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);
            m.addAttribute("orderId", orderId);
            int contloginid = (int) session.getAttribute("contRegId");
            addToCartDaoImpl.deleteAuctionFromCart(auctionId, contloginid);
            List<AddToCart> tenderauctionIdListvalue = addToCartDaoImpl.fetchAll();
            System.out.println("!!!!!!!!!!!!!111111111111........ " + tenderIdListVal + "@@@@@@");
            for (AddToCart addToCart : tenderauctionIdListvalue) {
                String[] tenderIdListvalue = tenderIdListVal.split(",");
                for (int i = 1; i < tenderIdListvalue.length; i++) {
                    String tenderIdListData = tenderIdListvalue[i];
                    System.out.println("~~~~ tenderIdListData ~~~~~  " + tenderIdListData + "~~addToCart.getTender_Id()~~  " + addToCart.getTender_Id());
                    if (Integer.parseInt(tenderIdListData) == addToCart.getTender_Id()) {
                        System.out.println("inside if");
                        tn = tenderDaoImpl.read(Integer.parseInt(tenderIdListData));
                        long tnportalCharge = Long.parseLong(tn.getPortalCharge());
                        long tnportalchargewithtax = ((tnportalCharge * 18) / 100);
                        long tenderDocumentFees = Long.parseLong(tn.getTenderDocumentFees());
                        long tntotaldocfeewithtax = tenderDocumentFees + tnportalchargewithtax + tnportalCharge;
                        tntotaldocfeewithtaxList.add(tntotaldocfeewithtax);
                        grandtotaldocfeewithtax = tntotaldocfeewithtax + grandtotaldocfeewithtax;
                        tn.setTotalDocFeeWithTax(tntotaldocfeewithtax);
                        tenderIdList.add(tn);
                    }
                }
            }
            for (AddToCart addToCart : tenderauctionIdListvalue) {
                System.out.println("inside else");
                auctionIdListVal = auctionIdListVal.replace(String.valueOf(auctionId + ","), "");
                String[] auctionIdListvalue = auctionIdListVal.split(",");
                for (int j = 1; j < auctionIdListvalue.length; j++) {
                    String auctionIdListData = auctionIdListvalue[j];
                    System.out.println("~~~~ auctionIdListData ~~~~~  " + auctionIdListData);
                    if (Integer.parseInt(auctionIdListData) == addToCart.getAuctionId()) {
                        an = auctionDaoImpl.editAuctionData(addToCart.getAuctionId());
                        long anportalCharge = Long.parseLong(an.getPortalCharge());
                        long anportalchargewithtax = ((anportalCharge * 18) / 100);
                        long auctionDocumentFees = Long.parseLong(an.getAuctionFees());
                        long antotaldocfeewithtax = auctionDocumentFees + anportalchargewithtax;
                        grandtotaldocfeewithtax = antotaldocfeewithtax + grandtotaldocfeewithtax;
                        antotaldocfeewithtaxList.add(antotaldocfeewithtax);
                        auctionIdList.add(an);
                    }
                }
            }
            m.addAttribute("tntotaldocfeewithtaxList", tntotaldocfeewithtaxList);
            m.addAttribute("antotaldocfeewithtaxList", antotaldocfeewithtaxList);
            m.addAttribute("tenderRole", tenderRole);
            m.addAttribute("auctionRole", auctionRole);
            m.addAttribute("tenderList", tenderIdList);
            m.addAttribute("auctionList", auctionIdList);
            m.addAttribute("tenderIdList", tenderIdListVal);
            m.addAttribute("auctionIdList", auctionIdListVal);
            m.addAttribute("grandtotaldocfeewithtax", grandtotaldocfeewithtax);
            m.addAttribute("msg", "Selected Tender removed successfully from Cart");
//        return "Contractor/viewpurchasealltenderauction";
        } catch (Exception ex) {
            System.out.println("class: LiveTenderAuctionInfoController and method: removeselectedauction");
            System.out.println("Exception in removeselectedauction() LiveTenderAuctionInfoController " + ex.getMessage());
            ex.printStackTrace();
        }
        return "Contractor/new_viewpurchasealltenderauction";
    }

    @RequestMapping("/removeAll")
    public String removeAll(Model m, @RequestParam String tenderIdListVal, @RequestParam String auctionIdListVal, HttpSession session) throws Exception {
        System.out.println("~~~inside Remove Selected Tender ~~~");
        try {
            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);
            m.addAttribute("orderId", orderId);
            int contloginid = (int) session.getAttribute("contRegId");
            String[] tenderauctionIdListvalue = tenderIdListVal.split(",");
            for (int i = 1; i < tenderauctionIdListvalue.length; i++) {
                String tenderauctionIdListData = tenderauctionIdListvalue[i];
                addToCartDaoImpl.deleteTenderFromCart(Integer.parseInt(tenderauctionIdListData), contloginid);
            }
            String[] auctionIdListvalue = auctionIdListVal.split(",");
            for (int i = 1; i < auctionIdListvalue.length; i++) {
                String auctionIdListData = auctionIdListvalue[i];
                addToCartDaoImpl.deleteAuctionFromCart(Integer.parseInt(auctionIdListData), contloginid);
            }
            m.addAttribute("notenderavail", "There is no item in your cart");
            m.addAttribute("msg", "Selected Tender removed successfully from Cart");
//        return "Contractor/viewpurchasealltenderauction";
        } catch (Exception ex) {
            System.out.println("class: LiveTenderAuctionInfoController and method: removeAll");
            System.out.println("Exception in removeAll() LiveTenderAuctionInfoController " + ex.getMessage());
            ex.printStackTrace();
        }
        return "Contractor/new_viewpurchasealltenderauction";
    }

//    @ResponseBody
//    @RequestMapping("liveOnSearch")
//    public String liveOnSearch(@RequestParam String type,String deptName,String nitNumber,String tender_Number,
//            String contractorClass,String tenderCategory,String estimateValueInFig,String emdInFig,String tenderFeeInFig,
//            String selectiveTender,String filter_date,String filter_date_2){
//     
//    }
    @ResponseBody
    @RequestMapping("liveOnSearch")
    public String liveOnSearch(Model m, @RequestParam String deptName, String nitNumber, String tender_Number,
            String contractorClassId, String tenderCategoryId, String estimateValueInFig,
            String emdInFig, String selectiveTenderId, String startDate, String endDate) {
        System.out.println("deptName controller " + deptName);
        Gson gson = new Gson();
        List combinedList = new ArrayList();
        try {
            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);
            m.addAttribute("orderId", orderId);
            combinedList = tenderDaoImpl.searchLive(deptName, nitNumber, tender_Number, contractorClassId,
                    tenderCategoryId, estimateValueInFig, emdInFig, selectiveTenderId, startDate, endDate);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return gson.toJson(combinedList);
    }

    @ResponseBody
    @RequestMapping("liveAucOnSearch")
    public String liveAucOnSearch(@RequestParam String deptName) {
        System.out.println("deptName controller " + deptName);
        List combinedList = auctionDaoImpl.searchAucLive(deptName);
        Gson gson = new Gson();
        return gson.toJson(combinedList);
    }

    @RequestMapping("viewTenderAllDetails")
    public String viewTenderAllDetails(@RequestParam("tender_Id") String tender_Id, @ModelAttribute Tender tender, TenderKeyDates tenderKeyDates, Model model, HttpSession session) {
        System.out.println("/:::::::::::::::::::::::::::::::Showing the created tender details:::::::::::::::::::::::/");
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
        //ModelAndView modelAndView = new ModelAndView();
        int contloginid = 0;
        try {
            contloginid = (int) session.getAttribute("contRegId");
            System.out.println("The Tender Id is: " + tender.getTender_Id());
            System.out.println("The Tender Id Request Param is: " + tender_Id);

            //Fetch the tender detail by tender Id.
            tender1 = tenderDaoImpl.read(tender.getTender_Id());

            System.out.println("The Tender Source is: " + tender1);
            System.out.println("Fetching the details from Tender");
            //Copy the object into another object
            org.springframework.beans.BeanUtils.copyProperties(tender1, tender);
            System.out.println("The Tender Target is: " + tender.getTenderStatus());

            if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                System.out.println("Fetching the details from TenderAmendment");
                tenderAmendment = tenderAmendmentDaoImpl.readAll(Integer.parseInt(tender_Id));
                //Copy the object into another object
                tenderAmendment.forEach((amendment) -> {
                    org.springframework.beans.BeanUtils.copyProperties(amendment, tender);
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

            if (tender.getSelectiveTender().equalsIgnoreCase("3") || tender.getSelectiveTender().equalsIgnoreCase("4")) {
                System.out.println("The Empanel Contractor are: " + tender.getEmpanelContrators());
                //List<Contractor> contractors = new ArrayList<>();
                String contractor[] = tender.getEmpanelContrators().split(",");
                for (String cont : contractor) {
                    Contractor c = new Contractor();
                    c = (Contractor) contractorDaoImpl.fetchData(Integer.parseInt(cont));
                    System.out.println("The Contractor Details is: " + c);
                    empanelContractorList.add(c);
                }
                System.out.println("The Empanel Contractor List size are: " + empanelContractorList.size());
                tender.setEmpanelContractorList(empanelContractorList);
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
                //Fetch the contractor Class name by contractor Class Id.
                contractorClass = (ContractorClass) this.contractorClassDAOImpl.fetchData(Integer.parseInt(tender.getContractorClass()));
                System.out.println("The Contractor Class is: " + contractorClass.getContractorClass_Name());
                tender.setContractorClassName(contractorClass.getContractorClass_Name());
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

            if (!tender.getTenderSelectedDivision().equalsIgnoreCase("0") || !tender.getTenderSelectedSubDivision().equalsIgnoreCase("0")) {
                String division = null;
                String subDivision = null;
                division = divisionDAO.divisionName(Integer.parseInt(tender.getTenderSelectedDivision()));
                tender.setTenderSelectedDivision(division);
                subDivision = subDivisionDAO.subDivisionName(Integer.parseInt(tender.getTenderSelectedSubDivision()));
                tender.setTenderSelectedSubDivision(subDivision);
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

            System.out.println("The Tender Status is : " + tender.getTenderStatus());

            //This model having the data realated to Tender Details
            model.addAttribute("tender", tender);

            //Fetch the Data For the Tender Documents by tender Id.
            tenderDocuments = documentDao.fetchTenderDocumentByTenderId(tender.getTender_Id());
            System.out.println("The Tender Document are: " + tenderDocuments.size());
            if (!tenderDocuments.isEmpty()) {
                model.addAttribute("tenderDocument", tenderDocuments);
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
                        org.springframework.beans.BeanUtils.copyProperties(amendedDocuments, td);
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
                model.addAttribute("tenderKeyDateses", tenderKeyDateses);
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
            System.out.println("The Envelope A officers are: " + submittedEnvelopeA.getEnvelopeAOfficers());
            //Fetch the list of officer for Envelope A
            if (submittedEnvelopeA != null) {
                List<String> result2 = Arrays.asList(submittedEnvelopeA.getEnvelopeAOfficers().trim().split(","));
                if (!result2.isEmpty()) {
                    result2.stream().forEach((officerA) -> {
                        System.out.println("The Envelope A Officer are: " + officerA);
                        DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerA));
                        departmentUsersA.add(departmentUser);
                    });
                    model.addAttribute("departmentUserEnvelopeA", departmentUsersA);
                    model.addAttribute("submittedEnvelopeA", submittedEnvelopeA);
                }
            }

            if (tender.getEnvelopeType().equalsIgnoreCase("3")) {
                //Fetch the Envlope B Details
                submittedEnvelopeB = envelopeBDaoImpl.read(tender.getTender_Id());
                System.out.println("The Envelope B Details: " + submittedEnvelopeB);
                System.out.println("The Envelope B officers are: " + submittedEnvelopeB.getEnvelopeBOfficers());
                //Fetch the list of officer for Envelope B
                if (submittedEnvelopeB != null) {
                    List<String> result2 = Arrays.asList(submittedEnvelopeB.getEnvelopeBOfficers().trim().split(","));
                    if (!result2.isEmpty()) {
                        result2.stream().forEach((officerB) -> {
                            System.out.println("The Envelope B Officer are: " + officerB);
                            DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerB));
                            departmentUsersB.add(departmentUser);
                        });
                        model.addAttribute("departmentUserEnvelopeB", departmentUsersB);
                        model.addAttribute("submittedEnvelopeB", submittedEnvelopeB);
                    }
                }
            }

            if (tender.getEnvelopeType().equalsIgnoreCase("4")) {
                //Fetch the Envlope B Details For QCBS
                submittedQCBS = this.submittedQCBS.read(tender.getTender_Id());
                System.out.println("The QCBS officer are: " + submittedQCBS.getQCBSOfficers());
                if (submittedQCBS != null) {
                    List<String> result2 = Arrays.asList(submittedQCBS.getQCBSOfficers().split(","));
                    if (!result2.isEmpty()) {
                        result2.stream().forEach((officerB) -> {
                            System.out.println("The Envelope B QCBS Officer are: " + officerB);
                            DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerB));
                            departmentUsersB.add(departmentUser);
                        });
                        model.addAttribute("departmentUserEnvelopeB", departmentUsersB);
                        model.addAttribute("submittedEnvelopeB", submittedQCBS);
                    }
                }
            }

            submittedEnvelopeC = envelopeCDaoImpl.read(tender.getTender_Id());
            if (submittedEnvelopeC != null) {
                System.out.println("The Submitted Officer are: " + submittedEnvelopeC.getEnvelopeCOfficers());
                List<String> result = Arrays.asList(submittedEnvelopeC.getEnvelopeCOfficers().trim().split(","));
                result.forEach((officerC) -> {
                    System.out.println("The Officer are: " + officerC);
                    DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerC));
                    departmentUsersC.add(departmentUser);

                });
                model.addAttribute("departmentUserEnvelopeC", departmentUsersC);
                model.addAttribute("submittedEnvelopeC", submittedEnvelopeC);
            }

            //Fetch the approval authority selected in tender
            if (tender.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {

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
                model.addAttribute("approvalAuthority", approvalOfficerList);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Contractor/viewTenderAllDetailPage";
    }

     @RequestMapping("viewLiveTenderDetails")
    public String viewTenderAllDetailsForLiveTender(@RequestParam("tender_Id") String tender_Id, @ModelAttribute Tender tender, TenderKeyDates tenderKeyDates, Model model, HttpSession session) {
        System.out.println("/:::::::::::::::::::::::::::::::Showing the created tender details:::::::::::::::::::::::/");
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
        //ModelAndView modelAndView = new ModelAndView();
       // int contloginid = 0;
        try {
         //   contloginid = (int) session.getAttribute("contRegId");
            System.out.println("The Tender Id is: " + tender.getTender_Id());
            System.out.println("The Tender Id Request Param is: " + tender_Id);

            //Fetch the tender detail by tender Id.
            tender1 = tenderDaoImpl.read(tender.getTender_Id());

            System.out.println("The Tender Source is: " + tender1);
            System.out.println("Fetching the details from Tender");
            //Copy the object into another object
            org.springframework.beans.BeanUtils.copyProperties(tender1, tender);
            System.out.println("The Tender Target is: " + tender.getTenderStatus());

            if (tender.getTenderStatus().equalsIgnoreCase("Amended")) {
                System.out.println("Fetching the details from TenderAmendment");
                tenderAmendment = tenderAmendmentDaoImpl.readAll(Integer.parseInt(tender_Id));
                //Copy the object into another object
                tenderAmendment.forEach((amendment) -> {
                    org.springframework.beans.BeanUtils.copyProperties(amendment, tender);
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

            if (tender.getSelectiveTender().equalsIgnoreCase("3") || tender.getSelectiveTender().equalsIgnoreCase("4")) {
                System.out.println("The Empanel Contractor are: " + tender.getEmpanelContrators());
                //List<Contractor> contractors = new ArrayList<>();
                String contractor[] = tender.getEmpanelContrators().split(",");
                for (String cont : contractor) {
                    Contractor c = new Contractor();
                    c = (Contractor) contractorDaoImpl.fetchData(Integer.parseInt(cont));
                    System.out.println("The Contractor Details is: " + c);
                    empanelContractorList.add(c);
                }
                System.out.println("The Empanel Contractor List size are: " + empanelContractorList.size());
                tender.setEmpanelContractorList(empanelContractorList);
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
                //Fetch the contractor Class name by contractor Class Id.
                contractorClass = (ContractorClass) this.contractorClassDAOImpl.fetchData(Integer.parseInt(tender.getContractorClass()));
                System.out.println("The Contractor Class is: " + contractorClass.getContractorClass_Name());
                tender.setContractorClassName(contractorClass.getContractorClass_Name());
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

            if (!tender.getTenderSelectedDivision().equalsIgnoreCase("0") || !tender.getTenderSelectedSubDivision().equalsIgnoreCase("0")) {
                String division = null;
                String subDivision = null;
                division = divisionDAO.divisionName(Integer.parseInt(tender.getTenderSelectedDivision()));
                tender.setTenderSelectedDivision(division);
                subDivision = subDivisionDAO.subDivisionName(Integer.parseInt(tender.getTenderSelectedSubDivision()));
                tender.setTenderSelectedSubDivision(subDivision);
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

            System.out.println("The Tender Status is : " + tender.getTenderStatus());

            //This model having the data realated to Tender Details
            model.addAttribute("tender", tender);

            //Fetch the Data For the Tender Documents by tender Id.
            tenderDocuments = documentDao.fetchTenderDocumentByTenderId(tender.getTender_Id());
            System.out.println("The Tender Document are: " + tenderDocuments.size());
            if (!tenderDocuments.isEmpty()) {
                model.addAttribute("tenderDocument", tenderDocuments);
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
                        org.springframework.beans.BeanUtils.copyProperties(amendedDocuments, td);
                        tenderDocuments.add(td);
                    }
                    if (tenderDocuments.isEmpty()) {
                        model.addAttribute("tenderDocument", tenderDocuments);
                    }
                }

            }

            //Fetch Tender Key Dates By tender Id.
            tenderKeyDateses = tenderKeyDatesDao.readAllKeyDates(tender.getTender_Id());
            System.out.println("The Tender Key Dates are:" + tenderKeyDateses.size());
            if (!tenderKeyDateses.isEmpty()) {
                model.addAttribute("tenderKeyDateses", tenderKeyDateses);
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
            System.out.println("The Envelope A officers are: " + submittedEnvelopeA.getEnvelopeAOfficers());
            //Fetch the list of officer for Envelope A
            if (submittedEnvelopeA != null) {
                List<String> result2 = Arrays.asList(submittedEnvelopeA.getEnvelopeAOfficers().trim().split(","));
                if (!result2.isEmpty()) {
                    result2.stream().forEach((officerA) -> {
                        System.out.println("The Envelope A Officer are: " + officerA);
                        DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerA));
                        departmentUsersA.add(departmentUser);
                    });
                    model.addAttribute("departmentUserEnvelopeA", departmentUsersA);
                    model.addAttribute("submittedEnvelopeA", submittedEnvelopeA);
                }
            }

            if (tender.getEnvelopeType().equalsIgnoreCase("3")) {
                //Fetch the Envlope B Details
                submittedEnvelopeB = envelopeBDaoImpl.read(tender.getTender_Id());
                System.out.println("The Envelope B Details: " + submittedEnvelopeB);
                System.out.println("The Envelope B officers are: " + submittedEnvelopeB.getEnvelopeBOfficers());
                //Fetch the list of officer for Envelope B
                if (submittedEnvelopeB != null) {
                    List<String> result2 = Arrays.asList(submittedEnvelopeB.getEnvelopeBOfficers().trim().split(","));
                    if (!result2.isEmpty()) {
                        result2.stream().forEach((officerB) -> {
                            System.out.println("The Envelope B Officer are: " + officerB);
                            DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerB));
                            departmentUsersB.add(departmentUser);
                        });
                        model.addAttribute("departmentUserEnvelopeB", departmentUsersB);
                        model.addAttribute("submittedEnvelopeB", submittedEnvelopeB);
                    }
                }
            }

            if (tender.getEnvelopeType().equalsIgnoreCase("4")) {
                //Fetch the Envlope B Details For QCBS
                submittedQCBS = this.submittedQCBS.read(tender.getTender_Id());
                System.out.println("The QCBS officer are: " + submittedQCBS.getQCBSOfficers());
                if (submittedQCBS != null) {
                    List<String> result2 = Arrays.asList(submittedQCBS.getQCBSOfficers().split(","));
                    if (!result2.isEmpty()) {
                        result2.stream().forEach((officerB) -> {
                            System.out.println("The Envelope B QCBS Officer are: " + officerB);
                            DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerB));
                            departmentUsersB.add(departmentUser);
                        });
                        model.addAttribute("departmentUserEnvelopeB", departmentUsersB);
                        model.addAttribute("submittedEnvelopeB", submittedQCBS);
                    }
                }
            }

            submittedEnvelopeC = envelopeCDaoImpl.read(tender.getTender_Id());
            if (submittedEnvelopeC != null) {
                System.out.println("The Submitted Officer are: " + submittedEnvelopeC.getEnvelopeCOfficers());
                List<String> result = Arrays.asList(submittedEnvelopeC.getEnvelopeCOfficers().trim().split(","));
                result.forEach((officerC) -> {
                    System.out.println("The Officer are: " + officerC);
                    DepartmentUser departmentUser = (DepartmentUser) departmentUserDao.fetchData(Integer.parseInt(officerC));
                    departmentUsersC.add(departmentUser);

                });
                model.addAttribute("departmentUserEnvelopeC", departmentUsersC);
                model.addAttribute("submittedEnvelopeC", submittedEnvelopeC);
            }

            //Fetch the approval authority selected in tender
            if (tender.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {

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
                model.addAttribute("approvalAuthority", approvalOfficerList);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Contractor/ViewLiveTenderDetails";
    }

}
