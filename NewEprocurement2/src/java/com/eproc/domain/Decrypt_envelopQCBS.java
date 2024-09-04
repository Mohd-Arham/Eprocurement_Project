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
 * @author Admin
 */@Entity
@Table(name="decrypt_envelopeQCBS")

public class Decrypt_envelopQCBS {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "decryptenvelopeQCBSId")
    private Integer DecryptenvelopeQCBSId;
    
    @Column(name = "qcbsId")
    private Integer qcbs_Id;
     
     @Column(name="tenderId")
     private String tenderId;
    
       @Column(name="templateId")
     private Integer templateId;
       
       @Column(name="contractorId")
     private Integer contractorId;
       
       @Column(name="fileName")
     private String fileName;
       
       @Column(name="filePath")
     private String filePath;
       
       @Column(name="template")
     private String template;
       
       @Column(name="fileNumber")
       private String fileNumber;
       
        @Column(name="shortListed_Status")
    private String shortListed_Status;
    
        @Column(name="departmentUserId")
        private Integer DepartmentUserId;

         @Transient
    private String labelTypeA;
    
    @Transient
    private String labelNameA;

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
    
    
    public Integer getDecryptenvelopeQCBSId() {
        return DecryptenvelopeQCBSId;
    }

    public void setDecryptenvelopeQCBSId(Integer DecryptenvelopeQCBSId) {
        this.DecryptenvelopeQCBSId = DecryptenvelopeQCBSId;
    }

    public Integer getQcbs_Id() {
        return qcbs_Id;
    }

    public void setQcbs_Id(Integer qcbs_Id) {
        this.qcbs_Id = qcbs_Id;
    }

    public String getTenderId() {
        return tenderId;
    }

    public void setTenderId(String tenderId) {
        this.tenderId = tenderId;
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public Integer getContractorId() {
        return contractorId;
    }

    public void setContractorId(Integer contractorId) {
        this.contractorId = contractorId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getFileNumber() {
        return fileNumber;
    }

    public void setFileNumber(String fileNumber) {
        this.fileNumber = fileNumber;
    }

    public String getShortListed_Status() {
        return shortListed_Status;
    }

    public void setShortListed_Status(String shortListed_Status) {
        this.shortListed_Status = shortListed_Status;
    }

    public Integer getDepartmentUserId() {
        return DepartmentUserId;
    }

    public void setDepartmentUserId(Integer DepartmentUserId) {
        this.DepartmentUserId = DepartmentUserId;
    }

    @Override
    public String toString() {
        return "Decrypt_envelopQCBS{" + "DecryptenvelopeQCBSId=" + DecryptenvelopeQCBSId + ", qcbs_Id=" + qcbs_Id + ", tenderId=" + tenderId + ", templateId=" + templateId + ", contractorId=" + contractorId + ", fileName=" + fileName + ", filePath=" + filePath + ", template=" + template + ", fileNumber=" + fileNumber + ", shortListed_Status=" + shortListed_Status + ", DepartmentUserId=" + DepartmentUserId + ", labelTypeA=" + labelTypeA + ", labelNameA=" + labelNameA + '}';
    }

   

    
}
