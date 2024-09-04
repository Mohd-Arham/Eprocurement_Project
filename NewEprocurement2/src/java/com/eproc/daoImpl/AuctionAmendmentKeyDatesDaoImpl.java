/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.AuctionAmendmentKeyDatesDao;
import com.eproc.domain.AuctionAmidmentKeyDates;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Naina Jain
 */
@Repository
public class AuctionAmendmentKeyDatesDaoImpl implements AuctionAmendmentKeyDatesDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<AuctionAmidmentKeyDates> readAllKeyDates(int auctionId) throws Exception {
        Session session = null;
        List<AuctionAmidmentKeyDates> amidmentKeyDateses = new ArrayList();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from AuctionAmidmentKeyDates where auctionId=:auctionId");
            query.setParameter("auctionId", auctionId);
            amidmentKeyDateses = query.list();
        } catch (Exception ex) {
            System.out.println("Class: auctionAmenKeydateDAOImpl \n Method:readAllKeyDates");
            System.out.println("Exception in readAllKeyDates method of auctionAmenKeydateDAOImpl  " + ex.getMessage());
            ex.printStackTrace();
        }
        session.close();
        return amidmentKeyDateses;
    }

    @Override
    public boolean insertData(AuctionAmidmentKeyDates e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AuctionAmidmentKeyDates fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateData(AuctionAmidmentKeyDates e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
