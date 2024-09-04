/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.List;
import java.util.Map;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 * <h1>Tender</h1>
 * <p>This program handle the parameter of tender database</p>
 * 
 * @author Gaurav Dubey
 * @since 20 July 2018
 * @version 2.0.0
 */
@Entity
@Table(name = "tenderamendment")
public class TenderAmendment {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tenderAmend_Id")
    private int tenderAmend_Id;
     
    @Column(name = "tender_Id")
    private Integer tender_Id;
    
    @Column(name = "nitNumber")
    private String nitNumber;
    
    @Column(name = "nitDate")
    private String nitDate;
    
    @Column(name = "tender_Number")
    private String tenderNumber;
    
    @Column(name = "tenderStage")
    private String tenderStage;
    
    @Transient
    private String tenderStageName;
    
    @Column(name = "selectiveTender")
    private String selectiveTender;
    
    @Transient
    private String selectiveTenderName;
    
    @Column(name  = "tenderCategory")
    private String tenderCategory;
    
    @Transient
    private String tenderCategoryName;
    
    @Column(name = "areaOfWork")
    private String areaOfWork;
    
    @Transient
    private String areaOfWorkName;
    
    @Column(name = "tenderKeywords")
    private String tenderKeywords;
    
    @Transient
    private List<TenderKeyword> tenderKeywordsNameList;
    
    @Transient
    private List<UploadSOR> uploadSorList;
    
    
    @Column(name = "sorDocument")
    private String sorDocument;
    
    @Transient
    private UploadSOR uploadSOR;
            
    @Column(name = "buyBackPolicy")
    private String buyBackPolicy;
    
    @Column(name = "buyBackDocument")
    private String buyBackDocument;
    
    
    @Column(name = "sent_for_approval_pdf")
    private String sent_for_approval_pdf;
    
    @Column(name = "approval_pdf")
    private String approval_pdf;
    
    @Transient
    private MultipartFile buyBackDocumentFile;
    
    @Column(name = "nameOfWork")
    private String nameOfWork;
    
    @Column(name = "descriptionOfWork")
    private String descriptionOfWork;
    
    @Column(name = "estimateValueInFig")
    private String estimateValueInFig;
    
    @Column(name = "estimateValueInWord")
    private String estimateValueInWord;
    
    @Column(name = "tenderFeeInFig")
    private String tenderFeeInFig;
    
    @Column(name = "tenderFeeInWord")
    private String tenderFeeInWord;
    
    @Column(name = "modeOfFeeForTenderFee")
    private String modeOfFeeForTenderFee;
    
    @Column(name = "bidValidateType")
    private String bidValidateType;
    
    @Column(name = "bidValidatePeriod")
    private String bidValidatePeriod;
    
    @Column(name = "workCompletionType")
    private String workCompletionType;
    
    @Column(name = "workCompletionPeriod")
    private String workCompletionPeriod;
    
    @Column(name = "rainySeason")
    private String rainySeason;
    
    @Column(name = "numberOfWorks")
    private String numberOfWorks;
    
    @Column(name = "envelopeType")
    private String envelopeType;
    
    @Transient
    private String envelopeTypeName;
       
    @Column(name = "contractorClass")
    private String contractorClass;
    
    @Transient
    private String contractorClassName;
    
    @Column(name = "typeOfTender")
    private String typeOfTender;
    
    @Transient
    private String typeOfTenderName;
    
    @Column(name = "emdApplicable")
    private String emdApplicable;
    
    @Column(name = "modeOfFeeForEMDApplicable")
    private String modeOfFeeForEMDApplicable;    
    
    @Column(name = "emdInFig")
    private String emdInFig;
    
    @Column(name = "emdInWords")
    private String emdInWords;
    
    @Column(name = "msmensicExemption")
    private String msmensicExemption;

    @Column(name = "emdMSMENSICExemption")
    private String emdMSMENSICExemption;
   
    @Column(name = "tenderfeeMSMENSICExemption")
    private String tenderfeeMSMENSICExemption;
    
