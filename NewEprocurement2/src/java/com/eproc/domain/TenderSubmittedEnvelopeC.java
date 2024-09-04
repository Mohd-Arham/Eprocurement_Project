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
 * <h1>TenderSubmittedEnvelopeB</h1>
 * <p>This program handle the parameter of tender Envelope B database</p>
 * 
 * @author Gaurav Dubey
 * @since 7 Sep 2018
 * @version 2.0.0
 */
@Entity
@Table(name = "tendersubmittedenvelopec")
public class TenderSubmittedEnvelopeC {
  
 @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "submittedEnvelopeC_Id")
    private int submittedEnvelopeC_Id;
    
    @Column(name = "envelopeCId")
    private int envelopeCId;
    
    @Column(name = "envelopeCOfficers")
    private String envelopeCOfficers;
    
    @Column(name = "minOpeningOfficerC")
    private String minOpeningOfficerC;
    
    @Column(name = "tender_Id")
    private int tender_Id;
    
    @Column(name = "tenderMaster")
    private String tenderMaster;

    
    @Column(name = "openedECOfficers")
    private String openedECOfficers;
    
    
    @Column(name = "remainOpeningOfficerC")
    private int remainOpeningOfficerC;
    
    
      @Transient
     private List<DepartmentUser>  ECOfficersDetails =  new ArrayList<>();

    public int getSubmittedEnvelopeC_Id() {
        return submittedEnvelopeC_Id;
    }

    public void setSubmittedEnvelopeC_Id(int submittedEnvelopeC_Id) {
        this.submittedEnvelopeC_Id = submittedEnvelopeC_Id;
    }

    public int getEnvelopeCId() {
        return envelopeCId;
    }

    public void setEnvelopeCId(int envelopeCId) {
        this.envelopeCId = envelopeCId;
    }

    public String getEnvelopeCOfficers() {
        return envelopeCOfficers;
    }

    public void setEnvelopeCOfficers(String envelopeCOfficers) {
        this.envelopeCOfficers = envelopeCOfficers;
    }

    public String getMinOpeningOfficerC() {
        return minOpeningOfficerC;
    }

    public void setMinOpeningOfficerC(String minOpeningOfficerC) {
        this.minOpeningOfficerC = minOpeningOfficerC;
    }

    public int getRemainOpeningOfficerC() {
        return remainOpeningOfficerC;
    }

    public void setRemainOpeningOfficerC(int remainOpeningOfficerC) {
        this.remainOpeningOfficerC = remainOpeningOfficerC;
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

    public List<DepartmentUser> getECOfficersDetails() {
        return ECOfficersDetails;
    }

    public void setECOfficersDetails(List<DepartmentUser> ECOfficersDetails) {
        this.ECOfficersDetails = ECOfficersDetails;
    }

    public String getOpenedECOfficers() {
        return openedECOfficers;
    }

    public void setOpenedECOfficers(String openedECOfficers) {
        this.openedECOfficers = openedECOfficers;
    }

   
    
    
}
