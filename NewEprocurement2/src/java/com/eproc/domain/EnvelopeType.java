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
 * @author Windows7
 */
@Entity
@Table(name = "envelope_type")
public class EnvelopeType {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "envelopeType_id")
    private Integer envelopeType_id;
     
    @Column(name = "envelopeType_Name")
    private String envelopeType_Name;
       
    @Column(name = "envelopeType_CreationDate")
    private String envelopeType_CreationDate;

    public Integer getEnvelopeType_id() {
        return envelopeType_id;
    }

    public void setEnvelopeType_id(Integer envelopeType_id) {
        this.envelopeType_id = envelopeType_id;
    }

    public String getEnvelopeType_Name() {
        return envelopeType_Name;
    }

    public void setEnvelopeType_Name(String envelopeType_Name) {
        this.envelopeType_Name = envelopeType_Name;
    }

    public String getEnvelopeType_CreationDate() {
        return envelopeType_CreationDate;
    }

    public void setEnvelopeType_CreationDate(String envelopeType_CreationDate) {
        this.envelopeType_CreationDate = envelopeType_CreationDate;
    } 
    
}
