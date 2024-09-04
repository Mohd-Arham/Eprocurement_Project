/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.AddToCartDao;
import com.eproc.domain.AddToCart;
import com.eproc.domain.Auction;
import com.eproc.domain.AuctionAmidmentKeyDates;
import com.eproc.domain.AuctionKeyDates;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderKeyDatesAmendment;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;
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
public class AddToCartDaoImpl implements AddToCartDao {

    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    TenderDaoImpl tenderDaoImpl;

    @Autowired
    AuctionDaoImpl auctionDaoImpl;

    @Autowired
    TenderAmendmentDaoImpl tenderAmendmentDaoImpl;

    @Autowired
    AuctionAmendmentKeyDatesDaoImpl amendmentKeyDatesDaoImpl;

    @Override
    public boolean deleteTenderFromCart(int id, int contractorId) {
        System.out.println("*************AddToCartDAOImpl's removedata method run***************");
        Session session = sessionFactory.openSession();
        try {
            Query q = session.createQuery("delete AddToCart where tender_Id=:id and contractorId=:contractorId");
            q.setParameter("id", id);
            q.setParameter("contractorId", contractorId);
            q.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDAOImpl \n Method:removedata");
            System.out.println("Exception in removeData method of AddToCartDAOImpl" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END removeData method of AddToCartDAOImpl****************************************");
        return true;
    }

    @Override
    public boolean deleteAuctionFromCart(int id, int contractorId) {
        System.out.println("*************AddToCartAuctionDaoImpl's removedata method run***************");
        Session session = sessionFactory.openSession();
        try {
            Query q = session.createQuery("delete AddToCart where auctionId=:id and contractorId=:contractorId");
            q.setParameter("id", id);
            q.setParameter("contractorId", contractorId);
            q.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartAuctionDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData method of AddToCartAuctionDaoImpl" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END removeData method of AddToCartAuctionDaoImpl****************************************");
        return true;
    }

    @Override
    public boolean insertData(AddToCart addToCart) {
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            session.saveOrUpdate(addToCart);
//            System.out.println("saveOrUpdate Tender_Id " + addToCart.getTender_Id());
//            System.out.println("saveOrUpdate  Auction_Id" + addToCart.getAuctionId());
            tx.commit();
            session.close();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDAOImpl \n Method:insertdata");
            System.out.println("Exception in inserData method of AddToCart " + ex.getMessage());
        }
        return true;
    }

    @Override
    public List fetchAll() {
        Session session = null;
        List<AddToCart> addToCartTenderList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            addToCartTenderList = session.createQuery("from AddToCart").list();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDaoImpl \n Method:fetchAll");
            System.out.println("Exception in fetchAll method of AddToCart " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchAll method of AddToCart****************************************");
        return addToCartTenderList;
    }

     
    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AddToCart fetchData(Integer id) {
        Session session = null;
        AddToCart addToCart = new AddToCart();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from AddToCart where tender_Id=:id");
            query.setParameter("id", id);
            addToCart = (AddToCart) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDaoImpl \n Method:fetchdata");
            System.out.println("Exception in fetchData method of AddToCartDaoImpl " + ex.getMessage());
            ex.printStackTrace();
        }
        return addToCart;
    }

    @Override
    public boolean updateData(AddToCart e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Tender> liveTenderList(List<Tender> tenderList) {
        System.out.println("/:::::::::::::::::::::::::::Inside the Live tender Method::::::::::::::::::::::::::::::/");
        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        List<Tender> tenderList2 = new ArrayList<>();
        String tnstartDate = "";
        String tnendDate = "";
        Date dateStart = null;
        Date endStart = null;
        int tender_Id = 0;
        TenderKeyDatesAmendment amendmentListData = null;
        try {
            for (Tender tn : tenderList) {
                List<TenderKeyDatesAmendment> tenderKeyDatesAmendmentList = tenderAmendmentDaoImpl.readAllKeyDates(tn.getTender_Id());
                if (tenderKeyDatesAmendmentList.size() != 0) {
                    for (int i = 0; i < tenderKeyDatesAmendmentList.size(); i++) {
                        amendmentListData = tenderKeyDatesAmendmentList.get(i);
                        tender_Id = Integer.parseInt(amendmentListData.getTender_Id());
                        tnstartDate = amendmentListData.getTenderPurchaseDate().split("/")[0];
                        dateStart = new Date(tnstartDate);
                        tnendDate = amendmentListData.getTenderPurchaseDate().split("/")[1];
                        endStart = new Date(tnendDate);
                    }
                    BeanUtils.copyProperties(tn, amendmentListData);
                    System.out.println("@@@~~~ tnstartDate of " + tender_Id + " liveTenderList addtocartdaoimpl~~~@@@ " + tnstartDate);
                    System.out.println("@@@~~~ tnendDate of " + tender_Id + " liveTenderList addtocartdaoimpl~~~@@@ " + tnendDate);
                    if (dateStart.getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endStart.getTime() && endStart.getTime() > dateStart.getTime()) {
                        tenderList2.add(tn);
                    }
                } else {
                    TenderKeyDates tenderKeyDateses = tenderDaoImpl.readKeyDate(tn.getTender_Id());
                    if (tenderKeyDateses != null) {
                        tn.setTenderKeyDates(tenderKeyDateses);
                        tnstartDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[0];
                        Date startDates = new Date(tnstartDate);
                        System.out.println("The Tender Start date: " + tnstartDate);
                        tnendDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[1];
                        Date endDates = new Date(tnendDate);
                        System.out.println("The Tender End date: " + tnendDate);
                        if (startDates.getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endDates.getTime() && endDates.getTime() > startDates.getTime()) {
                            tenderList2.add(tn);
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return tenderList2;
    }

    @Override
    public List<Auction> liveAuctionList(List<Auction> auctionList) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        List<Auction> auctionList2 = new ArrayList<>();
        String anstartDate = "";
        String anendDate = "";
        int auctionId = 0;
        try {
            AuctionAmidmentKeyDates amendmentListData = new AuctionAmidmentKeyDates();
            for (Auction an : auctionList) {
                List<AuctionAmidmentKeyDates> auctionKeyDatesAmendmentList = amendmentKeyDatesDaoImpl.readAllKeyDates(an.getAuctionId());
                if (auctionKeyDatesAmendmentList.size() != 0) {
                    for (int i = 0; i < auctionKeyDatesAmendmentList.size(); i++) {
                        amendmentListData = auctionKeyDatesAmendmentList.get(i);
                        auctionId = amendmentListData.getAuctionId();
                        anstartDate = amendmentListData.getAuctionPurchaseDateTime().split("-")[0];
                        anendDate = amendmentListData.getAuctionPurchaseDateTime().split("-")[1];
                    }
                    BeanUtils.copyProperties(an, amendmentListData);
                    System.out.println("@@@~~~ anstartDate of " + an.getPortalCharge() + " liveTenderList addtocartdaoimpl~~~@@@ " + anstartDate);
                    System.out.println("@@@~~~ anendDate of " + auctionId + " liveTenderList addtocartdaoimpl~~~@@@ " + anendDate);
                    if (sdf.parse(anstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(anendDate).getTime() && sdf.parse(anendDate).getTime() > sdf.parse(anstartDate).getTime()) {
                        auctionList2.add(an);
                    }
                } else {
                    AuctionKeyDates auctionKeyDates = auctionDaoImpl.readAuctionKeyDate(an.getAuctionId());
                    if (auctionKeyDates != null) {
                        an.setAuctionKeyDates(auctionKeyDates);
                        anstartDate = auctionKeyDates.getAuctionPurchaseDateTime().split("-")[0];
                        anendDate = auctionKeyDates.getAuctionPurchaseDateTime().split("-")[1];
                        if (sdf.parse(anstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(anendDate).getTime() && sdf.parse(anendDate).getTime() > sdf.parse(anstartDate).getTime()) {
                            auctionList2.add(an);
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return auctionList2;
    }

    @Override
    public AddToCart fetchTnDataWithContId(Integer id, int contractorId) {
        Session session = null;
        AddToCart addToCart = new AddToCart();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from AddToCart where tender_Id=:id and contractorId=:contractorId");
            query.setParameter("id", id);
            query.setParameter("contractorId", contractorId);
            addToCart = (AddToCart) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDaoImpl \n Method:fetchDataWithContId");
            System.out.println("Exception in fetchDataWithContId method of AddToCartDaoImpl " + ex.getMessage());
            ex.printStackTrace();
        }
        return addToCart;
    }

    @Override
    public AddToCart fetchAnDataWithContId(Integer id, int contractorId) {
        Session session = null;
        AddToCart addToCart = new AddToCart();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from AddToCart where auctionId=:id and contractorId=:contractorId");
            query.setParameter("id", id);
            query.setParameter("contractorId", contractorId);
            addToCart = (AddToCart) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDaoImpl \n Method:fetchDataWithContId");
            System.out.println("Exception in fetchDataWithContId method of AddToCartDaoImpl " + ex.getMessage());
            ex.printStackTrace();
        }
        return addToCart;
    }

    @Override
    public List<Tender> liveTenderList(int tender_Id) {
        SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm a");
        List<Tender> tenderList2 = new ArrayList<>();
        String tnstartDate = "";
        String tnendDate = "";
        Tender tn = null;
        TenderKeyDatesAmendment amendmentListData = null;
        try {
            System.out.println("tender_Id " + tender_Id);
            tn = tenderDaoImpl.read(tender_Id);
            System.out.println("tn " + tn);
            List<TenderKeyDatesAmendment> tenderKeyDatesAmendmentList = tenderAmendmentDaoImpl.readAllKeyDates(tn.getTender_Id());
            System.out.println("tenderKeyDatesAmendmentList size " + tenderKeyDatesAmendmentList.size());
            if (tenderKeyDatesAmendmentList.size() != 0) {
                for (int i = 0; i < tenderKeyDatesAmendmentList.size(); i++) {
                    amendmentListData = tenderKeyDatesAmendmentList.get(i);
                    tender_Id = Integer.parseInt(amendmentListData.getTender_Id());
                    tnstartDate = amendmentListData.getTenderPurchaseDate().split("/")[0];
                    tnendDate = amendmentListData.getTenderPurchaseDate().split("/")[1];

                }
                BeanUtils.copyProperties(tn, amendmentListData);
                if (tnstartDate.startsWith(" ")) {
                    tnstartDate = tnstartDate.substring(1);
                }
                if (tnendDate.startsWith(" ")) {
                    tnendDate = tnendDate.substring(1);
                }
                System.out.println("@@@~~~ tnstartDate of " + tender_Id + " liveTenderList addtocartdaoimpl~~~@@@ " + tnstartDate);
                System.out.println("@@@~~~ tnendDate of " + tender_Id + " liveTenderList addtocartdaoimpl~~~@@@ " + tnendDate);

                if (sdf.parse(tnstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(tnendDate).getTime() && sdf.parse(tnendDate).getTime() > sdf.parse(tnstartDate).getTime()) {
                    tenderList2.add(tn);
                }
            } else {
                TenderKeyDates tenderKeyDateses = tenderDaoImpl.readKeyDate(tn.getTender_Id());
                System.out.println("tenderKeyDateses " + tenderKeyDateses);
                if (tenderKeyDateses != null) {
                    tn.setTenderKeyDates(tenderKeyDateses);
                    tnstartDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[0];
                    Date startDate = new Date(tnstartDate);
                    tnendDate = tenderKeyDateses.getTenderPurchaseDate().split("/")[1];
                    Date endDate = new Date(tnendDate);
                    if (startDate.getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= endDate.getTime() && endDate.getTime() > startDate.getTime()) {
                        tenderList2.add(tn);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tenderList2;
    }

    @Override
    public List<Auction> liveAuctionList(int auctionId) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        List<Auction> auctionList2 = new ArrayList<>();
        String anstartDate = "";
        String anendDate = "";
        Auction an = null;
        AuctionAmidmentKeyDates amendmentListData = null;
        try {
            an = auctionDaoImpl.editAuctionData(auctionId);
            List<AuctionAmidmentKeyDates> auctionKeyDatesAmendmentList = amendmentKeyDatesDaoImpl.readAllKeyDates(an.getAuctionId());
            if (auctionKeyDatesAmendmentList.size() != 0) {
                for (int i = 0; i < auctionKeyDatesAmendmentList.size(); i++) {
                    amendmentListData = auctionKeyDatesAmendmentList.get(i);
                    auctionId = amendmentListData.getAuctionId();
                    anstartDate = amendmentListData.getAuctionPurchaseDateTime().split("-")[0];
                    anendDate = amendmentListData.getAuctionPurchaseDateTime().split("-")[1];
                }
                BeanUtils.copyProperties(an, amendmentListData);
                System.out.println("@@@~~~ anstartDate of " + an.getPortalCharge() + " liveTenderList addtocartdaoimpl~~~@@@ " + anstartDate);
                System.out.println("@@@~~~ anendDate of " + auctionId + " liveTenderList addtocartdaoimpl~~~@@@ " + anendDate);
                if (sdf.parse(anstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(anendDate).getTime() && sdf.parse(anendDate).getTime() > sdf.parse(anstartDate).getTime()) {
                    auctionList2.add(an);
                }
            } else {
                AuctionKeyDates auctionKeyDates = auctionDaoImpl.readAuctionKeyDate(an.getAuctionId());
                if (auctionKeyDates != null) {
                    an.setAuctionKeyDates(auctionKeyDates);
                    anstartDate = auctionKeyDates.getAuctionPurchaseDateTime().split("-")[0];
                    anendDate = auctionKeyDates.getAuctionPurchaseDateTime().split("-")[1];
                    if (sdf.parse(anstartDate).getTime() <= sdf.parse(sdf.format(new Date())).getTime() && sdf.parse(sdf.format(new Date())).getTime() <= sdf.parse(anendDate).getTime() && sdf.parse(anendDate).getTime() > sdf.parse(anstartDate).getTime()) {
                        auctionList2.add(an);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return auctionList2;
    }

    @Override
    public List<AddToCart> fetchAnDataWithContId(int contractorId) {
          Session session = null;
        List<AddToCart> addToCartTenderList = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            addToCartTenderList = session.createQuery("from AddToCart where contractorId="+contractorId).list();
        } catch (Exception ex) {
            System.out.println("Class: AddToCartDaoImpl \n Method:fetchAll");
            System.out.println("Exception in fetchAll method of AddToCart " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchAll method of AddToCart****************************************");
        return addToCartTenderList;//To change body of generated methods, choose Tools | Templates.
    }

  
}
