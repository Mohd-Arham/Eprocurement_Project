/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorClassDao;
import com.eproc.domain.ContractorClass;
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
public class ContractorClassDAOImpl implements ContractorClassDao<ContractorClass>{
 @Autowired
 SessionFactory sessionFactory;
 
    @Override
    public boolean insertData(ContractorClass contractorClass) {
      System.out.println("-----------------Method called to save contractorClass in ContractorClassDAOImpl----------------------------");
        Session session = null;
       

        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(contractorClass);
            txn.commit();

        } catch (Exception ex) {
            System.out.println("Class::ContractorClassDAOImpl, method::insertData");
            System.out.print("Exception in Save contractorClass" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save contractorClass in ContractorClassDAOImpl----------------------------");
        return true; }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /*
    * fetchData 
    * Method used to call constractor class data
    * @Created 17 Aug 2018
    * @Version 2.0.0
    */
   @Override
    public ContractorClass fetchData(Integer contractorClass_id) {
        Session session = null;
        ContractorClass contractorClass = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ContractorClass WHERE contractorClass_id =:contractorClass_id");
            query.setParameter("contractorClass_id", contractorClass_id);
            contractorClass = (ContractorClass) query.uniqueResult();
            System.out.println("The Contractor Class is: "+contractorClass);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(session != null){
                session.close();
            }
        }
        return contractorClass;
    }

    @Override
    public boolean updateData(ContractorClass e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

 

    @Override
    public List fetchAll() {
     System.out.println("-----------------Method called to fetchAll ContractorClass in ContractorClassDAOImpl----------------------------");
        List<ContractorClass> contractorClassList = new ArrayList<ContractorClass>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            contractorClassList = session.createQuery("FROM ContractorClass").list();
            System.out.println("Size of contractorClassList is " + contractorClassList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll contractorClassList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll ContractorClass ContractorClassDAOImpl----------------------------");
        return contractorClassList; }
    
}
