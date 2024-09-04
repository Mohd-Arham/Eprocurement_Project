/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.dao.ContractorDao;
import com.eproc.dao.TenderCategoryDAO;
import com.eproc.daoImpl.ContractorDaoImpl;
//import com.eproc.daoImpl.CurrencyDaoImpl;
import com.eproc.daoImpl.EmpanelmentDynamicTemplateDAOImpl;
import com.eproc.daoImpl.EmpanelmentTemplateDataDAOImpl;
import com.eproc.daoImpl.ProductWiseEmpanelmentDAOImpl;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.Contractor;
//import com.eproc.domain.Currency;
import com.eproc.domain.EmpanelmentDynamicTemplate;
import com.eproc.domain.EmpanelmentTemplateData;
import com.eproc.domain.EmpanelmentTemplateName;
import com.eproc.domain.ProductWiseEmpanelment;
import com.eproc.domain.TenderCategory;
import com.eproc.service.DepartmentService;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import org.​springframework.​web.​multipart.​MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Mansi Jain
 */
@Controller
public class ProductwiseEmpanelmentController {

    @Autowired
    TenderCategoryDAO categoryDAO;
    @Autowired
    AreaOfWorkDAO areaofworkDAO;
    @Autowired
    GsonUtility gsonutility;
 //   @Autowired
//    CurrencyDaoImpl currencydao;
    @Autowired
    ProductWiseEmpanelmentDAOImpl productWiseEmpanelmentDAO;
    @Autowired
    EmpanelmentDynamicTemplateDAOImpl empanelmentDynamicTemplateDAOImpl;
    @Autowired
    EmpanelmentTemplateDataDAOImpl empanelmentTemplateDataDAO;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    ContractorDao contractorDao;
    
    @RequestMapping("/productwiseEmpanelment")
    public String productwiseEmpanelment(Model m) {
        System.out.println("!!!!!!!!!!Welcome to Product Wise Empanelment");

        List<TenderCategory> categoryList = categoryDAO.fetchAll();
        m.addAttribute("categoryList", categoryList);
        System.out.println("categoryList  " + categoryList.size());
//        List<Currency> currencyList = currencydao.fetchAll();
//        m.addAttribute("currencyList", currencyList);
//        System.out.println("currencyList  " + currencyList.size());

        m.addAttribute("productWiseEmpanelment", new ProductWiseEmpanelment());
        return "DepartmentUser/ProductwiseEmpanelment";
    }

    @RequestMapping("/viewProductwiseEmpanelment")
    public String viewProductwiseEmpanelment(Model m) {
        System.out.println("!!!!!!!!!!Welcome to View Product Wise Empanelment Details");
//        Integer nameid =0;
//            List<EmpanelmentDynamicTemplate> empanelmentDynamicTemplateList = empanelmentDynamicTemplateDAOImpl.fetchAll();
//            for (EmpanelmentDynamicTemplate empanelmentDynamicTempnamelist : empanelmentDynamicTemplateList) {
//            nameid = empanelmentDynamicTempnamelist.getTemplatenameId();
//         }
//        System.out.println("nameid  "+nameid);
        List<ProductWiseEmpanelment> empanelmentList = productWiseEmpanelmentDAO.fetchAll();
        m.addAttribute("empanelmentList", empanelmentList);
//        m.addAttribute("nameid", nameid);
        System.out.println("empanelmentList  " + empanelmentList.size() + " " + empanelmentList);
        m.addAttribute("productWiseEmpanelment", new ProductWiseEmpanelment());
        return "DepartmentUser/ViewProductWiseEmpanelmentDetails";
    }