    @Column(name = "scstExemption")
    private String scstExemption;
    
    @Column(name = "tenderfeeSCSTExemption")
    private String tenderfeeSCSTExemption;
    
    @Column(name = "emdTenderSCSTFeeExemption")
    private String emdTenderSCSTFeeExemption;
    
    @Column(name = "obcExemption")
    private String obcExemption;
    
    @Column(name = "tenderfeeOBCExemption")
    private String tenderfeeOBCExemption;
    
    @Column(name = "emdTenderOBCFeeExemption")
    private String emdTenderOBCFeeExemption;
    
    @Column(name = "ammendmentPrivilege")
    private String ammendmentPrivilege;
    
    @Column(name = "ammendmentPrivilegeOfficer")
    private String ammendmentPrivilegeOfficer;
    
    @Column(name = "approvalOfficer")
    private String approvalOfficer;
    
    @Transient
    public List<DepartmentUser> ammendmentPrivilegeOfficerList;
    
    @Column(name = "tenderRebid")
    private String tenderRebid;
    
    @Column(name = "tenderBidWithdraw")
    private String tenderBidWithdraw;
    
    @Column(name = "singedPDF")
    private String singedPDF;
    
    @Column(name = "tenderNotice")
    private String tenderNotice;
    
    @Column(name = "tenderCallStatus")
    private String tenderCallStatus;
    
    @Column(name = "tenderMaster")
    private String tenderMaster;
    
    @Column(name = "tenderMasterId")
    private String tenderMasterId;
     
    @Column(name = "tenderStatus")
    private String tenderStatus;

    @Column(name = "wizardStep")
    private String wizardStep;
    
    @Column(name = "circle")
    private String circle;
    
    @Column(name = "division")
    private String division;
    
    @Column(name = "subDivision")
    private String subDivision;
    
    @Column(name = "deptId")
    private int deptId;
    
    @Column(name = "remarks")
    private String remarks;
     
    @Column(name = "statusDocumentAmmendment")
    private String statusDocumentAmmendment;
   
    @Column(name = "ammendmentDate")
    private String ammendmentDate;
    
    @Column(name = "ammendmentCorrigendum")
    private String ammendmentCorrigendum;
    
    @Transient
    private MultipartFile statusFile;
    
    @Transient
    private TenderKeyDates tenderKeyDates;
    
    @Column(name = "preBidMeetingStatus")
    private String preBidMeetingStatus;
     
    @Column(name = "preBidMeetingVenue")
    private String preBidMeetingVenue;
    
    @Column(name = "preBidMeetingDate")
    private String preBidMeetingDate;
     
    @Transient
    private Map<Integer, String> envelopeAOfficersName;
   
    @Transient
    private Map<Integer, String> envelopeBOfficersName;
    
    @Transient
    private Map<Integer, String> envelopeCOfficersName;
    
    @Transient
    private TenderKeyDatesAmendment tenderKeyDatesAmendment;
   
    @Transient
    private boolean statusManaging;

     //Other Variable for Bidding
    @Transient
    private boolean proceedtoBid;
    
    @Transient
    private boolean envelopeASubmittStatus;
    @Transient
    private boolean envelopeBSubmittStatus;
    @Transient
    private boolean envelopeCSubmittStatus;
    @Transient
    private Logs envelopeA_Logs;
    @Transient
    private Logs envelopeB_Logs;
    @Transient
    private Logs envelopeC_Logs;
    @Transient
    private TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA;
    
    @Transient
    private TenderSubmittedEnvelopeB tenderSubmittedEnvelopeB;
    
    @Transient
    private TenderSubmittedEnvelopeC tenderSubmittedEnvelopeC;
    
    public int getTenderAmend_Id() {
        return tenderAmend_Id;
    }

    public void setTenderAmend_Id(int tenderAmend_Id) {
        this.tenderAmend_Id = tenderAmend_Id;
    }
    
