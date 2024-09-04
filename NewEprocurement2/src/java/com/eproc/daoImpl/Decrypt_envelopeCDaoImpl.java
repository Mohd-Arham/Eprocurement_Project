/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.Decrypt_envelopeCDao;
import com.eproc.domain.Decrypt_envelopeC;
import java.util.List;
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
public class Decrypt_envelopeCDaoImpl implements Decrypt_envelopeCDao {
  @Autowired
    SessionFactory sessionFactory;
    @Override
    public boolean insertData(Decrypt_envelopeC e) {
       System.out.println("----------------Method call to insert EnvelopeCData in  Decrypt_envelopeCDaoImpl----------------");
        Session session = null;
        Transaction transaction = null;       
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(e);      
       
        } catch (Exception ex) {
          
            ex.printStackTrace();
            System.out.println("Class:Decrypt_envelopeCDaoImpl \n Method:insertData");
            System.out.print("Exception in insertData EnvelopeCData :::" + ex.getMessage());
        } finally{
        if(transaction != null){
            transaction.commit();
        }
        if(session != null){
            session.close();
            System.out.println("data saved successfully ");
        }      
        
    }
        System.out.println("----------------Method end to insert EnvelopeCData in  Decrypt_envelopeCDaoImpl----------------");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Decrypt_envelopeC fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(Decrypt_envelopeC e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
