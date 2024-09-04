/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDetailsDao;
import com.eproc.domain.ContractorDetails;
import java.util.ArrayList;
import java.util.List;
import javax.crypto.SecretKey;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Palak Tiwari
 * ContractorDetailsdaoImpl Class which implements ContractorDetailsDao
 */
@Repository
public class ContractorDetailsdaoImpl implements ContractorDetailsDao {
@Autowired
 SessionFactory sessionFactory;
 ContractorDetails contractorDetails;


 /**
  * @insertData method to save Contractor Other Details
  * @param contractorDetails
  * @return boolean value
  */
    @Override
    public boolean insertData(Object contractorDetails) {
        Session session = null;
        Transaction txn = null;
        try {
            System.out.println("/id");
            session = sessionFactory.openSession();
            txn = session.beginTransaction();
            System.out.println("session is opened");
            session.saveOrUpdate(contractorDetails);
            System.out.println("Save contractor details");
        } catch (Exception e) {
            txn.rollback();
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:insertdata");
        } finally {
            if (txn != null) {
                txn.commit();
            }
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed");
        }
        return true;
    }
    /*
     *@param id
     *@removeData method to delete the row from ContractorOtherDetailsApplication  
     *@return boolean value
     */

    @Override
    public boolean removeData(Integer id) {
        ContractorDetails contractorDetails = new ContractorDetails();
        Session session = null;
        try {

            session = sessionFactory.openSession();
            System.out.println("delete sdata from id" + id);
            Query query = session.createQuery("delete FROM ContractorOrganizationType WHERE contAppId=:id ");
            query.setParameter("id", id);
            query.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:removeData()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }

        return true;
    }
    /*
     *@fetchData method to fetch Contractor Other Details by id
     *@return ContractorDetails object
     *@param id
     */

    @Override
    public ContractorDetails fetchData(Integer id) {
        ContractorDetails contractorDetails = new ContractorDetails();
        Session session = null;
        try {

            session = sessionFactory.openSession();
            System.out.println("fetch data from id" + id);
            Query query = session.createQuery("FROM ContractorDetails WHERE contOtherId=:id ");
            query.setParameter("id", id);
            contractorDetails = (ContractorDetails) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchdata()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return contractorDetails;
    }
    /*
     *@updateData method to update data
     *@return boolean value
     *@param contractorDetails object
     */

    @Override
    public boolean updateData(Object contApplication) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");

            session.saveOrUpdate(contractorDetails);
            System.out.println("Save contractor details");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:updateData");

        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed");
        }
        return true;
    }
    /*
     *@fetchAll method used to fetch all data from ContractorDetails
     *@return contractorDetailsList
     */

    @Override
    public List<ContractorDetails> fetchAll() {
        System.out.println("fetching all the data from database");
        Session session = null;
        List<ContractorDetails> contractorDetailsList = new ArrayList<ContractorDetails>();
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened");

            session = sessionFactory.openSession();
            contractorDetailsList = session.createQuery("from ContractorDetails").list();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchAll");

        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed");
        }
        return contractorDetailsList;
    }
      /*
     *@fetchApplicantIds method to fetch the ids of ContractorOrganizationType on the basis of Contractor Other details id
     *@return list of id
     *@param id of foreign key
     */
    
    @Override
    public List<Integer> fetchApplicantIds(Integer id) {
        List<Integer> list = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("fetch data from id" + id);
            Query query = session.createQuery("SELECT contAppId FROM ContractorOrganizationType WHERE contOtherId=:id ");
            query.setParameter("id", id);
            list =  query.list();
            System.out.println("Applicant list size is : "+list.size());
            for(Integer i : list){
                System.out.println("i is : "+i);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchdata()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return list;
    }
    /*
     *@deleteApplicant method to delete the ids of ContractorOrganizationType on the basis of Contractor Other details id
     *@return boolean value
     *@param id of foreign key
     */

    @Override
    public boolean deleteApplicant(Integer contOtherId) {
        Session session=null;
         Boolean status = false;
         try {
          session = sessionFactory.openSession();
          
          Query query = session.createQuery("DELETE FROM ContractorOrganizationType  WHERE contOtherId=:contOtherId");
          query.setParameter("contOtherId", contOtherId);
            int i = query.executeUpdate();
             if (i > 0) {
             status = true;
             System.out.println("Applicant is successfully deleted");
          } else {
              status = false;
             System.out.println("In deletion process some error occur");
           }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchdata()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
       return status;
       
    }

    @Override
    public ContractorDetails fetchDatabyRegID(Integer id) {
        ContractorDetails contractorDetails = new ContractorDetails();
        Session session = null;
        try {
          session = sessionFactory.openSession();
            System.out.println("fetch data from REGid" + id);
            Query query = session.createQuery("FROM ContractorDetails WHERE regisId=:id ");
            query.setParameter("id", id);
            contractorDetails = (ContractorDetails) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchdata()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return contractorDetails;
    }  

    @Override
    public Object fetchMsmeDoc() {
        List<ContractorDetails> contractorDetailsList = new ArrayList<ContractorDetails>();
        Session session = null;
        try {
          session = sessionFactory.openSession();
            System.out.println("fetch data for msme and nsic doc by cod id");
            Query query = session.createQuery("FROM ContractorDetails where contCompanyType=1 or contCompanyType=2");
            contractorDetailsList =  query.list();
           } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchMsmeDoc()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return contractorDetailsList;
      
    }

    @Override
    public Object fetchContractorClassDoc() {
   List<ContractorDetails> contractorDetailsList = new ArrayList<ContractorDetails>();
        Session session = null;
        try {
          session = sessionFactory.openSession();
            System.out.println("fetch data for Contractor class");
            Query query = session.createQuery("FROM ContractorDetails where contractorClass=2 or contractorClass=3 or contractorClass=4");
            contractorDetailsList =  query.list();
           } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsdaoImpl and Method:fetchContractorClassDoc()");
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is closed");
        }
        return contractorDetailsList;
      

    }
     @Override
     public String changeMsmeStatusDoc(Integer id) {
       System.out.println("-----------------Method called to changeStatusDoc in ContractorDetailsDaoimpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update ContractorDetails set msmeStatus=:status where id=:id");
            query.setParameter("status", "Enable");
            query.setParameter("id", id);
            query.executeUpdate();
            txn.commit();
            System.out.println("Update MSME/NSIC Document status of Contractor");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       return null;
}
     
         @Override
     public String changeContractorClassStatus(Integer id) {
       System.out.println("-----------------Method called to changeContractorClassStatus in ContractorDetailsDaoimpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update ContractorDetails set contractorClassStatus=:status where id=:id");
            query.setParameter("status", "Enable");
            query.setParameter("id", id);
            query.executeUpdate();
            txn.commit();
            System.out.println("Update ContractorClass Document status of Contractor");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       return null;
}
     
     
   }



