/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Vaishali Gupta
 * 10-10-2018
 */


@Entity
@Table(name="decrypt_envelopeB")
public class Decrypt_envelopeB {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DecryptenvelopeBId")
    private int DecryptenvelopeBId;
    
    @Column(name = "envelopeBFieldId")
    private int envelopeBFieldId;
    
    
    @Column(name="fieldId")
    private String fieldId;
    
    
    @Column(name="fieldValue")
    private String fieldValue;
    
    
    @Column(name="fileName")
    private String fileName;
    
    
    @Column(name="convertedFileName")
    private String convertedFileName;
    
    
    @Column(name="contentType")
    private String contentType;
    
    
    @Column(name="fieldLabel")
    private String fieldLabel;
    
    @Column(name="templateName")
    private String templateName;
    
     
    @Column(name="tenderId")
    private int tenderId;
    
    @Column(name = "fieldType")
    private String fieldType;
    
    
    @Column(name="filePath")
    private String filePath;
    
    
    @Column(name="contractorId")
    private int contractorId;
    
    
    @Column(name="fieldValueOfContractor")
    private String fieldValueOfContractor;
    
    @Column(name="departmentUserId")
    private int departmentUserId;
    
    @Column(name="fieldValueOfDepartmentUser")
    private String fieldValueOfDepartmentUser;
    
    @Column(name="departmentAdminId")
    private int departmentAdminId;
    
    @Column(name="fieldValueOfDepartmentAdmin")
    private String fieldValueOfDepartmentAdmin;
    
    @Column(name="rejectRemarkEA")
    private String rejectRemarkEA;
    
    @Column(name="contractor_status")
    private String contractor_status;
    
    @Column(name="labelMandatoryA")
    private String labelMandatoryA;
    
    @Column(name="requestReject")
    private String requestReject;
    
    @Column(name="revertStatus")
    private String revertStatus;
    
    
    @Column(name="revertDate")
    private String revertDate;
    
    
    @Column(name="revertRemark")
    private String revertRemark;
    
    
    @Column(name="openStatusOfEB")
    private String openStatusOfEB;
    
    
    @Column(name="documentOpenStatus")
    private String documentOpenStatus;
    
    
    @Column(name="twoStageEAOpenStatus")
    private String twoStageEAOpenStatus;
    
    @Column(name = "tender_EnvelopeB_SequnceId")
    private int tender_EnvelopeB_SequnceId;
    
      @Column(name="fieldValueInWordsOfContractor")
    private String fieldValueInWordsOfContractor;
      
      @Column(name="fieldValueInWordsOfDepartmentUser")
    private String fieldValueInWordsOfDepartmentUser;
    
         @Column(name="fieldValueInWordsOfDepartmentAdmin")
    private String fieldValueInWordsOfDepartmentAdmin;
    
    @Transient
    private String labelTypeA;
    
    @Transient
    private String labelNameA;
    
    @Column(name="shortListed_Status")
    private String shortListed_Status;

    public int getDecryptenvelopeBId() {
        return DecryptenvelopeBId;
    }

    public void setDecryptenvelopeBId(int DecryptenvelopeBId) {
        this.DecryptenvelopeBId = DecryptenvelopeBId;
    }

    
    public Integer getEnvelopeBFieldId() {
        return envelopeBFieldId;
    }

    public void setEnvelopeBFieldId(Integer envelopeBFieldId) {
        this.envelopeBFieldId = envelopeBFieldId;
    }

   

    public String getFieldId() {
        return fieldId;
    }

    public void setFieldId(String fieldId) {
        this.fieldId = fieldId;
    }

    public String getFieldValue() {
        return fieldValue;
    }

    public void setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getConvertedFileName() {
        return convertedFileName;
    }

