/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * <h1>TenderEnvelopeB</h1>
 * <p>This program handle the parameter of tender envelope B</p>
 * 
 * @author Gaurav Dubey
 * @since 28 Aug 2018
 * @version 2.0.0
 */
@Entity
@Table(name = "tenderenvelopec")
public class TenderEnvelopeC {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tender_EnvelopeC_Id")
    private int tender_EnvelopeC_Id;
    
    @Column(name = "tender_EnvelopeC_SequnceId")
    private int tender_EnvelopeC_SequnceId;
    
    @Column(name = "tender_EnvelopeCName_Id")
    private int tender_EnvelopeCName_Id;
        
    @Column(name = "officerForEnvelopeC")
    private String officerForEnvelopeC;
    
    @Column(name = "envelopeCTemplateName")
    private String envelopeCTemplateName;
    
    @Column(name = "deptId")
    private String deptId;

    public int getTender_EnvelopeC_Id() {
        return tender_EnvelopeC_Id;
    }

    public void setTender_EnvelopeC_Id(int tender_EnvelopeC_Id) {
        this.tender_EnvelopeC_Id = tender_EnvelopeC_Id;
    }

    public int getTender_EnvelopeC_SequnceId() {
        return tender_EnvelopeC_SequnceId;
    }

    public void setTender_EnvelopeC_SequnceId(int tender_EnvelopeC_SequnceId) {
        this.tender_EnvelopeC_SequnceId = tender_EnvelopeC_SequnceId;
    }

    public int getTender_EnvelopeCName_Id() {
        return tender_EnvelopeCName_Id;
    }

    public void setTender_EnvelopeCName_Id(int tender_EnvelopeCName_Id) {
        this.tender_EnvelopeCName_Id = tender_EnvelopeCName_Id;
    }

    public String getOfficerForEnvelopeC() {
        return officerForEnvelopeC;
    }

    public void setOfficerForEnvelopeC(String officerForEnvelopeC) {
        this.officerForEnvelopeC = officerForEnvelopeC;
    }

    public String getEnvelopeCTemplateName() {
        return envelopeCTemplateName;
    }

    public void setEnvelopeCTemplateName(String envelopeCTemplateName) {
        this.envelopeCTemplateName = envelopeCTemplateName;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getFieldValueOfContractor() {
        return fieldValueOfContractor;
    }

    public void setFieldValueOfContractor(String fieldValueOfContractor) {
        this.fieldValueOfContractor = fieldValueOfContractor;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFieldValueInWordsOfContractor() {
        return fieldValueInWordsOfContractor;
    }

    public void setFieldValueInWordsOfContractor(String fieldValueInWordsOfContractor) {
        this.fieldValueInWordsOfContractor = fieldValueInWordsOfContractor;
    }

    public int getEnvelopeBFieldId() {
        return envelopeBFieldId;
    }

    public void setEnvelopeBFieldId(int envelopeBFieldId) {
        this.envelopeBFieldId = envelopeBFieldId;
    }
    
    @Transient
    private List<String> tender_EnvelopeA_SequnceIdList;

    //Changes for Bidding
     @Transient
    private String fieldValueOfContractor;
    @Transient
    private String fileName;
    @Transient 
    private String fieldValueInWordsOfContractor;
     @Transient
    private int envelopeBFieldId;
     
    public List<String> getTender_EnvelopeA_SequnceIdList() {
        return tender_EnvelopeA_SequnceIdList;
    }

    public void setTender_EnvelopeA_SequnceIdList(List<String> tender_EnvelopeA_SequnceIdList) {
        this.tender_EnvelopeA_SequnceIdList = tender_EnvelopeA_SequnceIdList;
    }

    
}
