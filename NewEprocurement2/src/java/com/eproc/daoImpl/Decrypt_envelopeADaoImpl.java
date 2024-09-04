/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.Decrypt_envelopeADao;
import com.eproc.domain.Decrypt_envelopeA;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author vaishali
 */
@Repository
public class Decrypt_envelopeADaoImpl implements Decrypt_envelopeADao {
@Autowired
    org.hibernate.SessionFactory sessionFactory;
    
    

    @Override
    public boolean insertData(Decrypt_envelopeA e) {
          System.out.println("----------------Method call to insert EnvelopeAData in  Decrypt_envelopeADaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(e);      
       
        } catch (Exception ex) {
          
            ex.printStackTrace();
            System.out.println("Class:Decrypt_envelopeADaoImpl \n Method:insertData");
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
        System.out.println("----------------Method end to insert EnvelopeAData in  Decrypt_envelopeADaoImpl----------------");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("   removeData method call of Decrypt_envelopeADaoImpl    ");
        System.out.println("envelopAData fieldId " + id);
        Session session = null;
        boolean flag = false;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("delete FROM Decrypt_envelopeA WHERE envelopeAFieldId=:envelopeAFieldId");
            query.setParameter("envelopeAFieldId", id);
            System.out.println("query "+query.executeUpdate());

        } catch (Exception ex) {
            System.out.print("Exception in removeData envelopeA " + ex.getMessage());
            System.out.println("class: Decrypt_envelopeADaoImpl method:removeData");
            ex.printStackTrace();
        } 
        finally {
            
            if (session != null) {
                session.close();
                flag = true;
            }

        }
        return flag;
    }

    @Override
    public Decrypt_envelopeA fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(Decrypt_envelopeA e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

     @Override
    public List fetchEnvelopeAById(Integer id,Integer contId,Integer deptUserId) {
       List<Decrypt_envelopeA> decryptenvelopeAList = new ArrayList<Decrypt_envelopeA>();
        System.out.println("tender id  " +id+" and cont id  "+contId);
        Session session = null;
     
        try {
            session = sessionFactory.openSession();
             Query query = session.createQuery("FROM Decrypt_envelopeA WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", id);
           query.setParameter("contractorId", contId);
           query.setParameter("departmentUserId", deptUserId);
            decryptenvelopeAList=query.list();
            System.out.println("Size of decryptenvelopeAList is " + decryptenvelopeAList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll envelopeAList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        for (Decrypt_envelopeA envelopeAList1 : decryptenvelopeAList) {
            envelopeAList1.setLabelNameA(envelopeAList1.getFieldLabel());
            envelopeAList1.setLabelTypeA(envelopeAList1.getFieldType());
        }
        
        
        
        System.out.println("-----------------Method End to fetchEnvelopeAById in Decrypt_envelopeADaoImpl----------------------------");
   return decryptenvelopeAList;
    }

    @Override
    public int fetchEABidder(Integer tendreId) {
       Session session = null;
       int count=0;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("select distinct contractorId FROM Decrypt_envelopeA WHERE tenderId=:tenderId");
            query.setParameter("tenderId", tendreId);
        
            
                  count=query.list().size();
        } catch (Exception ex) {
            System.out.print("Exception in fetchEABidder envelopeA " + ex.getMessage());
            System.out.println("class: Decrypt_envelopeADaoImpl method:fetchEABidder");
            ex.printStackTrace();
        } 
        finally {
            
            if (session != null) {
                session.close();
              
            }

        }
        return count;
    }
    
    //Shashank Shukla
     public List fetchEnvelopeAByIdForCs(Integer tenderId, Integer departmentUserId) {
       Session session = null;
       List<Decrypt_envelopeA> envelopeAData= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM Decrypt_envelopeA where tenderId=:tenderId and departmentUserId=:departmentUserId";
            
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
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
}
