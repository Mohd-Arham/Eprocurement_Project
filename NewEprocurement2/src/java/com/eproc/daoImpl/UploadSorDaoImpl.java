package com.eproc.daoImpl;
import com.eproc.dao.UploadSorDao;
import com.eproc.domain.UploadSOR;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/** This is the UploadSorDaoImpl class which implements UploadSorDao.
 * In this class content  overrides the method of the UploadSorDao class
 @author Palak Tiwari
 **/
@Repository
public class UploadSorDaoImpl implements UploadSorDao {

    @Autowired
    SessionFactory sessionFactory;
    @Override
    public  boolean insertData(UploadSOR uploadSor) {
           Session session=null;
    try
       {
            session = sessionFactory.openSession();
            System.out.println("Session is Opened");
            session.save(uploadSor);
            System.out.println("Save uploadSor document");
        
           }catch(Exception e){
              e.printStackTrace();
          }
         finally{  
                 if(session!=null)
                 session.close();
                 System.out.println("Session is closed");
             }
       return true;
          }

    @Override
    public List<UploadSOR> fetchAll() {
        System.out.println("fetching all the data from database");
             Session session=null;
             List<UploadSOR> SorList = new ArrayList<UploadSOR>();
    try
       {
        session = sessionFactory.openSession();
        System.out.println("session is opened");
       
        session = sessionFactory.openSession();
       SorList = session.createQuery("from UploadSOR").list();
           }catch(Exception e){
              e.printStackTrace();
          }
         finally{  
                 if(session!=null)
                 session.close();
                 System.out.println("session is closed");
     }
          return SorList;
       }
    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public UploadSOR fetchData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public boolean updateData(UploadSOR e) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    /**
     * Method used to check duplicate file name
     * @param fileName
     * @return message 
     */
    @Override
    public String checkDuplicateValue(String fileName) {
         String message="";
         List<UploadSOR> UploadSorList = this.fetchAll();
          Iterator<UploadSOR> iterator = UploadSorList.listIterator();
            while (iterator.hasNext()) {
                UploadSOR uploadsor = iterator.next();
            if (fileName.trim().equalsIgnoreCase(uploadsor.getFileName().trim())) {
                    message = "Duplicate SOR Document Name";
                    System.out.println(message);
                   
                }else if(fileName.isEmpty() && fileName=="") {
              
                 message = "Please Enter SOR Document Name";
                 
                }
            }
            return message;
    }
    /**
     * method to update the status
     * @param id
     * @param status
     * @return true
     */

    @Override
    public boolean updateStatus(int id, String status) {
          Session session=null;
          Transaction txn=null;
    try
       {
            session = sessionFactory.openSession();
            System.out.println("session is opened for update");
             txn=session.beginTransaction();
            Query  query=session.createQuery("update UploadSOR set status=:status where id=:id");
            query.setParameter("status",status);
            query.setParameter("id", id);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update uploadSor document");       
           }catch(Exception e){
                txn.rollback();
                System.out.println("Class:UploadSORDaoImpl & Method:updateStatus");
              e.printStackTrace();
          }
         finally{ 
         if(txn != null){
            txn.commit();
        }
                 if(session!=null){
                 session.close();
                 System.out.println("session is closed in update");
                 }
             }
       return true;
    }
    
     /*
    * <h1>fetchSORDocumentByDeptId</h1>
    * <p>Program to fetch the SOR Document by dept Id and habving status is true</p>
    * 
    * @param dept_id
    * @since 21 July 2018
    * @version 2.0.0
    * @return List
    */
    @Override
    public List<UploadSOR> fetchSORDocumentByDeptId(int dept_id) {
       System.out.println("Fetching all SOR Document by dept_id=: "+dept_id);
             Session session=null;
             List<UploadSOR> SorList = new ArrayList<UploadSOR>();
             String status = "Enable";
    try{
        session = sessionFactory.openSession();
        System.out.println("session is opened");       
        session = sessionFactory.openSession();
        Query query = session.createQuery("from UploadSOR WHERE dept_id =:dept_id AND status =:status");
        query.setParameter("dept_id", dept_id);
        SorList = query.setParameter("status", status).list();
           }catch(Exception e){
              e.printStackTrace();
          }
         finally{  
                 if(session!=null)
                 session.close();
                 System.out.println("session is closed");
     }
          return SorList;
    }

    @Override
    public UploadSOR fecthSORDocumentByIdDeptIdAndStatus(int sorDocumentId, int dept_id, String status) {
        UploadSOR uploadSOR = null;
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM UploadSOR WHERE dept_id =:dept_id AND status =:status AND id =:sorDocumentId");
            query.setParameter("dept_id", dept_id);
            query.setParameter("status", status);
            query.setParameter("sorDocumentId", sorDocumentId);
            uploadSOR = (UploadSOR) query.uniqueResult();
            System.out.println("The Upload SOR Document is: "+uploadSOR);
        }catch(Exception ex){
            ex.printStackTrace();
        }
       return uploadSOR;
    }
    
        public UploadSOR fecthSORDocumentById(int id) {
        UploadSOR uploadSOR = null;
        Session session = null;
        try{
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM UploadSOR WHERE id =:id");
            query.setParameter("id", id);
            uploadSOR = (UploadSOR) query.uniqueResult();
            System.out.println("The Upload SOR Document is: "+uploadSOR);
        }catch(Exception ex){
            ex.printStackTrace();
        }
       return uploadSOR;
    }
    
    
}

