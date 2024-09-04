/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ProductWiseEmpanelmentDAO;
import com.eproc.domain.ProductWiseEmpanelment;
import java.util.ArrayList;
import java.util.Date;
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
public class ProductWiseEmpanelmentDAOImpl implements ProductWiseEmpanelmentDAO {

    @Autowired
    SessionFactory sessionFactory;
    ProductWiseEmpanelment productWiseEmpanelment;

    @Override
    public boolean insertData(ProductWiseEmpanelment productWiseEmpanelment) {
        System.out.println("****************ProductWiseEmpanelmentDAOImpl insertData method run****************");
        System.out.println(productWiseEmpanelment.getTenderCategory() + " tender category in ProductWiseEmpanelmentDAOImpl");
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            session.saveOrUpdate(productWiseEmpanelment);
            //System.out.println("The Empanelment Id: "+productWiseEmpanelment.getEmpanelmentId());
        } catch (Exception ex) {
            System.out.println("Class: ProductWiseEmpanelmentDAOImpl \n Method:insertdata");
            System.out.println("Exception in inserData method of ProductWiseEmpanelmentDAOImpl" + ex.getMessage());
            tx.rollback();
        } finally {
            if (tx != null) {
                tx.commit();
            }
            if (session != null) {
                session.close();
            }
        }

        System.out.println("*******************END inserData method of AreaOfWork****************************************");
        return true;

    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ProductWiseEmpanelment fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(ProductWiseEmpanelment e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("call fetchAll method to retrieve data of ProductWiseEmpanelment from database");
        Session session = null;
        List<ProductWiseEmpanelment> empanelmentList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            empanelmentList = session.createQuery("FROM ProductWiseEmpanelment").list();
        } catch (Exception ex) {
            System.out.println("Class:ProductWiseEmpanelmentDaoImpl \n Method:fetchAllData");
            System.out.println("Exception in fetchAll method of ProductWiseEmpanelment" + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End fetchAll method of Currency..............");
        return empanelmentList;
    }

    @Override
    public int updateData(int empanelmentId, int templatenameId) {
        System.out.println("call updateData method to Update templatename id of Dynamic Template from database");
        Session session = null;
        int updateId = 0;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE ProductWiseEmpanelment SET templatenameId =:templatenameId WHERE empanelmentId =:empanelmentId");
            query.setParameter("templatenameId", templatenameId);
            query.setParameter("empanelmentId", empanelmentId);
            updateId = query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:ProductWiseEmpanelmentDaoImpl \n Method:updateData");
            System.out.println("Exception in updateData method of ProductWiseEmpanelment" + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateData method of ProductWiseEmpanelmentDaoImpl..............");
        return updateId;
    }

    @Override
    public boolean updateStatus(Integer empanelmentId, String templateStatus) {
        System.out.println("empanelmentId  "+empanelmentId+ "  templateStatus "+templateStatus);
        System.out.println("call updateStatus method to update Status of ProductWiseEmpanelment from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE ProductWiseEmpanelment SET templateStatus =:templateStatus WHERE empanelmentId =:empanelmentId");
            query.setParameter("templateStatus", templateStatus);
            query.setParameter("empanelmentId", empanelmentId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:ProductWiseEmpanelmentDaoImpl \n Method:updateStatus");
            System.out.println("Exception in updateStatus method of ProductWiseEmpanelment  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateStatus method of ProductWiseEmpanelmentDaoImpl..............");
        return true;
    }

    @Override
    public boolean updatePendigrequest(Integer templatenameId, String templateStatus) {
        System.out.println("templatenameId  "+templatenameId+ "  templateStatus "+templateStatus);
        System.out.println("call updatePendigrequest method to update Status of ProductWiseEmpanelment from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE ProductWiseEmpanelment SET templateStatus =:templateStatus WHERE templatenameId =:templatenameId");
            query.setParameter("templateStatus", templateStatus);
            query.setParameter("templatenameId", templatenameId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:ProductWiseEmpanelmentDaoImpl \n Method:updatePendigrequest");
            System.out.println("Exception in updatePendigrequest method of ProductWiseEmpanelment  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updatePendigrequest method of ProductWiseEmpanelmentDaoImpl..............");
        return true;
    }

    @Override
    public boolean updatePendigrequestandfillRemark(Integer templatenameId, String templateStatus, String rejectremark,String remarkDate) {
      System.out.println("templatenameId  "+templatenameId+ "  templateStatus :"+templateStatus+" remark Date:  "+remarkDate);
        System.out.println("call updatePendigrequestandfillRemark method to update Status of ProductWiseEmpanelment from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("~~~~inside session~~~~~~~~~");
            Query query = session.createQuery("UPDATE ProductWiseEmpanelment SET templateStatus =:templateStatus,rejectremark=:rejectremark,remarkDate=:remarkDate WHERE templatenameId =:templatenameId");
            query.setParameter("templateStatus", templateStatus);
            query.setParameter("rejectremark", rejectremark);
            query.setParameter("templatenameId", templatenameId);
            query.setParameter("remarkDate", remarkDate);
            System.out.println("~~~~param set success~~remarkDate~~~~~~~");
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:ProductWiseEmpanelmentDaoImpl \n Method:updatePendigrequest");
            System.out.println("Exception in updatePendigrequestandfillRemark method of ProductWiseEmpanelment  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updatePendigrequestandfillRemark method of ProductWiseEmpanelmentDaoImpl..............");
        return true;
    }

   
}
