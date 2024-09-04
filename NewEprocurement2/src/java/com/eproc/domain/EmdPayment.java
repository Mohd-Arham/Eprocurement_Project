/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;
/*
 * @author Anshu Baghel
 */

@Entity
@Table(name = "emd_table")
public class EmdPayment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer emdId;
    private String emdInFig;
    private String emdCopy;
    private String bankName;
    private String bankOtherName;
    private String emdCopyUrl;
    private Integer tender_Id;
    private Integer contractorId;
    private String status;
    private String bankBranchName;
    private String emdValidity;
    private String remark;
    private String emdExemption;
    private String remainEmd;
    private Date createdDate;

    @Transient
    private MultipartFile emdCopyFile;

    public Integer getEmdId() {
        return emdId;
    }

    public void setEmdId(Integer emdId) {
        this.emdId = emdId;
    }

    public String getEmdInFig() {
        return emdInFig;
    }

    public void setEmdInFig(String emdInFig) {
        this.emdInFig = emdInFig;
    }

    public String getEmdCopy() {
        return emdCopy;
    }

    public void setEmdCopy(String emdCopy) {
        this.emdCopy = emdCopy;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public MultipartFile getEmdCopyFile() {
        return emdCopyFile;
    }

    public void setEmdCopyFile(MultipartFile emdCopyFile) {
        this.emdCopyFile = emdCopyFile;
    }

    public String getEmdCopyUrl() {
        return emdCopyUrl;
    }

    public void setEmdCopyUrl(String emdCopyUrl) {
        this.emdCopyUrl = emdCopyUrl;
    }

    public Integer getTender_Id() {
        return tender_Id;
    }

    public void setTender_Id(Integer tender_Id) {
        this.tender_Id = tender_Id;
    }

    public Integer getContractorId() {
        return contractorId;
    }

    public void setContractorId(Integer contractorId) {
        this.contractorId = contractorId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBankBranchName() {
        return bankBranchName;
    }

    public void setBankBranchName(String bankBranchName) {
        this.bankBranchName = bankBranchName;
    }

    public String getEmdValidity() {
        return emdValidity;
    }

    public void setEmdValidity(String emdValidity) {
        this.emdValidity = emdValidity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getBankOtherName() {
        return bankOtherName;
    }

    public void setBankOtherName(String bankOtherName) {
        this.bankOtherName = bankOtherName;
    }

    public String getEmdExemption() {
        return emdExemption;
    }

    public void setEmdExemption(String emdExemption) {
        this.emdExemption = emdExemption;
    }

    public String getRemainEmd() {
        return remainEmd;
    }

    public void setRemainEmd(String remainEmd) {
        this.remainEmd = remainEmd;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
