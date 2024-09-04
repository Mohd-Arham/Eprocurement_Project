/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDesignationDAO;
import com.eproc.domain.ContractorDesignation;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Windows7
 */
@Repository
public class ContractorDesignationDAOImpl implements ContractorDesignationDAO<ContractorDesignation> {
      @Autowired
     SessionFactory sessionFactory;
     ContractorDesignation  contractorDesignation;
    @Override
    public boolean insertData(ContractorDesignation e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ContractorDesignation fetchData(Integer id) {
     System.out.println("-----------------Method Called to fetchdata MSME in Dao----------------------------");
     Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM ContractorDesignation WHERE desigid=:desigid");
            query.setParameter("desigid", id);
          contractorDesignation = (ContractorDesignation) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of Msme : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata MSME in Dao----------------------------");
        return contractorDesignation;
    }

    @Override
    public boolean updateData(ContractorDesignation e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
      List<ContractorDesignation> contractorDesignationList = new ArrayList<ContractorDesignation>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            contractorDesignationList = session.createQuery("FROM ContractorDesignation").list();
            System.out.println("Size of ContractorDesignationList is " + contractorDesignationList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll ContractorDesignationList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll ContractorDesignation in Dao----------------------------");
        return contractorDesignationList;
    }
  }
