/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.logs;

import com.eproc.domain.ContractorClassLogs;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Palak Tiwari
 *  Since 11-10-2018
 *  @Version 2.0.0
 */
@Repository
public class ContractorClassDaoLogs {
      @Autowired
   SessionFactory sessionFactory;
    
     public boolean saveContractorClassLogs(ContractorClassLogs logs){
       System.out.println("~~~~ saveContractorClassLogs method run ~~~~~~~~~~~~~~");
          Session session = null;
        boolean status = true;
         Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("Session is opnen");
            txn = session.beginTransaction();
            System.out.println("Transaction is begin");
            session.save(logs);
           
        } catch (Exception e) {
            txn.rollback();
            System.out.println("Class:MsmeNsicDaoLogs \n Method:saveLogs");
            System.out.println("Exception:" + e.getMessage());
        } finally {
             if (txn != null) {
                txn.commit();
            }
            if (session != null) {
                session.close();
            }
            System.out.println("Session is Closed in saveContractorClassLogs Method");
        }
        return status;
    
   }
    
}
