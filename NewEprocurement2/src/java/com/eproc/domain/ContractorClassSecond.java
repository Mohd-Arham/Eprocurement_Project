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
@Table(name="contractorclasssecond")
public class ContractorClassSecond {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "contClassId")
    private Integer contClassId;
    
     @Column(name = "contClassName")
     private String contClassName;
     
      @Column(name = "contClassDate")
      private String contClassDate;

    public Integer getContClassId() {
        return contClassId;
    }

    public void setContClassId(Integer contClassId) {
        this.contClassId = contClassId;
    }

    public String getContClassName() {
        return contClassName;
    }

    public void setContClassName(String contClassName) {
        this.contClassName = contClassName;
    }

    public String getContClassDate() {
        return contClassDate;
    }

    public void setContClassDate(String contClassDate) {
        this.contClassDate = contClassDate;
    }
  }
