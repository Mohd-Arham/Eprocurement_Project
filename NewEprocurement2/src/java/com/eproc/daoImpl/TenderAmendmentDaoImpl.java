/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderAmendmentDao;
import com.eproc.dao.TenderAmendmentKeyDatesDao;
import com.eproc.dao.TenderDocumentAmendmentDao;
import com.eproc.dao.TenderTemporaryAmendDocumentDao;
import com.eproc.domain.TenderAmendment;
import com.eproc.domain.TenderDocument;
import com.eproc.domain.TenderDocumentAmendment;
import com.eproc.domain.TenderKeyDatesAmendment;
import com.eproc.domain.TenderTemporaryAmendDocument;
import java.util.ArrayList;
import java.util.List;
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
public class TenderAmendmentDaoImpl implements TenderAmendmentDao, TenderAmendmentKeyDatesDao, TenderDocumentAmendmentDao, TenderTemporaryAmendDocumentDao{

    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public int create(TenderAmendment tenderAmendment) throws Exception {
       Session session = null;
       Transaction transaction = null;
       int tender_Id = 0;
       try{
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           System.out.println("The Tender Id before save is: "+tender_Id);
           session.saveOrUpdate(tenderAmendment);
           System.out.println("The Tender Id after save is: "+tenderAmendment.getTenderAmend_Id());
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
        return tenderAmendment.getTenderAmend_Id();
    }

    @Override
    public TenderAmendment read(int tenderAmend_Id) throws Exception {
      TenderAmendment amendment = new TenderAmendment();
      Session session = null;
      try{
          session = sessionFactory.openSession();
          amendment = (TenderAmendment) session.createQuery("FROM TenderAmendment WHERE tenderAmend_Id =:tenderAmend_Id").setParameter("tenderAmend_Id", tenderAmend_Id).uniqueResult();
      }catch(Exception ex){
          ex.printStackTrace();
      }
      return amendment;  
    }

     @Override
    public List<TenderAmendment> readAll(int tender_Id) throws Exception {
       Session session = null;
       List<TenderAmendment> tenderAmendments = new ArrayList<>();
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM TenderAmendment WHERE tender_Id =:tender_Id");
           query.setParameter("tender_Id", tender_Id);
           tenderAmendments = query.list();
           System.out.println("The Tender Ammendment: "+tenderAmendments.size());
       }catch(Exception e){
           e.printStackTrace();
       }
      return tenderAmendments;
    }
    
    @Override
    public List<TenderAmendment> readAll() throws Exception {
        Session session = null;
       List<TenderAmendment> tenderAmendments = new ArrayList<>();
       try{
           session = sessionFactory.openSession();
         
          Query query = session.createQuery("FROM TenderAmendment ta WHERE ta.tenderAmend_Id IN(SELECT MAX(tenderAmend_Id) FROM TenderAmendment GROUP BY tender_Id)");
           tenderAmendments = query.list(); 
           System.out.println("The Tender Ammendment: "+tenderAmendments.size());
       }catch(Exception e){
           e.printStackTrace();
       }finally{
           if(session!=null){
               session.close();
           }
       }
      return tenderAmendments;
    }

