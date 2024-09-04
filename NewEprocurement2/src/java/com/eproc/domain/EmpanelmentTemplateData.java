/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.Date;
import javax.mail.Multipart;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Mansi Jain
 */
@Entity
@Table(name="EmpanelmentTemplateData")
public class EmpanelmentTemplateData {
    
     @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "emptempdataId", unique = true, nullable = false)
    private Integer emptempdataId;
     
     @Column(name="labelname")
    private  String labelname;
     
     @Column(name="number")
    private  String number;
     
      @Column(name="filename")
    private  String filename;
      
       @Column(name="status")
    private  String status;
         
       @Column(name="fileurl")
    private  String fileurl;
       
     @Column(name="templatenameId")
    private  Integer templatenameId;
    
       @Column(name="createdDate")
      private Date createdDate;
        
       @Transient
    private Integer sequenceIdA;
       @Transient
       private Multipart multipartfile;

    public Integer getEmptempdataId() {
        return emptempdataId;
    }

    public void setEmptempdataId(Integer emptempdataId) {
        this.emptempdataId = emptempdataId;
    }

    public String getLabelname() {
        return labelname;
    }

    public void setLabelname(String labelname) {
        this.labelname = labelname;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getTemplatenameId() {
        return templatenameId;
    }

    public void setTemplatenameId(Integer templatenameId) {
        this.templatenameId = templatenameId;
    }

    public Integer getSequenceIdA() {
        return sequenceIdA;
    }

    public void setSequenceIdA(Integer sequenceIdA) {
        this.sequenceIdA = sequenceIdA;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }

    public Multipart getMultipartfile() {
        return multipartfile;
    }

    public void setMultipartfile(Multipart multipartfile) {
        this.multipartfile = multipartfile;
    }

   
}
