/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.CircleDAOImpl;
import com.eproc.daoImpl.DivisionDAOImpl;
import com.eproc.daoImpl.SubDivisionDAOImpl;
import com.eproc.domain.Circle;
import com.eproc.domain.Division;
import com.eproc.domain.Logs;
import com.eproc.domain.SubDivision;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.CircleModel;
import com.eproc.model.DivisionModel;
import com.eproc.model.SubDivisionModel;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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

/**
 *
 * @author Mansi Jain
 */
@Controller

public class CircleDivisionSubDivisionController {
    
    @Autowired
    CircleDAOImpl circleDao;
    @Autowired
    DivisionDAOImpl Divisiondao;
    @Autowired
    SubDivisionDAOImpl subDivisionDao;
    @Autowired
    SessionFactory sessionfactory;
    @Autowired
    GsonUtility gsonutility;
    
    @Autowired
    LogsAction logsAction;
    
    @Autowired
    LogsActionDao logsActionDao;
    
    Logs logs = new Logs();
    
    Gson gson = new Gson();

    /*
     *  initBinder 
     * Method used to apply the server side validation 
     * @param binder
     * @return CircleDivisionSubDivision.jsp
     */
//    @InitBinder("circle")
//    protected void initCircleBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method for circle");
//        binder.setValidator(new CircleModel());
//    }
//    
//    @InitBinder("division")
//    protected void initDivisionBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method for Division");
//        binder.setValidator(new DivisionModel());
//    }
//    
//    @InitBinder("subdivision")
//    protected void initSubDivisionBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method for SubDivision");
//        binder.setValidator(new SubDivisionModel());
//    }

    /*manageController
     * Method used to manage circle,Division and subdivision
     * @param ModelAttribute
     */
    @RequestMapping("/circledivisionsubdivision")
    public String manageController(Model m, @ModelAttribute("circle") Circle circle, @ModelAttribute("division") Division division, @ModelAttribute("subdivision") SubDivision subdivision
    ,HttpSession session) {
        System.out.println("---------------- Welcome in controller----------");
        try {
            List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID((Integer) session.getAttribute("deptId"));
            m.addAttribute("circleList", circleList);
            m.addAttribute("circle", new Circle());
            System.out.println(".................division list..................");
            List<Division> divisionList = Divisiondao.fetchAllbyDept_ID((Integer) session.getAttribute("deptId"));
            m.addAttribute("divisionList", divisionList);
            m.addAttribute("division", new Division());
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionsubDivisionController");
            System.out.println("Exception in circledivisionsubdivision controller" + ex.getMessage());
        }
        return "DepartmentAdmin/CircleDivisionSubDivision";
    }
    
    @RequestMapping("/allCircles")
    public String allCircles(Model m, @ModelAttribute("circle") Circle circle,HttpSession session) {
        System.out.println("---------------- Welcome in controller----------");
        try {
            List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID((Integer) session.getAttribute("deptId"));
            m.addAttribute("circleList", circleList);
            m.addAttribute("circle", new Circle());
            m.addAttribute("msg11", "List of all Circles");
            System.out.println(".................Circle list..................");
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionsubDivisionController");
            System.out.println("Exception in circledivisionsubdivision controller" + ex.getMessage());
        }
        return "DepartmentAdmin/viewAllData";
    }
    
    @RequestMapping("/allDivisions")
    public String allDivisions(Model m, @ModelAttribute("division") Division division,HttpSession session) {
        System.out.println("---------------- Welcome in controller----------");
        try {
            List<Division> divisionList = Divisiondao.fetchAllbyDept_ID((Integer) session.getAttribute("deptId"));
            m.addAttribute("divisionList", divisionList);
            m.addAttribute("division", new Division());
            m.addAttribute("msg12", "List of all Divisions");
            System.out.println(".................division list..................");
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionsubDivisionController");
            System.out.println("Exception in circledivisionsubdivision controller" + ex.getMessage());
        }
        return "DepartmentAdmin/viewAllData";
    }
    
