/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;


import com.eproc.dao.QCBSTemplateDao;
import com.eproc.dao.QcbsDataDao;
import com.eproc.daoImpl.ContractorDaoImpl;
import com.eproc.daoImpl.ContractorDetailsdaoImpl;
import com.eproc.daoImpl.Decrypt_envelopQCBSDaoImpl;
import com.eproc.daoImpl.Decrypt_envelopeADaoImpl;
import com.eproc.daoImpl.Decrypt_envelopeBDaoImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.EnvelopeADataDaoImpl;
import com.eproc.daoImpl.EnvelopeBDataDaoImpl;
import com.eproc.daoImpl.EnvelopeCDataDaoImpl;
import com.eproc.daoImpl.PaymentDAOImpl;
import com.eproc.daoImpl.QcbsDataDaoImpl;
import com.eproc.daoImpl.TenderDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeBDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeCDaoImpl;
import com.eproc.daoImpl.TenderSubmittedQCBSDaoImpl;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.Decrypt_envelopQCBS;
import com.eproc.domain.Decrypt_envelopeA;
import com.eproc.domain.Decrypt_envelopeB;
import com.eproc.domain.Decrypt_envelopeC;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.EnvelopeAData;
import com.eproc.domain.EnvelopeBData;
import com.eproc.domain.EnvelopeCData;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.eproc.domain.Logs;
import com.eproc.domain.PurchaseDetails;
import com.eproc.domain.QCBSTemplate;
import com.eproc.domain.QcbsData;
import com.eproc.domain.TenderSubmittedEnvelopeB;
import com.eproc.domain.TenderSubmittedEnvelopeC;
import com.eproc.domain.TenderSubmittedQCBS;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import java.text.ParseException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtils;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 *
 * @author Vaishali Gupta
 */
@Controller
public class TenderOpeningController {
    
     @Transient
     private List<Map<String, String>> template;

    public List<Map<String, String>> getTemplate() {
        return template;
    }

    public void setTemplate(List<Map<String, String>> template) {
        this.template = template;
    }

    @Override
    public String toString() {
        return "TenderOpeningController{" + "template=" + template + '}';
    }
     
    
     


    private long timer;
    @Autowired
    TenderSubmittedEnvelopeADaoImpl tenderSubmittedEnvelopeADao;

    @Autowired
    TenderSubmittedEnvelopeBDaoImpl tenderSubmittedEnvelopeBDao;
    
    @Autowired
    QCBSTemplateDao qcbsTemplateDao;

    @Autowired
    TenderSubmittedEnvelopeCDaoImpl tenderSubmittedEnvelopeCDao;
    @Autowired
    Decrypt_envelopeADaoImpl decrypt_envelopeADaoImpl;
    @Autowired
    Decrypt_envelopeBDaoImpl decrypt_envelopeBDaoImpl;
    
    @Autowired
    Decrypt_envelopQCBSDaoImpl decrypt_envelopeQCBSDaoImpl;

    @Autowired
    ContractorDaoImpl contractorDaoImpl;
    @Autowired
    ContractorDetailsdaoImpl contractorDetailsdaoImpl;
    @Autowired
    EnvelopeADataDaoImpl envelopeADataDaoImpl;
    @Autowired
    EnvelopeBDataDaoImpl envelopeBDataDaoImpl;
    @Autowired
    EnvelopeCDataDaoImpl envelopeCDataDaoImpl;
    @Autowired
    TenderDaoImpl tenderDao;
    
    @Autowired
    QcbsDataDaoImpl qcbsDataDaoImpl;
    
    @Autowired
    TenderSubmittedEnvelopeADaoImpl tenderSubmittedEnvelopeADaoImpl;
    @Autowired
    TenderSubmittedEnvelopeBDaoImpl tenderSubmittedEnvelopeBDaoImpl;

    @Autowired
    TenderSubmittedEnvelopeCDaoImpl tenderSubmittedEnvelopeCDaoImpl;
    
    @Autowired
    TenderSubmittedQCBSDaoImpl tenderSubmittedQCBSDaoImpl;
    @Autowired
    GsonUtility gsonUtility;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    LogsAction logsAction;
    @Autowired
    PaymentDAOImpl paymentDAOImpl;
    
    
    
    @Autowired
    LogsActionDao logsActionDao;
    Logs logs = new Logs();

    @RequestMapping("/tenderOpening")
    public String tenderOpening(Model m, HttpSession session) {
        System.out.println("tenderOpening ");
        List<Tender> tenderList = new ArrayList<>();
        try {
            Integer deptId = (int) session.getAttribute("deptId");
            Integer deptUserId = (int) session.getAttribute("deptUserId");

            System.out.println("//The DeptId:// " + deptId + "//Dept User Id: //" + deptUserId);
            if (deptId != null || deptUserId != null) {
                tenderList = tenderDao.fetchTenderByDeptUser(deptUserId, deptId);
            }

            System.out.println("tender size is : " + tenderList.size());

        } catch (Exception e) {
            e.printStackTrace();
        }
        m.addAttribute("tenderList", tenderList);
        return "DepartmentUser/TenderOpening";
    }

