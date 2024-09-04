package com.eproc.daoImpl;

import com.eproc.dao.CitiesDAO;
import com.eproc.domain.Cities;
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
public class CitiesDAOImpl implements CitiesDAO<Cities> {

    @Autowired
    SessionFactory sessionFactory;
    Cities cities;

    @Override
    public boolean insertData(Cities Cities) {
        System.out.println("----------------Method call to insertData in  CitiesDaoImpl----------------");
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            Cities.setCity_name(Cities.getCity_name().toUpperCase());
            session.saveOrUpdate(Cities);

        } catch (Exception ex) {
            System.out.print("Exception in insertData CitiesDaoImpl " + ex.getMessage());
        } finally {
            txn.commit();
            session.close();
        }
        System.out.println("----------------Method end to insert  in  CitiesDaoImpl----------------");
        return false;
    }

    @Override
    public boolean removeData(Integer id) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        System.out.println("*KeywordDAOImpl's deleteKeywordsById method run*");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Cities addkeyword = (Cities) session.load(Cities.class, id);
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

    public boolean removeDataList(Cities city) {
        System.out.println("*KeywordDAOImpl's deleteKeywordsById method run*");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Cities cityToDelete = (Cities) session.load(Cities.class, city.getCity_id());
            if (cityToDelete != null) {
                Transaction tx = session.beginTransaction();
                session.delete(cityToDelete);
                tx.commit();
                System.out.println("City removed successfully");
                return true; // Return true if deletion was successful
            } else {
                System.out.println("City not found");
                return false; // Return false if city was not found
            }
        } catch (Exception ex) {
            System.out.println("Class: KeywordDAOImpl \n Method:removeDataList");
            System.out.println("Exception in removeDataList method of KeywordDAOImpl: " + ex.getMessage());
            return false; // Return false in case of any exception
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("END*");
        }
    }

    @Override
    public Cities fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(Cities Cities) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("----------------Method call to fetchAll Cities in  CitiesDaoImpl----------------");
        Session session = null;
        List<Cities> citiesList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            citiesList = session.createQuery("FROM Cities").list();

        } catch (Exception ex) {
            System.out.print("Exception in fetchall in CitiesList " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetchAll Cities in  CitiesDaoImpl----------------");
        return citiesList;
    }

    //fetch citys by state
    /*
     *This Method is fetch cities by state  .
     */
    @Override
    public List fetchCitiesByState(int state_id) {
        System.out.println("----------------Method call to fetchAllCitiesByState in  CitiesDaoImpl----------------");
        Session session = null;
        List<Cities> stateList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Cities WHERE state_id =:state_id");
            query.setParameter("state_id", state_id);
            stateList = query.list();
            System.out.println("###################" + stateList);
        } catch (Exception ex) {
            System.out.print("Exception in fetchData in Cities " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch  fetchAllCitiesByState in  CitiesDaoImpl----------------");
        return stateList;
    }

    //fetch citys 
    /*
     *This Method is fetch cities   .
     */
    @Override
    public Cities fetchByIdEdit(int city_id) {
        Cities cities = new Cities();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Cities where city_id =:city_id");
            query.setParameter("city_id", city_id);
            cities = (Cities) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return cities;
    }

    //check duplicate value
    /*
     *This Method is check duplicate value in database.
     */
    @Override
    public String getDuplicateCities(Cities cities) {
        try {
            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            String msg = "Not Duplicate Value";
            int country_id = cities.getCountry_id();
            int state_id = cities.getState_id();
            String city_name = cities.getCity_name();
            System.out.println("city_name::" + city_name);
            String SQL_QUERY = "from Cities where state_id =:state_id";
            Query query = session.createQuery(SQL_QUERY);
            query.setParameter("state_id", state_id);
            List<Cities> citiesListduplicate = query.list();
            // Iterator<Cities> iterator = citiesListduplicate.iterator();
            for (Cities cities1 : citiesListduplicate) {
                if (city_name.equalsIgnoreCase(cities1.getCity_name())) {
                    msg = "City Already Exist";
                }
            }
            return msg;
        } catch (Exception ex) {
            System.out.println("Class:CitiesClass\n Method:getDuplicateCities");
            System.out.println("Exception in CitiesClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
