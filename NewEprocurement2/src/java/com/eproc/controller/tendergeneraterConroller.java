/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.TenderDaoImpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Windows7
 */

@Controller
public class tendergeneraterConroller {
  @Autowired
  TenderDaoImpl tenderDaoImpl;
    @RequestMapping("/generateTenderNo")
    @ResponseBody
    public String tendergenerater(HttpSession session) throws Exception{
//        Map tendernumber=new HashMap();
        List tendernumber=new ArrayList();
        Integer deptName=1;
        
        tendernumber=tenderDaoImpl.readAlltenderNo(deptName);
//       tendernumber1= tendernumber.values();
        
        
      
        System.out.println(" tendernumber- "+tendernumber.get(tendernumber.size() - 1));
    String surffix=(String) tendernumber.get(tendernumber.size() - 1);
    String[] numberSplit = surffix.split("-") ; 
  String newVersion = numberSplit[0] +"-"+ (Integer.parseInt(numberSplit[1])+1);

      System.out.println(" "+newVersion);   
      
    return newVersion;
    
    }
    
    @RequestMapping("/ManageDepartmentUsers")
    public String ManageDepartmentUsers(){
    
    
    return "DepartmentAdmin/ManageDepartmentUsers";
    }
    
    @RequestMapping("/DepartmentUserRegistration")
    public String DepartmentUserRegistration(){
    
    
    return "DepartmentAdmin/DepartmentUserRegistration";
    }
    
}