    @RequestMapping("/allSubDivisions")
    public String allSubDivisions(Model m, @ModelAttribute("subdivision") SubDivision subdivision,HttpSession session) {
        System.out.println("---------------- Welcome in controller----------");
        try {
            List<SubDivision> subdivisionList = subDivisionDao.fetchAllbyDept_ID((Integer) session.getAttribute("deptId"));
            m.addAttribute("subdivisionList", subdivisionList);
            m.addAttribute("subdivision", new SubDivision());
            m.addAttribute("msg13", "List of all SubDivisions");
            System.out.println(".................subdivision list..................");
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionsubDivisionController");
            System.out.println("Exception in circledivisionsubdivision controller" + ex.getMessage());
        }
        return "DepartmentAdmin/viewAllData";
    }

    /*saveCircle
     * Method used to insert circle into Database
     * @param ModelAttribute
     */
    @RequestMapping(value = "/savecircleModel")
    @ResponseBody
    public String saveCircle(@ModelAttribute("circle") @Validated Circle circle, BindingResult result, @ModelAttribute("division") Division division, @ModelAttribute("subdivision") SubDivision subdivision, Model m,
            @RequestParam Integer circleid, HttpServletRequest request, HttpSession session) {
        System.out.println("----------------in controller savecircleModel-----------------");
        Logs logs = new Logs();
        if (circleid != null) {
            circle.setCircleid(circleid);
            Circle c = circleDao.fetchData(circleid);
            logs.setActivity("Circle Update Activity");
            logs.setHeadingMsg("Circle Master Log");
            logs.setLogMessage(c.getCircle() + " Updated Successfully with " + circle.getCircle());
        } else {
            logs.setActivity("Circle Save Activity");
            logs.setHeadingMsg("Circle Master Log");
            logs.setLogMessage(circle.getCircle() + " Circle Added Successfully");
        }
        Gson gson = new Gson();
        List<Circle> circleList = null;
        try {
            
            if (result.hasErrors()) {
                System.out.println("****************validate******************");
                return "CircleDivisionSubDivision";
            }
            
            Date date = new Date();
            circle.setCreated_Date(date);
            Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
            
            String message = "";
            message = circleDao.checkDuplicateValue(circle, deptID);
            if (!message.equalsIgnoreCase("Duplicate Circle Name") && !message.equalsIgnoreCase("Enter Circle Name")) {
                circle.setDept_Id(deptID);
                circleDao.insertData(circle);
                
                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setStatus("enable");
                logs.setOsName(logsAction.FetchOSName());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setMacAddress(logsAction.fetchMacAddress());
                logsActionDao.save(logs);
                String msg = "Circle Added Successfully";
                return gson.toJson(msg);
            } else if (message.equals("Duplicate Circle Name")) {
//                ra.addFlashAttribute("msg2", "Circle is Alredy Exists");
//                return "redirect:/circledivisionsubdivision";
                String msg2 = "Circle Already Exist";
                return gson.toJson(msg2);
            } else if (message.equals("Enter Circle Name")) {
//                ra.addFlashAttribute("msg2", "Please Enter Circle name");
//                return "redirect:/circledivisionsubdivision";
                String msg2 = "Please Enter Circle name";
                return gson.toJson(msg2);
            }
            circleList = circleDao.fetchAllCirclebyDept_ID((Integer) session.getAttribute("deptId"));
            
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionSubDivision_Controller");
            System.out.println("Exception in saveCircle controller" + ex.getMessage());
        }
        System.out.println("----------------End savecircleModel Controller-----------------");
        return gson.toJson(circleList);
    }

