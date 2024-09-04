
package com.eproc.daoImpl;

import com.eproc.dao.TenderCategoryDAO;
import com.eproc.domain.TenderCategory;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Naina Jain
 */
@Repository
public class TenderCategoryDAOImpl implements TenderCategoryDAO {

    @Autowired
    SessionFactory sessionFactory;
    TenderCategory addcategory;

    @Override
    public boolean insertData(TenderCategory addcategory) {
        System.out.println("**************KeywordDAOImpl's SaveCategory method run**************");
        System.out.println(addcategory.getTender_category_name() + "  KeywordDAOImpl");
        Session session=null;
        try{
       session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(addcategory);
          tx.commit();
         } catch (Exception ex) {
        System.out.println("Class: CategoryDaoImpl \n Method:insertdata");
            System.out.println("Exception in insertData of TenderCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END insertData of TenderCategory****************************************");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("**************KeywordDAOImpl's deleteCategoryById method run**************");
         Session session=null;
         try{
        session = sessionFactory.openSession();
        TenderCategory addcategory = (TenderCategory) session.load(TenderCategory.class, id);
        session.delete(addcategory);
        Transaction tx = session.beginTransaction();
        tx.commit();
         } catch (Exception ex) {
            System.out.println("Class: CategoryDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData By Id of TenderCategory : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END removeData of TenderCategory****************************************");
        return true;
    }

    @Override
    public TenderCategory fetchData(Integer id) {
       System.out.println("..........KeywordDAOImpl's fetchData AreaOfWork method run.........");
        Session session = null;
        TenderCategory addCategory = new TenderCategory();

        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("from TenderCategory where tender_category_id=:id");
            query.setParameter("id", id);
            addCategory = (TenderCategory) query.uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class: AreaOfWorkDaoImpl \n Method:fetchdata");
            System.out.println("Exception in fetchData method of AreaOfWork" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchData method of AreaOfWork****************************************");
        return addCategory;
    }

    @Override
    public boolean updateData(TenderCategory e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("**************KeywordDAOImpl's fetchAllCategory method run**************");
         Session session=null;
        List<TenderCategory> categoryList = new ArrayList<TenderCategory>();
        try{
        session = sessionFactory.openSession();
        categoryList = session.createQuery("from TenderCategory").list();
        System.out.println("categoryList:  "+categoryList.size());
        } catch (Exception ex) {
            System.out.println("class:CatagoryDaoImpl \n Method:fetchAll");
            System.out.print("Exception in fetchAll list of TenderCategory " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("*******************END fetchAll method of TenderCategory****************************************");
        return categoryList;
    }


    @Override
    public List getDuplicateCategory(TenderCategory addcategory,Integer deptId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String catName = addcategory.getTender_category_name();
        return session.createCriteria(TenderCategory.class).add(Restrictions.eq("tender_category_name", catName)).list();
    }

    @Override
    public List fetchAllTenderCategorybydeptId(Integer id) {
       System.out.println("----------------Method call to fetchAllTenderCategorybyDept_ID in  TenderCategoryDaoImpl----------------");
        List<TenderCategory> categoryList = new ArrayList<TenderCategory>();
        Session session=null;
        try {
             session= sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderCategory where dept_Id=:id");
            query.setParameter("id", id);
            System.out.println("dept id ~~~"+id);
            categoryList = query.list();
        }catch(Exception ex){
         System.out.println("Class: TenderCategoryDaoImpl \n Method:fetchAllTenderCategorybyDept_ID");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
        System.out.println("----------------Method end to fetchAllTenderCategorybyDept_ID  in  TenderCategoryDaoImpl----------------");
         return categoryList ; 
    }
}