    @RequestMapping("/saveProductwiseEmpanelment")
    public String saveProductwiseEmpanelment(@ModelAttribute("productWiseEmpanelment") ProductWiseEmpanelment productWiseEmpanelment, Model m, RedirectAttributes ra,
            @RequestParam String TenderCategory) {
        System.out.println("****************saveProductWiseEmpanelment method run in ProductWiseEmpanelmentController****************" + TenderCategory);
        Date date = new Date();
        productWiseEmpanelment.setCreateddate(date);
//        List<EmpanelmentTemplateName>templateNameDataList = empanelmentDynamicTemplateDAOImpl.fetchAllTemplateNameData();
//        for (EmpanelmentTemplateName template_name : templateNameDataList) {
//
//            System.out.println("template id  " + template_name.getTemplatenameId());
//            productWiseEmpanelment.setTemplatenameId(template_name.getTemplatenameId());
//        }

        List<TenderCategory> categoryList = categoryDAO.fetchAll();
        Iterator<TenderCategory> iterator = categoryList.iterator();
        while (iterator.hasNext()) {
            TenderCategory tendercategoryiterator = iterator.next();
            if (Integer.parseInt(TenderCategory) == tendercategoryiterator.getTender_category_id()) {
                productWiseEmpanelment.setTenderCategory(tendercategoryiterator.getTender_category_name());
            }
        }
        if (productWiseEmpanelment.getAmount() != "") {
            productWiseEmpanelment.setStatus("Applicable");
        } else {
            productWiseEmpanelment.setStatus("NotApplicable");
        }
        productWiseEmpanelmentDAO.insertData(productWiseEmpanelment);
        ra.addFlashAttribute("empId", productWiseEmpanelment.getEmpanelmentId());
        ra.addFlashAttribute("tendercategory", productWiseEmpanelment.getTenderCategory());
        ra.addFlashAttribute("aow", productWiseEmpanelment.getAreaOfWork());
        ra.addFlashAttribute("currency", productWiseEmpanelment.getCurrencyCode());
        ra.addFlashAttribute("amount", productWiseEmpanelment.getAmount());
        ra.addFlashAttribute("msg", "Empanelment Save Successfully");
        return "redirect:/productwiseEmpanelment";
    }

    //*************typesOfWorkAreaByAjax**************//    
    @RequestMapping("/typesOfWorkAreaByAjax")
    @ResponseBody //to convert JSON Data into String Format taking as response from controller to jsp
    public String getTenderAreaWorkByCatId(@RequestParam Integer tender_category_id) throws IOException {

        System.out.println("################## Inside getTenderAreaWorkByCatId ##################  " + tender_category_id);
        System.out.println("................getSubDivisionByAjax controller.................");
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAreaOfWorkbyTenderCategory(tender_category_id);
        Gson gson = new Gson();
        String response = gson.toJson(areaofworkList);
        gsonutility.writeData(response);
        return response;
    }
    //**************************************************************************************//