    @RequestMapping("/openTender")
    @ResponseBody
    public String openTender(@RequestParam int tenderId, HttpSession session) {

        System.out.println("tenderId " + tenderId + " deptId " + session.getAttribute("deptId"));
        Tender tender = null;
        String response = "";
        int deptId = 0;
        List<DepartmentUser> EAOfficersDetails = new ArrayList<>();
        try {
            session.setAttribute("tenderId", tenderId);
            if (session.getAttribute("deptId") != "" || session.getAttribute("deptId") != null) {
                deptId = (int) session.getAttribute("deptId");

            }

            tender = tenderDao.read(tenderId);
       
            if (tender != null) {

                tender.setTenderSubmittedEnvelopeA(tenderSubmittedEnvelopeADao.read(tenderId));
                String officerA = tender.getTenderSubmittedEnvelopeA().getEnvelopeAOfficers();
                System.out.println("FFFFFFFF"+officerA);
                tender.getTenderSubmittedEnvelopeA().setEAOfficersDetails(envelopeOfficersDetails(officerA, deptId));
                String s=tender.getEnvelopeType();
                System.out.println("Tttttttttttttt"+s);
                if("4".equals(tender.getEnvelopeType())){
                    tender.setTenderSubmittedEnvelopeQCBS(tenderSubmittedQCBSDaoImpl.read(tenderId));
                    TenderSubmittedQCBS tenderSubmittedQCBS=tenderSubmittedQCBSDaoImpl.read(tenderId);
                 String officerQCBS=tender.getTenderSubmittedEnvelopeQCBS().getQCBSOfficers();
                    System.out.println("EEEEEEEEEEE"+officerQCBS);
                if (tenderSubmittedQCBS != null) {
                     
tender.setTenderSubmittedEnvelopeQCBS(tenderSubmittedQCBS);
                    
                
                    if (tender.getTenderSubmittedEnvelopeQCBS() != null) {
                        String officerQCB = tender.getTenderSubmittedEnvelopeQCBS().getQCBSOfficers();
                        System.out.println("OFFICER CCCC"+officerQCB);
                        tender.getTenderSubmittedEnvelopeQCBS().setQCBSOfficersDetails(envelopeOfficersDetails(officerQCB, deptId));
                       
                    }
                } 
                }
             
                TenderSubmittedEnvelopeB tenderSubmittedEnvelopeB = tenderSubmittedEnvelopeBDao.read(tenderId);
                if (tenderSubmittedEnvelopeB != null) {
                    tender.setTenderSubmittedEnvelopeB(tenderSubmittedEnvelopeB);
                    if (tender.getTenderSubmittedEnvelopeB() != null) {
                        String officerB = tender.getTenderSubmittedEnvelopeB().getEnvelopeBOfficers();

                        tender.getTenderSubmittedEnvelopeB().setEBOfficersDetails(envelopeOfficersDetails(officerB, deptId));
                    }
                }
                
                tender.setTenderSubmittedEnvelopeC(tenderSubmittedEnvelopeCDao.read(tenderId));
                String officerC = tender.getTenderSubmittedEnvelopeC().getEnvelopeCOfficers();
                tender.getTenderSubmittedEnvelopeC().setECOfficersDetails(envelopeOfficersDetails(officerC, deptId));

                tender.setTenderKeyDates(tenderDao.readKeyDate(tenderId));
                Gson gson = new Gson();
                response = gson.toJson(tender);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("responsesss " + response);
        return response;
    }

    public List envelopeOfficersDetails(String envelopeOfficers, int deptId) {
        List<DepartmentUser> envelopeOfficersDetails = new ArrayList<>();
        try {

            String offices[] = envelopeOfficers.split(",");
            for (String office : offices) {

                int deptUserId = Integer.parseInt(office);
                if (deptUserId != 0 && deptId != 0) {
                    System.out.println("office " + deptUserId + " and deptID " + deptId);
                    envelopeOfficersDetails.add(departmentUserDaoImpl.fetchData(deptId, deptUserId));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return envelopeOfficersDetails;
    }

    //timer clock for bidding remaining time 
    @RequestMapping("/countDownTimerForOpening")
    public String countDownTimerForOpening(@RequestParam int tenderId) {
//        System.out.println("countDownTimer countDownTimer countDownTimer  " + tenderId);
        TenderKeyDates keyDate = null;
        Date bidDate = null;
        Session session = null;
        String response = "";
        List openingDatelist = new ArrayList();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("E dd MMM yyyy hh:mm a");
//            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy HH:mm aa");
            keyDate = tenderDao.readKeyDate(tenderId);
            String openingDates[] = new String[2];

            openingDates[0] = keyDate.getOpeningEC();
            openingDates[1] = keyDate.getOpeningEB();

//            System.out.println("The Opening EB is: "+openingDates[0]+"\n"
//                    + " The Opening EA is: "+openingDates[1]);
            for (int i = 0; i < 2; i++) {
//                System.out.println("  openingDate " + openingDates[i]);
                if (!openingDates[i].equals("")) {
                    //String date1 = sdf1.format(sdf.parse(openingDates[i]));
                    String dd = openingDates[i].replace(",", "");

                    bidDate = sdf.parse(dd);

                    this.timer = countDateDiff(new Date(), bidDate, TimeUnit.MILLISECONDS);

//                System.out.println("  this.timer " + this.timer + " for data " + openingDates[i]);
                    openingDatelist.add(this.timer);
                }
            }

//            System.out.println("response " + openingDatelist);
            Gson gson = new Gson();
            response = gson.toJson(openingDatelist);
            gsonUtility.writeData(response);
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
//        System.out.println("//::Current Date: "+date1.getTime()+": &&& "+date2.getTime());
        long diffInMillies = date2.getTime() - date1.getTime();
//        System.out.println("Difference in Millisecond: "+diffInMillies);
        return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }

    public List total_EABidderList(int tenderId) {
        Contractor contractor = null;
        List<PurchaseDetails> purchaseDetails = new ArrayList<>();
        boolean allEnvelopeSubmittedStatus = false;
        EnvelopeAData envelopeA = null;
        ContractorDetails contractorDetails = null;
        List<Contractor> ContractorList = new ArrayList<>();
        try {

            purchaseDetails = paymentDAOImpl.fetchAllBidderByTenderId(tenderId);

            for (PurchaseDetails purchaseDetails1 : purchaseDetails) {

                System.out.println(" purchaseDetails1.getContractorId() " + purchaseDetails1.getContractorId());

                allEnvelopeSubmittedStatus = envelopeADataDaoImpl.allEnvelopeSubmittedStatus(tenderId, purchaseDetails1.getContractorId());
                if (allEnvelopeSubmittedStatus == true) {
                    contractor = contractorDaoImpl.fetchData(purchaseDetails1.getContractorId());
                    envelopeA = envelopeADataDaoImpl.envelopeAContractorListbyId(tenderId, purchaseDetails1.getContractorId());
                    contractor.setOpeningResult(envelopeA.getShortListed_Status());

                    System.out.println("envelopeA " + envelopeA);
                    contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(purchaseDetails1.getContractorId());
                    contractor.setCompanyName(contractorDetails.getIndianOrgName());
                    ContractorList.add(contractor);

                } else {

                    System.out.println("Contractor ID " + purchaseDetails1.getContractorId() + " Tender ID " + tenderId + " All EA,EB,EC Are Not Submitted");
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ContractorList;
    }

    public List total_EBBidderList(int tenderId) {
        System.out.println("CONTRACTORRR"+tenderId);
        Contractor contractor = null;
        List<Integer> EA_ShortListbidderIds = new ArrayList<>();
        List<Contractor> ContractorList = new ArrayList<>();
        ContractorDetails contractorDetails = null;
        try {
            EA_ShortListbidderIds = envelopeBDataDaoImpl.envelopeBContractorList(tenderId);

            for (Integer contId : EA_ShortListbidderIds) {
                contractor = contractorDaoImpl.fetchData(contId);
                EnvelopeBData envelopeB = envelopeBDataDaoImpl.envelopeBContractorListbyId(tenderId, contId);
                if (envelopeB != null) {
                    contractor.setOpeningResult(envelopeB.getShortListed_Status());
                }
                contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(contId);
                contractor.setCompanyName(contractorDetails.getIndianOrgName());
                ContractorList.add(contractor);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ContractorList;
    }


      public List total_QCBSBidderList(int tenderId) {
        System.out.println("CONTRACTORRR"+tenderId);
        Contractor contractor = null;
        List<Integer> EA_ShortListbidderIds = new ArrayList<>();
        List<Contractor> ContractorList = new ArrayList<>();
        ContractorDetails contractorDetails = null;
        try {
            EA_ShortListbidderIds = envelopeBDataDaoImpl.envelopeBContractorList(tenderId);

            for (Integer contId : EA_ShortListbidderIds) {
                contractor = contractorDaoImpl.fetchData(contId);
                QcbsData envelopQCBS= qcbsDataDaoImpl.envelopeQCBSContractorListbyId(String.valueOf(tenderId), contId);
               
                if (envelopQCBS != null) {
                    contractor.setOpeningResult(envelopQCBS.getShortListed_Status());
                }
                contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(contId);
                contractor.setCompanyName(contractorDetails.getIndianOrgName());
                ContractorList.add(contractor);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ContractorList;
    }
    
    

    @RequestMapping("/openEnvelopeA")
    public String openEnvelopeA(Model m, HttpSession session) {
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        boolean alredyVerifyByUser = false;
//         ContractorDetails contractorDetails=null;
        Tender tender = null;
        TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA = null;
        List<Contractor> ContractorList = new ArrayList<>();
        boolean openEAflag = false;
        boolean viewBidderDocument = false;
        boolean hideSelectionOption = false;
        try {
            tenderId = (int) session.getAttribute("tenderId");

            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");

            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            System.out.println("//  tenderId " + tenderId + " //");
            if (tenderId != 0) {
                tender = tenderDao.read(tenderId);
                ContractorList = total_EABidderList(tenderId);
                System.out.println("ContractorList size " + ContractorList.size());
            }
            hideSelectionOption = hideSelectionOptionforEA(tenderId);
            if (tenderId != 0) {
                tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            }
            //  System.out.println("EA officer " + tenderSubmittedEnvelopeA.getOpenedEAOfficers().length());
            if (tenderSubmittedEnvelopeA.getOpenedEAOfficers() != null) {
                if (tenderSubmittedEnvelopeA.getOpenedEAOfficers().length() != 0) {
                    String openEAofficer[] = tenderSubmittedEnvelopeA.getOpenedEAOfficers().split(",");
                    System.out.println("EAAA Officers"+openEAofficer);
                    for (String openEAofficer1 : openEAofficer) {
                        if (Integer.parseInt(openEAofficer1) == departmentUserId) {
                            alredyVerifyByUser = true;
                            System.out.println("flag " + alredyVerifyByUser);
                        }
                    }
                }
            }

            // System.out.println("remaining user " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() + " " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() + " = " + 1);
            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() == 1) {
                openEAflag = true;
                System.out.println("TRUE");
            } else if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() == 0) {
                openEAflag = true;
                viewBidderDocument = true;
                m.addAttribute("EA_Opend", "EA_Opend");
                System.out.println("BOTH ARE TRUE");
            } else {
                openEAflag = false;
                System.out.println("FALSE");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("alredyVerifyByUser 1 " + alredyVerifyByUser);
//        System.out.println("openEAflag 1 " + openEAflag);
        m.addAttribute("openEAflag", openEAflag);
        m.addAttribute("tender", tender);
        m.addAttribute("ContractorList", ContractorList);
        m.addAttribute("alredyVerifyByUser", alredyVerifyByUser);
        m.addAttribute("viewBidderDocument", viewBidderDocument);
        m.addAttribute("hideSelectionOption", hideSelectionOption);
//        m.addAttribute("revertStatus", revertStatus);

        return "DepartmentUser/OpeningEnvelopeA";
    }

    public boolean hideSelectionOptionforEA(int tenderId) {
        boolean hideSelectionOption = false;
        TenderSubmittedEnvelopeB tenderSubmittedEnvelopeB = null;

        try {
            tenderSubmittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);
            if (tenderSubmittedEnvelopeB != null) {
                if (!tenderSubmittedEnvelopeB.getOpenedEBOfficers().equals("") && tenderSubmittedEnvelopeB.getOpenedEBOfficers() != null) {
                    hideSelectionOption = true;
                }
                hideSelectionOption = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hideSelectionOption;
    }

    @RequestMapping("/openEnvelopeB")
    public String openEnvelopeB(Model m, HttpSession session) {
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        Tender tender = null;
        List<Contractor> ContractorList = new ArrayList<>();
        Contractor contractor = new Contractor();
        boolean openEBflag = false;
        boolean qcbsEnvelop=false;
        boolean viewBidderDocument = false;
        boolean alredyVerifyByUser = false;
        TenderSubmittedEnvelopeB tenderSubmittedEnvelopeB = null;
        TenderSubmittedQCBS tenderSubmittedEnvelopQCBS=null;
        try {
            System.out.println("mmmmmmmmmmmmm");
            tenderId = (int) session.getAttribute("tenderId");
            System.out.println("TENDER ID"+tenderId);
                tender = tenderDao.read(tenderId);
          if("4".equals(tender.getEnvelopeType())){
              System.out.println("4444444444444444444444");
                if (tenderId != 0) {
                System.out.println("nit number  " + tender.getNitNumber()+"Envelop Typeeeeeeeee"+tender.getEnvelopeType());
              
                String s=tender.getEnvelopeType();
                System.out.println("Envelop Typeeeee"+s);
                m.addAttribute("qcbsType", s);
                if (session.getAttribute("deptUserId") != null) {
                    departmentUserId = (Integer) session.getAttribute("deptUserId");
                }
                System.out.println("//  deptUserId " + departmentUserId + " //");
             ContractorList = total_QCBSBidderList(tenderId);
                tenderSubmittedEnvelopQCBS = tenderSubmittedQCBSDaoImpl.read(tenderId);
                    System.out.println("QCBS SUBMITTED"+tenderSubmittedEnvelopQCBS);
            }
              System.out.println("EA officer " + tenderSubmittedEnvelopQCBS.getQCBSOfficers().length());
            if (tenderSubmittedEnvelopQCBS.getQCBSOfficers()!= null) {
                if (tenderSubmittedEnvelopQCBS.getQCBSOfficers().length() != 0) {
                    String openEAofficer[] = tenderSubmittedEnvelopQCBS.getQCBSOfficers().split(",");
                    for (String openEAofficer1 : openEAofficer) {
                        System.out.println("OpenEAOfficersss"+openEAofficer1);
                        if (Integer.parseInt(openEAofficer1) == departmentUserId) {
                            alredyVerifyByUser = false;
                            System.out.println("flagqcbs " + alredyVerifyByUser);
                        }
                    }
                }
            }
              //System.out.println("llllllllllll"+tenderSubmittedEnvelopQCBS.getRemainOpeningOfficerQCBS());

              if(Integer.parseInt(tenderSubmittedEnvelopQCBS.getRemainOpeningOfficerQCBS()) == 1) {
openEBflag = false;         
System.out.println("22222222222");
              }
              else if(Integer.parseInt(tenderSubmittedEnvelopQCBS.getRemainOpeningOfficerQCBS())==0){
                viewBidderDocument = true;
                openEBflag = true;
                  alredyVerifyByUser = true;
                m.addAttribute("EB_Opend", "EB_Opend");
                System.out.println("333333333");
              }
                else {
                openEBflag = false;
System.out.println("444444444444444");
            }

//               if ("1".equals(tenderSubmittedEnvelopQCBS.getRemainOpeningOfficerQCBS())) {
//                openEBflag = true;         
//System.out.println("22222222222");
           //}
//          else if ("0".equals(tenderSubmittedEnvelopQCBS.getRemainOpeningOfficerQCBS())) {
//                viewBidderDocument = true;
//                openEBflag = true;
//                m.addAttribute("EB_Opend", "EB_Opend");
//                System.out.println("333333333");
//
//            } 
//          else {
//                openEBflag = true;
//System.out.println("444444444444444");
//            }
          }
          else{
                if (tenderId != 0) {
                String s=tender.getEnvelopeType();
                System.out.println("Envelop Typeeeee"+s);
                m.addAttribute("qcbsType", s);
                if (session.getAttribute("deptUserId") != null) {
                    departmentUserId = (Integer) session.getAttribute("deptUserId");
                }
                System.out.println("//  deptUserId " + departmentUserId + " //");
             ContractorList = total_EBBidderList(tenderId);
                tenderSubmittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);
            }
              System.out.println("EA officer " + tenderSubmittedEnvelopeB.getOpenedEBOfficers().length());
            if (tenderSubmittedEnvelopeB.getOpenedEBOfficers() != null) {
                if (tenderSubmittedEnvelopeB.getOpenedEBOfficers().length() != 0) {
                    String openEAofficer[] = tenderSubmittedEnvelopeB.getOpenedEBOfficers().split(",");
                    for (String openEAofficer1 : openEAofficer) {
                        if (Integer.parseInt(openEAofficer1) == departmentUserId) {
                            alredyVerifyByUser = true;
                            System.out.println("flag " + alredyVerifyByUser);
                        }
                    }
                }
            }

            System.out.println("remaining user " + tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() + " " + tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() + " = " + 1);
            if (tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() == 1) {
                openEBflag = true;
                System.out.println("OPEN FLAG Envelop B"+openEBflag);
            } else if (tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() == 0) {
                viewBidderDocument = true;
                openEBflag = true;
                m.addAttribute("EB_Opend", "EB_Opend");
System.out.println("OPEN FLAG Envelop B"+openEBflag);
            } else {
                openEBflag = false;
System.out.println("OPEN FLAG Envelop B"+openEBflag);
            }
          }

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("alredyVerifyByUser 1 " + alredyVerifyByUser);
        System.out.println("openEBflag 1 " + openEBflag);
        m.addAttribute("openEBflag", openEBflag);
        m.addAttribute("tender", tender);
        m.addAttribute("ContractorList", ContractorList);
        m.addAttribute("alredyVerifyByUser", alredyVerifyByUser);
        m.addAttribute("viewBidderDocument", viewBidderDocument);
        return "DepartmentUser/OpeningEnvelopeB";
    }

    @ResponseBody
    @RequestMapping("/envelopeAdataList")
    public String envelopeAdataList(@RequestParam int id, Model m, HttpSession session) {
        System.out.println("tenderOpening envelopeAdataList " + id);
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA = null;
        List<EnvelopeAData> envelopeAList = new ArrayList<>();
        String response = "";
        Contractor contractor = new Contractor();
        ContractorDetails contractorDetails = null;
        List list = new ArrayList();
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            contractor = contractorDaoImpl.fetchData(id);
            contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(id);
            contractor.setCompanyName(contractorDetails.getIndianOrgName());
            if (tenderId != 0) {
                envelopeAList = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, id, departmentUserId);
                System.out.println("envelopeAList" + envelopeAList.size());
                tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            }
            System.out.println("RemainOpeningOfficerA " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA());
            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() == 0) {
                contractor.setEnvelopeOpeningStatus(true);
            } else {
                contractor.setEnvelopeOpeningStatus(false);
            }
            list.add(contractor);
            list.add(envelopeAList);
            Gson gson = new Gson();
            response = gson.toJson(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(response);
        return response;
    }

    @ResponseBody
    @RequestMapping("/shortlistedContractorA")
    public String shortlistedContractorA(@RequestParam int id, HttpServletRequest request) {
        String response = "";
        List<EnvelopeAData> envelopeAList = new ArrayList<EnvelopeAData>();
        List<Decrypt_envelopeA> decrypt_envelopeAList = new ArrayList<Decrypt_envelopeA>();
        boolean shortList_Status = false;
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = "Shortlisted";
        Decrypt_envelopeA decryptenvelopeA = new Decrypt_envelopeA();
        HttpSession session = request.getSession();
        try {

            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != 0) {
                shortList_Status = envelopeADataDaoImpl.updateShortlistedContrctrStatus(tenderId, id, departmentUserId, shortlistedstatus);
                envelopeAList = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, id);
                decrypt_envelopeAList = decrypt_envelopeADaoImpl.fetchEnvelopeAById(tenderId, id, departmentUserId);
            }
            if (decrypt_envelopeAList.isEmpty()) {
                for (EnvelopeAData envelopeAData : envelopeAList) {
                    envelopeAData.setShortListed_Status(shortlistedstatus);
                    BeanUtils.copyProperties(decryptenvelopeA, envelopeAData);

                    System.out.println(" id " + decryptenvelopeA.getEnvelopeAFieldId());
                    System.out.println(" id " + decryptenvelopeA.getFieldValueOfContractor());
                    System.out.println("data copied");

                    decrypt_envelopeADaoImpl.insertData(decryptenvelopeA);
                }

            }

            Gson gson = new Gson();
            response = gson.toJson(shortList_Status);

            logs.setActivity("Open Envelope A for Shortlist Contractor");
            logs.setLogMessage("Envelope A Contractor Shorlisted");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/rejectedContractorA")
    public String rejectedContractorA(@RequestParam int id, @RequestParam String remark_detail, HttpServletRequest request) {
        System.out.println("remark_detail  " + remark_detail);
        String response = "";
        List<EnvelopeAData> envelopeAList = new ArrayList<EnvelopeAData>();
        List<Decrypt_envelopeA> decrypt_envelopeAList = new ArrayList<Decrypt_envelopeA>();
        Decrypt_envelopeA decryptenvelopeA = new Decrypt_envelopeA();
        HttpSession session = request.getSession();
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = "Rejected";
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            envelopeAList = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, id);
            decrypt_envelopeAList = decrypt_envelopeADaoImpl.fetchEnvelopeAById(tenderId, id, departmentUserId);
            if (decrypt_envelopeAList.isEmpty()) {
                for (EnvelopeAData envelopeAData : envelopeAList) {
                    envelopeAData.setShortListed_Status(shortlistedstatus);
                    BeanUtils.copyProperties(decryptenvelopeA, envelopeAData);

                    System.out.println(" id " + decryptenvelopeA.getEnvelopeAFieldId());
                    System.out.println(" id " + decryptenvelopeA.getFieldValueOfContractor());
                    System.out.println("data copied");

                    decrypt_envelopeADaoImpl.insertData(decryptenvelopeA);
                }

            }
            if (tenderId != 0) {
                envelopeADataDaoImpl.updateRejectedContrctrStatus(tenderId, id, departmentUserId, shortlistedstatus, remark_detail);
            }
            Gson gson = new Gson();
            response = gson.toJson(shortlistedstatus);
            logs.setActivity("Open Envelope A for Reject Contractor");
            logs.setLogMessage("Envelope A Contractor Rejected");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/revertedContractorA")
    public String revertedContractorA(@RequestParam int id, @RequestParam String revertremark_detail, HttpServletRequest request) {
        System.out.println("remark_detail  " + revertremark_detail);
        String response = "";
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = null;
        String rejectRemarkEA = null;
        boolean flag = false;
        List<EnvelopeAData> envelopeAList = new ArrayList<EnvelopeAData>();
        List<Decrypt_envelopeA> decrypt_envelopeAList = new ArrayList<Decrypt_envelopeA>();
        HttpSession session = request.getSession();
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            envelopeAList = envelopeADataDaoImpl.fetchEnvelopeAById(tenderId, id);
            decrypt_envelopeAList = decrypt_envelopeADaoImpl.fetchEnvelopeAById(tenderId, id, departmentUserId);
            System.out.println("decrypt list size " + decrypt_envelopeAList.size());
            if (!decrypt_envelopeAList.isEmpty()) {
                for (EnvelopeAData envelopeAData : envelopeAList) {

                    System.out.println(" id " + envelopeAData.getEnvelopeAFieldId());

                    System.out.println("data copied");

                    flag = decrypt_envelopeADaoImpl.removeData(envelopeAData.getEnvelopeAFieldId());
                    System.out.println("flag " + flag);
                }
            }

            if (tenderId != 0) {
                envelopeADataDaoImpl.updateRevertedContrctrStatus(tenderId, id, departmentUserId, shortlistedstatus, rejectRemarkEA, revertremark_detail);
            }
            Gson gson = new Gson();
            response = gson.toJson(shortlistedstatus);
            logs.setActivity("Open Envelope A for Revert Contractor");
            logs.setLogMessage("Envelope A Contractor Reverted");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/envelopeBdataList")
    public String envelopeBdataList(@RequestParam int id, Model m, HttpSession session) {
        System.out.println("tenderOpening envelopeBdataList " + id);
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA = null;
        List<EnvelopeBData> envelopeBList = new ArrayList<>();
        String response = "";
        Contractor contractor = new Contractor();
        ContractorDetails contractorDetails = null;
        List list = new ArrayList();
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            contractor = contractorDaoImpl.fetchData(id);
            contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(id);
            contractor.setCompanyName(contractorDetails.getIndianOrgName());
            if (tenderId != 0) {
                envelopeBList = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);
                tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            }
            System.out.println("RemainOpeningOfficerA  " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA());
            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() == 1) {
                contractor.setEnvelopeOpeningStatus(true);
            } else {
                contractor.setEnvelopeOpeningStatus(false);
            }
            System.out.println("envelopeBList  " + envelopeBList.size());
            list.add(contractor);
            list.add(envelopeBList);
            Gson gson = new Gson();
            response = gson.toJson(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }
    
    
       @ResponseBody
    @RequestMapping("/envelopeQCBSdataList")
    public String envelopeQCBSdataList(@RequestParam int id, Model m, HttpSession session) {
        System.out.println("tenderQCBDSOpening envelopeBdataList " + id);
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA = null;
        List<EnvelopeBData> envelopeBList = new ArrayList<>();
        String response = "";
        Contractor contractor = new Contractor();
        QcbsData qcbs=new QcbsData();
         QCBSTemplate q=new QCBSTemplate();
                
        
        ContractorDetails contractorDetails = null;
        List list = new ArrayList();
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            contractor = contractorDaoImpl.fetchData(id);
            
            contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(id);
            contractor.setCompanyName(contractorDetails.getIndianOrgName());
            if (tenderId != 0) {
                qcbs = qcbsDataDaoImpl.envelopeQCBSContractorListbyId(String.valueOf(tenderId), id);
                System.out.println("ENVELOP LIST"+qcbs);
                tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
                  TenderSubmittedQCBS s= tenderSubmittedQCBSDaoImpl.read(tenderId);
                  Integer ss=s.getTemplateId();
              q= qcbsTemplateDao.fetchQCBSTemplateByTemplateId(ss);
                System.out.println("QQQQQQQ"+q.getTemplate());
               
            }
            System.out.println("RemainOpeningOfficerA  " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA());
            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() == 1) {
                contractor.setEnvelopeOpeningStatus(true);
            } else {
                contractor.setEnvelopeOpeningStatus(false);
            }
            System.out.println("envelopeBList  " + qcbs);
             System.out.println("envelopeBList  " + contractor);
            list.add(contractor);
            list.add(qcbs);
            list.add(q);
            
            
            Gson gson = new Gson();
            response = gson.toJson(list);
            System.out.println("RESPONSESSSSSSSSSSS"+response);
       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/shortlistedContractorB")
    public String shortlistedContractorB(@RequestParam int id, HttpServletRequest request) {
        String response = "";
        List<EnvelopeBData> envelopeBList = new ArrayList<EnvelopeBData>();
        List<Decrypt_envelopeB> decrypt_envelopeBList = new ArrayList<Decrypt_envelopeB>();
        boolean shortList_Status = false;
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = "Shortlisted";
        Decrypt_envelopeB decryptenvelopeB = new Decrypt_envelopeB();
        HttpSession session = request.getSession();
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != 0) {
                shortList_Status = envelopeBDataDaoImpl.updateShortlistedContrctrStatus(tenderId, id, departmentUserId, shortlistedstatus);
                envelopeBList = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);
                System.out.println("shortlist list " + envelopeBList);
                decrypt_envelopeBList = decrypt_envelopeBDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);
            }
            if (decrypt_envelopeBList.isEmpty()) {
                for (EnvelopeBData envelopeBData : envelopeBList) {
                    envelopeBData.setShortListed_Status(shortlistedstatus);
                    BeanUtils.copyProperties(decryptenvelopeB, envelopeBData);

                    System.out.println(" id " + decryptenvelopeB.getEnvelopeBFieldId());
                    System.out.println(" id " + decryptenvelopeB.getFieldValueOfContractor());
                    System.out.println("data copied");

                    decrypt_envelopeBDaoImpl.insertData(decryptenvelopeB);
                }

            }

            Gson gson = new Gson();
            response = gson.toJson(shortList_Status);

            logs.setActivity("Open Envelope B for Shortlist Contractor");
            logs.setLogMessage("Envelope B Contractor Shorlisted");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/rejectedContractorB")
    public String rejectedContractorB(@RequestParam int id, @RequestParam String remark_detail, HttpServletRequest request) {
        System.out.println("remark_detail  " + remark_detail);
        String response = "";
        List<EnvelopeBData> envelopeBList = new ArrayList<EnvelopeBData>();
        List<Decrypt_envelopeB> decrypt_envelopeBList = new ArrayList<Decrypt_envelopeB>();
        Decrypt_envelopeB decryptenvelopeB = new Decrypt_envelopeB();

        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = "Rejected";
        HttpSession session = request.getSession();
        try {
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
                System.out.println("DEPARTMENT ID"+departmentUserId);
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");

            envelopeBList = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);
            decrypt_envelopeBList = decrypt_envelopeBDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);

            System.out.println("ssssssssssssssssssssssssssssssss" + decrypt_envelopeBList);
            if (decrypt_envelopeBList.isEmpty()) {
                for (EnvelopeBData envelopeBData : envelopeBList) {
                    envelopeBData.setShortListed_Status(shortlistedstatus);
                    BeanUtils.copyProperties(decryptenvelopeB, envelopeBData);
                    System.out.println(" id " + decryptenvelopeB.getEnvelopeBFieldId());
                    System.out.println(" id " + decryptenvelopeB.getFieldValueOfContractor());
                    System.out.println("data copied");
                    decrypt_envelopeBDaoImpl.insertData(decryptenvelopeB);
                }

            }
            if (tenderId != 0) {
                envelopeBDataDaoImpl.updateRejectedContrctrStatus(tenderId, id, departmentUserId, shortlistedstatus, remark_detail);
            }
            Gson gson = new Gson();
            response = gson.toJson(shortlistedstatus);
            logs.setActivity("Open Envelope B for Reject Contractor");
            logs.setLogMessage("Envelope B Contractor Rejected");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/revertedContractorB")
    public String revertedContractorB(@RequestParam int id, @RequestParam String revertremark_detail, HttpServletRequest request) {
        System.out.println("remark_detail  " + revertremark_detail);
        String response = "";
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = null;
        String rejectRemarkEB = null;
        boolean flag = false;
        List<EnvelopeBData> envelopeBList = new ArrayList<EnvelopeBData>();
        List<Decrypt_envelopeB> decrypt_envelopeBList = new ArrayList<Decrypt_envelopeB>();
        HttpSession session = request.getSession();
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }

            if (tenderId != 0) {
                envelopeBList = envelopeBDataDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);
                decrypt_envelopeBList = decrypt_envelopeBDaoImpl.fetchEnvelopeBById(tenderId, id, departmentUserId);
            }
            System.out.println("decrypt list size " + decrypt_envelopeBList.size());
            if (!decrypt_envelopeBList.isEmpty()) {
                for (EnvelopeBData envelopeBData : envelopeBList) {

                    System.out.println(" id " + envelopeBData.getEnvelopeBFieldId());

                    System.out.println("data copied");

                    flag = decrypt_envelopeBDaoImpl.removeData(envelopeBData.getEnvelopeBFieldId());
                    System.out.println("flag " + flag);
                }
            }

            if (tenderId != 0) {
                envelopeBDataDaoImpl.updateRevertedContrctrStatus(tenderId, id, departmentUserId, shortlistedstatus, rejectRemarkEB, revertremark_detail);
            }
            Gson gson = new Gson();
            response = gson.toJson(shortlistedstatus);
            logs.setActivity("Open Envelope B for Revert Contractor");
            logs.setLogMessage("Envelope B Contractor Reverted");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }
    
    @ResponseBody
    @RequestMapping("/shortlistedContractorQCBS")
    public String shortlistedContractorQCBS(@RequestParam int id, HttpServletRequest request) {
        System.out.println("Contractor Id"+id);
        String response = "";
        
        List<QcbsData> envelopeBList = new ArrayList<QcbsData>();
        List<Decrypt_envelopQCBS> decrypt_envelopeBList = new ArrayList<Decrypt_envelopQCBS>();
        boolean shortList_Status = false;
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        String shortlistedstatus = "Shortlisted";
  Decrypt_envelopQCBS decryptenvelopeQCBS = new Decrypt_envelopQCBS();
        HttpSession session = request.getSession();
        try {
            tenderId =(int)session.getAttribute("tenderId");
            System.out.println("TTTTTTTTTTTTT"+tenderId);
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
                      System.out.println("DEPARTMENT ID"+departmentUserId);
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != null) {
               shortList_Status= qcbsDataDaoImpl.updateShortlistedContractorStatus(String.valueOf(tenderId),id, departmentUserId,shortlistedstatus);
               envelopeBList=qcbsDataDaoImpl.fetchEnvelopeQCBSById(String.valueOf(tenderId), id, departmentUserId);
               
                System.out.println("shortlist list " + envelopeBList);
                decrypt_envelopeBList = decrypt_envelopeQCBSDaoImpl.fetchEnvelopeBById(String.valueOf(tenderId), id, departmentUserId);
            }
            
                for (QcbsData qcbsData : envelopeBList) {
                    qcbsData.setShortListed_Status(shortlistedstatus);
                    BeanUtils.copyProperties(decryptenvelopeQCBS, qcbsData);

                    System.out.println(" id " + decryptenvelopeQCBS.getQcbs_Id());
                  
                    System.out.println("data copied");

             decrypt_envelopeQCBSDaoImpl.insertData(decryptenvelopeQCBS);
                }

            

            Gson gson = new Gson();
            response = gson.toJson(shortList_Status);

            logs.setActivity("Open Envelope B for Shortlist Contractor");
            logs.setLogMessage("Envelope B Contractor Shorlisted");
            logs.setOsName(logsAction.FetchOSName());
            logs.setIpAddress(logsAction.fetchIpAddress());
//                logs.setDeptId();
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            logs.setContractorId(id);
            logs.setTenderId(tenderId);
            logsActionDao.save(logs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @RequestMapping("/openEnvelopeC")
    public String envelopeC(Model m, HttpSession session) {
        boolean openECflag = false;
        boolean alredyVerifyByUser = false;
        TenderSubmittedEnvelopeC tenderSubmittedEnvelopec = null;
//          boolean hideSelectionOption=false;
        boolean viewBidderDocument = false;
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        ContractorDetails contractorDetails = null;
        Tender tender = null;
        List<Integer> envelopeCData = new ArrayList<>();
        List<Integer> envelopeBData = new ArrayList<>();
        List<Contractor> ContractorList = new ArrayList<>();
        Contractor contractor = new Contractor();

        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != 0 && departmentUserId != 0) {
                tender = tenderDao.read(tenderId);
//                          System.out.println("Envelope B  is not null data is"+eb);                          
                envelopeBData = envelopeBDataDaoImpl.fetchEnvelopeBContractor(tenderId);
                if (envelopeBData.isEmpty()) {
                    envelopeBData = envelopeADataDaoImpl.envelopeAShortlistedContractorList(tenderId);

                }
            }
            System.out.println("nit number  " + tender.getNitNumber());

            System.out.println("Contactor id list size is" + envelopeBData.size());
            for (Integer contId : envelopeBData) {
                System.out.println("Contractor id for envelope B " + contId);
                contractor = contractorDaoImpl.fetchData(contId);
//              contractorDetails=(ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(envelopeAData1);
                contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(contId);
                if (contractorDetails != null) {
                    contractor.setCompanyName(contractorDetails.getIndianOrgName());
                }
                ContractorList.add(contractor);
                System.out.println(ContractorList);

            }
            if (tenderId != 0) {
                tenderSubmittedEnvelopec = tenderSubmittedEnvelopeCDaoImpl.read(tenderId);
            }
//            System.out.println("EA officer " + tenderSubmittedEnvelopec.getOpenedECOfficers().length());
            if (tenderSubmittedEnvelopec.getOpenedECOfficers() != null) {
                if (tenderSubmittedEnvelopec.getOpenedECOfficers().length() != 0) {
                    String openEAofficer[] = tenderSubmittedEnvelopec.getOpenedECOfficers().split(",");
                    for (String openEAofficer1 : openEAofficer) {
                        if (Integer.parseInt(openEAofficer1) == departmentUserId) {
                            alredyVerifyByUser = true;
                            System.out.println("flag " + alredyVerifyByUser);
                        }
                    }
                }
            }
            //
            System.out.println("remaining user " + tenderSubmittedEnvelopec.getRemainOpeningOfficerC() + " " + tenderSubmittedEnvelopec.getRemainOpeningOfficerC() + " = " + 1);
            if (tenderSubmittedEnvelopec.getRemainOpeningOfficerC() == 1) {
                openECflag = true;

            } else if (tenderSubmittedEnvelopec.getRemainOpeningOfficerC() == 0) {
                openECflag = true;
                viewBidderDocument = true;
                m.addAttribute("EC_Opend", "EC_Opend");

            } else {
                openECflag = false;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Flag is  - >" + openECflag + " and verfy is--->" + alredyVerifyByUser);
        m.addAttribute("openECflag", openECflag);
        m.addAttribute("viewBidderDocument", viewBidderDocument);
        m.addAttribute("alredyVerifyByUser", alredyVerifyByUser);
        m.addAttribute("tender", tender);
        m.addAttribute("ContractorList", ContractorList);
        System.out.println("Contractor list is " + ContractorList);
        return "DepartmentUser/OpeningEnvelopeC";
    }

    @ResponseBody
    @RequestMapping("/envelopeCdataList")
    public String envelopeCdataList(@RequestParam int id, Model m, HttpSession session) {
        System.out.println("tenderOpening envelopeCdataList " + id);
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA = null;
        Map<String, Contractor> contMap = new LinkedHashMap<>();
        EnvelopeCData envelopeC = null;
        String response = "";
        Contractor contractor = new Contractor();
        Tender tender = null;
        long priceBid1;
        long priceBid;
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != 0) {
                tender = tenderDao.read(tenderId);
            }
            String tendertype = tender.getTypeOfTender();
            contractor = contractorDaoImpl.fetchData(id);
            ContractorDetails contractorDetails = (ContractorDetails) contractorDetailsdaoImpl.fetchDatabyRegID(id);
            if (contractorDetails != null) {
                contractor.setCompanyName(contractorDetails.getIndianOrgName());

            }

            if (tenderId != 0) {
                envelopeC = envelopeCDataDaoImpl.fetchEnvelopeCById(tenderId, id, departmentUserId);
                tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            }
            System.out.println("RemainOpeningOfficerA  " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA());
            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() == 1) {
                contractor.setEnvelopeOpeningStatus(true);
            } else {
                contractor.setEnvelopeOpeningStatus(false);
            }
            //if Tender type is PERCENTAGE
            if (tendertype.equalsIgnoreCase("1")) {
                if (envelopeC.getEncryptedDeviationByContractor().equalsIgnoreCase("1")) {
                    priceBid = Long.parseLong(tender.getEstimateValueInFig());
                    System.out.println("tender price bid " + priceBid);
                    priceBid1 = Long.parseLong(envelopeC.getEncryptedBidByContractor());
                    priceBid1 = (priceBid * priceBid1) / 100;
                    priceBid = priceBid - priceBid1;
                    System.out.println("case 1 price bid " + priceBid);
                    envelopeC.setEncryptedBidByDepartmentAdmin(String.valueOf(priceBid));
                } else if (envelopeC.getEncryptedDeviationByContractor().equalsIgnoreCase("3")) {
                    priceBid = Long.parseLong(tender.getEstimateValueInFig());
                    priceBid1 = Long.parseLong(envelopeC.getEncryptedBidByContractor());
                    priceBid1 = (priceBid * priceBid1) / 100;
                    priceBid = priceBid + priceBid1;
                    System.out.println("case 3 price bid " + priceBid);
                    envelopeC.setEncryptedBidByDepartmentAdmin(String.valueOf(priceBid));
                } else {

                    envelopeC.setEncryptedBidByDepartmentAdmin(tender.getEstimateValueInFig());

                }
                //if Tender type is LUMPSUM   
            } else if (tendertype.equalsIgnoreCase("2")) {
            }
            contractor.setEnvelopeCList(envelopeC);

            contMap.put("data", contractor);
            Gson gson = new Gson();
            response = gson.toJson(contMap);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @ResponseBody
    @RequestMapping("/verifyEnvelopeStatus")
    public String verifyEnvelopeStatus(HttpSession session) {
        System.out.println("Verify Envelope Status");
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA = null;
        String response = "";
        boolean flag = false;
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != 0) {
                tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeADaoImpl.read(tenderId);
            }
            System.out.println(" min Opening officer " + tenderSubmittedEnvelopeA.getMinOpeningOfficerA() + " Remaining officer " + tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() + "  envelope A Officers " + tenderSubmittedEnvelopeA.getEnvelopeAOfficers());
//          tenderSubmittedEnvelopeA.setOpenedEAOfficers(String.valueOf(departmentUserId));
            String openingEAofficer = tenderSubmittedEnvelopeA.getOpenedEAOfficers();
//            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA().equalsIgnoreCase("1")) {

            if (openingEAofficer == null || openingEAofficer.equals("")) {

                openingEAofficer = String.valueOf(departmentUserId);
            } else {

                openingEAofficer = (openingEAofficer + "," + String.valueOf(departmentUserId));
            }
            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() != 0) {
                tenderSubmittedEnvelopeA.setRemainOpeningOfficerA((tenderSubmittedEnvelopeA.getRemainOpeningOfficerA() - 1));
                tenderSubmittedEnvelopeADaoImpl.create(tenderSubmittedEnvelopeA);
                if (tenderId != 0) {
                    flag = tenderSubmittedEnvelopeADaoImpl.update(tenderId, openingEAofficer);
                }
            }
            System.out.println("flag " + flag);
            if (flag == true) {
                response = "Envelope A is Verified";
            } else {
                response = "Envelope A is not Verified";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return response;
    }

    @ResponseBody
    @RequestMapping("/verifyEnvelopeBStatus")
    public String verifyEnvelopeBStatus(HttpSession session) {
        System.out.println("verifyEnvelopeBStatus");
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeB tenderSubmittedEnvelopeB = null;
        String response = "";
        boolean flag = false;
        String openingEBofficer = "";
        try {

            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("\\033[31;1mdeptUserId-" + departmentUserId + "\\033[0m");
            if (tenderId != 0) {
                tenderSubmittedEnvelopeB = tenderSubmittedEnvelopeBDaoImpl.read(tenderId);
                System.out.println("TenderSubmittedEnvelopB"+tenderSubmittedEnvelopeB);
            }
            System.out.println(" min Opening officer " + tenderSubmittedEnvelopeB.getMinOpeningOfficerB() + " Remaining officer " + tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() + "  envelope B Officers " + tenderSubmittedEnvelopeB.getEnvelopeBOfficers());
//          tenderSubmittedEnvelopeA.setOpenedEAOfficers(String.valueOf(departmentUserId));
            openingEBofficer = tenderSubmittedEnvelopeB.getOpenedEBOfficers();
//            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA().equalsIgnoreCase("1")) {
System.out.println("OPENING OFFICER"+openingEBofficer);
            if (openingEBofficer == null || openingEBofficer.equals("")) {

                openingEBofficer = String.valueOf(departmentUserId);
                System.out.println("IF ke UNDER KA"+openingEBofficer);
            } else {

                openingEBofficer = (openingEBofficer + "," + String.valueOf(departmentUserId));
                System.out.println("ELSE ke UNDER KA"+openingEBofficer);
                
            }
            if (tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() != 0) {
                tenderSubmittedEnvelopeB.setRemainOpeningOfficerB((tenderSubmittedEnvelopeB.getRemainOpeningOfficerB() - 1));
                tenderSubmittedEnvelopeBDaoImpl.create(tenderSubmittedEnvelopeB);
                flag = tenderSubmittedEnvelopeBDaoImpl.update(tenderId, openingEBofficer);
                
            }

            System.out.println("flag " + flag);
            if (flag == true) {
                response = "Envelope B is Verified";
            } else {
                response = "Envelope B is not Verified";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return response;
    }

    
    @ResponseBody
    @RequestMapping("/verifyEnvelopeQCBSStatus")
    public String verifyEnvelopeQCBSStatus(HttpSession session) {
        System.out.println("verifyEnvelopeQCBSStatus");
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedQCBS tenderSubmittQCBS = null;
        String response = "";
        boolean flag = false;
        String openingQCBSofficer = "";
        try {

            tenderId = (int) session.getAttribute("tenderId");
            System.out.println("TENDER ID"+tenderId);
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
                System.out.println("Department Id"+departmentUserId);
            }
            System.out.println("\\033[31;1mdeptUserId-" + departmentUserId + "\\033[0m");
            if (tenderId != 0) {
                tenderSubmittQCBS = tenderSubmittedQCBSDaoImpl.read(tenderId);
            }
            System.out.println(" min Opening officer " + tenderSubmittQCBS.getMinOpeningOfficerQCBS() + " Remaining officer " + tenderSubmittQCBS.getRemainOpeningOfficerQCBS()+ "  envelope B Officers " + tenderSubmittQCBS.getQCBSOfficers());
//          tenderSubmittedEnvelopeA.setOpenedEAOfficers(String.valueOf(departmentUserId));
            openingQCBSofficer = tenderSubmittQCBS.getQCBSOfficers();
//            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA().equalsIgnoreCase("1")) {

            if (openingQCBSofficer == null || openingQCBSofficer.equals("")) {

                openingQCBSofficer = String.valueOf(departmentUserId);
            } else {

                openingQCBSofficer = (openingQCBSofficer + "," + String.valueOf(departmentUserId));
            }
         if (Integer.parseInt(tenderSubmittQCBS.getRemainOpeningOfficerQCBS()) != 0) {
    // Convert the string to an integer
   
    int remainOpeningOfficer = Integer.parseInt(tenderSubmittQCBS.getRemainOpeningOfficerQCBS());
tenderSubmittQCBS.setRemainOpeningOfficerQCBS(String.valueOf(remainOpeningOfficer - 1));
             System.out.println("Get Remaininig Officers"+tenderSubmittQCBS);
    tenderSubmittedQCBSDaoImpl.create(tenderSubmittQCBS);
    flag = tenderSubmittedQCBSDaoImpl.update(tenderId, openingQCBSofficer);
}


            System.out.println("flag " + flag);
            if (flag == true) {
                response = "Envelope B QCBS is Verified";
                System.out.println("Envelope B QCBS is Verified");
            } else {
                response = "Envelope B QCBS is not Verified";
                 System.out.println("Envelope B QCBS is not Verified");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return response;
    }

    
    
    @ResponseBody
    @RequestMapping("/verifyEnvelopeStatusC")
    public String verifyEnvelopeStatusC(HttpSession session) {
        System.out.println("Verify Envelope Status");
        Integer tenderId = 0;
        Integer departmentUserId = 0;
        TenderSubmittedEnvelopeC tenderSubmittedEnvelopeC = null;
        String response = "";
        boolean flag = false;
        try {
            tenderId = (int) session.getAttribute("tenderId");
            if (session.getAttribute("deptUserId") != null) {
                departmentUserId = (Integer) session.getAttribute("deptUserId");
            }
            System.out.println("//  deptUserId " + departmentUserId + " //");
            if (tenderId != 0) {
                tenderSubmittedEnvelopeC = tenderSubmittedEnvelopeCDaoImpl.read(tenderId);
            }
            System.out.println(" min Opening officer " + tenderSubmittedEnvelopeC.getMinOpeningOfficerC() + " Remaining officer " + tenderSubmittedEnvelopeC.getRemainOpeningOfficerC() + "  envelope A Officers " + tenderSubmittedEnvelopeC.getEnvelopeCOfficers());
//          tenderSubmittedEnvelopeA.setOpenedEAOfficers(String.valueOf(departmentUserId));
            String openingECofficer = tenderSubmittedEnvelopeC.getOpenedECOfficers();
//            if (tenderSubmittedEnvelopeA.getRemainOpeningOfficerA().equalsIgnoreCase("1")) {

            if (openingECofficer == null || openingECofficer.equals("")) {

                openingECofficer = String.valueOf(departmentUserId);
            } else {

                openingECofficer = (openingECofficer + "," + String.valueOf(departmentUserId));
            }
            if (tenderSubmittedEnvelopeC.getRemainOpeningOfficerC() != 0) {
                tenderSubmittedEnvelopeC.setRemainOpeningOfficerC((tenderSubmittedEnvelopeC.getRemainOpeningOfficerC() - 1));
                tenderSubmittedEnvelopeCDaoImpl.create(tenderSubmittedEnvelopeC);
                if (tenderId != 0) {
                    flag = tenderSubmittedEnvelopeCDaoImpl.updateofficers(tenderId, openingECofficer);
                }
            }
            System.out.println("flag " + flag);
            if (flag == true) {
                response = "Envelope C is Verified";
            } else {
                response = "Envelope C is not Verified";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return response;
    }

    @ResponseBody
    @RequestMapping("/continuetoEB")
    public String continuetoEB(HttpSession session) throws ParseException {
        System.out.println("continuetoEB ");
        String response = "";
        int tenderId = 0;
        TenderKeyDates tenderKeyDates = null;
        int EA_bidderCount = 0;
        int decrypt_EAbidderCount = 0;
        boolean openingEB = false;

        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        try {

            tenderId = (int) session.getAttribute("tenderId");

            if (tenderId != 0) {
                decrypt_EAbidderCount = decrypt_envelopeADaoImpl.fetchEABidder(tenderId);
            }
            EA_bidderCount = total_EABidderList(tenderId).size();

            if (tenderId != 0) {
                tenderKeyDates = tenderDao.readKeyDate(tenderId);
            }
            if (!tenderKeyDates.getOpeningEB().equals("")) {
                openingEB = sdf.parse(sdf.format(new Date())).getTime() >= sdf.parse(tenderKeyDates.getOpeningEB()).getTime();
            }

            System.out.println("EA_bidderCount " + EA_bidderCount + " decrypt_EAbidderCount " + decrypt_EAbidderCount);

            if (decrypt_EAbidderCount == EA_bidderCount && openingEB == true) {
                System.out.println("Continue to EB ");
                response = "Continue to EB";
            } else {
                System.out.println("Continue to EB is not allowed bcz openingEB " + openingEB + " or decryptbidder != EA_bidder");
                response = "Continue to EB is not allowed";
            }
        } catch (Exception e) {

            e.printStackTrace();
        }

        return response;
    }

    @ResponseBody
    @RequestMapping("/continuetoEC")
    public String continuetoEC(HttpSession session) throws ParseException {
        System.out.println("continuetoEC ");
         Tender tender = null;
        String response = "";
        int tenderId = 0;
        TenderKeyDates tenderKeyDates = null;
        int EB_bidderCount = 0;
        int EQCBSbidderCount=0;
        int decrypt_EBbidderCount = 0;
          int decrypt_EQCBSbidderCount = 0;
        boolean openingEC = false;

        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        try {

            tenderId = (int) session.getAttribute("tenderId");

            System.out.println("TENDER IDDDDDDDDDD"+tenderId);
             tender = tenderDao.read(tenderId);
             System.out.println("Envelop Type"+tender.getEnvelopeType());
             if("4".equals(tender.getEnvelopeType())){
                if (tenderId != 0) {
                decrypt_EQCBSbidderCount = decrypt_envelopeQCBSDaoImpl.fetchEBBidder(String.valueOf(tenderId));
                EQCBSbidderCount = total_QCBSBidderList(tenderId).size();

                tenderKeyDates = tenderDao.readKeyDate(tenderId);
            } 
             }
             else{
            if (tenderId != 0) {
                decrypt_EBbidderCount = decrypt_envelopeBDaoImpl.fetchEBBidder(tenderId);
                EB_bidderCount = total_EBBidderList(tenderId).size();

                tenderKeyDates = tenderDao.readKeyDate(tenderId);
            }
             }
            openingEC = sdf.parse(sdf.format(new Date())).getTime() >= sdf.parse(tenderKeyDates.getOpeningEC()).getTime();

            System.out.println("EB_bidderCount " + EB_bidderCount + " decrypt_EBbidderCount " + decrypt_EBbidderCount+"QCBSEnvelop"+EQCBSbidderCount);

            if("4".equals(tender.getEnvelopeType())){
              if (decrypt_EQCBSbidderCount==EQCBSbidderCount && openingEC == true) {
                System.out.println("Continue to EC");
                response = "Continue to EC";
            } else {
                System.out.println("Continue to EC is not allowed bcz openingEC " + openingEC + " or decryptbidder != EB_bidder");
                response = "Continue to EC is not allowed";
            }  
            }
            else{
            if (decrypt_EBbidderCount == EB_bidderCount && openingEC == true) {
                System.out.println("Continue to EC");
                response = "Continue to EC";
            } else {
                System.out.println("Continue to EC is not allowed bcz openingEC " + openingEC + " or decryptbidder != EB_bidder");
                response = "Continue to EC is not allowed";
            }
            }
        } catch (Exception e) {

            e.printStackTrace();
        }

        return response;
    }

    @RequestMapping("/comparisonsheet")
    public String tenderComparisonSheet(@RequestParam int tenderId, Model m, HttpSession session) {
        System.out.println("Tender Id Is :::: " + tenderId);
        try {
            Integer contId = 1;
            Integer deptUserId = 1;
            //session.getAttribute("tenderId");

            List<Decrypt_envelopeA> decrypt_envelopeA = new ArrayList();
            List<Decrypt_envelopeB> decrypt_envelopeB = new ArrayList();
            List<Decrypt_envelopeC> decrypt_envelopeC = new ArrayList();

            decrypt_envelopeA = decrypt_envelopeADaoImpl.fetchEnvelopeAById(tenderId, contId, deptUserId);
            decrypt_envelopeB = decrypt_envelopeBDaoImpl.fetchEnvelopeBById(tenderId, contId, deptUserId);
            decrypt_envelopeC = envelopeCDataDaoImpl.fetchEnvelopeCEncryById(tenderId, contId, deptUserId);

            if (decrypt_envelopeA != null && decrypt_envelopeB != null && decrypt_envelopeC != null) {
                Tender tender = new Tender();
                tender = tenderDao.read(tenderId);

                m.addAttribute("tender", tender);
                return "Contractor/tenderComparisonsheet";
            } else {
                System.out.println("INSIDE ERROR PAGE ");
                return "Contractor/error";

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Contractor/tenderComparisonsheet";
    }

    @RequestMapping("/viewopenTenderdetails")
    public String viewopenTenderdetails(@RequestParam int tenderId, Model m, HttpSession session) {
        try {
            System.out.println("TENDER ID IS @@@@@@*******  " + tenderId);
            if (session.getAttribute("deptId") != null) {
                int contId = 1;
                int deptUserId = 1;
                Tender tender = new Tender();
                Contractor contractor = new Contractor();
                Contractor contractor1 = new Contractor();
                Contractor contractor2 = new Contractor();
                ContractorDetails contractorDetails = new ContractorDetails();
                tender = tenderDao.read(tenderId);

                List<Integer> decrypt_envelopeA = new ArrayList();
                List<Integer> decrypt_envelopeB = new ArrayList();
                List<Integer> decrypt_envelopeC = new ArrayList();

                decrypt_envelopeA = decrypt_envelopeADaoImpl.fetchEnvelopeAByIdForCs(tenderId, deptUserId);
                decrypt_envelopeB = decrypt_envelopeBDaoImpl.fetchEnvelopeBByIdForCs(tenderId, deptUserId);
                decrypt_envelopeC = envelopeCDataDaoImpl.fetchEnvelopeCEncryByIdForCs(tenderId, deptUserId);

                for (Integer decrypt_envelopeA1 : decrypt_envelopeA) {
                    contractor = contractorDaoImpl.fetchData(decrypt_envelopeA1);
                    contractorDetails = contractorDetailsdaoImpl.fetchData(decrypt_envelopeA1);
                    System.out.println("id  @@@@##" + decrypt_envelopeA1);
                }

                for (Integer decrypt_envelopeA2 : decrypt_envelopeB) {
                    contractor1 = contractorDaoImpl.fetchData(decrypt_envelopeA2);
                    contractorDetails = contractorDetailsdaoImpl.fetchData(decrypt_envelopeA2);
                    System.out.println("id  @@@@##" + decrypt_envelopeA2);
                }
                for (Integer decrypt_envelopeAc : decrypt_envelopeC) {
                    contractor2 = contractorDaoImpl.fetchData(decrypt_envelopeAc);
                    contractorDetails = contractorDetailsdaoImpl.fetchData(decrypt_envelopeAc);
                    System.out.println("id  @@@@##" + decrypt_envelopeAc);
                }

                m.addAttribute("tender", tender);
                m.addAttribute("contractor", contractor);
                m.addAttribute("contractor1", contractor1);
                m.addAttribute("contractor2", contractor2);
                m.addAttribute("contractorDetails", contractorDetails);
            } else {
                System.out.println("Session Time Out");
                session.invalidate();
                return "redirect:/";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Contractor/tenderOpeing";

    }
    
    
  
@RequestMapping(value = "/updateQCBSData", method = RequestMethod.POST)
@ResponseBody
public String updateQCBSData(@RequestBody Map<String, Object> requestData) {
    String response = "";
    try {
        String tenderId = (String) requestData.get("tenderId");
        String contractorId = (String) requestData.get("contractorId");
        List<Map<String, String>> jsonDataList = (List<Map<String, String>>) requestData.get("template");
        System.out.println("Received JSON Data: " + jsonDataList);

        // Create and set template
        TenderOpeningController template = new TenderOpeningController();
        template.setTemplate(jsonDataList);
        System.out.println("Template: " + template);

        // Create a list to hold templates
        List<TenderOpeningController> templates = new ArrayList<>();
        templates.add(template);
        System.out.println("Templates List: " + templates);

        // Convert templates to JSON
        Gson gson = new Gson();
        String json = gson.toJson(templates);
        System.out.println("JSON: " + json);
        System.out.println("JSON Length: " + json.length());

        // Process each row of data in the received list
        for (Map<String, String> rowData : jsonDataList) {
            // Access data from each row and perform necessary actions
            String strUser = rowData.get("strUser");
            String mark = rowData.get("mark");
            String anotherMark = rowData.get("anotherMark");

            // Log the data
            System.out.println("Tender ID: " + tenderId);
            System.out.println("Contractor ID: " + contractorId);
            System.out.println("strUser: " + strUser);
            System.out.println("Mark: " + mark);
            System.out.println("Another Mark: " + anotherMark);
        }

        // Update the data using DAO
        boolean isUpdated = qcbsDataDaoImpl.update(tenderId, Integer.parseInt(contractorId), json);
        if (isUpdated) {
            System.out.println("Data Updated Successfully !!");
            response = "Data Inserted Successfully";
        } else {
            System.out.println("Data Is Not Updated. Error Occurred.");
            response = "Data Update Failed";
        }
    } catch (Exception e) {
        // Log the exception and set error response
        System.out.println("Error processing data: " + e.getMessage());
        response = "Error processing data: " + e.getMessage();
    }
    // Return the response
    return response;
}
}
