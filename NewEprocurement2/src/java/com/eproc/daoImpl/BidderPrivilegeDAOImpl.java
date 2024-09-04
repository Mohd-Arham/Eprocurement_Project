/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.BidderPrivilegeDAO;
import com.eproc.domain.BidderPrivilege;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vaishali Gupta
 */
@Repository
public class BidderPrivilegeDAOImpl implements BidderPrivilegeDAO<BidderPrivilege>{
 @Autowired
    SessionFactory sessionFactory;
    BidderPrivilege bidderPrivilege;
    
    
    @Override
    public boolean insertData(BidderPrivilege e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BidderPrivilege fetchData(Integer id) {
        System.out.println("-----------------Method Called to BidderPrivilege in BidderPrivilegeDAOImpl----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM BidderPrivilege WHERE privilegeid =:privilegeid");
            query.setParameter("privilegeid", id);
            bidderPrivilege = (BidderPrivilege) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of BidderPrivilege : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata Privilege  in Dao----------------------------");
        return bidderPrivilege; 
    }

    @Override
    public boolean updateData(BidderPrivilege e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
         System.out.println("-----------------Method called to fetchAll BidderPrivilege in BidderPrivilegeDAOImpl----------------------------");
        List<BidderPrivilege> BidderPrivilegeList = new ArrayList<BidderPrivilege>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
           BidderPrivilegeList = session.createQuery("FROM BidderPrivilege").list();
            System.out.println("Size of BidderPrivilege is " + BidderPrivilegeList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll BidderPrivilege " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
     
        return BidderPrivilegeList; 
    }
    
}