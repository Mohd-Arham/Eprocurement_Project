/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderDao;
import com.eproc.dao.TenderDocumentDao;
import com.eproc.dao.TenderKeyDatesDao;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderDocument;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderKeyDatesAmendment;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.transaction.Transactional;
import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Gaurav Dubey
 */
@Repository
public class TenderDaoImpl implements TenderDao,TenderKeyDatesDao,TenderDocumentDao{

    @Autowired
    SessionFactory sessionFactory;
    @Autowired
    AddToCartDaoImpl addToCartDaoImpl;
    @Autowired
    ContractorClassDAOImpl contractorClassDAOImpl;
    @Autowired
    TenderAmendmentDaoImpl tenderAmendmentDaoImpl;
    @Autowired
    DepartmentSecondaryUserDaoImpl departmentSecondaryUserDaoImpl;
    
    @Override
    public int create(Tender tender) throws Exception {
       Session session = null;
       Transaction transaction = null;
       int tender_Id = 0;
       try{
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           System.out.println("The Transaction is: "+transaction);
           System.out.println("The Tender Id before save is: "+tender_Id);
           if(tender.getTender_Id() == 0){
           session.save(tender);
           }else{
           session.saveOrUpdate(tender);    
           }
           tender_Id = tender.getTender_Id();
           System.out.println("The Tender Id after save is: "+tender_Id);
       }catch(Exception ex){           
           ex.printStackTrace();
           transaction.rollback();
       }finally{
           if(transaction != null){ 
               transaction.commit();
           }
           if(session != null){
               session.close();
           }
       }
        return tender_Id;
    }

    @Override
    public Tender read(int tender_Id) throws Exception {
        Session session = null;
        Tender tender = new Tender();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", tender_Id);
            tender = (Tender) query.uniqueResult();
            System.out.println("The Tender Object are: "+tender.getTenderStage());
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender;
    }

    @Override
    public List<Tender> readAll() throws Exception {
        Session session = null;
        List<Tender> tender = new ArrayList<Tender>();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE tenderStatus='Approved' OR tenderStatus='Created' OR tenderStatus='Sent For Approval' ORDER BY tender_Id DESC");
            tender = query.list();
            System.out.println("The Tender Object are: "+tender);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender;
    }

    /*
    * readAlltenderNo
    * Read rhe tender number by dept Id
    * @created 25th Aug 2018
    * Vaishali Gupta
    */
    @Override
    public List readAlltenderNo(Integer deptName) throws Exception {
       Session session = null;
        List <String>tender = new ArrayList<>();
        try{
          session = sessionFactory.openSession();     
          String hql = "SELECT E.tenderNumber FROM Tender E where deptId=:deptId";
          Query query = session.createQuery(hql);
          query.setParameter("deptId", deptName);
          tender = query.list();
          System.out.println("The Tender Object are: "+tender);  
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender;
    }
    
    @Override
    public boolean checkTenderNumber(String tenderNumber) throws Exception {
        boolean existence = false;
        Session session = null;
        List<Tender> tendersList = new ArrayList<Tender>();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE tenderNumber =:tenderNumber");
            query.setParameter("tenderNumber", tenderNumber);
            tendersList = query.list();
            System.out.println("The Tender List size is: "+tendersList.size());
            if(!tendersList.isEmpty()){
                existence = true; 
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
        }   
        return existence;
    }
    
    @Override
    public int update(Tender tender) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateTenderDescription(Tender tender) {
       Session session = null;
       int tender_Id = 0;
        System.out.println("The Tender Id for Update is: "+tender.getTender_Id());
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("UPDATE Tender SET nameOfWork =:nameOfWork, descriptionOfWork =:descriptionOfWork,"
                   + "estimateValueInFig =:estimateValueInFig, estimateValueInWord =:estimateValueInWord, tenderFeeInFig =:tenderFeeInFig,"
                   + "tenderFeeInWord =:tenderFeeInWord, bidValidateType =:bidValidateType, bidValidatePeriod =:bidValidatePeriod,"
                   + "workCompletionType =:workCompletionType ,workCompletionPeriod =:workCompletionPeriod WHERE tender_Id =:tender_Id");
           query.setParameter("nameOfWork", tender.getNameOfWork());
           query.setParameter("descriptionOfWork", tender.getDescriptionOfWork());
           query.setParameter("estimateValueInFig", tender.getEstimateValueInFig());
           query.setParameter("estimateValueInWord", tender.getEstimateValueInWord());
           query.setParameter("tenderFeeInFig", tender.getTenderFeeInFig());
           query.setParameter("tenderFeeInWord", tender.getTenderFeeInWord());
           query.setParameter("bidValidateType", tender.getBidValidateType());
           query.setParameter("bidValidatePeriod", tender.getBidValidatePeriod());
           query.setParameter("workCompletionType", tender.getWorkCompletionType());
           query.setParameter("workCompletionPeriod", tender.getWorkCompletionPeriod());
           query.setParameter("tender_Id", tender.getTender_Id());
           tender_Id = query.executeUpdate();
       }catch(Exception ex){
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
        }
         return tender_Id;
}
    
