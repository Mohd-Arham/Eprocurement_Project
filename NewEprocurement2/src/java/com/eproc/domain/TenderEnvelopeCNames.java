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
 * @author lincpay Solutions
 */
@Entity
@Table(name = "tenderenvelopecnames")
public class TenderEnvelopeCNames {
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tender_EnvelopeCName_Id")
    private int tender_EnvelopeCName_Id;
    
    @Column(name = "envelopeCTemplateName")
    private String envelopeCTemplateName;
    
    @Column(name = "departmentUserName")
    private String departmentUserName;
    
    @Column(name = "deptId")
    private String deptId;

    public int getTender_EnvelopeCName_Id() {
        return tender_EnvelopeCName_Id;
    }

    public void setTender_EnvelopeCName_Id(int tender_EnvelopeCName_Id) {
        this.tender_EnvelopeCName_Id = tender_EnvelopeCName_Id;
    }

    public String getEnvelopeCTemplateName() {
        return envelopeCTemplateName;
    }

    public void setEnvelopeCTemplateName(String envelopeCTemplateName) {
        this.envelopeCTemplateName = envelopeCTemplateName;
    }

    
    public String getDepartmentUserName() {
        return departmentUserName;
    }

    public void setDepartmentUserName(String departmentUserName) {
        this.departmentUserName = departmentUserName;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
    
}