    /*saveDivision
     * Method used to insert Division into Database
     * @param ModelAttribute
     */
    @RequestMapping(value = "/savedivision")
    @ResponseBody
    public String saveDivision(@ModelAttribute("division") @Validated Division division, BindingResult result, @ModelAttribute("circle") Circle circle, @ModelAttribute("subdivision") SubDivision subdivision, Model m,
            @RequestParam Integer division_id, @RequestParam Integer circleid, HttpServletRequest request,HttpSession session) {
        System.out.println("---------------in controller saveDivision-----------------");
        
        System.out.println("Circleid is::" + circleid);
        System.out.println("Divisionid is@@" + division_id);
        System.out.println("The Division: " + division.getDivision() + "Division ID: " + division.getDivision_id());
        
        if (division_id != null) {
            division.setDivision_id(division_id);
            Division d = Divisiondao.fetchData(circleid);
            logs.setActivity("Division Update Activity");
            logs.setHeadingMsg("Division Master Log");
            logs.setLogMessage(d.getDivision() + " Division Updated Successfully with " + division.getDivision());
        } else {
            logs.setActivity("Division Save Activity");
            logs.setHeadingMsg("Division Master Log");
            logs.setLogMessage(division.getDivision() + "Division Added Successfully");
        }
        Gson gson = new Gson();
          Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
        List<Division> divisionList = null;
        try {
            if (result.hasErrors()) {
                System.out.println("****************validate Division******************");
                return "CircleDivisionSubDivision";
            }
            
            Date date = new Date();
            division.setCreated_Date(date);
            division.setDept_Id(deptID);
//            circle = circleDao.fetchData(division.getCircleid());
//            division.setCircle(circle.getCircle());

            String message = "";
            message = Divisiondao.checkDuplicateValue(division);
            if (!message.equalsIgnoreCase("Duplicate Division Name") && !message.equalsIgnoreCase("Enter Division Name")) {
                Divisiondao.insertData(division);
//                ra.addFlashAttribute("msg", "Division Added Successfully");

                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setStatus("enable");
                logs.setOsName(logsAction.FetchOSName());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setMacAddress(logsAction.fetchMacAddress());
                logsActionDao.save(logs);
                String msg = "Division Added Successfully";
                return gson.toJson(msg);
            } else if (message.equals("Duplicate Division Name")) {
//                ra.addFlashAttribute("msg2", "Division is Alredy Exists");
//                return "redirect:/circledivisionsubdivision";
                String msg2 = "Division Already Exist";
                return gson.toJson(msg2);
            } else if (message.equals("Enter Division Name")) {
//                ra.addFlashAttribute("msg2", "Please Enter Division name");
//                return "redirect:/circledivisionsubdivision";
                String msg2 = "Please Enter Division name";
                return gson.toJson(msg2);
            }
            divisionList = Divisiondao.fetchDivision(circleid);
            System.out.println("Division Id::" + division.getDivision_id());
            
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionSubDivisionController");
            System.out.println("Exception in saveDivision Controller::" + ex.getMessage());
            ex.printStackTrace();
        }
        return gson.toJson(divisionList);
    }

