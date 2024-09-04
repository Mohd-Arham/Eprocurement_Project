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
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Mansi Jain
 */
@Entity
@Table(name = "EmpanelmentDynamicTemplate")
public class EmpanelmentDynamicTemplate {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "dynamicId", unique = true, nullable = false)
    private Integer dynamicId;
    
    @Column(name = "labelname")
    private String labelname;
   
    @Column(name = "labeltype")
    private String labeltype;
    
    @Column(name = "sequenceIdA")
    private Integer sequenceIdA;
    
     @Column(name = "templatenameId")
    private Integer templatenameId;
     
      @Column(name = "empanelmentId")
    private Integer empanelmentId;

      @Column(name="createdDate")
      private Date createdDate;
      
    public Integer getDynamicId() {
        return dynamicId;
    }

    public void setDynamicId(Integer dynamicId) {
        this.dynamicId = dynamicId;
    }

    public String getLabelname() {
        return labelname;
    }

    public void setLabelname(String labelname) {
        this.labelname = labelname;
    }

    public String getLabeltype() {
        return labeltype;
    }

    public void setLabeltype(String labeltype) {
        this.labeltype = labeltype;
    }

   


    public Integer getSequenceIdA() {
        return sequenceIdA;
    }

    public void setSequenceIdA(Integer sequenceIdA) {
        this.sequenceIdA = sequenceIdA;
    }

    
    public Integer getTemplatenameId() {
        return templatenameId;
    }

    public void setTemplatenameId(Integer templatenameId) {
        this.templatenameId = templatenameId;
    }

    public Integer getEmpanelmentId() {
        return empanelmentId;
    }

    public void setEmpanelmentId(Integer empanelmentId) {
        this.empanelmentId = empanelmentId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

}
