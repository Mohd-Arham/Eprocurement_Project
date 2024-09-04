/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;


import java.sql.Date;
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
 * 02-08-2018
 * 
 */

@Entity
@Table(name="department_secondaryuser")
public class DepartmentSecondaryUser{
  
   @Id
   @Column(name ="secondory_reg_Id")
   @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer secondory_reg_Id;
  
    @Column(name = "firstName")
    private String firstName;
    
    @Column(name = "lastName")
    private String lastName;
    
    @Column(name = "mobNo")
    private String mobNo;
    
    @Column(name = "emailAdd")
    private String emailAdd;
    
    @Column(name = "dob")
    private String dob;
    
    @Column(name = "userType")
    private String userType;
    
    @Column(name = "password")
    private String password;
     
    @Column(name = "status")
    private String status;
    
    @Column(name = "panCardNo")
    private String panCardNo;
    
    @Column(name = "address")
    private String address;
    
    @Column(name = "pincode")
    private String pincode;
    
    @Column(name = "city")
    private String city;
    
    @Column(name = "state")
    private String state;
    
    @Column(name = "deptcircle")
    private Integer deptcircle;
    
    @Column(name = "deptDivision")
    private Integer deptDivision;
    
    @Column(name = "deptSubDivision")
    private Integer deptSubDivision;
    
    @Column(name = "deptId")
    private Integer deptId;
    
//    @Column(name = "secretKey")
//    private SecretKey secretKey;
       
    @Column(name = "designation")
    private Integer designationName;
    
    @Column(name = "deptUserRegistrationDate")
    private Date deptUserRegistrationDate;
    
    @Column(name = "lastModifiedBy")
    private String lastModifiedBy;
    
    @Column(name = "lastModifiedOn")
    private String lastModifiedOn;
    
    @Column(name = "userStatus")
    private String userStatus;
    
    @Column(name = "deptName")
    private String deptName;
  
    @Column(name="paclimit")
    private String paclimit;
    
    @Column(name="paclimitInWords")
    private String paclimitInWords;
    
    @Transient
    private String circle;
    
    @Transient
    private String division;
    
    @Transient
    private String subDivision;
    
    @Transient
    private String designations;
    
    @Column(name = "DepartmentUserPrivilege")
      private String userPrivileges;
  
    @Column(name = "reg_Id")
      private Integer reg_Id;
    
    @Column(name = "email_verified")
    private String email_verified;
     
    @Column(name = "mobile_verified")
    private String mobile_verified;
      
    @Column(name = "otp_alertStatus")
    private String otp_alertStatus;
     
//   @ManyToOne
//    @JoinColumn(name = "reg_Id")
//    private DepartmentUser departmentUser;
////
//    public DepartmentUser getDepartmentUser() {
//        return departmentUser;
//    }
//
//    public void setDepartmentUser(DepartmentUser departmentUser) {
//        this.departmentUser = departmentUser;
//    }

    public Integer getSecondory_reg_Id() {
        return secondory_reg_Id;
    }

    public void setSecondory_reg_Id(Integer secondory_reg_Id) {
        this.secondory_reg_Id = secondory_reg_Id;
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

    public String getMobNo() {
        return mobNo;
    }

    public void setMobNo(String mobNo) {
        this.mobNo = mobNo;
    }

    public String getEmailAdd() {
        return emailAdd;
    }

    public void setEmailAdd(String emailAdd) {
        this.emailAdd = emailAdd;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

 
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPanCardNo() {
        return panCardNo;
    }

    public void setPanCardNo(String panCardNo) {
        this.panCardNo = panCardNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

   

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

  

  
    public Integer getDesignationName() {
        return designationName;
    }

    public void setDesignationName(Integer designationName) {
        this.designationName = designationName;
    }

 

    public Date getDeptUserRegistrationDate() {
        return deptUserRegistrationDate;
    }

    public void setDeptUserRegistrationDate(Date deptUserRegistrationDate) {
        this.deptUserRegistrationDate = deptUserRegistrationDate;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public String getLastModifiedOn() {
        return lastModifiedOn;
    }

    public void setLastModifiedOn(String lastModifiedOn) {
        this.lastModifiedOn = lastModifiedOn;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPaclimit() {
        return paclimit;
    }

    public void setPaclimit(String paclimit) {
        this.paclimit = paclimit;
    }

    public String getPaclimitInWords() {
        return paclimitInWords;
    }

    public void setPaclimitInWords(String paclimitInWords) {
        this.paclimitInWords = paclimitInWords;
    }

    public String getCircle() {
        return circle;
    }

    public void setCircle(String circle) {
        this.circle = circle;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getSubDivision() {
        return subDivision;
    }

    public void setSubDivision(String subDivision) {
        this.subDivision = subDivision;
    }

    public String getDesignations() {
        return designations;
    }

    public void setDesignations(String designations) {
        this.designations = designations;
    }

    public String getUserPrivileges() {
        return userPrivileges;
    }

    public void setUserPrivileges(String userPrivileges) {
        this.userPrivileges = userPrivileges;
    }

    public Integer getReg_Id() {
        return reg_Id;
    }

    public void setReg_Id(Integer reg_Id) {
        this.reg_Id = reg_Id;
    }

    public Integer getDeptcircle() {
        return deptcircle;
    }

    public void setDeptcircle(Integer deptcircle) {
        this.deptcircle = deptcircle;
    }

    public Integer getDeptDivision() {
        return deptDivision;
    }

    public void setDeptDivision(Integer deptDivision) {
        this.deptDivision = deptDivision;
    }

    public Integer getDeptSubDivision() {
        return deptSubDivision;
    }

    public void setDeptSubDivision(Integer deptSubDivision) {
        this.deptSubDivision = deptSubDivision;
    }

    public String getEmail_verified() {
        return email_verified;
    }

    public void setEmail_verified(String email_verified) {
        this.email_verified = email_verified;
    }

    public String getMobile_verified() {
        return mobile_verified;
    }

    public void setMobile_verified(String mobile_verified) {
        this.mobile_verified = mobile_verified;
    }

    public String getOtp_alertStatus() {
        return otp_alertStatus;
    }

    public void setOtp_alertStatus(String otp_alertStatus) {
        this.otp_alertStatus = otp_alertStatus;
    }
       
       
       

    
   
   
}
