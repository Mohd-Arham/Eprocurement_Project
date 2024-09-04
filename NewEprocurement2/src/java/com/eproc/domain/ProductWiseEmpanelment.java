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
import javax.persistence.Transient;

/**
 *
 * @author Mansi Jain
 */
@Entity
@Table(name = "productwiseempanelment")
public class ProductWiseEmpanelment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "empanelmentId", unique = true, nullable = false)
    private Integer empanelmentId;

    @Column(name = "TenderCategory")
    private String TenderCategory;

    @Column(name = "AreaOfWork")
    private String AreaOfWork;

    @Column(name = "deptId")
    private Integer deptId;

    @Column(name = "Createddate")
    private Date Createddate;

    @Column(name = "CurrencyCode")
    private String CurrencyCode;

    @Column(name = "Amount")
    private String Amount;

    @Column(name = "status")
    private String status;

    @Column(name = "templatenameId")
    private Integer templatenameId;
    
     @Column(name = "templateStatus")
    private String templateStatus;

     @Column(name = "rejectremark")
    private String rejectremark;
 
     @Column(name = "contId")
    private String contId;
     
     
 @Column(name = "remarkDate")
    private String remarkDate;
     
    public Integer getEmpanelmentId() {
        return empanelmentId;
    }

    public void setEmpanelmentId(Integer empanelmentId) {
        this.empanelmentId = empanelmentId;
    }

    public String getTenderCategory() {
        return TenderCategory;
    }

    public void setTenderCategory(String TenderCategory) {
        this.TenderCategory = TenderCategory;
    }

    public String getAreaOfWork() {
        return AreaOfWork;
    }

    public void setAreaOfWork(String AreaOfWork) {
        this.AreaOfWork = AreaOfWork;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Date getCreateddate() {
        return Createddate;
    }

    public void setCreateddate(Date Createddate) {
        this.Createddate = Createddate;
    }

    public String getCurrencyCode() {
        return CurrencyCode;
    }

    public void setCurrencyCode(String CurrencyCode) {
        this.CurrencyCode = CurrencyCode;
    }

    public String getAmount() {
        return Amount;
    }

    public void setAmount(String Amount) {
        this.Amount = Amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContId() {
        return contId;
    }

    public void setContId(String contId) {
        this.contId = contId;
    }

    public Integer getTemplatenameId() {
        return templatenameId;
    }

    public void setTemplatenameId(Integer templatenameId) {
        this.templatenameId = templatenameId;
    }

    public String getTemplateStatus() {
        return templateStatus;
    }

    public void setTemplateStatus(String templateStatus) {
        this.templateStatus = templateStatus;
    }

    public String getRejectremark() {
        return rejectremark;
    }

    public void setRejectremark(String rejectremark) {
        this.rejectremark = rejectremark;
    }

    public String getRemarkDate() {
        return remarkDate;
    }

    public void setRemarkDate(String remarkDate) {
        this.remarkDate = remarkDate;
    }


}
