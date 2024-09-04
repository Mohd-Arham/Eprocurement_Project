/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderSubmittedEnvelopeCDao;
import com.eproc.domain.TenderSubmittedEnvelopeC;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * <h1>TenderSubmittedEnvelopeBDaoImpl</h1>
 * <p>This program handle all the request for database</p>
 * 
 * @author Gaurav Dubey
 * @since 7 Sep 2018
 * @version 2.0.0
 */
@Repository
public class TenderSubmittedEnvelopeCDaoImpl implements TenderSubmittedEnvelopeCDao{
    
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public int create(TenderSubmittedEnvelopeC submittedEnvelopeC) throws Exception {
        
         Session session = null;
      Transaction transaction = null;
      int envelopeC_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(submittedEnvelopeC);
           envelopeC_Id = submittedEnvelopeC.getSubmittedEnvelopeC_Id();
           System.out.println("The Envelope A Id: "+envelopeC_Id);
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
      return envelopeC_Id;
    }

    @Override
    public TenderSubmittedEnvelopeC read(int tender_Id) throws Exception {
        Session session = null;
        TenderSubmittedEnvelopeC tenderSubmittedEnvelopeC = new TenderSubmittedEnvelopeC();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderSubmittedEnvelopeC WHERE tender_Id =:tender_Id");
            tenderSubmittedEnvelopeC = (TenderSubmittedEnvelopeC) query.setParameter("tender_Id", tender_Id).uniqueResult();
            System.out.println("The Envelope C officer are: "+tenderSubmittedEnvelopeC);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
        return tenderSubmittedEnvelopeC;
    }

    @Override
    public List<TenderSubmittedEnvelopeC> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderSubmittedEnvelopeC> readAll(int envelopeC_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(TenderSubmittedEnvelopeC submittedEnvelopeC) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int envelopeC_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     @Override
    public boolean updateofficers(Integer tender_Id,String openedEAOfficers){
        Session session = null;
        
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE TenderSubmittedEnvelopeC SET openedECOfficers =:openedECOfficers WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("openedECOfficers", openedEAOfficers);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:TenderSubmittedEnvelopeADaoImpl \n Method:update");
            System.out.println("Exception in update method of TenderSubmittedEnvelopeCDaoImpl  " + ex.getMessage());
            return false;
        } finally {
            session.close();
        }
        System.out.println(".............End updateShortlistedContrctrStatus method of EnvelopeBDataDaoImpl..............");
        return true;
    }

   

}
