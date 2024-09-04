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
 * @author Gaurav Dubey
 */
@Entity
@Table(name="typeof_tenders")
public class TypeOfTenders{
    
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "typeOfTenders_id")
     private Integer typeOfTenders_id;
     
     @Column(name = "typeOfTenders_Name") 
     private String typeOfTenders_Name;
     
      @Column(name = "typeOfTenders_Date")
     private String typeOfTenders_Date;

    public Integer getTypeOfTenders_id() {
        return typeOfTenders_id;
    }

    public void setTypeOfTenders_id(Integer typeOfTenders_id) {
        this.typeOfTenders_id = typeOfTenders_id;
    }

    public String getTypeOfTenders_Name() {
        return typeOfTenders_Name;
    }

    public void setTypeOfTenders_Name(String typeOfTenders_Name) {
        this.typeOfTenders_Name = typeOfTenders_Name;
    }

    public String getTypeOfTenders_Date() {
        return typeOfTenders_Date;
    }

    public void setTypeOfTenders_Date(String typeOfTenders_Date) {
        this.typeOfTenders_Date = typeOfTenders_Date;
    }

  
     
     
     
    
}
