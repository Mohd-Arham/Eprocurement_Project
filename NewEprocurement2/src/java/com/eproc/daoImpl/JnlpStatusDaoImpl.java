package com.eproc.daoImpl;

import com.eproc.dao.JnlpStatusDao;
import com.eproc.domain.JnlpStatus;
import com.eproc.service.HibernateUtil;
import com.google.gson.Gson;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JnlpStatusDaoImpl implements JnlpStatusDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void saveJnlpEntry(JnlpStatus jnlpStatus) {
        Session session = null;
        try {
            System.out.println(sessionFactory + " : saveJnlpEntry saveJnlpEntry saveJnlpEntry : " + session);
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.save(jnlpStatus);
            txn.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public JnlpStatus fetchJnlpStatus(String randomNo) {
        JnlpStatus jnlpStatus = null;
        Session session = null;
        try {
            // System.out.println("fetchJnlpStatus sessionFactory sessionFactory : " + sessionFactory);
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM JnlpStatus WHERE randomNo =:randomNo");
            query.setParameter("randomNo", randomNo);
            query.setMaxResults(1);
            jnlpStatus = (JnlpStatus) query.uniqueResult();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return jnlpStatus;
    }

    @Override
    public String fetchJnlpStatusByRandomNo(String randomNo) {
        //System.out.println("randomNo: " + randomNo);
        String data = null;
        try {
            String dataArray[] = new String[3];
            JnlpStatus jnlpStatus = fetchJnlpStatus(randomNo);
            dataArray[0] = "failure";
            if (jnlpStatus != null) {
                dataArray[0] = "success";
                dataArray[1] = jnlpStatus.getStatus();
                dataArray[2] = jnlpStatus.getUrl();
            }
            Gson gson = new Gson();
            data = gson.toJson(dataArray);
            System.out.println("data is : " + data);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public int saveJnlpStatus(JnlpStatus jnlpStatus) {
        int i = 0;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            System.out.println(sessionFactory + " : saveJnlpEntry saveJnlpEntry saveJnlpEntry : " + session);
            session.beginTransaction();
            session.saveOrUpdate(jnlpStatus);
            session.getTransaction().commit();
            i = 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return i;
    }

    public int updateJnlpStatus(JnlpStatus jnlpStatus, String randomNo) {
        int i = 0;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            System.out.println("session have : "+session);
            session.beginTransaction();
            Query query = session.createSQLQuery("UPDATE jnlp_status SET status =:status WHERE randomNo =:randomNo");
            query.setParameter("status", "active");
            query.setParameter("randomNo", randomNo);
            i = query.executeUpdate();
            session.getTransaction().commit();
            System.out.println("jnlp update status is : " + i);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return i;
    }

}