    @Override
    public List readAlltenderNo(Integer deptName) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(TenderAmendment tenderAmendment) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String buyBackDocumentCreate(String buyBackDocument, int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String tenderNoticeCreate(String tenderNotice, int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String tenderStatusCreate(String tenderStatus, int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createEnvelopeAInfo(String envelopeAId, int tender_Id, String envelopeAOfficers) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createEnvelopeBInfo(String envelopeAId, int tender_Id, String envelopeBOfficers) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean checkTenderNumber(String tenderNumber) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateTenderDescription(TenderAmendment tenderAmendment) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int create(TenderKeyDatesAmendment tenderKeyDatesAmendment) throws Exception {
       Session session = null;
       Transaction transaction = null;
       int keyDatesAmendId = 0;
       try{
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(tenderKeyDatesAmendment);
           keyDatesAmendId = tenderKeyDatesAmendment.getKeyDatesAmendId();
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
        return keyDatesAmendId;
    }

    @Override
    public TenderKeyDatesAmendment readKeyDates(int keyDatesId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderKeyDatesAmendment> readAllKeyDates() throws Exception {
        List<TenderKeyDatesAmendment> amendments = new ArrayList<>();
        Session session = null;
        try{
            session = sessionFactory.openSession();
            amendments = session.createQuery("FROM TenderKeyDatesAmendment ORDER BY tender_Id DESC LIMIT 1").list();
            System.out.println("The Ammend keydate are: "+amendments.size());
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session!=null){
               session.close();
           }
       }
        return amendments;
    }

    @Override
    public int update(TenderKeyDatesAmendment tenderKeyDatesAmendment) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteKeyDate(int keyDatesId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderKeyDatesAmendment> readAllKeyDates(int tender_Id) throws Exception {
    Session session = null;
    List<TenderKeyDatesAmendment> datesAmendments = new ArrayList<>();
    try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderKeyDatesAmendment WHERE tender_Id =:tender_Id");
        query.setParameter("tender_Id", String.valueOf(tender_Id));
        datesAmendments = query.list();
        System.out.println("Teh Key date size: "+datesAmendments.size());
    }catch(Exception ex){
        ex.printStackTrace();
    }
     return datesAmendments;
    }

    @Override
    public TenderKeyDatesAmendment readKeyDate(int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createTenderDocument(TenderDocumentAmendment documentAmendment) {
       Session session = null;
       Transaction transaction = null;
       int keyDatesAmendId = 0;
       try{
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(documentAmendment);
           keyDatesAmendId = documentAmendment.getDoc_Id();
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
     return String.valueOf(keyDatesAmendId);
    }

    @Override
    public TenderDocumentAmendment fetchTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String deleteTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String deleteTenderDocument(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderDocumentAmendment> fetchTenderDocumentByTenderId(int tender_Id) {
    Session session = null;
    List<TenderDocumentAmendment> amendments = new ArrayList<>();
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderDocumentAmendment WHERE tender_Id =:tender_Id");
        query.setParameter("tender_Id", tender_Id);
        amendments = query.list();
        System.out.println("Teh Amendment Document of tender: "+amendments.size());
    }catch(Exception ex){
        ex.printStackTrace();
    }
        return amendments;
    }

    @Override
    public String updateTenderDocumentStatus(int tender_Id, String documentVisibility, int docSequnceId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String deleteTenderDocumentByTenderId(int tender_Id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createTenderTemporaryDocument(TenderTemporaryAmendDocument temporaryAmendDocument) {
       Session session = null;
       Transaction transaction = null;
       try{
           session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(temporaryAmendDocument);
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
        return null;
    }

    @Override
    public TenderTemporaryAmendDocument fetchTenderTemporaryDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId) {
        Session session = null;
        TenderTemporaryAmendDocument tenderTemporaryAmendDocument =  null;
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderTemporaryAmendDocument WHERE tender_Id =:tender_Id AND "
                + "docSequnceId =:docSequnceId");
        query.setParameter("tender_Id", tender_Id);
        tenderTemporaryAmendDocument =  (TenderTemporaryAmendDocument) query.setParameter("docSequnceId", docSequnceId).uniqueResult();
        System.out.println("The Tender Document is: "+tenderTemporaryAmendDocument);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
         if(session != null){
             session.close();
         }
        //return tenderDocument;
        }
        return tenderTemporaryAmendDocument;
    }

    @Override
    public String deleteTenderTemporaryDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId) {
       Session session = null;
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM TenderTemporaryAmendDocument WHERE tender_Id =:tender_Id AND "
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
       }
     return null;
    }

    @Override
    public String deleteTenderTemporaryDocument(int tender_Id) {
       Session session = null;
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM TenderTemporaryAmendDocument WHERE tender_Id =:tender_Id");
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
    public List<TenderTemporaryAmendDocument> fetchTenderTemporaryDocumentByTenderId(int tender_Id) {
        Session session = null;
       List<TenderTemporaryAmendDocument> amendDocuments = new ArrayList<>();
        System.out.println("The Tender Id is: "+tender_Id);
       try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM TenderTemporaryAmendDocument WHERE tender_Id =:tender_Id");
         amendDocuments = query.setParameter("tender_Id", tender_Id).list();
           System.out.println("The Tender Document are: "+amendDocuments.size());
       }catch(Exception ex){
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
      return amendDocuments;
    }

    @Override
    public String updateTenderTemporaryDocumentStatus(int tender_Id, String documentVisibility, int docSequnceId) {
        Session session = null;
      try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("UPDATE TenderTemporaryAmendDocument SET documentVisibility =:documentVisibility WHERE tender_Id =:tender_Id AND docSequnceId =:docSequnceId");
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
    public String deleteTenderTemporaryDocumentByTenderId(int tender_Id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TenderKeyDatesAmendment readLastKeyDate(int tender_Id) throws Exception {
        System.out.println("The Tender Id is : "+tender_Id);
        Session session = null;
        TenderKeyDatesAmendment amendment = new TenderKeyDatesAmendment();
        try{
           session = sessionFactory.openSession();
           
           Query query = session.createQuery("FROM TenderKeyDatesAmendment ta WHERE ta.keyDatesAmendId IN(SELECT MAX(keyDatesAmendId) FROM TenderKeyDatesAmendment WHERE tender_Id =:tender_Id)");
           amendment = (TenderKeyDatesAmendment) query.setParameter("tender_Id", String.valueOf(tender_Id)).uniqueResult();
            System.out.println("The Amendment Key dates are: "+amendment);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return amendment;
    }

    @Override
    public List<TenderAmendment> readAll(Integer deptId) throws Exception {
        Session session = null;
       List<TenderAmendment> tenderAmendments = new ArrayList<>();
       try{
           session = sessionFactory.openSession();
         
          Query query = session.createQuery("FROM TenderAmendment ta WHERE ta.deptId=:deptId AND ta.tenderAmend_Id IN(SELECT MAX(tenderAmend_Id) FROM TenderAmendment GROUP BY tender_Id)");
          query.setParameter("deptId", deptId);
           tenderAmendments = query.list(); 
           System.out.println("The Tender Ammendment: "+tenderAmendments.size());
       }catch(Exception e){
           e.printStackTrace();
       }finally{
           if(session!=null){
               session.close();
           }
       }
      return tenderAmendments;
    }

   
    
}
