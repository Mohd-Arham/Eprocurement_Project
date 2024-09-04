/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.DepartmentDao;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.DepartmentAdmin;
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
public class DepartmentDaoImpl implements DepartmentDao {

    @Autowired
    SessionFactory sessionFactory;
    
    @Autowired
    LogsAction logsAction;
            

    CommonUtil commonUtil = new CommonUtil();

//TO SAVE DEPARTMENT-USER 
    @Override
    public boolean insertData(DepartmentAdmin department) {
        System.out.println("**************insertData deptUser method run**************");
        Session session = sessionFactory.openSession();
        Transaction txn = session.beginTransaction();
        try {
//            String enc_pwd = commonUtil.encrypt(department.getEnc_pwd(), "0xFACA");
//            department.setEnc_pwd(enc_pwd);
            session.saveOrUpdate(department);
            txn.commit();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return true;
    }
//TO DELETE DEPARTMENT-USER DATA BY ID

    @Override
    public boolean removeData(Integer id) {
        System.out.println("**************removeData deptUser method run**************");
        DepartmentAdmin department = new DepartmentAdmin();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("DELETE FROM DepartmentAdmin WHERE " + "id =:id");
            query.setParameter("id", id);
            query.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return true;
    }

//TO FETCH DEPARTMENT-USER DATA BY ID to UPDATE
    @Override
    public DepartmentAdmin fetchData(Integer id) {
        System.out.println("**************fetchData deptUser method run**************");
        DepartmentAdmin department = new DepartmentAdmin();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Department WHERE deptId =:id");
            query.setParameter("id", id);
            department = (DepartmentAdmin) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return department;
    }

//TO FETCH ALL DEPARTMENT-USER

    @Override
    public List fetchAll() {
        System.out.println("**************fetchAll deptUser method run**************");
        List<DepartmentAdmin> departmentList = new ArrayList<DepartmentAdmin>();
        Session session = sessionFactory.openSession();
        try {
            departmentList = session.createQuery("FROM DepartmentAdmin").list();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return departmentList;
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
    public List<Contractor> fetchAllLogonStatus() {
        System.out.println("**************fetchAllLogonStatus deptUser method run**************");
        Session session = sessionFactory.openSession();
        List<Contractor> contractorList = new ArrayList<Contractor>();
        try {
            contractorList = session.createQuery("FROM Contractor").list();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        System.out.println("*******************END****************************************");
        return contractorList;
    }

//TO CHECK LOGIN USER IS VALID OR NOT
    @Override
    public String checkLogin(String validUser) {
        System.out.println("**************checkLogin deptUser method run**************");
        Session session = null;
        String flag = null;
        List list = null;
        String SQL_QUERY = "";
        try {
            session = sessionFactory.openSession();
            SQL_QUERY = "from Department where EmailId =:validUser or MobileNo =:validUser";
            Query query = session.createQuery(SQL_QUERY);
            query.setParameter("validUser", validUser);
            list = query.list();
            if ((list != null) && (list.size() > 0)) {
                flag = "DepartmentUser";
            } else {
                SQL_QUERY = "from Contractor where emailid =:validUser or mobileno =:validUser";
                Query query1 = session.createQuery(SQL_QUERY);
                query1.setParameter("validUser", validUser);
                list = query1.list();
                if ((list != null) && (list.size() > 0)) {
                    flag = "Contractor";
                }
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

    @Override
    public boolean updateData(DepartmentAdmin e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

}
