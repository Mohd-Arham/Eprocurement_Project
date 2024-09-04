/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.SubDivisionDAO;
import com.eproc.domain.SubDivision;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubDivisionDAOImpl implements SubDivisionDAO<SubDivision>{

    @Autowired
    SessionFactory sessionFactory;
    SubDivision   subdivision;
    
   /*insertData
   * Method used to insert subdivision
   * @param subdivision
   */
   @Override
   public boolean insertData(SubDivision subdivision) {
      System.out.println("----------------Method call to insert subdivision in  SubDivisionDaoImpl----------------");
      Session session = null;
      Transaction txn=null;
      System.out.print(" subdivision save object is " + subdivision);
      try {
         session  = sessionFactory.openSession();
          txn = session.beginTransaction();
          session.saveOrUpdate(subdivision);
         System.out.println("subdivision save status is : " );
         
      } catch (Exception ex) {
            txn.rollback();
          System.out.println("Class:SubDivisionDaoImpl \n Method:insertData");
         System.out.print("Exception in insertData in subdivision " + ex.getMessage());
      } finally {
           if(txn != null){
            txn.commit();
        }
         if(session != null){
             session.close();
         }
      }
      System.out.println("----------------Method end to insert subdivision in  SubDivisionDaoImpl----------------");
      return false;
}
   
   /*fetchAll
   * Method used to fetchall data from subdivision
   * @param subdivision
   */
     @Override   
    public List<SubDivision> fetchAll() {
        System.out.println("----------------Method call to fetchAll subdivision in  SubDivisionDaoImpl----------------");
        List<SubDivision> subdivisionList = new ArrayList<SubDivision>();
        try{
        Session session = sessionFactory.openSession();
        subdivisionList = session.createQuery("FROM SubDivision").list();
            Iterator it = subdivisionList.iterator();
            while(it.hasNext()) {
                SubDivision dept1 = (SubDivision)it.next();
                System.out.println("Depart ID " + dept1.getSubdivision_id());
                
            }
             session.close();
        }
         catch (Exception ex) {
             System.out.println("Class:SubDivisionDaoImpl \n Method:fetchAll");
         System.out.print("Exception in fetchAll in subdivision " + ex.getMessage());
      }
         System.out.println("----------------Method end to fetchAll subdivision in  SubDivisionDaoImpl----------------");
         return subdivisionList ;
    }
    
   /*fetchData
   * Method used to fetch subdivision by Id
   * @param subdivision
   */
      @Override
    public SubDivision fetchData(Integer id) {
        System.out.println("----------------Method call to fetch subdivision by Id in  SubDivisionDaoImpl----------------");  
        SubDivision subdivision = new SubDivision();
        Session session =null;
        try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("FROM SubDivision WHERE subdivision_id=:id");
        query.setParameter("id", id );
        subdivision = (SubDivision) query.uniqueResult();
   
        }
         catch (Exception ex) {
             System.out.println("Class:SubDivisionDaoImpl \n Method:fetchData");
         System.out.print("Exception in fetchdata subdivision " + ex.getMessage());
        }
        finally
        {
           session.close();
        }
        System.out.println("----------------Method end to fetch subdivision by Id in  SubDivisionDaoImpl----------------");
        return  subdivision;
   }
    
   /*updateData
   * Method used to update subdivision 
   * @param subdivision
   */
      @Override
    public boolean updateData(SubDivision  subdivision ) {
        System.out.println("----------------Method call to update subdivision in  SubDivisionDaoImpl----------------");
        Session session =null;
        Transaction txn =null;
        try{
         session = sessionFactory.openSession();
         txn = session.beginTransaction();
         session.saveOrUpdate(subdivision);
           }
            catch(Exception ex)
        {
            System.out.println("Class:SubDivisionDaoImpl \n Method:updateData");
            System.out.print("Exception in updateData subdivision " + ex.getMessage());
        }
        finally
        {
        txn.commit();
        session.close();
        }
        System.out.println("----------------Method end to update subdivision in  SubDivisionDaoImpl----------------");
         return false;
    }
    
   /*removeData
   * Method used to remove data from subdivision by Id
   * @param subdivision
   */
     @Override
   public boolean removeData(Integer subdivision_id  ) {
         Session session=null;
         try{
        session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM SubDivision WHERE "
                + "subdivision_id  =:subdivision_id");
        query.setParameter("subdivision_id", subdivision_id );
        query.executeUpdate();
            }
          catch(Exception ex)
        {
            System.out.println("Class:SubDivisionDaoImpl \n Method:removeData");
            System.out.print("Exception in updateData subdivision " + ex.getMessage());
        }
           finally
         {
        session.close();
         }
         return false;
    }

   public boolean  removeDataList(SubDivision division) {
        System.out.println("*KeywordDAOImpl's deleteKeywordsById method run*");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            SubDivision cityToDelete = (SubDivision) session.load(SubDivision.class, division.getSubdivision_id());
            if (cityToDelete != null) {
                Transaction tx = session.beginTransaction();
                session.delete(cityToDelete);
                tx.commit();
                System.out.println("City removed successfully");
                return true; // Return true if deletion was successful
            } else {
                System.out.println("City not found");
                return false; // Return false if city was not found
            }
        } catch (Exception ex) {
            System.out.println("Class: KeywordDAOImpl \n Method:removeDataList");
            System.out.println("Exception in removeDataList method of KeywordDAOImpl: " + ex.getMessage());
            return false; // Return false in case of any exception
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("END*");
        }
    }
   
   
   @Override
    public String checkDuplicateValue(SubDivision subdivision) {
  System.out.println("-----------------Method called to checkDuplicateValue SubDivision in Dao----------------------------");
        String message = "";
        List<SubDivision> subdivisionList = this.fetchAll();
        Iterator<SubDivision> iterator = subdivisionList.listIterator();
        while (iterator.hasNext()) {
            SubDivision sd = iterator.next();
            if (subdivision.getSubdivision().trim().equalsIgnoreCase(sd.getSubdivision().trim())
                    &&subdivision.getDivision_id()==sd.getDivision_id()) {
                message = "Duplicate Subdivision Name";
                System.out.println(message);

            } else if (subdivision.getSubdivision().isEmpty() || subdivision.getSubdivision()== null) {

                message = "Enter Subdivision Name";

            }
        }
        System.out.println("-----------------Method End to checkDuplicateValue SubDivision in Dao----------------------------");
        return message;

    }
     @Override
    public List fetchSubDivision(Integer division_id) {
         List<SubDivision> subdivisionList = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM SubDivision WHERE division_id =:division_id");
            query.setParameter("division_id", division_id);
            subdivisionList = query.list();
            System.out.println(subdivisionList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll division " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll countries in Dao----------------------------");
        return subdivisionList;
    
    }

    @Override
    public List fetchAllbyDept_ID(Integer id) {
        System.out.println("----------------Method call to fetchAllbyDept_ID subdivision in  SubDivisionDaoImpl----------------");
        List<SubDivision> subdivisionList = new ArrayList<SubDivision>();
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("FROM SubDivision where deptId=:id");
            query.setParameter("id", id);
            subdivisionList = query.list();
            Iterator it = subdivisionList.iterator();
            while (it.hasNext()) {
                SubDivision dept1 = (SubDivision) it.next();
                System.out.println("Depart ID " + dept1.getSubdivision_id());

            }
            session.close();
        } catch (Exception ex) {
            System.out.println("Class:SubDivisionDaoImpl \n Method:fetchAll");
            System.out.print("Exception in fetchAllbyDept_ID in subdivision " + ex.getMessage());
        }
        System.out.println("----------------Method end to fetchAllbyDept_ID subdivision in  SubDivisionDaoImpl----------------");
         return subdivisionList ;
    }
    
    @Override
    public String subDivisionName(Integer subdivision_id) {
       System.out.println("----------------Method To Fetch Division Name By id----------------");
        Session session = null;
        String subDivisionName = null;
        try {
            session = sessionFactory.openSession();
             Query query= session.createQuery("SELECT subdivision FROM SubDivision where subdivision_id=:subdivision_id");
            subDivisionName = (String) query.setParameter("subdivision_id", subdivision_id).uniqueResult();
        } catch (Exception ex) {
            System.out.println("Class:DivisionDaoImpl \n Method:fetchAllbyDept_ID");
            System.out.print("Exception in fetchall in division " + ex.getMessage());
        } finally {
            session.close();
        }
        return subDivisionName;
    }
    }


  

    
  
