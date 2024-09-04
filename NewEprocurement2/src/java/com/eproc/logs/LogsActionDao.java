package com.eproc.logs;

import com.eproc.domain.Logs;
//import com.eproc.new_department.DepartmentLogsAction;
//import com.eproc.new_department.DeptUserRegistrationDao;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author OSMO-DES-5
 */
@Repository
public class LogsActionDao {
   
    @Autowired
   SessionFactory sessionFactory;
    
   public int save(Logs logs){
      int i = 0;
      Session session = null;
      Transaction transaction = null;
      try {
         SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy hh:mm:ss a");
//         SimpleDateFormat sdf1 = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
//         logs.setDateTime(sdf.format(sdf1.parse(logs.getDateTime())));
          Date date = new Date();
          logs.setDateTime(sdf.format(date));         
         session = sessionFactory.openSession();
         transaction = session.beginTransaction();
         session.save(logs);
         transaction.commit();
      } catch (Exception e) {
         e.printStackTrace();         
      } finally {
         if (session != null) {
            session.close();
         }         
      }
      return i;
   }
   
//   public static List<Logs> fetchAll(){      
//      Session session = null;
//      List<Logs> logs = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM Logs");
//         logs = (ArrayList<Logs>)query.list(); 
//         
//         for(Logs log : logs){
//            if(log.getDeptUserId() != null){
//               log.setDeptUser(DeptUserRegistrationDao.getDeptUserNameById(log.getDeptUserId()));
//            }
//            if(log.getDscId() == null){
//               log.setDscId("N/A");
//            }
//         }
//         
//      } catch (Exception e) {
//         e.printStackTrace();         
//         
//      } finally {
//         if (session != null) {
//            session.close();
//         }         
//      }
//      return logs;
//   }
//   
//   public static Logs fetchById(int logId){      
//      Session session = null;
//      Logs log = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM Logs WHERE logId =:logId");
//         query.setParameter("logId", logId);
//         log = (Logs)query.uniqueResult(); 
//         
//      } catch (Exception e) {
//         e.printStackTrace();         
//         
//      } finally {
//         if (session != null) {
//            session.close();
//         }         
//      }
//      return log;
//   }
//   
//   public static List<Logs> fetchLogsByProperty(String property){      
//      Session session = null;
//      List<Logs> logs = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM Logs WHERE "+property+" IS NOT NULL");
//         logs = (ArrayList<Logs>)query.list(); 
//         
//         for(Logs log : logs){
//            log.setDeptUser(DeptUserRegistrationDao.getDeptUserNameById(log.getDeptUserId()));
//            if(log.getDscId() == null){
//               log.setDscId("N/A");
//            }
//         }
//         
//      } catch (Exception e) {
//         e.printStackTrace();         
//         
//      } finally {
//         if (session != null) {
//            session.close();
//         }         
//      }
//      return logs;
//   }
//   
//   public static List<Logs> searchLogs(DepartmentLogsAction athis){      
//      Session session = null;
//      List<Logs> logs = null;
//      String sdate = null;
//      String edate = null;
//      String query = null;
//      String deptUserId = athis.getDeptUserId();
//      
//      try {
//         SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
//         if (athis.getStartDate() != null && !athis.getStartDate().equals("") && athis.getEndDate() != null && !athis.getEndDate().equals("")) {
//            sdate = sdf1.format(sdf1.parse(athis.getStartDate()));
//            edate = sdf1.format(sdf1.parse(athis.getEndDate()));
//         }
//         
//         if (sdate != null && edate != null && !deptUserId.equals("0")) {
//            System.out.println("for both");
//            query = "FROM Logs WHERE deptId = " + athis.getDeptId() + " AND deptUserId = " + deptUserId + " AND (DATE(str_to_date(dateTime,'%d-%m-%Y')) >= DATE(str_to_date('" + sdate + "','%d-%m-%Y')) AND DATE(str_to_date(dateTime,'%d-%m-%Y')) <= DATE(str_to_date('" + edate + "','%d-%m-%Y')))";
//         }
//         
//         if (sdate != null && edate != null && deptUserId.equals("0")) {
//            System.out.println("for between dates");
//            query = "FROM Logs WHERE deptId = " + athis.getDeptId() + " AND (DATE(str_to_date(dateTime,'%d-%m-%Y')) > DATE(str_to_date('" + sdate + "','%d-%m-%Y')) AND DATE(str_to_date(dateTime,'%d-%m-%Y')) < DATE(str_to_date('" + edate + "','%d-%m-%Y')))";
//         }
//         
//         if (sdate == null && edate == null && !deptUserId.equals("0")) {
//            System.out.println("for dept user");
//            query = "FROM Logs WHERE deptId = " + athis.getDeptId() + " AND deptUserId = " + deptUserId;
//         }
//         
//         if (sdate == null && edate == null && deptUserId.equals("0")) {
//            System.out.println("for without search");
//            query = "FROM Logs WHERE deptId = " + athis.getDeptId();
//         }
//         
//         session = HibernateUtil.getSessionFactory().openSession();         
//         logs = session.createQuery(query).list();
//         System.out.println("loglist size : "+logs.size());
//         
//         for(Logs log : logs){
//            log.setDeptUser(DeptUserRegistrationDao.getDeptUserNameById(log.getDeptUserId()));
//            if(log.getDscId() == null){
//               log.setDscId("N/A");
//            }
//         }
//
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }         
//      }
//      return logs;
//   }
   
    public Logs fetchData(Integer tenderId, Integer contId,String forEnvelope) {
        
        System.out.println("tender id  " +tenderId+" and cont id  "+contId);
        Session session = null; 
        Logs logs=new Logs();
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Logs WHERE tenderId =:tenderId and contractorId=:contractorId and Envelope=:Envelope ORDER BY logId DESC");
            query.setParameter("tenderId", tenderId);
            query.setParameter("contractorId", contId);
            query.setParameter("Envelope", forEnvelope);
            query.setMaxResults(1);
            
            logs= (Logs) query.uniqueResult();
            System.out.println("LogId " + logs.getLogId());
            if (logs.getBrowserName().contains("Firefox")) {
                logs.setBrowserName("Firefox");
            } else if (logs.getBrowserName().contains("Chrome")) {
                logs.setBrowserName("Chrome");
            } 
            else if (logs.getBrowserName().contains("")) {
                logs.setBrowserName("Chrome");
           }
              } catch (Exception ex) {
            System.out.print("//Exception in fetchData LogActionDao //" + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
         System.out.println("--------Method End to fetchData  in LogsActionDao-----------------");
           return logs;
    }
}
