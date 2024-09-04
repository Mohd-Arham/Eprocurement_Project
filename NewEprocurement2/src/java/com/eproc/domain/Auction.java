package com.eproc.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;

import javax.persistence.Table;
import javax.persistence.Transient;
/*
 *  Auction Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */

@Entity
@Table(name = "auctiontable")
public class Auction implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "auctionId", unique = true, nullable = false)
    private int auctionId;
    // @Column(name = "auctionnumber", unique = true, nullable = false)
    private String auctionnumber;
    private String auctionDispatchDate;
    private String officerName;
    private String offecerId;
    private String auctionPattern;
    private String auction_type;
    private String auctionStatus;
    private String auctionOfWork;
    private String shortDescription;
    private String auctionFees;
    private String auctionFees_In_Word;
    private String portalCharge;
    private String portalCharge_In_Word;
    private String auctionNotice;
    private String auctionCategories;
    private String in_last_minute;
    private String time_to_extend;
    private String extension_allowed;
    private Date currentdatetime;
    private String paymentoffline1;
    private String paymentoffline;
    private String auctoextensonffff;
    private Integer emdStartValue;
    private String emdStartValue_in_word;
    private String msmeDiscount;
    private String paymentofflineEmd;
    private String msmensicExemption;
    private String auctionemdMSMENSICExemption;
    private String auctionfeeMSMENSICExemption;
    private String auctionscstExemption;
    private String auctionfeeSCSTExemption;
    private String auctionemdSCSTFeeExemption;
    private String auctionobcExemption;
    private String auctionfeeOBCExemption;
    private String auctionemdOBCFeeExemption;
    private String auctionemdvalue;
    private String selectportalCharge;
    private Integer deptId;
    private String auctionDispatcherNumbe;
    private String remarks;

    @Transient
    private AuctionKeyDates auctionKeyDates;
    @Transient
    private DocumentAuction auctionDocument;
    @Transient
    private InventoryDocument auctionDocument1;
    @Transient
    private AssetDetails assetDetails;
    @Transient
    private Integer reversePrice;
    @Transient
    private String briefDescription;
    @Transient
    private String auctionStartValue;
    @Transient
    private String auctionPurchaseDateTime;
    @Transient
    private int asset_sid;
    @Transient
    private int assetcId;
    @Transient
    private String auctionBiddingDateTime;
    @Transient
    private String documentSubmissionDateTime;
    @Transient
    private String doc_Name;
    @Transient
    private String doc_OrignalName;
    @Transient
    private String doc_path;
    @Transient
    private String doc_Converted_Name;
    @Transient
    private DepartmentAdmin departmentAdmin;
    @Transient
    private String auctionPrefix;
    @Transient
    private String auctionStartingNo;
    private String selectAddItem;
    private Integer auctionamidmentId;
    private String dynamicTemplate;
    private String deptName;

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public int getAsset_sid() {
        return asset_sid;
    }

    public void setAsset_sid(int asset_sid) {
        this.asset_sid = asset_sid;
    }

    public String getOffecerId() {
        return offecerId;
    }

    public void setOffecerId(String offecerId) {
        this.offecerId = offecerId;
    }

    public int getAssetcId() {
        return assetcId;
    }

    public void setAssetcId(int assetcId) {
        this.assetcId = assetcId;
    }

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }

    public String getAuctionnumber() {
        return auctionnumber;
    }

    public void setAuctionnumber(String auctionnumber) {
        this.auctionnumber = auctionnumber;
    }

    public String getAuctionDispatchDate() {
        return auctionDispatchDate;
    }

    public void setAuctionDispatchDate(String auctionDispatchDate) {
        this.auctionDispatchDate = auctionDispatchDate;
    }

    public String getOfficerName() {
        return officerName;
    }

    public void setOfficerName(String officerName) {
        this.officerName = officerName;
    }

    public String getAuctionPattern() {
        return auctionPattern;
    }

    public void setAuctionPattern(String auctionPattern) {
        this.auctionPattern = auctionPattern;
    }

    public String getAuction_type() {
        return auction_type;
    }

    public void setAuction_type(String auction_type) {
        this.auction_type = auction_type;
    }

    public String getAuctionStatus() {
        return auctionStatus;
    }

    public void setAuctionStatus(String auctionStatus) {
        this.auctionStatus = auctionStatus;
    }

    public String getAuctionOfWork() {
        return auctionOfWork;
    }

    public void setAuctionOfWork(String auctionOfWork) {
        this.auctionOfWork = auctionOfWork;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getAuctionFees() {
        return auctionFees;
    }

    public void setAuctionFees(String auctionFees) {
        this.auctionFees = auctionFees;
    }

    public String getAuctionFees_In_Word() {
        return auctionFees_In_Word;
    }

    public void setAuctionFees_In_Word(String auctionFees_In_Word) {
        this.auctionFees_In_Word = auctionFees_In_Word;
    }

    public String getPortalCharge() {
        return portalCharge;
    }

    public void setPortalCharge(String portalCharge) {
        this.portalCharge = portalCharge;
    }

    public String getPortalCharge_In_Word() {
        return portalCharge_In_Word;
    }

    public void setPortalCharge_In_Word(String portalCharge_In_Word) {
        this.portalCharge_In_Word = portalCharge_In_Word;
    }

    public String getAuctionNotice() {
        return auctionNotice;
    }

    public void setAuctionNotice(String auctionNotice) {
        this.auctionNotice = auctionNotice;
    }

    public String getAuctionCategories() {
        return auctionCategories;
    }

    public void setAuctionCategories(String auctionCategories) {
        this.auctionCategories = auctionCategories;
    }

    public String getIn_last_minute() {
        return in_last_minute;
    }

    public void setIn_last_minute(String in_last_minute) {
        this.in_last_minute = in_last_minute;
    }

    public String getTime_to_extend() {
        return time_to_extend;
    }

    public void setTime_to_extend(String time_to_extend) {
        this.time_to_extend = time_to_extend;
    }

    public String getExtension_allowed() {
        return extension_allowed;
    }

    public void setExtension_allowed(String extension_allowed) {
        this.extension_allowed = extension_allowed;
    }

    public Date getCurrentdatetime() {
        return currentdatetime;
    }

    public void setCurrentdatetime(Date currentdatetime) {
        this.currentdatetime = currentdatetime;
    }

    public String getPaymentoffline1() {
        return paymentoffline1;
    }

    public void setPaymentoffline1(String paymentoffline1) {
        this.paymentoffline1 = paymentoffline1;
    }

    public String getPaymentoffline() {
        return paymentoffline;
    }

    public void setPaymentoffline(String paymentoffline) {
        this.paymentoffline = paymentoffline;
    }

    public String getAuctoextensonffff() {
        return auctoextensonffff;
    }

    public void setAuctoextensonffff(String auctoextensonffff) {
        this.auctoextensonffff = auctoextensonffff;
    }

    public Integer getEmdStartValue() {
        return emdStartValue;
    }

    public void setEmdStartValue(Integer emdStartValue) {
        this.emdStartValue = emdStartValue;
    }

    public String getEmdStartValue_in_word() {
        return emdStartValue_in_word;
    }

    public void setEmdStartValue_in_word(String emdStartValue_in_word) {
        this.emdStartValue_in_word = emdStartValue_in_word;
    }

    public String getMsmeDiscount() {
        return msmeDiscount;
    }

    public void setMsmeDiscount(String msmeDiscount) {
        this.msmeDiscount = msmeDiscount;
    }

    public String getPaymentofflineEmd() {
        return paymentofflineEmd;
    }

    public void setPaymentofflineEmd(String paymentofflineEmd) {
        this.paymentofflineEmd = paymentofflineEmd;
    }

    public String getMsmensicExemption() {
        return msmensicExemption;
    }

    public void setMsmensicExemption(String msmensicExemption) {
        this.msmensicExemption = msmensicExemption;
    }

    public String getAuctionemdMSMENSICExemption() {
        return auctionemdMSMENSICExemption;
    }

    public void setAuctionemdMSMENSICExemption(String auctionemdMSMENSICExemption) {
        this.auctionemdMSMENSICExemption = auctionemdMSMENSICExemption;
    }

    public String getAuctionfeeMSMENSICExemption() {
        return auctionfeeMSMENSICExemption;
    }

    public void setAuctionfeeMSMENSICExemption(String auctionfeeMSMENSICExemption) {
        this.auctionfeeMSMENSICExemption = auctionfeeMSMENSICExemption;
    }

    public String getAuctionscstExemption() {
        return auctionscstExemption;
    }

    public void setAuctionscstExemption(String auctionscstExemption) {
        this.auctionscstExemption = auctionscstExemption;
    }

    public String getAuctionfeeSCSTExemption() {
        return auctionfeeSCSTExemption;
    }

    public void setAuctionfeeSCSTExemption(String auctionfeeSCSTExemption) {
        this.auctionfeeSCSTExemption = auctionfeeSCSTExemption;
    }

    public String getAuctionemdSCSTFeeExemption() {
        return auctionemdSCSTFeeExemption;
    }

    public void setAuctionemdSCSTFeeExemption(String auctionemdSCSTFeeExemption) {
        this.auctionemdSCSTFeeExemption = auctionemdSCSTFeeExemption;
    }

    public String getAuctionobcExemption() {
        return auctionobcExemption;
    }

    public void setAuctionobcExemption(String auctionobcExemption) {
        this.auctionobcExemption = auctionobcExemption;
    }

    public String getAuctionfeeOBCExemption() {
        return auctionfeeOBCExemption;
    }

    public void setAuctionfeeOBCExemption(String auctionfeeOBCExemption) {
        this.auctionfeeOBCExemption = auctionfeeOBCExemption;
    }

    public String getAuctionemdOBCFeeExemption() {
        return auctionemdOBCFeeExemption;
    }

    public void setAuctionemdOBCFeeExemption(String auctionemdOBCFeeExemption) {
        this.auctionemdOBCFeeExemption = auctionemdOBCFeeExemption;
    }

    public String getAuctionemdvalue() {
        return auctionemdvalue;
    }

    public void setAuctionemdvalue(String auctionemdvalue) {
        this.auctionemdvalue = auctionemdvalue;
    }

    public String getSelectportalCharge() {
        return selectportalCharge;
    }

    public void setSelectportalCharge(String selectportalCharge) {
        this.selectportalCharge = selectportalCharge;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getAuctionDispatcherNumbe() {
        return auctionDispatcherNumbe;
    }

    public void setAuctionDispatcherNumbe(String auctionDispatcherNumbe) {
        this.auctionDispatcherNumbe = auctionDispatcherNumbe;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public AuctionKeyDates getAuctionKeyDates() {
        return auctionKeyDates;
    }

    public void setAuctionKeyDates(AuctionKeyDates auctionKeyDates) {
        this.auctionKeyDates = auctionKeyDates;
    }

    public DocumentAuction getAuctionDocument() {
        return auctionDocument;
    }

    public void setAuctionDocument(DocumentAuction auctionDocument) {
        this.auctionDocument = auctionDocument;
    }

    public InventoryDocument getAuctionDocument1() {
        return auctionDocument1;
    }

    public void setAuctionDocument1(InventoryDocument auctionDocument1) {
        this.auctionDocument1 = auctionDocument1;
    }

    public AssetDetails getAssetDetails() {
        return assetDetails;
    }

    public void setAssetDetails(AssetDetails assetDetails) {
        this.assetDetails = assetDetails;
    }

    public Integer getReversePrice() {
        return reversePrice;
    }

    public void setReversePrice(Integer reversePrice) {
        this.reversePrice = reversePrice;
    }

    public String getBriefDescription() {
        return briefDescription;
    }

    public void setBriefDescription(String briefDescription) {
        this.briefDescription = briefDescription;
    }

    public String getAuctionStartValue() {
        return auctionStartValue;
    }

    public void setAuctionStartValue(String auctionStartValue) {
        this.auctionStartValue = auctionStartValue;
    }

    public String getAuctionPurchaseDateTime() {
        return auctionPurchaseDateTime;
    }

    public void setAuctionPurchaseDateTime(String auctionPurchaseDateTime) {
        this.auctionPurchaseDateTime = auctionPurchaseDateTime;
    }

    public String getAuctionBiddingDateTime() {
        return auctionBiddingDateTime;
    }

    public void setAuctionBiddingDateTime(String auctionBiddingDateTime) {
        this.auctionBiddingDateTime = auctionBiddingDateTime;
    }

    public String getDocumentSubmissionDateTime() {
        return documentSubmissionDateTime;
    }

    public void setDocumentSubmissionDateTime(String documentSubmissionDateTime) {
        this.documentSubmissionDateTime = documentSubmissionDateTime;
    }

    public String getDoc_Name() {
        return doc_Name;
    }

    public void setDoc_Name(String doc_Name) {
        this.doc_Name = doc_Name;
    }

    public String getDoc_OrignalName() {
        return doc_OrignalName;
    }

    public void setDoc_OrignalName(String doc_OrignalName) {
        this.doc_OrignalName = doc_OrignalName;
    }

    public String getDoc_path() {
        return doc_path;
    }

    public void setDoc_path(String doc_path) {
        this.doc_path = doc_path;
    }

    public String getDoc_Converted_Name() {
        return doc_Converted_Name;
    }

    public void setDoc_Converted_Name(String doc_Converted_Name) {
        this.doc_Converted_Name = doc_Converted_Name;
    }

    public DepartmentAdmin getDepartmentAdmin() {
        return departmentAdmin;
    }

    public void setDepartmentAdmin(DepartmentAdmin departmentAdmin) {
        this.departmentAdmin = departmentAdmin;
    }

    public String getAuctionPrefix() {
        return auctionPrefix;
    }

    public void setAuctionPrefix(String auctionPrefix) {
        this.auctionPrefix = auctionPrefix;
    }

    public String getAuctionStartingNo() {
        return auctionStartingNo;
    }

    public void setAuctionStartingNo(String auctionStartingNo) {
        this.auctionStartingNo = auctionStartingNo;
    }

    public String getSelectAddItem() {
        return selectAddItem;
    }

    public void setSelectAddItem(String selectAddItem) {
        this.selectAddItem = selectAddItem;
    }

    public Integer getAuctionamidmentId() {
        return auctionamidmentId;
    }

    public void setAuctionamidmentId(Integer auctionamidmentId) {
        this.auctionamidmentId = auctionamidmentId;
    }

    public String getDynamicTemplate() {
        return dynamicTemplate;
    }

    public void setDynamicTemplate(String dynamicTemplate) {
        this.dynamicTemplate = dynamicTemplate;
    }

}
