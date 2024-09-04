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
 * @author Palak Tiwari
 * Since 11-10-2018
 *  @Version 2.0.0
 * Class for maintaining the Contractor Class Documents 
 */
 @Entity
@Table(name = "contractorclasslogs ")
public class ContractorClassLogs {
 

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    
    @Column(name = "id")
    private Integer contractorClassDocId;
    
    @Column(name = "deptUserId")
    private Integer reg_Id;
    
    @Column(name = "deptId")
    private Integer deptId;
    
    @Column(name = "contRegId")
    private int id;
    
    @Column(name = "dscNumber")
    private String dscNumber;

    @Column(name = "date")
    private Date contClasslogsDate;
    
    @Column(name = "activity")
    private String classActivity;

   

    public Integer getReg_Id() {
        return reg_Id;
    }
    
    public void setReg_Id(Integer reg_Id) {
        this.reg_Id = reg_Id;
    }

    public Integer getContractorClassDocId() {
        return contractorClassDocId;
    }

    public void setContractorClassDocId(Integer contractorClassDocId) {
        this.contractorClassDocId = contractorClassDocId;
    }

     public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDscNumber() {
        return dscNumber;
    }

    public void setDscNumber(String dscNumber) {
        this.dscNumber = dscNumber;
    }

    public Date getContClasslogsDate() {
        return contClasslogsDate;
    }

    public void setContClasslogsDate(Date contClasslogsDate) {
        this.contClasslogsDate = contClasslogsDate;
    }

    public String getClassActivity() {
        return classActivity;
    }

    public void setClassActivity(String classActivity) {
        this.classActivity = classActivity;
    }
    
    
    
}
    

