/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ContractorDesignationDAO;
import com.eproc.dao.SecondaryContractorDAO;
import com.eproc.domain.Contractor;
import com.eproc.domain.ContractorDesignation;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Secondary_Contractor;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.crypto.SecretKey;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import org.apache.catalina.connector.Request;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vaishali Gupta 19-09-2018
 */
@Repository
public class SecondaryContractorDAOImpl implements SecondaryContractorDAO<Secondary_Contractor> {

    @Autowired
    SessionFactory sessionFactory;
    ContractorDesignationDAO contractorDesignationDao;

    @Override
    public boolean insertData(Secondary_Contractor secondaryContractor) {
        System.out.println("----------------Method call to insert Secondary_Contractor in  SecondaryContractorDAOImpl----------------");
        Session session = null;
        boolean flag = false;

        try {

            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(secondaryContractor);
            txn.commit();

        } catch (Exception ex) {
            System.out.println("Class:  SecondaryContractorDAOImpl\nMethod:  insertData");
            System.out.print("Exception in Save secondaryContractor " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
                flag = true;
            }
        }
        return flag;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Secondary_Contractor fetchData(Integer id) {
        System.out.println("-----------------Method called to fetchData Secondary_Contractor in SecondaryContractorDAOImpl----------------------------");
        Session session = null;
        Secondary_Contractor secondaryContractor = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Secondary_Contractor WHERE contractorSecndry_regId =:reg_Id");
            secondaryContractor = (Secondary_Contractor) query.setParameter("reg_Id", id).uniqueResult();

         
      
      
        } catch (Exception ex) {
            System.out.println("Class: SecondaryContractorDAOImpl \n Method:fetchData");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return secondaryContractor;
    }

    @Override
    public boolean updateData(Secondary_Contractor e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("----------------Method call to fetchAll Secondary_Contractor in  SecondaryContractorDAOImpl----------------");
       Session session=null;
       
        
        List<Secondary_Contractor> secondaryContractorList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
          
                
          secondaryContractorList = session.createQuery("FROM Secondary_Contractor").list();
  
        }catch (Exception ex) {
            System.out.print("Exception in fetchall in secondaryContractorList " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return secondaryContractorList;
    }

    @Override
    public String statusValue(Integer reg_Id, String status) {
        System.out.println("-----------------Method called to statusValue secondaryContractor in SecondaryContractorDAOImpl----------------------------");
        Session session = null;

        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
           
            Query query = session.createQuery("update Secondary_Contractor set status=:status where contractorSecndry_regId=:reg_Id");
            query.setParameter("status", status);
            query.setParameter("reg_Id", reg_Id);
            query.executeUpdate();
          
         
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }

        return status;

    }

    @Override
    public boolean checkDuplicateEmail(String email) {
        System.out.println("-----------------Method called to checkDuplicateEmail in SecondaryContractorDAOImpl----------------------------");
        Session session = null;
        boolean emailStatus = false;
        DepartmentUser deptUser = new DepartmentUser();
        Contractor contractor = new Contractor();
        DepartmentSecondaryUser deptSecondUser = new DepartmentSecondaryUser();
        Secondary_Contractor secondaryContractor = new Secondary_Contractor();

        try {
//         System.out.println("hiiiii "+deptId);
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM DepartmentUser where emailAdd=:email ");
            query.setParameter("email", email);
//          query.setParameter("deptId", deptId);
            deptUser = (DepartmentUser) query.uniqueResult();

            if (deptUser == null) {
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
                query = session.createQuery("FROM Contractor where emailid=:email");
                query.setParameter("email", email);
                contractor = (Contractor) query.uniqueResult();

            }
            if (contractor == null) {
//              System.out.println(" contractor "+contractor.getEmailid());  
                query = session.createQuery("FROM DepartmentSecondaryUser where emailAdd=:email ");
                query.setParameter("email", email);
//            query.setParameter("deptId", deptId);
                deptSecondUser = (DepartmentSecondaryUser) query.uniqueResult();

            }
            if (deptSecondUser == null) {
//                System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
                query = session.createQuery("FROM Secondary_Contractor where emailid=:email ");
                query.setParameter("email", email);
//            query.setParameter("deptId", deptId);
                secondaryContractor = (Secondary_Contractor) query.uniqueResult();
            }
            if (deptUser != null) {
                System.out.println(" deptUser " + deptUser.getEmailAdd());
                emailStatus = true;
            }
            if (contractor != null) {
                System.out.println(" contractor " + contractor.getEmailid());
                emailStatus = true;
            }
            if (deptSecondUser != null) {
                System.out.println(" deptSecondUser " + deptSecondUser.getEmailAdd());
                emailStatus = true;
            }
            if (secondaryContractor != null) {
                System.out.println(" secondaryContractor " + secondaryContractor.getEmailid());
            }

        } catch (Exception ex) {
            System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return emailStatus;
    }

    @Override
    public boolean checkDuplicateContect(String mobile) {
        System.out.println("-----------------Method called to checkDuplicateContect in SecondaryContractorDAOImpl----------------------------");
        Session session = null;
        boolean contectStatus = false;
        DepartmentUser deptUser = new DepartmentUser();
        Contractor contractor = new Contractor();
        DepartmentSecondaryUser deptSecondUser = new DepartmentSecondaryUser();
          Secondary_Contractor secondaryContractor = new Secondary_Contractor();

        try {

            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM DepartmentUser where mobNo=:mobNo");
            query.setParameter("mobNo", mobile);
//          query.setParameter("deptId", deptId);
            deptUser = (DepartmentUser) query.uniqueResult();

            if (deptUser == null) {
                query = session.createQuery("FROM Contractor where mobileno=:mobileno");
                query.setParameter("mobileno", mobile);
                contractor = (Contractor) query.uniqueResult();

            }
            if (contractor == null) { query = session.createQuery("FROM DepartmentSecondaryUser where mobNo=:mobNo ");
                query.setParameter("mobNo", mobile);
      
                deptSecondUser = (DepartmentSecondaryUser) query.uniqueResult();
                 }  
            if (deptSecondUser == null) { query = session.createQuery("FROM Secondary_Contractor where mobileno=:mobileno ");
                query.setParameter("mobileno", mobile);
                secondaryContractor = (Secondary_Contractor) query.uniqueResult();
            }
          
            if (deptUser != null) {
                System.out.println(" deptUser " + deptUser.getEmailAdd() + "    " + deptUser.getMobNo());
                contectStatus = true;
            }
            if (contractor != null) {
                System.out.println(" contractor " + contractor.getEmailid() + "    " + contractor.getMobileno());
                contectStatus = true;
            }
            if (deptSecondUser != null) {
                System.out.println(" deptSecondUser " + deptSecondUser.getEmailAdd() + "        " + deptSecondUser.getMobNo());
                contectStatus = true;
            }
              if (secondaryContractor != null) {
                System.out.println(" secondaryContractor " + secondaryContractor.getEmailid());
            }

        } catch (Exception ex) {
            System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return contectStatus;
    }

    @Override
    public boolean emailverified(int id) {
        System.out.println("-----------------Method called to Emailverified  in SecondaryContractorDAOImpl----------------------------");
        Session session = null;
        boolean flag = false;

        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Secondary_Contractor set emailVerifyStatus=:status where contractorSecndry_regId=:reg_Id");
            query.setParameter("status", "verified");
            query.setParameter("reg_Id", id);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
                flag = true;
            }
            System.out.println("session is closed in update");
        }

        return flag;
    }

    @Override
    public boolean createPassword(int reg_Id, String encreptPassword, SecretKey secretKey) {
       System.out.println("----Method called to createPassword DepartmentUser in SecondaryContractorDAOImpl----------------");
       Session session = null;
       boolean flag=false;
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Secondary_Contractor set password=:password , secretKey=:secretKey where contractorSecndry_regId=:reg_Id");
            query.setParameter("password", encreptPassword);
            query.setParameter("secretKey", secretKey);
            query.setParameter("reg_Id", reg_Id);
            query.executeUpdate();
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
                flag=true;
            }
            System.out.println("session is closed in update");
        }
       
   
   return flag;
     } 

    
    
     @Override
    public boolean mobileverified(int id) {
        System.out.println("-----------------Method called to mobileverified  in SecondaryContractorDAOImpl----------------------------");
       Session session = null;
       boolean flag=false;
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update Secondary_Contractor set mobileVerifyStatus=:status where contractorSecndry_regId=:regId");
            query.setParameter("status", "verified");
            query.setParameter("regId", id);
            query.executeUpdate();
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
                flag=true;
            }
            System.out.println("session is closed in update");
        }
       
   
   return flag;
     }

    @Override
    public List fetchAllByPrimaryContractor(int id) {
       System.out.println("----------------Method call to fetchAllByPrimaryContractor Secondary_Contractor in  SecondaryContractorDAOImpl----------------");
       System.out.println("primaryId "+id);
        Session session = null;
       
       List<Secondary_Contractor> secondaryContractorList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
         Query query = session.createQuery("FROM Secondary_Contractor where primaryContractor_regId=:primaryContractor_regId");
       secondaryContractorList = query.setParameter("primaryContractor_regId", id).list();
       
       }catch (Exception ex) {
            System.out.print("Exception in fetchAllByPrimaryContractor in secondaryContractorList " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return secondaryContractorList;
    }
}
