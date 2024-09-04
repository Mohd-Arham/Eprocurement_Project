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
@Table(name="AssetDocument")
public class AssetDocument implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "AssetDocumentId", unique = true, nullable = false)
    private Integer AssetDocumentId;
    private String doc_Name;
    private String doc_Converted_Name;
    private String doc_OrignalName;
    private Date fileUploadDate;
    private Integer asset_id;
    private String doc_path;
    private String  dept_id="0";
    private String fileUrl;

    public Integer getAssetDocumentId() {
        return AssetDocumentId;
    }

    public void setAssetDocumentId(Integer AssetDocumentId) {
        this.AssetDocumentId = AssetDocumentId;
    }

    public String getDoc_Name() {
        return doc_Name;
    }

    public void setDoc_Name(String doc_Name) {
        this.doc_Name = doc_Name;
    }

    public String getDoc_Converted_Name() {
        return doc_Converted_Name;
    }

    public void setDoc_Converted_Name(String doc_Converted_Name) {
        this.doc_Converted_Name = doc_Converted_Name;
    }

    public String getDoc_OrignalName() {
        return doc_OrignalName;
    }

    public void setDoc_OrignalName(String doc_OrignalName) {
        this.doc_OrignalName = doc_OrignalName;
    }

    public Date getFileUploadDate() {
        return fileUploadDate;
    }

    public void setFileUploadDate(Date fileUploadDate) {
        this.fileUploadDate = fileUploadDate;
    }

    public Integer getAsset_id() {
        return asset_id;
    }

    public void setAsset_id(Integer asset_id) {
        this.asset_id = asset_id;
    }

    public String getDoc_path() {
        return doc_path;
    }

    public void setDoc_path(String doc_path) {
        this.doc_path = doc_path;
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
