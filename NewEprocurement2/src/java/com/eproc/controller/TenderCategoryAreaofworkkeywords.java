package com.eproc.controller;

import com.eproc.dao.TenderKeywordDAO;
import com.eproc.dao.AreaOfWorkDAO;
import com.eproc.dao.TenderCategoryDAO;
import com.eproc.domain.TenderKeyword;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.Logs;
import com.eproc.domain.TenderCategory;    
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.AreaOfWorkModel;
import com.eproc.model.TenderKeywordModel;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Naina Jain
 */
@Controller
public class TenderCategoryAreaofworkkeywords {

    Map<Integer, String> AreaOfWork = new HashMap<Integer, String>();

    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    AreaOfWorkDAO areaofworkDAO;

    @Autowired
    TenderCategoryDAO categoryDAO;

    @Autowired
    TenderKeywordDAO keywordDAO;

    @Autowired
    LogsAction logsAction;

    @Autowired
    LogsActionDao logsActionDao;

    Gson gson = new Gson();

    @InitBinder("addareaofwork")
    protected void initAreaOfWorkBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
        //binder.setValidator((Validator) new AreaOfWorkModel());
    }

    @InitBinder("addkeywords")
    protected void initAddKeywordsBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method");
      // binder.setValidator((Validator) new TenderKeywordModel());
    }

    @RequestMapping("/tender_areaofwork_keyword")
    public String tender_areaofwork_keyword(@ModelAttribute("addareaofwork") AreaOfWork addareaofwork, @ModelAttribute("addkeywords") TenderKeyword addkeywords,
            Model m,HttpSession session) {
        m.addAttribute(addareaofwork);
        m.addAttribute(addkeywords);
        List<TenderCategory> categoryList = categoryDAO.fetchAllTenderCategorybydeptId((Integer) session.getAttribute("deptId"));
        m.addAttribute("categoryList", categoryList);
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAllAreaOfWorkbyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("areaofworkList", areaofworkList);
        return "DepartmentAdmin/TenderAreaOfWorkKeyWords";
    }

    @RequestMapping("/fetchTenderCategory")
    @ResponseBody
    public String fetchTenderCategory(Model m,HttpSession session) {
        String deptId = session.getAttribute("deptId").toString();
        System.out.println("The Dept Id is: "+deptId);
        List<TenderCategory> categoryList = categoryDAO.fetchAllTenderCategorybydeptId(Integer.parseInt(deptId));
        m.addAttribute("categoryList", categoryList);
        return gson.toJson(categoryList);
    }

    @RequestMapping("/fetchAreaOfWork")
    @ResponseBody
    public List<AreaOfWork> fetchAreaOfWork(Model m, @RequestParam Integer tender_category_id,HttpSession session) {
        System.out.println("Tender Id ::::@@@@" + tender_category_id);
        //int deptId =  (int) session.getAttribute("deptId");
        int deptId = 2;
        System.out.println("The Department Id is: "+deptId);
        List<AreaOfWork> areaworkList = new ArrayList();
        if(deptId!=0){
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAreaOfWorkbyTenderCategory(tender_category_id);
        System.out.println("The Area Of Work size: "+areaofworkList.size());
        Iterator<AreaOfWork> iterator = areaofworkList.iterator();
        while (iterator.hasNext()) {
            AreaOfWork areaOfWork = iterator.next();
            if (tender_category_id == areaOfWork.getTender_category_id()) {
                areaworkList.add(areaOfWork);
            }
          }
        }
        return areaworkList;
    }

    @RequestMapping("/fetchKeyword")
    @ResponseBody
    public List<TenderKeyword> fetchKeyword(Model m, @RequestParam Integer areaofwork_id,HttpSession session) {
        System.out.println("Area Of Work Id:" + areaofwork_id);
        List<TenderKeyword> keywordList = new ArrayList();
        //int deptId =  (int) session.getAttribute("deptId");
        int deptId = 2;
        try{
        List<TenderKeyword> addKeywordList = keywordDAO.fetchAllTenderKeywordbyDept_ID(deptId);
        Iterator<TenderKeyword> iterator = addKeywordList.iterator();
        while (iterator.hasNext()) {
            TenderKeyword addKeyword = iterator.next();
            if (areaofwork_id == addKeyword.getAreaofwork_id()) {
                keywordList.add(addKeyword);
            }
        }
        System.out.println("The Keywords are: "+keywordList.size());
        }catch(Exception ex){
          ex.printStackTrace();
        }
        return keywordList;
    }

    //*************saveAreaOfWork**************//
    @RequestMapping("/save_AreaOfWork")
    @ResponseBody
    public String save_AreaOfWork(@ModelAttribute("addareaofwork")
            @Validated AreaOfWork addareaofwork, BindingResult result,
            @RequestParam Integer areaofwork_idP, @ModelAttribute("addkeywords") TenderKeyword addkeywords,
            HttpServletRequest request, RedirectAttributes ra, Model m, @RequestParam Integer tender_category_id,HttpSession session) {
        System.out.println("****************saveAreaOfWork method run****************" + addareaofwork.getAreaofwork_name() + "jtgmjgj" + tender_category_id);
        System.out.println("%%%%%%%%%%%% areaofwork_idP :: " + areaofwork_idP);

        List<AreaOfWork> areaofworkList = null;
        Date date = new Date();
        addareaofwork.setDate(date);
         Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
            addareaofwork.setDept_id(deptID);
        Logs logs = new Logs();
        try {
            if (areaofwork_idP != null) {
                addareaofwork.setAreaofwork_id(areaofwork_idP);
                AreaOfWork oldAreaOfWorkName = areaofworkDAO.fetchData(areaofwork_idP);
                logs.setActivity("Area Of Work Update Activity");
                logs.setHeadingMsg("Area OF Work Master Log");
                logs.setLogMessage(oldAreaOfWorkName.getAreaofwork_name() + " Area Of Work is Replaced with " + addareaofwork.getAreaofwork_name());
            } else {
                logs.setActivity("Area Of Work Save Activity");
                logs.setHeadingMsg("Area OF Work Master Log");
                logs.setLogMessage(addareaofwork.getAreaofwork_name() + " Area Of Work Added Successfully");
            }
            System.out.println("areaofwork_id : - " + addareaofwork.getAreaofwork_id() + "areaofwork_idP : - " + areaofwork_idP);
            if (result.hasErrors() && addareaofwork.getAreaofwork_name().equalsIgnoreCase("")) {
                areaofworkList = areaofworkDAO.fetchAllAreaOfWorkbyDept_ID(deptID);
                return gson.toJson(areaofworkList);
            }
            String msg = areaofworkDAO.getDuplicateAreaOfWork(addareaofwork, deptID);//calling getDuplicateCategory method
            if (msg.equalsIgnoreCase("Area Of Work already Exist")) {
                String msg2 = "Area Of Work already Exist";
                return gson.toJson(msg2);
            }
            if (!msg.equalsIgnoreCase("Area Of Work already Exist")) {

                logs.setAuctionId(1);
                logs.setContractorId(1);
                logs.setDeptId(deptID);
                logs.setDeptUser("Naina Jain");
                logs.setDeptUserId(1);
                logs.setDscId("DSC123");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setLogId(123);
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setRfqId(1);
                logs.setTenderId(1);

                logsActionDao.save(logs);
                areaofworkDAO.insertData(addareaofwork); //FOR Save AreaOFWork 
//                areaofworkList = areaofworkDAO.fetchAreaOfWork(tender_category_id);
                msg = "Area Of Work Added Successfully";
                return gson.toJson(msg);
            }
        } catch (Exception ex) {
            System.out.println("Class:TenderCategory_Areaofwork_keywordsController\n Method:saveAreaOfWork");
            System.out.println("Exception in TenderCategory_Areaofwork_keywordsController " + ex.getMessage());
            ex.printStackTrace();
        }
        return gson.toJson(areaofworkList);
    }

    //*************editAreaOfWork/UpdateAreaOfWork**************//
    @RequestMapping("/edit_AreaOfWork")
    @ResponseBody
    public String edit_AreaOfWork(@RequestParam Integer id, Model m, @ModelAttribute("addareaofwork") AreaOfWork addareaofwork) {
        System.out.println("**************editKeyword method run**************" + addareaofwork.getTender_category_id());
        addareaofwork = areaofworkDAO.fetchData(id);
      Integer ID1 = addareaofwork.getTender_category_id();
      TenderCategory addCategory = categoryDAO.fetchData(ID1);
      addareaofwork.setTender_category_name(addCategory.getTender_category_name());
        m.addAttribute("addareaofwork", addareaofwork);
        System.out.println("*******************END****************************************");
  return gson.toJson(addareaofwork);
    }

    //*************saveKeywords**************//
    @RequestMapping("/save_Keywords")
    @ResponseBody
    public String save_Keywords(Locale locale, @ModelAttribute("addkeywords")
            @Validated TenderKeyword addkeywords, BindingResult result, @RequestParam Integer tenderKeyWordsIdP,
            HttpServletRequest request, @RequestParam Integer areaofwork_id, Model m,
            HttpSession session) {
        System.out.println("**************saveKeywords method run**************" + tenderKeyWordsIdP);
        Logs logs = new Logs();

        Date date = new Date();
        addkeywords.setDate(date);
         Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
            addkeywords.setDept_id(deptID);
        List<TenderKeyword> addKeywordList = null;
        String msg = "Keyword already Exist";
        try {
            if (tenderKeyWordsIdP != null) {
                addkeywords.setTenderKeyWordsId(tenderKeyWordsIdP);
                TenderKeyword oldKeywordName = keywordDAO.fetchData(tenderKeyWordsIdP);
                logs.setActivity("Keyword Update Activity");
                logs.setHeadingMsg("Keyword Master Log");
                logs.setLogMessage(oldKeywordName.getTenderKeyWordsName() + " Keyword is Replaced with " + addkeywords.getTenderKeyWordsName());
            } else {
                logs.setActivity("Keyword Save Activity");
                logs.setHeadingMsg("Keyword Master Log");
                logs.setLogMessage(addkeywords.getTenderKeyWordsName() + " Keyword Added Successfully");
            }
            if (result.hasErrors() && "".equalsIgnoreCase(addkeywords.getTenderKeyWordsName())) {
                addKeywordList = keywordDAO.fetchAllTenderKeywordbyDept_ID(deptID);
                return gson.toJson(addKeywordList);
            }
            List<TenderCategory> categoryList = categoryDAO.fetchAll();
            msg = keywordDAO.getDuplicateAddKeyword(addkeywords, deptID);//calling getDuplicateCategory method
            if (msg.equalsIgnoreCase("Keyword already Exist")) {
                String msg2 = "Keyword already Exist";
                return gson.toJson(msg2);
            }
            if (!msg.equalsIgnoreCase("Keyword already Exist")) {

                logs.setAuctionId(1);
                logs.setContractorId(1);
                logs.setDeptId(addkeywords.getDept_id());
                logs.setDeptUser("Naina Jain");
                logs.setDeptUserId(1);
                logs.setDscId("DSC123");
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setLogId(123);
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setOsName(logsAction.FetchOSName());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setRfqId(1);
                logs.setTenderId(1);
                logsActionDao.save(logs);

                keywordDAO.insertData(addkeywords); //FOR SAVE Keywords                 
//                addKeywordList = keywordDAO.fetchKeywordByAreaOfWork(areaofwork_id);
                msg = "Keyword Added Successfully";
                return gson.toJson(msg);
            }
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:saveKeywords");
        }
        return gson.toJson(msg);
    }

    //*************editKeyword/UpdateKeyword**************//
    @RequestMapping("/edit_Keyword")
    @ResponseBody
    public String edit_Keyword(@RequestParam Integer id, Model m) {
        
        System.out.println("**************editKeyword method run**************");
        try {

//            TenderKeyword addkeywords = keywordDAO.fetchData(id);
//            AreaOfWork addAreaOfWork = areaofworkDAO.fetchData(id);
//            Integer ID = addAreaOfWork.getTender_category_id();
//            TenderCategory addCategory = categoryDAO.fetchData(ID);
//            addkeywords.setTender_category_id(addCategory.getTender_category_id());
//            addkeywords.setTender_category_name(addCategory.getTender_category_name());
//            addkeywords.setAreaofwork_name(addAreaOfWork.getAreaofwork_name());
            
   TenderKeyword addkeywords = keywordDAO.fetchData(id);
AreaOfWork addAreaOfWork = areaofworkDAO.fetchData(addkeywords.getAreaofwork_id());
TenderCategory addCategory = categoryDAO.fetchData(addAreaOfWork.getTender_category_id());
addkeywords.setTender_category_id(addCategory.getTender_category_id());
addkeywords.setTender_category_name(addCategory.getTender_category_name());
 addkeywords.setAreaofwork_name(addAreaOfWork.getAreaofwork_name());
          
            m.addAttribute("addkeywords", addkeywords);
            return gson.toJson(addkeywords);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("*******************END****************************************");
        return null;
    }
   
//*AreaOfWorkByDeleteButton//    
    @RequestMapping("/delete_AreaofWorkKeyword")
    @ResponseBody
    public String delete_AreaofWorkKeyword(@RequestParam Integer id, Model m) {
        System.out.println("delete_AreaofWorkKeyword method run"+id); 
         
        try {
            String response="";
                 
            System.out.println("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
   AreaOfWork addkeywords = areaofworkDAO.fetchData(id);
            System.out.println("hhhhhhhhhhhhhhhhhhhhhhhh");

    boolean deleteSuccess=areaofworkDAO.removeData(addkeywords.getAreaofwork_id());
            System.out.println("DELETED ");
  if(deleteSuccess){
      System.out.println("Tender Key Word Deleted Successfully");
      response="Tender AreaOfWork Deleted Successfully";
  }
  else{
    
      response="FALSE";
  }
  
            return gson.toJson(response);
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
    }    

//delete Tender KeyWord
    @RequestMapping("/delete_Keyword")
    @ResponseBody
    public String delete_Keyword(@RequestParam Integer id, Model m) {
        System.out.println("*editKeyword method run*"+id); 
        try {
            String response="";
   TenderKeyword addkeywords = keywordDAO.fetchData(id);
            System.out.println("hhhhhhhhhhhhhhhhhhhhhhhh");
boolean deleteWord=keywordDAO.removeData(addkeywords.getTenderKeyWordsId());
            System.out.println("DELETED ");
  if(deleteWord){
      System.out.println("Tender Key Word Deleted Successfully");
      response="Tender Key Word Deleted Successfully";
  }
  else{
    
      response="FALSE";
  }
  
            
            return gson.toJson(response);
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
    }

    //*************AreaOfWorkByCatIdByAjax**************//    
    @RequestMapping("/getTenderAreaWorkByCatId")
    @ResponseBody //to convert JSON Data into String Format taking as response from controller to jsp
    public String getTenderAreaWorkByCatId(@RequestParam Integer tender_category_id) {
        System.out.println("################## Inside getTenderAreaWorkByCatId ##################  " + tender_category_id);
        try {
            List<AreaOfWork> areaofworkList = new ArrayList<AreaOfWork>();
            Session s = sessionFactory.openSession();
            Query query = s.createQuery("from AreaOfWork where tender_category_id =:tender_category_id");
            query.setParameter("tender_category_id", tender_category_id);
            areaofworkList = query.list();
            System.out.println();
            for (AreaOfWork t : areaofworkList) {
                if (tender_category_id == t.getTender_category_id()) {
                    AreaOfWork.put(t.getAreaofwork_id(), t.getAreaofwork_name());
                }
                System.out.println(t.getTender_category_id());
            }

            return gson.toJson(areaofworkList);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:getTenderAreaWorkByCatId");
            ex.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/viewAllAreaOfWork")
    @ResponseBody
    public List<AreaOfWork> viewAllAreaOfWork(Model m,HttpSession session) {
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAllAreaOfWorkbyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("areaofworkList", areaofworkList);
        return areaofworkList;
    }
    
   @RequestMapping("/viewAllTenderKeyword")
    @ResponseBody
    public String viewAllTenderKeyword(Model m,HttpSession session) {          
        List<TenderKeyword> addKeywordList = keywordDAO.fetchAllTenderKeywordbyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("addKeywordList", addKeywordList);
        return gson.toJson(addKeywordList);
    }
    
   @RequestMapping("/viewAllTenderCategoryData")
    public String viewAllTenderCategoryData(Model m) {    
        List<TenderCategory> categoryList = categoryDAO.fetchAll();
        m.addAttribute("categoryList", categoryList); 
   m.addAttribute("msgTenderCategory", "List Of Tender Category");      
        return "DepartmentAdmin/viewAllData";
    }
    
   @RequestMapping("/viewAllAreaOfWorkData")
    public String viewAllAreaOfWorkData(Model m,HttpSession session) {    
        List<AreaOfWork> areaofworkList = areaofworkDAO.fetchAllAreaOfWorkbyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("areaofworkList", areaofworkList);      
   m.addAttribute("msgAreaOfWork", "List Of Area Of Work");      
        return "DepartmentAdmin/viewAllData";
    }
    
   @RequestMapping("/viewAllKeywordData")
    public String viewAllKeywordData(Model m,HttpSession session) {    
       List<TenderKeyword> addKeywordList = keywordDAO.fetchAllTenderKeywordbyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("addKeywordList", addKeywordList);   
        m.addAttribute("msgKeyword", "List Of Tender Keyword");   
        return "DepartmentAdmin/viewAllData";
    }
  

}
