
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/** This class content object property of Upload SOR with their setter and getter
 
 * @author Palak Tiwari
 */
@Entity
@Table(name="uploadsor")
public class UploadSOR{
      
 @Id 
 @GeneratedValue(strategy = GenerationType.AUTO)
   private int id;
   private int dept_id;
   private String uploadSorFileName;
   private String filePath;
   private String  fileName;
   private String fileUrl;
   private Date createdDate;
   private String  fileconvertedName;
   private String status;
 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public String getUploadSorFileName() {
        return uploadSorFileName;
    }

    public void setUploadSorFileName(String uploadSorFileName) {
        this.uploadSorFileName = uploadSorFileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getFileconvertedName() {
        return fileconvertedName;
    }

    public void setFileconvertedName(String fileconvertedName) {
        this.fileconvertedName = fileconvertedName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

  
   
   
     }
    
    
   
  

   

  
    

