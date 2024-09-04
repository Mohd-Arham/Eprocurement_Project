package com.eproc.domain;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="cloud_file")
public class CloudFile implements java.io.Serializable {

   @Id
   @GeneratedValue(strategy= GenerationType.AUTO)
   private Integer fileId;
   private String fileName;
   private String fileConvertedName;
   private Float fileSize;
   private String fileType;
   private String fileDestPath;
   private String fileUrl;
   private Date fileUploadDate;
   private String contractorId;
   private String deptUserId;
   private int cloudFolderId;
   
   
//   @Transient
//   private String fileIcon;
//   
//   @ManyToOne
//   @JoinColumn(name = "cloudFolderId")
//   private CloudFolder cloudFolder;

   public CloudFile() {
   }

   public Integer getFileId() {
      return this.fileId;
   }

   public void setFileId(Integer fileId) {
      this.fileId = fileId;
   }

   public String getFileName() {
      return this.fileName;
   }

   public void setFileName(String fileName) {
      this.fileName = fileName;
   }



   public String getFileType() {
      return fileType;
   }

   public void setFileType(String fileType) {
      this.fileType = fileType;
   }

   public String getFileDestPath() {
      return fileDestPath;
   }

   public void setFileDestPath(String fileDestPath) {
      this.fileDestPath = fileDestPath;
   }

   public String getFileConvertedName() {
      return this.fileConvertedName;
   }

   public void setFileConvertedName(String fileConvertedName) {
      this.fileConvertedName = fileConvertedName;
   }

    public Float getFileSize() {
        return fileSize;
    }

    public void setFileSize(Float fileSize) {
        this.fileSize = fileSize;
    }
    
    public String getFileUrl() {
      return this.fileUrl;
    }

   public void setFileUrl(String fileUrl) {
      this.fileUrl = fileUrl;
   }

   public Date getFileUploadDate() {
      return fileUploadDate;
   }

   public void setFileUploadDate(Date fileUploadDate) {
      this.fileUploadDate = fileUploadDate;
   }

   public int getCloudFolderId() {
      return cloudFolderId;
   }

    public void setCloudFolderId(int cloudFolderId) {
        this.cloudFolderId = cloudFolderId;
    }

//   }
    public String getContractorId() {
        return contractorId;
    }

   public void setContractorId(String contractorId) {
      this.contractorId = contractorId;
   }

   public String getDeptUserId() {
      return deptUserId;
   }

   public void setDeptUserId(String deptUserId) {
      this.deptUserId = deptUserId;
   }
   
}
