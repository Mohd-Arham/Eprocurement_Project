/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TypeofTendersDao;
import com.eproc.domain.TypeOfTenders;
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
 * @author Vishali Gupta
 */
@Repository
public class TypeOfTendersDAOImpl implements TypeofTendersDao<TypeOfTenders>{
     @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(TypeOfTenders typeOfTenders) {
        System.out.println("-----------------Method called to save TypeOfTenders in TypeOfTendersDAOImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(typeOfTenders);
            txn.commit();

        } catch (Exception ex) {
            System.out.println("Class::TypeOfTendersDAOImpl, method::insertData");
            System.out.print("Exception in Save TypeOfTenders" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save TypeOfTenders in TypeOfTendersDAOImpl----------------------------");
        return true; }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TypeOfTenders fetchData(Integer typeOfTenders_id) {
    System.out.println("----------Method Call to fetch the Type of tender by type Of Tender Id---------------");   
    TypeOfTenders typeOfTenders = null;
    Session session = null;
    try{
      session = sessionFactory.openSession();
      Query query = session.createQuery("FROM TypeOfTenders WHERE typeOfTenders_id =:typeOfTenders_id");
      query.setParameter("typeOfTenders_id", typeOfTenders_id);
      typeOfTenders = (TypeOfTenders) query.uniqueResult();
      System.out.println("The Type Of Tender is: "+typeOfTenders);
    }catch(Exception ex){
        ex.printStackTrace();
    }finally{
        if(session != null){
            session.close();
        }
    }
    return typeOfTenders;
    }

    @Override
    public boolean updateData(TypeOfTenders e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
         System.out.println("-----------------Method called to fetchAll TypeOfTenders in TypeOfTendersDAOImpl----------------------------");
        List<TypeOfTenders> TypeOfTendersList = new ArrayList<TypeOfTenders>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            TypeOfTendersList = session.createQuery("FROM TypeOfTenders").list();
            System.out.println("Size of TypeOfTendersList is " + TypeOfTendersList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll TypeOfTendersList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll TypeOfTenders TypeOfTendersDAOImpl----------------------------");
        return TypeOfTendersList; }
    
}