    /*saveSubDivision
     * Method used to insert SubDivision into Database
     * @param ModelAttribute
     */
    @RequestMapping(value = "/savesubdivision")
    @ResponseBody
    public String saveSubDivision(@ModelAttribute("subdivision") @Validated SubDivision subdivision, BindingResult result, @ModelAttribute("circle") Circle circle, @ModelAttribute("division") Division division, Model m,
            @RequestParam Integer subdivision_id, @RequestParam Integer division_id, HttpServletRequest request,HttpSession session) {
        System.out.println("-------------in controller savesubdivision----------------");
        System.out.println("SubdivisionId::" + subdivision_id);
        System.out.println("DivisionId::" + division_id);
        System.out.println("Division id%%%" + subdivision.getDivision_id());
        
        if (result.hasErrors()) {
            System.out.println("****************validate SubDivision******************");
            return "CircleDivisionSubDivision";
        }
        
        if (subdivision_id != null) {
            subdivision.setSubdivision_id(subdivision_id);
            SubDivision s = subDivisionDao.fetchData(subdivision_id);
            logs.setActivity("SubDivision Update Activity");
            logs.setHeadingMsg("SubDivision Master Log");
            logs.setLogMessage(s.getCircle() + " SubDivision Updated Successfully " + subdivision.getSubdivision());
        } else {
            logs.setActivity("SubDivision Save Activity");
            logs.setHeadingMsg("SubDivision Master Log");
            logs.setLogMessage(subdivision.getSubdivision() + " SubDivision Added Successfully");
        }
        Gson gson = new Gson();
          Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
        List<SubDivision> subdivisionList = null;
        try {
            Date date = new Date();
            subdivision.setCreated_Date(date);
            subdivision.setDeptId(deptID);
            circle = circleDao.fetchData(subdivision.getCircleid());
            System.out.println("The Circle is: " + circle.getCircle());
            subdivision.setCircle(circle.getCircle());
            System.out.println("The circle in subdivision: " + subdivision.getCircle());
            division = (Division) Divisiondao.fetchData(subdivision.getDivision_id());
            System.out.println("The Division is: " + division.getDivision());
            subdivision.setDivision(division.getDivision());
            
            String message = "";
            message = subDivisionDao.checkDuplicateValue(subdivision);
            if (!message.equalsIgnoreCase("Duplicate Subdivision Name")) {
                subDivisionDao.insertData(subdivision);
//                ra.addFlashAttribute("msg", "SubDivision Added Successfully");

                logs.setIpAddress(logsAction.fetchIpAddress());
                logs.setStatus("enable");
                logs.setOsName(logsAction.FetchOSName());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                logs.setMacAddress(logsAction.fetchMacAddress());
                logsActionDao.save(logs);
                String msg = "SubDivision Added Successfully";
                return gson.toJson(msg);
            } else if (message.equals("Duplicate Subdivision Name")) {
//                ra.addFlashAttribute("msg2", "Subdivision is Alredy Exists");
//                return "redirect:/circledivisionsubdivision";
                String msg2 = "Subdivision Already Exist";
                return gson.toJson(msg2);
            } else if (message.equals("Enter Subdivision Name")) {
//                ra.addFlashAttribute("msg2", "Please Enter Subdivision name");
//                return "redirect:/circledivisionsubdivision";
                String msg2 = "Please Enter Subdivision name";
                return gson.toJson(msg2);
            }
            subdivisionList = subDivisionDao.fetchSubDivision(division_id);
        } catch (Exception ex) {
            System.out.println("class:CircleDivisionSubDivisionController");
            System.out.println("Exception in saveSubDivision Controller" + ex.getMessage());
            ex.printStackTrace();
        }
        return gson.toJson(subdivisionList);
    }

    /*getCircleByAjax
     * Method used to get circleList by ajax
     * @param Model
     */
    @RequestMapping(value = "/getCircleByAjax")
    @ResponseBody
    public List<Circle> getCircleByAjax(Model m,HttpSession session) {
        System.out.println(".................getCircleByAjax Controller.............");
        List<Circle> circleList = circleDao.fetchAllCirclebyDept_ID((Integer) session.getAttribute("deptId"));
        return circleList;
    }
    
    @RequestMapping(value = "/getAllDivisions")
    @ResponseBody
    public List<Division> getAllDivisions(Model m,HttpSession session) {
        System.out.println(".................getCircleByAjax Controller.............");
        List<Division> divisionList = Divisiondao.fetchAllbyDept_ID((Integer) session.getAttribute("deptId"));
        return divisionList;
    }
    
    @RequestMapping(value = "/getAllSubDivisions")
    @ResponseBody
    public List<SubDivision> getAllSubDivisions(Model m,HttpSession session) {
        System.out.println(".................getCircleByAjax Controller.............");
        List<SubDivision> subdivisionList = subDivisionDao.fetchAllbyDept_ID((Integer) session.getAttribute("deptId"));
        return subdivisionList;
    }

    /*getDivisionByAjax
     * Method used to get division corresponding it's circle
     * @param id
     */
    @RequestMapping(value = "/getDivisionByAjax", method = RequestMethod.GET)
    @ResponseBody
    public String getDivisionByAjax(@RequestParam Integer circleid) throws IOException {
        System.out.println("...............getDivisionByAjax controller................");
        System.out.println("circle Id@@" + circleid);
        List<Division> divisionList = Divisiondao.fetchDivision(circleid);
        Gson gson = new Gson();
        String response = gson.toJson(divisionList);
        gsonutility.writeData(response);
        return response;
    }