    public Integer getTender_Id() {
        return tender_Id;
    }

    public void setTender_Id(Integer tender_Id) {
        this.tender_Id = tender_Id;
    }

    public String getNitNumber() {
        return nitNumber;
    }

    public void setNitNumber(String nitNumber) {
        this.nitNumber = nitNumber;
    }

    public String getNitDate() {
        return nitDate;
    }

    public void setNitDate(String nitDate) {
        this.nitDate = nitDate;
    }

    public String getTenderNumber() {
        return tenderNumber;
    }

    public void setTenderNumber(String tenderNumber) {
        this.tenderNumber = tenderNumber;
    }

    public String getTenderStage() {
        return tenderStage;
    }

    public void setTenderStage(String tenderStage) {
        this.tenderStage = tenderStage;
    }

    public String getTenderStageName() {
        return tenderStageName;
    }

    public void setTenderStageName(String tenderStageName) {
        this.tenderStageName = tenderStageName;
    }
    
    public String getSelectiveTender() {
        return selectiveTender;
    }

    public void setSelectiveTender(String selectiveTender) {
        this.selectiveTender = selectiveTender;
    }

    public String getSelectiveTenderName() {
        return selectiveTenderName;
    }

    public void setSelectiveTenderName(String selectiveTenderName) {
        this.selectiveTenderName = selectiveTenderName;
    }

    public String getTenderCategory() {
        return tenderCategory;
    }

    public void setTenderCategory(String tenderCategory) {
        this.tenderCategory = tenderCategory;
    }

    public String getTenderCategoryName() {
        return tenderCategoryName;
    }

    public void setTenderCategoryName(String tenderCategoryName) {
        this.tenderCategoryName = tenderCategoryName;
    }

    public String getAreaOfWork() {
        return areaOfWork;
    }

    public void setAreaOfWork(String areaOfWork) {
        this.areaOfWork = areaOfWork;
    }

    public String getAreaOfWorkName() {
        return areaOfWorkName;
    }

    public void setAreaOfWorkName(String areaOfWorkName) {
        this.areaOfWorkName = areaOfWorkName;
    }

    public String getTenderKeywords() {
        return tenderKeywords;
    }

    public void setTenderKeywords(String tenderKeywords) {
        this.tenderKeywords = tenderKeywords;
    }

    public List<TenderKeyword> getTenderKeywordsNameList() {
        return tenderKeywordsNameList;
    }

    public void setTenderKeywordsNameList(List<TenderKeyword> tenderKeywordsNameList) {
        this.tenderKeywordsNameList = tenderKeywordsNameList;
    }

    public List<UploadSOR> getUploadSorList() {
        return uploadSorList;
    }

    public void setUploadSorList(List<UploadSOR> uploadSorList) {
        this.uploadSorList = uploadSorList;
    }

    
    public String getSorDocument() {
        return sorDocument;
    }

    public void setSorDocument(String sorDocument) {
        this.sorDocument = sorDocument;
    }

    public UploadSOR getUploadSOR() {
        return uploadSOR;
    }

    public void setUploadSOR(UploadSOR uploadSOR) {
        this.uploadSOR = uploadSOR;
    }

    public String getBuyBackPolicy() {
        return buyBackPolicy;
    }

    public void setBuyBackPolicy(String buyBackPolicy) {
        this.buyBackPolicy = buyBackPolicy;
    }

    public String getBuyBackDocument() {
        return buyBackDocument;
    }

    public void setBuyBackDocument(String buyBackDocument) {
        this.buyBackDocument = buyBackDocument;
    }

    public MultipartFile getBuyBackDocumentFile() {
        return buyBackDocumentFile;
    }

    public void setBuyBackDocumentFile(MultipartFile buyBackDocumentFile) {
        this.buyBackDocumentFile = buyBackDocumentFile;
    }

    public String getNameOfWork() {
        return nameOfWork;
    }

    public void setNameOfWork(String nameOfWork) {
        this.nameOfWork = nameOfWork;
    }

