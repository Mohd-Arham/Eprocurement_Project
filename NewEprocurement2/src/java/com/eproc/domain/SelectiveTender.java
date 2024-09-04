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
 * @author Vishali Gupta
 */
@Entity
@Table(name = "selective_tender")
public class SelectiveTender {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "selectiveTender_id")
    private Integer selectiveTender_id;
    
    @Column(name = "selectivetender_Name")
    private String selectivetender_Name;
    
    @Column(name = "selectiveTender_CreationDate")
    private String selectiveTender_CreationDate;

    public Integer getSelectiveTender_id() {
        return selectiveTender_id;
    }

    public void setSelectiveTender_id(Integer selectiveTender_id) {
        this.selectiveTender_id = selectiveTender_id;
    }

    public String getSelectivetender_Name() {
        return selectivetender_Name;
    }

    public void setSelectivetender_Name(String selectivetender_Name) {
        this.selectivetender_Name = selectivetender_Name;
    }

    public String getSelectiveTender_CreationDate() {
        return selectiveTender_CreationDate;
    }

    public void setSelectiveTender_CreationDate(String selectiveTender_CreationDate) {
        this.selectiveTender_CreationDate = selectiveTender_CreationDate;
    }

   
      
    
}
