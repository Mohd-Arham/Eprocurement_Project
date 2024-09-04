/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderEnvelopeBNameDao;
import com.eproc.domain.TenderEnvelopeANames;
import com.eproc.domain.TenderEnvelopeBNames;
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
public class TenderEnvelopeBNameDaoImpl implements TenderEnvelopeBNameDao{
 
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public int create(TenderEnvelopeBNames envelopeBName) throws Exception {
       Session session = null;
      Transaction transaction = null;
      int tender_EnvelopeAName_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           session.saveOrUpdate(envelopeBName);
           tender_EnvelopeAName_Id = envelopeBName.getTender_EnvelopeAName_Id();
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
    public TenderEnvelopeBNames read(int tender_EnvelopeAName_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeBNames> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeBNames> readAll(int deptId) throws Exception {
    Session session = null;
      Transaction transaction = null;
      List<TenderEnvelopeBNames> envelopeBNameses = new ArrayList<>();
      try{
          session = sessionFactory.openSession();
          Query query = session.createQuery("FROM TenderEnvelopeBNames WHERE deptId =:deptId");
          query.setParameter("deptId", String.valueOf(deptId));
          envelopeBNameses = query.list();
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
      return envelopeBNameses;    
    }

    @Override
    public int update(TenderEnvelopeBNames envelopeBName) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_EnvelopeAName_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean checkDuplicateEnvelopeBName(String envelopeAName) {
         Boolean status = true;
        Session session = null;
        Integer tender_EnvelopeAName_Id = 0;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("SELECT tender_EnvelopeAName_Id FROM TenderEnvelopeBNames WHERE  envelopeATemplateName =:envelopeATemplateName");
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