    public String getEnvelopeTypeName() {
        return envelopeTypeName;
    }

    public void setEnvelopeTypeName(String envelopeTypeName) {
        this.envelopeTypeName = envelopeTypeName;
    }

    public String getDescriptionOfWork() {
        return descriptionOfWork;
    }

    public void setDescriptionOfWork(String descriptionOfWork) {
        this.descriptionOfWork = descriptionOfWork;
    }

    public String getEstimateValueInFig() {
        return estimateValueInFig;
    }

    public void setEstimateValueInFig(String estimateValueInFig) {
        this.estimateValueInFig = estimateValueInFig;
    }

    public String getEstimateValueInWord() {
        return estimateValueInWord;
    }

    public void setEstimateValueInWord(String estimateValueInWord) {
        this.estimateValueInWord = estimateValueInWord;
    }

    public String getTenderFeeInFig() {
        return tenderFeeInFig;
    }

    public void setTenderFeeInFig(String tenderFeeInFig) {
        this.tenderFeeInFig = tenderFeeInFig;
    }

    public String getTenderFeeInWord() {
        return tenderFeeInWord;
    }

    public void setTenderFeeInWord(String tenderFeeInWord) {
        this.tenderFeeInWord = tenderFeeInWord;
    }

    public String getModeOfFeeForTenderFee() {
        return modeOfFeeForTenderFee;
    }

    public void setModeOfFeeForTenderFee(String modeOfFeeForTenderFee) {
        this.modeOfFeeForTenderFee = modeOfFeeForTenderFee;
    }

    public String getBidValidateType() {
        return bidValidateType;
    }

    public void setBidValidateType(String bidValidateType) {
        this.bidValidateType = bidValidateType;
    }

    public String getBidValidatePeriod() {
        return bidValidatePeriod;
    }

    public void setBidValidatePeriod(String bidValidatePeriod) {
        this.bidValidatePeriod = bidValidatePeriod;
    }

    public String getWorkCompletionType() {
        return workCompletionType;
    }

    public void setWorkCompletionType(String workCompletionType) {
        this.workCompletionType = workCompletionType;
    }

    public String getWorkCompletionPeriod() {
        return workCompletionPeriod;
    }

    public void setWorkCompletionPeriod(String workCompletionPeriod) {
        this.workCompletionPeriod = workCompletionPeriod;
    }

    public String getRainySeason() {
        return rainySeason;
    }

    public void setRainySeason(String rainySeason) {
        this.rainySeason = rainySeason;
    }

    public String getNumberOfWorks() {
        return numberOfWorks;
    }

    public void setNumberOfWorks(String numberOfWorks) {
        this.numberOfWorks = numberOfWorks;
    }

    
    public String getEnvelopeType() {
        return envelopeType;
    }

    public void setEnvelopeType(String envelopeType) {
        this.envelopeType = envelopeType;
    }

    public String getContractorClass() {
        return contractorClass;
    }

    public void setContractorClass(String contractorClass) {
        this.contractorClass = contractorClass;
    }

    public String getContractorClassName() {
        return contractorClassName;
    }

    public void setContractorClassName(String contractorClassName) {
        this.contractorClassName = contractorClassName;
    }

    public String getTypeOfTenderName() {
        return typeOfTenderName;
    }

    public void setTypeOfTenderName(String typeOfTenderName) {
        this.typeOfTenderName = typeOfTenderName;
    }

    public String getTypeOfTender() {
        return typeOfTender;
    }

    public void setTypeOfTender(String typeOfTender) {
        this.typeOfTender = typeOfTender;
    }

    public String getEmdApplicable() {
        return emdApplicable;
    }

    public void setEmdApplicable(String emdApplicable) {
        this.emdApplicable = emdApplicable;
    }

    public String getModeOfFeeForEMDApplicable() {
        return modeOfFeeForEMDApplicable;
    }

