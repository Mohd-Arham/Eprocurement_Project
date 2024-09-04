/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderSubmittedQCBSDao;
import com.eproc.domain.TenderSubmittedQCBS;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Windows7
 */
@Repository
public class TenderSubmittedQCBSDaoImpl implements TenderSubmittedQCBSDao{

    @Autowired
    SessionFactory sessionFactory;
     
    @Override
    public int create(TenderSubmittedQCBS submittedQCBS) throws Exception {
        Session session = null;
        Transaction transaction = null;
        try{
            System.out.println("QCBS DATA"+submittedQCBS);
          session = sessionFactory.openSession();
          transaction = session.beginTransaction();
          session.saveOrUpdate(submittedQCBS);
          System.out.println("The QCBS Id after save: "+submittedQCBS.getSubmittedQCBS());
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(transaction!=null){
                transaction.commit();
            }
            if(session!=null){
                session.close();
            }
        }
        return submittedQCBS.getSubmittedQCBS();
    }

    @Override
    public TenderSubmittedQCBS read(int tender_Id) throws Exception {
        Session session = null;
        TenderSubmittedQCBS tenderSubmittedQCBS = new TenderSubmittedQCBS();
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderSubmittedQCBS WHERE tender_Id =:tender_Id");
            tenderSubmittedQCBS = (TenderSubmittedQCBS) query.setParameter("tender_Id", tender_Id).uniqueResult();
            System.out.println("The QCBS Officers are: "+tenderSubmittedQCBS);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(session!=null){
                session.close();
            }
        }
        return tenderSubmittedQCBS;
    }

    @Override
    public List<TenderSubmittedQCBS> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderSubmittedQCBS> readAll(int envelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(TenderSubmittedQCBS submittedEnvelopeA) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int envelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Integer tender_Id, String QCBSOfficers) {
      Session session = null;
        
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE TenderSubmittedQCBS SET QCBSOfficers =:QCBSOfficers WHERE tender_Id =:tender_Id");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("QCBSOfficers", QCBSOfficers);
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
