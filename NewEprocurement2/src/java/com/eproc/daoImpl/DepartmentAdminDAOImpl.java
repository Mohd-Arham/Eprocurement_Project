/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.DepartmentAdminDAO;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Secondary_Contractor;
import com.eproc.logs.LogsAction;
import com.eproc.util.CommonUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Naina Jain
 */
@Repository
public class DepartmentAdminDAOImpl implements DepartmentAdminDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    LogsAction logsAction;

    CommonUtil commonUtil = new CommonUtil();

    @Override
    public boolean insertData(DepartmentAdmin e) {
       System.out.println("----------------Method call to insert department in  DepartmentAdminDaoImpl----------------");
        Session session = null;

        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();

            session.saveOrUpdate(e);
            System.out.print("department  save object is " + e);
            txn.commit();
            System.out.println("Department  save status is : ");

        } catch (Exception ex) {
            System.out.print("Exception in Save superadmin " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("----------------Method end to insert department in  DepartmentAdminDaoImpl----------------");
        return false;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DepartmentAdmin fetchData(Integer deptId) {
    
   System.out.println("----------------Method call to fetch data by department id  in DepartmentAdminDAOImpl----------------");
        DepartmentAdmin department = new DepartmentAdmin();
        Session session = null;
        System.out.println("/deptId "+deptId+"/");
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM DepartmentAdmin WHERE deptId =:deptId");
            query.setParameter("deptId", deptId);
            department = (DepartmentAdmin) query.uniqueResult();
            System.out.println("department "+department);
        } catch (Exception ex) {
            System.out.print("Exception in fetch department " + ex.getMessage());
        } finally {
            session.close();
        }
      System.out.println("----------------Method end to fetch data by department id  in DepartmentAdminDAOImpl----------------");
        return department;
    }

    @Override
    public boolean updateData(DepartmentAdmin e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("**************fetchAll method run**************");
        List<DepartmentAdmin> departmentAdminList = new ArrayList<DepartmentAdmin>();
        Session session = sessionFactory.openSession();
        try {
            departmentAdminList = session.createQuery("FROM DepartmentAdmin").list();
            System.out.println("departmentAdminList "+departmentAdminList.size());
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return departmentAdminList;
    }

   @Override
    public boolean checkLogin(String validUser) {
        System.out.println("**************checkLogin method run**************");
        Session session = null;
        boolean flag = true;
        List deptadminlist = null;
        String SQL_QUERY = "";
        try {
            session = sessionFactory.openSession();
            System.out.println("@@~~~ open session ~~~@@");
            SQL_QUERY = "from DepartmentAdmin";
            Query query = session.createQuery(SQL_QUERY);
              System.out.println("@@~~~ query hit ~~~@@");
            //query.setParameter("validUser", validUser);
             System.out.println("@@~~~ query set param ~~~@@");
            deptadminlist = query.list();
             System.out.println("@@~~~ list fetch ~~~@@"+deptadminlist.size());
            if ((deptadminlist != null) && (deptadminlist.size() > 0)) {
                  System.out.println("@@~~~ inside if ~~~@@");
                flag = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END****************************************");
        return flag;
    }

    //TO SAVE CURRENT-LOGIN & LAST LOGIN DATETIME & IP-MAC ADDRESS
    @Override
    public void saveStatus(Common_Logon_Status commonlogin) {
        System.out.println("**************saveStatus deptAdmin method run**************");
        Session sn = sessionFactory.openSession();
        Transaction txn = sn.beginTransaction();
        try {   
//            commonlogin.setOsName(logsAction.FetchOSName());
//            commonlogin.setIp_Address(logsAction.fetchIpAddress());
//            commonlogin.setMac_Address(logsAction.fetchMacAddress());
            sn.saveOrUpdate(commonlogin);
            txn.commit();
        } catch (Exception ex) {
            Logger.getLogger(DepartmentAdminDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            sn.close();
        }
        System.out.println("*******************END****************************************");
    }
    
//TO FETCH CURRENT-LOGIN & LAST LOGIN DATETIME
    @Override
    public List<Common_Logon_Status> fetchAllLogonStatus() {
        System.out.println("**************fetchAllLogonStatus deptUser method run**************");
        Session session = sessionFactory.openSession();
        List<Common_Logon_Status> common_logonList = new ArrayList<Common_Logon_Status>();
        try {
            common_logonList = session.createQuery("FROM Common_Logon_Status").list();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return common_logonList;
    }
     @Override
      public Common_Logon_Status fetchDetails(Integer id) {
       System.out.println("----------------Method call to fetch data by common login id  in DepartmentAdminDAOImpl----------------");
        Common_Logon_Status commonLogon=new Common_Logon_Status();
        Session session = null;
        System.out.println("/id "+id+"/");
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Common_Logon_Status WHERE id =:id");
            query.setParameter("id", id);
            commonLogon = (Common_Logon_Status) query.uniqueResult();
            System.out.println("commonLogon: "+commonLogon);
        } catch (Exception ex) {
            System.out.print("Exception in fetch commonLogon " + ex.getMessage());
        } finally {
            session.close();
        }
      System.out.println("----------------Method end to fetch data by commonLogon id  ----------------");
        return commonLogon;
}
      
      @Override
    public List fetchAllDeptName() {
        System.out.println("**************DepartmentAdminDaoImpl's fetchAllDeptName method run**************");
        Session session = null;
        List<DepartmentAdmin> deptList = new ArrayList<DepartmentAdmin>();
        try {
            session = sessionFactory.openSession();
            deptList = session.createQuery("select deptName from DepartmentAdmin").list();
        } catch (Exception ex) {
            System.out.println("Class: DepartmentAdminDaoImpl \n Method:fetchAllDeptName");
            System.out.println("Exception in fetchAllDeptName method of DepartmentAdminDaoImpl " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchAllDeptName method of DepartmentAdminDaoImpl****************************************");
        return deptList;
    }
      @Override
    public boolean checkDuplicateEmail(String email, Integer deptId) {
     System.out.println("-----------------Method called to checkDuplicateEmail in DepartmentAdminDaoImpl----------------------------");
     Session session = null;
     boolean emailStatus=false;
     DepartmentUser deptUser=new DepartmentUser();
     Contractor contractor=new Contractor();
     Secondary_Contractor secondary_contractor =new Secondary_Contractor();
     DepartmentAdmin deptAdmin = new DepartmentAdmin();
     try{
         System.out.println("deptId::: "+deptId);
         session = sessionFactory.openSession();
         
          Query query = session.createQuery("FROM DepartmentAdmin where deptEmailId =:email and deptId !=:deptId");
          query.setParameter("email", email);
          query.setParameter("deptId", deptId);
          deptAdmin=(DepartmentAdmin) query.uniqueResult();

          if(deptAdmin == null){
         query = session.createQuery("FROM DepartmentUser where emailAdd=:email");
         query.setParameter("email", email);
         deptUser=(DepartmentUser) query.uniqueResult();
           
          }
          if(deptUser == null){
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
          query = session.createQuery("FROM Contractor where emailid=:email");
          query.setParameter("email", email);
          contractor= (Contractor) query.uniqueResult();
        
          } if(contractor==null){
//              System.out.println(" contractor "+contractor.getEmailid());  
           query = session.createQuery("FROM Secondary_Contractor where emailid=:email");
          query.setParameter("email", email);
          secondary_contractor=  (Secondary_Contractor) query.uniqueResult();
         
           } 

             if(deptAdmin != null)
            {
                 System.out.println(" deptAdmin "+deptAdmin.getDeptEmailId());
                  emailStatus=true;
            }
 
           if(deptUser != null){
               System.out.println(" deptUser "+deptUser.getEmailAdd());
                emailStatus=true;
           }
          if(contractor!=null){
               System.out.println(" contractor "+contractor.getEmailid());
                emailStatus=true;
          }
          if(secondary_contractor!=null){
               System.out.println(" secondary_contractor "+secondary_contractor.getEmailid());
                emailStatus=true;
          }
         
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
        System.out.println("-----------------Method End to checkDuplicateEmail in DepartmentAdminDaoImpl----------------------------");
   return emailStatus;
    }

    @Override
    public boolean checkDuplicateContact(String mobile, Integer deptId) {
        System.out.println("-----------------Method called to checkDuplicateContact in DepartmentAdminDaoImpl----------------------------");
     Session session = null;
     boolean mobileStatus=false;
     DepartmentUser deptUser=new DepartmentUser();
     Contractor contractor=new Contractor();
     Secondary_Contractor secondary_contractor =new Secondary_Contractor();
     DepartmentAdmin deptAdmin = new DepartmentAdmin();
     try{
         System.out.println("deptId::: "+deptId);
         session = sessionFactory.openSession();
         
          Query query = session.createQuery("FROM DepartmentAdmin where deptMobNo =:mobile and deptId !=:deptId");
          query.setParameter("mobile", mobile);
          query.setParameter("deptId", deptId);
          deptAdmin=(DepartmentAdmin) query.uniqueResult();

          if(deptAdmin == null){
         query = session.createQuery("FROM DepartmentUser where mobNo=:mobile");
         query.setParameter("mobile", mobile);
         deptUser=(DepartmentUser) query.uniqueResult();
           
          }
          if(deptUser == null){
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
          query = session.createQuery("FROM Contractor where mobileno=:mobile");
          query.setParameter("mobile", mobile);
          contractor= (Contractor) query.uniqueResult();
        
          } if(contractor==null){
//              System.out.println(" contractor "+contractor.getEmailid());  
           query = session.createQuery("FROM Secondary_Contractor where mobileno=:mobile");
          query.setParameter("mobile", mobile);
          secondary_contractor=  (Secondary_Contractor) query.uniqueResult();
         
           } 

             if(deptAdmin != null)
            {
                 System.out.println(" deptAdmin "+deptAdmin.getDeptMobNo());
                  mobileStatus=true;
            }
 
           if(deptUser != null){
               System.out.println(" deptUser "+deptUser.getMobNo());
                mobileStatus=true;
           }
          if(contractor!=null){
               System.out.println(" contractor "+contractor.getMobileno());
                mobileStatus=true;
          }
          if(secondary_contractor!=null){
               System.out.println(" secondary_contractor "+secondary_contractor.getMobileno());
                mobileStatus=true;
          }
         
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
        System.out.println("-----------------Method End to checkDuplicateContact in DepartmentAdminDaoImpl----------------------------");
   return mobileStatus;
    }
}
