/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderEnvelopeADao;
import com.eproc.domain.TenderEnvelopeA;
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
public class TenderEnvelopeADaoImpl implements TenderEnvelopeADao{
   
   @Autowired
   SessionFactory sessionFactory;
    
    @Override
    public int create(TenderEnvelopeA envelopeA) throws Exception {
       Session session = null;
       Transaction transaction = null;
        int tender_EnvelopeA_Id = 0;
      try{
      session = sessionFactory.openSession();
           transaction = session.beginTransaction();
           tender_EnvelopeA_Id = envelopeA.getTender_EnvelopeA_Id();
           System.out.println("The Tender Id before save is: "+tender_EnvelopeA_Id);
           session.saveOrUpdate(envelopeA);
            tender_EnvelopeA_Id = envelopeA.getTender_EnvelopeA_Id();
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
    public TenderEnvelopeA read(int tender_EnvelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeA> readAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
    @Override
    public int update(TenderEnvelopeA envelopeA) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int tender_EnvelopeA_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TenderEnvelopeA> fetchTemplateNameByDeptId(String deptId) {
       Session session = null;
       List<TenderEnvelopeA> fetchEnvelopeATemplateName = new ArrayList<>(); 
     try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderEnvelopeA tA WHERE tA.deptId =:deptId");
        query.setParameter("deptId", deptId);
        fetchEnvelopeATemplateName = query.list();
        System.out.println("Fetch The Envelope A Template Name: "+fetchEnvelopeATemplateName.size());
       }catch(Exception ex){           
        ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
      return fetchEnvelopeATemplateName;
    }

    @Override
    public List<TenderEnvelopeA> readAll(int tender_EnvelopeA_Id) throws Exception {
       Session session = null;
       List<TenderEnvelopeA> fetchEnvelopeATemplateName = new ArrayList<>(); 
        System.out.println("The Tender Envelope A Is: "+tender_EnvelopeA_Id);
       try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderEnvelopeA WHERE tender_EnvelopeAName_Id =:tender_EnvelopeAName_Id");
        query.setParameter("tender_EnvelopeAName_Id", tender_EnvelopeA_Id);
        fetchEnvelopeATemplateName = query.list();
         System.out.println("Fetch The Envelope A Template Name: "+fetchEnvelopeATemplateName.size());
       }catch(Exception ex){           
           ex.printStackTrace();         
       }finally{
           if(session != null){
               session.close();
           }
       }
      return fetchEnvelopeATemplateName;
    }

    @Override
    public int checkedDynamicField(int tender_Id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
