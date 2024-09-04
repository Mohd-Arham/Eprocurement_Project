/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderSubmittedEnvelopeADao;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * <h1>TenderSubmittedEnvelopeADaoImpl</h1>
 * <p>This program handle all the request for database</p>
 * 
 * @author Gaurav Dubey
 * @since 7 Sep 2018
 * @version 2.0.0
 */
@Repository
public class TenderSubmittedEnvelopeADaoImpl implements TenderSubmittedEnvelopeADao{
  
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public int create(TenderSubmittedEnvelopeA submittedEnvelopeA) throws Exception {
      Session session = null;
      Transaction transaction = null;
      int envelopeA_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(submittedEnvelopeA);
           envelopeA_Id = submittedEnvelopeA.getSubmittedEnvelopeA_Id();
           System.out.println("The Envelope A Id: "+envelopeA_Id);
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
      return envelopeA_Id; 
    }

    @Override
    public TenderSubmittedEnvelopeA read(int tender_Id) throws Exception {
       Session session = null;
       TenderSubmittedEnvelopeA submittedEnvelopeA = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM TenderSubmittedEnvelopeA WHERE tender_Id =:tender_Id");
           submittedEnvelopeA = (TenderSubmittedEnvelopeA) query.setParameter("tender_Id", tender_Id).uniqueResult();
           System.out.println("The Submitted Envelope A Datass: "+submittedEnvelopeA);
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return submittedEnvelopeA;
    }

    @Override
    public List<TenderSubmittedEnvelopeA> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderSubmittedEnvelopeA> readAll(int envelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   @Override
    public boolean update(Integer tender_Id,String openedEAOfficers){
        Session session = null;
        
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE TenderSubmittedEnvelopeA SET openedEAOfficers =:openedEAOfficers WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("openedEAOfficers", openedEAOfficers);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:TenderSubmittedEnvelopeADaoImpl \n Method:update");
            System.out.println("Exception in update method of TenderSubmittedEnvelopeADaoImpl  " + ex.getMessage());
            return false;
        } finally {
            session.close();
        }
        System.out.println(".............End updateShortlistedContrctrStatus method of EnvelopeBDataDaoImpl..............");
        return true;
    }

    @Override
    public int delete(int envelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
