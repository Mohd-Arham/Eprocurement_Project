/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 *  AuctionDocument Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name="auctiondocument")
public class DocumentAuction {
         @Id
   @GeneratedValue(strategy= GenerationType.AUTO)
  private Integer fileId;
   private String doc_Name;
  private String doc_Converted_Name;
  
  private String doc_OrignalName;

   private Date fileUploadDate;
   private int auctionId;
   private String auctionnumber;
   private String doc_path;
   private String  dept_id="0";
   private String fileUrl;
  private String auctiondocumentVisibility;
//  private String fileOriginalName;
//private String file;
private Integer addMoreButton;

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
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

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }

    public String getAuctionnumber() {
        return auctionnumber;
    }

    public void setAuctionnumber(String auctionnumber) {
        this.auctionnumber = auctionnumber;
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

    public String getAuctiondocumentVisibility() {
        return auctiondocumentVisibility;
    }

    public void setAuctiondocumentVisibility(String auctiondocumentVisibility) {
        this.auctiondocumentVisibility = auctiondocumentVisibility;
    }

    public Integer getAddMoreButton() {
        return addMoreButton;
    }

    public void setAddMoreButton(Integer addMoreButton) {
        this.addMoreButton = addMoreButton;
    }

   

   
   

   
}
