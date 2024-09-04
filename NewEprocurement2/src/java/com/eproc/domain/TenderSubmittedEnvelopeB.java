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
@Table(name = "tendersubmittedenvelopeb")
public class TenderSubmittedEnvelopeB {
  
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "submittedEnvelopeB_Id")
    private int submittedEnvelopeB_Id;
    
    @Column(name = "envelopeBId")
    private int envelopeBId;
    
    @Column(name = "envelopeBOfficers")
    private String envelopeBOfficers;
    
    @Column(name = "minOpeningOfficerB")
    private String minOpeningOfficerB;
    
    @Column(name = "tender_Id")
    private int tender_Id;
    
    @Column(name = "tenderMaster")
    private String tenderMaster;
    
    @Column(name = "openedEBOfficers")
    private String openedEBOfficers;
    
    
    @Column(name = "remainOpeningOfficerB")
    private int remainOpeningOfficerB;

     @Transient
     private List<DepartmentUser>  EBOfficersDetails =  new ArrayList<>();

    public int getSubmittedEnvelopeB_Id() {
        return submittedEnvelopeB_Id;
    }

    public void setSubmittedEnvelopeB_Id(int submittedEnvelopeB_Id) {
        this.submittedEnvelopeB_Id = submittedEnvelopeB_Id;
    }

    public int getEnvelopeBId() {
        return envelopeBId;
    }

    public void setEnvelopeBId(int envelopeBId) {
        this.envelopeBId = envelopeBId;
    }

    public String getEnvelopeBOfficers() {
        return envelopeBOfficers;
    }

    public void setEnvelopeBOfficers(String envelopeBOfficers) {
        this.envelopeBOfficers = envelopeBOfficers;
    }

    public String getMinOpeningOfficerB() {
        return minOpeningOfficerB;
    }

    public void setMinOpeningOfficerB(String minOpeningOfficerB) {
        this.minOpeningOfficerB = minOpeningOfficerB;
    }

    public int getRemainOpeningOfficerB() {
        return remainOpeningOfficerB;
    }

    public void setRemainOpeningOfficerB(int remainOpeningOfficerB) {
        this.remainOpeningOfficerB = remainOpeningOfficerB;
    }

    public List<DepartmentUser> getEBOfficersDetails() {
        return EBOfficersDetails;
    }

    public void setEBOfficersDetails(List<DepartmentUser> EBOfficersDetails) {
        this.EBOfficersDetails = EBOfficersDetails;
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

    public String getOpenedEBOfficers() {
        return openedEBOfficers;
    }

    public void setOpenedEBOfficers(String openedEBOfficers) {
        this.openedEBOfficers = openedEBOfficers;
    }
    
    
}