     @Override
    public String tenderNoticeCreate(String tenderNotice, int tender_Id) throws Exception {
       Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Tender SET tenderNotice =:tenderNotice WHERE tender_Id=:tender_Id");
            query.setParameter("tenderNotice", tenderNotice);
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
        }
       return null;
    }
    
     @Override
    public String tenderStatusCreate(String tenderStatus, int tender_Id) throws Exception {
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Tender SET tenderStatus =:tenderStatus WHERE tender_Id=:tender_Id");
            query.setParameter("tenderStatus", tenderStatus);
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
        }
       return null;
    }
    
    
    @Override
    public String createEnvelopeAInfo(String envelopeAId, int tender_Id, String envelopeAOfficers) throws Exception {
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Tender SET envelopeAId =:envelopeAId, envelopeAOfficers =:envelopeAOfficers WHERE tender_Id=:tender_Id");
            query.setParameter("envelopeAOfficers", envelopeAOfficers);
            query.setParameter("envelopeAId", Integer.parseInt(envelopeAId));
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
        }
       return null;
    }
    
    @Override
    public String createEnvelopeBInfo(String envelopeBId, int tender_Id, String envelopeBOfficers) throws Exception {
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Tender SET envelopeBId =:envelopeBId, envelopeBOfficers =:envelopeBOfficers WHERE tender_Id=:tender_Id");
            query.setParameter("envelopeBOfficers", envelopeBOfficers);
            query.setParameter("envelopeBId", Integer.parseInt(envelopeBId));
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
        }
       return null;
    }
    
    @Override
    public int create(TenderKeyDates tenderKeyDates) throws Exception {
       Session session = null;
       Transaction transaction = null;
       int keyDatesId = 0;
       try{
           System.out.println("The Before key Dates Id: "+tenderKeyDates.getKeyDatesId());
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(tenderKeyDates);
           keyDatesId = tenderKeyDates.getKeyDatesId();
            System.out.println("The After key Dates Id: "+tenderKeyDates.getKeyDatesId());
       }catch(Exception ex){           
           ex.printStackTrace();
           transaction.rollback();
       }finally{
           if(transaction != null){
               transaction.commit();
           }
           if(session != null){
               session.close();
           }
       }
        return keyDatesId;
    }

    @Override
    public TenderKeyDates readKeyDates(int keyDatesId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderKeyDates> readAllKeyDates() throws Exception {
      Session session = null;
      List<TenderKeyDates> keyDateses = new ArrayList<>();
      try{
          session = sessionFactory.openSession();
          Query query = session.createQuery("FROM TenderKeyDates");
          keyDateses = query.list();
      }catch(Exception ex){
          ex.printStackTrace();
      }finally{
           if(session != null){
               session.close();
           }
        }
      return keyDateses;
    }

    @Override
    public int update(TenderKeyDates tenderKeyDates) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteKeyDate(int keyDatesId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderKeyDates> readAllKeyDates(int tender_Id) throws Exception {
        List<TenderKeyDates> tenderKeyDateses = new ArrayList<>();
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderKeyDates WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", String.valueOf(tender_Id));
            tenderKeyDateses = query.list();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return tenderKeyDateses;
    }
   
    @Override
    public TenderKeyDates readKeyDate(int tender_Id) throws Exception {
        TenderKeyDates tenderKeyDateses = null;
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderKeyDates WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", String.valueOf(tender_Id));
            tenderKeyDateses = (TenderKeyDates) query.uniqueResult();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return tenderKeyDateses;
    }
    
    
    
    
    
    @Override
    public String createTenderDocument(TenderDocument document) {
    try{
       Session session = null;
       Transaction transaction = null;
       try{
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(document);          
       }catch(Exception ex){           
           ex.printStackTrace();
           transaction.rollback();
       }finally{
           if(transaction != null){
               transaction.commit();
           }
           if(session != null){
               session.close();
           }
       }
    }catch(Exception ex){
        ex.printStackTrace();
    }
        return null;
    }

    @Override
    public String deleteTenderDocument(int id) {
     Session session = null;
     try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE * FROM TenderDocument WHERE Doc_Id =:Doc_Id");
        query.setParameter("Doc_Id", id);
        query.executeUpdate();
     }catch(Exception ex){
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
     return null;
    }

    @Override
    public String deleteTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId) {
        Session session = null;
        try{
          session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM TenderDocument WHERE tender_Id =:tender_Id AND "
                + "docSequnceId =:docSequnceId");
        query.setParameter("tender_Id", tender_Id);
        query.setParameter("docSequnceId", docSequnceId);
        query.executeUpdate();  
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
         if(session != null){
             session.close();
         }
        return null;
    }
   }

    @Override
    public String deleteTenderDocumentByTenderId(int tender_Id) {
       Session session = null;
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM TenderDocument WHERE tender_Id =:tender_Id");
        query.setParameter("tender_Id", tender_Id);
        query.executeUpdate();  
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
         if(session != null){
             session.close();
         }
    }
     return null;   
    }
    
    @Override
    public TenderDocument fetchTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId) {
        Session session = null;
        TenderDocument tenderDocument =  null;
        try{
          session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderDocument WHERE tender_Id =:tender_Id AND "
                + "docSequnceId =:docSequnceId");
        query.setParameter("tender_Id", tender_Id);
        tenderDocument = (TenderDocument) query.setParameter("docSequnceId", docSequnceId).uniqueResult();
        System.out.println("The Tender Document is: "+tenderDocument);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
         if(session != null){
             session.close();
         }
        //return tenderDocument;
        }
        return tenderDocument;
    }   

    @Override
    public String buyBackDocumentCreate(String buyBackDocument, int tender_Id) throws Exception {
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Tender SET buyBackDocument =:buyBackDocument WHERE tender_Id =:tender_Id");
            query.setParameter("buyBackDocument", buyBackDocument);
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    
    @Override
    public List<TenderDocument> fetchTenderDocumentByTenderId(int tender_Id) {
       Session session = null;
       List<TenderDocument> tenderDocuments = new ArrayList<>();
        System.out.println("The Tender Id is: "+tender_Id);
       try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM TenderDocument WHERE tender_Id =:tender_Id");
         tenderDocuments = query.setParameter("tender_Id", tender_Id).list();
           System.out.println("The Tender Document are: "+tenderDocuments.size());
       }catch(Exception ex){
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
      return tenderDocuments;
    }

    @Override
    public String updateTenderDocumentStatus(int tender_Id, String documentVisibility, int docSequnceId) {
      Session session = null;
      try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("UPDATE TenderDocument SET documentVisibility =:documentVisibility WHERE tender_Id =:tender_Id AND docSequnceId =:docSequnceId");
         query.setParameter("tender_Id", tender_Id);
         query.setParameter("documentVisibility", documentVisibility);
         query.setParameter("docSequnceId", docSequnceId);
         query.executeUpdate();
      }catch(Exception ex){
          ex.printStackTrace();
      }finally{
           if(session != null){
               session.close();
           }
       }
      return null;
    }

    @Override
    public int updateApprovalOfficers(String approvalOfficer, int tender_Id) {
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Tender ten SET ten.approvalOfficer =:approvalOfficer WHERE ten.tender_Id =:tender_Id");
            query.setParameter("approvalOfficer", approvalOfficer);
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return tender_Id;
    }

    @Override
    public List<Tender> readAll(Integer deptId) throws Exception {
        Session session = null;
        List<Tender> tender = new ArrayList<Tender>();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE deptId=:deptId AND (tenderStatus='Approved' OR tenderStatus='Created' OR tenderStatus='Sent For Approval') ORDER BY tender_Id DESC");
            query.setParameter("deptId", deptId);
            tender = query.list();
            System.out.println("The Tender Object are: "+tender.size());
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender;
    }

    @Override
    public List fetchTenderByDeptUser(int deptUserId, int deptId) {
        List<Integer> tenderId= new ArrayList<>();
        List<Tender> tenderforOpening= new ArrayList<>();
        Tender tender=null;
        Session session=null;
        Query query =null;
        String biddingstartdate="";
         Date date=new Date();
          SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
          System.out.println(" current date "+sdf.format(date));
          System.out.println("Department Id: "+deptId+" Department User :"+deptUserId);
        try{
           session = sessionFactory.openSession();
           
              String hql1 = "SELECT  tc.tender_id  FROM tendercreation AS tc LEFT JOIN tendersubmittedenvelopea AS tsd ON tsd.tender_Id=tc.tender_Id LEFT "+
                    "JOIN tendersubmittedenvelopeb AS tsdb ON tsdb.tender_id=tc.tender_Id LEFT JOIN tendersubmittedenvelopec"+
                    " AS tsdc ON tsdc.tender_Id=tc.tender_Id WHERE tc.DeptId = "+deptId+" AND (FIND_IN_SET("+deptUserId+", tsdb.envelopeBofficers) OR "+
                  "FIND_IN_SET("+deptUserId+", tsd.envelopeAofficers ) OR FIND_IN_SET("+deptUserId+", tsdc.envelopeCofficers ))";
//              String hql1 = "SELECT tc.tender_id "
//                     + " FROM tendercreation AS tc LEFT JOIN tendersubmittedenvelopea AS tsd ON tsd.tender_Id=tc.tender_Id LEFT"
//                     + " JOIN tendersubmittedenvelopeb as tsdb ON tsdb.tender_id=tc.tender_Id LEFT JOIN tendersubmittedenvelopec"
//                     + " as tsdc ON tsdc.tender_Id=tc.tender_Id WHERE tc.DeptId LIKE '%"+deptId+"%' AND (tsdb.envelopeBofficers REGEX (,"+deptUserId+",)"
//                     + "tsd.envelopeAofficers LIKE '%"+deptUserId+"%' OR tsdc.envelopeCOfficers LIKE '%"+deptUserId+"%')";
//              
            query = session.createSQLQuery(hql1);
            tenderId=query.list();
            System.out.println(" list Size "+tenderId.size());
            for(Integer commonTenderId :tenderId){
               System.out.println("Tender Id is: "+commonTenderId);
               TenderKeyDates tenderKeyDates = new TenderKeyDates();
                  tender = read(commonTenderId);
                  tenderKeyDates = readKeyDate(commonTenderId);
                  if(tenderKeyDates!=null){
                    tender.setTenderKeyDates(tenderKeyDates);
                    System.out.println("The Opening EA date: "+tenderKeyDates.getOpeningEA());
                    biddingstartdate = tenderKeyDates.getOpeningEA();
                    Date startDate = new Date(biddingstartdate);
                    System.out.println(" biddingstartdate "+biddingstartdate);
                  if(sdf.parse(sdf.format(new Date())).getTime() >= startDate.getTime()){
                tender=read(commonTenderId);
                tenderforOpening.add(tender);
                   }
                  }else{
                  System.out.println("The Key date Not found");
                  System.out.println("Tender Id is: "+commonTenderId);
                  }
                 }
         
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return tenderforOpening;
       }
    
    
    @Override
    public List<Tender> fetchTenderStatus(String Approved, String Amended) {
        Session session = null;
        List<Tender> tenderList = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE tenderStatus=:Approved or tenderStatus=:Amended");
            query.setParameter("Approved", Approved);
            query.setParameter("Amended", Amended);
            tenderList = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return tenderList;
    }
    
    
    @Override
    public List checkTenderTable(int tender_Id) {
        List keyDateObjList = new ArrayList<>();
        TenderKeyDatesAmendment amendmentListData = new TenderKeyDatesAmendment();
        try {
            List<TenderKeyDatesAmendment> tenderKeyDatesAmendmentList = tenderAmendmentDaoImpl.readAllKeyDates(tender_Id);
            if (tenderKeyDatesAmendmentList.size() != 0) {
                for (int i = 0; i < tenderKeyDatesAmendmentList.size(); i++) {
                    amendmentListData = tenderKeyDatesAmendmentList.get(i);
                }
//                System.out.println("@@@~~~ Purchase Date of amend " + tender_Id + " liveTenderList tenderdaoimpl~~~@@@ " + amendmentListData.getTenderPurchaseDate());
                keyDateObjList.add(amendmentListData);
                keyDateObjList.add("amend");
            } else {
                TenderKeyDates tenderKeyDateses = this.readKeyDate(tender_Id);
                if (tenderKeyDateses != null) {
                    keyDateObjList.add(tenderKeyDateses);
                    keyDateObjList.add("approve");
                }
//                System.out.println("@@@~~~ Purchase Date of approve " + tender_Id + " liveTenderList tenderdaoimpl~~~@@@ " + tenderKeyDateses.getTenderPurchaseDate());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return keyDateObjList;
    }
    
    @Override
    public List searchLive(String deptName, String nitNumber, String tender_Number, String contractorClassId,
            String tenderCategoryId, String estimateValueInFig, String emdInFig, String selectiveTenderId,
            String startDate, String endDate) {
        System.out.println("deptName  " + deptName);
        Session session = null;
        String vals = "";
        String tnstartDate = "";
        String tnendDate = "";
        String str1 = "Approved", str2 = "Amended";
        List combinedList = new ArrayList();
        List<Tender> allTenderList = new ArrayList();
//        List<Auction> allAuctionList = new ArrayList();

        TenderKeyDatesAmendment amendmentListData = new TenderKeyDatesAmendment();
        TenderKeyDates tenderKeyDateses = new TenderKeyDates();
        try {
            session = sessionFactory.openSession();
            List<Tender> tenderList2 = this.fetchTenderStatus(str1, str2);
            List<Tender> tenderList = addToCartDaoImpl.liveTenderList(tenderList2);
            for (Tender tenderListData : tenderList) {
                if (deptName.equals(tenderListData.getDeptName())) {
                    allTenderList.add(tenderListData);
                }
                if (nitNumber.equals(tenderListData.getNitNumber())) {
                    allTenderList.add(tenderListData);
                }

                if (contractorClassId.equals(tenderListData.getContractorClass())) {
                    allTenderList.add(tenderListData);
                }
                if (tenderCategoryId.equals(tenderListData.getTenderCategory())) {
                    allTenderList.add(tenderListData);
                }
                if (estimateValueInFig.equals(tenderListData.getEstimateValueInFig())) {
                    allTenderList.add(tenderListData);
                }
                if (emdInFig.equals(tenderListData.getEmdInFig())) {
                    allTenderList.add(tenderListData);
                }
                if (selectiveTenderId.equals(tenderListData.getSelectiveTender())) {
                    allTenderList.add(tenderListData);
                }

                List keyDateObjList = this.checkTenderTable(tenderListData.getTender_Id());
                vals = (String) keyDateObjList.get(1);
                System.out.println("vals " + vals);
                if (!(("").equals(startDate)) || !(("").equals(endDate))) {
                    if ("amend".equals(vals)) {
                        keyDateObjList.remove(1);
                        for (Object keyDateObjData : keyDateObjList) {
                            BeanUtils.copyProperties(amendmentListData, keyDateObjData);
                            tnstartDate = amendmentListData.getTenderPurchaseDate().split("-")[0];
                            tnendDate = amendmentListData.getTenderPurchaseDate().split("-")[1];

                            if (tnstartDate.compareTo(startDate) >= 0) {
                                System.out.println("tnlist ID " + tenderListData.getTender_Id() + " amend tnid " + amendmentListData.getTender_Id());
                                System.out.println(tenderListData.getTender_Id() == Integer.parseInt(amendmentListData.getTender_Id()));
                                if (tenderListData.getTender_Id() == Integer.parseInt(amendmentListData.getTender_Id())) {
                                    System.out.println("Cond true");
                                    allTenderList.add(tenderListData);
                                }
                            }
                            if (tnendDate.compareTo(endDate) >= 0) {
                                System.out.println("tnlist ID " + tenderListData.getTender_Id() + " amend tnid " + amendmentListData.getTender_Id());
                                System.out.println(tenderListData.getTender_Id() == Integer.parseInt(amendmentListData.getTender_Id()));
                                if (tenderListData.getTender_Id() == Integer.parseInt(amendmentListData.getTender_Id())) {
                                    System.out.println("Cond true");
                                    allTenderList.add(tenderListData);
                                }
                            }
                        }
                    } else if ("approve".equals(vals)) {
                        keyDateObjList.remove(1);
                        for (Object keyDateObjData : keyDateObjList) {
                            BeanUtils.copyProperties(tenderKeyDateses, keyDateObjData);
                            tnstartDate = tenderKeyDateses.getTenderPurchaseDate().split("-")[0];
                            tnendDate = tenderKeyDateses.getTenderPurchaseDate().split("-")[1];

                            if (tnstartDate.compareTo(startDate) >= 0) {
                                System.out.println("tnlist ID " + tenderListData.getTender_Id() + " amend tnid " + tenderKeyDateses.getTender_Id());
                                System.out.println(tenderListData.getTender_Id() == Integer.parseInt(tenderKeyDateses.getTender_Id()));
                                if (tenderListData.getTender_Id() == Integer.parseInt(tenderKeyDateses.getTender_Id())) {
                                    System.out.println("Cond true");
                                    allTenderList.add(tenderListData);
                                }
                            }
                            if (tnendDate.compareTo(endDate) >= 0) {
                                System.out.println("tnlist ID " + tenderListData.getTender_Id() + " amend tnid " + tenderKeyDateses.getTender_Id());
                                System.out.println(tenderListData.getTender_Id() == Integer.parseInt(tenderKeyDateses.getTender_Id()));
                                if (tenderListData.getTender_Id() == Integer.parseInt(tenderKeyDateses.getTender_Id())) {
                                    System.out.println("Cond true");
                                    allTenderList.add(tenderListData);
                                }
                            }
                        }
                    }
                }
            }
//                System.out.println(" All Tender List " + allTenderList);
//            List<Auction> auctionList2 = auctionDaoImpl.fetchAuctionStatus(str1, str2);
//            System.out.println("auctionList2  " + auctionList2);
//            List<Auction> auctionList = addToCartDaoImpl.liveAuctionList(auctionList2);
//            System.out.println("auctionList  " + auctionList);
//            for (Auction auctionListData : auctionList) {
//                if (deptName.equals(auctionListData.getDeptName())) {
//                    allAuctionList.add(auctionListData);
//                }
//            }
//            System.out.println(" All Auction List " + allAuctionList);
            combinedList.add(allTenderList);
//            combinedList.add(allAuctionList);
            System.out.println(" All combinedList List " + combinedList);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return combinedList;
    }
    
   public List showApprovalPrivilegeOfficer(Integer deptId){
        System.out.println("/:::::::::::::::Method call to fetch the Approval Officer:::::::::::::::::/");
        List<DepartmentUser> departmentUsers = new ArrayList<>();
        List<DepartmentSecondaryUser> departmentSecondaryUsers = new ArrayList<>();
        List<Object> list = new LinkedList<>();
        try{
            System.out.println("The Department Is: "+deptId);
            if(deptId != 0){
                System.out.println("The Department User are from Primary table: " + departmentUsers.size());
                departmentSecondaryUsers = departmentSecondaryUserDaoImpl.userOfTenderApproval(deptId, "Enable");
               System.out.println("The Department User are from Secondary table: "+departmentSecondaryUsers.size());
               for(DepartmentUser departmentUser:departmentUsers){
                   list.add(departmentUser);
               }
               for(DepartmentSecondaryUser departmentSecondaryUser:departmentSecondaryUsers){
                   list.add(departmentSecondaryUser);
               }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return list;  
    } 
    
   public boolean updatePDFPath(int tender_Id, String sent_for_approval_pdf) {   
        System.out.println("TENDER ID IN UPDATE PDF IS ## "+tender_Id);
        System.out.println("FILE PATH IN UPDATE PDF IS ## "+sent_for_approval_pdf);
          Session session=null;
          Transaction txn=null;
    try
       {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
             txn=session.beginTransaction();
            Query  query=session.createQuery("update Tender set sent_for_approval_pdf=:sent_for_approval_pdf where tender_Id=:tender_Id");
            query.setParameter("sent_for_approval_pdf",sent_for_approval_pdf);
            query.setParameter("tender_Id", tender_Id);
            query.executeUpdate();
            System.out.println(" update uploadSor document");       
           }catch(Exception e){
                txn.rollback();
                System.out.println("Class:UploadSORDaoImpl & Method:updateStatus");
              e.printStackTrace();
          }finally {
        if (txn != null) {
            txn.commit();
        }
                 if(session!=null){
                 session.close();
                 System.out.println("session is closed in update");
                 }
             }
       return true;
    }

    @Override
    public List<Tender> readAllCanceledTender(Integer deptId) throws Exception {
     Session session = null;
        List<Tender> tender = new ArrayList<Tender>();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE deptId=:deptId AND tenderStatus='Canceled' ORDER BY tender_Id DESC");
            query.setParameter("deptId", deptId);
            tender = query.list();
            System.out.println("The Tender Object are: "+tender.size());
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender;    
    }

    @Override
    public List<Tender> getAllApprovedTender()  {
         Session session = null;
        List<Tender> tender = new ArrayList<Tender>();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Tender WHERE tenderStatus='Approved' OR tenderStatus='Amended'  ORDER BY tender_Id DESC");
            tender = query.list();
            System.out.println("The Tender Object are: "+tender);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender; //To change body of generated methods, choose Tools | Templates.
    }
    
}
