/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorLogsDao;
import com.eproc.domain.ContractorLogs;
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
public class ContractorLogsDaoImpl implements ContractorLogsDao<ContractorLogs> {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(ContractorLogs contractorLog) {
        System.out.println("......insertData method called from StatusDaoImpl.....");
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(contractorLog);
            transaction.commit();

        } catch (Exception ex) {
            System.out.println("Class:  StatusDaoImpl\nMethod:  insertData");
            System.out.print("Exception in Save Status " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ContractorLogs fetchData(Integer id) {
       System.out.println("----------------Method call to fetch Contractorstatus by id in  ContractorLogsDaoImpl----------------");
        ContractorLogs contractolog = new ContractorLogs();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ContractorLogs WHERE contstatusid =:id");
            query.setParameter("id", id);
            contractolog = (ContractorLogs) query.uniqueResult();
        } catch (Exception ex) {
            System.out.print("Exception in fetch Circle " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch Contractorstatus by id in  ContractorLogsDaoImpl----------------");
        return contractolog;
    }
    
     @Override
    public ContractorLogs fetchDataByContId(Integer id) {
       System.out.println("----------------Method call to fetch Contractorstatus by id in  ContractorLogsDaoImpl----------------");
        ContractorLogs contractolog = new ContractorLogs();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ContractorLogs WHERE contid =:id");
            query.setParameter("id", id);
            contractolog = (ContractorLogs) query.uniqueResult();
        } catch (Exception ex) {
            System.out.print("Exception in fetch Circle " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch Contractorstatus by id in  ContractorLogsDaoImpl----------------");
        return contractolog;
    }

    @Override
    public boolean updateData(ContractorLogs e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
         System.out.println("----------------Method call to fetch all ContractorLogs in ContractorLogsDaoImpl----------------");
        Session session = null;
        List<ContractorLogs> ContractorLogsList = new ArrayList();
        try {
            session = sessionFactory.openSession();
            ContractorLogsList = session.createQuery("FROM ContractorLogs").list();            
        } catch (Exception ex) {
            System.out.println("Class:  ContractorLogsListDaoImpl\nMethod:  fetchAll");
            System.out.print("Exception in fetchAll ContractorLogs " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch all ContractorLogs in  ContractorLogsDaoImpl----------------");
        return ContractorLogsList;
    }
    }

    

