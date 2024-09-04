/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.EnvelopeBDataDao;
import com.eproc.domain.EnvelopeBData;
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
 * @author Vaishali Gupta
 * 10-10-2018
 */
@Repository
public class EnvelopeBDataDaoImpl implements EnvelopeBDataDao<EnvelopeBData>{
@Autowired
SessionFactory sessionFactory;


    @Override
    public boolean insertData(EnvelopeBData envelopeBData) {
       System.out.println("------Method call to insert EnvelopeBData in  EnvelopeBDataDaoImpl------");
        Session session = null;
        Transaction transaction = null;  
        
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(envelopeBData);      
       
        } catch (Exception ex) {
          
            ex.printStackTrace();
            System.out.println("Class:EnvelopeBDataDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData EnvelopeBData :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
        }      
        
    }
        System.out.println("----------------Method end to insert EnvelopeBData in  EnvelopeBDataDaoImpl----------------");
        return true; 
    }

    @Override
    public boolean removeData(Integer id) {
          throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EnvelopeBData fetchData(Integer id) {
            System.out.println("   fetchData method call of EnvelopeBData    ");
        System.out.println("envelopAData fieldId "+id);
        Session session = null;
        EnvelopeBData envelopeBData=null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeBData WHERE envelopeBFieldId=:envelopeBFieldId");
        envelopeBData=(EnvelopeBData) query.setParameter("envelopeBFieldId", id).uniqueResult();
        
            envelopeBData.setLabelNameA(envelopeBData.getFieldLabel());
            envelopeBData.setLabelTypeA(envelopeBData.getFieldType());
          
              } catch (Exception ex) {
            System.out.print("Exception in fetchData envelope " + ex.getMessage());
            System.out.println("class: EnvelopeADataDaoImpl method:fetchData");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            
        }
            return envelopeBData; }

    @Override
    public boolean updateData(EnvelopeBData e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public List fetchEnvelopeBById(Integer tenderId, Integer contId) {
       List<EnvelopeBData> envelopeBList = new ArrayList<EnvelopeBData>();
        System.out.println("tender id  " +tenderId+" and cont id  "+contId);
        Session session = null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeBData WHERE tenderId =:tenderId and contractorId=:contractorId");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
 envelopeBList=query.list();
            System.out.println("Size of envelopeBList is " + envelopeBList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeBList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
         for (EnvelopeBData envelopeAList1 : envelopeBList) {
            envelopeAList1.setLabelNameA(envelopeAList1.getFieldLabel());
            envelopeAList1.setLabelTypeA(envelopeAList1.getFieldType());
        }
        
        System.out.println("-----------------Method End to fetchAll envelopeBList in dynamicDaoImpl----------------------------");
   return envelopeBList;
    }

    @Override
    public List fetchEnvelopeBById(Integer tenderId, Integer contId, Integer deptUserId) {
        List<EnvelopeBData> envelopeBList = new ArrayList<EnvelopeBData>();
        System.out.println("tender id  " +tenderId+" and cont id  "+contId+" and dept id "+deptUserId);
        Session session = null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeBData WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
           query.setParameter("departmentUserId", deptUserId);
 envelopeBList=query.list();
            System.out.println("Size of envelopeBList is " + envelopeBList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeBList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
         for (EnvelopeBData envelopeAList1 : envelopeBList) {
            envelopeAList1.setLabelNameA(envelopeAList1.getFieldLabel());
            envelopeAList1.setLabelTypeA(envelopeAList1.getFieldType());
        }
        
        System.out.println("-----------------Method End to fetchAll envelopeBList in dynamicDaoImpl----------------------------");
   return envelopeBList;
    }

    @Override
    public List envelopeBContractorList(Integer tenderId) {
        Session session = null;
       List<Integer> envelopeBData= new ArrayList<>();
       String status="Shortlisted";
        try {
            session = sessionFactory.openSession();
            String hql = "select distinct contractorId FROM  EnvelopeAData where tenderId=:tenderId and shortListed_Status=:shortListed_Status";
            Query query = session.createQuery(hql);
          
            query.setParameter("tenderId", tenderId);
            query.setParameter("shortListed_Status", status);
            envelopeBData = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeBData;
    }

    @Override
    public boolean updateShortlistedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus) {
       System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateShortlistedContrctrStatus method to update Status of shortlisted contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE EnvelopeBData SET shortListed_Status =:shortListed_Status WHERE tenderId =:tenderId and contractorId=:contractorId ");
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
    public boolean updateRejectedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEB) {
        System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateRejectedContrctrStatus method to update Status of rejected contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE EnvelopeBData SET shortListed_Status =:shortListed_Status , rejectRemarkEB=:rejectRemarkEB WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("shortListed_Status", shortlistedstatus);
            query.setParameter("rejectRemarkEB", rejectRemarkEB);
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contractorId);
//            query.setParameter("departmentUserId", departmentUserId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeBDataDaoImpl \n Method:updateRejectedContrctrStatus");
            System.out.println("Exception in updateRejectedContrctrStatus method of EnvelopeBDataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateRejectedContrctrStatus method of EnvelopeBDataDaoImpl..............");
        return true;
    }

    @Override
    public boolean updateRevertedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEB, String revertRemark) {
        System.out.println("tender id  "+tenderId+ "  Contractor id "+contractorId+"  deptUserId"+departmentUserId);
        System.out.println("call updateRevertedContrctrStatus method to update Status of rejected contractor  from database");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE EnvelopeBData SET shortListed_Status =:shortListed_Status , rejectRemarkEB=:rejectRemarkEB, revertRemark=:revertRemark WHERE tenderId =:tenderId and contractorId=:contractorId ");
            query.setParameter("shortListed_Status", shortlistedstatus);
            query.setParameter("revertRemark", revertRemark);
            query.setParameter("rejectRemarkEB", rejectRemarkEB);
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contractorId);
//            query.setParameter("departmentUserId", departmentUserId);
            query.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class:EnvelopeBDataDaoImpl \n Method:updateRejectedContrctrStatus");
            System.out.println("Exception in updateRevertedContrctrStatus method of EnvelopeBDataDaoImpl  " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println(".............End updateRevertedContrctrStatus method of EnvelopeBDataDaoImpl..............");
        return true;
    }

    @Override
    public EnvelopeBData envelopeBContractorListbyId(Integer tenderId, Integer contractorId) {
        Session session = null;
         EnvelopeBData envelopeBData=null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM  EnvelopeBData where tenderId=:tenderId and contractorId=:contractorId";
            Query query = session.createQuery(hql);
            
            query.setParameter("contractorId", contractorId);
            query.setParameter("tenderId", tenderId);
            query.setMaxResults(1);
            envelopeBData = (EnvelopeBData) query.uniqueResult();
                   
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeBData;
    
    }

    @Override
    public List fetchEnvelopeBContractor(Integer tenderId) {
       Session session = null;
       List<Integer> envelopeBData= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM  EnvelopeBData where tenderId=:tenderId and shortListed_Status=:shortListed_Status";
            Query query = session.createQuery(hql);
            query.setParameter("tenderId", tenderId);
            query.setParameter("shortListed_Status", "Shortlisted");
            envelopeBData = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeBData;
    }
}