    public void setModeOfFeeForEMDApplicable(String modeOfFeeForEMDApplicable) {
        this.modeOfFeeForEMDApplicable = modeOfFeeForEMDApplicable;
    }

    public String getEmdInFig() {
        return emdInFig;
    }

    public void setEmdInFig(String emdInFig) {
        this.emdInFig = emdInFig;
    }

    public String getEmdInWords() {
        return emdInWords;
    }

    public void setEmdInWords(String emdInWords) {
        this.emdInWords = emdInWords;
    }

    public String getMsmensicExemption() {
        return msmensicExemption;
    }

    public void setMsmensicExemption(String msmensicExemption) {
        this.msmensicExemption = msmensicExemption;
    }

    public String getTenderfeeMSMENSICExemption() {
        return tenderfeeMSMENSICExemption;
    }

    public void setTenderfeeMSMENSICExemption(String tenderfeeMSMENSICExemption) {
        this.tenderfeeMSMENSICExemption = tenderfeeMSMENSICExemption;
    }

    public String getEmdMSMENSICExemption() {
        return emdMSMENSICExemption;
    }

    public void setEmdMSMENSICExemption(String emdMSMENSICExemption) {
        this.emdMSMENSICExemption = emdMSMENSICExemption;
    }

    public String getScstExemption() {
        return scstExemption;
    }

    public void setScstExemption(String scstExemption) {
        this.scstExemption = scstExemption;
    }

    public String getTenderfeeSCSTExemption() {
        return tenderfeeSCSTExemption;
    }

    public void setTenderfeeSCSTExemption(String tenderfeeSCSTExemption) {
        this.tenderfeeSCSTExemption = tenderfeeSCSTExemption;
    }

    public String getEmdTenderSCSTFeeExemption() {
        return emdTenderSCSTFeeExemption;
    }

    public void setEmdTenderSCSTFeeExemption(String emdTenderSCSTFeeExemption) {
        this.emdTenderSCSTFeeExemption = emdTenderSCSTFeeExemption;
    }

    public String getObcExemption() {
        return obcExemption;
    }

    public void setObcExemption(String obcExemption) {
        this.obcExemption = obcExemption;
    }

    public String getTenderfeeOBCExemption() {
        return tenderfeeOBCExemption;
    }

    public void setTenderfeeOBCExemption(String tenderfeeOBCExemption) {
        this.tenderfeeOBCExemption = tenderfeeOBCExemption;
    }

    public String getEmdTenderOBCFeeExemption() {
        return emdTenderOBCFeeExemption;
    }

    public void setEmdTenderOBCFeeExemption(String emdTenderOBCFeeExemption) {
        this.emdTenderOBCFeeExemption = emdTenderOBCFeeExemption;
    }

    public String getAmmendmentPrivilege() {
        return ammendmentPrivilege;
    }

    public void setAmmendmentPrivilege(String ammendmentPrivilege) {
        this.ammendmentPrivilege = ammendmentPrivilege;
    }

    public String getAmmendmentPrivilegeOfficer() {
        return ammendmentPrivilegeOfficer;
    }

    public void setAmmendmentPrivilegeOfficer(String ammendmentPrivilegeOfficer) {
        this.ammendmentPrivilegeOfficer = ammendmentPrivilegeOfficer;
    }

    public String getApprovalOfficer() {
        return approvalOfficer;
    }

    public void setApprovalOfficer(String approvalOfficer) {
        this.approvalOfficer = approvalOfficer;
    }

    public List<DepartmentUser> getAmmendmentPrivilegeOfficerList() {
        return ammendmentPrivilegeOfficerList;
    }

    public void setAmmendmentPrivilegeOfficerList(List<DepartmentUser> ammendmentPrivilegeOfficerList) {
        this.ammendmentPrivilegeOfficerList = ammendmentPrivilegeOfficerList;
    }

    
    public String getTenderRebid() {
        return tenderRebid;
    }

    public void setTenderRebid(String tenderRebid) {
        this.tenderRebid = tenderRebid;
    }

