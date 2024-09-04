package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.crypto.SecretKey;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;
/*
 *superadmin Department Form page with all setter() and getter()
 * It can insert and update Department.
 *#Author  Anshu Baghel
 */

@Entity
@Table(name = "departmentadmin")
public class DepartmentAdmin{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer deptId;
    private String deptAdminName;
    private String deptName;
    private String deptStatus;
    private String deptShortName;
    private String deptAddress;
    private String deptEmailId;
    private String deptPhoneNo;
    private String deptMobNo;
    private String deptFaxNo;
    private String deptWebUrl;
//  private String deptLoginId;
    private String deptLoginPass;
    private String deptLogoFileName;
    private String deptLogoFileUrl;
    private String deptWorkOrderFileName;
    private String deptWorkOrderFileUrl;
    private String auctionPrefix;
    private String auctionStartingNo;
    private String tenderPrefix;
    private String tenderStartingNo;
    private String designation;
    private Date createdDate;
    private String deptDescription;
    private String accountNumber;
    private String bankName;
    private String bankOtherName;
    private String bankBranchName;
    private String ifscCode;
    private String subAccountName;
   // private SecretKey secretKey;
    private String role;


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Transient
    private String deptLogo;
    @Transient
    private String workOrder;

    @Transient
    private MultipartFile workOrderFile;
    @Transient
    private MultipartFile cropedFile;
    private String txtCaptchaInput;

    public String getTxtCaptchaInput() {
        return txtCaptchaInput;
    }

    public void setTxtCaptchaInput(String txtCaptchaInput) {
        this.txtCaptchaInput = txtCaptchaInput;
    }

//     @OneToMany(mappedBy = "department", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//       private List<ContractorClass> contractorClassobj;
    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptStatus() {
        return deptStatus;
    }

    public void setDeptStatus(String deptStatus) {
        this.deptStatus = deptStatus;
    }

    public String getDeptShortName() {
        return deptShortName;
    }

    public void setDeptShortName(String deptShortName) {
        this.deptShortName = deptShortName;
    }

    public String getDeptAddress() {
        return deptAddress;
    }

    public void setDeptAddress(String deptAddress) {
        this.deptAddress = deptAddress;
    }

    public String getDeptEmailId() {
        return deptEmailId;
    }

    public void setDeptEmailId(String deptEmailId) {
        this.deptEmailId = deptEmailId;
    }

    public String getDeptPhoneNo() {
        return deptPhoneNo;
    }

    public void setDeptPhoneNo(String deptPhoneNo) {
        this.deptPhoneNo = deptPhoneNo;
    }

    public String getDeptMobNo() {
        return deptMobNo;
    }

    public void setDeptMobNo(String deptMobNo) {
        this.deptMobNo = deptMobNo;
    }

    public String getDeptFaxNo() {
        return deptFaxNo;
    }

    public void setDeptFaxNo(String deptFaxNo) {
        this.deptFaxNo = deptFaxNo;
    }

    public String getDeptWebUrl() {
        return deptWebUrl;
    }

    public void setDeptWebUrl(String deptWebUrl) {
        this.deptWebUrl = deptWebUrl;
    }

    public String getDeptLoginPass() {
        return deptLoginPass;
    }

    public void setDeptLoginPass(String deptLoginPass) {
        this.deptLoginPass = deptLoginPass;
    }

    public String getDeptLogoFileName() {
        return deptLogoFileName;
    }

    public void setDeptLogoFileName(String deptLogoFileName) {
        this.deptLogoFileName = deptLogoFileName;
    }

    public String getDeptLogoFileUrl() {
        return deptLogoFileUrl;
    }

    public void setDeptLogoFileUrl(String deptLogoFileUrl) {
        this.deptLogoFileUrl = deptLogoFileUrl;
    }

    public String getDeptWorkOrderFileName() {
        return deptWorkOrderFileName;
    }

    public void setDeptWorkOrderFileName(String deptWorkOrderFileName) {
        this.deptWorkOrderFileName = deptWorkOrderFileName;
    }

    public String getDeptWorkOrderFileUrl() {
        return deptWorkOrderFileUrl;
    }

    public void setDeptWorkOrderFileUrl(String deptWorkOrderFileUrl) {
        this.deptWorkOrderFileUrl = deptWorkOrderFileUrl;
    }

    public String getDeptLogo() {
        return deptLogo;
    }

    public void setDeptLogo(String deptLogo) {
        this.deptLogo = deptLogo;
    }

    public String getWorkOrder() {
        return workOrder;
    }

    public void setWorkOrder(String workOrder) {
        this.workOrder = workOrder;
    }

    public MultipartFile getWorkOrderFile() {
        return workOrderFile;
    }

    public void setWorkOrderFile(MultipartFile workOrderFile) {
        this.workOrderFile = workOrderFile;
    }

    public MultipartFile getCropedFile() {
        return cropedFile;
    }

    public void setCropedFile(MultipartFile cropedFile) {
        this.cropedFile = cropedFile;
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

    public String getTenderStartingNo() {
        return tenderStartingNo;
    }

    public void setTenderStartingNo(String tenderStartingNo) {
        this.tenderStartingNo = tenderStartingNo;
    }

    public String getTenderPrefix() {
        return tenderPrefix;
    }

    public void setTenderPrefix(String tenderPrefix) {
        this.tenderPrefix = tenderPrefix;
    }

//    public SecretKey getSecretKey() {
//        return secretKey;
//    }
//
//    public void setSecretKey(SecretKey secretKey) {
//        this.secretKey = secretKey;
//    }

    
//    public List<PortalCharges> getPortalcharges() {
//        return portalcharges;
//    }
//
//    public void setPortalcharges(List<PortalCharges> portalcharges) {
//        this.portalcharges = portalcharges;
//    }

    public String getDeptAdminName() {
        return deptAdminName;
    }

    public void setDeptAdminName(String deptAdminName) {
        this.deptAdminName = deptAdminName;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getDeptDescription() {
        return deptDescription;
    }

    public void setDeptDescription(String deptDescription) {
        this.deptDescription = deptDescription;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankOtherName() {
        return bankOtherName;
    }

    public void setBankOtherName(String bankOtherName) {
        this.bankOtherName = bankOtherName;
    }

    public String getBankBranchName() {
        return bankBranchName;
    }

    public void setBankBranchName(String bankBranchName) {
        this.bankBranchName = bankBranchName;
    }

    public String getIfscCode() {
        return ifscCode;
    }

    public void setIfscCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    public String getSubAccountName() {
        return subAccountName;
    }

    public void setSubAccountName(String subAccountName) {
        this.subAccountName = subAccountName;
    }
}
