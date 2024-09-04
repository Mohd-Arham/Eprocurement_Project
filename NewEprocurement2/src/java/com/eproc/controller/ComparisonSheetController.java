/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.domain.ComparisonSheet;
import com.eproc.service.ComparisonSheetService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author lincpay Solutions
 */
@Controller
public class ComparisonSheetController {
    
    @Autowired
    private ComparisonSheetService sheetDao;
    
    @RequestMapping(value = "saveComparisonSheetData", method = RequestMethod.POST)
    public ResponseEntity<Integer> saveData(@RequestBody ComparisonSheet sheetData) {
        
         System.out.println("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
         System.out.println("This is Sheet Data"+sheetData.toString());
        return ResponseEntity.ok(sheetDao.saveData(sheetData));
    }
    @RequestMapping(value = "/getDataByTenderId/{tenderId}", method = RequestMethod.GET)
    public ResponseEntity<List> getData(@PathVariable  Integer tenderId,HttpSession session) {
        Integer departmentUserId = (int) session.getAttribute("deptUserId");
        return ResponseEntity.ok(sheetDao.getAllByTenderId(tenderId,departmentUserId));
    }
}
