/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.crypto.SecretKey;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/*
 * @author Yashovardhan Singh 
 * Pojo Class of Contractor Data Member of Contractor
 */
@Entity
@Table(name = "contractor")
public class Contractor {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "firstname")
    private String firstname;
    @Column(name = "lastname")
    private String lastname;
    @Column(name = "middlename")
    private String middlename;
    @Column(name = "fullname")
    private String fullname;
  
    @Column(name = "designation")
    private String designation;
    @Column(name = "otherDesignation")
    private String otherDesignation;
    @Column(name = "emailid")
    private String emailid;
    @Column(name = "mobileno")
    private String mobileno;
    @Column(name = "password")
    private String password;
    @Column(name = "date")
    private Date date;
    @Column(name = "contractorType")
    private String contractorType;
   
   @Column(name="requeststatus")
 private String requeststatus;
//    @Column(name = "secretKey")
//    private SecretKey secretKey;

    @Transient
    private String newPassword;
    @Transient
    private String currentPassword;
    @Column(name = "txtCaptchaInput")
    private String txtCaptchaInput;
    @Column(name = "emailVarifyStatus")
    private String emailStatus;
    @Column(name = "mobileVerifyStatus")
    private String mobileStatus;
    @Column(name = "otpVerifyStatus")
    private String otpStatus;
    private String dialCode; 
    @Transient
    private String designationName;
    @Transient
    private String openingResult;
    @Transient
    EnvelopeCData envelopeCList;
    @Transient
    private boolean envelopeOpeningStatus;

    public String getDesignationName() {
        return designationName;
    }

    public void setDesignationName(String designationName) {
        this.designationName = designationName;
    }

//    public SecretKey getSecretKey() {
//        return secretKey;
//    }
//
//    public void setSecretKey(SecretKey secretKey) {
//        this.secretKey = secretKey;
//    }

    @Transient
    private String companyName;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    
    
    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getCurrentPassword() {
        return currentPassword;
    }

    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Contractor() {
    }

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
  public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getTxtCaptchaInput() {
        return txtCaptchaInput;
    }

    public String getRequeststatus() {
        return requeststatus;
    }

    public void setRequeststatus(String requeststatus) {
        this.requeststatus = requeststatus;
    }

    
    public void setTxtCaptchaInput(String txtCaptchaInput) {
        this.txtCaptchaInput = txtCaptchaInput;
    }

    public String getContractorType() {
        return contractorType;
    }

    public void setContractorType(String contractorType) {
        this.contractorType = contractorType;
    }

    public String getOtherDesignation() {
        return otherDesignation;
    }

    public void setOtherDesignation(String otherDesignation) {
        this.otherDesignation = otherDesignation;
    }

    public String getEmailStatus() {
        return emailStatus;
    }

    public void setEmailStatus(String emailStatus) {
        this.emailStatus = emailStatus;
    }

    public String getMobileStatus() {
        return mobileStatus;
    }

    public void setMobileStatus(String mobileStatus) {
        this.mobileStatus = mobileStatus;
    }

    public String getOtpStatus() {
        return otpStatus;
    }

    public void setOtpStatus(String otpStatus) {
        this.otpStatus = otpStatus;
    }

    public String getDialCode() {
        return dialCode;
    }

    public void setDialCode(String dialCode) {
        this.dialCode = dialCode;
    }

    public String getOpeningResult() {
        return openingResult;
    }

    public void setOpeningResult(String openingResult) {
        this.openingResult = openingResult;
    }

    public EnvelopeCData getEnvelopeCList() {
        return envelopeCList;
    }

    public void setEnvelopeCList(EnvelopeCData envelopeCList) {
        this.envelopeCList = envelopeCList;
    }

    public boolean isEnvelopeOpeningStatus() {
        return envelopeOpeningStatus;
    }

    public void setEnvelopeOpeningStatus(boolean envelopeOpeningStatus) {
        this.envelopeOpeningStatus = envelopeOpeningStatus;
    }

    @Override
    public String toString() {
        return "Contractor{" + "id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", middlename=" + middlename + ", fullname=" + fullname + ", designation=" + designation + ", otherDesignation=" + otherDesignation + ", emailid=" + emailid + ", mobileno=" + mobileno + ", password=" + password + ", date=" + date + ", contractorType=" + contractorType + ", requeststatus=" + requeststatus + ", newPassword=" + newPassword + ", currentPassword=" + currentPassword + ", txtCaptchaInput=" + txtCaptchaInput + ", emailStatus=" + emailStatus + ", mobileStatus=" + mobileStatus + ", otpStatus=" + otpStatus + ", dialCode=" + dialCode + ", designationName=" + designationName + ", openingResult=" + openingResult + ", envelopeCList=" + envelopeCList + ", envelopeOpeningStatus=" + envelopeOpeningStatus + ", companyName=" + companyName + '}';
    }
      
}
