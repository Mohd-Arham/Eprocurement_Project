/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.AddToCartDaoImpl;
import com.eproc.daoImpl.AuctionDaoImpl;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.PaymentDAOImpl;
import com.eproc.daoImpl.TenderDaoImpl;
import com.eproc.domain.AddToCart;
import com.eproc.domain.Auction;
import com.eproc.domain.AuctionKeyDates;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.PurchaseDetails;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderKeyDates;
import com.eproc.util.EmailService;
import com.google.gson.Gson;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Naina Jain
 */
@Controller
public class PaymentController {

    @Autowired
    TenderDaoImpl tenderDaoImpl;

    @Autowired
    AuctionDaoImpl auctionDaoImpl;

    @Autowired
    AddToCartDaoImpl addToCartDaoImpl;

    @Autowired
    ContractorDaoImpl contractorDaoImpl;

    @Autowired
    ContractorDetailsdaoImpl contractorDetailsdaoImpl;

    @Autowired
    PaymentDAOImpl paymentDAOImpl;

    @Autowired
    EmailService emailService;

    @RequestMapping("/proceedtopayment")
    public String proceedtopayment(Model m, HttpSession session, Tender tn, Auction an) throws Exception {
        m.addAttribute("Contractordetails", new ContractorDetails());
        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        Tender tenderObj = new Tender();
        Auction auctionObj = new Auction();
        String tnstartDate = "";
        String tnendDate = "";
        String anstartDate = "";
        String anendDate = "";
        try {

            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);

            int contloginid = (int) session.getAttribute("contRegId");

            List<AddToCart> tenderauctionIdListvalue = addToCartDaoImpl.fetchAll();
            for (AddToCart tenderauctionIdListData : tenderauctionIdListvalue) {

                int tender_Id = tenderauctionIdListData.getTender_Id();
                System.out.println("@@@~~~ tender_Id into proceedtopayment ~~~@@@  " + tender_Id);

                int auctionId = tenderauctionIdListData.getAuctionId();
                System.out.println("@@@~~~ auctionId into proceedtopayment ~~~@@@  " + auctionId);

                if (tender_Id != 0) {
                    TenderKeyDates tenderKeyDateses = tenderDaoImpl.readKeyDate(tender_Id);
                    if (tenderKeyDateses != null) {
                        tenderObj = tenderDaoImpl.read(tender_Id);

                        tn.setTenderKeyDates(tenderKeyDateses);
                        tnstartDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[0];
                        Date startDate = new Date(tnstartDate);
                        tnendDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[1];
                        Date endDate = new Date(tnendDate);
                        if (startDate.getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endDate.getTime() && endDate.getTime() > startDate.getTime()) {
                            PurchaseDetails purchaseDetails = paymentDAOImpl.fetchPurchaseDetailsWithContId(tender_Id, auctionId, contloginid);
                            System.out.println("@@~~PurchaseDetails tender~~@@  " + purchaseDetails);
                            if (purchaseDetails == null) {
                                purchaseDetails = new PurchaseDetails();
                                purchaseDetails.setAuctionId(0);
                                purchaseDetails.setTender_Id(tender_Id);
                                purchaseDetails.setContractorId(contloginid);
                                purchaseDetails.setTransaction_Id("TXNID" + orderId);
                                purchaseDetails.setBankStatus("unsuccess");
                                Date date = new Date();
                                purchaseDetails.setPurchaseDate(sdf.format(date));
                                purchaseDetails.setTenderFeeInFig(tenderObj.getTenderFeeInFig());
                                purchaseDetails.setDeptId(tenderObj.getDeptId());
                                paymentDAOImpl.insertData(purchaseDetails);
//      addToCartDaoImpl.deleteTenderFromCart(tender_Id, contloginid);
                                m.addAttribute("msg", "Transaction Done Successfully");
                            }
                        }
                    }
                } else {
                    AuctionKeyDates auctionKeyDates = auctionDaoImpl.readAuctionKeyDate(auctionId);
                    System.out.println("@@@~~~auctionKeyDates auc_id purchase detail ~~~@@@  " + auctionKeyDates);
                    if (auctionKeyDates != null) {
                        auctionObj = auctionDaoImpl.editAuctionData(auctionId);
                        an.setAuctionKeyDates(auctionKeyDates);
                        anstartDate = auctionKeyDates.getAuctionPurchaseDateTime().split("/")[0];
                        anendDate = auctionKeyDates.getAuctionPurchaseDateTime().split("/")[1];
                        if (sdf.parse(anstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(anendDate).getTime() && sdf.parse(anendDate).getTime() > sdf.parse(anstartDate).getTime()) {
                            PurchaseDetails purchaseDetails = paymentDAOImpl.fetchPurchaseDetailsWithContId(tender_Id, auctionId, contloginid);
                            System.out.println("@@~~PurchaseDetails auction~~@@  " + purchaseDetails);
                            if (purchaseDetails == null) {
                                purchaseDetails = new PurchaseDetails();
                                purchaseDetails.setAuctionId(auctionId);
                                purchaseDetails.setTender_Id(0);
                                purchaseDetails.setContractorId(contloginid);
                                purchaseDetails.setTransaction_Id("TXNID" + orderId);
                                purchaseDetails.setBankStatus("unsuccess");
                                Date date = new Date();
                                purchaseDetails.setPurchaseDate(sdf.format(date));
                                purchaseDetails.setAuctionFees(auctionObj.getAuctionFees());
                                purchaseDetails.setDeptId(tenderObj.getDeptId());
                                paymentDAOImpl.insertData(purchaseDetails);
//      addToCartDaoImpl.deleteAuctionFromCart(auctionId, contloginid);
                                m.addAttribute("msg", "Transaction Done Successfully");
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("method:proceedtopayment  - class:PaymentController");
            System.out.println("Exception in proceedtopayment PaymentController " + ex.getMessage());
        }
//        return "redirect:/paymentRequest";
        return "Contractor/eReciept";
    }

    @RequestMapping("/proceedDone")
    @ResponseBody
    public String proceedDone(Model m, HttpSession session, Tender tn, Auction an) throws Exception {
        System.out.println("The Process Done Button");
        m.addAttribute("Contractordetails", new ContractorDetails());
        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        Tender tenderObj = new Tender();
        Auction auctionObj = new Auction();
        String tnstartDate = "";
        String tnendDate = "";
        String anstartDate = "";
        String anendDate = "";
        try {

            char[] otp = emailService.OTP(4);
            String orderId = new String(otp);

            int contloginid = (int) session.getAttribute("contRegId");

            List<AddToCart> tenderauctionIdListvalue = addToCartDaoImpl.fetchAnDataWithContId(contloginid);
           System.out.println("Cart size is "+tenderauctionIdListvalue.size());
            for (AddToCart tenderauctionIdListData : tenderauctionIdListvalue) {

                int tender_Id = tenderauctionIdListData.getTender_Id();
                System.out.println("@@@~~~ tender_Id into proceedtopayment ~~~@@@  " + tender_Id);

                int auctionId = tenderauctionIdListData.getAuctionId();
                System.out.println("@@@~~~ auctionId into proceedtopayment ~~~@@@  " + auctionId);

                if (tender_Id != 0) {
                    TenderKeyDates tenderKeyDateses = tenderDaoImpl.readKeyDate(tender_Id);
                    if (tenderKeyDateses != null) {
                        tenderObj = tenderDaoImpl.read(tender_Id);

                        tn.setTenderKeyDates(tenderKeyDateses);
                        tnstartDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[0];
                        Date startDate = new Date(tnstartDate);
                        tnendDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[1];
                        Date endDate = new Date(tnendDate);
//                        if (startDate.getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endDate.getTime() && endDate.getTime() > startDate.getTime()) {
                            //PurchaseDetails purchaseDetails = paymentDAOImpl.fetchPurchaseDetailsWithContId(tender_Id, auctionId, contloginid);
                            
                             PurchaseDetails purchaseDetails = new PurchaseDetails();
                             System.out.println("@@~~PurchaseDetails tender~~@@  " + purchaseDetails);
                                purchaseDetails.setAuctionId(0);
                                purchaseDetails.setTender_Id(tender_Id);
                                purchaseDetails.setContractorId(contloginid);
                                purchaseDetails.setTransaction_Id("TXNID" + orderId);
                                purchaseDetails.setBankStatus("Success");
                                purchaseDetails.setBank_description("3a04d1f957c9acd59fc92d5d14db4a79330cc968cbf85981982bcdbbdcf9d00c0ba8e79fc8f34334cef88591f488574c720d248b93289a85adf3cf662a86b82a4ff01552128bac2e466987bd2b013ebaae65d06f4f550b770d8e870bd37b6214d72a546d93ad23d3ee26f7e99fcee3b7bf58eeddeef38737cc71b30888a7769becdcf71e5822a16db376358627ec26c37925d7f5d3c613c55f77bee232d848c448eeb685140c8c89c420161b67a982d8422c3b2283b22421196dba1e8a58f242684fccc37d27c11099af79bc67092d712b4f35580c0fd8897d2e7961ec519fd4347bfab172a14b445e0ad7d833e5b70a8ee98823c27bed9d4846d643ca8485512069a79d79a67ebf97f37e8a5cfe89931e65fee1d26a8c15f6f6ee770c8b3eb40f5d8b08ec00e1c29ace6baa3a9132c6cd53490c8f3c57649d834e171d7a3940296c5f783d8a217e0c283a410913100b38f3842f5fb2d00aa1d48d11fafbd82b5cb86a18bad62bc6b99c8010f6473e6e87f261612636fd3495086d97fa3cfe20eb7bfd377710960cfb126e2620229f58e4c494a5f20f254e7a88e609668bae05282abaef721de3e32064cdc19a960d4b350fcba3c02a43fd941803943e403ff6514e710ca946f0c7065dc0475b5f5fc43553032bf55c06ca7fbeaa6a27c2a12e9e5c4fd5f19e40b89fc0c4cbe39dd2fdf7ce7ea06b84bc18bfee109dad7a7f1ed3246fb375413042f46de872e3ffbb6e5d11b44e895b6a8d7870044e70659be306be9050bb459741290781d5e06b262fd762eb901e9c4ffe805a75834bc404a01bb7ef4dbe31e612466a3d3275f73f5b0506a49af8e479c569fa1678c917854c6475dea6e1ce6a345bd2aae4963e6c72bff49c758964d4f3bbc73e632902a2bc8fbb9d7c79cfb77ce7c694b3aec658fb37efaa4a51ed851c1bfd940bc2b2c91cdd59079f6d110c54cd28d92e2a9f7cfbd6c1a06b03e99de38da1038023632065df67e93a13e582080e201467e4a9b7720c2a6157d61c96e726ba701d84aef4d0ca1f451c928235f4627ef2e879e907c68a381556434101b3ab1e7b8112149700890ca9cf3f09d3e75c8a176ad45223688c31993481fb0a79420c6d461756d70a3aa80bd656b56a19550788b494ee755f87b168d50d47829dca8a11f3751c65c9c3cc565f396c94692644e74fde96f8ac89d02844541b8dec91f3d234193ace33");                                Date date = new Date();
                                purchaseDetails.setPurchaseDate(sdf.format(date));
                                purchaseDetails.setTenderFeeInFig(tenderObj.getTenderFeeInFig());
                                purchaseDetails.setDeptId(tenderObj.getDeptId());
                                purchaseDetails.setBank_transaction_Id("308004633746");
                                //purchaseDetails.setBank_description(orderId);
                              PurchaseDetails oldData= paymentDAOImpl.fetchAllBidderByTenderIdContId(purchaseDetails.getTender_Id(),purchaseDetails.getContractorId());
                             if(oldData==null)
                             {
                              paymentDAOImpl.insertData(purchaseDetails);
                             }
//      addToCartDaoImpl.deleteTenderFromCart(tender_Id, contloginid);
                                m.addAttribute("msg", "Transaction Done Successfully");
                                System.out.println("Transaction Done manuale:"+purchaseDetails.getBankStatus());
                         //   }
                    }
                } else {
                    AuctionKeyDates auctionKeyDates = auctionDaoImpl.readAuctionKeyDate(auctionId);
                    System.out.println("@@@~~~auctionKeyDates auc_id purchase detail ~~~@@@  " + auctionKeyDates);
                    if (auctionKeyDates != null) {
                        auctionObj = auctionDaoImpl.editAuctionData(auctionId);
                        an.setAuctionKeyDates(auctionKeyDates);
                        anstartDate = auctionKeyDates.getAuctionPurchaseDateTime().split("/")[0];
                        anendDate = auctionKeyDates.getAuctionPurchaseDateTime().split("/")[1];
                        if (sdf.parse(anstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(anendDate).getTime() && sdf.parse(anendDate).getTime() > sdf.parse(anstartDate).getTime()) {
                            PurchaseDetails purchaseDetails = paymentDAOImpl.fetchPurchaseDetailsWithContId(tender_Id, auctionId, contloginid);
                            System.out.println("@@~~PurchaseDetails auction~~@@  " + purchaseDetails);
                            if (purchaseDetails == null) {
                                purchaseDetails = new PurchaseDetails();
                                purchaseDetails.setAuctionId(auctionId);
                                purchaseDetails.setTender_Id(0);
                                purchaseDetails.setContractorId(contloginid);
                                purchaseDetails.setTransaction_Id("TXNID" + orderId);
                                purchaseDetails.setBankStatus("Success");
                                Date date = new Date();
                                purchaseDetails.setPurchaseDate(sdf.format(date));
                                purchaseDetails.setAuctionFees(auctionObj.getAuctionFees());
                                purchaseDetails.setDeptId(tenderObj.getDeptId());
                                paymentDAOImpl.insertData(purchaseDetails);
//      addToCartDaoImpl.deleteAuctionFromCart(auctionId, contloginid);
                                m.addAttribute("msg", "Transaction Done Successfully");
                            }
                        }
                    }
                }
            }
            Gson gson = new Gson();
          String json=  gson.toJson("Payment Done Successfully");
            return json;
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("method:proceedtopayment  - class:PaymentController");
            System.out.println("Exception in proceedtopayment PaymentController " + ex.getMessage());
        }
//        return "redirect:/paymentRequest";
        return null;
    }
    
    @RequestMapping("/paymentResponse")
    public String paymentResponse(Model m, HttpServletRequest request) {
        List<Tender> tenderList2 = new ArrayList();
        List tntotaldocfeewithtaxList = new ArrayList();
        Tender tenderObj = new Tender();
        long grandtotaldocfeewithtax = 0;

        try {
            String encResp = request.getParameter("encResp");
            System.out.println("@@~~~encResp Parameter Recieved:: " + encResp);
            m.addAttribute("encResp", encResp);

            List<AddToCart> tenderauctionIdListvalue = addToCartDaoImpl.fetchAll();
            for (AddToCart tenderauctionIdListData : tenderauctionIdListvalue) {

                int tender_Id = tenderauctionIdListData.getTender_Id();
                System.out.println("@@@~~~ tender_Id into paymentResponse() ~~~@@@  " + tender_Id);
                tenderObj = tenderDaoImpl.read(tender_Id);
                long tnportalCharge = Long.parseLong(tenderObj.getPortalCharge());
                long tnportalchargewithtax = ((tnportalCharge * 18) / 100);
                long tenderDocumentFees = Long.parseLong(tenderObj.getTenderDocumentFees());
                long tntotaldocfeewithtax = tenderDocumentFees + tnportalchargewithtax + tnportalCharge;
                grandtotaldocfeewithtax = tntotaldocfeewithtax + grandtotaldocfeewithtax;
                tntotaldocfeewithtaxList.add(tntotaldocfeewithtax);
                tenderList2.add(tenderObj);
            }
            m.addAttribute("tenderList", tenderList2);
            m.addAttribute("tntotaldocfeewithtaxList", tntotaldocfeewithtaxList);
            m.addAttribute("grandtotaldocfeewithtax", grandtotaldocfeewithtax);
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("method:paymentResponse  - class:PaymentController");
            System.out.println("Exception in paymentResponse PaymentController " + ex.getMessage());
        }
        return "Contractor/eReciept";
    }

    @ResponseBody
    @RequestMapping("/bankResponse")
    public String bankResponse(Model m, HttpSession session, @RequestParam Map<String, String> resData, HttpServletRequest request, @RequestParam String encryptStr) {
        System.out.println("encryptStr bankResponse() " + encryptStr);
        System.out.println(resData.size() + " : data bankResponse() : " + resData);
        ContractorDetails contractorDetails = new ContractorDetails();
        Contractor contractor = new Contractor();
        List contData = new ArrayList();
        Gson gson = new Gson();
        boolean flag = false;
        String contOrgName = "";
        String contType = "";
        String contName = "";
        try {
            int contractorId = (int) session.getAttribute("contRegId");
            contractor = contractorDaoImpl.fetchData(contractorId);
            contType = contractor.getContractorType();
            contName = contractor.getFullname();
            contData.add(contName);
            contractorDetails = contractorDetailsdaoImpl.fetchDatabyRegID(contractorId);
            if ("indian".equalsIgnoreCase(contType)) {
                contOrgName = contractorDetails.getIndianOrgName();
                contData.add(contOrgName);
            } else if ("foreign".equalsIgnoreCase(contType)) {
                contOrgName = contractorDetails.getForeignOrgName();
                contData.add(contOrgName);
            }
            String bank_description = encryptStr;
            String bank_transaction_Id = resData.get("resData[tracking_id]");
            String bankStatus = resData.get("resData[order_status]");
            String responseDateTime = resData.get("resData[trans_date]");

            List<AddToCart> tenderauctionIdListvalue = addToCartDaoImpl.fetchAll();
            for (AddToCart tenderauctionIdListData : tenderauctionIdListvalue) {
                int tender_Id = tenderauctionIdListData.getTender_Id();
                flag = paymentDAOImpl.updatePurchaseDetailStatus(tender_Id, contractorId, bankStatus, bank_description, resData.toString(), bank_transaction_Id, responseDateTime);
                if (flag) {
                    addToCartDaoImpl.deleteTenderFromCart(tender_Id, contractorId);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("method:bankResponse  - class:PaymentController");
            System.out.println("Exception in bankResponse PaymentController " + ex.getMessage());
        }
        return gson.toJson(contData);
//        return "Contractor/eReciept";
    }

}
