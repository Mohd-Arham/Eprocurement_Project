/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Windows7
 */
@Entity
@Table(name = "contractordesignation")
public class ContractorDesignation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "desigid")
    private Integer desigid;
     @Column(name = "cdesig_name")
     private String desigName; 
     @Column(name = "cdesig_shortName")
     private String desigSName; 

    public Integer getDesigid() {
        return desigid;
    }

    public void setDesigid(Integer desigid) {
        this.desigid = desigid;
    }

    public String getDesigName() {
        return desigName;
    }

    public void setDesigName(String desigName) {
        this.desigName = desigName;
    }

    public String getDesigSName() {
        return desigSName;
    }

    public void setDesigSName(String desigSName) {
        this.desigSName = desigSName;
    }
     
    
}