    public String getTenderBidWithdraw() {
        return tenderBidWithdraw;
    }

    public void setTenderBidWithdraw(String tenderBidWithdraw) {
        this.tenderBidWithdraw = tenderBidWithdraw;
    }

    public String getSingedPDF() {
        return singedPDF;
    }

    public void setSingedPDF(String singedPDF) {
        this.singedPDF = singedPDF;
    }

    public String getTenderNotice() {
        return tenderNotice;
    }

    public void setTenderNotice(String tenderNotice) {
        this.tenderNotice = tenderNotice;
    }

    public String getTenderCallStatus() {
        return tenderCallStatus;
    }

    public void setTenderCallStatus(String tenderCallStatus) {
        this.tenderCallStatus = tenderCallStatus;
    }

    public String getTenderMaster() {
        return tenderMaster;
    }

    public void setTenderMaster(String tenderMaster) {
        this.tenderMaster = tenderMaster;
    }

    public String getTenderMasterId() {
        return tenderMasterId;
    }

    public void setTenderMasterId(String tenderMasterId) {
        this.tenderMasterId = tenderMasterId;
    }

    public String getTenderStatus() {
        return tenderStatus;
    }

    public void setTenderStatus(String tenderStatus) {
        this.tenderStatus = tenderStatus;
    }

    public String getWizardStep() {
        return wizardStep;
    }

    public void setWizardStep(String wizardStep) {
        this.wizardStep = wizardStep;
    }

    public TenderKeyDates getTenderKeyDates() {
        return tenderKeyDates;
    }

    public void setTenderKeyDates(TenderKeyDates tenderKeyDates) {
        this.tenderKeyDates = tenderKeyDates;
    }

    public String getPreBidMeetingStatus() {
        return preBidMeetingStatus;
    }

    public void setPreBidMeetingStatus(String preBidMeetingStatus) {
        this.preBidMeetingStatus = preBidMeetingStatus;
    }

    public String getPreBidMeetingVenue() {
        return preBidMeetingVenue;
    }

    public void setPreBidMeetingVenue(String preBidMeetingVenue) {
        this.preBidMeetingVenue = preBidMeetingVenue;
    }

    public String getPreBidMeetingDate() {
        return preBidMeetingDate;
    }

