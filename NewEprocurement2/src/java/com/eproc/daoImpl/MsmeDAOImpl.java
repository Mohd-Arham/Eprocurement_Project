/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;


import com.eproc.dao.MsmeOrgDAO;
import com.eproc.domain.MsmeOrg;
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
public class MsmeDAOImpl implements  MsmeOrgDAO<MsmeOrg> {
       @Autowired
     SessionFactory sessionFactory;
     MsmeOrg msmeOrg;

    @Override
    public boolean insertData(MsmeOrg e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MsmeOrg fetchData(Integer id) {
           System.out.println("-----------------Method Called to fetchdata MSME in Dao----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM MsmeOrg WHERE msmeId =:msmeId");
            query.setParameter("msmeId", id);
          msmeOrg = (MsmeOrg) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of Msme : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata MSME in Dao----------------------------");
        return msmeOrg;
    }

    @Override
    public boolean updateData(MsmeOrg e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
    System.out.println("-----------------Method called to fetchAll MsmeOrg in Dao----------------------------");
        List<MsmeOrg> msmeOrgList = new ArrayList<MsmeOrg>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            msmeOrgList = session.createQuery("FROM MsmeOrg").list();
            System.out.println("Size of Organization Typeis " + msmeOrgList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll msmeOrgList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll MsmeOrg in Dao----------------------------");
        return msmeOrgList;
    }
}
