package com.eproc.dao;

import com.eproc.domain.QCBSMarkTemplate;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QCBSMarkTemplateDao {

    @Autowired
    SessionFactory sessionFactory;
    
   //Save or Update Mark template after filling details
   public  String saveorUpdateMarkTemplate(QCBSMarkTemplate markTemplate) {
      Session session = null;
      String status = null;
      try {
          System.out.println("Insaid Save Or Update QCBS Mark Template:---- "+markTemplate);
          session = sessionFactory.openSession();

         if (markTemplate.getMarkTemplate() != null) {
             System.out.println("Insaid If Condtion Dao  "+markTemplate.getMarkTemplate());
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(markTemplate);
            txn.commit();
            status = "success";
         }
      } catch (Exception ex) {
         ex.printStackTrace();
         status = "failure";
      } finally {
         if (session != null) {
            session.close();
         }
      }
      return status;
   }

   //Save or Update Mark template after filling details
//   public static String updateMarkTemplateByDepartment(QCBSMarkTemplate markTemplate) {
//      Session session = null;
//      String status = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//
//         if (markTemplate.getMarkTemplate() != null) {
//            Transaction txn = session.beginTransaction();
//            Query query = session.createQuery("UPDATE QCBSMarkTemplate set markTemplateForDept =:template, EBApplyAction =:EBApplyAction WHERE markTemplateId =:markTemplateId");
//            query.setParameter("template", markTemplate.getMarkTemplate());
//            query.setParameter("EBApplyAction", "Verified");
//            query.setParameter("markTemplateId", markTemplate.getMarkTemplateId());
//            Integer i = query.executeUpdate();
//            System.out.println("mark template update status by department is : " + i);
//            txn.commit();
//            status = "success";
//         }
//      } catch (Exception ex) {
//         ex.printStackTrace();
//         status = "failure";
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return status;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
   public  QCBSMarkTemplate fetchMarkTemplate(String qcbsTenderId) {
      Session session = null;
      QCBSMarkTemplate markTemplate = null;
      try {
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId");
         query.setParameter("tenderId", qcbsTenderId);
         markTemplate = (QCBSMarkTemplate) query.uniqueResult();
         System.out.println("qcbsTenderId is : " + qcbsTenderId);

      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (session != null) {
            session.close();
         }
      }
      return markTemplate;
   }

//   //prepare list of dynamic template, After parsing json data
//   public static List<QCBSTemplateDTO> prepareQCBSMarkTemplateData_withoutDeptAction(String jsonData) {
//      List<QCBSTemplateDTO> templateList = new ArrayList<QCBSTemplateDTO>();
//      try {
//         JSONArray jsonArray = new JSONArray(jsonData);
//         System.out.println("Json array size is : " + jsonArray.length());
//         for (int i = 0; i < jsonArray.length(); i++) {
//            QCBSTemplateDTO temp = new QCBSTemplateDTO();
//            Map map = new LinkedHashMap();
//            JSONObject object = jsonArray.getJSONObject(i);
//            temp.setQuestion(object.getString("question"));
//            temp.setFilePath(object.getString("filePath"));
//            temp.setFileName(object.getString("fileName"));
//            temp.setContrMark(object.getString("contrMark"));
//
//            System.out.println("File : " + temp.getFileName() + " & filePath : " + temp.getFilePath());
//
//            JSONArray jsonmark = object.getJSONArray("mark");
//            List<String> markList = new ArrayList<String>();
//            for (int k = 0; k < jsonmark.length(); k++) {
//               markList.add(jsonmark.getString(k));
//            }
//
//            JSONArray jsonparameter = object.getJSONArray("parameter");
//            List<String> parameterList = new ArrayList<String>();
//            for (int k = 0; k < jsonparameter.length(); k++) {
//               parameterList.add(jsonparameter.getString(k));
//            }
//
//            for (int j = 0; j < markList.size(); j++) {
//               map.put(Integer.parseInt(markList.get(j)), parameterList.get(j));
//            }
//            System.out.println("map for " + (i + 1) + " : " + map);
//            temp.setCriteria(map);
//            templateList.add(temp);
//            System.out.println("temp : " + temp);
//         }  // end of outer loop
//
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      return templateList;
//   }
//
//   //prepare list of dynamic template, After parsing json data
//   public static List<QCBSTemplateDTO> prepareQCBSMarkTemplateData_Dept(String jsonData) {
//      List<QCBSTemplateDTO> templateList = new ArrayList<QCBSTemplateDTO>();
//      try {
//         JSONArray jsonArray = new JSONArray(jsonData);
//         System.out.println("Json array size is : " + jsonArray.length());
//         for (int i = 0; i < jsonArray.length(); i++) {
//            QCBSTemplateDTO temp = new QCBSTemplateDTO();
//            Map map = new LinkedHashMap();
//            JSONObject object = jsonArray.getJSONObject(i);
//            temp.setQuestion(object.getString("question"));
//            temp.setFilePath(object.getString("filePath"));
//            temp.setFileName(object.getString("fileName"));
//            temp.setContrMark(object.getString("contrMark"));
//            if (object.getString("actualMark") != null) {
//               temp.setActualMark(object.getString("actualMark"));
//               temp.setRemark(object.getString("remark"));
//            }
//
//            System.out.println("File : " + temp.getFileName() + " & filePath : " + temp.getFilePath());
//
//            JSONArray jsonmark = object.getJSONArray("mark");
//            List<String> markList = new ArrayList<String>();
//            for (int k = 0; k < jsonmark.length(); k++) {
//               markList.add(jsonmark.getString(k));
//            }
//
//            JSONArray jsonparameter = object.getJSONArray("parameter");
//            List<String> parameterList = new ArrayList<String>();
//            for (int k = 0; k < jsonparameter.length(); k++) {
//               parameterList.add(jsonparameter.getString(k));
//            }
//
//            for (int j = 0; j < markList.size(); j++) {
//               map.put(Integer.parseInt(markList.get(j)), parameterList.get(j));
//            }
//            System.out.println("map for " + (i + 1) + " : " + map);
//            temp.setCriteria(map);
//            templateList.add(temp);
//            System.out.println("temp : " + temp);
//         }  // end of outer loop
//
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      return templateList;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static QCBSMarkTemplate fetchMarkTemplateByTenderId_ContrId(String tenderId, String contrId) {
//      Session session = null;
//      QCBSMarkTemplate markTemplate = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId AND contractorId =:contrId");
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contrId", contrId);
//         markTemplate = (QCBSMarkTemplate) query.uniqueResult();
//         System.out.println("markTemplate is : " + markTemplate);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return markTemplate;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static List<QCBSMarkTemplate> fetchMarkTemplateByTenderId(String tenderId) {
//      Session session = null;
//      List<QCBSMarkTemplate> markTemplateList = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId");
//         query.setParameter("tenderId", tenderId);
//         markTemplateList = query.list();
//         System.out.println("markTemplateList size is : " + markTemplateList.size());
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return markTemplateList;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static boolean checkQCBSEnvelopeOpening(String tenderId) {
//      Session session = null;
//      boolean openStatus = true;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId");
//         query.setParameter("tenderId", tenderId);
//         List<QCBSMarkTemplate> markTemplateList = query.list();
//         System.out.println("markTemplateList size is : " + markTemplateList.size());
//
//         for (QCBSMarkTemplate temp : markTemplateList) {
//            System.out.println("EB open status is : " + temp.getEBOpenStatus());
//            if (temp.getEBOpenStatus() == null || "notopen".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//         }
//         System.out.println("qcbs EB open status is  : " + openStatus);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return openStatus;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static String checkQCBSEnvelopeOpeningStatus(String tenderId, String contractorId, String status) {
//      Session session = null;
//      String openStatus = "false";
//      try {
//         System.out.println("tenderId : " + tenderId + " & contractorId  : " + contractorId);
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId AND contractorId =:contractorId");
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contractorId", contractorId);
//         QCBSMarkTemplate markTemplate = (QCBSMarkTemplate) query.uniqueResult();
//         System.out.println("markTemplateList is : " + markTemplate);
//
//         if (markTemplate != null) {
//            if (status.equals("check_open")) {
//               if ("open".equals(markTemplate.getEBOpenStatus())) {
//                  openStatus = "false";
//               }
//            }
//
//            if (status.equals("check_action_applied")) {
//               if ("Verified".equals(markTemplate.getEBApplyAction())) {
//                  openStatus = "true";
//               } else {
//                  openStatus = "false";
//               }
//            }
//
//         }
//         System.out.println("qcbs EB open status is  : " + openStatus);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return openStatus;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static void updateQCBS_MT_OpenStatus(String tenderId, String contractorId) {
//      Session session = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("UPDATE QCBSMarkTemplate set EBOpenStatus =:status WHERE tenderId =:tenderId AND contractorId =:contractorId");
//         query.setParameter("status", "open");
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contractorId", contractorId);
//         Integer i = query.executeUpdate();
//         System.out.println("QCBS markTemplate open status is : " + i);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static boolean checkQCBSEnvelopeOpening_eligibilityOpenEC(String tenderId) {
//      Session session = null;
//      boolean openStatus = true;
//      List<String> selectedContractors = new ArrayList();
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         
//         // fetch purchased contractor id for that tender
//         List<CpmTenderPurchaseContractor> purchasedContractorId = ContractorReceiptDao.getAllPurchageContracatorId(Integer.parseInt(tenderId));
//
//         // get not selected contractor
//         if (purchasedContractorId != null && !purchasedContractorId.isEmpty()) {
//
//            Iterator it = purchasedContractorId.iterator();
//            while (it.hasNext()) {
//               CpmTenderPurchaseContractor purchaseTenderDetail = (CpmTenderPurchaseContractor) it.next();
//               List<EnvelopeATemplate> envelopeA = SaveEnvelopeADao.fetchEnvelopeA(Integer.parseInt(tenderId), purchaseTenderDetail.getContractorId());
//               QCBSMarkTemplate markTemplate = QCBSMarkTemplateDao.fetchMarkTemplateByTenderId_ContrId(tenderId+"", purchaseTenderDetail.getContractorId()+"");
//               List<ContractorSaveBid> envelopeC = ContractorSaveBidDao.fetchEnvelopeCDataByTenderIdAndContractorId(Integer.parseInt(tenderId), String.valueOf(purchaseTenderDetail.getContractorId()));
//               
//               if (((envelopeA != null && !envelopeA.isEmpty()) && (markTemplate != null)) && envelopeC != null && !envelopeC.isEmpty()) {
//                  System.out.println("selected contractor id's :" + purchaseTenderDetail.getContractorId());
//                  selectedContractors.add(purchaseTenderDetail.getContractorId()+"");
//               }
//            }
//         }
//         
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId AND contractorId IN (:regId1)");
//         query.setParameter("tenderId", tenderId);
//         query.setParameterList("regId1", selectedContractors);
//         List<QCBSMarkTemplate> markTemplateList = query.list();
//         System.out.println("markTemplateList size is : " + markTemplateList.size());
//         
//         for (QCBSMarkTemplate temp : markTemplateList) {
//            System.out.println("EB open status is : " + temp.getEBOpenStatus());
//            if ((temp.getEBOpenStatus() == null || "notopen".equals(temp.getEBOpenStatus()) || "".equals(temp.getEBOpenStatus())) && !"rejectONEA".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//            if (temp.getEBApplyAction() == null || "".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//         }
//         System.out.println("qcbs EB open status is  : " + openStatus);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return openStatus;
//   }
//   
//   //For fetching qcbs marktemplate by marktemplateId
//   public static boolean checkQCBSEnvelopeOpening_eligibilityOpenECTwoStage(String tenderId) {
//      Session session = null;
//      boolean openStatus = true;
//      List<String> selectedContractors = new ArrayList();
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         
//         // fetch purchased contractor id for that tender
//         List<CpmTenderPurchaseContractor> purchasedContractorId = ContractorReceiptDao.getAllPurchageContracatorId(Integer.parseInt(tenderId));
//
//         // get not selected contractor
//         if (purchasedContractorId != null && !purchasedContractorId.isEmpty()) {
//
//            Iterator it = purchasedContractorId.iterator();
//            while (it.hasNext()) {
//               CpmTenderPurchaseContractor purchaseTenderDetail = (CpmTenderPurchaseContractor) it.next();
//               List<EnvelopeATemplate> envelopeA = SaveEnvelopeADao.fetchEnvelopeA(Integer.parseInt(tenderId), purchaseTenderDetail.getContractorId());
//               QCBSMarkTemplate markTemplate = QCBSMarkTemplateDao.fetchMarkTemplateByTenderId_ContrId(tenderId+"", purchaseTenderDetail.getContractorId()+"");
////               List<ContractorSaveBid> envelopeC = ContractorSaveBidDao.fetchEnvelopeCDataByTenderIdAndContractorId(Integer.parseInt(tenderId), String.valueOf(purchaseTenderDetail.getContractorId()));
//               
//               if ((envelopeA != null && !envelopeA.isEmpty() && markTemplate != null)) {
//                  System.out.println("selected contractor id's :" + purchaseTenderDetail.getContractorId());
//                  selectedContractors.add(purchaseTenderDetail.getContractorId()+"");
//               }
//            }
//         }
//         
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId AND contractorId IN (:regId1)");
//         query.setParameter("tenderId", tenderId);
//         query.setParameterList("regId1", selectedContractors);
//         List<QCBSMarkTemplate> markTemplateList = query.list();
//         System.out.println("markTemplateList size is : " + markTemplateList.size());
//         
//         for (QCBSMarkTemplate temp : markTemplateList) {
//            System.out.println("EB open status is : " + temp.getEBOpenStatus());
//            if ((temp.getEBOpenStatus() == null || "notopen".equals(temp.getEBOpenStatus()) || "".equals(temp.getEBOpenStatus())) && !"rejectONEA".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//            if (temp.getEBApplyAction() == null || "".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//         }
//         System.out.println("qcbs EB open status is  : " + openStatus);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return openStatus;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static String checkQCBSEnvelopeOpening_eligibilityOpenEC(String tenderId, String contractorId) {
//      Session session = null;
//      boolean openStatus = true;
//      String status = "";
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId AND contractorId=:contractorId");
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contractorId", contractorId);
//         List<QCBSMarkTemplate> markTemplateList = query.list();
//         System.out.println("markTemplateList size is : " + markTemplateList.size());
//
//         for (QCBSMarkTemplate temp : markTemplateList) {
//            System.out.println("EB open status is : " + temp.getEBOpenStatus());
//            if ((temp.getEBOpenStatus() == null || "notopen".equals(temp.getEBOpenStatus()) || "".equals(temp.getEBOpenStatus())) && !"rejectONEA".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//            if (temp.getEBApplyAction() == null || "".equals(temp.getEBOpenStatus())) {
//               openStatus = false;
//            }
//         }
//         System.out.println("qcbs EB open status is  : " + openStatus);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      if (openStatus) {
//         status = "sb";
//      } else {
//         status = "rb";
//      }
//
//      return status;
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static void updateQCBS_MT_DuringRejectEA(String tenderId, String contractorId) {
//      Session session = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("UPDATE QCBSMarkTemplate set EBOpenStatus =:status, EBApplyAction =:ebaction WHERE tenderId =:tenderId AND contractorId =:contractorId");
//         query.setParameter("status", "rejectONEA");
//         query.setParameter("ebaction", "rejectONEA");
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contractorId", contractorId);
//         Integer i = query.executeUpdate();
//         System.out.println("QCBS markTemplate update during reject contractor on EA : " + i);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static void updateQCBS_MT_DuringRevertEA(String tenderId, String contractorId) {
//      Session session = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("UPDATE QCBSMarkTemplate set EBOpenStatus =:status, EBApplyAction =:ebaction WHERE tenderId =:tenderId AND contractorId =:contractorId");
//         query.setParameter("status", null);
//         query.setParameter("ebaction", null);
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contractorId", contractorId);
//         Integer i = query.executeUpdate();
//         System.out.println("QCBS markTemplate update during reject contractor on EA : " + i);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//   }
//
//   //For fetching qcbs marktemplate by marktemplateId
//   public static QCBSMarkTemplate fetchMarkTemplateByTenderIdOne(String tenderId) {
//      Session session = null;
//      QCBSMarkTemplate markTemplate = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSMarkTemplate WHERE tenderId =:tenderId");
//         query.setParameter("tenderId", tenderId);
//         query.setMaxResults(1);
//         markTemplate = (QCBSMarkTemplate) query.uniqueResult();
//         System.out.println("markTemplate is : " + markTemplate);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return markTemplate;
//   }
//
//   public static String checkBidOpenedStatusOf_CurrentBidder(Integer tenderId, String userId) {
//      QCBSMarkTemplate template = null;
//      String status = "none";
//      try {
//         template = fetchMarkTemplateByTenderIdOne(tenderId + "");
//         if (template != null && !userId.equals(template.getFirstBidderId())) {
//            updateBidOpenStatusOf_FirstOfficer(tenderId, userId);
//         }
//
//         template = fetchMarkTemplateByTenderIdOne(tenderId + "");
//         if (template != null && template.getFirstAuthorityOpenStatus() == 1) {
//            status = "openByOneOfficer";
//         } else if (template != null && template.getFirstAuthorityOpenStatus() >= 2) {
//            status = "open";
//         }
//
//         System.out.println("@@@@@@@@@@@@@ Operation Performed Status For QCBS By This Officer : " + status + ", Officer Id is : " + userId);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      }
//      return status;
//   }
//
//   public static boolean checkBidOpenedStatusOf_CurrentBidder_1(Integer tenderId, String userId) {
//      QCBSMarkTemplate template = null;
//      boolean status = false;
//      try {
//         template = fetchMarkTemplateByTenderIdOne(tenderId + "");
//         if (template != null && userId.equals(template.getFirstBidderId()) && template.getFirstAuthorityOpenStatus() == 1) {
//            status = true;
//         }
//
//         System.out.println("check qcbs envelope open by this officer status : " + status + ", Officer Id is : " + userId);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      }
//      return status;
//   }
//
//   public static int updateBidOpenStatusOf_FirstOfficer(Integer tenderId, String userId) {
//      int i = 0;
//      Session session = null;
//      Integer count = 0;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Transaction transaction = session.beginTransaction();
//         Query query = session.createQuery("UPDATE QCBSMarkTemplate SET firstAuthorityOpenStatus =:status, firstBidderId =:fbi WHERE tenderId =:tenderId");
//
//         count = 1 + fetch_noOfofficerBidOpen(tenderId);
//         query.setParameter("status", count);
//         query.setParameter("fbi", userId);
//         query.setParameter("tenderId", tenderId + "");
//         i = query.executeUpdate();
//         transaction.commit();
//         System.out.println("Opening Authority OF level " + count + " Performed Operation for QCBS successfully, Updated row count is : " + i);
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return i;
//   }
//
//   public static Integer fetch_noOfofficerBidOpen(Integer tenderId) {
//      System.out.println("inside fetchFirstOfficerId method");
//      Integer count = 0;
//      Session session = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("SELECT firstAuthorityOpenStatus FROM QCBSMarkTemplate WHERE tenderId =:tenderId");
//         query.setParameter("tenderId", tenderId + "");
//         query.setMaxResults(1);
//         count = (Integer) query.uniqueResult();
//         if (count == null) {
//            count = 0;
//         }
//         System.out.println("@@@@@@@@@@@@@ Officer no who perform opening process on QCBS is : " + count + 1);
//
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//      return count;
//   }

}
