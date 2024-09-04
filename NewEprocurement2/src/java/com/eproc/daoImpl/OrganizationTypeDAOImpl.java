/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.OrganizationTypeDAO;
import com.eproc.domain.OrganizationType;
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
public class OrganizationTypeDAOImpl implements OrganizationTypeDAO<OrganizationType>{
     @Autowired
    SessionFactory sessionFactory;
    OrganizationType organizationType;
    
    @Override
    public boolean insertData(OrganizationType e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OrganizationType fetchData(Integer id) {
      System.out.println("-----------------Method Called to fetchdata Privilege in Dao----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM OrganizationType WHERE orgId =:orgId");
            query.setParameter("orgId", id);
          organizationType = (OrganizationType) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of Privilege : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata Privilege  in Dao----------------------------");
        return organizationType;
    }

    @Override
    public boolean updateData(OrganizationType e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
       System.out.println("-----------------Method called to fetchAll Product category in Dao----------------------------");
        List<OrganizationType> OrganizationTypeList = new ArrayList<OrganizationType>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
           OrganizationTypeList = session.createQuery("FROM OrganizationType").list();
            System.out.println("Size of Organization Typeis " + OrganizationTypeList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll OrganizationTypeList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll Organization Type in Dao----------------------------");
        return OrganizationTypeList;
    }
    
}
