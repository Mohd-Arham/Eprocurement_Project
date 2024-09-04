/*
 * To change this license header, choose License Headers in Projet Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.Date;
import javax.crypto.SecretKey;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Naina jain
 */
@Entity
@Table(name = "common_logon_status")
public class Common_Logon_Status {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    private int id;

    @Column(name = "EmailId")
    private String emailid;

    @Column(name = "Role")
    private String role;

    @Column(name = "MobileNo")
    private String mobileno;

    @Column(name = "Current_Login")
    private Date Current_Login;

    @Column(name = "Ip_Address")
    private String Ip_Address;

    @Column(name = "Mac_Address")
    private String Mac_Address;

    @Column(name = "Password")
    private String password;

    @Column(name = "SecretKey")
    private SecretKey secretKey;

    @Column(name = "txtCaptchaInput")
    private String txtCaptchaInput;

    @Column(name = "deptId")
    private Integer deptId;

    @Column(name = "deptName")
    private String deptName;

    @Column(name = "logout_Time")
    private Date logout_Time;

    @Column(name = "osName")
    private String osName;

    @Column(name = "browserName")
    private String browserName;
    
    @Column(name = "userReg_ID")
     private int userRegID;
    
  


    public Date getLogout_Time() {
        return logout_Time;
    }

    public void setLogout_Time(Date logout_Time) {
        this.logout_Time = logout_Time;
    }

    public String getOsName() {
        return osName;
    }

    public void setOsName(String osName) {
        this.osName = osName;
    }

    public String getBrowserName() {
        return browserName;
    }

    public void setBrowserName(String browserName) {
        this.browserName = browserName;
    }

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

    public SecretKey getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(SecretKey secretKey) {
        this.secretKey = secretKey;
    }

    public String getTxtCaptchaInput() {
        return txtCaptchaInput;
    }

    public void setTxtCaptchaInput(String txtCaptchaInput) {
        this.txtCaptchaInput = txtCaptchaInput;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public Date getCurrent_Login() {
        return Current_Login;
    }

    public void setCurrent_Login(Date Current_Login) {
        this.Current_Login = Current_Login;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getIp_Address() {
        return Ip_Address;
    }

    public void setIp_Address(String Ip_Address) {
        this.Ip_Address = Ip_Address;
    }

    public String getMac_Address() {
        return Mac_Address;
    }

    public void setMac_Address(String Mac_Address) {
        this.Mac_Address = Mac_Address;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    public int getUserRegID() {
        return userRegID;
    }

    public void setUserRegID(int userRegID) {
        this.userRegID = userRegID;
    }
    
      public Common_Logon_Status() {
    }

   

      
      
    

    
}
