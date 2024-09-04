/*
 * In this Controller All Cloud Folder and Cloud File Method are use .
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;




import com.eproc.dao.CloudDao;
import com.eproc.dao.TenderDao;
import com.eproc.dao.TenderDocumentDao;
import com.eproc.daoImpl.CloudDaoImpl;
import com.eproc.domain.CloudFile;
import com.eproc.domain.CloudFolder;
import com.eproc.domain.TenderDocument;
import com.eproc.util.FileUtility;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 *
 * @author PrashantShukla
 */
@Controller
public class CloudController {
    @Autowired(required = true)
        CloudDao cloudDao;
        CloudFolder cloudFolder; 
        CloudFile cloudFile;
        @Autowired
        FileUtility fileUtility;
        @Autowired
        GsonUtility gsonUtility;
        @Autowired 
        TenderDocumentDao documentDao;
        @Autowired 
        CloudDaoImpl cloudDaoImpl;
        private static final String UPLOAD_DIRECTORY = "/docs";

    public String generateRandomNo() {
        String str = "0123456789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 4; i++) 
        {
         sb.append(new Random().nextInt(str.length()));
        }
        System.out.println("random no : " + sb);
        return sb.toString();
    }

    public static String removeExtension(String fileName) {
        if (fileName.indexOf(".") > 0) {
            return fileName.substring(0, fileName.lastIndexOf("."));
        } else {
            return fileName;
        }
    }
    
//******************End*****************************************************
 @RequestMapping("/cloudFile")
    public String cloudFile(Model m,@ModelAttribute("SOR") CloudFile cloudFile) {
//        m.addAttribute("SOR",new UploadSOR());
          List<CloudFile> SorList=cloudDao.fetchAlls();
          System.out.println("List show" +SorList.size()+"Folder ID: "+cloudFile.getCloudFolderId());
          m.addAttribute("SorList", SorList);
          System.out.println("successfully run");
          return "cloudFile";
    }

