package com.eproc.domain;

import java.util.List;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "qcbs_template")
public class QCBSTemplate {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer templateId;
    private String template;
    private String userId;
    private String deptId;
    private String contractorId;
    private String tenderId;
    private String qcbsTemplateName;
    
    
    
    
    public Integer getTemplateId() {
        return templateId;
        
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
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

   public String getQcbsTemplateName() {
      return qcbsTemplateName;
   }

   public void setQcbsTemplateName(String qcbsTemplateName) {
      this.qcbsTemplateName = qcbsTemplateName;
   }

    @Override
    public String toString() {
        return "QCBSTemplate{" + "templateId=" + templateId + ", template=" + template + ", userId=" + userId + ", deptId=" + deptId + ", contractorId=" + contractorId + ", tenderId=" + tenderId + ", qcbsTemplateName=" + qcbsTemplateName + '}';
    }
   
   
   

}
