/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EnvelopeTypeDao;
import com.eproc.domain.EnvelopeType;
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
 * @author Vishali Gupta
 */
@Repository
public class EnvelopeTypeDAOImpl implements EnvelopeTypeDao<EnvelopeType>{
     @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(EnvelopeType envelopeType) {
       System.out.println("-----------------Method called to save EnvelopeType in EnvelopeTypeDAOImpl----------------------------");
        Session session = null;
       

        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(envelopeType);
            txn.commit();

        } catch (Exception ex) {
            System.out.println("Class::EnvelopeTypeDAOImpl, method::insertData");
            System.out.print("Exception in Save EnvelopeType" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save EnvelopeType in EnvelopeTypeDAOImpl----------------------------");
        return true; }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EnvelopeType fetchData(Integer envelopeType_id) {
       Session session = null;
       EnvelopeType envelopeType = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM EnvelopeType WHERE envelopeType_id =:envelopeType_id");
           query.setParameter("envelopeType_id", envelopeType_id);
           envelopeType = (EnvelopeType) query.uniqueResult();
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return envelopeType;
    }

    @Override
    public boolean updateData(EnvelopeType e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("-----------------Method called to fetchAll TenderStage in TypeOfTendersDAOImpl----------------------------");
        List<EnvelopeType> envelopeTypeList = new ArrayList<EnvelopeType>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            envelopeTypeList = session.createQuery("FROM EnvelopeType").list();
            System.out.println("Size of envelopeTypeList is " + envelopeTypeList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeTypeList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll TenderStagein TypeOfTendersDAOImpl----------------------------");
        return envelopeTypeList;  }
    
}