 @RequestMapping(value = "/savefile", method = RequestMethod.POST)
    public ModelAndView saveimage(@RequestParam CommonsMultipartFile file,
            HttpSession session, @ModelAttribute("SOR") CloudFile cloudFile) throws Exception 
    {
        System.out.println("*****************************SAVE FILE in controller*************************************************************");
        System.out.println("saveimage method is run");
        Date date = new Date();
        int mili = date.getSeconds();
        ServletContext context = session.getServletContext();
        String fileDestPath = context.getRealPath(UPLOAD_DIRECTORY);
        String fileUrl = context.getContextPath();
        String FileName = file.getOriginalFilename();
        String ext = FileName.substring(FileName.lastIndexOf("."));
        System.out.println("ext" + ext);
        String fileConvertedName = removeExtension(FileName) + mili + generateRandomNo() + ext;
        String ext2 = FilenameUtils.getExtension(FileName); // returns "exe"
        System.out.println(fileDestPath + " " + fileConvertedName);
        byte[] bytes = file.getBytes();
        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
                new File(fileDestPath + File.separator + fileConvertedName)));
        float fileSize = FileName.length();
        System.out.println("$$$$$$$$$$$$$$$$$$$$$  "+fileSize+" $$$$$$$$$$$$$$$$$$");
        String fileType = cloudFile.getFileType();
        System.out.println("***********set the sor filename and path********");
        cloudFile.setFileName(FileName);
        cloudFile.setFileConvertedName(fileConvertedName);
        cloudFile.setFileSize(fileSize);
        cloudFile.setFileUrl(fileType);
        cloudFile.setFileUploadDate(date);
        cloudFile.setFileType(ext2);
        cloudFile.setFileDestPath(fileDestPath);
        cloudFile.setFileUrl(fileUrl);
        cloudFile.setFileConvertedName(removeExtension(FileName)  + mili  + generateRandomNo()+ext);
        System.out.println("save the uploaded Sor ");
        cloudDao.save(cloudFile);
        stream.write(bytes);
        stream.flush();
        stream.close();
        System.out.println("***********************END**************************************************************************");
        return new ModelAndView("redirect:/cloudFile", "filesuccess", "File successfully saved!");
    }
    //------------------- updateCircle page--------------------------------
    @RequestMapping(value = "/cloudFileshow")
    public String updateCircle(@RequestParam String id,@ModelAttribute("dc") CloudFolder cloudFolder, RedirectAttributes ra) {
        System.out.println("updateCircle Method in DepartmentController is called successfully" +id);
        ra.addFlashAttribute("msg", "department updated Successfully");
        cloudDao.updateCloudFolder(cloudFolder);
        System.out.println("updateCircle Method in DepartmentController is end successfully");
        return "redirect:/cloudFile";
    }
   
    //******************************Edit and Update the Invetory**********************************************************
    @RequestMapping("/editFolder")
    public String editFolder(@RequestParam int id, Model m) 
    {
        System.out.println("CloudFileId   "+ id);
        CloudFolder cloudFolder = new CloudFolder();
        cloudFolder.setCloudFolderId(id);
        List<CloudFile> cloudFile = cloudDao.getEmpById(id);
        System.out.println("cloudFile no of files :"+cloudFile.size());
        m.addAttribute("cloudFolder",cloudFolder);
        m.addAttribute("id", id);
        m.addAttribute("SorList", cloudFile);
        System.out.println("my ddddddddddddd");
       // System.out.println("student list" + cloudFolder.getId() + " " + emp.getBranch_name() + " " + emp.getManufacturer_date());
//        List<CloudFile> fileList=cloudDao.fetchAlls();
//          m.addAttribute("fileList", fileList);
        return "cloudFile";
    }

    //------------------- updateCircle page--------------------------------
    @RequestMapping(value = "/updatecircle")
    public String updateCircle(@ModelAttribute("cloudFile") CloudFile cloudFile, RedirectAttributes ra) {
        System.out.println("update Method in DepartmentController is called successfully" + cloudFile.getContractorId());
        ra.addFlashAttribute("msg", "department updated Successfully");
//        Date date = new Date();
//        departmentCircle.setDate(date);
        cloudDao.updateCloudFile(cloudFile);
        System.out.println("update Method in DepartmentController is end successfully");
        return "redirect:/cloudFile";
    } 
    
    
    @RequestMapping("backCloudFolder")
    public String backCloudFolder(Model m)
    {
    System.out.println("*****************cloudFolder Page and show the list in Controller*********************************** ");
     
            System.out.println("cloudFolder method run of spring");
            List<CloudFolder> categoryList = cloudDao.fetchAll();
            m.addAttribute("categoryList", categoryList);
            m.addAttribute("CloudFolder", new CloudFolder());
            System.out.println("*****************************END*****************************************");
            return "cloudFolder";
        }
    
    @RequestMapping("cloudFolderURL")
    @ResponseBody
    public TenderDocument cloudFolderFileUploading(@ModelAttribute ("formData")TenderDocument document, HttpServletRequest request, HttpSession session){
        System.out.println("/::::::::::::::::::File Uploading Through Cloud Folder::::::::::::::::::::::::/");
        String fileName = "";
        try{
          String deptId = session.getAttribute("deptId").toString();
          System.out.println("The File is: "+document.getFile().getOriginalFilename()+" documentSequnce: "+document.getDocSequnceId()+" Tender Id: "+document.getTender_id()+" Document Label: "+document.getDoc_Name()+" document: "+document.getDocumentVisibility()+"Document Id: "+document.getDoc_Id()); 
          fileName = fileUtility.fileUploadingUtil(document.getFile(), FileUtility.UPLOAD_TENDERDOCUMENTDIRECTORY);
          System.out.println("The File Converted Name: "+fileName);
//        document.setDocSequnceId(Integer.parseInt(documentSequnce));
          document.setDoc_OrignalName(document.getFile().getOriginalFilename());
          document.setDoc_Converted_Name(fileName);
          document.setDoc_Path(FileUtility.UPLOAD_TENDERDOCUMENTDIRECTORY+"/"+fileName);
          if(deptId!=null){
          document.setDept_id(deptId);
          }
//        document.setDocumentVisibility(documentLabel);
          documentDao.createTenderDocument(document);
          //gsonUtility.writeData(document.toString());
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return document;
    }
   
    /* 
     SavecloudFolderModal Controller
     *  @author Prashant Shukla
     *  @Since 13-08-2018
     *  @Version 2.0.0
     */
    @RequestMapping("/cloudFolderModal")
    @ResponseBody
    public String cloudFolderModal(@ModelAttribute CloudFolder cloudFolder, Model m, HttpSession session) {
        try {
            System.out.println("*******************ADD cloudFolder List Show in controller****************************************");
            List<CloudFolder> list = cloudDao.cloudFolderList();
            System.out.println("My CloudFolder List" + list.size());
            Gson gson = new Gson();
            String resString = gson.toJson(list);
            gsonUtility.writeData(resString);
            System.out.println("My data is " + list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("*******************END****************************************");
        return null;
    }
    
      /*
     Fetch cloud file Data Controller
     *  @author Prashant Shukla
     *  @Since 13-08-2018
     *  @Version 2.0.0
     */
    @RequestMapping("/fetchcloudfileData")
    @ResponseBody
    public String fetchcloudfileData(@RequestParam int cloudFolderId, Model m, HttpSession session) {
        String response = "cloud File Id";
        System.out.println("cloud File Id is :" + cloudFolderId);
        List<CloudFile> cloudFilePojoList = null;
        try {
            cloudFilePojoList = cloudDaoImpl.cloudFileDaoImpldata(cloudFolderId);
            System.out.println("rrrrrrrrrrrrrr" + cloudFolderId);
            System.out.println("auctionEnvelopeName Details  Data" + cloudFilePojoList.size());
            Gson gson = new Gson();
            gsonUtility.writeData(gson.toJson(cloudFilePojoList));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("my error code" + e);
        }
        System.out.println("My data is successfully show" + response);
        return null;
    }
    
      /*
     * Auction 
     * Save Document Cloud Data
     * @param DocumentAuction
     * @return AuctionCreationWizard page
     * @created 17 Nov 2018
     * @version 2.0.0
     */
//    @RequestMapping("/documentCloudData")
//    @ResponseBody
//    public String documentCloudData(@RequestParam Integer fileId, @RequestParam("documentName") String documentName,
//            HttpSession session, DocumentAuction tenderDocument, HttpServletRequest request) {
//        System.out.println("fileId : " + fileId);
//        Date date = new Date();
//        CloudFile cloudFile = new CloudFile();
//        try {
//            tenderDocument.setDoc_Name(documentName);
//            cloudFile = cloudDaoImpl.getcloudFileById(fileId);
//            tenderDocument.setFileName(cloudFile.getFileName());
//            tenderDocument.setDoc_Converted_Name(cloudFile.getFileConvertedName());
//            tenderDocument.setDoc_OrignalName(cloudFile.getFileName());
//            tenderDocument.setFileUploadDate(date);
//            tenderDocument.setDoc_path(cloudFile.getFileDestPath());
//            tenderDocument.setFileUrl(cloudFile.getFileUrl());
//            auctionDaoImpl.saveAuctionDocument(tenderDocument);
//            logs.setActivity("Save Cloud document");
//            logs.setLogMessage("Cloud document saved successfully");
//            logs.setIpAddress(logsAction.fetchIpAddress());
//            logs.setOsName(logsAction.getOs());
//            logs.setMacAddress(logsAction.fetchMacAddress());
//            logs.setClientBrowser(logsAction.getClientBrowser(request));
//            logs.setAuctionId(tenderDocument.getAuctionId());
//            logActionDao.save(logs);
//            System.out.println("my document path" + tenderDocument.getDoc_path());
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
    
}