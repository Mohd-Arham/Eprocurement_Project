/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.DSCInfoDao;
import com.eproc.domain.DSCInformationForContractor;
import com.eproc.domain.DSCInformationForDepartmentAdmin;
import com.eproc.domain.DSCInformationForDepartmentUser;
import java.util.ArrayList;
import java.util.List;
import javax.sound.midi.SysexMessage;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
//import org.springframework.stereotype.Service;

/**
 *
 * @author lincpay Solutions
 */
@Repository
public class DSCInfoDaoImpl implements DSCInfoDao{
     @Autowired
   private  SessionFactory sessionFactory;
    
//     public static void main(String[] args) {
//       List<DSCInformationForDepartmentUser> list=new DSCInfoDaoImpl().getDepartmentUserData(18, "Signing");
//         System.err.println("List size is"+list.size());
//    }
     
    @Override
    public List<DSCInformationForDepartmentUser> getDepartmentUserData(String deptId, String type) {
        Session session = null;
        List<DSCInformationForDepartmentUser> dSCInformationForDepartmentUser = new ArrayList<>();
        try {
          session = sessionFactory.openSession();
         Query query = session.createQuery("from DSCInformationForDepartmentUser where dscUserId = :deptId and dscType = :type");
query.setParameter("deptId", deptId);
query.setParameter("type", type);
 dSCInformationForDepartmentUser = query.list();
        } catch (Exception ex) {
            System.err.println("Yha aai exxception");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
//        .System.out.println("END fetchAll method of AddToCart*");
        return dSCInformationForDepartmentUser;
    }

    @Override
    public List<DSCInformationForContractor> getBidderData(String bidderId, String type) {
       Session session = null;
        List<DSCInformationForContractor> dSCInformationForDepartmentUser = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from DSCInformationForContractor where dscUserId = :deptId and dscType = :type");
query.setParameter("deptId", bidderId);
query.setParameter("type", type);
 dSCInformationForDepartmentUser = query.list();
        } catch (Exception ex) {
             ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
//        System.out.println("END fetchAll method of AddToCart*");
        return dSCInformationForDepartmentUser;
    }

    @Override
    public List<DSCInformationForDepartmentAdmin> getDepartmentAdminData(String deptAdminId, String type) {
       Session session = null;
        List<DSCInformationForDepartmentAdmin> dSCInformationForDepartmentUser = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
               Query query = session.createQuery("from DSCInformationForDepartmentAdmin where dscUserId = :deptId and dscType = :type");
query.setParameter("deptId", deptAdminId);
query.setParameter("type", type);
 dSCInformationForDepartmentUser = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
//        System.out.println("END fetchAll method of AddToCart*");
        return dSCInformationForDepartmentUser;
    }
    
}