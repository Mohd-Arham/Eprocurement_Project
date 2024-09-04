/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Gaurav Dubey
 */
@Entity
@Table(name = "tender_stage")
public class TenderStage {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tenderStage_id")
    private Integer tenderStage_id;
    
     @Column(name = "tenderStage_Name")
    private String tenderStage_Name;
     
      @Column(name = "tenderStage_CreationDate")
    private String tenderStage_CreationDate;

    public Integer getTenderStage_id() {
        return tenderStage_id;
    }

    public void setTenderStage_id(Integer tenderStage_id) {
        this.tenderStage_id = tenderStage_id;
    }

    public String getTenderStage_Name() {
        return tenderStage_Name;
    }

    public void setTenderStage_Name(String tenderStage_Name) {
        this.tenderStage_Name = tenderStage_Name;
    }

    public String getTenderStage_CreationDate() {
        return tenderStage_CreationDate;
    }

    public void setTenderStage_CreationDate(String tenderStage_CreationDate) {
        this.tenderStage_CreationDate = tenderStage_CreationDate;
    }

   

  
      
      
      
    
    
    
    
}
