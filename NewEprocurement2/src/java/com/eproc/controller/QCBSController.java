package com.eproc.controller;

import com.eproc.dao.QCBSTemplateDao;
import static com.eproc.dao.QCBSTemplateDao.fetchRandomNo;
import com.eproc.dao.TenderDao;
import com.eproc.dao.TenderSubmittedQCBSDao;
import com.eproc.domain.QCBSMarkTemplate;
import com.eproc.domain.QCBSTemplate;
import com.eproc.domain.QCBSTemplateDTO;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderSubmittedQCBS;
import com.google.gson.Gson;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class QCBSController {

    @Autowired
    TenderDao tenderDao;
    @Autowired
    QCBSTemplateDao qcbsTemplateDao;
    @Autowired
    TenderSubmittedQCBSDao tenderSubmittedQCBSDao;
    

    private String stqcJsonData;
    QCBSTemplate template = new QCBSTemplate();
    QCBSMarkTemplate qCBSMarkTemplate = new QCBSMarkTemplate();
    List<QCBSTemplateDTO> qcbsTemplateList = new ArrayList<QCBSTemplateDTO>();
    Map<Integer, String> qcbsMap = new HashMap<Integer, String>();

    private File qcbsDoc;
    private String qcbsDocFileName;
    private String qcbsDocContentType;
    private String previousQCBSFile;
    private String qcbsTemplateId;
    private Integer qcbsTenderId;

    public List<QCBSTemplateDTO> getQcbsTemplateList() {
        return qcbsTemplateList;
    }

    public void setQcbsTemplateList(List<QCBSTemplateDTO> qcbsTemplateList) {
        this.qcbsTemplateList = qcbsTemplateList;
    }

    public String getQcbsTemplateId() {
        return qcbsTemplateId;
    }

    public void setQcbsTemplateId(String qcbsTemplateId) {
        this.qcbsTemplateId = qcbsTemplateId;
    }

    public String getPreviousQCBSFile() {
        return previousQCBSFile;
    }

    public void setPreviousQCBSFile(String previousQCBSFile) {
        this.previousQCBSFile = previousQCBSFile;
    }

    public File getQcbsDoc() {
        return qcbsDoc;
    }

    public void setQcbsDoc(File qcbsDoc) {
        this.qcbsDoc = qcbsDoc;
    }

    public String getQcbsDocFileName() {
        return qcbsDocFileName;
    }

    public void setQcbsDocFileName(String qcbsDocFileName) {
        this.qcbsDocFileName = qcbsDocFileName;
    }

    public String getQcbsDocContentType() {
        return qcbsDocContentType;
    }

    public void setQcbsDocContentType(String qcbsDocContentType) {
        this.qcbsDocContentType = qcbsDocContentType;
    }

    public String getStqcJsonData() {
        return stqcJsonData;
    }

    public void setStqcJsonData(String stqcJsonData) {
        this.stqcJsonData = stqcJsonData;
    }

    public QCBSTemplate getTemplate() {
        return template;
    }

    public void setTemplate(QCBSTemplate template) {
        this.template = template;
    }

    public List<QCBSTemplateDTO> getStqcTemplateList() {
        return qcbsTemplateList;
    }

    public void setStqcTemplateList(List<QCBSTemplateDTO> stqcTemplateList) {
        this.qcbsTemplateList = stqcTemplateList;
    }

    public Map<Integer, String> getQcbsMap() {
        return qcbsMap;
    }

    public void setQcbsMap(Map<Integer, String> qcbsMap) {
        this.qcbsMap = qcbsMap;
    }

    @RequestMapping("/SaveQCBSTemplate")
    @ResponseBody
    public String saveOrUpdateQCBSTemplate(QCBSTemplate template, @RequestParam String tenderId, @RequestParam Integer templateId, @RequestParam String templateName) {
        try {
            String status = "";
            System.out.println("The Template Name is : "+templateName);
            List<Tender> tenderList = tenderDao.readAll();
            Integer templateIdss = template.getTemplateId();
            System.out.println("TEMPLATE View  "+template);
            for (Tender tenderListData : tenderList) {
                System.out.println("before save()  " + tenderId + " After saving tender " + tenderListData.getTender_Id());
                System.out.println(Integer.parseInt(tenderId) == tenderListData.getTender_Id());
                if (Integer.parseInt(tenderId) == tenderListData.getTender_Id()) {
                    System.out.println("~~~~~ inside if of save or update " + template.getTemplateId());
                    template.setTemplateId(template.getTemplateId());
                    template.setQcbsTemplateName(templateName);
                    //If went to save tender Id remove this setter
                    template.setTenderId("0");
                    template.setDeptId("3");
                    /*-------------------------------------*/
                    status = qcbsTemplateDao.save(template);
                }
            }

            if (template.getTemplate() != null) {

                String message = "QCBS Template Saved Successfully";
                if (status.equals("success") && template.getTemplateId().toString() != null) {
                    message = "QCBS Template Updated Successfully";

                } else if (status.equals("failure")) {
                    message = "Sorry, Something went wrong";
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return template.getTemplateId().toString();
    }

    //Method for fetch qcbs template for view
    @RequestMapping("/ViewQCBSTemplate")
    @ResponseBody
    public String viewQCBSTemplate(@RequestParam String templateId) {
        try {
            template = qcbsTemplateDao.fetchQCBSTemplateByTemplateId(Integer.parseInt(templateId));
            System.out.println("template for edit is : " + template);

            if (template != null) {
                qcbsTemplateId = templateId;
                String[] stqcJsonData = {qcbsTemplateId, template.getTemplate()};
                Gson gson = new Gson();
                System.out.println("~~~~ gson.toJson(data) ~~~~~ " + gson.toJson(stqcJsonData));
                return gson.toJson(stqcJsonData);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    //Method for fetch qcbs template for view
    @RequestMapping("/ViewQCBS")
    @ResponseBody
    public String viewQCBS(@RequestParam String templateId) {
        try {
            template = qcbsTemplateDao.fetchQCBSTemplateByTemplateId(Integer.parseInt(templateId));
            System.out.println("template for edit is : " + template);

            if (template != null) {
                qcbsTemplateId = templateId;
                String[] stqcJsonData = {qcbsTemplateId, template.getTemplate()};
                Gson gson = new Gson();
                System.out.println("~~~~ gson.toJson(data) ~~~~~ " + gson.toJson(stqcJsonData));
                return gson.toJson(stqcJsonData);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/editQCBS")
    public String viewQcbsTemplate(Model m) {
        List<QCBSTemplate> qcbsTemplateList = null;
        List<QCBSTemplateDTO> dtotemplateList = new ArrayList<>();
        String template = "";
        try {
            qcbsTemplateList = qcbsTemplateDao.fetchAll();
            for (QCBSTemplate qcbsTemplateListData : qcbsTemplateList) {
                template = qcbsTemplateListData.getTemplate();
                dtotemplateList = qcbsTemplateDao.prepareQCBSTemplateData(template);
                
                dtotemplateList.forEach((fdsfd)->{
                    System.out.println("///The value: "+fdsfd.getCriteriaNewQCBS().size()+"//");
                 fdsfd.getCriteriaNewQCBS().forEach((dfsf)->{
                   System.out.println("///The value: "+dfsf.getText()+"//");
                 });
                });
                System.out.println("dtotemplateList     " + dtotemplateList);
                qcbsTemplateId = qcbsTemplateListData.getTenderId();
                qcbsTenderId = qcbsTemplateListData.getTemplateId();

            }
            m.addAttribute("dtotemplateList", dtotemplateList);
            m.addAttribute("qcbsTemplateId", qcbsTemplateId);
            m.addAttribute("qcbsTenderId", qcbsTenderId);
            System.out.println("----------Puri List--------------    " + qcbsTenderId + " " + qcbsTemplateId + qcbsTemplateList.toString());
        } catch (Exception e) {

            e.printStackTrace();
        }
        return "DepartmentUser/Tiles/QCBSMarkTemplatePlug";
    }

    //Upload file by contractor for criteria
    @RequestMapping("/UploadQcbsFileByContr")
    @ResponseBody
    public String uploadQcbsFileByContr(@RequestParam("qcbsDoc") MultipartFile file) {
        System.out.println("File upload Process Start     " + file.getOriginalFilename());
        System.out.println("fileName : " + qcbsDocFileName + " & previous file : " + previousQCBSFile);
        System.out.println("file is : " + qcbsDoc);
        String fileJson = null;
        try {
            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            HttpServletRequest request = attr.getRequest();
            String filePath = request.getRealPath("/qcbsDocs");
            String fileName = file.getOriginalFilename();
            System.out.println("File name are: " + fileName);
            String convertedFileName = fileName.substring(0, fileName.lastIndexOf(".")) + fetchRandomNo()
                    + fileName.substring(fileName.lastIndexOf("."));
            System.out.println("File Path : " + filePath + "/" + convertedFileName);

            File destFile = new File(filePath, convertedFileName);
            byte[] bytes = file.getBytes();
            try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
                    new File(filePath + File.separator + convertedFileName)))) {
                stream.write(bytes);
                stream.flush();
                stream.close();
            }

            String contextPath = request.getContextPath() + "/qcbsDocs/" + convertedFileName;
            String[] fileInfo = {"File Saved Successfully", contextPath, fileName};

            fileJson = new Gson().toJson(fileInfo);
            System.out.println("File Uploaded Successfully, Return Data is : " + fileJson);
            System.out.println("File Uploaded Successfully, Return Data is : " + fileJson);

        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return fileJson;
    }
   
    /*
  * saveTemplateDataQCBS 
  * Method call to save Template B Data
  * @param null
  * @return List
  * @created 3 Sep 2018
  * @version 2.0.0
  */
  @RequestMapping("/saveTemplateDataQCBS")
  @ResponseBody
  public int saveTemplateDataB(@ModelAttribute("saveTemplateDataQCBS") TenderSubmittedQCBS tenderSubmittedQCBS, int submittedQCBS){
      System.out.println("The QCBS Id : "+submittedQCBS+"\n Officer For QCBS: "+tenderSubmittedQCBS.getQCBSOfficers()+"\n Submitted QCBS: "+tenderSubmittedQCBS.getTemplateId()+"\n Other Value For Submitted Envelope B: "+tenderSubmittedQCBS.getMinOpeningOfficerQCBS());
          try{
             submittedQCBS = tenderSubmittedQCBSDao.create(tenderSubmittedQCBS);
          }catch(Exception ex){
              ex.printStackTrace();
          }
      return submittedQCBS;
  }
  
  @RequestMapping("/showEnvelopeQCBSNames")
  @ResponseBody
  public Map showEnvelopeQCBSNames(){
      Map<Integer, String> qcbsTemplateName = new HashMap<>();
      List<QCBSTemplate> cBSTemplates = new ArrayList<>();
      try{
         cBSTemplates = this.qcbsTemplateDao.fetchQCBSTemplateNamesAndId(String.valueOf(3));
         if(cBSTemplates!=null){
             cBSTemplates.forEach((template)->{
             qcbsTemplateName.put(template.getTemplateId(), template.getQcbsTemplateName());
             });
         }
      }catch(Exception ex){
          ex.printStackTrace();
      }
      return qcbsTemplateName;
  }
}

