/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.Decrypt_envelopeBDao;
import com.eproc.domain.Decrypt_envelopeB;
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
 * @author vaishali
 */
@Repository
public class Decrypt_envelopeBDaoImpl implements Decrypt_envelopeBDao {
 @Autowired
  SessionFactory sessionFactory;
 
 
    @Override
    public boolean insertData(Decrypt_envelopeB e) {
       System.out.println("----------------Method call to insert EnvelopeBData in  Decrypt_envelopeBDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(e);      
       
        } catch (Exception ex) {
          
            ex.printStackTrace();
            System.out.println("Class:Decrypt_envelopeBDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData EnvelopeBData :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
            System.out.println("data saved successfully ");
        }      
        
    }
        System.out.println("----------------Method end to insert EnvelopeBData in  Decrypt_envelopeBDaoImpl----------------");
        return true;
    }

      @Override
    public boolean removeData(Integer id) {
        System.out.println("   removeData method call of Decrypt_envelopeBDaoImpl    ");
        System.out.println("envelopBData fieldId " + id);
        Session session = null;
        boolean flag = false;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("delete FROM Decrypt_envelopeB WHERE envelopeBFieldId=:envelopeBFieldId");
            query.setParameter("envelopeBFieldId", id);
            System.out.println("query "+query.executeUpdate());

        } catch (Exception ex) {
            System.out.print("Exception in removeData envelopeB " + ex.getMessage());
            System.out.println("class: Decrypt_envelopeBDaoImpl method:removeData");
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
    public Decrypt_envelopeB fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(Decrypt_envelopeB e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   @Override
    public int fetchEBBidder(Integer tendreId) {
       Session session = null;
       int count=0;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("select distinct contractorId FROM Decrypt_envelopeB WHERE tenderId=:tenderId");
            query.setParameter("tenderId", tendreId);
        
            
                  count=query.list().size();
        } catch (Exception ex) {
            System.out.print("Exception in fetchEB Bidder envelopeB " + ex.getMessage());
            System.out.println("class: Decrypt_envelopeBDaoImpl method:fetchEBBidder");
            ex.printStackTrace();
        } 
        finally {
            
            if (session != null) {
                session.close();
              
            }

        }
        return count;
    }
    
      @Override
    public List fetchEnvelopeBById(Integer id,Integer contId,Integer deptUserId) {
       List<Decrypt_envelopeB> decryptenvelopeBList = new ArrayList<Decrypt_envelopeB>();
        System.out.println("tender id  " +id+" and cont id  "+contId);
        Session session = null;
     
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Decrypt_envelopeB WHERE tenderId =:tenderId and contractorId=:contractorId and departmentUserId=:departmentUserId");
            query.setParameter("tenderId", id);
            query.setParameter("contractorId", contId);
            query.setParameter("departmentUserId", deptUserId);
            decryptenvelopeBList=query.list();
            System.out.println("Size of decryptenvelopeBList is " + decryptenvelopeBList.size());
              } catch (Exception ex) {
            System.out.print("Exception in fetchEnvelopeBById " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        for (Decrypt_envelopeB envelopeBList1 : decryptenvelopeBList) {
            envelopeBList1.setLabelNameA(envelopeBList1.getFieldLabel());
            envelopeBList1.setLabelTypeA(envelopeBList1.getFieldType());
        }
        
        
        
        System.out.println("-----------------Method End to fetchEnvelopeBById in Decrypt_envelopeBDaoImpl----------------------------");
   return decryptenvelopeBList;
    }
    
      public List fetchEnvelopeBByIdForCs(Integer tenderId, Integer departmentUserId) {
       Session session = null;
       List<Decrypt_envelopeB> decryptenvelopeBList= new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            String hql = "SELECT DISTINCT contractorId FROM Decrypt_envelopeB where tenderId=:tenderId and departmentUserId=:departmentUserId";
            
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            query.setParameter("departmentUserId", departmentUserId);
            query.setParameter("tenderId", tenderId);
            decryptenvelopeBList = query.list();
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return decryptenvelopeBList;
    }
}
