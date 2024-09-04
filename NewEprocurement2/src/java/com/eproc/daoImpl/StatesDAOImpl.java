package com.eproc.daoImpl;

import com.eproc.dao.StatesDAO;
import com.eproc.domain.States;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Shashank Shukla
 */

@Repository
public class StatesDAOImpl implements StatesDAO<States> {

    @Autowired
    SessionFactory sessionFactory;
    States state;

    /*insertData
     * Method used to insert division
     * @param division
     */
    @Override
    public boolean insertData(States state) {
        System.out.println("----------------Method call to insert State in  StatesDAOImpl----------------");
        Session session = null;
        Transaction txn = null;
    
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            session.saveOrUpdate(state);
            txn.commit();
        } catch (Exception ex) {
            System.out.print("Exception in insertData State " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to insert State in  StatesDAOImpl----------------");
        return true;
    }

    /*fetchAll
     * Method used to fetch division
     * @param division
     */
    @Override
    public List fetchAll() {
        System.out.println("----------------Method call to fetchAll State in  StatesDAOImpl----------------");
        Session session = null;
        List<States> stateList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            stateList = session.createQuery("FROM States").list();

        } catch (Exception ex) {
            System.out.print("Exception in fetchall in statesList " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll State in  StatesDAOImpl----------------");
        return stateList;
    }

    
    /*updateData
     * Method used to update states
     * @param states
     */
    @Override
    public boolean updateData(States state) {
        System.out.println("----------------Method call to update data in State in  StatesDAOImpl----------------");
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            session.saveOrUpdate(state);
        } catch (Exception ex) {
            System.out.print("Exception in updateData in division " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            txn.commit();
            session.close();
        }
        System.out.println("----------------Method end to update data in State in  StatesDAOImpl----------------");
        return true;
    }

    /*fetchData
     * Method used to fetch division  by Id
     * @param division
     */
    @Override
    public States fetchData(Integer state_id) {
        System.out.println("----------------Method call to fetch State by id  in  StatesDAOImpl----------------");
        Session session = null;

        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM States WHERE state_id =:state_id");
            query.setParameter("state_id", state_id);

            state = (States) query.uniqueResult();
        } catch (Exception ex) {
            System.out.print("Exception in fetchData in division " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch  State by id  in  StatesDAOImpl----------------");
        return state;
    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("*KeywordDAOImpl's deleteKeywordsById method run*");
        Session session = null;
        try {
            session = sessionFactory.openSession();
           States addkeyword = (States) session.load(States.class, id);
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
    
     //fetch States
    /*
     *This Method is fetch the state list.
     */
    @Override
    public List fetchStates(int country_id) {
        List<States> stateList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM States WHERE country_id =:country_id");
            query.setParameter("country_id", country_id);
            stateList = query.list();
            System.out.println(stateList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll Countries " + ex);
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll State in StatesDAOImpl----------------------------");
        return stateList;
    }

   //getDuplicate State
    /*
     *This Method is Get Duplicate states in database.
     */
   @Override
    public String getDuplicateState(States state) {
       try{
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String msg = "Not Duplicate Value";
        int country_id = state.getCountry_id();
        String state_name = state.getState_name();
         System.out.println("city_name::"+state_name);
        String SQL_QUERY = "from States where country_id =:country_id";
            Query query = session.createQuery(SQL_QUERY);
            query.setParameter("country_id", country_id);
            List<States> stateListduplicate = query.list();
           Iterator<States> iterator = stateListduplicate.iterator();
        while (iterator.hasNext()) {
            States st = iterator.next();
            if (state_name.equalsIgnoreCase(st.getState_name())) {
                 msg = "State Already Exist";
            }
        }
        return msg;
           } catch (Exception ex) {
            System.out.println("Class:StateClass\n Method:getDuplicateState");
            System.out.println("Exception in StateDAOImpl " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

}
