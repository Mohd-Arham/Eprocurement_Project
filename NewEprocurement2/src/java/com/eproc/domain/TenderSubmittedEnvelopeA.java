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
 * <h1>TenderSubmittedEnvelopeA</h1>
 * <p>This program handle the parameter of tender Envelope A database</p>
 * 
 * @author Gaurav Dubey
 * @since 7 Sep 2018
 * @version 2.0.0
 */
@Entity
@Table(name = "tendersubmittedenvelopea")
public class TenderSubmittedEnvelopeA {
   
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "submittedEnvelopeA_Id")
    private int submittedEnvelopeA_Id;
    
    @Column(name = "envelopeAId")
    private int envelopeAId;
    
    @Column(name = "envelopeAOfficers")
    private String envelopeAOfficers;
    
    @Column(name = "minOpeningOfficer")
    private String minOpeningOfficerA;
    
    @Column(name = "tender_Id")
    private int tender_Id;

    @Column(name = "tenderMaster")
    private String tenderMaster;
    
    
    @Column(name = "openedEAOfficers")
    private String openedEAOfficers;
    
    
    @Column(name = "remainOpeningOfficerA")
    private int remainOpeningOfficerA;
	
	
    @Transient
     private List<DepartmentUser>  EAOfficersDetails =  new ArrayList<>();

    public int getSubmittedEnvelopeA_Id() {
        return submittedEnvelopeA_Id;
    }

    public void setSubmittedEnvelopeA_Id(int submittedEnvelopeA_Id) {
        this.submittedEnvelopeA_Id = submittedEnvelopeA_Id;
    }

    public int getEnvelopeAId() {
        return envelopeAId;
    }

    public void setEnvelopeAId(int envelopeAId) {
        this.envelopeAId = envelopeAId;
    }

    public String getEnvelopeAOfficers() {
        return envelopeAOfficers;
    }

    public void setEnvelopeAOfficers(String envelopeAOfficers) {
        this.envelopeAOfficers = envelopeAOfficers;
    }

    public String getMinOpeningOfficerA() {
        return minOpeningOfficerA;
    }

    public void setMinOpeningOfficerA(String minOpeningOfficerA) {
        this.minOpeningOfficerA = minOpeningOfficerA;
    }

    public int getRemainOpeningOfficerA() {
        return remainOpeningOfficerA;
    }

    public void setRemainOpeningOfficerA(int remainOpeningOfficerA) {
        this.remainOpeningOfficerA = remainOpeningOfficerA;
    }

    public List<DepartmentUser> getEAOfficersDetails() {
        return EAOfficersDetails;
    }

    public void setEAOfficersDetails(List<DepartmentUser> EAOfficersDetails) {
        this.EAOfficersDetails = EAOfficersDetails;
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

    public String getOpenedEAOfficers() {
        return openedEAOfficers;
    }

    public void setOpenedEAOfficers(String openedEAOfficers) {
        this.openedEAOfficers = openedEAOfficers;
    }
    
}
