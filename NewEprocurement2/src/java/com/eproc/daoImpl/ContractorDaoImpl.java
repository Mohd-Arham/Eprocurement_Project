/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDao;
import com.eproc.domain.Contractor;
import com.eproc.util.AesEncrDec;
import com.eproc.util.EncDec;
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
 * @author Yashovardhan Singh
 * @Since 01 July 2018
 * @version 2.0.0
 */
@Repository
public class ContractorDaoImpl implements ContractorDao<Contractor> {

    @Autowired
    SessionFactory sessionFactory;
    @Autowired
    AesEncrDec aesEncrDec;
    @Autowired
    EncDec EncDec;

//----------------------------------Contractor Save-----------------------------
     /*
     *InsertContractor
     *Method used to save the Contractor
     *@See Contractor save
     *Param ContractorObject
     */
    @Override
    public boolean insertData(Contractor contractor) {
        Session session = null;
        boolean status = true;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("Session is opnen");
            txn = session.beginTransaction();
            System.out.println("Transaction is begin");
            session.saveOrUpdate(contractor);
           
        } catch (Exception e) {
            txn.rollback();
            System.out.println("Class:ContractorDaoImpl \n Method:insertData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
             if (txn != null) {
                txn.commit();
            }
            if (session != null) {
                session.close();
            }
            System.out.println("Session is Closed");
        }
        return status;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
//------------------------------------------------------------------------------
    /*
     *GeneratePassword
     *Method used to Fetch contractor List based on id
     *@See Contractor list based on id
     *Param Contractor list based on id
     */

    @Override
    public Contractor fetchData(Integer id) {
        Session session = null;
        Contractor contractor = new Contractor();
        try {
            System.out.println("call fetchData method to retrieve data by perticuler id for edit details of Contractor");
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Contractor WHERE id =:id");
            query.setParameter("id", id);
            contractor = (Contractor) query.uniqueResult();
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:fetchData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contractor;
    }
//------------------------------------------------------------------------------

    @Override
    public boolean updateData(Contractor contractor) {
       Session session = null;
        boolean status = true;
        try {
            session = sessionFactory.openSession();
            System.out.println("Session is opnen");
            Transaction txn = session.beginTransaction();
            System.out.println("Transaction is begin");
            session.update(contractor);
            txn.commit();
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:updateData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Session is Closed updateData");
        }
        return status; 
    }

//------------------------------------------------------------------------------
    /*
     *GeneratePassword
     *Method used to Fetch contractor List
     *@See Contractor list
     *Param Contractor list
     */
    @Override
    public List<Contractor> fetchAll() {
        Session session = null;
        List<Contractor> contractorList = new ArrayList<Contractor>();
        try {
            session = sessionFactory.openSession();
            contractorList = session.createQuery("FROM Contractor").list();
            System.out.println("contractorList size :"+contractorList.size());
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:fetchData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contractorList;
    }
    
    
    public List<Contractor> fetchAll(String areaOfWork, String contractorStatus) {
        Session session = null;
        List<Contractor> contractorList = new ArrayList<Contractor>();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Contractor WHERE id IN (SELECT contId FROM ProductWiseEmpanelment WHERE AreaOfWork =:areaOfWork AND templateStatus =:contractorStatus)");
            query.setParameter("areaOfWork", areaOfWork);
            query.setParameter("contractorStatus", contractorStatus);
            contractorList = query.list();
            System.out.println(contractorList.size());
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:fetchData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contractorList;
    }
//------------------------------------------------------------------------------
    /*
     *GeneratePassword
     *Method used to passwordcheck
     *@See passwordcheck
     *Param passwordcheck
     */

    @Override
    public boolean passwordcheck(String password, String newPassword, String currentPassword) {
        Contractor contractor = new Contractor();
        Session session = sessionFactory.openSession();
        System.out.println("session is open");
        boolean ContractorFound = false;
        System.out.println("query execution start");
        Query query = session.createQuery("FROM Contractor WHERE password=?");
        query.setParameter(0, "password");
        System.out.println("Query execution end");
        //        aesEncrDec.decrypt(password);
//      EncDec.decrypt(password);
        System.out.println(password);
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {
            ContractorFound = true;
        }
        session.close();
        return ContractorFound;
    }
        /**
     * @emailverified Method
     * @emailverified method used to update the email verify status to verified
     * @param contractor registration id
     */
      @Override
     public String emailverified(Integer EmailNo,String status) {
       System.out.println("-----------------Method called to Emailverified Contractor in ContractorDaoImpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Contractor set emailStatus=:status where id=:id");
            query.setParameter("status", status);
            query.setParameter("id", EmailNo);
            query.executeUpdate();
            txn.commit();
            System.out.println("Update Email status of Contractor");
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
        /**
     * @mobileverified Method
     * @mobileverified method used to update the mobile status to verified
     * @param mobile number 
     */
          @Override
    public String mobileverified(String mobNo,String status) {
        System.out.println("-----------------Method called:mobileverified Contractor in ContractorDaoImpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Contractor set mobileStatus=:status where mobileno=:mobNo");
            query.setParameter("status", status);
            query.setParameter("mobNo", mobNo);
            query.executeUpdate();
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update the mobile statos of contractor");
        }
     return null;
     }

    @Override
    public Contractor fetchIdbyEmail(String emailid) {
          Session session = null;
        Contractor contractor = new Contractor();
        try {
            System.out.println("call fetchData method to retrieve data by perticuler id for edit details of Contractor");
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Contractor WHERE emailid=:emailid");
            query.setParameter("emailid", emailid);
            contractor = (Contractor) query.uniqueResult();
        } catch (Exception e) {
            System.out.println("Class:ContractorDaoImpl \n Method:fetchData");
            System.out.println("Exception:" + e.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contractor;
        
      
    }

     @Override
     public String updateContractorPassword(Integer regId, String Password, SecretKey secretKey) {
     
     System.out.println("----Method updateContractorPassword contractorDaoImpl----------------");
       Session session = null;
       String status="true";
      try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Contractor set password=:password , secretKey=:secretKey where id=:id");
            query.setParameter("password", Password);
            query.setParameter("secretKey", secretKey);
            query.setParameter("id", regId);
            query.executeUpdate();
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update in contractor");
        }
        return status;
     }

    @Override
    public String updateContractorMobileNumber(Integer id, String mobileNo) {
      System.out.println("----Method updateContractorMobileNumber contractorDaoImpl----------------");
       Session session = null;
       String status="false";
      try{
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Contractor set mobileno=:mobileno where id=:id");
            query.setParameter("mobileno",mobileNo);
            query.setParameter("id", id);
            int a= query.executeUpdate();
            if(a>0){
            System.out.println("value in updating mobileNumber "+a);
            status ="true";
            }
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update in contractor");
        }
        return status;
    }

    @Override
    public String updateContractorEmailId(Integer id, String emailId) {
     System.out.println("----Method updateContractorMobileNumber contractorDaoImpl----------------");
       Session session = null;
       String status="false";
      try{
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Contractor set emailid=:emailid where id=:id");
            query.setParameter("emailid",emailId);
            query.setParameter("id", id);
            int a= query.executeUpdate();
            if(a>0){
           System.out.println("value in updating emailId "+a);
            status ="true";
            }
          txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update in contractor");
        }
        return status;  
    }
    
    
}
