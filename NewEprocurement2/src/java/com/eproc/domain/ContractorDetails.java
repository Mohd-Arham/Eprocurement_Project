 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Palak Tiwari ContractorDetails class
 */
@Entity
@Table(name = "contractordetails")
public class ContractorDetails  {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "contOtherId")
    private int contOtherId;

    @Column(name = "Reg_Id")
    private int regisId;
   
    @Column(name = "company_Type")
    private String contCompanyType;

    @Column(name = "org_Type")
    private String contOrganization;

    @Column(name = "Date")
    private Date updatedOn;

    @Column(name = "other_Org")
    private String otherOrganization;
    
    @Column(name = "foreignOrgName")
    private String foreignOrgName;
    
    @Column(name = "indianOrgName")
    private String indianOrgName;
    
    @Column(name = "foreignRegno")
    private String foreignRegno;
    
    @Column(name = "foreignAddress")
    private String foreignAddress;
    
    @Column(name = "country")
    private Integer country;
    
    @Column(name = "foreignState")
    private Integer foreignState;
    
    @Column(name = "foreignCity")
    private Integer foreignCity;
    
    @Column(name = "foreignPincode")
    private String foreignPincode;
    
    @Column(name = "foreignWebsite")
    private String foreignWebsite;
    
    @Column(name = "foreign_eMail")
    private String foreignemail;
    
    @Column(name = "foreign_contact1")
    private String foreignContact1;
    
    @Column(name = "foreign_contact2")
    private String foreignContact2;
    
    @Column(name = "foreignTINNo")
    private String foreignTINNo;
    
    @Column(name = "agentRegno")
    private String agentRegno;
    
    @Column(name = "agentAddress")
    private String agentAddress;
    
    @Column(name = "agentState")
    private Integer agentState;
    
    @Column(name = "agentCity")
    private Integer agentCity;
    
    @Column(name = "agentPincode")
    private String agentPincode;
    
    @Column(name = "agentWebsite")
    private String agentWebsite;
    
    @Column(name = "agent_eMail")
    private String agentemail;
    
    @Column(name = "agentContact1")
    private String agentContact1;
    
    @Column(name = "agentContact2")
    private String agentContact2;
    
    @Column(name = "orgPAN")
    private String orgPAN;
    
    @Column(name = "GISTN_No")
    private String gistnNo;
    
    @Column(name = "company_AadharNo")
    private String comAadharNo;
    
    @Column(name = "socialCategory")
    private String socialCategory;
    
    @Column(name = "status")
    private String status;
    
    @Column(name = "contractorClass")
    private String contractorClass;
    
    @Transient
    private String agentStateName;
    @Transient
    private String foreignStateName;
    @Transient
    private String foreignCityName;
    @Transient
    private String foreignCountryName;
    @Transient
    private String agentCityName;
    @Transient
    private String orgTypeName;
    
    @Column(name = "msmeStatus")
    private String msmeStatus;
    
    @Column(name = "contractorClassStatus")
    private String contractorClassStatus;
    
    @Column(name = "Expirydate")
    private String expiryDate;
    
     @Column(name = "wizardStepStatus")
    private String wizardStepStatus;

    public String getMsmeStatus() {
        return msmeStatus;
    }

    public void setMsmeStatus(String msmeStatus) {
        this.msmeStatus = msmeStatus;
    }

    public String getContractorClassStatus() {
        return contractorClassStatus;
    }

    public void setContractorClassStatus(String contractorClassStatus) {
        this.contractorClassStatus = contractorClassStatus;
    }

    public String getOrgTypeName() {
        return orgTypeName;
    }

    public void setOrgTypeName(String orgTypeName) {
        this.orgTypeName = orgTypeName;
    }
    @Transient
    private String fullName;
    @Transient
    private String socialCategoryName;
    @Transient
    private String contCompanyName;
