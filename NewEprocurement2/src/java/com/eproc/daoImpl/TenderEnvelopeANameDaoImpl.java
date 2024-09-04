/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderEnvelopeANameDao;
import com.eproc.domain.TenderEnvelopeANames;
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
public class TenderEnvelopeANameDaoImpl implements TenderEnvelopeANameDao{

    @Autowired
    SessionFactory sessionFactory;
 
    @Override
    public int create(TenderEnvelopeANames envelopeAName) throws Exception {
      Session session = null;
      Transaction transaction = null;
      int tender_EnvelopeAName_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(envelopeAName);
           tender_EnvelopeAName_Id = envelopeAName.getTender_EnvelopeAName_Id();
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
      return tender_EnvelopeAName_Id; 
    }

    @Override
    public TenderEnvelopeANames read(int tender_EnvelopeAName_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeANames> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(TenderEnvelopeANames envelopeAName) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_EnvelopeAName_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeANames> readAll(int deptId) throws Exception {
      Session session = null;
      Transaction transaction = null;
      List<TenderEnvelopeANames> envelopeANameses = new ArrayList<>();
      try{
          session = sessionFactory.openSession();
          Query query = session.createQuery("FROM TenderEnvelopeANames WHERE deptId =:deptId");
          query.setParameter("deptId", String.valueOf(deptId));
          envelopeANameses = query.list();
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
      return envelopeANameses;
    }

    @Override
    public Boolean checkDuplicateEnvelopeAName(String envelopeAName) {
        Boolean status = true;
        Session session = null;
        Integer tender_EnvelopeAName_Id = 0;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("SELECT tender_EnvelopeAName_Id FROM TenderEnvelopeANames WHERE  envelopeATemplateName =:envelopeATemplateName");
           tender_EnvelopeAName_Id = (Integer) query.setParameter("envelopeATemplateName", envelopeAName).uniqueResult();
           if(tender_EnvelopeAName_Id!=null){
               status = false;
           }
            System.out.println("The Status is :"+status);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return status; 
    }
    
}