    public void setPreBidMeetingDate(String preBidMeetingDate) {
        this.preBidMeetingDate = preBidMeetingDate;
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

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getStatusDocumentAmmendment() {
        return statusDocumentAmmendment;
    }

    public void setStatusDocumentAmmendment(String statusDocumentAmmendment) {
        this.statusDocumentAmmendment = statusDocumentAmmendment;
    }

    public String getAmmendmentDate() {
        return ammendmentDate;
    }

    public void setAmmendmentDate(String ammendmentDate) {
        this.ammendmentDate = ammendmentDate;
    }

    public String getAmmendmentCorrigendum() {
        return ammendmentCorrigendum;
    }

    public void setAmmendmentCorrigendum(String ammendmentCorrigendum) {
        this.ammendmentCorrigendum = ammendmentCorrigendum;
    }

    public MultipartFile getStatusFile() {
        return statusFile;
    }

    public void setStatusFile(MultipartFile statusFile) {
        this.statusFile = statusFile;
    }

    public TenderKeyDatesAmendment getTenderKeyDatesAmendment() {
        return tenderKeyDatesAmendment;
    }

    public void setTenderKeyDatesAmendment(TenderKeyDatesAmendment tenderKeyDatesAmendment) {
        this.tenderKeyDatesAmendment = tenderKeyDatesAmendment;
    }

    public Map<Integer, String> getEnvelopeAOfficersName() {
        return envelopeAOfficersName;
    }

    public void setEnvelopeAOfficersName(Map<Integer, String> envelopeAOfficersName) {
        this.envelopeAOfficersName = envelopeAOfficersName;
    }

    public Map<Integer, String> getEnvelopeBOfficersName() {
        return envelopeBOfficersName;
    }

    public void setEnvelopeBOfficersName(Map<Integer, String> envelopeBOfficersName) {
        this.envelopeBOfficersName = envelopeBOfficersName;
    }

    public Map<Integer, String> getEnvelopeCOfficersName() {
        return envelopeCOfficersName;
    }

    public void setEnvelopeCOfficersName(Map<Integer, String> envelopeCOfficersName) {
        this.envelopeCOfficersName = envelopeCOfficersName;
    }

    public boolean isStatusManaging() {
        return statusManaging;
    }

    public void setStatusManaging(boolean statusManaging) {
        this.statusManaging = statusManaging;
    }

    public boolean isProceedtoBid() {
        return proceedtoBid;
    }

    public void setProceedtoBid(boolean proceedtoBid) {
        this.proceedtoBid = proceedtoBid;
    }

    public boolean isEnvelopeASubmittStatus() {
        return envelopeASubmittStatus;
    }

    public void setEnvelopeASubmittStatus(boolean envelopeASubmittStatus) {
        this.envelopeASubmittStatus = envelopeASubmittStatus;
    }

    public boolean isEnvelopeBSubmittStatus() {
        return envelopeBSubmittStatus;
    }

    public void setEnvelopeBSubmittStatus(boolean envelopeBSubmittStatus) {
        this.envelopeBSubmittStatus = envelopeBSubmittStatus;
    }

    public boolean isEnvelopeCSubmittStatus() {
        return envelopeCSubmittStatus;
    }

    public void setEnvelopeCSubmittStatus(boolean envelopeCSubmittStatus) {
        this.envelopeCSubmittStatus = envelopeCSubmittStatus;
    }

    public Logs getEnvelopeA_Logs() {
        return envelopeA_Logs;
    }

    public void setEnvelopeA_Logs(Logs envelopeA_Logs) {
        this.envelopeA_Logs = envelopeA_Logs;
    }

    public Logs getEnvelopeB_Logs() {
        return envelopeB_Logs;
    }

    public void setEnvelopeB_Logs(Logs envelopeB_Logs) {
        this.envelopeB_Logs = envelopeB_Logs;
    }

    public Logs getEnvelopeC_Logs() {
        return envelopeC_Logs;
    }

    public void setEnvelopeC_Logs(Logs envelopeC_Logs) {
        this.envelopeC_Logs = envelopeC_Logs;
    }

    public TenderSubmittedEnvelopeA getTenderSubmittedEnvelopeA() {
        return tenderSubmittedEnvelopeA;
    }

    public void setTenderSubmittedEnvelopeA(TenderSubmittedEnvelopeA tenderSubmittedEnvelopeA) {
        this.tenderSubmittedEnvelopeA = tenderSubmittedEnvelopeA;
    }

    public TenderSubmittedEnvelopeB getTenderSubmittedEnvelopeB() {
        return tenderSubmittedEnvelopeB;
    }

    public void setTenderSubmittedEnvelopeB(TenderSubmittedEnvelopeB tenderSubmittedEnvelopeB) {
        this.tenderSubmittedEnvelopeB = tenderSubmittedEnvelopeB;
    }

    public TenderSubmittedEnvelopeC getTenderSubmittedEnvelopeC() {
        return tenderSubmittedEnvelopeC;
    }

    public void setTenderSubmittedEnvelopeC(TenderSubmittedEnvelopeC tenderSubmittedEnvelopeC) {
        this.tenderSubmittedEnvelopeC = tenderSubmittedEnvelopeC;
    }

    public String getSent_for_approval_pdf() {
        return sent_for_approval_pdf;
    }

    public void setSent_for_approval_pdf(String sent_for_approval_pdf) {
        this.sent_for_approval_pdf = sent_for_approval_pdf;
    }

    public String getApproval_pdf() {
        return approval_pdf;
    }

    public void setApproval_pdf(String approval_pdf) {
        this.approval_pdf = approval_pdf;
    }
    
    
    
    
}
