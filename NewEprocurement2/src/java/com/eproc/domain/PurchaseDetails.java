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
 * @author Naina Jain
 */
@Entity
@Table(name = "purchasedetails")
public class PurchaseDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "purchaseId")
    private int purchaseId;

    @Column(name = "auctionId")
    private int auctionId;

    @Column(name = "auctionFees")
    private String auctionFees;

    @Column(name = "deptId")
    private int deptId;

    @Column(name = "contractorId")
    private int contractorId;

    @Column(name = "tender_Id")
    private int tender_Id;

    @Column(name = "tenderFeeInFig")
    private String tenderFeeInFig;

    @Column(name = "purchaseDate")
    private String purchaseDate;

    @Column(name = "responseDateTime")
    private String responseDateTime;

    @Column(name = "transaction_Id")
    private String transaction_Id;

    @Column(name = "bank_transaction_Id")
    private String bank_transaction_Id;

    @Column(name = "bankStatus")
    private String bankStatus;

    @Column(name = "bank_description")
    private String bank_description;

    @Column(name = "loginErrorMessage")
    private String loginErrorMessage;

    @Column(name = "bankJson")
    private String bankJson;

    public int getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(int purchaseId) {
        this.purchaseId = purchaseId;
    }

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }

    public String getAuctionFees() {
        return auctionFees;
    }

    public void setAuctionFees(String auctionFees) {
        this.auctionFees = auctionFees;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public int getContractorId() {
        return contractorId;
    }

    public void setContractorId(int contractorId) {
        this.contractorId = contractorId;
    }

    public int getTender_Id() {
        return tender_Id;
    }

    public void setTender_Id(int tender_Id) {
        this.tender_Id = tender_Id;
    }

    public String getTenderFeeInFig() {
        return tenderFeeInFig;
    }

    public void setTenderFeeInFig(String tenderFeeInFig) {
        this.tenderFeeInFig = tenderFeeInFig;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getTransaction_Id() {
        return transaction_Id;
    }

    public void setTransaction_Id(String transaction_Id) {
        this.transaction_Id = transaction_Id;
    }

    public String getBank_transaction_Id() {
        return bank_transaction_Id;
    }

    public void setBank_transaction_Id(String bank_transaction_Id) {
        this.bank_transaction_Id = bank_transaction_Id;
    }

    public String getBankStatus() {
        return bankStatus;
    }

    public void setBankStatus(String bankStatus) {
        this.bankStatus = bankStatus;
    }

    public String getBank_description() {
        return bank_description;
    }

    public void setBank_description(String bank_description) {
        this.bank_description = bank_description;
    }

    public String getLoginErrorMessage() {
        return loginErrorMessage;
    }

    public void setLoginErrorMessage(String loginErrorMessage) {
        this.loginErrorMessage = loginErrorMessage;
    }

    public String getBankJson() {
        return bankJson;
    }

    public void setBankJson(String bankJson) {
        this.bankJson = bankJson;
    }

    public String getResponseDateTime() {
        return responseDateTime;
    }

    public void setResponseDateTime(String responseDateTime) {
        this.responseDateTime = responseDateTime;
    }

    @Override
    public String toString() {
        return "PurchaseDetails{" + "purchaseId=" + purchaseId + ", auctionId=" + auctionId + ", auctionFees=" + auctionFees + ", deptId=" + deptId + ", contractorId=" + contractorId + ", tender_Id=" + tender_Id + ", tenderFeeInFig=" + tenderFeeInFig + ", purchaseDate=" + purchaseDate + ", responseDateTime=" + responseDateTime + ", transaction_Id=" + transaction_Id + ", bank_transaction_Id=" + bank_transaction_Id + ", bankStatus=" + bankStatus + ", bank_description=" + bank_description + ", loginErrorMessage=" + loginErrorMessage + ", bankJson=" + bankJson + '}';
    }

}
