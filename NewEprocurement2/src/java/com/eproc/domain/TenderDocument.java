/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.File;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Gaurav Dubey
 */
@Entity
@Table(name = "tender_documents")
public class TenderDocument {
    
    @Id 
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "doc_Id")
    private int doc_Id;
    
    @Column(name = "doc_Path")
    private String doc_Path;
    
    @Column(name = "doc_Name")
    private String doc_Name;
    
    @Column(name = "doc_OrignalName")
    private String doc_OrignalName;
    
    @Column(name = "dept_id")
    private String dept_id;
    
    @Column(name = "tender_id")
    private String tender_id;
    
    @Column(name = "doc_Converted_Name")
    private String doc_Converted_Name;
    
    @Column(name = "tender_no")
    private String tender_no;
    
    @Column(name = "documentVisibility")
    private String documentVisibility;
    
    @Column(name = "idx")
    private String idx;
    
    @Column(name = "docSequnceId")
    private int docSequnceId;

    @Transient
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
    
    public int getDoc_Id() {
        return doc_Id;
    }

    public void setDoc_Id(int doc_Id) {
        this.doc_Id = doc_Id;
    }

    public String getDoc_Path() {
        return doc_Path;
    }

    public void setDoc_Path(String doc_Path) {
        this.doc_Path = doc_Path;
    }

    public String getDoc_Name() {
        return doc_Name;
    }

    public void setDoc_Name(String doc_Name) {
        this.doc_Name = doc_Name;
    }

    public String getDoc_OrignalName() {
        return doc_OrignalName;
    }

    public void setDoc_OrignalName(String doc_OrignalName) {
        this.doc_OrignalName = doc_OrignalName;
    }

    public String getDept_id() {
        return dept_id;
    }

    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    public String getTender_id() {
        return tender_id;
    }

    public void setTender_id(String tender_id) {
        this.tender_id = tender_id;
    }

    public String getDoc_Converted_Name() {
        return doc_Converted_Name;
    }

    public void setDoc_Converted_Name(String doc_Converted_Name) {
        this.doc_Converted_Name = doc_Converted_Name;
    }

    public String getTender_no() {
        return tender_no;
    }

    public void setTender_no(String tender_no) {
        this.tender_no = tender_no;
    }

    public String getDocumentVisibility() {
        return documentVisibility;
    }

    public void setDocumentVisibility(String documentVisibility) {
        this.documentVisibility = documentVisibility;
    }

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public int getDocSequnceId() {
        return docSequnceId;
    }

    public void setDocSequnceId(int docSequnceId) {
        this.docSequnceId = docSequnceId;
    }
    
    
    
}