    @RequestMapping("/saveDynamicTemplate")
    public String saveDynamicTemplate(EmpanelmentDynamicTemplate empanelmentdynamicTemplate, @RequestParam String labelname, String labeltype, Integer sequenceIdA, Integer dynamicId, @RequestParam Integer templatenameId, String templatename, HttpSession session, Model m, @RequestParam Integer empanelmentId) throws IOException {
        empanelmentdynamicTemplate.setDynamicId(dynamicId);
        System.out.println("inside Dynamic template");
        try {
            Date date = new Date();
            Integer empId = 0;
            List<ProductWiseEmpanelment> empanelmentList = productWiseEmpanelmentDAO.fetchAll();
            for (ProductWiseEmpanelment empnlmntId : empanelmentList) {

                System.out.println("empnlmntId   " + empnlmntId.getEmpanelmentId());
                empId = empnlmntId.getEmpanelmentId();
            }
            Integer tempNameid = 0;
            List<EmpanelmentTemplateName> templateNameDataList = empanelmentDynamicTemplateDAOImpl.fetchAllTemplateNameData();
            for (EmpanelmentTemplateName template_name : templateNameDataList) {

                System.out.println("template id  " + template_name.getTemplatenameId());
                tempNameid = template_name.getTemplatenameId();
            }
            empanelmentdynamicTemplate.setLabelname(labelname);
            empanelmentdynamicTemplate.setLabeltype(labeltype);
            empanelmentdynamicTemplate.setSequenceIdA(sequenceIdA);
            empanelmentdynamicTemplate.setEmpanelmentId(empId);
            System.out.println("my dynamic Id is  :" + empanelmentdynamicTemplate.getDynamicId());
            System.out.println("The field is: " + empanelmentdynamicTemplate.getLabelname());
            System.out.println("TheLabel type is:  " + empanelmentdynamicTemplate.getLabeltype());
            System.out.println("Empanelment Template sequence no  " + empanelmentdynamicTemplate.getSequenceIdA());
            String s = empanelmentdynamicTemplate.getLabelname();
            String s2 = empanelmentdynamicTemplate.getLabeltype();
            Integer s4 = empanelmentdynamicTemplate.getSequenceIdA();
            String s1[] = s.split(",");
            String s3[] = s2.split(",");
            int count = 1;
            for (int i = 0; i < s1.length; i++) {
                EmpanelmentDynamicTemplate t = new EmpanelmentDynamicTemplate();
                t.setLabelname(s1[i]);
                t.setLabeltype(s3[i]);
                t.setSequenceIdA(count);
                t.setTemplatenameId(tempNameid);
                t.setEmpanelmentId(empId);
                t.setCreatedDate(date);
                empanelmentDynamicTemplateDAOImpl.insertData(t);
                productWiseEmpanelmentDAO.updateData(empanelmentId, tempNameid);
//            Integer id=session.setAttribute("templateNameId" ,empanelmentdynamicTemplate.getTemplatenameId());
//            t.getTemplatenameId();
//            System.out.println("my templatenameIdss" +templatenameIdss);
                empanelmentdynamicTemplate.setDynamicId(t.getDynamicId());
                empanelmentdynamicTemplate.setSequenceIdA(t.getSequenceIdA());
                System.out.println("my dynmic id  " + empanelmentdynamicTemplate.getDynamicId());
                System.out.println("sequenc no" + empanelmentdynamicTemplate.getSequenceIdA());
                count++;
            }
//        Gson gson = new Gson();
//        String response = gson.toJson(templatenameIdss);
//        gsonutility.writeData(response);
            m.addAttribute("empanelmentdynamicTemplate", empanelmentdynamicTemplate);
        } catch (Exception ex) {
            System.out.println("Exception in Product Wise Empanelment controller save dynamic template" + ex.getMessage());
            ex.printStackTrace();
        }
        return "DepartmentUser/ViewProductWiseEmpanelmentDetails";
    }

    @RequestMapping("/saveEmpnalementTemplateName")

    public String saveEmpnalementTemplateName(@ModelAttribute EmpanelmentTemplateName empanelmentTemplateName, @RequestParam Integer templatenameId, Model m, HttpSession session) {
        try {
            System.out.println("*******************insert the  data in Controller****************************************");
            Date date = new Date();
            empanelmentTemplateName.setCreatedDate(date);
            empanelmentDynamicTemplateDAOImpl.saveEmpanelmentTemplatename(empanelmentTemplateName);
            templatenameId = empanelmentTemplateName.getTemplatenameId();
            System.out.println("My EmpanelmentTemplateNameId" + templatenameId);
            session.setAttribute("templatenameId", templatenameId);
            System.out.println("EmpanelmentTemplateNameId:" + templatenameId);
            m.addAttribute("empanelmentTemplateName", new EmpanelmentTemplateName());
            System.out.println("*******************END****************************************");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("my error code is:" + e);
        }
        return "DepartmentUser/ViewProductWiseEmpanelmentDetails";
    }

    @RequestMapping("/fetchDynamicTemplate")
    @ResponseBody
    public List fetchDynamicTemplate(@RequestParam Integer templateId, Model m, RedirectAttributes ra) throws IOException {
        System.out.println("The Template Id is: " + templateId);
        List<EmpanelmentDynamicTemplate> empanelmentDynamicTemplateList = new ArrayList<>();
        empanelmentDynamicTemplateList = empanelmentDynamicTemplateDAOImpl.fetchAllbyTemplateid(templateId);
        System.out.println("template label list  :" + empanelmentDynamicTemplateList.size());
        return empanelmentDynamicTemplateList;
    }

