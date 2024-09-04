package com.eproc.daoImpl;

import com.eproc.dao.DivisionDAO;
import com.eproc.domain.Division;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DivisionDAOImpl implements DivisionDAO<Division> {

    @Autowired
    SessionFactory sessionFactory;
    Division division;
    
    /*insertData
     * Method used to insert division
     * @param division
     */
    @Override
    public boolean insertData(Division division) {
        System.out.println("----------------Method call to insert division in  DivisionDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(division);      
            System.out.println("Begin the transaction");
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println("Class:DivisionDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData division :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
        }      
        
    }
        System.out.println("----------------Method end to insert division in  DivisionDaoImpl----------------");
        return false;
    }


    /*fetchAll
     * Method used to fetch division
     * @param division
     */
    @Override
    public List<Division> fetchAll() {
        System.out.println("----------------Method call to fetchAll division in  DivisionDaoImpl----------------");
        Session session = null;
        List<Division> divisionList = new ArrayList<Division>();
        try {
            session = sessionFactory.openSession();
            divisionList = session.createQuery("FROM Division").list();
            System.out.println("Division Dao...fetch all.......");
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchAll");
            System.out.print("Exception in fetchall in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll division in  DivisionDaoImpl----------------");
        return divisionList;
    }

   

    /*fetchData
     * Method used to fetch division  by Id
     * @param division
     */
    @Override
    public Division fetchData(Integer id) {
        System.out.println("----------------Method call to fetch division by id in  DivisionDaoImpl----------------"+id);
        Session session = sessionFactory.openSession(); 
        Division division = new Division();
        try {           
            Query query = session.createQuery("from Division where division_id =:id");
            query.setParameter("id", id);
            System.out.println("Division Dao..........#" + id);
            division = (Division) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchData");
            System.out.println("Exception in fetchData in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch  division by id in  DivisionDaoImpl----------------");
        return division;
    }

    
    @Override
    public boolean removeData(Integer id) {
 System.out.println("*KeywordDAOImpl's deleteKeywordsById method run*");
        Session session = null;
        try {
            session = sessionFactory.openSession();
           Division addkeyword = (Division) session.load(Division.class, id);
            session.delete(addkeyword);
            Transaction tx = session.beginTransaction();
            tx.commit();
        } catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData method of Addkeyword" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }

        System.out.println("END*");
        return true;
    }

    @Override
    public boolean updateData(Division division) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String checkDuplicateValue(Division division) {
      System.out.println("-----------------Method called to checkDuplicateValue Division in Dao----------------------------");
        String message = "";
        List<Division> divisionList = this.fetchAll();
        Iterator<Division> iterator = divisionList.listIterator();
        while (iterator.hasNext()) {
            Division d = iterator.next();
            if (division.getDivision().trim().equalsIgnoreCase(d.getDivision().trim())
                    &&division.getCircleid()==d.getCircleid()) {
                message = "Duplicate Division Name";
                System.out.println(message);
            }
             else if (division.getDivision().isEmpty() || division.getDivision() == null) {

                message = "Enter Division Name";
             }
        }
        System.out.println("-----------------Method End to checkDuplicateValue Division in Dao----------------------------");
        return message;

    }
     @Override
    public List fetchDivision(Integer circleid) {
         List<Division> divisionList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Division WHERE circleid =:circleid");
            query.setParameter("circleid", circleid);
            divisionList = query.list();
            System.out.println("DivisionList size is::"+divisionList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll division " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll Divisions in Dao----------------------------");
        return divisionList;
    
    }

     @Override
    public List fetchDivision(Integer circleid, Integer deptId) {
         List<Division> divisionList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Division WHERE circleid =:circleid AND dept_Id=:dept_Id");
            query.setParameter("circleid", circleid);
            query.setParameter("dept_Id", deptId);
            divisionList = query.list();
            System.out.println("DivisionList size is::"+divisionList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll division " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll Divisions in Dao----------------------------");
        return divisionList;
    
    }

    
    
    @Override
    public List fetchAllbyDept_ID(Integer id) {
         System.out.println("----------------Method call to fetchAllbyDept_ID division in  DivisionDaoImpl----------------");
        Session session = null;
        List<Division> divisionList = new ArrayList<Division>();
        try {
            session = sessionFactory.openSession();
             Query query= session.createQuery("FROM Division where dept_Id=:id");
             query.setParameter("id", id);
              divisionList = query.list();
//            System.out.println("Division Dao...fetch all.......");
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchAllbyDept_ID");
            System.out.print("Exception in fetchall in division " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAllbyDept_ID division in  DivisionDaoImpl----------------");
        return divisionList;
    }
    
    @Override
    public String divisionName(Integer division_id) {
       System.out.println("----------------Method To Fetch Division Name By id----------------");
        Session session = null;
        String divisionName = null;
        try {
            session = sessionFactory.openSession();
             Query query= session.createQuery("SELECT division FROM Division where division_id=:division_id");
            divisionName = (String) query.setParameter("division_id", division_id).uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchAllbyDept_ID");
            System.out.print("Exception in fetchall in division " + ex.getMessage());
        } finally {
            session.close();
        }
        return divisionName;
    }
    }

