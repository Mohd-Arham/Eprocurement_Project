package com.eproc.dao;

import com.eproc.domain.QCBSTemplate;
import com.eproc.domain.QCBSTemplateDTO;
import com.google.gson.Gson;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Repository
public class QCBSTemplateDao {

   
    @Autowired
    SessionFactory sessionFactory;
    
   //Method for save or update newly created dynamic template
   public  String save(QCBSTemplate template) {
       System.out.println("Enerd into Dao  " + template);
    Session session = sessionFactory.openSession();
     String status = null;
     QCBSTemplate qCBSTemplate = new QCBSTemplate();
       System.out.println("Data in QCBSTemplate "+qCBSTemplate.getDeptId());
      try {
          System.out.println("User id is :"+qCBSTemplate.getUserId());
         if (qCBSTemplate.getUserId() != null) {
            template.setDeptId(qCBSTemplate.getDeptId());
             System.out.println("Dept id is : "+template);
            template.setUserId(qCBSTemplate.getUserId());
         }
         
         if (template.getTemplate() != null) {
             Transaction txn = session.beginTransaction();
            session.saveOrUpdate(template);
             System.out.println("Template Id: "+template.getTemplateId());
             txn.commit();
            status = "success";
            System.out.println("Template Save Successfull");
         }

      } catch (Exception ex) {
         ex.printStackTrace();
         status = "failure";
      } 
//      finally {
//         if (session != null) {
//            session.close();
//         }
//      }
      return status;
   }
   