    /*getSubDivisionByAjax
     * Method used to get SubDivision corresponding it's division
     * @param id
     */
    @RequestMapping(value = "/getSubDivisionByAjax")
    @ResponseBody
    public String getSubDivisionByAjax(@RequestParam Integer division_id) throws IOException {
        System.out.println("................getSubDivisionByAjax controller.................");
        System.out.println("DivisionID::" + division_id);
        List<SubDivision> subdivisionList = subDivisionDao.fetchSubDivision(division_id);
        Gson gson = new Gson();
        String response = gson.toJson(subdivisionList);
        gsonutility.writeData(response);
        return response;
    }

    /*editDivision
     * Method used to update Division
     * @param id
     */
    @RequestMapping("/editCircle")
    @ResponseBody
    public Circle editCircle(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit Circle-----------------------------------");
        Circle circle = null;
        try {
            circle = circleDao.fetchData(id);
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:circledivisionsubdivision Controller\nMethod:editCircle");
            ex.printStackTrace();
        }
        System.out.println("---------------------------Method End to edit Circle-----------------------------------");
        return circle;
    }

    /*editDivision
     * Method used to update Division
     * @param id
     */
    @RequestMapping("/editDivision")
    @ResponseBody
    public Division editDivision(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit Division-----------------------------------");
        Division division = null;
        try {
            division = Divisiondao.fetchData(id);
            Integer c_id = division.getCircleid();
            
            Circle circle = circleDao.fetchData(c_id);
            System.out.println("Circle Name::::" + circle.getCircle());
            division.setCircle(circle.getCircle());
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:circledivisionsubdivision Controller\nMethod:editDivision");
        }
        System.out.println("---------------------------Method End to edit Division-----------------------------------");
        return division;
        
    }

    /*editSubDivision
     * Method used to update SubDivision
     * @param id
     */
    @RequestMapping("/editSubDivision")
    @ResponseBody
    public SubDivision editSubDivision(@RequestParam Integer id) {
        System.out.println("---------------------------Method called to edit SubDivision-----------------------------------");
        SubDivision subdivision = null;
        try {
            
            subdivision = subDivisionDao.fetchData(id);
            Division division = Divisiondao.fetchData(subdivision.getDivision_id());
            Integer ID = division.getCircleid();
            Circle circle = circleDao.fetchData(ID);
            subdivision.setCircleid(circle.getCircleid());
            subdivision.setCircle(circle.getCircle());

            //Integer ID1=subdivision.getDivision_id();
            // Divisiondao.fetchData(ID1);
            subdivision.setDivision(division.getDivision());
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:circledivisionsubdivision Controller\nMethod:editSubDivision");
        }
        System.out.println("---------------------------Method End to edit SubDivision-----------------------------------");
        return subdivision;
    }
    
    //delete SubDivision
     @RequestMapping("/delete_SubDivision")
    @ResponseBody
    public String delete_SubDivision(@RequestParam Integer id, Model m) {
        System.out.println("editKeyword method run"+id); 
        try {
             String response="";
             boolean s=subDivisionDao.removeData(id);
             if(s){
                 System.out.println("STATE DELETED");
                 response="Sub Division Word Deleted Successfully";
             }
             else{
                 System.out.println("STATE NOT DELETED");
                  response="FALSE";
                        
             }
                response="Sub Division Word Deleted Successfully";
            return gson.toJson(response);
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
}
    
     //delete Division
     @RequestMapping("/delete_Division")
    @ResponseBody
    public String delete_Division(@RequestParam Integer id, Model m) {
        System.out.println("editKeyword method run"+id); 
        try {
             String response="";
             List<SubDivision> list=new ArrayList<>();
             
             list=subDivisionDao.fetchSubDivision(id);
         
             for(SubDivision div:list){
                   boolean s=subDivisionDao.removeDataList(div);
             if(s){
                 System.out.println("SUB DIVISION DELETED");
                 boolean d=Divisiondao.removeData(id);
             if(d){
                 System.out.println("DIVISION DELETED");
                 response="DIVISION Word Deleted Successfully";
             }
             else{
                 System.out.println("STATE NOT DELETED");
                  response="FALSE";
                        
             }
             }
             else{
                 System.out.println("STATE NOT DELETED");
                 
                        
             }
             
            }
          
           
                response="DIVISION Word Deleted Successfully";
            return gson.toJson(response);
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
}
}
