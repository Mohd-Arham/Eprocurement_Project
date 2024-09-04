/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.SelectiveTenderDao;
import com.eproc.domain.SelectiveTender;
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
 * @author Vishali gupta
 */
@Repository
public class SelectiveTenderDAOImpl implements SelectiveTenderDao<SelectiveTender>{
     @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(SelectiveTender selectiveTender) {
        System.out.println("-----------------Method called to save SelectiveTender in SelectiveTenderDAOImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(selectiveTender);
            txn.commit();

        } catch (Exception ex) {
            System.out.println("Class::SelectiveTenderDAOImpl, method::insertData");
            System.out.print("Exception in Save SelectiveTender" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save SelectiveTender in SelectiveTenderDAOImpl----------------------------");
        return true; }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SelectiveTender fetchData(Integer selectiveTender_id) {
        Session session = null;
        SelectiveTender selectiveTender = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM SelectiveTender WHERE selectiveTender_id =:selectiveTender_id");
            query.setParameter("selectiveTender_id", selectiveTender_id);
            selectiveTender = (SelectiveTender) query.uniqueResult();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(session != null){
                session.close();
            }
        }
        return selectiveTender;
    }

    @Override
    public boolean updateData(SelectiveTender e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
     System.out.println("-----------------Method called to fetchAll SelectiveTenderList in SelectiveTenderDAOImpl----------------------------");
        List<SelectiveTender> SelectiveTenderList = new ArrayList<SelectiveTender>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            SelectiveTenderList = session.createQuery("FROM SelectiveTender").list();
            System.out.println("Size of SelectiveTenderList is " + SelectiveTenderList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll SelectiveTenderList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll SelectiveTenderList SelectiveTenderDAOImpl----------------------------");
        return SelectiveTenderList;
}
    
}