   //For fetching qcbs template by tenderId for specific tender
   public QCBSTemplate fetchQCBSTemplateByTenderId(String tenderId) {
      QCBSTemplate template = new QCBSTemplate();
      Session session = sessionFactory.openSession();
      try {
         Query query = session.createQuery("FROM QCBSTemplate WHERE tenderId =:tenderId");
         query.setParameter("tenderId", tenderId);
           System.out.println("query param set success");
         template = (QCBSTemplate) query.uniqueResult();
//           System.out.println("query uniqueResult success "+template.getTemplate());

      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (session != null) {
            session.close();
         }
      }
      return template;
   }
   
   
   public List<QCBSTemplate> fetchQCBSTemplateNamesList(Integer templateId){
       List<QCBSTemplate> cBSTemplates = new ArrayList<>();
       Session session = null;
       try{
          session = sessionFactory.openSession();
          Query query = session.createQuery("FROM QCBSTemplate WHERE templateId =:templateId");
          cBSTemplates = query.setParameter("templateId", templateId).list();
          
          System.out.println("The List Size is: "+cBSTemplates.size());
          
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return cBSTemplates;
   }
   
    //For fetching qcbs template by tenderId for specific tender
   public QCBSTemplate fetchQCBSTemplateByTemplateId(Integer templateId) {
      QCBSTemplate template = new QCBSTemplate();
      Session session = sessionFactory.openSession();
      try {
         Query query = session.createQuery("FROM QCBSTemplate WHERE templateId =:templateId");
         query.setParameter("templateId", templateId);
           System.out.println("query param set success Template");
         template = (QCBSTemplate) query.uniqueResult();
     //System.out.println("query uniqueResult success "+template.getTemplate());
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (session != null) {
            session.close();
         }
      }
      return template;
   }
   
    public QCBSTemplate fetchQCBSTemplateByContId(Integer contId) {
      QCBSTemplate template = new QCBSTemplate();
      Session session = sessionFactory.openSession();
      try {
         Query query = session.createQuery("FROM QcbsData WHERE contractorId =:contId");
         query.setParameter("contractorId", contId);
           System.out.println("query param set success Template");
         template = (QCBSTemplate) query.uniqueResult();
     //System.out.println("query uniqueResult success "+template.getTemplate());
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         if (session != null) {
            session.close();
         }
      }
      return template;
   }
   
   
   
    public List fetchAll() {
        System.out.println("**************QCBSTemplateDao's fetchAll method run**************");
        Session session = null;
        List<QCBSTemplate> qcbslist = new ArrayList<>();
        try {
            session = sessionFactory.openSession();
            qcbslist = session.createQuery("from QCBSTemplate").list();
            for (Iterator<QCBSTemplate> iterator = qcbslist.iterator(); iterator.hasNext();) {
                QCBSTemplate next = iterator.next();
                System.out.println("KKKKKK @@@@@@ %%%%%%%%    "+next.getTemplate());
                 
            }
        } catch (Exception ex) {
            System.out.println("Class: QCBSTemplateDao \n Method:fetchAll");
            System.out.println("Exception in fetchAll method of QCBSTemplateDao" + ex.getMessage());
        } 
        System.out.println("*******************END fetchAll method of QCBSTemplateDao****************************************"+qcbslist);
        return qcbslist;
    }
   
   //Method for view dynamic template, and render it by model data(request scope data)
   

//   //Take json string and parse it. After parsing it convert list of criteria of template
//   public static List<QCBSTemplateDTO> prepareQCBSTemplateData(String jsonData) {
//      List<QCBSTemplateDTO> templateList = new ArrayList<QCBSTemplateDTO>();
//      try {
//         JSONArray jsonArray = new JSONArray(jsonData);
//         System.out.println("Json array size : " + jsonArray.length());
//         for (int i = 0; i < jsonArray.length(); i++) {
//            QCBSTemplateDTO temp = new QCBSTemplateDTO();
//            Map map = new LinkedHashMap();
//            JSONObject object = jsonArray.getJSONObject(i);
//            temp.setQuestion(object.getString("question"));
//
//            JSONArray jsonmark = object.getJSONArray("mark");
//            List<String> markList = new ArrayList<String>();
//            for (int k = 0; k < jsonmark.length(); k++) {
//               markList.add(jsonmark.getString(k));
//            }
//
//            JSONArray jsonparameter = object.getJSONArray("parameter");
//            List<String> parameterList = new ArrayList<String>();
//            for (int k = 0; k < jsonparameter.length(); k++) {
//               parameterList.add(jsonparameter.getString(k));
//            }
//
//            for (int j = 0; j < markList.size(); j++) {
//               map.put(Integer.parseInt(markList.get(j)), parameterList.get(j));
//            }
//            System.out.println("map for question" + (i + 1) + " : " + map);
//            temp.setCriteria(map);
//            templateList.add(temp);
//            System.out.println("temp : " + temp);
//         }  // end of outer loop
//
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      return templateList;
//   }
//   
//
//   //Upload file by contractor for criteria
   public static String uploadQCBSFile(String file, File qcbsDoc, String previousQCBSFile) {
      System.out.println("File upload Process Start");
      String fileJson = null;
      try {
          ServletRequestAttributes attr = (ServletRequestAttributes)
          RequestContextHolder.currentRequestAttributes();
          HttpServletRequest request = attr.getRequest();
          
//         HttpServletRequest request = ServletActionContext.getRequest();
         String filePath = request.getRealPath("/qcbsDocs");
         String convertedFileName = file.substring(0, file.lastIndexOf(".")) + fetchRandomNo()
                 + file.substring(file.lastIndexOf("."));
         System.out.println("File Path : " + filePath + "/" + convertedFileName);

         removeQcbsFile(filePath, previousQCBSFile);   // For remove previous file, If file already exist for this criteria
         File destFile = new File(filePath, convertedFileName);
         FileUtils.copyFile(qcbsDoc, destFile);

         String contextPath = request.getContextPath() + "/qcbsDocs/" + convertedFileName;
         String[] fileInfo = {"File Saved Successfully", contextPath, file};

         fileJson = new Gson().toJson(fileInfo);
//         PrintWriter out = ServletActionContext.getResponse().getWriter();
//         out.print(fileJson);
//         out.close();
         System.out.println("File Uploaded Successfully, Return Data is : " + fileJson);

      } catch (Exception ex) {
         ex.printStackTrace();
      }
      return fileJson;
   }
//
//   //Remove file of criteria, If file already exist
   public static void removeQcbsFile(String filePath, String previousQCBSFile) {
      try {
         if (previousQCBSFile != null && !"".equals(previousQCBSFile)) {
            String fileName = previousQCBSFile.substring(previousQCBSFile.lastIndexOf("/") + 1);
            System.out.println("file name for remove : " + fileName);
            File file = new File(filePath, fileName);
            boolean status = file.delete();
            System.out.println("Previous File Delete Status is : " + status);
         } else {
            System.out.println("Previous File Not Found, May it's First File");
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }
//   
//   //For fetching qcbs template by tenderId and contractorId for update qcbs template parameter
//   public static QCBSTemplate fetchQCBSTemplateByTenderIdAndContrId(String tenderId, String contrId) {
//      QCBSTemplate template = new QCBSTemplate();
//      Session session = null;
//      try {
//         session = HibernateUtil.getSessionFactory().openSession();
//         Query query = session.createQuery("FROM QCBSTemplate WHERE tenderId =:tenderId AND contractorId :=contrId");
//         query.setParameter("tenderId", tenderId);
//         query.setParameter("contrId", contrId);
//         template = (QCBSTemplate) query.uniqueResult();
//         System.out.println("template is : " + template);
//
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         if(session != null){
//            session.close();
//         }
//      }
//      return template;
//   }
//
//   //For generate randomNo For file
   public static String fetchRandomNo() {
      String str = "0123XYZ456789ABC";
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < 8; i++) {
         sb.append(str.charAt(new Random().nextInt(str.length())));
      }
      int second = new Date().getSeconds();
      sb.append(second + "");
      return sb.toString();
   }
//   //For fetching qcbs template by tenderId and contractorId for update qcbs template parameter
//  public static void deleteQcbsTemplate(String tenderId) {
//     Session session = null;
//     try {
//        session = HibernateUtil.getSessionFactory().openSession();
//        Transaction txn = session.beginTransaction();
//        Query query = session.createQuery("DELETE FROM QCBSTemplate WHERE tenderId =:tenderId");
//        query.setParameter("tenderId", tenderId);
//        int i = query.executeUpdate();
//        txn.commit();
//        System.out.println("qcb template delete status is : " + i);
//
//     } catch (Exception ex) {
//        ex.printStackTrace();
//     } finally {
//        if (session != null) {
//           session.close();
//        }
//     }
//  }
    
     //Take json string and parse it. After parsing it convert list of criteria of template
   public List<QCBSTemplateDTO> prepareQCBSTemplateData(String jsonData) {
     List<QCBSTemplateDTO> templateList = new ArrayList<>();    
      try {
         System.out.println("Insaid PrepareQCBSTemplateData method    "+templateList);
         JSONArray jsonArray = new JSONArray(jsonData);
         System.out.println("Json array size : " + jsonArray.length());
         for (int i = 0; i < jsonArray.length(); i++) {
            QCBSTemplateDTO temp = new QCBSTemplateDTO();
            Map map = new LinkedHashMap();
            List<QCBSTemplateDTO> templateList2 = new ArrayList<>();
            JSONObject object = jsonArray.getJSONObject(i);
            temp.setQuestion(object.getString("question"));

            JSONArray jsonmark = object.getJSONArray("mark");
            List<String> markList = new ArrayList<>();
            for (int k = 0; k < jsonmark.length(); k++) {
               markList.add(jsonmark.getString(k));
                System.out.println("The JSON Marks: "+jsonmark.getString(k));
               temp.setContrMark(jsonmark.getString(k));
            }
//
            JSONArray jsonparameter = object.getJSONArray("parameter");
            List<String> parameterList = new ArrayList<>();
            for (int k = 0; k < jsonparameter.length(); k++) {
               parameterList.add(jsonparameter.getString(k));
               System.out.println("The JSON parameter: "+jsonparameter.getString(k));
               temp.setRemark(jsonparameter.getString(k));
            }
            
            JSONArray jsonstrUser = object.getJSONArray("strUser");
            List<String> strUserList = new ArrayList<>();
             System.out.println("jsonstrUser   "+jsonstrUser);
             for (int k = 0; k < jsonstrUser.length(); k++) {
               strUserList.add(jsonstrUser.getString(k));
                temp.setStrUser(jsonstrUser.getString(k));
            }
            //temp.setFileOrtext(jsonstrUser.getString(0));
            
            for (int j = 0; j < markList.size(); j++) {
               map.put(Integer.parseInt(markList.get(j)), parameterList.get(j));
             
            }
            
//            JSONArray jsonmark = object.getJSONArray("mark");
//            //List<String> markList = new ArrayList<>();
//            JSONArray jsonparameter = object.getJSONArray("parameter");
//            //List<String> parameterList = new ArrayList<>();
//            JSONArray jsonstrUser = object.getJSONArray("strUser");
            //List<String> strUserList = new ArrayList<>();            
            for (int k = 0; k < jsonmark.length(); k++) {
                  QCBSTemplateDTO temp1 = new QCBSTemplateDTO();
                   //markList.add(jsonmark.getString(k));
                   System.out.println("The JSON Marks: "+jsonmark.getString(k));
                   temp1.setContrMark(jsonmark.getString(k));
                   //parameterList.add(jsonparameter.getString(k));
                   System.out.println("The JSON parameter: "+jsonparameter.getString(k));
                   temp1.setText(jsonparameter.getString(k));
                   //strUserList.add(jsonstrUser.getString(k));
                   temp1.setStrUser(jsonstrUser.getString(k));
                   System.out.println("SET SRTUSERT IS:::::   "+jsonstrUser.getString(k));
                 templateList2.add(temp1);
             System.out.println(temp1.getText()+"   "+temp1.getContrMark()); 
            }
             
            temp.setCriteriaNewQCBS(templateList2);
            System.out.println("map for question" + (i + 1) + " : " + templateList2.size());
            temp.setCriteria(map);
            //templateList2.add(temp);
            templateList.add(temp);
            
            System.out.println("temp : " + temp);
         }  // end of outer loop

      } catch (Exception e) {
         e.printStackTrace();
      }
      return templateList;
   }
   
    //prepare list of dynamic template, After parsing json data
   public  List<QCBSTemplateDTO> prepareQCBSMarkTemplateData_withoutDeptAction(String jsonData) {
      List<QCBSTemplateDTO> templateList = new ArrayList<QCBSTemplateDTO>();
      String text=null;
      try {
         JSONArray jsonArray = new JSONArray(jsonData);
         System.out.println("Json array size is : " + jsonArray.length());
         for (int i = 0; i < jsonArray.length(); i++) {
            QCBSTemplateDTO temp = new QCBSTemplateDTO();
            Map map = new LinkedHashMap();
            Map mapText = new LinkedHashMap();
            
            JSONObject object = jsonArray.getJSONObject(i);
             System.out.println("J son Object Is :::  "+object);
            temp.setQuestion(object.getString("question"));
            
             if(object.has("filePath")){
             System.out.println("File Path is:::::   "+object.getString("filePath"));
            temp.setFilePath(object.getString("filePath"));
            }
             
            if(object.has("fileName")){
            System.out.println("File Name is:::::   "+object.getString("fileName"));
            temp.setFileName(object.getString("fileName"));
            }
            
             System.out.println("Test Text : "+object.get("text"));
             Object obj11 = object.get("text");
             if(!(obj11.toString().equalsIgnoreCase("[]"))){
            System.out.println("Text Is:---   "+object.get("text"));
            temp.setText(object.get("text")+"");
             }
            
             if(object.has("contrMark")){
            temp.setContrMark(object.getString("contrMark"));
             }
            
            System.out.println("File : " + temp.getFileName() + " & filePath : " + temp.getFilePath());

            JSONArray jsonmark = object.getJSONArray("mark");
            List<String> markList = new ArrayList<String>();
            for (int k = 0; k < jsonmark.length(); k++) {
               markList.add(jsonmark.getString(k));
                System.out.println("MMMMMMMMMMMMMMMMMMMMMMM"+markList);
            }

            JSONArray jsonparameter = object.getJSONArray("parameter");
            List<String> parameterList = new ArrayList<String>();
            for (int k = 0; k < jsonparameter.length(); k++) {
               parameterList.add(jsonparameter.getString(k));
            }

            for (int j = 0; j < markList.size(); j++) {
               map.put(Integer.parseInt(markList.get(j)), parameterList.get(j));
            }
            JSONArray jsonStrUser = object.getJSONArray("strUser");
             System.out.println("STRUSER IS  "+object.getJSONArray("strUser"));
            List<String> strUserList = new ArrayList<>();
            for (int k = 0; k < jsonStrUser.length(); k++) {
               strUserList.add(jsonStrUser.getString(k));
            }
            for (int j = 0; j < markList.size(); j++) {
               mapText.put(Integer.parseInt(markList.get(j)), strUserList.get(j));
            }
            System.out.println("map for " + (i + 1) + " : " + map);
            temp.setCriteria(map);
            temp.setCriteriaStrUser(mapText);
            templateList.add(temp);
            System.out.println("temp : " + temp);
         }  // end of outer loop

      } catch (Exception e) {
         e.printStackTrace();
      }
      return templateList;
   }
   
    public List<QCBSTemplateDTO> prepareQCBSTemplateData2(String jsonData) {
     List<QCBSTemplateDTO> templateList = new ArrayList<>();    
     String text=null;
	 try {
         System.out.println("Insaid PrepareQCBSTemplateData method    "+templateList);
         JSONArray jsonArray = new JSONArray(jsonData);
         System.out.println("Json array size : " + jsonArray.length());
         for (int i = 0; i < jsonArray.length(); i++) {
            QCBSTemplateDTO temp = new QCBSTemplateDTO();
            Map map = new LinkedHashMap();
            Map mapText = new LinkedHashMap();
            List<QCBSTemplateDTO> templateList2 = new ArrayList<>();
            JSONObject object = jsonArray.getJSONObject(i);
            temp.setQuestion(object.getString("question"));
			
            if(object.has("filePath")){
             System.out.println("File Path is:::::   "+object.getString("filePath"));
            temp.setFilePath(object.getString("filePath"));
            }
			
            if(object.has("fileName")){
            System.out.println("File Name is:::::   "+object.getString("fileName"));
            temp.setFileName(object.getString("fileName"));
            }
            
            System.out.println("Test Text : "+object.get("text"));
             Object obj11 = object.get("text");
             if(!(obj11.toString().equalsIgnoreCase("[]"))){
            System.out.println("Text Is:---   "+object.get("text"));
            temp.setInputFiled(object.get("text")+"");
             }
			 
            if(object.has("contrMark")){
            temp.setContrMark(object.getString("contrMark"));
             }
            
            JSONArray selected = object.getJSONArray("selected");
            List<String> selected1 = new ArrayList<>();
            for (int k = 0; k < selected.length(); k++) {
               selected1.add(selected.getString(k));
                System.out.println("The JSON Selected is  : "+selected.getString(k));
               temp.setSelected(selected.getString(k));
            }
            
            System.out.println("File : " + temp.getFileName() + " & filePath : " + temp.getFilePath());

            JSONArray jsonmark = object.getJSONArray("mark");
            List<String> markList = new ArrayList<>();
            for (int k = 0; k < jsonmark.length(); k++) {
               markList.add(jsonmark.getString(k));
                System.out.println("The JSON Marks: "+jsonmark.getString(k));
               temp.setContrMark(jsonmark.getString(k));
            }
//
            JSONArray jsonparameter = object.getJSONArray("parameter");
            List<String> parameterList = new ArrayList<>();
            for (int k = 0; k < jsonparameter.length(); k++) {
               parameterList.add(jsonparameter.getString(k));
               System.out.println("The JSON parameter: "+jsonmark.getString(k));
               temp.setText(jsonparameter.getString(k));
            }
            
            JSONArray jsonstrUser = object.getJSONArray("strUser");
            List<String> strUserList = new ArrayList<>();
             System.out.println("jsonstrUser   "+jsonstrUser);
             for (int k = 0; k < jsonstrUser.length(); k++) {
               strUserList.add(jsonstrUser.getString(k));
                temp.setStrUser(jsonstrUser.getString(k));
            }
            //temp.setFileOrtext(jsonstrUser.getString(0));
            
            for (int j = 0; j < markList.size(); j++) {
               map.put(Integer.parseInt(markList.get(j)), parameterList.get(j));
             
            }
            
//            JSONArray jsonmark = object.getJSONArray("mark");
//            //List<String> markList = new ArrayList<>();
//            JSONArray jsonparameter = object.getJSONArray("parameter");
//            //List<String> parameterList = new ArrayList<>();
//            JSONArray jsonstrUser = object.getJSONArray("strUser");
            //List<String> strUserList = new ArrayList<>();            
            for (int k = 0; k < jsonmark.length(); k++) {
                  QCBSTemplateDTO temp1 = new QCBSTemplateDTO();
                   //markList.add(jsonmark.getString(k));
                   System.out.println("The JSON Marks: "+jsonmark.getString(k));
                   temp1.setContrMark(jsonmark.getString(k));
                   //parameterList.add(jsonparameter.getString(k));
                   System.out.println("The JSON parameter: "+jsonparameter.getString(k));
                   temp1.setText(jsonparameter.getString(k));
                   //strUserList.add(jsonstrUser.getString(k));
                   temp1.setStrUser(jsonstrUser.getString(k));
                   System.out.println("SET SRTUSERT IS:::::   "+jsonstrUser.getString(k));
//                   temp1.setSelected(selected.getString(k));
//                   System.out.println("SET SELECTED IS:::::   "+selected.getString(k));
                 templateList2.add(temp1);
             System.out.println(temp1.getText()+"   "+temp1.getContrMark()); 
            }
             
            temp.setCriteriaNewQCBS(templateList2);
            System.out.println("map for question" + (i + 1) + " : " + templateList2.size());
            temp.setCriteria(map);
            temp.setCriteriaStrUser(mapText);
            //templateList2.add(temp);
            templateList.add(temp);
            
            System.out.println("temp : " + temp);
         }  // end of outer loop

      } catch (Exception e) {
         e.printStackTrace();
      }
      return templateList;
   }
   
   
   public List<QCBSTemplate> fetchQCBSTemplateNamesAndId(String deptId){
       List<QCBSTemplate> cBSTemplates = new ArrayList<>();
       Session session = null;
       try{
          session = sessionFactory.openSession();
          Query query = session.createQuery("FROM QCBSTemplate WHERE deptId =:deptId");
          cBSTemplates = query.setParameter("deptId", deptId).list();
          System.out.println("The List Size is: "+cBSTemplates.size());
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return cBSTemplates;
   }
   
   
   
   
   
   
   
   
}
