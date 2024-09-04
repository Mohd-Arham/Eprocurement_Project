package com.eproc.controller;

import com.eproc.daoImpl.DesignationDaoImpl;
import com.eproc.domain.Designation;
import com.eproc.domain.Logs;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.DesignationModel;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author Mansi Jain
 * @since 18 june 2018
 * @version 2.0.0
 */
@Controller
public class DesignationController {

    @Autowired
    DesignationDaoImpl designationdao;
@Autowired
     LogsActionDao logsActionDao;
     @Autowired
     LogsAction logsAction;
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for circle");
        binder.setValidator(new DesignationModel());
    }

    @RequestMapping("/manageDesignation")
    public String manageDesignation(Model m,HttpSession session) {
        System.out.println("Manage Desigantion Here");
        m.addAttribute("designation", new Designation());
        List<Designation> designationList = designationdao.fetchAllbyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("designationList", designationList);
        return "DepartmentAdmin/Designation";
    }

    @RequestMapping("/saveDesignation")
    public String saveDesignation(@ModelAttribute("designation") @Validated Designation designation, BindingResult result, Model m,
            HttpServletRequest request,HttpSession session) {
        System.out.println("..........call saveDesigantion Controller............");
        Logs logs = new Logs();
      Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
            
        if (result.hasErrors()) {
            System.out.println("****************validate******************");
            return "DepartmentAdmin/Designation";
        }
       designation.setDept_Id(deptID);
        designationdao.insertData(designation);
        
        logs.setActivity("Designation Add Activity");
        logs.setHeadingMsg("Designation Master Log");
        logs.setLogMessage(designation.getDesignation() + " Designation Added Successfully");
        logs.setAuctionId(12);
            logs.setContractorId(11);
            logs.setDeptId(6);
            logs.setDeptUser("Mansi Jain");
            logs.setDeptUserId(7);
            logs.setDscId("105");
            logs.setStatus("enable");
            logs.setLogId(8);
            logs.setRfqId(9);
            logs.setTenderId(10);
            logs.setIpAddress(logsAction.fetchIpAddress());
            logsAction.FetchOSName();
            logs.setOsName(logsAction.FetchOSName());
        try {
            logs.setMacAddress(logsAction.fetchMacAddress());
        } catch (Exception ex) {
            Logger.getLogger(DesignationController.class.getName()).log(Level.SEVERE, null, ex);
        }
            logs.setBrowserName(logsAction.getClientBrowser(request));
            System.out.println("Date And Time:-" + logs.getDateTime());
        logsActionDao.save(logs); 
        List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptID);
        m.addAttribute("designationList", designationList);
        return "DepartmentAdmin/Designation";
    }

    @RequestMapping("/EditDesignation")
    public String editDesignation(@RequestParam Integer id, Model m, RedirectAttributes ra,HttpSession session) {
        System.out.println("................call editDesignation Controller......................");
        Designation designation = designationdao.fetchData(id);
         m.addAttribute("designation", designation);
        designationdao.insertData(designation);
        // ra.addFlashAttribute("mesg", "designation update successfully");
         Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
        List<Designation> designationList = designationdao.fetchAllbyDept_ID(deptID);
        m.addAttribute("designationList", designationList);
        return "DepartmentAdmin/Designation";
    }
}
