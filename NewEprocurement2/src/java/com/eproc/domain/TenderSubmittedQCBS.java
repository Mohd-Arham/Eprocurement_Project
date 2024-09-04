/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
 *
 * @author Windows7
 */
@Entity
@Table(name = "tendersubmittedQCBS")
public class TenderSubmittedQCBS {
   
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "submittedQCBS")
    private int submittedQCBS;
    
    @Column(name = "templateId")
    private int templateId;
    
    @Column(name = "QCBSOfficers")
    private String QCBSOfficers;
    
    @Column(name = "minOpeningOfficer")
    private String minOpeningOfficerQCBS;
  
    @Column(name = "remainOpeningOfficerQCBS")
    private String remainOpeningOfficerQCBS;
       
    @Column(name = "tender_Id")
    private int tender_Id;

    @Column(name = "tenderMaster")
    private String tenderMaster;
      @Transient
     private List<DepartmentUser>  QCBSOfficersDetails =  new ArrayList<>();

    

    public int getSubmittedQCBS() {
        return submittedQCBS;
    }

    public void setSubmittedQCBS(int submittedQCBS) {
        this.submittedQCBS = submittedQCBS;
    }

    public int getTemplateId() {
        return templateId;
    }

    public void setTemplateId(int templateId) {
        this.templateId = templateId;
    }

    
    public String getQCBSOfficers() {
        return QCBSOfficers;
    }

    public void setQCBSOfficers(String QCBSOfficers) {
        this.QCBSOfficers = QCBSOfficers;
    }

    public String getMinOpeningOfficerQCBS() {
        return minOpeningOfficerQCBS;
    }

    public void setMinOpeningOfficerQCBS(String minOpeningOfficerQCBS) {
        this.minOpeningOfficerQCBS = minOpeningOfficerQCBS;
    }

    public String getRemainOpeningOfficerQCBS() {
        return remainOpeningOfficerQCBS;
    }

    public void setRemainOpeningOfficerQCBS(String remainOpeningOfficerQCBS) {
        this.remainOpeningOfficerQCBS = remainOpeningOfficerQCBS;
    }

    public int getTender_Id() {
        return tender_Id;
    }

    public void setTender_Id(int tender_Id) {
        this.tender_Id = tender_Id;
    }

    public String getTenderMaster() {
        return tenderMaster;
    }

    public void setTenderMaster(String tenderMaster) {
        this.tenderMaster = tenderMaster;
    }

    public void setQCBSOfficersDetails(List<DepartmentUser> EBOfficersDetails) {
        this.QCBSOfficersDetails = EBOfficersDetails;
    }

    public List<DepartmentUser> getQCBSOfficersDetails() {
        return QCBSOfficersDetails;
    }

    @Override
    public String toString() {
        return "TenderSubmittedQCBS{" + "submittedQCBS=" + submittedQCBS + ", templateId=" + templateId + ", QCBSOfficers=" + QCBSOfficers + ", minOpeningOfficerQCBS=" + minOpeningOfficerQCBS + ", remainOpeningOfficerQCBS=" + remainOpeningOfficerQCBS + ", tender_Id=" + tender_Id + ", tenderMaster=" + tenderMaster + ", QCBSOfficersDetails=" + QCBSOfficersDetails + '}';
    }
    
    
}
