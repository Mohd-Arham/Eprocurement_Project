/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EmpanelmentDynamiclTemplateDAO;
import com.eproc.domain.EmpanelmentDynamicTemplate;
import com.eproc.domain.EmpanelmentTemplateName;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Mansi Jain
 */
@Repository
public class EmpanelmentDynamicTemplateDAOImpl implements EmpanelmentDynamiclTemplateDAO{

     @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public boolean insertData(EmpanelmentDynamicTemplate empanelmentDynamicTemplate) {
       System.out.print(" call insertData method to save data of the database ");
        Session session = sessionFactory.openSession();
        Transaction txn = session.beginTransaction();
       session.saveOrUpdate(empanelmentDynamicTemplate);
        System.out.println("my sequenceId Is :" +empanelmentDynamicTemplate.getSequenceIdA());
        txn.commit();
        session.close();
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmpanelmentDynamicTemplate fetchData(Integer templatenameId) {
        System.out.println("----------------Method call to fetch EmpanelmentDynamicTemplate by id in  EmpanelmentDynamicTemplateDaoImpl----------------");
        EmpanelmentDynamicTemplate empanelmentDynamicTemplate = new EmpanelmentDynamicTemplate();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM EmpanelmentDynamicTemplate WHERE templatenameId=:templatenameId");
            query.setParameter("templatenameId", templatenameId);
            empanelmentDynamicTemplate = (EmpanelmentDynamicTemplate) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:  EmpanelmentDynamicTemplateDaoImpl\nMethod:  fetchData");
            System.out.print("Exception in fetch EmpanelmentDynamicTemplate" + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch EmpanelmentDynamicTemplate by id in  EmpanelmentDynamicTemplateDaoImpl----------------");
        return empanelmentDynamicTemplate;
    }
    

    @Override
    public boolean updateData(EmpanelmentDynamicTemplate e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAllbyTemplateid(int templatenameId) {
        System.out.println("----------------Method call to fetch all Template  in EmpanelmentDynamicTemplateDaoImpl----------------");
        Session session = null;
        List<EmpanelmentDynamicTemplate> empanelmentDynamicTemplateList = new ArrayList<EmpanelmentDynamicTemplate>();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM EmpanelmentDynamicTemplate WHERE templatenameId =:templatenameId");
            empanelmentDynamicTemplateList = query.setParameter("templatenameId", templatenameId).list();           
        } catch (Exception ex) {
            System.out.println("Class:  EmpanelmentDynamicTemplateDaoImpl\nMethod:  fetchAll");
            System.out.print("Exception in fetchAll EmpanelmentDynamicTemplate " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch all EmpanelmentDynamicTemplate in  EmpanelmentDynamicTemplateDaoImpl----------------");
        return empanelmentDynamicTemplateList;
    }
    
    @Override
    public List fetchAll() {
        System.out.println("----------------Method call to fetch all circle in CircleDaoImpl----------------");
        Session session = null;
        List<EmpanelmentDynamicTemplate> empanelmentDynamicTemplateList = new ArrayList<EmpanelmentDynamicTemplate>();
        try {
            session = sessionFactory.openSession();
            empanelmentDynamicTemplateList = session.createQuery("FROM EmpanelmentDynamicTemplate").list();
            
        } catch (Exception ex) {
            System.out.println("Class:  EmpanelmentDynamicTemplateDaoImpl\nMethod:  fetchAll");
            System.out.print("Exception in fetchAll EmpanelmentDynamicTemplate " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch all EmpanelmentDynamicTemplate in  EmpanelmentDynamicTemplateDaoImpl----------------");
        return empanelmentDynamicTemplateList;
    }
    

    @Override
    public boolean saveEmpanelmentTemplatename(EmpanelmentTemplateName empanelmentTemplateName) {
        System.out.println("*******************Save EmpanelmentTemplateName Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        System.out.println("inside dqao  is : "+empanelmentTemplateName.getTemplatename());
             Transaction txn = session.beginTransaction();
        session.saveOrUpdate(empanelmentTemplateName);
        System.out.println("auction dynamicEnvelope Id" +empanelmentTemplateName.getTemplatenameId());
        txn.commit();
        session.close();
        System.out.println("*******************END****************************************");
        return true;
    }

    @Override
    public List fetchAllTemplateNameData() {
         System.out.println("----------------Method call to fetch all EmpanelmentTemplateNameData in EmpanelmentDynamicTemplateDaoImpl----------------");
        Session session = null;
        List<EmpanelmentTemplateName> templateNameDataList = new ArrayList<EmpanelmentTemplateName>();
        try {
            session = sessionFactory.openSession();
            templateNameDataList = session.createQuery("FROM EmpanelmentTemplateName").list();
            
        } catch (Exception ex) {
            System.out.println("Class:  EmpanelmentDynamicTemplateDaoImpl\nMethod:  fetchAllTemplateNameData");
            System.out.print("Exception in fetchAll EmpanelmentDynamicTemplate " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch all EmpanelmentTemplateName in  EmpanelmentDynamicTemplateDaoImpl----------------");
        return templateNameDataList;
    }

   
}
