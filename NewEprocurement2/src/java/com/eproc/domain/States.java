package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


/*
 * Process State Form page with all setter() and getter()
 * 
 *@auhtor Shashank Shukla
 */
@Entity
@Table(name = "states")
public class States{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "state_id")
    private Integer state_id;

    @Column(name = "state_name")
    private String state_name;

    @Column(name = "country_id")
    private Integer country_id;

    private Date  created_Date ;
    
    private Integer deptId;
    private String status;
     
    @Transient
    private String country_name;
 
    public Integer getState_id() {
        return state_id;
    }

    public void setState_id(Integer state_id) {
        this.state_id = state_id;
    }

    public String getState_name() {
        return state_name;
    }

    public void setState_name(String state_name) {
        this.state_name = state_name;
    }

    @Override
    public String toString() {
        return "States{" + "state_id=" + state_id + ", state_name=" + state_name + ", country_id=" + country_id + ", created_Date=" + created_Date + ", deptId=" + deptId + ", status=" + status + ", country_name=" + country_name + '}';
    }

    public Integer getCountry_id() {
        return country_id;
    }

    public void setCountry_id(Integer country_id) {
        this.country_id = country_id;
    }

    public String getCountry_name() {
        return country_name;
    }

    public void setCountry_name(String country_name) {
        this.country_name = country_name;
    }

    public Date getCreated_Date() {
        return created_Date;
    }

    public void setCreated_Date(Date created_Date) {
        this.created_Date = created_Date;
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
    

}
