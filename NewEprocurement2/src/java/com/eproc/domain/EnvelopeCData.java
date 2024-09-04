/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Vaishali Gupta 22-10-2018
 */
@Entity
@Table(name = "envelopec_data")
public class EnvelopeCData {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "envelopeCFieldId")
    private int envelopeCFieldId;

    @Column(name = "encryptedBidByContractor")
    private String encryptedBidByContractor;

    @Column(name = "encryptedBidByDepartmentUser")
    private String encryptedBidByDepartmentUser;

    @Column(name = "encryptedBidByDepartmentAdmin")
    private String encryptedBidByDepartmentAdmin;

    @Column(name = "encryptedDeviationByContractor")
    private String encryptedDeviationByContractor;

    @Column(name = "encryptedDeviationByDepartmentUser")
    private String encryptedDeviationByDepartmentUser;

    @Column(name = "encryptedDeviationByDepartmentAdmin")
    private String encryptedDeviationByDepartmentAdmin;

    @Column(name = "encryptedBidInWordByContractor")
    private String encryptedBidInWordByContractor;

    @Column(name = "encryptedBidInWordByDepartmentUser")
    private String encryptedBidInWordByDepartmentUser;

    @Column(name = "encryptedBidInWordByDepartmentAdmin")
    private String encryptedBidInWordByDepartmentAdmin;

    @Column(name = "tenderId")
    private int tenderId;

    @Column(name = "dateOfBidding")
    private String dateOfBidding;

    @Column(name = "ModifyDateOfBidding")
    private String ModifyDateOfBidding;

    @Column(name = "departmentUserId")
    private String departmentUserId;

    @Column(name = "contractorId")
    private int contractorId;

    @Column(name = "departmentAdminId")
    private int departmentAdminId;

    public String getHashValue() {
        return hashValue;
    }

    public void setHashValue(String hashValue) {
        this.hashValue = hashValue;
    }
    
       @Column(name = "hashValue")
    private String hashValue;

    @Column(name = "departmentId")
    private int departmentId;

    @Column(name = "itemRemark")
    private String itemRemark;

    @Column(name = "dscSerialNoOfContractor")
    private String dscSerialNoOfContractor;

    @Column(name = "dscSerialNo")
    private String dscSerialNo;

    @Column(name = "adminSerialNo")
    private String adminSerialNo;

    @Column(name = "dscExpiryDateOfContractor")
    private String dscExpiryDateOfContractor;

    @Column(name = "dscExpiryDateOfDepartmentUser")
    private String dscExpiryDateOfDepartmentUser;

    @Column(name = "dscExpiryDateOfDepartmentAdmin")
    private String dscExpiryDateOfDepartmentAdmin;

    @Column(name = "contractorStatus")
    private String contractorStatus;

    @Column(name = "checkSum")
    private String checkSum;

