/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EMD_ApplicableDao;
import com.eproc.domain.EMD_Applicable;
import java.util.ArrayList;
import java.util.List;
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
public class EMD_ApplicableDAOImpl implements EMD_ApplicableDao<EMD_Applicable>{
     @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(EMD_Applicable emd_Applicable) {
        System.out.println("-----------------Method called to save EMD_Applicable in EMD_ApplicableDAOImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(emd_Applicable);
            txn.commit();
        } catch (Exception ex) {
            System.out.println("Class::EMD_ApplicableDAOImpl, method::insertData");
            System.out.print("Exception in Save EMD_Applicable" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save EMD_Applicable in EMD_ApplicableDAOImpl----------------------------");
        return true; }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EMD_Applicable fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(EMD_Applicable e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    } 

    @Override
    public List fetchAll() {
    System.out.println("-----------------Method called to fetchAll TenderStage in TypeOfTendersDAOImpl----------------------------");
        List<EMD_Applicable> emd_ApplicableList = new ArrayList<EMD_Applicable>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            emd_ApplicableList = session.createQuery("FROM EMD_Applicable").list();
            System.out.println("Size of emd_ApplicableList is " + emd_ApplicableList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll emd_ApplicableList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll TenderStagein TypeOfTendersDAOImpl----------------------------");
        return emd_ApplicableList; }
    
}
