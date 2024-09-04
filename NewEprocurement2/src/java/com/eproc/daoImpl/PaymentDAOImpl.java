/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.PaymentDAO;
import com.eproc.domain.PurchaseDetails;
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
 * @author Naina Jain
 *
 */
@Repository
public class PaymentDAOImpl implements PaymentDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List fetchAllPurchaseDetailsByContId(int id) {
        System.out.println("****************PaymentDAOImpl's fetchAllPurchaseDetailsByContId method run****************");
        List<PurchaseDetails> purchasedTenderList = new ArrayList();

        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("From PurchaseDetails where contractorId=:id ");
            query.setParameter("id", id);
            purchasedTenderList = query.list();
            System.out.println("saveOrUpdate " + purchasedTenderList.size());
            tx.commit();
            session.close();
        } catch (Exception ex) {

            System.out.println("Exception in fetchAllPurchaseDetailsByContId method of PurchaseTenderAuction " + ex.getMessage());
        }
        System.out.println("*******************END fetchAllPurchaseDetailsByContId method of PurchaseTenderAuction****************************************");
        return purchasedTenderList;
    }

    @Override
    public List fetchAllBidderByTenderId(int id) {
        System.out.println("****************PaymentDAOImpl's fetchAllBidderByTenderId method run****************");
        List<PurchaseDetails> purchasedTenderList = new ArrayList();

        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("From PurchaseDetails where tender_Id=:id ");
            query.setParameter("id", id);
            purchasedTenderList = query.list();

            System.out.println("saveOrUpdate " + purchasedTenderList.size());
            tx.commit();
            session.close();
        } catch (Exception ex) {

            System.out.println("Exception in fetchAllBidderByTenderId method of PurchaseTenderAuction " + ex.getMessage());
        }
        System.out.println("*******************END fetchAllBidderByTenderId method of PurchaseTenderAuction****************************************");
        return purchasedTenderList;
    }

    @Override
    public PurchaseDetails fetchPurchaseDetailsWithContId(Integer tender_Id, int auctionId, int contractorId) {
        Session session = null;
        PurchaseDetails purchaseDetails = new PurchaseDetails();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from PurchaseDetails where tender_Id=:tender_Id and auctionId=:auctionId and contractorId=:contractorId");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("auctionId", auctionId);
            query.setParameter("contractorId", contractorId);
            purchaseDetails = (PurchaseDetails) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class: PaymentDaoImpl \n Method:fetchPurchaseDetailsWithContId");
            System.out.println("Exception in fetchPurchaseDetailsWithContId method of PaymentDaoImpl " + ex.getMessage());
            ex.printStackTrace();
        }
        return purchaseDetails;
    }

    @Override
    public boolean insertData(PurchaseDetails purchaseDetails) {
        System.out.println("****************PaymentDAOImpl's insertData method run****************");
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
//String queryString = "from PurchaseDetails where contractorId = :contractorId and tender_Id = :tenderId";
//Query query = session.createQuery(queryString);
//query.setParameter("contractorId", purchaseDetails.getContractorId());
//query.setParameter("tenderId", purchaseDetails.getTender_Id());
//List<PurchaseDetails> data = query.list();
//List<PurchaseDetails> data = session.createSQLQuery("from PurchaseDetails where contractorId=" + purchaseDetails.getContractorId() + " and tender_Id=" + purchaseDetails.getTender_Id()).list();
//                   System.out.println("list size is ---> " + data.size());
//                if(data.size()==0)
//                {
                    System.out.println("ENTER");
                session.saveOrUpdate(purchaseDetails);
//                return true;
//                }
            

            System.out.println("saveOrUpdate " + purchaseDetails.getPurchaseId());
            tx.commit();
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Class: PaymentDAOImpl \n Method:insertData");
            System.out.println("Exception in insertData method of PurchaseTenderAuction " + ex.getMessage());
        }
        System.out.println("*******************END insertData method of PurchaseTenderAuction****************************************");
        return true;
    }

    @Override
    public PurchaseDetails fetchAllBidderByTenderIdContId(int tender_Id, int contractorId) {
        System.out.println("****************PaymentDAOImpl's fetchAllBidderByTenderIdContId method run****************");
        PurchaseDetails purchaseDetails = new PurchaseDetails();

        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("From PurchaseDetails where tender_Id=:tender_Id and contractorId=:contractorId");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("contractorId", contractorId);
            purchaseDetails = (PurchaseDetails) query.uniqueResult();

            System.out.println("fetchAllBidderByTenderIdContId " + purchaseDetails);
            tx.commit();
            session.close();
        } catch (Exception ex) {

            System.out.println("Exception in fetchAllBidderByTenderIdContId method of PurchaseTenderAuction " + ex.getMessage());
        }
        System.out.println("*******************END fetchAllBidderByTenderIdContId method of PurchaseTenderAuction****************************************");
        return purchaseDetails;
    }

    public boolean updatePurchaseDetailStatus(int tender_Id, int contractorId, String bankStatus, String bank_description, String bankJson, String bank_transaction_Id, String responseDateTime) {
        Session session = null;
        Transaction txn = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            txn = session.beginTransaction();
            Query query = session.createQuery("update PurchaseDetails set bankStatus=:bankStatus,bank_description=:bank_description,bankJson=:bankJson,bank_transaction_Id=:bank_transaction_Id,responseDateTime=:responseDateTime where tender_Id=:tender_Id and contractorId=:contractorId");
            query.setParameter("tender_Id", tender_Id);
            query.setParameter("contractorId", contractorId);
            query.setParameter("bankStatus", bankStatus);
            query.setParameter("bank_description", bank_description);
            query.setParameter("bankJson", bankJson);
            query.setParameter("bank_transaction_Id", bank_transaction_Id);
            query.setParameter("responseDateTime", responseDateTime);

            query.executeUpdate();
            txn.commit();
            session.flush();
            session.close();
        } catch (Exception e) {
            txn.rollback();
            System.out.println("Class:PaymentDaoImpl & Method:updatePurchaseDetailStatus");
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PurchaseDetails fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(PurchaseDetails e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
