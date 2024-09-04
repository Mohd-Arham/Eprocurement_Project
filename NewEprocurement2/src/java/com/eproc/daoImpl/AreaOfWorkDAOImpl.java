package com.eproc.daoImpl;

import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.domain.AreaOfWork;
import java.util.ArrayList;
import java.util.Iterator;
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
 */
@Repository
public class AreaOfWorkDAOImpl implements AreaOfWorkDAO {

    @Autowired
    SessionFactory sessionFactory;
    AreaOfWork addareaofwork;

    @Override
    public boolean insertData(AreaOfWork addareaofwork) {
        System.out.println("****************KeywordDAOImpl's saveAreaOfWork method run****************");
        System.out.println(addareaofwork.getAreaofwork_name() + "  AreaOfWorkDAOImpl");
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            session.saveOrUpdate(addareaofwork);

        } catch (Exception ex) {
            System.out.println("Class: AreaOfWorkDaoImpl \n Method:insertdata");
            System.out.println("Exception in inserData method of AreaOfWork" + ex.getMessage());
            tx.rollback();
        } finally {
            if (tx != null) {
                tx.commit();
            }
            if (session != null) {
                session.close();
            }
        }

        System.out.println("*******************END inserData method of AreaOfWork****************************************");
        return true;

    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("*************KeywordDAOImpl's deleteAreaOfWork method run***************");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            AreaOfWork addareaofwork = (AreaOfWork) session.load(AreaOfWork.class, id);
            session.delete(addareaofwork);
            Transaction tx = session.beginTransaction();
            tx.commit();
        } catch (Exception ex) {
            System.out.println("Class: AreaOfWorkDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData method of AreaOfWork" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }

        System.out.println("*******************END removeData method of AreaOfWork****************************************");
        return true;
    }

    @Override
    public AreaOfWork fetchData(Integer id) {
        System.out.println("..........KeywordDAOImpl's fetchData AreaOfWork method run.........");
        Session session = null;
        AreaOfWork addareaofwork = new AreaOfWork();
//        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened");
            Query query = session.createQuery("from AreaOfWork where areaofwork_id=:id");
            query.setParameter("id", id);
            addareaofwork =  (AreaOfWork) query.uniqueResult();
//        } catch (Exception ex) {
//            System.out.println("Class: AreaOfWorkDaoImpl \n Method:fetchdata");
//            System.out.println("Exception in fetchData method of AreaOfWork" + ex.getMessage());
//       ex.printStackTrace();
//        } finally {
//            if (session != null) {
//                session.close();
//            }
//        }

        System.out.println("*******************END fetchData method of AreaOfWork****************************************");
        return addareaofwork;

    }

    @Override
    public boolean updateData(AreaOfWork e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("**************KeywordDAOImpl's fetchAllAreaOfWork method run**************");
        Session session = null;
        List<AreaOfWork> areaofworkList = new ArrayList<AreaOfWork>();
        try {
            session = sessionFactory.openSession();
            areaofworkList = session.createQuery("from AreaOfWork").list();
        } catch (Exception ex) {
            System.out.println("Class: AreaOfWorkDaoImpl \n Method:fetchAll");
            System.out.println("Exception in fetchAll method of AreaOfWork" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchAll method of AreaOfWork****************************************");
        return areaofworkList;
    }

    @Override
    public String getDuplicateAreaOfWork(AreaOfWork addareaofwork,Integer deptId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String msg = "Area Of Work Added Successfully";
        System.out.println("addareaofwork.getTender_category_id()::" + addareaofwork.getTender_category_id());
        Integer tender_category_id = addareaofwork.getTender_category_id();
        String areaofwork_name = addareaofwork.getAreaofwork_name();
//        return session.createCriteria(AreaOfWork.class).add(Restrictions.eq("areaofwork_name", areaofworkName)).list();
        String SQL_QUERY = "from AreaOfWork where tender_category_id =:tender_category_id";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter("tender_category_id", tender_category_id);
        List<AreaOfWork> areaofworkListduplicate = query.list();
        Iterator<AreaOfWork> iterator = areaofworkListduplicate.iterator();
        while (iterator.hasNext()) {
            AreaOfWork aow = iterator.next();
            if (areaofwork_name.equalsIgnoreCase(aow.getAreaofwork_name())) {
                msg = "Area Of Work already Exist";
            }
        }
        return msg;
    }

    @Override
    public List fetchAllAreaOfWorkbyDept_ID(Integer tender_category_id) {
        System.out.println("----------------Method call to fetchAllAreaOfWorkbyDept_ID in  TenderCategoryDaoImpl----------------");
        List<AreaOfWork> areaofworkList = new ArrayList<AreaOfWork>();
        Session session=null;
        try {
             session= sessionFactory.openSession();
            Query query = session.createQuery("FROM AreaOfWork where dept_Id=:id");
            query.setParameter("id", tender_category_id);
            System.out.println("dept id ~~~"+tender_category_id);
            areaofworkList = query.list();
        }catch(Exception ex){
         System.out.println("Class: AreaOfWorkDaoImpl \n Method:fetchAllAreaOfWorkbyDept_ID");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
        System.out.println("----------------Method end to fetchAllAreaOfWorkbyDept_ID  in  AreaOfWorkDaoImpl----------------");
         return areaofworkList ; 
    }
    
     @Override
    public List fetchAreaOfWorkbyTenderCategory(Integer tender_category_id) {
        List<AreaOfWork> areaofworkList = new ArrayList<AreaOfWork>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM AreaOfWork WHERE tender_category_id =:tender_category_id");
            query.setParameter("tender_category_id", tender_category_id);
            areaofworkList = query.list();
            System.out.println(areaofworkList.size());
        } catch (Exception ex) {
            System.out.print("Exception in FetchAll areaofwork " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll AreaOfWork in Dao----------------------------");
        return areaofworkList;
    
    }
}
