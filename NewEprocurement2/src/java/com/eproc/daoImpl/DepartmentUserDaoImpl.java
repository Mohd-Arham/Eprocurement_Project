
package com.eproc.daoImpl;

import com.eproc.dao.CircleDAO;
import com.eproc.dao.DepartmentUserDao;
import com.eproc.dao.DivisionDAO;
import com.eproc.dao.SubDivisionDAO;
import com.eproc.domain.AuctionKeyDates;
import com.eproc.domain.Circle;
import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.Contractor;
import com.eproc.domain.DepartmentSecondaryUser;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Designation;
import com.eproc.domain.Division;
import com.eproc.domain.Secondary_Contractor;
import com.eproc.domain.SubDivision;
import com.eproc.logs.LogsAction;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKey;
import javax.sound.midi.SysexMessage;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**This DepartmentUserDaoImpl class is Used to manage all DepartmentUser Operations at the time of Registration
 *
 * 
 * @author Vaishali Gupta
 */
@Repository
public class DepartmentUserDaoImpl implements DepartmentUserDao<DepartmentUser>{

    @Autowired
    SessionFactory sessionFactory;
    DepartmentUser departmentUser;
    @Autowired
    LogsAction logsAction;
    @Autowired
    DesignationDaoImpl designationDao;
     @Autowired
      SubDivisionDAO subDivisionDAO;
     @Autowired
    CircleDAO circleDAO;
     @Autowired
    DivisionDAO divisionDAO;
     SubDivision subDivision;
    Division division;
    Designation designation;
     Circle circle;
    /*
     * fetchAll DepartmentUser 
     * Method used to fetch All DepartmentUser
     * @param 
     * @return departmentUsers
     */
    @Override
    public List fetchAll() {
     System.out.println("-----------------Method called to fetchAll DepartmentUser in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentUser> departmentUsers = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser");
         departmentUsers = query.list();
         System.out.println("The Depratment User List is: "+departmentUsers.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAll");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAll DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return departmentUsers;
    }

    /*
     * SaveOrUpdate DepartmentUser 
     * Method used to save or update DepartmentUser
     * @param DepartmentUser
     * @return true
     */
    @Override
   
    public boolean insertData(DepartmentUser departmentUser) {
         System.out.println("-----------------Method called to insertData DepartmentUser in DepartmentUserDaoImpl----------------------------"); 
     Session session = null;
     boolean result = true;
     try{
        
         session = sessionFactory.openSession();
         Transaction txn = session.beginTransaction();
         session.saveOrUpdate(departmentUser);
          txn.commit();
     }catch(Exception ex){
            System.out.println("Class: DepartmentUserDaoImpl \n Method:insertdata");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
      System.out.println("-----------------Method end to insertData DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return result;
    }

   
    @Override
    public boolean updateDataUserType( Integer reg_Id, String status) {
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
        
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentUser set userType=:userType where reg_Id=:reg_Id");
            query.setParameter("userType",status);
            query.setParameter("reg_Id", reg_Id);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
      return true;
    }

    /*
     * remove DepartmentUser 
     * Method used to remove DepartmentUser
     * @param id
     * @return true
     */
    @Override
    public boolean removeData(Integer id) {
        System.out.println("-----------------Method called to remove DepartmentUser in DepartmentUserDaoImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("DELETE FROM DepartmentUser WHERE reg_Id =:id");
            query.setParameter("id", id);
            query.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception in removeData By Id of DepartmentUser : " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to remove DepartmentUser in DepartmentUserDaoImpl----------------------------");
        return true;
    }

     /*
     * fetch DepartmentUser 
     * Method used to fetch DepartmentUser
     * @param reg_Id
     * @return departmentUser
     */
    @Override
    public DepartmentUser fetchData(Integer reg_Id) {
        System.out.println("reg_Id is " + reg_Id);
         System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
       DepartmentUser departmentUser = null;
       try{
           session = sessionFactory.openSession();
           Query query = session.createQuery("FROM DepartmentUser WHERE reg_Id =:reg_Id");
           departmentUser = (DepartmentUser) query.setParameter("reg_Id", reg_Id).uniqueResult();
          
             System.out.println("DepartMent user Details  by reg id"+ departmentUser);
       }catch(Exception ex){
              System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchData");
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
        System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
       return departmentUser;
    }

    @Override
    public String checkDuplicateValue(DepartmentUser departmentUser) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

     @Override
    public boolean checkDuplicateEmail(String email,Integer deptId ) {
 System.out.println("-----------------Method called to checkDuplicateEmail in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     boolean emailStatus=false;
     DepartmentUser deptUser=new DepartmentUser();
     Contractor contractor=new Contractor();
     DepartmentSecondaryUser deptSecondUser=new DepartmentSecondaryUser();
    
     try{
         System.out.println("hiiiii "+deptId);
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where emailAdd=:email and deptId=:deptId");
          query.setParameter("email", email);
          query.setParameter("deptId", deptId);
          deptUser=(DepartmentUser) query.uniqueResult();
           
          if(deptUser == null){
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
            query = session.createQuery("FROM Contractor where emailid=:email");
          query.setParameter("email", email);
          contractor= (Contractor) query.uniqueResult();
        
          } if(contractor==null){
//              System.out.println(" contractor "+contractor.getEmailid());  
           query = session.createQuery("FROM DepartmentSecondaryUser where emailAdd=:email and deptId=:deptId");
          query.setParameter("email", email);
            query.setParameter("deptId", deptId);
          deptSecondUser=  (DepartmentSecondaryUser) query.uniqueResult();
         
           } if(deptSecondUser==null){
//                System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
          
          }
           if(deptUser != null){
               System.out.println(" deptUser "+deptUser.getEmailAdd());
                emailStatus=true;
           }
          if(contractor!=null){
               System.out.println(" contractor "+contractor.getEmailid());
                emailStatus=true;
          }
          if(deptSecondUser!=null){
               System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
                emailStatus=true;
          }
         
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       
   return emailStatus;
    }  

    @Override
    public boolean checkDuplicateContect(String mobile, Integer deptId) {
        System.out.println("-----------------Method called to checkDuplicateContect in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     boolean emailStatus=false;
     DepartmentUser deptUser=new DepartmentUser();
     Contractor contractor=new Contractor();
     DepartmentSecondaryUser deptSecondUser=new DepartmentSecondaryUser();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where mobNo=:mobNo and deptId=:deptId");
          query.setParameter("mobNo", mobile);
          query.setParameter("deptId", deptId);
          deptUser=(DepartmentUser) query.uniqueResult();
           
          if(deptUser == null){
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
            query = session.createQuery("FROM Contractor where mobileno=:mobileno");
          query.setParameter("mobileno", mobile);
          contractor= (Contractor) query.uniqueResult();
        
          } if(contractor==null){
//              System.out.println(" contractor "+contractor.getEmailid());  
           query = session.createQuery("FROM DepartmentSecondaryUser where mobNo=:mobNo and deptId=:deptId");
          query.setParameter("mobNo", mobile);
            query.setParameter("deptId", deptId);
          deptSecondUser=  (DepartmentSecondaryUser) query.uniqueResult();
         
           } if(deptSecondUser==null){
//                System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
          
          }
           if(deptUser != null){
               System.out.println(" deptUser "+deptUser.getEmailAdd()+"    "+deptUser.getMobNo());
                emailStatus=true;
           }
          if(contractor!=null){
               System.out.println(" contractor "+contractor.getEmailid()+"    "+contractor.getMobileno());
                emailStatus=true;
          }
          if(deptSecondUser!=null){
               System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd()+"        "+deptSecondUser.getMobNo());
                emailStatus=true;
          }
           
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       
   return emailStatus;
    }  
    
    
    @Override
   public String statusValue(Integer reg_Id, String status){
       
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentUser set status=:status where reg_Id=:reg_Id");
            query.setParameter("status", status);
            query.setParameter("reg_Id", reg_Id);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       
   
   return status;
   
   }
   
   /*
   * userOfAmmendmentPrivilege
   * Method call to fetch Ammendment privlege
   * created 18 Sep 2018
   * 
   */
    @Override
     public List userOfAmmendmentPrivilege(int deptId, String status){
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
      List <DepartmentUser> userOfAmmendmentPrivilege=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened Department Id: "+deptId);
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentUser where deptId=:deptId AND status=:status AND userPrivileges like '%,5,%' or userPrivileges like '5' or userPrivileges like '5,%' or userPrivileges like '%,5'");
            query.setParameter("deptId", deptId);
            query.setParameter("status", status);
            userOfAmmendmentPrivilege= query.list();
            txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
   return userOfAmmendmentPrivilege;
   }
     
    @Override
     public List getEA_UERS(){
       
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> EA_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentUser where userPrivileges like '%,9,%' or userPrivileges like '9' or userPrivileges like '9,%' or userPrivileges like '%,9'");

           EA_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return EA_User;
   
   }
     
    @Override
       public List getEB_UERS(){
       
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> EB_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentUser where userPrivileges like '%10%'");

           EB_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return EB_User;
   
   }
       
    @Override
         public List getEC_UERS(){
       
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> EC_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentUser where userPrivileges like '%11%'");

           EC_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return EC_User;
   
   }

    @Override
    public boolean updateData(DepartmentUser e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public String checkLogin(String validUser) {
        System.out.println("**************checkLogin deptUser method run     "+validUser+"**************");
        Session session = null;
        String flag = null;
        List list = null;
        String SQL_QUERY = "";
        Query query =null;
        try {
           System.out.println("Checking for valid user is  Department User");
            session = sessionFactory.openSession();
            System.out.println("Enter here");
             Query   query1= session.createQuery("from AuctionKeyDates");
      List<AuctionKeyDates> list2=   query1.list();
           
            SQL_QUERY = "from DepartmentUser where emailAdd =:validUser or mobNo =:validUser";
            query = session.createQuery(SQL_QUERY);
        
            query.setParameter("validUser", validUser);
            list = query.list();
            if ((list != null) && (list.size() > 0)) {
                flag = "DepartmentUser";
            } else {
                System.out.println("Checking for valid user is Contractor");
                SQL_QUERY = "from Contractor where emailid =:validUser or mobileno =:validUser";
               query = session.createQuery(SQL_QUERY);
                query.setParameter("validUser", validUser);
                list = query.list();
                if ((list != null) && (list.size() > 0)) {
                flag = "Contractor";
                }
                else{
                System.out.println("Checking for valid user is Secondary Contractor");
                SQL_QUERY = "from Secondary_Contractor where emailId =:validUser or mobileno =:validUser";
                 query = session.createQuery(SQL_QUERY);
                query.setParameter("validUser", validUser);
                list = query.list();
                if ((list != null) && (list.size() > 0)) {
                    flag = "SecondaryContractor";
                }else{
                 System.out.println("Checking for valid user is Department Admin");
                SQL_QUERY = "from DepartmentAdmin where deptEmailId =:validUser or deptMobNo =:validUser";
                query = session.createQuery(SQL_QUERY);
                query.setParameter("validUser", validUser);
                list = query.list();
                if ((list != null) && (list.size() > 0)) {
                    flag = "DepartmentAdmin";
                }
                }
              }
            }
                   
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END************************* "+ flag  +"    ******");
        return flag;
    }
    
      public List checkLogin1(String validUser) {
        System.out.println("**************checkLogin deptUser method run     "+validUser+"**************");
        Session session = null;
        String flag = null;
        List list = null;
        String SQL_QUERY = "";
       
        try {
            session = sessionFactory.openSession();
            SQL_QUERY = "from DepartmentUser where emailAdd =:validUser or mobNo =:validUser";
            Query query = session.createQuery(SQL_QUERY);
            query.setParameter("validUser", validUser);
            DepartmentUser departmentUser = (DepartmentUser) query.uniqueResult();
//            list = query.list();
            if (departmentUser!=null) {
             list.add(departmentUser);
             list.add("departmentUser");
             
            } else {
                SQL_QUERY = "from Contractor where emailid =:validUser or mobileno =:validUser";
                Query query1 = session.createQuery(SQL_QUERY);
                query1.setParameter("validUser", validUser);
                Contractor contractor = (Contractor) query1.uniqueResult();
                System.out.println("emaifdgdfsg "+contractor.getEmailid());
                if (contractor!=null) {
                list.add(contractor);
                list.add("contractor");
                }
                else{
                SQL_QUERY = "from Secondary_Contractor where emailid =:validUser or mobileno =:validUser";
                Query query2 = session.createQuery(SQL_QUERY);
                query2.setParameter("validUser", validUser);
                Secondary_Contractor secondaryContractor = (Secondary_Contractor) query2.uniqueResult();
                 if (secondaryContractor!=null) {
                 list.add(secondaryContractor);
                 list.add("secondaryContractor");
                }
                
                
                }
               
              }
                   
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("*******************END************************* "+ list.size()  +"    ******");
        return list;
    }

     @Override
    public void saveStatus(Common_Logon_Status commonlogin) {
        Session session = sessionFactory.openSession();
        Transaction txn = session.beginTransaction();
        try {
//            InetAddress ip = InetAddress.getLocalHost();
//            String ipAddress = ip.getHostAddress();
//            System.out.println("~~~~~~~~~~~~~~~~~~~ ip ~~~~~ Address ~~~~~~~~~~~~~~~~~" + ip + " " + ipAddress);
//
//            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
//            byte[] mac = network.getHardwareAddress();
//            System.out.print("Current MAC address : ");
//            StringBuilder sb = new StringBuilder();
//            for (int i = 0; i < mac.length; i++) {
//                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
//            }
            //System.out.println("~~~~~~~~~~~~~~~~~~~ mac ~~~~~ Address ~~~~~~~~~~~~~~~~~" + sb + " " + ipAddress);
            commonlogin.setIp_Address("192.168.0.116");
            commonlogin.setOsName("56541");
            commonlogin.setMac_Address("54623165");
            session.saveOrUpdate(commonlogin);
            txn.commit();
        } catch (Exception ex) {
            Logger.getLogger(DepartmentDaoImpl.class.getName()).log(Level.SEVERE, null, ex);

        }
        session.close();
    }
    
    @Override
    public List<Common_Logon_Status> fetchAllLogonStatus() {
        List<Common_Logon_Status> common_logonList = new ArrayList<Common_Logon_Status>();
        Session session = sessionFactory.openSession();
        try{
        common_logonList = session.createQuery("FROM Common_Logon_Status").list();
          System.out.println("~~~~ common logon list  "+common_logonList);
        }catch(Exception ex){
          System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAllByCircle_Id");
         ex.printStackTrace();
        }
        session.close();
        return common_logonList;
    }

    @Override
    public List fetchAllByCircle_Id(Integer circleId) {
     System.out.println("-----------------Method called to fetchAllByCircle_Id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentUser> departmentUsers = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where circleName=:circleName");
          
            query.setParameter("circleName", circleId);
          
         
         departmentUsers = query.list();
         System.out.println("The Depratment User List is: "+departmentUsers.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAllByCircle_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAllByCircle_Id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return departmentUsers;   
    }

    @Override
    public List fetchAllByDivision_Id(Integer divisionId) {
      System.out.println("-----------------Method called to fetchAllByDivision_Id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentUser> departmentUsers = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where divisionName=:divisionName");
          query.setParameter("divisionName", divisionId);
         departmentUsers = query.list();
         System.out.println("The Depratment User List is: "+departmentUsers.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAllByDivision_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAllByDivision_Id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return departmentUsers;  
    }

    @Override
    public List fetchAllBySubdivision_id(Integer subdivisionId) {
     System.out.println("-----------------Method called to fetchAllBySubdivision_id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentUser> departmentUsers = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where subdivisionName=:subdivisionName");
          query.setParameter("subdivisionName", subdivisionId);
         departmentUsers = query.list();
         System.out.println("The Depratment User List is: "+departmentUsers.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchAllBySubdivision_id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAllBySubdivision_id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return departmentUsers;  
    }
    
    
     @Override
         public List enable_User(){
       
        System.out.println("-----------------Method called to enable_USer DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
              List <DepartmentUser> enable_User=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened");
            Transaction txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentUser where status Enable");

           enable_User= query.list();
            txn.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
           
        }
       
   
   return enable_User;
   
   }

    @Override
    public String emailverified(Integer EmailNo) {
        System.out.println("-----------------Method called to Emailverified DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentUser set email_verified=:status where reg_Id=:reg_Id");
            query.setParameter("status", "verified");
            query.setParameter("reg_Id", EmailNo);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       
   
   return null;
     }

    @Override
    public String mobileverified(String mobNo) {
        System.out.println("-----------------Method called to mobileverified DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentUser set mobile_verified=:status where mobNo=:mobNo");
            query.setParameter("status", "verified");
            query.setParameter("mobNo", mobNo);
            query.executeUpdate();
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       
   
   return null;
     }

    @Override
    public String createPassword(Integer red_Id, String Password, String secretKey) {
     System.out.println("----Method called to createPassword DepartmentUser in DepartmentUserDaoImpl----------------");
       Session session = null;
 
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentUser set password=:password where reg_Id=:reg_Id");
            query.setParameter("password", Password);
            //query.setParameter("secretKey", secretKey);
            query.setParameter("reg_Id", red_Id);
            query.executeUpdate();
            txn.commit();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       
   
   return null;
     }
   
      @Override
    public String otpAlertStatus(String emailid, String otpstatus) {
        System.out.println("-----------------Method called to otpAlertStatus DepartmentUser in DepartmentUserDaoImpl----------------------------");
       Session session = null;
        System.out.println("emailid  "+emailid +"   "+" otpStatus"+otpstatus);
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened for update");
            Transaction txn = session.beginTransaction();
            Query query = session.createQuery("update DepartmentUser set otp_alertStatus=:otpstatus where emailAdd=:emailid ");
            query.setParameter("otpstatus", otpstatus);
            query.setParameter("emailid", emailid);
            query.executeUpdate();
            txn.commit();
            System.out.println(" update document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
            System.out.println("session is closed in update");
        }
       
   
   return null;
    }

    @Override
    public List fetchAllByDept_Id(Integer deptId) {
     System.out.println("-----------------Method called to fetchAllByDept_Id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     List<DepartmentUser> departmentUsers = new ArrayList<>();
     try{
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where deptId=:deptId");
          query.setParameter("deptId", deptId);
         departmentUsers = query.list();
         System.out.println("The Depratment User List is: "+departmentUsers.size());
     }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
       System.out.println("-----------------Method end to fetchAllByDept_Id DepartmentUser in DepartmentUserDaoImpl----------------------------");
     return departmentUsers;  
    } 
      @Override
    public boolean checkDuplicateContect(String mobile) {
     System.out.println("-----------------Method called to checkDuplicateContect in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     boolean mobileStatus=false;
     DepartmentUser deptUser=new DepartmentUser();
     Contractor contractor=new Contractor();
     DepartmentSecondaryUser deptSecondUser=new DepartmentSecondaryUser();
    
     try{
            session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where mobNo=:mobNo");
          query.setParameter("mobNo", mobile);
//          query.setParameter("deptId", deptId);
          deptUser=(DepartmentUser) query.uniqueResult();
           
          if(deptUser == null){
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
          query = session.createQuery("FROM Contractor where mobileno=:mobileno");
          query.setParameter("mobileno", mobile);
          contractor= (Contractor) query.uniqueResult();
        
          } if(contractor==null){
//              System.out.println(" contractor "+contractor.getEmailid());  
           query = session.createQuery("FROM DepartmentSecondaryUser where mobNo=:mobNo");
          query.setParameter("mobNo", mobile);
//            query.setParameter("deptId", deptId);
          deptSecondUser=  (DepartmentSecondaryUser) query.uniqueResult();
         
           } if(deptSecondUser==null){
//                System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
          
          }
           if(deptUser != null){
               System.out.println(" deptUser "+deptUser.getEmailAdd()+"    "+deptUser.getMobNo());
                mobileStatus=true;
           }
          if(contractor!=null){
               System.out.println(" contractor "+contractor.getEmailid()+"    "+contractor.getMobileno());
                mobileStatus=true;
          }
          if(deptSecondUser!=null){
               System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd()+"        "+deptSecondUser.getMobNo());
                mobileStatus=true;
          }
          }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
   return mobileStatus;
   }

    @Override
    public boolean checkDuplicateEmail(String email) {
   System.out.println("-----------------Method called to checkDuplicateEmail in DepartmentUserDaoImpl----------------------------");
     Session session = null;
     boolean emailStatus=false;
     DepartmentUser deptUser=new DepartmentUser();
     Contractor contractor=new Contractor();
     DepartmentSecondaryUser deptSecondUser=new DepartmentSecondaryUser();
    
     try{
//         System.out.println("hiiiii "+deptId);
         session = sessionFactory.openSession();
         Query query = session.createQuery("FROM DepartmentUser where emailAdd=:email");
          query.setParameter("email", email);
//          query.setParameter("deptId", deptId);
          deptUser=(DepartmentUser) query.uniqueResult();
           
          if(deptUser == null){
//                System.out.println(" deptUser "+deptUser.getEmailAdd());
          query = session.createQuery("FROM Contractor where emailid=:emailid");
          query.setParameter("emailid", email);
          contractor= (Contractor) query.uniqueResult();
              //System.out.println("contractor~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!!!  "+contractor.getFirstname() +contractor.getEmailid());
        
          } if(contractor==null){
//              System.out.println(" contractor "+contractor.getEmailid());  
           query = session.createQuery("FROM DepartmentSecondaryUser where emailAdd=:email");
          query.setParameter("email", email);
//            query.setParameter("deptId", deptId);
          deptSecondUser=  (DepartmentSecondaryUser) query.uniqueResult();
         
           } if(deptSecondUser==null){
//                System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
          
          }
           if(deptUser != null){
               System.out.println(" deptUser "+deptUser.getEmailAdd());
                emailStatus=true;
           }
          if(contractor!=null){
               System.out.println(" contractor "+contractor.getEmailid());
                emailStatus=true;
          }
          if(deptSecondUser!=null){
               System.out.println(" deptSecondUser "+deptSecondUser.getEmailAdd());
                emailStatus=true;
            }
          }catch(Exception ex){
         System.out.println("Class: DepartmentUserDaoImpl\n Method:fetchAllByDept_Id");
         ex.printStackTrace();
     }finally{
         if(session != null){
             session.close();
         }
     }
    return emailStatus;
    }

    /*
   * userOfTenderApproval
   * Method call to fetch Officer on the privileges give as Tender Release And Amendment having Enable     * status
   * created 10 Oct 2018
   * 
   */
    @Override
     public List userOfTenderApproval(int deptId, String status){
        System.out.println("-----------------Method called to statusValue DepartmentUser in DepartmentUserDaoImpl----------------------------");
      Session session = null;
      Transaction txn = null;
      List <DepartmentUser> userOfTenderApproval=new ArrayList<>();
       try{
           session = sessionFactory.openSession();
            System.out.println("session is opened Department Id: "+deptId);
            txn = session.beginTransaction();
            Query query=session.createQuery("from DepartmentUser where deptId=:deptId AND status=:status AND userPrivileges like '%,5,%' or userPrivileges like '5' or userPrivileges like '5,%' or userPrivileges like '%,5'");
            query.setParameter("deptId", deptId);
            query.setParameter("status", status);
            userOfTenderApproval= query.list();
           // txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (txn != null) {
                txn.commit();
            }
            if (session != null) {
                session.close();
            }
        }
   return userOfTenderApproval;
   }
     
     @Override
    public DepartmentUser fetchData(int deptId, int deptUserId) {
       System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
        System.out.println(" deptId is  "+ deptId+ " deptUserId  is "+deptUserId);
       Session session = null;
       DepartmentUser departmentUser = null;
       DepartmentUser departmentUser1 = null;
     
       try{
           session = sessionFactory.openSession();
           
//           SELECT E.tenderNumber FROM Tender E
           Query query = session.createQuery("FROM DepartmentUser WHERE reg_Id =:reg_Id and deptId=:deptId");
           query.setParameter("deptId", deptId);
           query.setParameter("reg_Id", deptUserId);
           departmentUser = (DepartmentUser)query.uniqueResult();
           departmentUser.setDeptUserFullName(departmentUser.getFirstName()+" "+departmentUser.getLastName());
           System.out.println(" deprtUser Full Name "+departmentUser.getFirstName()+" "+departmentUser.getLastName());
          System.out.println("DepartMent user Details  "+ departmentUser);
           designation=(Designation) designationDao.fetchData(departmentUser.getDesignationName());
           
           circle=(Circle) circleDAO.fetchData(departmentUser.getDeptcircle());
           
           division =(Division) divisionDAO.fetchData(departmentUser.getDeptDivision());
           subDivision =(SubDivision) subDivisionDAO.fetchData(departmentUser.getDeptSubDivision());
            departmentUser.setPassword("");
          // departmentUser.setSecretKey(null);
           departmentUser.setDesignations(designation.getDesignation());
           departmentUser.setCircle(circle.getCircle());
           departmentUser.setDivision(division.getDivision());
           departmentUser.setSubDivision(subDivision.getSubdivision());
       }catch(Exception ex){
              System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchData");
           ex.printStackTrace();
       }finally{
           if(session != null){
               session.close();
           }
       }
        System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
       return departmentUser;
    
    
    
    
    
    }
    
    
    public String getPrivileges(int red_Id, int deptId) {
      Session session = null;
        String privileges = "";
        Query query = null;
        DepartmentUser departmentUser = null;
        try {
            session = sessionFactory.openSession();
            System.out.println("session is opened Department Id: " + deptId);
            Transaction txn = session.beginTransaction();
            query = session.createQuery("from DepartmentUser where deptId=:deptId and reg_Id=:red_Id");
            query.setParameter("deptId", deptId);
            query.setParameter("red_Id", red_Id);
            departmentUser =  (DepartmentUser) query.uniqueResult();
            privileges = departmentUser.getUserPrivileges();
            txn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return privileges;
    }
    
    
      @Override
    public int changeEmail(String newEmail, String oldEmail) {
     Session session = null;
        System.out.println("oldEmail "+oldEmail);
        System.out.println("newEmail "+newEmail);
        Query query = null;
        Query query1 = null;
        int result=0;
       
        try {
            session = sessionFactory.openSession();
            
          
            query = session.createQuery("update DepartmentUser set emailAdd=:newEmail , email_verified=:email_verified where emailAdd=:oldEmail");
            query.setParameter("newEmail", newEmail);
            query.setParameter("oldEmail", oldEmail);
            query.setParameter("email_verified", "Not varified");

            
            query1 = session.createQuery("update DepartmentSecondaryUser set emailAdd=:newEmail where emailAdd=:oldEmail");
            query1.setParameter("newEmail", newEmail);
            query1.setParameter("oldEmail", oldEmail);
           
          
          
         result = query.executeUpdate();
         result = query1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }

    @Override
    public int changeContect(String newContect, String oldContect) {
      Session session = null;
        System.out.println("oldContect "+oldContect);
        System.out.println("newContect "+newContect);
        Query query = null;
        Query query1 = null;
        int result=0;
       
        try {
            session = sessionFactory.openSession();
            
          
            query = session.createQuery("update DepartmentUser set mobNo=:newContect , mobile_verified=:mobile_verified where mobNo=:oldContect");
            query.setParameter("newContect", newContect);
            query.setParameter("oldContect", oldContect);
            query.setParameter("mobile_verified", "Not varified");

            
            query1 = session.createQuery("update DepartmentSecondaryUser set mobNo=:newContect where mobNo=:oldContect");
            query1.setParameter("newContect", newContect);
            query1.setParameter("oldContect", oldContect);
           
          
          
         result = query.executeUpdate();
         result = query1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }
    
    @Override
    public DepartmentUser fetchData(String userExists) {
        System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
        System.out.println(" userExists " + userExists);
        Session session = null;
        DepartmentUser departmentUser = null;

        try {
            session = sessionFactory.openSession();

//           SELECT E.tenderNumber FROM Tender E
            Query query = session.createQuery("FROM DepartmentUser where mobNo=:userExists or emailAdd=:userExists");
            query.setParameter("userExists", userExists);

            departmentUser = (DepartmentUser) query.uniqueResult();

        } catch (Exception ex) {
            System.out.println("Class: DepartmentUserDaoImpl \n Method:fetchData");
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method called to fetchData DepartmentUser in DepartmentUserDaoImpl----------------------------");
        return departmentUser;

    }
    }

    
    
