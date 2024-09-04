package com.eproc.daoImpl;

import com.eproc.dao.DesignationDao;
import com.eproc.domain.Designation;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *@author Mansi Jain
 * @since 18june2018
 * @version 2.0.0
 */
@Repository
public class DesignationDaoImpl implements DesignationDao<Designation>{
 @Autowired
    SessionFactory sessionFactory;
 
    @Override
    public boolean insertData(Designation designation) {
       Session session = sessionFactory.openSession();
        Transaction txn = session.beginTransaction();
        session.saveOrUpdate(designation);
        txn.commit();
        session.close();
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Designation fetchData(Integer id) {
        System.out.println("call fetchData method to retrieve data by perticuler id for edit details of  Designation ");
        Designation designation = new Designation();
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("FROM Designation WHERE id =:id");
        query.setParameter("id", id);
        designation = (Designation) query.uniqueResult();
        session.close();
        return designation;
    }

    @Override
    public boolean updateData(Designation designation) {
throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("call fetchAll method to retrieve data of Department Circle from database");
        List<Designation> circleList = new ArrayList<>();
        Session session = sessionFactory.openSession();
        circleList = session.createQuery("FROM Designation").list();
        session.close();
        return circleList;
    }

    @Override
    public List fetchAllbyDept_ID(Integer id) {
          System.out.println("----------------Method call to fetchAllbyDept_ID subdivision in  SubDivisionDaoImpl----------------");
        List<Designation> designationList = new ArrayList<Designation>();
        Session session=null;
        try {
             session= sessionFactory.openSession();
            Query query = session.createQuery("FROM Designation where dept_Id=:id");
            query.setParameter("id", id);
            System.out.println("id "+id);
            designationList = query.list();
        }catch(Exception ex){
         System.out.println("Class: SubDivisionDaoImpl \n Method:fetchAllbyDept_ID");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
        System.out.println("----------------Method end to fetchAllbyDept_ID subdivision in  SubDivisionDaoImpl----------------");
         return designationList ; 
    }
    
}
