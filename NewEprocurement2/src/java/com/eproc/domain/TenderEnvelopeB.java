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
@Table(name = "tenderenvelopeb")
public class TenderEnvelopeB {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tender_EnvelopeA_Id")
    private int tender_EnvelopeA_Id;
    
    @Column(name = "tender_EnvelopeA_SequnceId")
    private int tender_EnvelopeA_SequnceId;
    
    @Column(name = "tender_EnvelopeAName_Id")
    private int tender_EnvelopeAName_Id;
        
    @Column(name = "officerForEnvelopeA")
    private String officerForEnvelopeA;
    
    @Column(name = "envelopeATemplateName")
    private String envelopeATemplateName;
    
    @Column(name = "labelNameA")
    private String labelNameA;
    
    @Column(name = "labelTypeA")
    private String labelTypeA;
    
    @Column(name = "labelMandatoryA")
    private String labelMandatoryA;

    @Column(name = "deptId")
    private String deptId;
    
    @Transient
    private List<String> tender_EnvelopeA_SequnceIdList;
    
    @Transient
    private List<String> labelNameAList;
    
    @Transient
    private List<String> labelTypeAList;
    
    @Transient
    private List<String> labelMandatoryAList;

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

    public List<String> getLabelNameAList() {
        return labelNameAList;
    }

    public void setLabelNameAList(List<String> labelNameAList) {
        this.labelNameAList = labelNameAList;
    }

    public List<String> getLabelTypeAList() {
        return labelTypeAList;
    }

    public void setLabelTypeAList(List<String> labelTypeAList) {
        this.labelTypeAList = labelTypeAList;
    }

    public List<String> getLabelMandatoryAList() {
        return labelMandatoryAList;
    }

    public void setLabelMandatoryAList(List<String> labelMandatoryAList) {
        this.labelMandatoryAList = labelMandatoryAList;
    }
    
    public int getTender_EnvelopeA_Id() {
        return tender_EnvelopeA_Id;
    }

    public void setTender_EnvelopeA_Id(int tender_EnvelopeA_Id) {
        this.tender_EnvelopeA_Id = tender_EnvelopeA_Id;
    }

    public int getTender_EnvelopeA_SequnceId() {
        return tender_EnvelopeA_SequnceId;
    }

    public void setTender_EnvelopeA_SequnceId(int tender_EnvelopeA_SequnceId) {
        this.tender_EnvelopeA_SequnceId = tender_EnvelopeA_SequnceId;
    }

    public String getOfficerForEnvelopeA() {
        return officerForEnvelopeA;
    }

    public void setOfficerForEnvelopeA(String officerForEnvelopeA) {
        this.officerForEnvelopeA = officerForEnvelopeA;
    }

    public String getEnvelopeATemplateName() {
        return envelopeATemplateName;
    }

    public void setEnvelopeATemplateName(String envelopeATemplateName) {
        this.envelopeATemplateName = envelopeATemplateName;
    }

    public String getLabelNameA() {
        return labelNameA;
    }

    public void setLabelNameA(String labelNameA) {
        this.labelNameA = labelNameA;
    }

    public String getLabelTypeA() {
        return labelTypeA;
    }

    public void setLabelTypeA(String labelTypeA) {
        this.labelTypeA = labelTypeA;
    }

    public String getLabelMandatoryA() {
        return labelMandatoryA;
    }

    public void setLabelMandatoryA(String labelMandatoryA) {
        this.labelMandatoryA = labelMandatoryA;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public int getTender_EnvelopeAName_Id() {
        return tender_EnvelopeAName_Id;
    }

    public void setTender_EnvelopeAName_Id(int tender_EnvelopeAName_Id) {
        this.tender_EnvelopeAName_Id = tender_EnvelopeAName_Id;
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
    
    
}
