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

/**
 *
 * @author Vaishali Gupta
 * 19-08-2018
 */

@Entity
@Table(name = "secondary_contractor")
public class Secondary_Contractor  implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "contractorSecndry_regId")
    private int contractorSecndry_regId;
    
    @Column(name="contractor_privilege")
    private String contractor_privilege;
    
    @Column(name = "emailid")
    private String emailid;
      
    @Column(name = "mobileno")
    private String mobileno;
    
    @Column(name = "firstName")
    private String firstName;
    
    @Column(name = "lastName")
    private String lastName;
    
    @Column(name="address")
    private String address;
    
    @Column(name="status")
    private String status;
    
    @Column(name="password")
    private String Password;
    
     @Column(name = "secretKey")
    private SecretKey secretKey;
     
     @Column(name="primaryContractor_regId")
     private int primaryContractor_regId;
     
     
     @Column(name = "designation")
    private String designation;
     
     @Transient
     private String designationName;
     
      @Column(name = "emailVerifyStatus")
     private String emailVerifyStatus;
      
      @Column(name = "mobileVerifyStatus")
     private String mobileVerifyStatus;
      
     @Column(name = "otpAlertStatus")
     private String otpAlertStatus;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
      
     
      
    @Column(name = "created_Date")
    private Date created_Date ;
     
//    
//    @OneToOne(mappedBy = "Secondary_Contractor", cascade = CascadeType.ALL)
//    private Contractor Contractor;

  
    public int getContractorSecndry_regId() {
        return contractorSecndry_regId;
    }

    public void setContractorSecndry_regId(int contractorSecndry_regId) {
        this.contractorSecndry_regId = contractorSecndry_regId;
    }

    public String getContractor_privilege() {
        return contractor_privilege;
    }

    public void setContractor_privilege(String contractor_privilege) {
        this.contractor_privilege = contractor_privilege;
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

  

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
   
     public SecretKey getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(SecretKey secretKey) {
        this.secretKey = secretKey;
    }

    public int getPrimaryContractor_regId() {
        return primaryContractor_regId;
    }

    public void setPrimaryContractor_regId(int primaryContractor_regId) {
        this.primaryContractor_regId = primaryContractor_regId;
    }

//    public Contractor getContractor() {
//        return Contractor;
//    }
//
//    public void setContractor(Contractor Contractor) {
//        this.Contractor = Contractor;
//    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getEmailVerifyStatus() {
        return emailVerifyStatus;
    }

    public void setEmailVerifyStatus(String emailVerifyStatus) {
        this.emailVerifyStatus = emailVerifyStatus;
    }

    public String getMobileVerifyStatus() {
        return mobileVerifyStatus;
    }

    public void setMobileVerifyStatus(String mobileVerifyStatus) {
        this.mobileVerifyStatus = mobileVerifyStatus;
    }

    public Date getCreated_Date() {
        return created_Date;
    }

    public void setCreated_Date(Date created_Date) {
        this.created_Date = created_Date;
    }

    public String getDesignationName() {
        return designationName;
    }

    public void setDesignationName(String designationName) {
        this.designationName = designationName;
    }

    public String getOtpAlertStatus() {
        return otpAlertStatus;
    }

    public void setOtpAlertStatus(String otpAlertStatus) {
        this.otpAlertStatus = otpAlertStatus;
    }
    
    
   
    
}
