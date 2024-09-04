package com.eproc.daoImpl;

import com.eproc.dao.TenderKeywordDAO;
import com.eproc.domain.TenderKeyword;
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
public class TenderKeywordDAOImpl implements TenderKeywordDAO {

    @Autowired
    SessionFactory sessionFactory;
    TenderKeyword addKeywords;

    @Override
    public boolean insertData(TenderKeyword addkeywords) {
        System.out.println("**************KeywordDAOImpl's saveKeywords method run**************");
        System.out.println(addkeywords.getTenderKeyWordsName() + "  KeywordDAOImpl");
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            System.out.println("%%%%%%%%%% TenderKeyWordsId:: " + addkeywords.getTenderKeyWordsId());
            addkeywords.setTenderKeyWordsName(addkeywords.getTenderKeyWordsName().toUpperCase());
            session.saveOrUpdate(addkeywords);
            tx.commit();
        } catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:insertdata");
            System.out.print("Exception in insertData of Addkeywords " + ex.getMessage());
            tx.rollback();
        } finally {
            if (tx != null) {
                tx.commit();
            }
            if (session != null) {
                session.close();
            }
        }

        System.out.println("................End insertData method of Addkeyword..............");
        return true;
    }

    @Override
    public boolean removeData(Integer id) {
        System.out.println("**************KeywordDAOImpl's deleteKeywordsById method run**************");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            TenderKeyword addkeyword = (TenderKeyword) session.load(TenderKeyword.class, id);
            session.delete(addkeyword);
            Transaction tx = session.beginTransaction();
            tx.commit();
        } catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:removedata");
            System.out.println("Exception in removeData method of Addkeyword" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }

        System.out.println("*******************END****************************************");
        return true;
    }

    @Override
public TenderKeyword fetchData(Integer id) {
    System.out.println("*KeywordDAOImpl's fetchKeywordsById method run*");
    System.out.println("TenderKeyWordID" + id);
    Session session = null;
    TenderKeyword addkeywords = null; // Initialize as null
    try {
        System.out.println("UNDER AYA TRY KE");
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM TenderKeyword WHERE tenderKeyWordsId = :id");
        query.setParameter("id", id); // Set the parameter
        addkeywords = (TenderKeyword) query.uniqueResult();
        if (addkeywords != null) {
            System.out.println("ADD KEY WORDS RESULTS" + addkeywords.getTenderKeyWordsId().toString());
        } else {
            System.out.println("No TenderKeyword found with ID: " + id);
        }
    } catch (Exception ex) {
        ex.printStackTrace(); // Print stack trace for debugging
    } finally {
        if (session != null) {
            session.close();
        }
    }
    System.out.println("END fetchData method of Addkeywords*");
    System.out.println("ADD KEY WORKDSsss" + addkeywords);
    return addkeywords;
}

     @Override
    public TenderKeyword read(int tenderKeyWordsId){
        Session session = null;
        TenderKeyword tender = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderKeyword WHERE tenderKeyWordsId =:tenderKeyWordsId");
            query.setParameter("tenderKeyWordsId", tenderKeyWordsId);
           List<TenderKeyword> tenderKey =  query.list();
            System.out.println("The Tender Object are: "+tenderKey.size());
            for(TenderKeyword keyword : tenderKey){
             tender = keyword;
            };
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
           if(session != null){
               session.close();
           }
       }
     return tender;
    }
    
    
    @Override
    public boolean updateData(TenderKeyword addkeywords) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
        System.out.println("**************KeywordDAOImpl's fetchAllKeywords method run**************");
        Session session = null;
        List<TenderKeyword> addKeywordList = new ArrayList<TenderKeyword>();
        try {
            session = sessionFactory.openSession();
            addKeywordList = session.createQuery("from TenderKeyword").list();

        } catch (Exception ex) {
            System.out.println("Class: AddKeywordDaoImpl \n Method:fetchdata");
            System.out.print("Exception in fetchAll method of Addkeywords " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END fetchAll method of Addkeywords****************************************");
        return addKeywordList;
    }

    @Override
    public String getDuplicateAddKeyword(TenderKeyword addkeywords,Integer deptId) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String msg = "Keyword Added Successfully";
        int areaofwork_id = addkeywords.getAreaofwork_id();
        String tenderKeyWordsName = addkeywords.getTenderKeyWordsName();
        System.out.println("tenderKeyWordsName::" + tenderKeyWordsName);
        String SQL_QUERY = "from TenderKeyword where areaofwork_id =:areaofwork_id";
        Query query = session.createQuery(SQL_QUERY);
        query.setParameter("areaofwork_id", areaofwork_id);
        List<TenderKeyword> keywordListduplicate = query.list();
        Iterator<TenderKeyword> iterator = keywordListduplicate.iterator();
        while (iterator.hasNext()) {
            TenderKeyword ak = iterator.next();
            if (tenderKeyWordsName.equalsIgnoreCase(ak.getTenderKeyWordsName())) {
                msg = "Keyword Already Exist";
            }
        }
        return msg;
    }

    @Override
    public List fetchAllTenderKeywordbyDept_ID(Integer id) {
        System.out.println("----------------Method call to fetchAllTenderKeywordbyDept_ID in  TenderKeywordDaoImpl----------------");
        List<TenderKeyword> addKeywordList = new ArrayList<TenderKeyword>();
        Session session=null;
        try {
             session= sessionFactory.openSession();
            Query query = session.createQuery("FROM TenderKeyword where dept_Id=:id");
            query.setParameter("id", id);
            System.out.println("dept id ~~~"+id);
            addKeywordList = query.list();
        }catch(Exception ex){
         System.out.println("Class: TenderKeywordDaoImpl \n Method:fetchAllTenderKeywordbyDept_ID");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
        System.out.println("----------------Method end to fetchAllTenderKeywordbyDept_ID  in TenderKeywordDaoImpl----------------");
         return addKeywordList ; 
    }
}
