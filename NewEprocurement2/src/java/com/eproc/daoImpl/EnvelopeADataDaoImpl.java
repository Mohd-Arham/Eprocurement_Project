/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EnvelopeADataDao;
import com.eproc.domain.EnvelopeAData;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Vaishali Gupta
 * 10-10-2018
 */
@Repository
public class EnvelopeADataDaoImpl implements EnvelopeADataDao<EnvelopeAData>{
@Autowired
SessionFactory sessionFactory;



    @Override
    public boolean insertData(EnvelopeAData envelopeAData) {
        System.out.println("----------------Method call to insert EnvelopeAData in  EnvelopeADataDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(envelopeAData);      
       
        } catch (Exception ex) {
          
            ex.printStackTrace();
            System.out.println("Class:EnvelopeADataDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData EnvelopeAData :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
            System.out.println("data saved successfully ");
        }      
        
    }
        System.out.println("----------------Method end to insert EnvelopeAData in  EnvelopeADataDaoImpl----------------");
        return true;
    }
    

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

    @Override
    public boolean updateData(EnvelopeAData envelopeAData) {
         System.out.println("----------------Method call to updateData EnvelopeAData in  EnvelopeADataDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(envelopeAData);      
       
        } catch (Exception ex) {
          
            ex.printStackTrace();
            System.out.println("Class:EnvelopeADataDaoImpl \n Method:insertData");
            System.out.print("Exception in updateData EnvelopeAData :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
            System.out.println("data Updated successfully ");
        }      
        
    }
        System.out.println("----------------Method end to updateData EnvelopeAData in  EnvelopeADataDaoImpl----------------");
        return true;
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    @Override
    public List fetchEnvelopeAById(Integer id,Integer contId,Integer deptUserId) {
       List<EnvelopeAData> envelopeAList = new ArrayList<EnvelopeAData>();
        System.out.println("tender id  " +id+" and cont id  "+contId);
        Session session = null;
         MultipartFile file=null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeAData WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", id);
           query.setParameter("contractorId", contId);
           query.setParameter("departmentUserId", deptUserId);
 envelopeAList=query.list();
            System.out.println("Size of envelopeAList is " + envelopeAList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeAList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        for (EnvelopeAData envelopeAList1 : envelopeAList) {
//             file=new InputStreamSource(envelopeAList1.getFilePath());
            
            envelopeAList1.setLabelNameA(envelopeAList1.getFieldLabel());
            envelopeAList1.setLabelTypeA(envelopeAList1.getFieldType());
        }
        
        
        
        System.out.println("-----------------Method End to fetchAll envelopeAList in dynamicDaoImpl----------------------------");
   return envelopeAList;
    }

    @Override
    public EnvelopeAData fetchData(Integer id) {
        System.out.println("   fetchData method call of EnvelopeAData    ");
        System.out.println("envelopAData fieldId "+id);
        Session session = null;
        EnvelopeAData envelopeAData=null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeAData WHERE envelopeAFieldId=:envelopeAFieldId");
        envelopeAData=(EnvelopeAData) query.setParameter("envelopeAFieldId", id).uniqueResult();
        
            envelopeAData.setLabelNameA(envelopeAData.getFieldLabel());
            envelopeAData.setLabelTypeA(envelopeAData.getFieldType());
          
              } catch (Exception ex) {
            System.out.print("Exception in fetchData envelope " + ex.getMessage());
            System.out.println("class: EnvelopeADataDaoImpl method:fetchData");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            
        }
            return envelopeAData;
    }

    @Override
    public List fetchEnvelopeAById(Integer tenderId, Integer contId) {
         List<EnvelopeAData> envelopeAList = new ArrayList<EnvelopeAData>();
        System.out.println("tender id  " +tenderId+" and cont id  "+contId);
        Session session = null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeAData WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
         
            envelopeAList=query.list();
            System.out.println("Size of envelopeAList is " + envelopeAList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeAList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        for (EnvelopeAData envelopeAList1 : envelopeAList) {
            envelopeAList1.setLabelNameA(envelopeAList1.getFieldLabel());
            envelopeAList1.setLabelTypeA(envelopeAList1.getFieldType());
        }
        
        
        
        System.out.println("-----------------Method End to fetchAll envelopeAList in dynamicDaoImpl----------------------------");
   return envelopeAList;
    }

       @Override
    public boolean updateShortlistedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId,String shortlistedstatus) {
        System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateShortlistedContrctrStatus method to update Status of shortlisted contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE EnvelopeAData SET shortListed_Status =:shortListed_Status WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("shortListed_Status", shortlistedstatus);
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contractorId);
//            query.setParameter("departmentUserId", departmentUserId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeADataDaoImpl \n Method:updateShortlistedContrctrStatus");
            System.out.println("Exception in updateShortlistedContrctrStatus method of EnvelopeADataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateShortlistedContrctrStatus method of EnvelopeADataDaoImpl..............");
        return true;
    }

