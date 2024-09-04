/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;


import com.eproc.dao.EnvelopeCDataDao;
import com.eproc.domain.Decrypt_envelopeC;
import com.eproc.domain.EnvelopeCData;
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
 */
@Repository
public class EnvelopeCDataDaoImpl implements EnvelopeCDataDao<EnvelopeCData>{
@Autowired
SessionFactory sessionFactory;

    @Override
    public boolean insertData(EnvelopeCData envelopeCData) {
       System.out.println("------Method call to insert EnvelopeCData in  EnvelopeCDataDaoImpl------");
        Session session = null;
       try{
        
         session = sessionFactory.openSession();
         Transaction txn = session.beginTransaction();
         session.saveOrUpdate(envelopeCData);
           System.out.println("inserted ");
          txn.commit();
     }catch(Exception ex){
            System.out.println("Class: EnvelopeCDataDaoImpl \n Method:insertdata");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }  
        
    
        System.out.println("----------------Method end to insert EnvelopeCData in  EnvelopeCDataDaoImpl----------------");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EnvelopeCData fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     @Override
    public List  fetchEnvelopeCById(Integer tenderId, Integer contId) {
        List<EnvelopeCData> envelopeCList = new ArrayList<EnvelopeCData>();
        System.out.println("tender id  " +tenderId+" and cont id  "+contId);
        
        Session session = null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeCData WHERE tenderId =:tenderId and contractorId=:contractorId");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
           
           envelopeCList= query.list();

            System.out.println("Size of envelopeCList is " );
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeCList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        System.out.println("-----------------Method End to fetchEnvelopeCById envelopeCList in dynamicDaoImpl----------------------------");
   return envelopeCList;
    }

    @Override
    public boolean updateData(EnvelopeCData envelopeCData) {
       System.out.println("------Method call to Update EnvelopeCData in  EnvelopeCDataDaoImpl------");
        Session session = null;
       try{
        
         session = sessionFactory.openSession();
         Transaction txn = session.beginTransaction();
         session.update(envelopeCData);
           System.out.println(" update ");
          txn.commit();
     }catch(Exception ex){
            System.out.println("Class: EnvelopeCDataDaoImpl \n Method:updatedata");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }  
        
    
        System.out.println("----------------Method end to Update EnvelopeCData in  EnvelopeCDataDaoImpl----------------");
        return true;
    }

    @Override
    public  EnvelopeCData fetchEnvelopeCById(Integer tenderId, Integer contId, Integer departUserId) {
       EnvelopeCData envelopeCData= new EnvelopeCData();
        System.out.println("tender id  " +tenderId+" and cont id  "+contId);
        Session session = null;
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM EnvelopeCData WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", tenderId);
           query.setParameter("contractorId", contId);
             query.setParameter("departmentUserId", String.valueOf(departUserId));
           envelopeCData=(EnvelopeCData) query.uniqueResult();

//            System.out.println("Size of envelopeCList is " +envelopeCData.getEncryptedDeviationByContractor());
              } catch (Exception ex) {
                  ex.printStackTrace();
            System.out.print("Exception in FetchAll envelopeCList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        
        
        System.out.println("-----------------Method End to fetchAll envelopeCList in dynamicDaoImpl----------------------------");
   return envelopeCData;
    }
    
        @Override
    public List envelopeCContractorList(Integer tenderId, int departmentUserId) {
       Session session = null;
       List<EnvelopeCData> envelopeCData= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM  EnvelopeCData where tenderId=:tenderId and departmentUserId=:departmentUserId";
            Query query = session.createQuery(hql);
            query.setParameter("departmentUserId", departmentUserId);
            query.setParameter("tenderId", tenderId);
            envelopeCData = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeCData;

}
     
    @Override
     public List fetchEnvelopeCEncryById(Integer id,Integer contId,Integer deptUserId) {
       List<Decrypt_envelopeC> decryptenvelopeBList = new ArrayList<Decrypt_envelopeC>();
        System.out.println("tender id  " +id+" and cont id  "+contId +" and deptUser id"+deptUserId);
        Session session = null;
     
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Decrypt_envelopeC WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", id);
            query.setParameter("contractorId", contId);
            query.setParameter("departmentUserId", deptUserId);
            decryptenvelopeBList=query.list();
            System.out.println("Size of decryptenvelopeBList is " + decryptenvelopeBList.size());
              } catch (Exception ex) {
            System.out.print("Exception in fetchEnvelopecById " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    return decryptenvelopeBList;
    }
  
     
     //Shashank Shukla
      public List fetchEnvelopeCEncryByIdForCs(Integer tenderId, Integer departmentUserId) {
       Session session = null;
       List<Decrypt_envelopeC> decryptenvelopeCList= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM Decrypt_envelopeC where tenderId=:tenderId and departmentUserId=:departmentUserId";
            
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            query.setParameter("departmentUserId", departmentUserId);
            query.setParameter("tenderId", tenderId);
            decryptenvelopeCList = query.list();
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return decryptenvelopeCList;
    }
       @Override
    public List envelopeCContractorList(Integer tenderId) {
       Session session = null;
       List<EnvelopeCData> envelopeCData= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM  EnvelopeCData where tenderId=:tenderId ";
            Query query = session.createQuery(hql);
//            query.setParameter("departmentUserId", departmentUserId);
            query.setParameter("tenderId", tenderId);
            envelopeCData = query.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return envelopeCData;

}

}
