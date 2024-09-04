package com.eproc.domain;

import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import javax.mail.Multipart;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;
import org.antlr.v4.runtime.misc.Nullable;

/**
 * @author Prashant_Shukla
 * @since 20june2018
 * @version 2.0.0
 */
@Entity
@Table(name = "dynamictemplateaddmore")
public class DynamicTemplatePojo {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "dynamicId", unique = true, nullable = false)
    private Integer dynamicId;
    @Column(name = "name")
 private String name;
    @Column(name = "address")
 private String address;
      @Column(name = "sequenceIdA")
 private Integer sequenceIdA;
    @Column(name = "auctionEnvelopeNameId")
 private Integer auctionEnvelopeNameId;  
    private int deptId;
@Transient
    private String auctionEnvelope_name;
@Transient
private String textfield;
@Transient
private String textfieldInWords;
@Transient
private int envelopeADataId;
@Transient
private int envelopeBDataId;
@Transient
@Nullable
private MultipartFile files;
@Transient 
private String fileFlag;
@Transient
private ArrayList<DynamicTemplatePojo> datalist;
@Transient
private ArrayList<DynamicTemplatePojo> EnvelopeId;
@Transient
private String terms;

public DynamicTemplatePojo() {
    }

    public Integer getDynamicId() {
        return dynamicId;
    }

    public void setDynamicId(Integer dynamicId) {
        this.dynamicId = dynamicId;
    }
public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getSequenceIdA() {
        return sequenceIdA;
    }

    public void setSequenceIdA(Integer sequenceIdA) {
        this.sequenceIdA = sequenceIdA;
    }

    public Integer getAuctionEnvelopeNameId() {
        return auctionEnvelopeNameId;
    }

    public void setAuctionEnvelopeNameId(Integer auctionEnvelopeNameId) {
        this.auctionEnvelopeNameId = auctionEnvelopeNameId;
    }

    public String getAuctionEnvelope_name() {
        return auctionEnvelope_name;
    }

    public void setAuctionEnvelope_name(String auctionEnvelope_name) {
        this.auctionEnvelope_name = auctionEnvelope_name;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getTextfield() {
        return textfield;
    }

    public void setTextfield(String textfield) {
        this.textfield = textfield;
    }

    public MultipartFile getFiles() {
        return files;
    }

    public void setFiles(MultipartFile files) {
        this.files = files;
    }

   

    public String getFileFlag() {
        return fileFlag;
    }

    public void setFileFlag(String fileFlag) {
        this.fileFlag = fileFlag;
    }
    
    

    public int getEnvelopeADataId() {
        return envelopeADataId;
    }

    public void setEnvelopeADataId(int envelopeADataId) {
        this.envelopeADataId = envelopeADataId;
    }

    public int getEnvelopeBDataId() {
        return envelopeBDataId;
    }

    public void setEnvelopeBDataId(int envelopeBDataId) {
        this.envelopeBDataId = envelopeBDataId;
    }

   

    

    public String getTextfieldInWords() {
        return textfieldInWords;
    }

    public void setTextfieldInWords(String textfieldInWords) {
        this.textfieldInWords = textfieldInWords;
    }

//    public ArrayList<Integer> getDatalist() {
//        return datalist;
//    }
//
//    public void setDatalist(ArrayList<Integer> datalist) {
//        this.datalist = datalist;
//    }

    public ArrayList<DynamicTemplatePojo> getDatalist() {
        return datalist;
    }

    public void setDatalist(ArrayList<DynamicTemplatePojo> datalist) {
        this.datalist = datalist;
    }

    public ArrayList<DynamicTemplatePojo> getEnvelopeId() {
        return EnvelopeId;
    }

    public void setEnvelopeId(ArrayList<DynamicTemplatePojo> EnvelopeId) {
        this.EnvelopeId = EnvelopeId;
    }

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }

   

 
 

   
}
