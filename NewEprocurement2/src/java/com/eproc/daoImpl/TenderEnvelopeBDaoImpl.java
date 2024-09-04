/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderEnvelopeBDao;
import com.eproc.domain.TenderEnvelopeA;
import com.eproc.domain.TenderEnvelopeB;
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
public class TenderEnvelopeBDaoImpl implements TenderEnvelopeBDao{

   @Autowired
   SessionFactory sessionFactory;
     
    @Override
    public int create(TenderEnvelopeB envelopeB) throws Exception {
       Session session = null;
       Transaction transaction = null;
        int tender_EnvelopeA_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           tender_EnvelopeA_Id = envelopeB.getTender_EnvelopeA_Id();
           System.out.println("The Tender Id before save is: "+tender_EnvelopeA_Id);
           session.saveOrUpdate(envelopeB);
            tender_EnvelopeA_Id = envelopeB.getTender_EnvelopeA_Id();
           System.out.println("The Tender Id after save is: "+tender_EnvelopeA_Id);
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
      return tender_EnvelopeA_Id;
    }

    @Override
    public TenderEnvelopeB read(int tender_EnvelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeB> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeB> readAll(int tender_EnvelopeB_Id) throws Exception {
        Session session = null;
       List<TenderEnvelopeB> fetchEnvelopeBTemplateName = new ArrayList<>(); 
        System.out.println("The Tender Envelope A Is: "+tender_EnvelopeB_Id);
       try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderEnvelopeB WHERE tender_EnvelopeAName_Id =:tender_EnvelopeAName_Id");
        query.setParameter("tender_EnvelopeAName_Id", tender_EnvelopeB_Id);
        fetchEnvelopeBTemplateName = query.list();
         System.out.println("Fetch The Envelope A Template Name: "+fetchEnvelopeBTemplateName.size());
       }catch(Exception ex){           
           ex.printStackTrace();         
       }finally{
           if(session != null){
               session.close();
           }
       }
      return fetchEnvelopeBTemplateName; 
    }

    @Override
    public int update(TenderEnvelopeB envelopeB) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_EnvelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeB> fetchTemplateNameByDeptId(String deptId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