//      for item rate 
    @Column(name = "item")
    private String item;

    @Column(name = "specification")
    private String specification;

    @Column(name = "qty")
    private String qty;

    @Column(name = "irtUOM")
    private String irtUOM;

    @Column(name = "itemSerialNo")
    private String itemSerialNo;

    @Column(name = "irtDeptRate")
    private String irtDeptRate;

    @Column(name = "remark")
    private String remark;

    @Column(name = "itemWiseSelected")
    private String itemWiseSelected;

    @Column(name = "rejectRemarkForEA")
    private String rejectRemarkForEA;

    @Column(name = "rejectRemarkForEB")
    private String rejectRemarkForEB;

    @Column(name = "itemWiseId")
    private String itemWiseId;

    @Column(name = "GTECurrencyId")
    private String GTECurrencyId;

    @Column(name = "unitPrice")
    private String unitPrice;

    @Column(name = "fiRate")
    private String fiRate;

    @Column(name = "fiAmount")
    private String fiAmount;

    @Column(name = "cgstRate")
    private String cgstRate;

    @Column(name = "cgstAmount")
    private String cgstAmount;

    @Column(name = "sgstRate")
    private String sgstRate;

    @Column(name = "sgstAmount")
    private String sgstAmount;

    @Column(name = "igstRate")
    private String igstRate;

    @Column(name = "igstAmount")
    private String igstAmount;

    @Column(name = "unitCost")
    private String unitCost;

    @Column(name = "itcAvailed")
    private String itcAvailed;

    @Column(name = "itcAmount")
    private String itcAmount;

    @Column(name = "goodServices")
    private String goodServices;
    
    
    @Column(name = "envelopeCType")
    private String envelopeCType;
    
    
    
    @Column(name = "tenderNumber")
    private String tenderNumber;
    
    
    @Transient
    List<EnvelopeCData> EnvelopeCDataList;

    public int getEnvelopeCFieldId() {
        return envelopeCFieldId;
    }

    public void setEnvelopeCFieldId(int envelopeCFieldId) {
        this.envelopeCFieldId = envelopeCFieldId;
    }

    public String getEncryptedBidByContractor() {
        return encryptedBidByContractor;
    }

    public void setEncryptedBidByContractor(String encryptedBidByContractor) {
        this.encryptedBidByContractor = encryptedBidByContractor;
    }

    public String getEncryptedBidByDepartmentUser() {
        return encryptedBidByDepartmentUser;
    }

    public void setEncryptedBidByDepartmentUser(String encryptedBidByDepartmentUser) {
        this.encryptedBidByDepartmentUser = encryptedBidByDepartmentUser;
    }

    public String getEncryptedBidByDepartmentAdmin() {
        return encryptedBidByDepartmentAdmin;
    }

    public void setEncryptedBidByDepartmentAdmin(String encryptedBidByDepartmentAdmin) {
        this.encryptedBidByDepartmentAdmin = encryptedBidByDepartmentAdmin;
    }

    public String getEncryptedDeviationByContractor() {
        return encryptedDeviationByContractor;
    }

    public void setEncryptedDeviationByContractor(String encryptedDeviationByContractor) {
        this.encryptedDeviationByContractor = encryptedDeviationByContractor;
    }

    public String getEncryptedDeviationByDepartmentUser() {
        return encryptedDeviationByDepartmentUser;
    }

    public void setEncryptedDeviationByDepartmentUser(String encryptedDeviationByDepartmentUser) {
        this.encryptedDeviationByDepartmentUser = encryptedDeviationByDepartmentUser;
    }

    public String getEncryptedDeviationByDepartmentAdmin() {
        return encryptedDeviationByDepartmentAdmin;
    }

    public void setEncryptedDeviationByDepartmentAdmin(String encryptedDeviationByDepartmentAdmin) {
        this.encryptedDeviationByDepartmentAdmin = encryptedDeviationByDepartmentAdmin;
    }

    public String getEncryptedBidInWordByContractor() {
        return encryptedBidInWordByContractor;
    }

    public void setEncryptedBidInWordByContractor(String encryptedBidInWordByContractor) {
        this.encryptedBidInWordByContractor = encryptedBidInWordByContractor;
    }

    public String getEncryptedBidInWordByDepartmentUser() {
        return encryptedBidInWordByDepartmentUser;
    }

    public void setEncryptedBidInWordByDepartmentUser(String encryptedBidInWordByDepartmentUser) {
        this.encryptedBidInWordByDepartmentUser = encryptedBidInWordByDepartmentUser;
    }

    public String getEncryptedBidInWordByDepartmentAdmin() {
        return encryptedBidInWordByDepartmentAdmin;
    }

    public void setEncryptedBidInWordByDepartmentAdmin(String encryptedBidInWordByDepartmentAdmin) {
        this.encryptedBidInWordByDepartmentAdmin = encryptedBidInWordByDepartmentAdmin;
    }

    public int getTenderId() {
        return tenderId;
    }

    public void setTenderId(int tenderId) {
        this.tenderId = tenderId;
    }

   

    public String getDateOfBidding() {
        return dateOfBidding;
    }

    public void setDateOfBidding(String dateOfBidding) {
        this.dateOfBidding = dateOfBidding;
    }

    public String getModifyDateOfBidding() {
        return ModifyDateOfBidding;
    }

    public void setModifyDateOfBidding(String ModifyDateOfBidding) {
        this.ModifyDateOfBidding = ModifyDateOfBidding;
    }

    public String getDepartmentUserId() {
        return departmentUserId;
    }

    public void setDepartmentUserId(String departmentUserId) {
        this.departmentUserId = departmentUserId;
    }

    public int getContractorId() {
        return contractorId;
    }

    public void setContractorId(int contractorId) {
        this.contractorId = contractorId;
    }

    public int getDepartmentAdminId() {
        return departmentAdminId;
    }

    public void setDepartmentAdminId(int departmentAdminId) {
        this.departmentAdminId = departmentAdminId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

  

    public String getItemRemark() {
        return itemRemark;
    }

    public void setItemRemark(String itemRemark) {
        this.itemRemark = itemRemark;
    }

    public String getDscSerialNoOfContractor() {
        return dscSerialNoOfContractor;
    }

    public void setDscSerialNoOfContractor(String dscSerialNoOfContractor) {
        this.dscSerialNoOfContractor = dscSerialNoOfContractor;
    }

    public String getDscSerialNo() {
        return dscSerialNo;
    }

    public void setDscSerialNo(String dscSerialNo) {
        this.dscSerialNo = dscSerialNo;
    }

    public String getAdminSerialNo() {
        return adminSerialNo;
    }

    public void setAdminSerialNo(String adminSerialNo) {
        this.adminSerialNo = adminSerialNo;
    }

    public String getDscExpiryDateOfContractor() {
        return dscExpiryDateOfContractor;
    }

    public void setDscExpiryDateOfContractor(String dscExpiryDateOfContractor) {
        this.dscExpiryDateOfContractor = dscExpiryDateOfContractor;
    }

    public String getDscExpiryDateOfDepartmentUser() {
        return dscExpiryDateOfDepartmentUser;
    }

    public void setDscExpiryDateOfDepartmentUser(String dscExpiryDateOfDepartmentUser) {
        this.dscExpiryDateOfDepartmentUser = dscExpiryDateOfDepartmentUser;
    }

    public String getDscExpiryDateOfDepartmentAdmin() {
        return dscExpiryDateOfDepartmentAdmin;
    }

    public void setDscExpiryDateOfDepartmentAdmin(String dscExpiryDateOfDepartmentAdmin) {
        this.dscExpiryDateOfDepartmentAdmin = dscExpiryDateOfDepartmentAdmin;
    }

    public String getContractorStatus() {
        return contractorStatus;
    }

    public void setContractorStatus(String contractorStatus) {
        this.contractorStatus = contractorStatus;
    }

    public String getCheckSum() {
        return checkSum;
    }

    public void setCheckSum(String checkSum) {
        this.checkSum = checkSum;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }

    public String getIrtUOM() {
        return irtUOM;
    }

    public void setIrtUOM(String irtUOM) {
        this.irtUOM = irtUOM;
    }

    public String getItemSerialNo() {
        return itemSerialNo;
    }

    public void setItemSerialNo(String itemSerialNo) {
        this.itemSerialNo = itemSerialNo;
    }

    public String getIrtDeptRate() {
        return irtDeptRate;
    }

    public void setIrtDeptRate(String irtDeptRate) {
        this.irtDeptRate = irtDeptRate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getItemWiseSelected() {
        return itemWiseSelected;
    }

    public void setItemWiseSelected(String itemWiseSelected) {
        this.itemWiseSelected = itemWiseSelected;
    }

    public String getRejectRemarkForEA() {
        return rejectRemarkForEA;
    }

    public void setRejectRemarkForEA(String rejectRemarkForEA) {
        this.rejectRemarkForEA = rejectRemarkForEA;
    }

    public String getRejectRemarkForEB() {
        return rejectRemarkForEB;
    }

    public void setRejectRemarkForEB(String rejectRemarkForEB) {
        this.rejectRemarkForEB = rejectRemarkForEB;
    }

    public String getItemWiseId() {
        return itemWiseId;
    }

    public void setItemWiseId(String itemWiseId) {
        this.itemWiseId = itemWiseId;
    }

    public String getGTECurrencyId() {
        return GTECurrencyId;
    }

    public void setGTECurrencyId(String GTECurrencyId) {
        this.GTECurrencyId = GTECurrencyId;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getFiRate() {
        return fiRate;
    }

    public void setFiRate(String fiRate) {
        this.fiRate = fiRate;
    }

    public String getFiAmount() {
        return fiAmount;
    }

    public void setFiAmount(String fiAmount) {
        this.fiAmount = fiAmount;
    }

    public String getCgstRate() {
        return cgstRate;
    }

    public void setCgstRate(String cgstRate) {
        this.cgstRate = cgstRate;
    }

    public String getCgstAmount() {
        return cgstAmount;
    }

    public void setCgstAmount(String cgstAmount) {
        this.cgstAmount = cgstAmount;
    }

    public String getSgstRate() {
        return sgstRate;
    }

    public void setSgstRate(String sgstRate) {
        this.sgstRate = sgstRate;
    }

    public String getSgstAmount() {
        return sgstAmount;
    }

    public void setSgstAmount(String sgstAmount) {
        this.sgstAmount = sgstAmount;
    }

    public String getIgstRate() {
        return igstRate;
    }

    public void setIgstRate(String igstRate) {
        this.igstRate = igstRate;
    }

    public String getIgstAmount() {
        return igstAmount;
    }

    public void setIgstAmount(String igstAmount) {
        this.igstAmount = igstAmount;
    }

    public String getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(String unitCost) {
        this.unitCost = unitCost;
    }

    public String getItcAvailed() {
        return itcAvailed;
    }

    public void setItcAvailed(String itcAvailed) {
        this.itcAvailed = itcAvailed;
    }

    public String getItcAmount() {
        return itcAmount;
    }

    public void setItcAmount(String itcAmount) {
        this.itcAmount = itcAmount;
    }

    public String getGoodServices() {
        return goodServices;
    }

    public void setGoodServices(String goodServices) {
        this.goodServices = goodServices;
    }

    public String getTenderNumber() {
        return tenderNumber;
    }

    public void setTenderNumber(String tenderNumber) {
        this.tenderNumber = tenderNumber;
    }

    public List<EnvelopeCData> getEnvelopeCDataList() {
        return EnvelopeCDataList;
    }

    public void setEnvelopeCDataList(List<EnvelopeCData> EnvelopeCDataList) {
        this.EnvelopeCDataList = EnvelopeCDataList;
    }

    public String getEnvelopeCType() {
        return envelopeCType;
    }

    public void setEnvelopeCType(String envelopeCType) {
        this.envelopeCType = envelopeCType;
    }

    @Override
    public String toString() {
        return "EnvelopeCData{" + "encryptedBidByDepartmentUser=" + encryptedBidByDepartmentUser + ", encryptedBidByDepartmentAdmin=" + encryptedBidByDepartmentAdmin + ", encryptedDeviationByContractor=" + encryptedDeviationByContractor + ", encryptedDeviationByDepartmentUser=" + encryptedDeviationByDepartmentUser + ", encryptedDeviationByDepartmentAdmin=" + encryptedDeviationByDepartmentAdmin + ", encryptedBidInWordByContractor=" + encryptedBidInWordByContractor + ", encryptedBidInWordByDepartmentUser=" + encryptedBidInWordByDepartmentUser + ", encryptedBidInWordByDepartmentAdmin=" + encryptedBidInWordByDepartmentAdmin + '}';
    }

    
    
}
