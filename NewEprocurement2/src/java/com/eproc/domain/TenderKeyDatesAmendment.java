/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Gaurav Dubey
 */
@Entity
@Table(name= "tender_key_dates_amendment")
public class TenderKeyDatesAmendment {
     
   @Id
   @GeneratedValue(strategy = IDENTITY)
   @Column(name = "tender_KeyDateAmendId")
   private Integer keyDatesAmendId;
   
   @Column(name = "tender_KeyDateId")
   private Integer keyDatesId;
   
   @Column(name = "tender_Id")
   private String tender_Id;
   
   @Column(name = "tender_No")
   private String tender_No;
   
   @Column(name = "tenderReleaseDate")
   private String tenderReleaseDate;
   
   @Column(name = "tenderPurchaseDate")
   private String tenderPurchaseDate;
   
   @Column(name = "bidSubmissionDate")
   private String bidSubmissionDate; 
   
   @Column(name = "tenderClosingDate")
   private String tenderClosingDate;
   
   @Column(name = "openingEA")
   private String openingEA;
   
   @Column(name = "openingEB")
   private String openingEB;
   
   @Column(name = "openingEC")
   private String openingEC;

   @Column(name = "openingECaftertechopening")
   private String openingECaftertechopening;

    public Integer getKeyDatesAmendId() {
        return keyDatesAmendId;
    }

    public void setKeyDatesAmendId(Integer keyDatesAmendId) {
        this.keyDatesAmendId = keyDatesAmendId;
    }
   
    public Integer getKeyDatesId() {
        return keyDatesId;
    }

    public void setKeyDatesId(Integer keyDatesId) {
        this.keyDatesId = keyDatesId;
    }

    public String getTender_Id() {
        return tender_Id;
    }

    public void setTender_Id(String tender_Id) {
        this.tender_Id = tender_Id;
    }

    public String getTender_No() {
        return tender_No;
    }

    public void setTender_No(String tender_No) {
        this.tender_No = tender_No;
    }

    public String getTenderReleaseDate() {
        return tenderReleaseDate;
    }

    public void setTenderReleaseDate(String tenderReleaseDate) {
        this.tenderReleaseDate = tenderReleaseDate;
    }

    public String getTenderPurchaseDate() {
        return tenderPurchaseDate;
    }

    public void setTenderPurchaseDate(String tenderPurchaseDate) {
        this.tenderPurchaseDate = tenderPurchaseDate;
    }

    public String getBidSubmissionDate() {
        return bidSubmissionDate;
    }

    public void setBidSubmissionDate(String bidSubmissionDate) {
        this.bidSubmissionDate = bidSubmissionDate;
    }

    public String getTenderClosingDate() {
        return tenderClosingDate;
    }

    public void setTenderClosingDate(String tenderClosingDate) {
        this.tenderClosingDate = tenderClosingDate;
    }

    public String getOpeningEA() {
        return openingEA;
    }

    public void setOpeningEA(String openingEA) {
        this.openingEA = openingEA;
    }

    public String getOpeningEB() {
        return openingEB;
    }

    public void setOpeningEB(String openingEB) {
        this.openingEB = openingEB;
    }
    
    public String getOpeningEC() {
        return openingEC;
    }

    public void setOpeningEC(String openingEC) {
        this.openingEC = openingEC;
    }

    public String getOpeningECaftertechopening() {
        return openingECaftertechopening;
    }

    public void setOpeningECaftertechopening(String openingECaftertechopening) {
        this.openingECaftertechopening = openingECaftertechopening;
    }
}
