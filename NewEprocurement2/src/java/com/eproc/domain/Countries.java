/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * Process Foreign Country Form page with all setter() and getter()
 * Department can insert and update Department Circle.
    
#Author  Shashank Shukla
 */

@Entity
@Table(name="countries")
public class Countries{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
  
    private Integer country_id;
    private String sortname;
    private Integer phonecode; 
    private String country_name;
    private Integer deptId;
    private String status;
    private Date Created_date; 

    public Integer getCountry_id() {
        return country_id;
    }

    public void setCountry_id(Integer country_id) {
        this.country_id = country_id;
    }

    public String getSortname() {
        return sortname;
    }

    public void setSortname(String sortname) {
        this.sortname = sortname;
    }

    public Integer getPhonecode() {
        return phonecode;
    }

    public void setPhonecode(Integer phonecode) {
        this.phonecode = phonecode;
    }

    public String getCountry_name() {
        return country_name;
    }

    public void setCountry_name(String country_name) {
        this.country_name = country_name;
    }

    public Date getCreated_date() {
        return Created_date;
    }

    public void setCreated_date(Date Created_date) {
        this.Created_date = Created_date;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return country_name;
    }
    
   
    
}

