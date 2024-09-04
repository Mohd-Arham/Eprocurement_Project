/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author lincpay Solutions
 */

@Entity
@Table(name="Comparison_sheet")
public class ComparisonSheet {
    
    @Id
   @GeneratedValue(strategy= GenerationType.AUTO)
   private Integer comparisonSheetId;
    
     private Integer contractorId;
    
    private Integer tenderId;
    
    private Integer departmentUserId;
    
    
    private BigDecimal  bidValue;
    
    private String bidValueInText;
    
      @Transient
      private String companyName;
      
      private  String tenderNo;

    public Integer getComparisonSheetId() {
        return comparisonSheetId;
    }

    public void setComparisonSheetId(Integer comparisonSheetId) {
        this.comparisonSheetId = comparisonSheetId;
    }

    public Integer getContractorId() {
        return contractorId;
    }

    public void setContractorId(Integer contractorId) {
        this.contractorId = contractorId;
    }

    public Integer getTenderId() {
        return tenderId;
    }

    public void setTenderId(Integer tenderId) {
        this.tenderId = tenderId;
    }

    public Integer getDepartmentUserId() {
        return departmentUserId;
    }

    public void setDepartmentUserId(Integer departmentUserId) {
        this.departmentUserId = departmentUserId;
    }

    public BigDecimal getBidValue() {
        return bidValue;
    }

    public void setBidValue(BigDecimal bidValue) {
        this.bidValue = bidValue;
    }

    public String getBidValueInText() {
        return bidValueInText;
    }

    public void setBidValueInText(String bidValueInText) {
        this.bidValueInText = bidValueInText;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getTenderNo() {
        return tenderNo;
    }

    public void setTenderNo(String tenderNo) {
        this.tenderNo = tenderNo;
    }

    @Override
    public String toString() {
        return "ComparisonSheet{" + "comparisonSheetId=" + comparisonSheetId + ", contractorId=" + contractorId + ", tenderId=" + tenderId + ", departmentUserId=" + departmentUserId + ", bidValue=" + bidValue + ", bidValueInText=" + bidValueInText + ", companyName=" + companyName + ", tenderNo=" + tenderNo + '}';
    }
    
   
    
    
    
}
