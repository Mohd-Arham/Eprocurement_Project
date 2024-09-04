/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderSubmittedEnvelopeBDao;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.domain.TenderSubmittedEnvelopeB;
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
public class TenderSubmittedEnvelopeBDaoImpl implements TenderSubmittedEnvelopeBDao{
    
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public int create(TenderSubmittedEnvelopeB submittedEnvelopeB) throws Exception {
         Session session = null;
      Transaction transaction = null;
      int envelopeB_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(submittedEnvelopeB);
           envelopeB_Id = submittedEnvelopeB.getSubmittedEnvelopeB_Id();
           System.out.println("The Envelope A Id: "+envelopeB_Id);
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
      return envelopeB_Id;
    }

    @Override
    public TenderSubmittedEnvelopeB read(int tender_Id) throws Exception {
        Session session = null;
       TenderSubmittedEnvelopeB submittedEnvelopeB = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM TenderSubmittedEnvelopeB WHERE tender_Id =:tender_Id");
           submittedEnvelopeB = (TenderSubmittedEnvelopeB) query.setParameter("tender_Id", tender_Id).uniqueResult();
           System.out.println("The Submitted Envelope A Data: "+submittedEnvelopeB);
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return submittedEnvelopeB;
    }

    @Override
    public List<TenderSubmittedEnvelopeB> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderSubmittedEnvelopeB> readAll(int envelopeB_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(TenderSubmittedEnvelopeB submittedEnvelopeB) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_Id) throws Exception {
     Session session = null;
             try{
              session = sessionFactory.openSession();
              Query query = session.createQuery("DELETE FROM TenderSubmittedEnvelopeB WHERE tender_Id=:tender_Id");
              query.setParameter("tender_Id", tender_Id);
              query.executeUpdate();
             }catch(Exception ex){
                 ex.printStackTrace();
             }
             return tender_Id;
    }
 @Override
    public boolean update(Integer tender_Id,String openedEBOfficers){
        Session session = null;
        System.out.println(""
                + "TenderSubmittedEnvelopBDaoIMPL"+openedEBOfficers);
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE TenderSubmittedEnvelopeB SET openedEBOfficers =:openedEBOfficers WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("openedEBOfficers", openedEBOfficers);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:TenderSubmittedEnvelopeBDaoImpl \n Method:update");
            System.out.println("Exception in update method of TenderSubmittedEnvelopeBDaoImpl  " + ex.getMessage());
            return false;
        } finally {
            session.close();
        }
        System.out.println(".............End update method of TenderSubmittedEnvelopeBDaoImpl..............");
        return true;
    }
}
