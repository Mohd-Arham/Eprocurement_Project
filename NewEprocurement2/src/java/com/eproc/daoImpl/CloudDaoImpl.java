/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;



import com.eproc.dao.CloudDao;
import com.eproc.domain.CloudFile;
import com.eproc.domain.CloudFolder;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author hp
 */
@Repository
public class CloudDaoImpl implements CloudDao {
@Autowired
        SessionFactory sessionFactory;
        CloudFolder cloudFolder; 
  
    @Override
    public String saveFolder(CloudFolder cloudFolder) 
    {
        System.out.println("*******************Save Cloud Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        session.saveOrUpdate(cloudFolder);
             System.out.println("*******************Save Inventry****************************************");
        session.close();
        System.out.println("*******************END****************************************");
        return null;
    }

    @Override
    public List<CloudFolder> fetchAll() {
         System.out.println("*******************List in Dropdown category Data In DAOIMP****************************************");
        List<CloudFolder> categoryList = new ArrayList<CloudFolder>();
        Session session = sessionFactory.openSession();
        categoryList = session.createQuery("FROM CloudFolder").list();
        System.out.println("");
        session.close();
        System.out.println("*******************END****************************************");
        return categoryList;
    }
       
 @Override
    public void save(CloudFile cloudFile) {
        Session session=null;
    try
       {
            session = sessionFactory.openSession();
            System.out.println("session is opened");
            session.save(cloudFile);
            System.out.println("Save uploadSor document");
        
           }catch(Exception e){
              e.printStackTrace();
          }
         finally{  
                 if(session!=null)
                 session.close();
                 System.out.println("session is closed");
             }
          }

    @Override
    public List<CloudFile> fetchAlls() {
         Session session=null;
             List<CloudFile> SorList = new ArrayList<CloudFile>();
    try
       {
        session = sessionFactory.openSession();
        System.out.println("session is opened");
       
      
       SorList = session.createQuery("from CloudFile").list();
        
           System.out.println("sowlistdata" +SorList);
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
    //***************************Edit data******************************************
     @Override
    public List<CloudFile> getEmpById(int cloudFolderId) 
    {
        System.out.println("*******************EDIT Inventry Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
       
        Query query = session.createQuery("from CloudFile where cloudFolderId =:cloudFolderId");//here persistent class name is Inventry  
        
        query.setParameter("cloudFolderId", cloudFolderId);
         
        List<CloudFile> cloudFile =  query.list();
        
         System.out.println("my dddd"+cloudFile.size());
        //System.out.println("mydatafolder    ::::" +cloudFile.getCloudFolderId());
       
        session.close();
        
        System.out.println("*******************END****************************************");
        return cloudFile;
    }
    
     @Override
    public boolean updateCloudFile(CloudFile cloudFile) 
    {
        Session session = null;
        System.out.println("updateData is from DepartmentCircleDaoImpl called ");
        try {

            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(cloudFile);
            System.out.println("Updated value is :" + cloudFile.getFileSize());
            txn.commit();
        } catch (Exception ex) {
            System.out.print("Exception in update  " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return true;

    }  

//    @Override
//     public void updateNumberOfFileInCloudFolder(int cloudFolderId) {
//      Session session = null;
//      Query query = null;
//      try {
//         session = sessionFactory.openSession();
//         Transaction txn = session.beginTransaction();
//         query = session.createQuery("SELECT count(fileId) FROM CloudFile WHERE cloudFolderId =:cloudFolderId");
//         query.setParameter("cloudFolderId", cloudFolderId);
//         Object object = query.uniqueResult();
//         Long count = (Long) object;
//
//         query = session.createQuery("UPDATE CloudFolder SET numberOfFile =:countfile WHERE cloudFolderId =:cloudFolderId");
//         query.setParameter("countfile", count + "");
//         query.setParameter("cloudFolderId", cloudFolderId);
//         query.executeUpdate();
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if (session != null) {
//            session.close();
//         }
//      }
//   }   

    @Override
    public boolean updateCloudFolder(CloudFolder cloudFolder) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
@Override
    public String fetchFolderSize(int cloudFolderId) {
      String folderSize = "0 Byte";
      Session session = null;
      try {
          
         session = sessionFactory.openSession();
         System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
         Query query = session.createQuery("SELECT sum(fileSize) FROM CloudFile WHERE cloudFolderId =15");
         query.setParameter("id", cloudFolderId);
         String sum = (String) query.uniqueResult();
          System.out.println("The sum is: "+sum);
        //System.out.println("Byte size is : " + size);

         System.out.println("Folder size is : " + folderSize);

      } catch (Exception ex) {
         ex.getMessage();
      } finally {
         if (session != null) {
            session.close();
         }
      }
      return folderSize;
   }

      /*
     *  This DAOIMPL Method cloudFolderList
     *  @author Prashant Shukla
     *  @Since 14-08-2018
     *  @Version 2.0.0
     */
    @Override
    public List<CloudFolder> cloudFolderList() {
        System.out.println("*******************Show List CloudFolder Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from CloudFolder");  
        List list = query.list();
        System.out.println("*******************END****************************************");
        return list;
    }
    
    public List<CloudFile> cloudFileDaoImpldata(Integer cloudFolderId) {
        List<CloudFile> cloudFilePojoList = null;
        try {
            System.out.println("*******************Fetch cloudFileFetchIdLiist Data In DAOIMP****************************************");
            Session session = sessionFactory.openSession();
            System.out.println("my id data is dao" + cloudFolderId);
            Query query = session.createQuery("from CloudFile where cloudFolderId =:cloudFolderId");//here persistent class name is Inventry  
            query.setParameter("cloudFolderId", cloudFolderId);
            cloudFilePojoList = query.list();
            // System.out.println("gdugghadgdgd" +dynamicTemplatePojoList);
            //session.close();
            System.out.println("*******************END****************************************" + cloudFilePojoList.size());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gdgdf" + e);
        }
        return cloudFilePojoList;
    }
    
//@Override
//   public String converByte_To_KB_MB(String bytes) throws Exception{
//      String folderSize = "0 Byte";
//      Double size = Double.parseDouble(bytes);
//      if (size != null) {
//         if (size >= 1048576) {
//            size = size / 1048576;
//            System.out.println("without format size : "+size);
//            DecimalFormat form = new DecimalFormat("0.00");
//            folderSize = form.format(size) + " MB";
//         } else if (size == 0) {
//            folderSize = 0 + " KB";
//         } else {
//            size = size / 1024;
//            DecimalFormat form = new DecimalFormat("0.00");
//            folderSize = form.format(size) + " KB";
//         }
//      }
//      System.out.println("Folder size is : " + folderSize);
//      return folderSize;
//   }
    }


    

    
    
    
        


           

   
            

