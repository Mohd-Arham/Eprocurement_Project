
package com.eproc.controller;

import com.eproc.dao.UploadSorDao;
import com.eproc.domain.UploadSOR;
import com.eproc.model.UploadSORModel;
import com.eproc.util.FileUtility;
import com.google.gson.Gson;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**Controller Class
 *@author Palak Tiwari
 * 
 */
@Controller
public class UploadSORController {
     @Autowired
     SessionFactory sessionFactory;
     @Autowired
     private UploadSorDao uploadSorDao;
     UploadSORModel uploadSORModelValidators;
      private static final String UPLOAD_DIRECTORY = "/resources/UploadedDocuments/sorDocs";
 
     /**
      * initBinder method
      * @param binder 
      */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        binder.addValidators(uploadSORModelValidators);
    }

    /* 
     * manageSOR method used to fetch data
     * @ModelAttribute SOR
     * @return SORFile jsp page
     */
    @RequestMapping("/manageSOR")
    public String manageSOR(Model m, @ModelAttribute("SOR") UploadSOR uploadSor) {
        System.out.println("----------------Manage SOR method is run--------------");
       try{
        List<UploadSOR> SorList = uploadSorDao.fetchAll();
        System.out.println("Display the SOR document");
        m.addAttribute("SorList", SorList);
       }catch(Exception ex){
           ex.printStackTrace();
          System.out.println("Class: UploadSORController /Method:manageSOR");  
       }
        return "DepartmentAdmin/SORFile";
    }

    
    
    @RequestMapping(value="/uploadFile",method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(@RequestParam CommonsMultipartFile file) throws IOException {
    String fileName=file.getOriginalFilename();
    return fileName;
    }
     /**
      * saveFile method used to save the data
      * @param file
      * @param session
      * @Model attribute SOR
      * @return manageSOR
      * @throws Exception 
      */  
     @RequestMapping(value = "/uploadSor", method = RequestMethod.POST)
        public String saveFile(@RequestParam CommonsMultipartFile file,
        HttpSession session, @ModelAttribute("SOR") @Validated UploadSOR uploadSor,RedirectAttributes ra,BindingResult result) throws Exception {
        System.out.println("----------------saveimage method is run------------");
        String message="";
         System.out.println(session.getAttribute("deptId") +"dept id is ");
        try{
        Date date = new Date();
        System.out.println("date is:"+date);
        Integer deptId = Integer.parseInt(session.getAttribute("deptId").toString());
        ServletContext context = session.getServletContext();
        String path = context.getRealPath(UPLOAD_DIRECTORY);
        System.out.println("Path of the file is:"+path);
        String url = context.getContextPath();
        String fileName = file.getOriginalFilename();
        System.out.println("File name are: "+fileName);
        String ext=fileName.substring(fileName.lastIndexOf("."));
        System.out.println("ext"+ext);
        String fileconvertedName=FileUtility.removeExtension(fileName)+FileUtility.generateRandomNoMili()+ext;
        System.out.println("File converted name is:"+ fileconvertedName);
        byte[] bytes = file.getBytes();
        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
        new File(path + File.separator + fileconvertedName)));
        System.out.println("set the sor filename,path,created date,url and file converted name");
        uploadSor.setUploadSorFileName(fileName);
        uploadSor.setDept_id(deptId);
        uploadSor.setStatus("Enable");
        uploadSor.setFilePath(path);
        uploadSor.setCreatedDate(date);
        uploadSor.setFileUrl(url);
        uploadSor.setFileconvertedName(fileconvertedName);
        message=uploadSorDao.checkDuplicateValue(uploadSor.getFileName());
        System.out.println("Message"+message);
        if (!message.equalsIgnoreCase("Duplicate SOR Document Name") && !message.equalsIgnoreCase("Please Enter SOR Document Name")) {
        System.out.println("Insert data method is calling");
        uploadSorDao.insertData(uploadSor);
         ra.addFlashAttribute("msg2","File Added Successfully");
         System.out.println("Saved the Sor Document");
         stream.write(bytes);
         stream.flush();
         stream.close();
        }
        else if(message=="Duplicate SOR Document Name") {
           ra.addFlashAttribute("msg1","SOR Document Already Exists");
           return "redirect:/manageSOR";
        }
        else if (message == "Please Enter SOR Document Name" ){
            ra.addFlashAttribute("msg1", "Please Enter SOR Document Name");
            return "redirect:/manageSOR";
        }
        }catch (Exception ex) {
            ex.printStackTrace();
          System.out.println("Class: UploadSORController /Method:saveFile");
        }
       System.out.println("------------------saveimage method is closed----------------");
       return "redirect:/manageSOR";
    }
        
     /**
      * showStatus method
      * @param id
      * @param status
      * @return manageSOR
      */
     @RequestMapping(value ="/statusForUploadSor", method = RequestMethod.GET)
     @ResponseBody
     public String showStatus(@RequestParam int id,@RequestParam String status){
     boolean Status=false; 
     Gson gson = new Gson();
     System.out.println("---------------showStatus method is run----------------");
    try{
     System.out.println("id:"+id);
     Status=uploadSorDao.updateStatus(id,status);
    }
    catch(Exception ex){
        ex.printStackTrace();
       
    }
     System.out.println("--------------showStatus method is closed-------------");
     return gson.toJson(Status);            
     }
    
}
