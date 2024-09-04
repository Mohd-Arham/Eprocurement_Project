/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;


import com.eproc.domain.CloudFile;
import com.eproc.domain.CloudFolder;

import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author PrashantShukla
 */
public interface CloudDao 
{
String saveFolder(CloudFolder cloudFolder);
List<CloudFolder> fetchAll();
void save(CloudFile cloudFile);
List<CloudFile> fetchAlls();
boolean updateCloudFolder(CloudFolder cloudFolder);
boolean updateCloudFile(CloudFile cloudFile);
List<CloudFile> getEmpById(int id);
// void updateNumberOfFileInCloudFolder(int cloudFolderId);
String fetchFolderSize(int cloudFolderId);
List<CloudFolder> cloudFolderList();
List<CloudFile> cloudFileDaoImpldata(Integer cloudFolderId);
//String converByte_To_KB_MB(String bytes);
}
