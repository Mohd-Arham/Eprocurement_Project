/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EmdDao;
import com.eproc.domain.EmdPayment;
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
 * @author Anshu Baghel
 */
@Repository
public class EmdDaoImpl implements EmdDao<EmdPayment> {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(EmdPayment emdPayment) {
        System.out.println("----------------Method call to insert EmdPayment in  EmdDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(emdPayment);

        } catch (Exception ex) {

            ex.printStackTrace();
            System.out.println("Class:EmdDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData EmdPayment :::" + ex.getMessage());
        } finally {
            if (transaction != null) {
                transaction.commit();
            }
            if (session != null) {
                session.close();
            }
        }
        System.out.println("----------------Method end to insert EmdPayment in  EmdDaoImpl----------------");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmdPayment fetchData(Integer id) {
        System.out.println("**************fetchData deptUser method run**************");
        EmdPayment emdPayment = new EmdPayment();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM  WHERE tender_Id =:id");
            query.setParameter("id", id);
            emdPayment = (EmdPayment) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return emdPayment;
    }
    @Override
    public boolean updateData(EmdPayment emdPayment) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmdPayment fetchEmdById(Integer tender_Id, Integer contId) {
        System.out.println("tender id  " + tender_Id + " and cont id  " + contId);
        EmdPayment emdpayment = new EmdPayment();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM EmdPayment WHERE tender_Id =:tenderId and contractorId=:contractorId");
            query.setParameter("tenderId", tender_Id);
            query.setParameter("contractorId", contId);
         emdpayment=(EmdPayment) query.uniqueResult();
        } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeBList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll envelopeBList in dynamicDaoImpl----------------------------");
        return emdpayment;
    }
}
