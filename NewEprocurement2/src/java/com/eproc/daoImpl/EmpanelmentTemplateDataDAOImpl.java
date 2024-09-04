/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EmpanelmentTemplateDataDAO;
import com.eproc.domain.EmpanelmentTemplateData;
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
 * @author Mansi Jain
 */
@Repository
public class EmpanelmentTemplateDataDAOImpl implements EmpanelmentTemplateDataDAO{

    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public boolean insertData(EmpanelmentTemplateData empanelmentTemplateData) {
        System.out.print(" call insertData method of EmpanelmentTemplateData");
        Session session = sessionFactory.openSession();
        Transaction txn = session.beginTransaction();
       session.saveOrUpdate(empanelmentTemplateData);
        txn.commit();
        session.close();
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmpanelmentTemplateData fetchData(Integer templatenameId) {
       System.out.println("----------------Method call to fetch EmpanelmentTemplateData by id in  EmpanelmentDynamicTemplateDaoImpl----------------");
        EmpanelmentTemplateData empanelmentTemplatedata = new EmpanelmentTemplateData();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM EmpanelmentTemplateData WHERE templatenameId=:templatenameId");
            query.setParameter("templatenameId", templatenameId);
            empanelmentTemplatedata = (EmpanelmentTemplateData) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:  EmpanelmentTemplateDataDaoImpl\nMethod:  fetchData");
            System.out.print("Exception in fetch EmpanelmentTemplateData" + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch EmpanelmentTemplateData by id in  EmpanelmentTemplateDataDaoImpl----------------");
        return empanelmentTemplatedata;
    
    }

    @Override
    public boolean updateData(EmpanelmentTemplateData e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAllBytemplateNameid(Integer templatenameId) {
         System.out.println("----------------Method call to fetch all EmpanelmentTemplateData  in EmpanelmentTemplateDataDaoImpl----------------");
        Session session = null;
        List<EmpanelmentTemplateData> EmpanelmentTemplateDataList = new ArrayList<EmpanelmentTemplateData>();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM EmpanelmentTemplateData WHERE templatenameId =:templatenameId");
            EmpanelmentTemplateDataList = query.setParameter("templatenameId", templatenameId).list();           
        } catch (Exception ex) {
            System.out.println("Class:  EmpanelmentTemplateDataDaoImpl\nMethod:  fetchAll");
            System.out.print("Exception in fetchAll EmpanelmentTemplateData " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch all EmpanelmentTemplateData in  EmpanelmentTemplateDataDaoImpl----------------");
        return EmpanelmentTemplateDataList;
    }
    
}
