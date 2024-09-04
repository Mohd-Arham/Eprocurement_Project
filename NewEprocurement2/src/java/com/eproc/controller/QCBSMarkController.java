/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dao.QCBSMarkTemplateDao;
import com.eproc.dao.QCBSTemplateDao;
import com.eproc.domain.QCBSMarkTemplate;
import com.eproc.domain.QCBSTemplate;
import com.eproc.domain.QCBSTemplateDTO;
import com.eproc.logs.LogsAction;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author shashank Shukla
 */
@Controller
public class QCBSMarkController {

    @Autowired
    QCBSTemplateDao qcbsTemplateDao;
    @Autowired
    QCBSMarkTemplateDao qcbsMarkTemplateDao;

    QCBSTemplate template = new QCBSTemplate();
    QCBSMarkTemplate qCBSMarkTemplate = new QCBSMarkTemplate();
    private Integer qcbsTenderId;
    private String stqcJsonData;
    private String qcbsTemplateId;

    //Save or Update Mark template after filling details
    @RequestMapping("/SaveorUpdateMarkTemplate")
    public String saveorUpdateMarkTemplate(@RequestParam String markTemplate,
            @RequestParam String qcbsTemplateId, @RequestParam String markTemplateId, @RequestParam Integer markId) {
        boolean bidStatus = false;
        int deptID = 0;
        int tenderID = 0;
        int contractorId = 0;
        String dscId = null;
        String dateTime = null;
        String ipAddress = null;
        LogsAction logsAction = new LogsAction();
        System.out.println("Template Id is : " + markTemplateId);
        System.out.println("Tender Id is   : " + qcbsTemplateId);
        System.out.println("markTemplate is   : " + markTemplate);
        System.out.println("Mark Template Id Is IN SAve OR Update  " + markId);
//      System.out.println("Mark Template Data : " + markTemplate.getMarkTemplate());
        String fileJson = null;
        String status = null;
        try {
            if (markTemplate != null) {
                template = qcbsTemplateDao.fetchQCBSTemplateByTenderId(qcbsTemplateId);
                System.out.println("In markTemplate is ::::::::   " + template);

                qCBSMarkTemplate.setMarkTemplate(markTemplate);
                qCBSMarkTemplate.setTenderId(template.getTenderId());
                qCBSMarkTemplate.setTemplateId(markTemplateId);
                qCBSMarkTemplate.setMarkTemplateId(markId);
                qCBSMarkTemplate.setDeptId(template.getDeptId());
                qCBSMarkTemplate.setUserId(template.getUserId());
                qCBSMarkTemplate.setContractorId("1");
                status = qcbsMarkTemplateDao.saveorUpdateMarkTemplate(qCBSMarkTemplate);
                System.out.println("Insaid Save Method--   " + status);
                String message = "Data Saved Successfully";
                dateTime = new Date().toString();
                ipAddress = logsAction.fetchIpAddress();

                fileJson = new Gson().toJson(status);

            }
            return "DepartmentUser/Tiles/QCBSMarkTemplatePlug";
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return fileJson;
    }

    @RequestMapping("/editPrebidQCBS")
    public String viewMarkTemplateWithoutAjax(Model m, @RequestParam String qcbsTender) {
        System.out.println("Enterd into edit qcbs prebid        " + qcbsTender);
        QCBSMarkTemplate markTemplate = null;
        List<QCBSTemplateDTO> templateList = new ArrayList<>();
        String template = "";
        System.out.println("Tender Id Is-------   " + stqcJsonData);
        try {
            markTemplate = qcbsMarkTemplateDao.fetchMarkTemplate(qcbsTender);
            System.out.println("SHASHANK SHUKLA   " + markTemplate.getTenderId());
            System.out.println("MarkTemplate : " + markTemplate.getMarkTemplate());
            System.out.println("Mark Template Id Is :::   " + markTemplate.getMarkTemplateId());
            templateList = qcbsTemplateDao.prepareQCBSTemplateData2(markTemplate.getMarkTemplate());
            System.out.println("dtotemplateList     " + templateList);

            for (Iterator<QCBSTemplateDTO> iterator = templateList.iterator(); iterator.hasNext();) {
                QCBSTemplateDTO next = iterator.next();
                System.out.println("  sk   " + next.getCriteria());
                System.out.println(" selected option is        " + next.getSelected());
            }
            qcbsTemplateId = markTemplate.getTenderId();
            qcbsTenderId = Integer.parseInt(markTemplate.getTemplateId());
            int markTemplateId = markTemplate.getMarkTemplateId();
            m.addAttribute("dtotemplateList", templateList);
            m.addAttribute("qcbsTemplateId", qcbsTemplateId);
            m.addAttribute("qcbsTenderId", qcbsTenderId);
            m.addAttribute("markTemplateId", markTemplateId);
            System.out.println("----------Puri List--------------    " + markTemplateId + "" + qcbsTenderId + " " + qcbsTemplateId + templateList.toString());
        } catch (Exception e) {

            e.printStackTrace();
        }
        return "DepartmentUser/Tiles/QCBSMarkTemplatePlug";
    }

}
