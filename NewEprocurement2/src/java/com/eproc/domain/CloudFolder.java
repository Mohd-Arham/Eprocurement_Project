/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author PrashantShukla
 */
@Entity
@Table(name = "cloud_folder")
public class CloudFolder implements Serializable {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "cloudFolderId", unique = true, nullable = false)
    private int cloudFolderId;
    private String folderName;
    private int numberOfFile;
    private Date folderCreateDate;
    private String folderSize;

    public String getFolderSize() {
        return folderSize;
    }

    public void setFolderSize(String folderSize) {
        this.folderSize = folderSize;
    }

    
//    @OneToMany(mappedBy = "cloudFolder", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    private List<CloudFile> cloudFiles;

    public int getNumberOfFile() {
        return numberOfFile;
    }

    public void setNumberOfFile(int numberOfFile) {
        this.numberOfFile = numberOfFile;
    }
     public Date getFolderCreateDate() {
        return folderCreateDate;
    }

    public void setFolderCreateDate(Date folderCreateDate) {
        this.folderCreateDate = folderCreateDate;
    }
    public int getCloudFolderId() {
        return cloudFolderId;
    }

    public void setCloudFolderId(int cloudFolderId) {
        this.cloudFolderId = cloudFolderId;
    }

    public String getFolderName() {
        return folderName;
    }

    public void setFolderName(String folderName) {
        this.folderName = folderName;
    }
//
//    public List<CloudFile> getCloudFiles() {
//        return cloudFiles;
//    }
//
//    public void setCloudFiles(List<CloudFile> cloudFiles) {
//        this.cloudFiles = cloudFiles;
//    }


}
