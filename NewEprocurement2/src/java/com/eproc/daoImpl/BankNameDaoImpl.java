/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;
import com.eproc.dao.BankNameDao;
import com.eproc.domain.BankName;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author anshu
 */
@Repository
public class BankNameDaoImpl implements BankNameDao<BankName>
{
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean insertData(BankName e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

    }
    

    @Override
    public BankName fetchData(Integer id) {
               System.out.println("-----------------Method Called to fetchdata BankName in DaoImpl----------------------------");
      BankName bankname= new BankName();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM BankName WHERE bankId =:Id");
            query.setParameter("Id", id);
          bankname = (BankName) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in fetchData By Id of Msme : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchdata BankName in DaoImpl----------------------------");
        return bankname;
    }

    @Override
    public boolean updateData(BankName e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
       System.out.println("-----------------Method called to fetchAll BankName in DaoImpl----------------------------");
        List<BankName> banknameList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            banknameList = session.createQuery("FROM BankName").list();
            System.out.println("Size of banknameList " + banknameList.size());
              } catch (Exception ex) {
            System.out.print("Exception in FetchAll banknameList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll BankName in DaoImpl----------------------------");
        return banknameList;
    }
}
