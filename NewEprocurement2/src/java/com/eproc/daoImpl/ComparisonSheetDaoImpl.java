/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.ComparisonSheetDao;
import com.eproc.domain.ComparisonSheet;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lincpay Solutions
 */
@Repository
public class ComparisonSheetDaoImpl implements ComparisonSheetDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean saveData(ComparisonSheet sheet) {
        try {
            Session session = sessionFactory.openSession();
            System.out.println("zzzzzzzzzzzzzzzzzzzzzz" + sheet.toString());
            session.saveOrUpdate(sheet);
            System.out.println("*******************Save ComparisonSheet data ****************************************");
            session.close();
            return true;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }

    }

    @Override
    public List<ComparisonSheet> getAllByTenderId(Integer tenderId, Integer departmentUserId) {
        try {
            Session session = sessionFactory.openSession();
            List<ComparisonSheet> data = session.createQuery("from ComparisonSheet where tenderId = :tenderId and departmentUserId = :departmentUserId order by bidValue asc")
                    .setParameter("tenderId", tenderId)
                    .setParameter("departmentUserId", departmentUserId)
                    .list();

            System.out.println("*******************Save ComparisonSheet data ****************************************");
            System.out.println("aaaaaaaa" + data.toString());

            session.close();
            return data;
        } catch (Exception e) {
            // Handle HibernateException
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean findByCotracotrIdAndTenderId(ComparisonSheet sheet) {
        try {
            Session session = sessionFactory.openSession();
            List<ComparisonSheet> data = session.createQuery("from ComparisonSheet where tenderId=" + sheet.getTenderId() + " and contractorId=" + sheet.getContractorId()).list();
            if (data.isEmpty()) {
                return true;
            }

            session.close();
            return false;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}
