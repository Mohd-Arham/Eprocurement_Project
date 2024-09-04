package com.eproc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Aditya Vyas
 */
@Entity
@Table(name = "department_user_dsc")
public class DSCInformationForDepartmentUser {

    @Id
    @GeneratedValue
    private int dscId;
    private String dscUserId;
    private String dscSerialNo;
    private String dscName;
    private String dscPublicKey;
    private String dscExpiryDate;
    private String dateOfSubmission;
    private String dscType;//signing or Encryption
    private String commonName;

    public int getDscId() {
        return dscId;
    }

    public void setDscId(int dscId) {
        this.dscId = dscId;
    }

    public String getDscUserId() {
        return dscUserId;
    }

    public void setDscUserId(String dscUserId) {
        this.dscUserId = dscUserId;
    }

    public String getDscSerialNo() {
        return dscSerialNo;
    }

    public void setDscSerialNo(String dscSerialNo) {
        this.dscSerialNo = dscSerialNo;
    }

    public String getDscName() {
        return dscName;
    }

    public void setDscName(String dscName) {
        this.dscName = dscName;
    }

    public String getDscPublicKey() {
        return dscPublicKey;
    }

    public void setDscPublicKey(String dscPublicKey) {
        this.dscPublicKey = dscPublicKey;
    }

    public String getDscExpiryDate() {
        return dscExpiryDate;
    }

    public void setDscExpiryDate(String dscExpiryDate) {
        this.dscExpiryDate = dscExpiryDate;
    }

    public String getDateOfSubmission() {
        return dateOfSubmission;
    }

    public void setDateOfSubmission(String dateOfSubmission) {
        this.dateOfSubmission = dateOfSubmission;
    }

    public String getDscType() {
        return dscType;
    }

    public void setDscType(String dscType) {
        this.dscType = dscType;
    }

    public String getCommonName() {
        return commonName;
    }

    public void setCommonName(String commonName) {
        this.commonName = commonName;
    }

}
