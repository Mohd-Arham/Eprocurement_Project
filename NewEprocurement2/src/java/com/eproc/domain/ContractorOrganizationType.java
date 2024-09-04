package com.eproc.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 *
 * @author Palak Tiwari 
 * ContractorOrganizationType class
 * This class is used to tell the type of organization 
 */
@Entity
@Table(name = "contractor_details_app")
public class ContractorOrganizationType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer contAppId;
//    private Integer contOtherId;
    @Column(name = "partnerNo")
    private String ptnrNo;
    @Column(name = "shareholderNo")
    private String shNo;
    @Column(name = "percentage_firm")
    private String ptnrPop;
    @Column(name = "partnerName")
    private String ptnrName;
    @Column(name = "partnerMobileNo")
    private String ptnrMobNo;
    @Column(name = "partnerPAN")
    private String ptnrPANNo;
    @Column(name = "partnerAadhar")
    private String ptnrAadharNo;
    @Column(name = "directorName")
    private String shDirName;
    @Column(name = "DIN_No")
    private String dinNo;
    @Column(name = "dirMobileNo")
    private String shMobNo;
    @Column(name = "dinPAN")
    private String shPANNo;
    @Column(name = "dinAadhar")
    private String shAadharNo;

   @ManyToOne
   @JoinColumn(name = "contOtherId")
   private ContractorDetails contractorOtherDetails;

    public ContractorDetails getContractorOtherDetails() {
        return contractorOtherDetails;
   }

    public void setContractorOtherDetails(ContractorDetails contractorOtherDetails) {
      this.contractorOtherDetails = contractorOtherDetails;
    }

    public Integer getContAppId() {
        return contAppId;
    }

    public void setContAppId(Integer contAppId) {
        this.contAppId = contAppId;
    }

    public String getPtnrNo() {
        return ptnrNo;
    }

    public void setPtnrNo(String ptnrNo) {
        this.ptnrNo = ptnrNo;
    }

    public String getShNo() {
        return shNo;
    }

    public void setShNo(String shNo) {
        this.shNo = shNo;
    }

    public String getPtnrPop() {
        return ptnrPop;
    }

    public void setPtnrPop(String ptnrPop) {
        this.ptnrPop = ptnrPop;
    }

    
    
    public String getPtnrName() {
        return ptnrName;
    }

    public void setPtnrName(String ptnrName) {
        this.ptnrName = ptnrName;
    }

    public String getPtnrMobNo() {
        return ptnrMobNo;
    }

    public void setPtnrMobNo(String ptnrMobNo) {
        this.ptnrMobNo = ptnrMobNo;
    }

   public String getPtnrPANNo() {
        return ptnrPANNo;
    }

    public void setPtnrPANNo(String ptnrPANNo) {
        this.ptnrPANNo = ptnrPANNo;
    }

    public String getPtnrAadharNo() {
        return ptnrAadharNo;
    }

    public void setPtnrAadharNo(String ptnrAadharNo) {
        this.ptnrAadharNo = ptnrAadharNo;
    }

    public String getShDirName() {
        return shDirName;
    }

    public void setShDirName(String shDirName) {
        this.shDirName = shDirName;
    }

    public String getShMobNo() {
        return shMobNo;
    }

    public void setShMobNo(String shMobNo) {
        this.shMobNo = shMobNo;
    }

    public String getShPANNo() {
        return shPANNo;
    }

    public void setShPANNo(String shPANNo) {
        this.shPANNo = shPANNo;
    }

    public String getShAadharNo() {
        return shAadharNo;
    }

    public void setShAadharNo(String shAadharNo) {
        this.shAadharNo = shAadharNo;
    }

    public String getDinNo() {
        return dinNo;
    }

    public void setDinNo(String dinNo) {
        this.dinNo = dinNo;
    }

  
    
}
