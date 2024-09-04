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
 * @author Gaurav Dubey
 */
@Entity
@Table(name = "tenderenvelopebnames")
public class TenderEnvelopeBNames {
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tender_EnvelopeAName_Id")
    private int tender_EnvelopeAName_Id;
    
    @Column(name = "envelopeATemplateName")
    private String envelopeATemplateName;
    
    @Column(name = "departmentUserName")
    private String departmentUserName;
    
    @Column(name = "deptId")
    private String deptId;

    public int getTender_EnvelopeAName_Id() {
        return tender_EnvelopeAName_Id;
    }

    public void setTender_EnvelopeAName_Id(int tender_EnvelopeAName_Id) {
        this.tender_EnvelopeAName_Id = tender_EnvelopeAName_Id;
    }

    public String getEnvelopeATemplateName() {
        return envelopeATemplateName;
    }

    public void setEnvelopeATemplateName(String envelopeATemplateName) {
        this.envelopeATemplateName = envelopeATemplateName;
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
