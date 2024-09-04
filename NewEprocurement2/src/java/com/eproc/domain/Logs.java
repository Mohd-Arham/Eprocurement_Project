package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * Process logs Form page with all setter() and getter()
 * 
 *@auhtor Shashank Shukla
 */

@Entity
@Table(name = "logs")
public class Logs{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "logId")
    private Integer logId;

    @Column(name = "deptId")
    private Integer deptId;

    @Column(name = "deptUserId")
    private Integer deptUserId;

    @Column(name = "contractorId")
    private Integer contractorId;

    @Column(name = "activity")
    private String activity;

    @Column(name = "tenderId")
    private Integer tenderId;

    @Column(name = "auctionId")
    private Integer auctionId;

    @Column(name = "rfqId")
    private Integer rfqId;

    @Column(name = "dscId")
    private String dscId;

    @Column(name = "deptUser")
    private String deptUser;

    @Column(name = "dateTime")
    private String dateTime;

    @Column(name = "osName")
    private String osName;

    @Column(name = "browserName")
    private String browserName;

    @Column(name = "ipAddress")
    private String ipAddress;

    @Column(name = "macAddress")
    private String macAddress;

    @Column(name = "logMessage")
    private String logMessage;

    @Column(name = "headingMsg")
    private String headingMsg;
    
    @Column(name = "status")
    private String status;
    
    @Column(name = "Envelope")
    private String Envelope;

    public Logs() {
    }

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getDeptUserId() {
        return deptUserId;
    }

    public void setDeptUserId(Integer deptUserId) {
        this.deptUserId = deptUserId;
    }

    public Integer getContractorId() {
        return contractorId;
    }

    public void setContractorId(Integer contractorId) {
        this.contractorId = contractorId;
    }

    public String getLogMessage() {
        return logMessage;
    }

    public void setLogMessage(String logMessage) {
        this.logMessage = logMessage;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public Integer getTenderId() {
        return tenderId;
    }

    public void setTenderId(Integer tenderId) {
        this.tenderId = tenderId;
    }

    public Integer getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Integer auctionId) {
        this.auctionId = auctionId;
    }

    public Integer getRfqId() {
        return rfqId;
    }

    public void setRfqId(Integer rfqId) {
        this.rfqId = rfqId;
    }

    public String getDscId() {
        return dscId;
    }

    public void setDscId(String dscId) {
        this.dscId = dscId;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getDeptUser() {
        return deptUser;
    }

    public void setDeptUser(String deptUser) {
        this.deptUser = deptUser;
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

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public String getHeadingMsg() {
        return headingMsg;
    }

    public void setHeadingMsg(String headingMsg) {
        this.headingMsg = headingMsg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEnvelope() {
        return Envelope;
    }

    public void setEnvelope(String Envelope) {
        this.Envelope = Envelope;
    }

    
    
}