//     private String IfullName; 
    private String foreignRegDocName;
    private String foreignRegDocUrl;
    private String foreignTINDocName;
    private String foreignTINDocUrl;
    private String agentRegDocName;
    private String agentRegDocUrl;
    private String agentPANDocName;
    private String agentPANDocUrl;
    private String gistnDocName;
    private String gistnDocUrl;
    private String msmeDocName;
    private String msmeDocUrl;
    private String requeststatus;
    private String contractorClassDocName;
    private String contractorClassDocUrl;
    //for indian client registration
    @Transient
    private MultipartFile foreignRegDoc;
    @Transient
    private MultipartFile gistnDoc;
    @Transient
    private MultipartFile foreignTINDoc;
    @Transient
    private MultipartFile agentRegDoc;
    @Transient
    private MultipartFile agentPANDoc;
    @Transient
    private MultipartFile msmeDoc;
    @Transient
    private MultipartFile contractorClassDoc;
 
    private String fullname;
    private String ForeignfName;
    private String ForeignmName;
    private String ForeignlName;
    private String IndianfName;//firstname of agent
    private String IndianmName;//middlename of agent
    private String IndianlName;//lastname of agent
    @Transient
    private String contractorClassName;

    
    @OneToMany(mappedBy = "contractorOtherDetails", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    public List<ContractorOrganizationType> contApplication;

    public List<ContractorOrganizationType> getContApplication() {
        return contApplication;
    }

    public void setContApplication(List<ContractorOrganizationType> contApplication) {
        this.contApplication = contApplication;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getContOtherId() {
        return contOtherId;
    }

    public void setContOtherId(int contOtherId) {
        this.contOtherId = contOtherId;
    }

    public int getRegisId() {
        return regisId;
    }

    public void setRegisId(int regisId) {
        this.regisId = regisId;
    }

    public String getContCompanyType() {
        return contCompanyType;
    }
  
    public void setContCompanyType(String contCompanyType) {
        this.contCompanyType = contCompanyType;
    }

    public String getContOrganization() {
        return contOrganization;
    }

    public void setContOrganization(String contOrganization) {
        this.contOrganization = contOrganization;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
    }

    public MultipartFile getGistnDoc() {
        return gistnDoc;
    }

    public void setGistnDoc(MultipartFile gistnDoc) {
        this.gistnDoc = gistnDoc;
    }

    public String getOtherOrganization() {
        return otherOrganization;
    }

    public void setOtherOrganization(String otherOrganization) {
        this.otherOrganization = otherOrganization;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRequeststatus() {
        return requeststatus;
    }

    public void setRequeststatus(String requeststatus) {
        this.requeststatus = requeststatus;
    }

    public String getForeignOrgName() {
        return foreignOrgName;
    }

    public void setForeignOrgName(String foreignOrgName) {
        this.foreignOrgName = foreignOrgName;
    }

    public String getIndianOrgName() {
        return indianOrgName;
    }

    public void setIndianOrgName(String indianOrgName) {
        this.indianOrgName = indianOrgName;
    }

    public String getForeignRegno() {
        return foreignRegno;
    }

    public void setForeignRegno(String foreignRegno) {
        this.foreignRegno = foreignRegno;
    }

    public String getForeignAddress() {
        return foreignAddress;
    }

    public void setForeignAddress(String foreignAddress) {
        this.foreignAddress = foreignAddress;
    }

    public String getForeignPincode() {
        return foreignPincode;
    }

    public void setForeignPincode(String foreignPincode) {
        this.foreignPincode = foreignPincode;
    }

    public String getForeignWebsite() {
        return foreignWebsite;
    }

    public void setForeignWebsite(String foreignWebsite) {
        this.foreignWebsite = foreignWebsite;
    }

    public String getForeignemail() {
        return foreignemail;
    }

    public void setForeignemail(String foreignemail) {
        this.foreignemail = foreignemail;
    }

    public String getForeignContact1() {
        return foreignContact1;
    }

    public void setForeignContact1(String foreignContact1) {
        this.foreignContact1 = foreignContact1;
    }

    public String getForeignContact2() {
        return foreignContact2;
    }

    public void setForeignContact2(String foreignContact2) {
        this.foreignContact2 = foreignContact2;
    }

    public String getForeignTINNo() {
        return foreignTINNo;
    }

    public void setForeignTINNo(String foreignTINNo) {
        this.foreignTINNo = foreignTINNo;
    }

    public String getAgentRegno() {
        return agentRegno;
    }

    public void setAgentRegno(String agentRegno) {
        this.agentRegno = agentRegno;
    }

    public String getAgentAddress() {
        return agentAddress;
    }

    public void setAgentAddress(String agentAddress) {
        this.agentAddress = agentAddress;
    }

    public String getAgentPincode() {
        return agentPincode;
    }

    public void setAgentPincode(String agentPincode) {
        this.agentPincode = agentPincode;
    }

    public String getAgentWebsite() {
        return agentWebsite;
    }

    public void setAgentWebsite(String agentWebsite) {
        this.agentWebsite = agentWebsite;
    }

    public String getAgentemail() {
        return agentemail;
    }

    public void setAgentemail(String agentemail) {
        this.agentemail = agentemail;
    }

    public String getAgentContact1() {
        return agentContact1;
    }

    public void setAgentContact1(String agentContact1) {
        this.agentContact1 = agentContact1;
    }

    public String getAgentContact2() {
        return agentContact2;
    }

    public void setAgentContact2(String agentContact2) {
        this.agentContact2 = agentContact2;
    }

    public String getOrgPAN() {
        return orgPAN;
    }

    public void setOrgPAN(String orgPAN) {
        this.orgPAN = orgPAN;
    }

    public String getGistnNo() {
        return gistnNo;
    }

    public void setGistnNo(String gistnNo) {
        this.gistnNo = gistnNo;
    }

    public String getComAadharNo() {
        return comAadharNo;
    }

    public void setComAadharNo(String comAadharNo) {
        this.comAadharNo = comAadharNo;
    }

    public String getSocialCategory() {
        return socialCategory;
    }

    public void setSocialCategory(String socialCategory) {
        this.socialCategory = socialCategory;
    }

    public Integer getCountry() {
        return country;
    }

    public void setCountry(Integer country) {
        this.country = country;
    }

    public Integer getForeignState() {
        return foreignState;
    }

    public void setForeignState(Integer foreignState) {
        this.foreignState = foreignState;
    }

    public Integer getForeignCity() {
        return foreignCity;
    }

    public void setForeignCity(Integer foreignCity) {
        this.foreignCity = foreignCity;
    }

    public Integer getAgentState() {
        return agentState;
    }

    public void setAgentState(Integer agentState) {
        this.agentState = agentState;
    }

    public Integer getAgentCity() {
        return agentCity;
    }

    public void setAgentCity(Integer agentCity) {
        this.agentCity = agentCity;
    }

    public MultipartFile getForeignRegDoc() {
        return foreignRegDoc;
    }

    public void setForeignRegDoc(MultipartFile foreignRegDoc) {
        this.foreignRegDoc = foreignRegDoc;
    }

    public MultipartFile getForeignTINDoc() {
        return foreignTINDoc;
    }

    public void setForeignTINDoc(MultipartFile foreignTINDoc) {
        this.foreignTINDoc = foreignTINDoc;
    }

    public MultipartFile getAgentRegDoc() {
        return agentRegDoc;
    }

    public void setAgentRegDoc(MultipartFile agentRegDoc) {
        this.agentRegDoc = agentRegDoc;
    }

    public MultipartFile getAgentPANDoc() {
        return agentPANDoc;
    }

    public void setAgentPANDoc(MultipartFile agentPANDoc) {
        this.agentPANDoc = agentPANDoc;
    }

    public String getForeignRegDocName() {
        return foreignRegDocName;
    }

    public void setForeignRegDocName(String foreignRegDocName) {
        this.foreignRegDocName = foreignRegDocName;
    }

    public String getForeignRegDocUrl() {
        return foreignRegDocUrl;
    }

    public void setForeignRegDocUrl(String foreignRegDocUrl) {
        this.foreignRegDocUrl = foreignRegDocUrl;
    }

    public String getForeignTINDocName() {
        return foreignTINDocName;
    }

    public void setForeignTINDocName(String foreignTINDocName) {
        this.foreignTINDocName = foreignTINDocName;
    }

    public String getForeignTINDocUrl() {
        return foreignTINDocUrl;
    }

    public void setForeignTINDocUrl(String foreignTINDocUrl) {
        this.foreignTINDocUrl = foreignTINDocUrl;
    }

    public String getAgentRegDocName() {
        return agentRegDocName;
    }

    public void setAgentRegDocName(String agentRegDocName) {
        this.agentRegDocName = agentRegDocName;
    }

    public String getAgentRegDocUrl() {
        return agentRegDocUrl;
    }

    public void setAgentRegDocUrl(String agentRegDocUrl) {
        this.agentRegDocUrl = agentRegDocUrl;
    }

    public String getAgentPANDocName() {
        return agentPANDocName;
    }

    public void setAgentPANDocName(String agentPANDocName) {
        this.agentPANDocName = agentPANDocName;
    }

    public String getAgentPANDocUrl() {
        return agentPANDocUrl;
    }

    public void setAgentPANDocUrl(String agentPANDocUrl) {
        this.agentPANDocUrl = agentPANDocUrl;
    }

    public String getMsmeDocName() {
        return msmeDocName;
    }

    public void setMsmeDocName(String msmeDocName) {
        this.msmeDocName = msmeDocName;
    }

    public String getMsmeDocUrl() {
        return msmeDocUrl;
    }

    public void setMsmeDocUrl(String msmeDocUrl) {
        this.msmeDocUrl = msmeDocUrl;
    }

    public MultipartFile getMsmeDoc() {
        return msmeDoc;
    }

    public void setMsmeDoc(MultipartFile msmeDoc) {
        this.msmeDoc = msmeDoc;
    }

   

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

//   

    public String getForeignfName() {
        return ForeignfName;
    }

    public void setForeignfName(String ForeignfName) {
        this.ForeignfName = ForeignfName;
    }

    public String getForeignmName() {
        return ForeignmName;
    }

    public void setForeignmName(String ForeignmName) {
        this.ForeignmName = ForeignmName;
    }

    public String getForeignlName() {
        return ForeignlName;
    }

    public void setForeignlName(String ForeignlName) {
        this.ForeignlName = ForeignlName;
    }

    public String getIndianfName() {
        return IndianfName;
    }

    public void setIndianfName(String IndianfName) {
        this.IndianfName = IndianfName;
    }

    public String getIndianmName() {
        return IndianmName;
    }

    public void setIndianmName(String IndianmName) {
        this.IndianmName = IndianmName;
    }

    public String getIndianlName() {
        return IndianlName;
    }

    public void setIndianlName(String IndianlName) {
        this.IndianlName = IndianlName;
    }

    public String getContractorClass() {
        return contractorClass;
    }

    public void setContractorClass(String contractorClass) {
        this.contractorClass = contractorClass;
    }

    public String getContractorClassDocName() {
        return contractorClassDocName;
    }

    public void setContractorClassDocName(String contractorClassDocName) {
        this.contractorClassDocName = contractorClassDocName;
    }

    public String getContractorClassDocUrl() {
        return contractorClassDocUrl;
    }

    public void setContractorClassDocUrl(String contractorClassDocUrl) {
        this.contractorClassDocUrl = contractorClassDocUrl;
    }

    public MultipartFile getContractorClassDoc() {
        return contractorClassDoc;
    }

    public void setContractorClassDoc(MultipartFile contractorClassDoc) {
        this.contractorClassDoc = contractorClassDoc;
     }

    public String getContractorClassName() {
        return contractorClassName;
    }

    public void setContractorClassName(String contractorClassName) {
        this.contractorClassName = contractorClassName;
    }

    public String getAgentStateName() {
        return agentStateName;
    }

    public void setAgentStateName(String agentStateName) {
        this.agentStateName = agentStateName;
    }

    public String getAgentCityName() {
        return agentCityName;
    }

    public void setAgentCityName(String agentCityName) {
        this.agentCityName = agentCityName;
    }

    public String getForeignStateName() {
        return foreignStateName;
    }

    public void setForeignStateName(String foreignStateName) {
        this.foreignStateName = foreignStateName;
    }

    public String getForeignCityName() {
        return foreignCityName;
    }

    public void setForeignCityName(String foreignCityName) {
        this.foreignCityName = foreignCityName;
    }

    public String getForeignCountryName() {
        return foreignCountryName;
    }

    public void setForeignCountryName(String foreignCountryName) {
        this.foreignCountryName = foreignCountryName;
    }

    public String getSocialCategoryName() {
        return socialCategoryName;
    }

    public void setSocialCategoryName(String socialCategoryName) {
        this.socialCategoryName = socialCategoryName;
    }

    public String getContCompanyName() {
        return contCompanyName;
    }

    public void setContCompanyName(String contCompanyName) {
        this.contCompanyName = contCompanyName;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    

    public String getWizardStepStatus() {
        return wizardStepStatus;
    }

    public void setWizardStepStatus(String wizardStepStatus) {
        this.wizardStepStatus = wizardStepStatus;
    }

    public String getGistnDocName() {
        return gistnDocName;
    }

    public void setGistnDocName(String gistnDocName) {
        this.gistnDocName = gistnDocName;
    }

    public String getGistnDocUrl() {
        return gistnDocUrl;
    }

    public void setGistnDocUrl(String gistnDocUrl) {
        this.gistnDocUrl = gistnDocUrl;
    }
    
    }
    
    
    
    
    
    
    
    
    