    public void setConvertedFileName(String convertedFileName) {
        this.convertedFileName = convertedFileName;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getFieldLabel() {
        return fieldLabel;
    }

    

    public void setFieldLabel(String fieldLabel) {
        this.fieldLabel = fieldLabel;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public int getTenderId() {
        return tenderId;
    }

    public void setTenderId(int tenderId) {
        this.tenderId = tenderId;
    }

    

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public int getContractorId() {
        return contractorId;
    }

    public void setContractorId(int contractorId) {
        this.contractorId = contractorId;
    }

    public int getDepartmentUserId() {
        return departmentUserId;
    }

    public void setDepartmentUserId(int departmentUserId) {
        this.departmentUserId = departmentUserId;
    }

    public int getDepartmentAdminId() {
        return departmentAdminId;
    }

    public void setDepartmentAdminId(int departmentAdminId) {
        this.departmentAdminId = departmentAdminId;
    }

   

    public String getFieldValueOfContractor() {
        return fieldValueOfContractor;
    }

    public void setFieldValueOfContractor(String fieldValueOfContractor) {
        this.fieldValueOfContractor = fieldValueOfContractor;
    }

  

    public String getFieldValueOfDepartmentUser() {
        return fieldValueOfDepartmentUser;
    }

    public void setFieldValueOfDepartmentUser(String fieldValueOfDepartmentUser) {
        this.fieldValueOfDepartmentUser = fieldValueOfDepartmentUser;
    }

    

    public String getFieldValueOfDepartmentAdmin() {
        return fieldValueOfDepartmentAdmin;
    }

    public void setFieldValueOfDepartmentAdmin(String fieldValueOfDepartmentAdmin) {
        this.fieldValueOfDepartmentAdmin = fieldValueOfDepartmentAdmin;
    }

    public String getRejectRemarkEA() {
        return rejectRemarkEA;
    }

    public void setRejectRemarkEA(String rejectRemarkEA) {
        this.rejectRemarkEA = rejectRemarkEA;
    }

    public String getContractor_status() {
        return contractor_status;
    }

    public void setContractor_status(String contractor_status) {
        this.contractor_status = contractor_status;
    }

  
    public String getRequestReject() {
        return requestReject;
    }

    public void setRequestReject(String requestReject) {
        this.requestReject = requestReject;
    }

    public String getRevertStatus() {
        return revertStatus;
    }

    public void setRevertStatus(String revertStatus) {
        this.revertStatus = revertStatus;
    }

    public String getRevertDate() {
        return revertDate;
    }

    public void setRevertDate(String revertDate) {
        this.revertDate = revertDate;
    }

    public String getRevertRemark() {
        return revertRemark;
    }

    public void setRevertRemark(String revertRemark) {
        this.revertRemark = revertRemark;
    }

    public String getOpenStatusOfEB() {
        return openStatusOfEB;
    }

    public void setOpenStatusOfEB(String openStatusOfEB) {
        this.openStatusOfEB = openStatusOfEB;
    }

    public String getDocumentOpenStatus() {
        return documentOpenStatus;
    }

    public void setDocumentOpenStatus(String documentOpenStatus) {
        this.documentOpenStatus = documentOpenStatus;
    }

    public String getTwoStageEAOpenStatus() {
        return twoStageEAOpenStatus;
    }

    public void setTwoStageEAOpenStatus(String twoStageEAOpenStatus) {
        this.twoStageEAOpenStatus = twoStageEAOpenStatus;
    }

    public String getFieldType() {
        return fieldType;
    }

    public void setFieldType(String fieldType) {
        this.fieldType = fieldType;
    }

    public String getLabelTypeA() {
        return labelTypeA;
    }

    public void setLabelTypeA(String labelTypeA) {
        this.labelTypeA = labelTypeA;
    }

    public String getLabelNameA() {
        return labelNameA;
    }

    public void setLabelNameA(String labelNameA) {
        this.labelNameA = labelNameA;
    }

    public String getLabelMandatoryA() {
        return labelMandatoryA;
    }

    public void setLabelMandatoryA(String labelMandatoryA) {
        this.labelMandatoryA = labelMandatoryA;
    }

    public int getTender_EnvelopeB_SequnceId() {
        return tender_EnvelopeB_SequnceId;
    }

    public void setTender_EnvelopeB_SequnceId(int tender_EnvelopeB_SequnceId) {
        this.tender_EnvelopeB_SequnceId = tender_EnvelopeB_SequnceId;
    }

  
    public String getFieldValueInWordsOfContractor() {
        return fieldValueInWordsOfContractor;
    }

    public void setFieldValueInWordsOfContractor(String fieldValueInWordsOfContractor) {
        this.fieldValueInWordsOfContractor = fieldValueInWordsOfContractor;
    }

    public String getFieldValueInWordsOfDepartmentUser() {
        return fieldValueInWordsOfDepartmentUser;
    }

    public void setFieldValueInWordsOfDepartmentUser(String fieldValueInWordsOfDepartmentUser) {
        this.fieldValueInWordsOfDepartmentUser = fieldValueInWordsOfDepartmentUser;
    }

    public String getFieldValueInWordsOfDepartmentAdmin() {
        return fieldValueInWordsOfDepartmentAdmin;
    }

    public void setFieldValueInWordsOfDepartmentAdmin(String fieldValueInWordsOfDepartmentAdmin) {
        this.fieldValueInWordsOfDepartmentAdmin = fieldValueInWordsOfDepartmentAdmin;
    }

    public String getShortListed_Status() {
        return shortListed_Status;
    }

    public void setShortListed_Status(String shortListed_Status) {
        this.shortListed_Status = shortListed_Status;
    }
    
    
   
    
    
}