    @RequestMapping("/viewEmpanelmentRequest")
    public String viewEmpanelmentRequest(Model m) {
        System.out.println("!!!!!!!!!!Welcome to View Product Wise Empanelment Details");
        List<ProductWiseEmpanelment> empanelmentList = productWiseEmpanelmentDAO.fetchAll();
        m.addAttribute("empanelmentList", empanelmentList);
        System.out.println("empanelmentList  " + empanelmentList.size() + " " + empanelmentList);
        m.addAttribute("productWiseEmpanelment", new ProductWiseEmpanelment());
        m.addAttribute("productWiseEmpanelmentreject", new ProductWiseEmpanelment());
        return "DepartmentUser/ViewEmpanelmentRequest";
    }

     @RequestMapping("/fetchEmpanelContractor")
    @ResponseBody
    public List<Contractor> fetchEmpanelContractor(@RequestParam String areaofworkId){
       List<Contractor> contractors = new ArrayList<>();
       List<ProductWiseEmpanelment> empanelmentList = new ArrayList<>();
        System.out.println("The Area Of Work is: "+areaofworkId);
       try{
         //empanelmentList = productWiseEmpanelmentDAO.fetch(areaofworkId, "Approved");
          contractors = contractorDao.fetchAll(areaofworkId, "Approved");
          System.out.println("The Total Approved Empanel COntractor are: "+empanelmentList.size());
          System.out.println("The Total Approved Empanel COntractor are: "+contractors.size());
       }catch(Exception ex){
           ex.printStackTrace();
       }
       return contractors;
    }
    
//    @RequestMapping("/fetchDynamicTemplateData")
//   @ResponseBody
//    public String fetchDynamicTemplateData(@RequestParam Integer templatenameId, Model m, RedirectAttributes ra) throws IOException {
//        System.out.println("The Templatename Id is: " + templatenameId);
//        EmpanelmentTemplateData empanelmentTemplateData = empanelmentTemplateDataDAO.fetchData(templatenameId);
//        m.addAttribute("empanelmentTemplateData", empanelmentTemplateData);
//        
//        System.out.println("Name  "+empanelmentTemplateData.getLabelname());
//        System.out.println("contactNo  "+empanelmentTemplateData.getNumber());
//        System.out.println("Documents  "+empanelmentTemplateData.getFilename());
//        ra.addFlashAttribute("name", empanelmentTemplateData.getLabelname());
//        Gson gson=new Gson();
//        return gson.toJson(empanelmentTemplateData);
//    }
    @RequestMapping("/fetchDynamicTemplateData")
    @ResponseBody
    public List<EmpanelmentTemplateData> fetchDynamicTemplateData(@RequestParam Integer templatenameId, Model m, RedirectAttributes ra) throws IOException {
        System.out.println("The Templatename Id is:^^^^^ " + templatenameId);
        List<EmpanelmentTemplateData> EmpanelmentTemplateDataList = new ArrayList<>();
        EmpanelmentTemplateDataList = empanelmentTemplateDataDAO.fetchAllBytemplateNameid(templatenameId);
        System.out.println("empanelmentList  " + EmpanelmentTemplateDataList.size() + " " + EmpanelmentTemplateDataList);
        return EmpanelmentTemplateDataList;
    }

    @RequestMapping("/approveStatus")
    public String approveStatus(@RequestParam Integer templatenameId, RedirectAttributes ra, Model m) {
        System.out.println("Approve Status  templatenameId  " + templatenameId);
        String templateStatus = "Approved";
        productWiseEmpanelmentDAO.updatePendigrequest(templatenameId, templateStatus);
        System.out.println("templateStatus  " + templateStatus);
        List<ProductWiseEmpanelment> empanelmentList = productWiseEmpanelmentDAO.fetchAll();
        m.addAttribute("empanelmentList", empanelmentList);
        System.out.println("empanelmentList  " + empanelmentList.size() + " " + empanelmentList);
        ra.addFlashAttribute("msg", "Your Empanelment Request Has been Approved");
        return "DepartmentUser/ViewProductWiseEmpanelmentDetails";
    }

