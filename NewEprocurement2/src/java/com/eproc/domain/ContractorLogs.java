/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author Mansi Jain
 */
@Entity
@Table(name = "contractorstatus")
public class ContractorLogs{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "contstatusid", unique = true, nullable = false)
    private Integer contstatusid;
    @Column(name = "contid")
    private Integer contid;
    @Column(name = "requeststatus")
    private String requeststatus;
    @Column(name = "requestdate")
    private Date requestdate;
    @Column(name = "deptId")
    private Integer deptId;
    @Column(name = "Suspendtilldate")
    private String Suspendtilldate;
    @Column(name = "Blacklisttilldate")
    private String Blacklisttilldate;
    @Column(name = "suspendremark")
    private String suspendRemark;
    @Column(name = "Blacklistremark")
    private String BlacklistRemark;
    @Column(name="files")
    private String files;
    @Column(name="contstatus")
    private String contstatus;
    @Transient
    private String fullname;
    @Transient
    private String companyname;
    @Transient
    private String email;
    
    public ContractorLogs() {
    }

    public String getSuspendtilldate() {
        return Suspendtilldate;
    }

    public void setSuspendtilldate(String Suspendtilldate) {
        this.Suspendtilldate = Suspendtilldate;
    }

    public String getBlacklisttilldate() {
        return Blacklisttilldate;
    }

    public void setBlacklisttilldate(String Blacklisttilldate) {
        this.Blacklisttilldate = Blacklisttilldate;
    }

    public String getSuspendRemark() {
        return suspendRemark;
    }

    public void setSuspendRemark(String suspendRemark) {
        this.suspendRemark = suspendRemark;
    }

    public String getBlacklistRemark() {
        return BlacklistRemark;
    }

    public void setBlacklistRemark(String BlacklistRemark) {
        this.BlacklistRemark = BlacklistRemark;
    }

    public Integer getContstatusid() {
        return contstatusid;
    }

    public void setContstatusid(Integer contstatusid) {
        this.contstatusid = contstatusid;
    }

    public String getRequeststatus() {
        return requeststatus;
    }

    public void setRequeststatus(String requeststatus) {
        this.requeststatus = requeststatus;
    }

    public Date getRequestdate() {
        return requestdate;
    }

    public void setRequestdate(Date requestdate) {
        this.requestdate = requestdate;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getContid() {
        return contid;
    }

    public void setContid(Integer contid) {
        this.contid = contid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    public String getContstatus() {
        return contstatus;
    }

    public void setContstatus(String contstatus) {
        this.contstatus = contstatus;
    }

    
}
