/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.DepartmentSecondaryUserDao;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import java.util.ArrayList;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vaishali Gupta
 */
@Repository
public class DepartmentSecondaryUserDaoImpl implements DepartmentSecondaryUserDao<DepartmentSecondaryUser>{

    @Autowired
    SessionFactory sessionFactory;
    
    
    @Override
    public boolean insertData(DepartmentSecondaryUser departmentSecondaryUser) {
         System.out.println("-----------------Method called to insertData DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------"); 
     Session session = null;
     boolean result = true;
     try{
        
         session = sessionFactory.openSession();
         Transaction txn = session.beginTransaction();
         session.saveOrUpdate(departmentSecondaryUser);
          txn.commit();
     }catch(Exception ex){
            System.out.println("Class: DepartmentSecondaryUserDaoImpl \n Method:insertdata");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
      System.out.println("-----------------Method end to insertData DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
     return result;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DepartmentSecondaryUser fetchData(Integer reg_Id) {
        System.out.println("-----------------Method called to fetchData DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
        System.out.println("/Reg Id:"+reg_Id+"/");
       DepartmentSecondaryUser departmentSecondaryUser = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM DepartmentSecondaryUser WHERE secondory_reg_Id =:reg_Id");
           departmentSecondaryUser = (DepartmentSecondaryUser) query.setParameter("reg_Id", reg_Id).uniqueResult();
        
         
       }catch(Exception ex){
              System.out.println("Class: DepartmentSecondaryUserDaoImpl \n Method:fetchData");
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
        System.out.println("-----------------Method called to fetchData DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       return departmentSecondaryUser;
    }
    
    
    public DepartmentSecondaryUser fetchDataByReg_Id(Integer reg_Id) {
        System.out.println("-----------------Method called to fetchData DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
        System.out.println("/Reg Id:"+reg_Id+"/");
       DepartmentSecondaryUser departmentSecondaryUser = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM DepartmentSecondaryUser WHERE reg_Id =:reg_Id");
           departmentSecondaryUser = (DepartmentSecondaryUser) query.setParameter("reg_Id", reg_Id).uniqueResult();
        
         
       }catch(Exception ex){
              System.out.println("Class: DepartmentSecondaryUserDaoImpl \n Method:fetchData");
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
        System.out.println("-----------------Method called to fetchData DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       return departmentSecondaryUser;
    }

    @Override
    public boolean updateData(DepartmentSecondaryUser e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @SuppressWarnings("unchecked")
    public List fetchAll() {
        System.out.println("-----------------Method called to fetchAll DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentSecondaryUser> departmentSecondaryUser = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentSecondaryUser");
         departmentSecondaryUser = query.list();
         System.out.println("The DepartmentSecondaryUser User List is: "+departmentSecondaryUser.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentSecondaryUserDaoImpl \n Method:fetchAll");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAll DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
     return departmentSecondaryUser; }
    
    
    
    @Override
     public String statusValue(Integer reg_Id, String status){
       
        System.out.println("-----------------Method called to statusValue DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
      
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentSecondaryUser set status=:status where secondory_reg_Id=:reg_Id");
            query.setParameter("status", status);
            query.setParameter("reg_Id", reg_Id);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update document");
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
     public List getEA_UERS(){
       
        System.out.println("-----------------Method called to statusValue DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> EA_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentSecondaryUser where userPrivileges like '%,9,%' or userPrivileges like '9' or userPrivileges like '9,%' or userPrivileges like '%,9'");

           EA_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return EA_User;
   
   }
     
    @Override
       public List getEB_UERS(){
       
        System.out.println("-----------------Method called to statusValue DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> EB_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentSecondaryUser where userPrivileges like '%10%'");

           EB_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return EB_User;
   
   }
       
    @Override
         public List getEC_UERS(){
       
        System.out.println("-----------------Method called to statusValue DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> EC_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentSecondaryUser where userPrivileges like '%11%'");

           EC_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return EC_User;
   
   }

    @Override
    public List enable_User() {
           System.out.println("-----------------Method called to enable_USer DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentSecondaryUser> enable_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentSecondaryUser where status equal Enable");
            enable_User= query.list();
            txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return enable_User;
    }

    @Override
    public List fetchAllByDept_Id(Integer deptId) {
     System.out.println("-----------------Method called to fetchAllByDept_Id DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentSecondaryUser> departmentSecondaryUser = new ArrayList<>();
      try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentSecondaryUser where deptId=:deptId");
          query.setParameter("deptId", deptId);
         departmentSecondaryUser = query.list();
         System.out.println("The Depratment User List is: "+departmentSecondaryUser.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAllByDept_Id DepartmentSecondaryUser in DepartmentSecondaryUserDaoImpl----------------------------");
     return departmentSecondaryUser; }


    @Override
    public List userOfAmmendmentPrivilege(Integer deptId, String status) { 
       System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
       List <DepartmentSecondaryUser> userOfAmmendmentPrivilege=new ArrayList<>();
       try{        
        session = sessionFactory.openSession();
        System.out.println("session is opened Department Id: "+deptId);
        Transaction txn = session.beginTransaction();
        Query query=session.createQuery("from DepartmentSecondaryUser where deptId=:deptId AND status=:status AND userPrivileges like '%,5,%' or userPrivileges like '5' or userPrivileges like '5,%' or userPrivileges like '%,5'");
        query.setParameter("deptId", deptId);
        query.setParameter("status", status);
        userOfAmmendmentPrivilege= query.list();
        txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }  
        }
        
     return userOfAmmendmentPrivilege;   
    }
    
     /*
     * userOfTenderApproval
     * Method call to fetch Officer on the privileges give as Tender Release And Amendment having Enable     * status
     * created 10 Oct 2018
     * 
     */
    @Override
    public List userOfTenderApproval(Integer deptId, String status) {
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
      Session session = null;
      List <DepartmentUser> userOfTenderApproval=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened Department Id: "+deptId);
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentSecondaryUser where deptId=:deptId AND status=:status AND userPrivileges like '%,5,%' or userPrivileges like '5' or userPrivileges like '5,%' or userPrivileges like '%,5'");
            query.setParameter("deptId", deptId);
            query.setParameter("status", status);
            userOfTenderApproval= query.list();
            txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
   return userOfTenderApproval;
    }

    public String getPrivileges(int red_Id, int deptId) {
        Session session = null;
        String privileges = "";
        Query query = null;
        DepartmentSecondaryUser departmentSecondaryUser = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened Department Id: " + deptId);
            Transaction txn = session.beginTransaction();
            query = session.createQuery("from DepartmentSecondaryUser where deptId=:deptId and secondory_reg_Id=:red_Id");
            query.setParameter("deptId", deptId);
            query.setParameter("red_Id", red_Id);
            departmentSecondaryUser = (DepartmentSecondaryUser) query.uniqueResult();
            privileges = departmentSecondaryUser.getUserPrivileges();
            txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return privileges;
    }
}