    @Override
    public boolean updateRejectedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEA) {
     System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateRejectedContrctrStatus method to update Status of rejected contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE EnvelopeAData SET shortListed_Status =:shortlistedstatus , rejectRemarkEA=:rejectRemarkEA WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("shortlistedstatus", shortlistedstatus);
            query.setParameter("rejectRemarkEA", rejectRemarkEA);
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contractorId);
//            query.setParameter("departmentUserId", departmentUserId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeADataDaoImpl \n Method:updateRejectedContrctrStatus");
            System.out.println("Exception in updateRejectedContrctrStatus method of EnvelopeADataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateRejectedContrctrStatus method of EnvelopeADataDaoImpl..............");
        return true;
    }

    @Override
    public boolean updateRevertedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEA, String revertRemark) {
        System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateRevertedContrctrStatus method to update Status of rejected contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE EnvelopeAData SET shortListed_Status =:shortlistedstatus , rejectRemarkEA=:rejectRemarkEA, revertRemark=:revertRemark WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("shortlistedstatus", shortlistedstatus);
            query.setParameter("revertRemark", revertRemark);
            query.setParameter("rejectRemarkEA", rejectRemarkEA);
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contractorId);
//            query.setParameter("departmentUserId", departmentUserId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeADataDaoImpl \n Method:updateRejectedContrctrStatus");
            System.out.println("Exception in updateRevertedContrctrStatus method of EnvelopeADataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateRevertedContrctrStatus method of EnvelopeADataDaoImpl..............");
        return true;
    }
    @Override
    public List envelopeAContractorList(Integer tenderId, Integer departmentUserId) {
       Session session = null;
       List<EnvelopeAData> envelopeAData= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM  EnvelopeAData where tenderId=:tenderId and departmentUserId=:departmentUserId";
            Query query = session.createQuery(hql);
            query.setParameter("departmentUserId", departmentUserId);
            query.setParameter("tenderId", tenderId);
            envelopeAData = query.list();
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeAData;
    }

    @Override
    public EnvelopeAData envelopeAContractorListbyId(Integer tenderId, Integer contractorId) {
         Session session = null;
         EnvelopeAData envelopeAData=null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM  EnvelopeAData where tenderId=:tenderId and contractorId=:contractorId";
            Query query = session.createQuery(hql);
            
            query.setParameter("contractorId", contractorId);
            query.setParameter("tenderId", tenderId);
            query.setMaxResults(1);
            envelopeAData = (EnvelopeAData) query.uniqueResult();
            System.out.println("Envelope A data Id "+envelopeAData.getEnvelopeAFieldId()+"  "+envelopeAData.getShortListed_Status());
                   
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeAData;
    }  
       
        
       @Override
    public boolean allEnvelopeSubmittedStatus(Integer tenderId, Integer contId) {

        System.out.println("tender id  " + tenderId + "  Contractor id " + contId);
        System.out.println("call allEnvelopeSubmittedStatus method to update Status of shortlisted contractor  from database");
        Session session = null;
        List list = new ArrayList<Object>();
        Query query = null;
        try {
            session = sessionFactory.openSession();
            query = session.createQuery("FROM EnvelopeAData where tenderId=:tenderId and contractorId=:contractorId");

            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contId);

            list = query.list();
            if (!list.isEmpty()) {
                query = session.createQuery("FROM EnvelopeBData where tenderId=:tenderId and contractorId=:contractorId");
                query.setParameter("tenderId", tenderId);
                query.setParameter("contractorId", contId);
//                list = query.list();

                if (!list.isEmpty()) {
                    query = session.createQuery("FROM EnvelopeCData where tenderId=:tenderId and contractorId=:contractorId");
                    query.setParameter("tenderId", tenderId);
                    query.setParameter("contractorId", contId);
                    list = query.list();

                    if (!list.isEmpty()) {
                        return true;

                    }
                }
            }
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeADataDaoImpl \n Method:allEnvelopeSubmittedStatus");
            System.out.println("Exception in allEnvelopeSubmittedStatus method of EnvelopeADataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End allEnvelopeSubmittedStatus method of EnvelopeADataDaoImpl..............");
        return false;

    }

    @Override
    public int fetchEABidderCount(int tenderId) {
       Session session = null;
      int EA_bidderCount= 0;
        try {
            session = sessionFactory.openSession();
            String hql = "select distinct contractorId FROM EnvelopeAData where tenderId=:tenderId";
            Query query = session.createQuery(hql);
        
            query.setParameter("tenderId", tenderId);
            EA_bidderCount = query.list().size();
         
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return EA_bidderCount;
    }
   
        
      @Override
    public List envelopeAShortlistedContractorList(Integer tenderId) {
       Session session = null;
       List<EnvelopeAData> envelopeAData= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM  EnvelopeAData where tenderId=:tenderId and shortListed_Status='Shortlisted'";
            Query query = session.createQuery(hql);
//            query.setParameter("departmentUserId", departmentUserId);
            query.setParameter("tenderId", tenderId);
            envelopeAData = query.list();
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeAData;
    } 
    
  
}
