/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Prashant_Shukla
 */
@Entity
@Table(name="amidmentdocument")
public class InventoryDocument implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "documentId", unique = true, nullable = false)
    private Integer documentId;
 private String Doc_Name;
    private String Doc_Converted_Name;
    private String Doc_OrignalName;
    private Date fileUploadDate;
 private Integer auctionId;
    private String Doc_path;
    private String  dept_id;
    private String fileUrl;

    public Integer getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Integer auctionId) {
        this.auctionId = auctionId;
    }
    
    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public String getDoc_Name() {
        return Doc_Name;
    }

    public void setDoc_Name(String Doc_Name) {
        this.Doc_Name = Doc_Name;
    }

    public String getDoc_Converted_Name() {
        return Doc_Converted_Name;
    }

    public void setDoc_Converted_Name(String Doc_Converted_Name) {
        this.Doc_Converted_Name = Doc_Converted_Name;
    }

    public String getDoc_OrignalName() {
        return Doc_OrignalName;
    }

    public void setDoc_OrignalName(String Doc_OrignalName) {
        this.Doc_OrignalName = Doc_OrignalName;
    }

    public Date getFileUploadDate() {
        return fileUploadDate;
    }

    public void setFileUploadDate(Date fileUploadDate) {
        this.fileUploadDate = fileUploadDate;
    }
 public String getDoc_path() {
        return Doc_path;
    }

    public void setDoc_path(String Doc_path) {
        this.Doc_path = Doc_path;
    }

    public String getDept_id() {
        return dept_id;
    }

    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }
   }
