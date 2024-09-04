/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorClassSecondDao;
import com.eproc.domain.ContractorClassSecond;
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
 * @author Windows7
 */
@Repository
public class ContractorClassSecondDaoImpl implements ContractorClassSecondDao {
  @Autowired
 SessionFactory sessionFactory;

    @Override
    public boolean insertData(ContractorClassSecond contractorClassSecond) {
   System.out.println("-----------------Method called to save contractorClassSecond in ContractorClassDAOImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(contractorClassSecond);
            txn.commit();

        } catch (Exception ex) {
            System.out.println("Class::contractorClassSecondDAOImpl, method::insertData");
            System.out.print("Exception in Save contractorClassSecond" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save contractorClass in ContractorClassDAOImpl----------------------------");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ContractorClassSecond fetchData(Integer contClassId) {
       Session session = null;
        ContractorClassSecond contractorClassSecond = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ContractorClassSecond WHERE contClassId =:contClassId");
            query.setParameter("contClassId", contClassId);
            contractorClassSecond = (ContractorClassSecond) query.uniqueResult();
            System.out.println("The Contractor Class is: "+contractorClassSecond);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(session != null){
                session.close();
            }
        }
        return contractorClassSecond;
    }

    @Override
    public boolean updateData(ContractorClassSecond e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
       System.out.println("-----------------Method called to fetchAll ContractorClassSecond in ContractorClassSecondDAOImpl----------------------------");
        List<ContractorClassSecond> contractorClassSecondList = new ArrayList<ContractorClassSecond>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            contractorClassSecondList = session.createQuery("FROM ContractorClassSecond").list();
            System.out.println("Size of contractorClassSecondList is " + contractorClassSecondList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll contractorClassSecondList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll ContractorClassSecond ContractorClassSecondDAOImpl----------------------------");
        return contractorClassSecondList;
    }
    
}
