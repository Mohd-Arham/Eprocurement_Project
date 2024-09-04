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
 *  Since 11-10-2018
 *  @Version 2.0.0
 * Class for maintaining the logs of MSME/NSIC Documents approval
 */

@Entity
@Table(name = "msmeLogs")
public class MsmeNsicLogs {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    
    @Column(name = "id")
    private Integer msmeDocId;
    
    @Column(name = "deptUserId")
    private Integer reg_Id;
    
    @Column(name = "deptId")
    private Integer deptId;
    
    @Column(name = "contRegId")
    private int id;
    
    @Column(name = "dscNumber")
    private String dscNumber;

    @Column(name = "date")
    private Date msmelogsDate;
    
    @Column(name = "activity")
    private String activity;

    public Integer getMsmeDocId() {
        return msmeDocId;
    }

    public void setMsmeDocId(Integer msmeDocId) {
        this.msmeDocId = msmeDocId;
    }

   public Integer getReg_Id() {
        return reg_Id;
    }

    public void setReg_Id(Integer reg_Id) {
        this.reg_Id = reg_Id;
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

    public Date getMsmelogsDate() {
        return msmelogsDate;
    }

    public void setMsmelogsDate(Date msmelogsDate) {
        this.msmelogsDate = msmelogsDate;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }
    
    
    
    
    
}
