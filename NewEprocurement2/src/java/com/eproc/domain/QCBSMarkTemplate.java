package com.eproc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "qcbs_mark_template")
public class QCBSMarkTemplate {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer markTemplateId;
    private String markTemplate;
    private String markTemplateForDept;
    private String userId;
    private String deptId;
    private String contractorId;
    private String tenderId;
    private String templateId;
    private String EBOpenStatus;
    private String EBApplyAction;
    private Integer firstAuthorityOpenStatus;
    private String firstBidderId;
    
    @Transient
    private String nameOfContractor;
    @Transient
    private String companyName;
    @Transient
    private String message;
    @Transient
    private String remarkEB;
    @Transient
    private String type_of_tender;

   public Integer getFirstAuthorityOpenStatus() {
      return firstAuthorityOpenStatus;
   }

   public void setFirstAuthorityOpenStatus(Integer firstAuthorityOpenStatus) {
      this.firstAuthorityOpenStatus = firstAuthorityOpenStatus;
   }

   public String getFirstBidderId() {
      return firstBidderId;
   }

   public void setFirstBidderId(String firstBidderId) {
      this.firstBidderId = firstBidderId;
   }
 
    public Integer getMarkTemplateId() {
        return markTemplateId;
    }

    public void setMarkTemplateId(Integer markTemplateId) {
        this.markTemplateId = markTemplateId;
    }

   public String getEBApplyAction() {
      return EBApplyAction;
   }

   public String getMarkTemplateForDept() {
      return markTemplateForDept;
   }

   public void setMarkTemplateForDept(String markTemplateForDept) {
      this.markTemplateForDept = markTemplateForDept;
   }

   public void setEBApplyAction(String EBApplyAction) {
      this.EBApplyAction = EBApplyAction;
   }

   public String getMarkTemplate() {
      return markTemplate;
   }

   public void setMarkTemplate(String markTemplate) {
      this.markTemplate = markTemplate;
   }

   public String getEBOpenStatus() {
      return EBOpenStatus;
   }

   public void setEBOpenStatus(String EBOpenStatus) {
      this.EBOpenStatus = EBOpenStatus;
   }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getContractorId() {
        return contractorId;
    }

    public void setContractorId(String contractorId) {
        this.contractorId = contractorId;
    }

   public String getTenderId() {
      return tenderId;
   }

   public void setTenderId(String tenderId) {
      this.tenderId = tenderId;
   }

   public String getTemplateId() {
      return templateId;
   }

   public void setTemplateId(String templateId) {
      this.templateId = templateId;
   }

   public String getNameOfContractor() {
      return nameOfContractor;
   }

   public void setNameOfContractor(String nameOfContractor) {
      this.nameOfContractor = nameOfContractor;
   }

   public String getCompanyName() {
      return companyName;
   }

   public void setCompanyName(String companyName) {
      this.companyName = companyName;
   }

   public String getMessage() {
      return message;
   }

   public void setMessage(String message) {
      this.message = message;
   }

   public String getRemarkEB() {
      return remarkEB;
   }

   public void setRemarkEB(String remarkEB) {
      this.remarkEB = remarkEB;
   }

   public String getType_of_tender() {
      return type_of_tender;
   }

   public void setType_of_tender(String type_of_tender) {
      this.type_of_tender = type_of_tender;
   }
   

}
