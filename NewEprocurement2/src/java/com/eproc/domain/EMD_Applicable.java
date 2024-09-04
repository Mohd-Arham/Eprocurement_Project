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

/**
 *
 * @author Vishali Gupta
 */
@Entity
@Table(name="emd_applicable")
public class EMD_Applicable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "emd_Applicable_id")
    private Integer emd_Applicable_id;
    
     @Column(name = "emd_Applicable_Name")
    private String emd_Applicable_Name;
     
       @Column(name = "emd_Applicable_creationDate")
    private String emd_Applicable_creationDate;

    public Integer getEmd_Applicable_id() {
        return emd_Applicable_id;
    }

    public void setEmd_Applicable_id(Integer emd_Applicable_id) {
        this.emd_Applicable_id = emd_Applicable_id;
    }

    public String getEmd_Applicable_Name() {
        return emd_Applicable_Name;
    }

    public void setEmd_Applicable_Name(String emd_Applicable_Name) {
        this.emd_Applicable_Name = emd_Applicable_Name;
    }

    public String getEmd_Applicable_creationDate() {
        return emd_Applicable_creationDate;
    }

    public void setEmd_Applicable_creationDate(String emd_Applicable_creationDate) {
        this.emd_Applicable_creationDate = emd_Applicable_creationDate;
    }
       
       
       
    
    
}
