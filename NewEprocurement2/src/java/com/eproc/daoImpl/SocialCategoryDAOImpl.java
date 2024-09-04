/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.SocialCategoryDao;
import com.eproc.domain.SocialCategory;
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
public class SocialCategoryDAOImpl implements SocialCategoryDao<SocialCategory>{
     @Autowired
    SessionFactory sessionFactory;
     SocialCategory socialCategory;

    @Override
    public boolean insertData(SocialCategory e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SocialCategory fetchData(Integer id) {
       System.out.println("-----------------Method Called to fetchdata SocialCategory in Dao----------------------------");

        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM SocialCategory WHERE socialCategoryId =:socialCategoryId");
            query.setParameter("socialCategoryId", id);
          socialCategory = (SocialCategory) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of SocialCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata SocialCategory  in Dao----------------------------");
        return socialCategory;
    }

    @Override
    public boolean updateData(SocialCategory e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
      List<SocialCategory> socialCategoryList = new ArrayList<SocialCategory>();
        Session session = null;
        try {
            session =sessionFactory.openSession();
           socialCategoryList = session.createQuery("FROM SocialCategory").list();
            System.out.println("Size of Social Category is " + socialCategoryList.size());
           } catch (Exception ex) {
            System.out.print("Exception in FetchAll socialCategoryList" + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll SocialCategory in Dao----------------------------");
        return socialCategoryList;
    }
    }
    