    @RequestMapping("/rejectRemark")
    public String rejectRemark(@ModelAttribute("productWiseEmpanelmentreject") ProductWiseEmpanelment productWiseEmpanelmentreject, Model m, RedirectAttributes ra) {
        m.addAttribute("productWiseEmpanelmentreject", productWiseEmpanelmentreject);
        String rejectremark = productWiseEmpanelmentreject.getRejectremark();
        Integer templatenameId = productWiseEmpanelmentreject.getTemplatenameId();
        String remarkDate = productWiseEmpanelmentreject.getRemarkDate();
        String templateStatus = "Reject";
        productWiseEmpanelmentDAO.updatePendigrequestandfillRemark(templatenameId, templateStatus, rejectremark, remarkDate);
        List<ProductWiseEmpanelment> empanelmentList = productWiseEmpanelmentDAO.fetchAll();
        m.addAttribute("empanelmentList", empanelmentList);
        ra.addFlashAttribute("msg", "Sorry! Your Empanelment Request Has been Rejected");
        return "DepartmentUser/ViewProductWiseEmpanelmentDetails";
    }

    @RequestMapping("/saveEmpanelmentTemplateData")
    public String saveEmpanelmentTemplateData(@ModelAttribute("empanelmentTemplateData") EmpanelmentTemplateData empanelmentTemplateData,
            RedirectAttributes ra, Model m, @RequestParam Integer empanelmentId, HttpServletRequest request) {
        System.out.println("empanelmentId  " + empanelmentId);
        System.out.println("call saveEmpanelmentTemplateData method in ProductWiseEmpanelmentController");
        try {
            Date date = new Date();
            Integer tempNameid = 0;
            List<EmpanelmentTemplateName> templateNameDataList = empanelmentDynamicTemplateDAOImpl.fetchAllTemplateNameData();
            for (EmpanelmentTemplateName template_name : templateNameDataList) {
                System.out.println("template id  " + template_name.getTemplatenameId());
                tempNameid = template_name.getTemplatenameId();
            }
            if (empanelmentTemplateData.getLabelname() != "") {
                empanelmentTemplateData.setStatus("Enable");
            } else {
                empanelmentTemplateData.setStatus("disable");
            }
//            String s = empanelmentTemplateData.getLabelname();
//            String s1[] = s.split(",");
//            String ss=empanelmentTemplateData.getNumber();
//             String s2[] = ss.split(",");
//           // int count = 1;
//             EmpanelmentTemplateData data = new EmpanelmentTemplateData();
//            for (int i = 0; i < s1.length; i++) {
//                
//                data.setLabelname(s1[i]);
//              data.setTemplatenameId(tempNameid);
//               //  data.setSequenceIdA(count);
//                  data.setCreatedDate(date);
//               
////                  String Filename=empanelmentTemplateData.getMultipartfile().g
////                  departmentService.saveDepartmentFile(empanelmentTemplateData.getFilename(), request, ss);
//               data.setFilename(empanelmentTemplateData.getFilename());
            empanelmentTemplateData.setTemplatenameId(tempNameid);
            empanelmentTemplateData.setCreatedDate(date);
            System.out.println("Template name id in save dynamic template Data  " + empanelmentTemplateData.getTemplatenameId());
            empanelmentTemplateDataDAO.insertData(empanelmentTemplateData);
            System.out.println("templateDataId :" + empanelmentTemplateData.getEmptempdataId() + "  Labelname value :  " + empanelmentTemplateData.getLabelname());
            String templateStatus = "pending";
            productWiseEmpanelmentDAO.updateStatus(empanelmentId, templateStatus);
            ra.addFlashAttribute("msg", "Empanelment Template Details Save Successfully");
            List<ProductWiseEmpanelment> empanelmentList = productWiseEmpanelmentDAO.fetchAll();
            m.addAttribute("empanelmentList", empanelmentList);
        } catch (Exception ex) {
            System.out.println("Exception in class: ProductWiseEmpanelmentController" + ex.getMessage());
            System.out.println("Method : saveEmpanelmentTemplateData ");
            ex.printStackTrace();
        }
        return "redirect:/viewProductwiseEmpanelment";
    }
}
