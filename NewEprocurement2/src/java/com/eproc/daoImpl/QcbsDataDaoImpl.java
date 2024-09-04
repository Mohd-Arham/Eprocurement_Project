/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.QcbsDataDao;
import com.eproc.domain.QcbsData;
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
 * @author Admin
 */
@Repository
public class QcbsDataDaoImpl implements QcbsDataDao{

      @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public String create(QcbsData qcbsData) {
               System.out.println("Enerd into Dao  " + qcbsData);
    Session session = sessionFactory.openSession();
     String status = null;
     Transaction transaction = null; 
       
     try{
        transaction= session.beginTransaction();
            session.saveOrUpdate(qcbsData);
             
            status = "success";
            System.out.println("Template Save Successfull");
     }
     catch(Exception e){
         System.out.println("ERROR :"+e.getMessage());
           status = "failure";
     }
      finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
            System.out.println("data saved successfully ");
        }      
        
    }
           return status;
   
    }

    @Override
    public List fetchQcbsById(String tenderId, Integer contId) {
    
        List<QcbsData> envelopQcbsList=new ArrayList<>();
        System.out.println("tenderId"+tenderId+" "+"contractorId"+contId);
        
        Session session=null;
        try{
            session=sessionFactory.openSession();
             Query query = session.createQuery("FROM QcbsData WHERE tenderId =:tenderId and contractorId=:contractorId");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
           envelopQcbsList=query.list();
            System.out.println("QCBS LIST SIZE"+envelopQcbsList.size());
        }
        catch(Exception e){
            System.out.println("Exception"+e.getMessage());
        }
    finally {
            if (session != null) {
                session.close();
            }
            System.out.println("Exit QCBS DATA");
            
    }
   return envelopQcbsList;
    }

    @Override
    public QcbsData read(String tenderId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List envelopeQCBSContractorList(String tenderId) {
       
     Session session = null;
       List<Integer> envelopeQCBSData= new ArrayList<>();
       String status="Shortlisted";
        try {
            session = sessionFactory.openSession();
            String hql = "select distinct contractorId FROM  QcbsData where tenderId=:tenderId and shortListed_Status=:shortListed_Status";
            Query query = session.createQuery(hql);
          
            query.setParameter("tenderId", tenderId);
            query.setParameter("shortListed_Status", status);
            envelopeQCBSData = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeQCBSData;
    }

    @Override
    public QcbsData envelopeQCBSContractorListbyId(String tenderId, Integer contractorId) {
      
     Session session = null;
         QcbsData envelopeQCBSData=null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM  QcbsData where tenderId=:tenderId and contractorId=:contractorId";
            Query query = session.createQuery(hql);
            
            query.setParameter("contractorId", contractorId);
            query.setParameter("tenderId", tenderId);
            query.setMaxResults(1);
            envelopeQCBSData = (QcbsData) query.uniqueResult();
                   
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeQCBSData;
    }

    @Override
public boolean update(String tenderId, Integer contractorId, String template) {
    System.out.println("QCBS_DATA CALLING.............");
    Session session = null;
    Transaction transaction = null;

    try {
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();

        String hql = "UPDATE QcbsData SET template = :template WHERE tenderId = :tenderId AND contractorId = :contractorId";
        Query query = session.createQuery(hql);
        query.setParameter("template", template);
        query.setParameter("tenderId", tenderId);
        query.setParameter("contractorId", contractorId);

        int result = query.executeUpdate();
        transaction.commit();

        if (result > 0) {
            System.out.println("Update successful for tender_Id: " + tenderId + " and contractorId: " + contractorId);
            return true;
        } else {
            System.out.println("No records updated for tender_Id: " + tenderId + " and contractorId: " + contractorId);
            return false;
        }
    } catch (Exception ex) {
        if (transaction != null) {
            transaction.rollback();
        }
        System.out.println("Class: QCBSDaoImpl \n Method: update");
        System.out.println("Exception in update method of QCBSDaoImpl: " + ex.getMessage());
        return false;
    } finally {
        if (session != null) {
            session.close();
        }
    }
}

    @Override
    public boolean updateShortlistedContractorStatus(String tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus) {
       

         System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateShortlistedContrctrStatus method to update Status of shortlisted contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE QcbsData SET shortListed_Status =:shortListed_Status WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("shortListed_Status", shortlistedstatus);
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contractorId);
//            query.setParameter("departmentUserId", departmentUserId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeBDataDaoImpl \n Method:updateShortlistedContrctrStatus");
            System.out.println("Exception in updateShortlistedContrctrStatus method of EnvelopeBDataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateShortlistedContrctrStatus method of EnvelopeBDataDaoImpl..............");
        return true;
    }

    @Override
    public List fetchEnvelopeQCBSById(String tenderId, Integer contId, Integer deptUserId) {
       List<QcbsData> qcbsBList = new ArrayList<QcbsData>();
        System.out.println("tender id  " +tenderId+" and cont id  "+contId+" and dept id "+deptUserId);
        Session session = null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM QcbsData WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
           query.setParameter("departmentUserId", deptUserId);
 qcbsBList=query.list();
            System.out.println("Size of envelopeBList is " + qcbsBList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeBList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        
        System.out.println("-----------------Method End to fetchAll envelopeBList in dynamicDaoImpl----------------------------");
   return qcbsBList;

    }

    
    
}
