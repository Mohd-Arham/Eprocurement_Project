package com.eproc.controller;
//
////import com.eproc.dao.AuctionAmendmentDao;

import org.springframework.stereotype.Controller;

//import com.eproc.dao.DepartmentAdminDAO;
//import com.eproc.dao.DepartmentDao;
//import com.eproc.daoImpl.AuctionDaoImpl;
////import com.eproc.daoImpl.InventoryDaoImpl;
//import com.eproc.domain.AssetDetails;
//import com.eproc.domain.AssetDocument;
//import com.eproc.domain.Asset_Category;
//import com.eproc.domain.Asset_Subcategory;
//import com.eproc.domain.Auction;
////import com.eproc.domain.AuctionAmidemntDescription;
//import com.eproc.domain.AuctionAmidmentKeyDates;
//import com.eproc.domain.AuctionEnvelopeNameDynamic;
//import com.eproc.domain.AuctionKeyDates;
//import com.eproc.domain.Category;
//import com.eproc.domain.CloudFile;
//import com.eproc.domain.CloudFolder;
//import com.eproc.domain.DepartmentAdmin;
//import com.eproc.domain.DocumentAuction;
//import com.eproc.domain.DynamicTemplatePojo;
//import com.eproc.domain.Inventory;
//import com.eproc.domain.InventoryDocument;
//import com.eproc.domain.Logs;
//import com.eproc.domain.Subcategory;
//import com.eproc.logs.LogsAction;
//import com.eproc.logs.LogsActionDao;
////import com.eproc.model.AuctionModal;
////import com.eproc.model.InventoryModel;
//import com.eproc.util.FileUtility;
//import com.eproc.util.GsonUtility;
//import com.google.gson.Gson;
//import java.io.BufferedOutputStream;
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//import java.util.Random;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletOutputStream;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import org.antlr.v4.runtime.misc.Nullable;
//import org.apache.commons.io.FilenameUtils;
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.BeanUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.context.request.RequestAttributes;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.commons.CommonsMultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
///*  AuctionController
// *  @author Prashant Shukla
// *  @Since 13-08-2018
// *  @Version 2.0.0
// */
//
@Controller
public class AuctionController {
//    
//    Map<Integer, String> itemselected = new HashMap<Integer, String>();
//    @Autowired(required = true)
//    SessionFactory sessionFactory;
//    public String UPLOAD_DIRECTORY = "/docs";
//    public String UPLOAD_DIRECTORY1 = "/AssetDocument";
//    @Autowired
//    AuctionDaoImpl auctionDaoImpl;
////    AuctionAmendmentDao auctionAmendmentDao;
//    @Autowired
////    InventoryDaoImpl inventoryDao;
////    InventoryModel inventoryModel;
//    Session session;
//    @Autowired
//    LogsActionDao logActionDao;
//    @Autowired
//    LogsAction logsAction;
//    @Autowired
//    GsonUtility gsonUtility;
//    Logs logs = new Logs();
////    @Autowired
////    AuctionModal auctionModal;
//    @Autowired
//    DepartmentAdminDAO departmentAdminDAO;
////************************************ in File Uploading genterate no and rendomly in controller********************************************
//public String generateRandomNo() {
//        String str = "0123456789";
//        StringBuilder sb = new StringBuilder();
//        for (int i = 0; i < 4; i++) {
//            sb.append(new Random().nextInt(str.length()));
//        }
//        System.out.println("random no : " + sb);
//        return sb.toString();
//    }
//    
//    public static String removeExtension(String fileName) {
//        if (fileName.indexOf(".") > 0) {
//            return fileName.substring(0, fileName.lastIndexOf("."));
//        } else {
//            return fileName;
//        }
//    }
//
////*******************Create Auction****************************************************
//    /*  saveAuction Controller
//     *  @author Prashant Shukla
//     *  @Since 13-09-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/saveAuction")
//    public String saveAuction() throws Exception {
//        System.out.println(" inside controller contractordetails : " + auction.getAuctionId() + " auctionId : " + auction.getAuctionNotice());
//        auction.setAuctionId(auctionId);
//        System.out.println("*******************insert the category data in Controller****************************************");
//        System.out.println("My AuctionNotice name : " + auction.getAuctionNotice());
//        try {
//            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
//            boolean flag = true;
//            Date date = new Date();
//            auction.setCurrentdatetime(date);
//            String currentDate = sdf.format(date);
//            if (auction.getAuctionDispatchDate().compareTo(currentDate) <= 0) {
//                System.out.println("my dispatcher date is:" + flag);
//            }
//            if (auction.getAuctoextensonffff() == null) {
//                auction.setAuctoextensonffff("NotAllowed");
//                System.out.println("my Extension" + auction.getAuctoextensonffff());
//            }
//            if (auction.getDynamicTemplate() == null) {
//                auction.setDynamicTemplate("NotAllowed");
//                System.out.println("my Extension" + auction.getDynamicTemplate());
//            }
//            if (auction.getAuctionobcExemption() == null) {
//                auction.setAuctionobcExemption("NotAllowed");
//                System.out.println("my Extension" + auction.getAuctionobcExemption());
//            }
//            if (auction.getMsmensicExemption() == null) {
//                auction.setMsmensicExemption("NotAllowed");
//                System.out.println("my Extension" + auction.getMsmensicExemption());
//            }
//            if (auction.getAuctionscstExemption() == null) {
//                auction.setAuctionscstExemption("NotAllowed");
//                System.out.println("my Extension" + auction.getAuctionscstExemption());
//            }
//            if (auction.getPaymentoffline() == null) {
//                auction.setPaymentoffline("NotAllowed");
//                System.out.println("my Extension" + auction.getPaymentoffline());
//            }
//            if (auction.getPaymentoffline1() == null) {
//                auction.setPaymentoffline1("NotAllowed");
//                System.out.println("my Extension" + auction.getPaymentoffline1());
//            }
//            if (auction.getPaymentofflineEmd() == null) {
//                auction.setPaymentofflineEmd("NotAllowed");
//                System.out.println("my Extension" + auction.getPaymentofflineEmd());
//            }
//            Integer x = (Integer) session.getAttribute("assetId");
//            System.out.println("My uploading InventoryIdsdsdsdsds id" + x);
//            Integer deptIds = (Integer) session.getAttribute("deptId");
//            auction.setDeptId(deptIds);
//            System.out.println("Department Id is:" + deptIds);
//            auction.getAuctionnumber();
//            auctionnumber = auctionnumber.split(",")[0];
//            System.out.println("New Auction Number~~~~~~~ " + auctionnumber);
//            auction.setAuctionnumber(auctionnumber);
//            auctionDaoImpl.saveAuction(auction);
//            System.out.println("New Auction Number~~~~~~~ " + auctionnumber);
//            System.out.println("Department Id is:" + deptIds);
//            logs.setActivity("save Auction");
//            logs.setLogMessage("Department User details Updateed successfully");
//            logs.setIpAddress(logsAction.fetchIpAddress());
//            logs.setOsName(logsAction.getOs());
//            logs.setMacAddress(logsAction.fetchMacAddress());
//            logs.setClientBrowser(logsAction.getClientBrowser(request));
//            logs.setAuctionId(auction.getAuctionId());
//            logActionDao.save(logs);
//            int id = auction.getAuctionId();
//            System.out.println("Id: " + id);
//            Gson gson = new Gson();
//            String response = gson.toJson(id);
//            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
//            HttpServletResponse httpServletResponse = ((ServletRequestAttributes) requestAttributes).getResponse();
//            httpServletResponse.setContentType("text/html; charset=UTF-8");
//            httpServletResponse.setCharacterEncoding("UTF-8");
//            PrintWriter out = httpServletResponse.getWriter();
//            out.print(response);
//            out.flush();
//            out.close();
//            auctionId = auction.getAuctionId();
//            session.setAttribute("auctionId", auctionId);
//            session.setAttribute("auctionStatus", auctionStatus);
//            System.out.println("My getStatus" + auctionStatus);
//            m.addAttribute("auction", auction);
//            System.out.println("*******************END****************************************");
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
////        return null;
//        return "DepartmentUser/Auctioning";
//    }
//////*******************Create Auction KeyDates****************************************************
///*  saveAuctionKeyDates Controller
//     *  @author Prashant Shukla
//     *  @Since 13-09-2018
//     *  @Version 2.0.0
//     */
//    
//    @RequestMapping("/saveAuctionKeyDates")
//    public String saveAuctionKeyDates(@ModelAttribute AuctionKeyDates auctionKeyDates, @RequestParam Integer keyId, Model m, HttpSession session, RedirectAttributes ra) throws IOException {
//        Integer deptId = (Integer) session.getAttribute("deptId");
//        Date date = new Date();
//        String PurchaseDate = auctionKeyDates.getAuctionPurchaseDateTime();
//        SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy");
//        String currenTdate = sd.format(date);
//        System.out.println("Date " + PurchaseDate);
//        String parts1[] = PurchaseDate.split("-");
//        String part11 = parts1[0];
//        String part12 = parts1[1];
//        String checkStatus = auctionDaoImpl.checkPostPondDate(part11, currenTdate);
//        System.out.println("my currentdater compare of purchase currenty date" + checkStatus);
//        if (checkStatus.equalsIgnoreCase("true")) {
//            System.out.println("*******************insert the  data in Controller****************************************");
//            auctionDaoImpl.saveAuctionKeyDates(auctionKeyDates);
//            System.out.println("my current date" + auctionKeyDates.getCurrentdatetime());
//            int id = auctionKeyDates.getKeyId();
//            session.setAttribute("id", id);
//            System.out.println("My AuctionId is:" + id);}
//        ra.addFlashAttribute("message", "AuctionKeyDates has suspended");
//        m.addAttribute("auctionKeyDates", new AuctionKeyDates());
//        System.out.println("*******************END****************************************");
//        return "AuctionCreationWizard";
//    }
////********************************************Auction DocumentAuction file********************************************************************************       
///*  SaveAuctionDocument Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/auctionDocument")
//    @ResponseBody
//    public String auctionDocumentUpload(@RequestParam("file") MultipartFile[] files,
//            @RequestParam("documentName") String documentName, String auctionId,
//            HttpSession session, DocumentAuction tenderDocument) {
//        System.out.println("auctionId : " + auctionId);
//        String fileconvertedName = null;
//        try {
//            for (int i = 0; i < files.length; i++) {
//                tenderDocument.setDoc_Name(documentName);
//                MultipartFile file = files[i];
//                Date date = new Date();
//                ServletContext context = session.getServletContext();
//                String path = context.getRealPath(UPLOAD_DIRECTORY);
//                System.out.println("Path of the file is:" + path);
//                String filename = file.getOriginalFilename();
//                System.out.println("File name are: " + filename);
//                String ext = filename.substring(filename.lastIndexOf("."));
//                System.out.println("ext" + ext);
//                fileconvertedName = FileUtility.removeExtension(filename) + FileUtility.generateRandomNo() + ext;
//                System.out.println("File converted name is:" + fileconvertedName);
//                byte[] bytes = file.getBytes();
//                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
//                        new File(path + File.separator + fileconvertedName)));
//                stream.write(bytes);
//                if (stream != null) {
//                    stream.close();}
//                int x = Integer.parseInt(session.getAttribute("auctionId").toString());
//                System.out.println("My uploading id" + session.getAttribute("auctionId"));
//                String auctiondocumentVisibility = tenderDocument.getAuctiondocumentVisibility();
//                tenderDocument.setAuctiondocumentVisibility(auctiondocumentVisibility);
//                System.out.println("my Auction Visibility" + tenderDocument.getAuctiondocumentVisibility());
//                tenderDocument.setAuctionId(x);
//                tenderDocument.setDoc_Converted_Name(fileconvertedName);
//                tenderDocument.setDoc_OrignalName(filename);
//                tenderDocument.setFileUploadDate(date);
//                tenderDocument.setDoc_path(path);
//                tenderDocument.setFileUrl(filename);}
//            auctionDaoImpl.saveAuctionDocument(tenderDocument);
//            System.out.println("my document path" + tenderDocument.getDoc_path());
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
////    //***********************************************DocumentAuction File End*********************************************    
///*  SaveItemDocument Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    
//    @RequestMapping("/assetDocument")
//    @ResponseBody
//    public String itemDocumentUpload(@RequestParam("file") MultipartFile[] files,
//            @RequestParam("documentNameasset") String documentNameasset, Integer asset_id,
//            HttpSession session, AssetDocument assetDocument) {
//        System.out.println("Item Id Is : " + asset_id);
//        String fileconvertedName = null;
//        try {
//            for (int i = 0; i < files.length; i++) {
//                assetDocument.setDoc_Name(documentNameasset);
//                MultipartFile file = files[i];
//                Date date = new Date();
//                ServletContext context = session.getServletContext();
//                String path = context.getRealPath(UPLOAD_DIRECTORY1);
//                System.out.println("Path of the file is:" + path);
//                String filename = file.getOriginalFilename();
//                System.out.println("File name are: " + filename);
//                String ext = filename.substring(filename.lastIndexOf("."));
//                System.out.println("ext" + ext);
//                fileconvertedName = FileUtility.removeExtension(filename) + FileUtility.generateRandomNo() + ext;
//                System.out.println("File converted name is:" + fileconvertedName);
//                byte[] bytes = file.getBytes();
//                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
//                        new File(path + File.separator + fileconvertedName)));
//                stream.write(bytes);
//                if (stream != null) {
//                    stream.close();
//                }
//                assetDocument.setAsset_id(asset_id);
//                assetDocument.setDoc_Converted_Name(fileconvertedName);
//                assetDocument.setDoc_OrignalName(filename);
//                assetDocument.setFileUploadDate(date);
//                assetDocument.setDoc_path(path);
//                assetDocument.setFileUrl(filename);
//            }
//            auctionDaoImpl.saveAssetFile(assetDocument);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
////***********************************************END*********************************************
////*********************Delete Data******************************************
//    @RequestMapping("/deleteNewItem")
//    /*  this Method name is deleteinventory of AddInventoryController
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    public String deleteNewItem(@RequestParam Integer asset_id) {
//        try {
//            System.out.println("*******************Delete the Data in controller****************************************");
//            auctionDaoImpl.deleteNewItem(asset_id);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("*******************END****************************************");
//        return "deleteNewItem";}
////*******************************End****************************************
////***********************************************Show ADD Inventory List********************************************* 
///*  SaveinventoryList Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/inventoryList")
//    @ResponseBody
//    public String inventoryList(@ModelAttribute Inventory inventory, Model m, HttpSession session) {
//        try {
//            System.out.println("*******************ADD Inventry List Show in controller****************************************");
//            List<Inventory> list = auctionDaoImpl.showList();
//            System.out.println("My Inventory List" + list.size());
//            Gson gson = new Gson();
//            String resString = gson.toJson(list);
//            writeData(resString);
//            System.out.println("My data is " + list);
//        } catch (Exception e) {
//            e.printStackTrace();}
//        System.out.println("********************************END****************************************");
//        return null;
//    }
////***********************************************ADD Inventory List End********************************************* 
//
////***********************************************Show ADD InventoryAsset List********************************************* 
///*  InventoryAssetList Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/inventoryAssetList")
//    @ResponseBody
//    public String inventoryAssetList(@ModelAttribute AssetDetails assetDetails, Model m, HttpSession session) {
//        try {
//            System.out.println("*******************ADD InventryAsset List Show in controller****************************************");
//            List<AssetDetails> assetInventorylist = auctionDaoImpl.showListInventoryAsset();
//            System.out.println("My InventoryAsset List" + assetInventorylist.size());
//            Gson gson = new Gson();
//            String resString = gson.toJson(assetInventorylist);
//            writeData(resString);
//            System.out.println("My data is " + assetInventorylist);
//        } catch (Exception e) {
//            e.printStackTrace(); }
//        System.out.println("********************************END****************************************");
//        return null;
//    }
////***********************************************ADD Inventory List End********************************************* 
//
////***********************************************Show ADD Inventory List********************************************* 
///* 
//     SavecloudFolderModal Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/cloudFolderModal")
//    @ResponseBody
//    public String cloudFolderModal(@ModelAttribute CloudFolder cloudFolder, Model m, HttpSession session) {
//        try {
//            System.out.println("*******************ADD cloudFolder List Show in controller****************************************");
//            List<CloudFolder> list = auctionDaoImpl.cloudFolderList();
//            System.out.println("My CloudFolder List" + list.size());
//            Gson gson = new Gson();
//            String resString = gson.toJson(list);
//            writeData(resString);
//            System.out.println("My data is " + list);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("*******************END****************************************");
//        return null;
//    }
//    //***********************************************ADD Inventory List End*********************************************    
//
//    //***********************************************Show ADD Cloud File List********************************************* 
//    /*
//     cloudFileModalList Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/cloudFileModal")
//    @ResponseBody
//    public String cloudFileModalList(@ModelAttribute CloudFile cloudFile, Model m, HttpSession session) {
//        try {
//            System.out.println("*******************ADD cloud File List Show in controller****************************************");
//            List<CloudFile> list = auctionDaoImpl.cloudFileList();
//            System.out.println("My CloudFile List" + list.size());
//            Gson gson = new Gson();
//            String resString = gson.toJson(list);
//            writeData(resString);
//            System.out.println("My data is " + list);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("*******************END****************************************");
//        return null;
//    }
//    //***********************************************ADD Cloud File List End*********************************************    
//
////***********************************************FOr Write Data*********************************************  
///*  JSONwriteData Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    private void writeData(String data) {
//        try {
//            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
//            HttpServletResponse httpServletResponse = ((ServletRequestAttributes) requestAttributes).getResponse();
//            httpServletResponse.setContentType("text/plain");
//            httpServletResponse.setCharacterEncoding("UTF-8");
//            ServletOutputStream out = httpServletResponse.getOutputStream();
//            out.print(data);
//            out.flush();
//            out.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
////***********************************************FOr Write Data END******************************************** 
//
////***********************************************FOr SAVE Asset Data*********************************************  
///*  saveAddAsset Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/saveAddAsset")
//    public String saveAddItem(@ModelAttribute AssetDetails assetDetails, @RequestParam Integer asset_id, Model m, HttpSession session, Integer auctionId) throws IOException {
//        Integer deptId = (Integer) session.getAttribute("deptId");
//        System.out.println("*******************insert the category data in Controller****************************************");
//        Integer auctionIds = (Integer) session.getAttribute("auctionId");
//        assetDetails.setAuctionId(auctionIds);
//        auctionDaoImpl.saveAddAsset(assetDetails);
//        System.out.println("my auction data:" + auctionIds);
//        int assetId = assetDetails.getAsset_id();
//        session.setAttribute("assetId", asset_id);
//        Gson gson = new Gson();
//        String response = gson.toJson(assetId);
//        gsonUtility.writeData(response);
//        m.addAttribute("assetDetails", assetDetails);
//        System.out.println("*******************END****************************************");
//        return null;
//    }
////    *******************************************SHOW THE ASSET LIST BY ID DATA*****************************************************
// /*fetchAssetDetailsById Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    
//    @RequestMapping("/fetchAssetDetailsById")
//    @ResponseBody
//    public String fetchItemDetailsById(@RequestParam Integer auctionId, Model m) {
//        String response = "assetDetailsdata";
//        try {
//            List<AssetDetails> assetDetails = null;
//            AssetDetails assetDetails1 = null;
//            System.out.println("afkjgfdkjsfdsfjhgfhj" + auctionId);
//            assetDetails = auctionDaoImpl.itemDetailsFetchIdList(auctionId);
//            for (AssetDetails asset : assetDetails) {
//                Asset_Category asset_category = auctionDaoImpl.fetchByIDAssetCategory(asset.getAssetcId());
//                asset.setAsset_category_name(asset_category.getAsset_category_name());
//                Asset_Subcategory asset_Subcategory = auctionDaoImpl.fetchByIDAssetSubCategory(asset.getAsset_sid());
//                asset.setAsset_subcategoryname(asset_Subcategory.getAsset_subcategoryname());
//            }
//            Gson gson = new Gson();
//            writeData(gson.toJson(assetDetails));
//        } catch (Exception e) {
//            e.getMessage();
//            System.out.println("my error code" + e);
//        }
//        System.out.println("My data is successfully show" + response);
//        return null;
//    }
////*********************************************** FOr ITEM LIST BY ID Data End *********************************************    
//
////*******************************************SHOW THE ASSET LIST BY ID DATA*****************************************************
///*  fetchAssetInvnetoryDetailsById Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/fetchAssetInvnetoryDetailsById")
//    @ResponseBody
//    public String fetchAssetInvnetoryDetailsById(@RequestParam int id, Model m) {
//        String response = "assetDetailsdata";
//        try {
//            List<Inventory> inventoryList = null;
//            Inventory inventory = null;
//            System.out.println("afkjgfdkjsfdsfjhgfhj" + id);
//            inventoryList = auctionDaoImpl.assetDetailsFetchIdLiist1(id);
//            for (Inventory inventorydetails : inventoryList) {
//                Category inventoryCategory = auctionDaoImpl.fetchByIDInventoryCategory(inventorydetails.getCid());
//                inventorydetails.setCategory_name(inventoryCategory.getCategory_name());
//                Subcategory inventorySubcategory = auctionDaoImpl.fetchByIDInventorySubCategory(inventorydetails.getSid());
//                inventorydetails.setSubcategoryname(inventorySubcategory.getSubcategoryname());
//            }
//            System.out.println("asset Details  Data");
//            Gson gson = new Gson();
//            writeData(gson.toJson(inventoryList));
//        } catch (Exception e) {
//            e.getMessage();
//            System.out.println("my error code" + e);
//        }
//        System.out.println("My data is successfully show" + response);
//        return null;
//    }
////*********************************************** FOr AssetInvnetory LIST BY ID Data End *********************************************       
////********************Category Data Registration*********************************
///*  saveAssetCategory Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    
//    @RequestMapping("/saveAssetCategory")
//    public String saveAssetCategory(@ModelAttribute Asset_Category assetcategory, Model m) {
//        System.out.println("*******************insert the category data in Controller****************************************");
//        System.out.println("data is : " + assetcategory.getAsset_category_name());
//        auctionDaoImpl.saveAssetCategory(assetcategory);
//        m.addAttribute("assetcategory", new Asset_Category());
//        System.out.println("*******************END****************************************");
//        return "success";
//    }
////******************End*****************************************************
//
////********************SubCategory Data Registration*********************************
///*  saveAssetSubcategory Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/saveAssetSubcategory")
//    public String saveSubcategory(@ModelAttribute Asset_Subcategory assetsubcategory, Model m) {
//        System.out.println("*******************insert the Subcategory data in Controller****************************************");
//        System.out.println("My data is subcategory name is : " + assetsubcategory.getAsset_subcategoryname());
//        auctionDaoImpl.saveAssetSubcategory(assetsubcategory);
//        m.addAttribute("assetsubcategory", assetsubcategory);
//        System.out.println("******************END***************************************");
//        return "success";
//    }
//
//    //  **************************************AJAX CALL*************************************************************
///*  itemsubCategoryNameByAjax Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping(value = "/itemsubCategoryNameByAjax", method = RequestMethod.GET)
//    @ResponseBody
//    public String getSubCategoryName(@RequestParam Integer assetcId) {
//        System.out.println("category Id from dropdown is : " + assetcId);
//        List<Asset_Subcategory> assetsubcategory = new ArrayList<Asset_Subcategory>();
//        Session session = sessionFactory.openSession();
//        Query query = session.createQuery("FROM Asset_Subcategory WHERE assetcId =:assetcId");
//        assetsubcategory = query.setParameter("assetcId", assetcId).list();
//        // auctionSubCategories = (List<AuctionSubCategories>) (AuctionSubCategories) query.list();
//        for (Asset_Subcategory a : assetsubcategory) {
//            if (a.getAssetcId() == assetcId) {
//                itemselected.put(a.getAsset_sid(), a.getAsset_subcategoryname());
//            }
//            Gson gson = new Gson();
//            writeData(gson.toJson(assetsubcategory));
//        }
//        return null;
//    }
//    //  **************************************AJAX CALL END*************************************************************
///*  copyAuction method Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    
//    @RequestMapping("/copyAuctioncreation")
//    @ResponseBody
//    public Auction copyAuctioncreation(@RequestParam String auctionnumber, Model m) {
//        String response = "CopyAuctioncreation";
//        auctionnumber = auctionnumber.split(",")[0];
//        System.out.println("anum  ~~~~~~~ " + auctionnumber);
//        try {
//            System.out.println("auctionnumber         " + auctionnumber);
//            
//            Auction auction = auctionDaoImpl.getCopyAuction(auctionnumber);
//            AuctionKeyDates auctionKeyDates = auctionDaoImpl.auctionKeyDatesFetchId(auction.getAuctionId());
//            auction.setAuctionPurchaseDateTime(auctionKeyDates.getAuctionPurchaseDateTime());
//            auction.setAuctionBiddingDateTime(auctionKeyDates.getAuctionBiddingDateTime());
//            auction.setDocumentSubmissionDateTime(auctionKeyDates.getDocumentSubmissionDateTime());
//            DocumentAuction auctionDocument = auctionDaoImpl.fetchAuctiondocumentId(auction.getAuctionId());
//            auction.setDoc_Name(auctionDocument.getDoc_Name());
//            auction.setDoc_OrignalName(auctionDocument.getFileUrl());
//            //m.addAttribute("auction", auction);
//            System.out.println("list" + auction.getAuctionFees_In_Word() + " " + auction.getAuctionPattern() + " " + auction.getPortalCharge_In_Word());
//            Gson gson = new Gson();
//            writeData(gson.toJson(auction));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("My Response Data" + response);
//        return null;
//    }
////*****************end******************************************************
//    //  **************************************AJAX CALL END*************************************************************
///*  editAuction Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
////******************************Edit and Update the Invetory**********************************************************
//
//    @RequestMapping("/editAssetData")
//    @ResponseBody
//    public String editITEMData(@RequestParam int asset_id, Model m) {
//        String response = "EditITEM";
//        try {
//            System.out.println("ITEM_id" + asset_id);
//            AssetDetails assetDetails = auctionDaoImpl.fetchById(asset_id);
//            m.addAttribute("assetDetails", assetDetails);
//            System.out.println("Item Data list" + assetDetails.getAsset_id() + " " + assetDetails.getAuctionStartValue());
//            Gson gson = new Gson();
//            writeData(gson.toJson(assetDetails));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("My Response Data" + response);
//        return null;
//    }
//    
//    @RequestMapping("/editAssetInventoryData")
//    @ResponseBody
//    public String editItemInventoryData(@RequestParam int id, Model m) {
//        String response = "EditInventory";
//        try {
//            System.out.println("id" + id);
//            Inventory inventory = inventoryDao.getInventoryById(id);
//            m.addAttribute("inventory", inventory);
//            System.out.println("inventory Data list" + inventory.getId());
//            Gson gson = new Gson();
//            writeData(gson.toJson(inventory));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("My Response Data" + response);
//        return null;
//    }
////*****************end******************************************************
//
//    @RequestMapping("/editAuctionData")
//    @ResponseBody
//    public String editAuctionData(@RequestParam int auctionId, Model m) {
//        String response = "EditAsset";
//        Auction auction = null;
//        try {
//            //System.out.println("my data id" + auction.getAuctionId());
//            System.out.println("auctionId" + auctionId);
//            auction = auctionDaoImpl.editAuctionData(auctionId);
//            System.out.println("my Auction Notice" + auction.getAuctionNotice());
//            AuctionKeyDates auctionKeyDates = auctionDaoImpl.auctionKeyDatesFetchId(auction.getAuctionId());
//            // auction.setAuctionReleseDateTime(auctionKeyDates.getAuctionReleseDateTime());
//            auction.setAuctionPurchaseDateTime(auctionKeyDates.getAuctionPurchaseDateTime());
//            auction.setAuctionBiddingDateTime(auctionKeyDates.getAuctionBiddingDateTime());
//            auction.setDocumentSubmissionDateTime(auctionKeyDates.getDocumentSubmissionDateTime());
//            DocumentAuction auctionDocument = auctionDaoImpl.fetchAuctiondocumentId(auction.getAuctionId());
//            auction.setDoc_Name(auctionDocument.getDoc_Name());
//            auction.setDoc_OrignalName(auctionDocument.getDoc_OrignalName());
//            auction.setDoc_path(auctionDocument.getDoc_path());
//            m.addAttribute("auction", auction);
//            System.out.println("My Auction list :" + auction.getAuctionNotice() + " " + auction.getDoc_OrignalName() + "  " + auction.getDoc_Name() + " " + auction.getAuctionOfWork());
//            Gson gson = new Gson();
//            writeData(gson.toJson(auction));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("My Response Data" + response);
//        return null;
//    }
//    //******************************Auction Validation Serverside the Invetory**********************************************************
//
//    /* This method is used to validate all fields of department
//     * 
//     *@param department
//     *@Param session
//     *
//     *@return string
//     */
//    @RequestMapping(value = "/checkValidate", method = RequestMethod.POST)
//    @ResponseBody
//    public String checkValidate(@ModelAttribute("formData") Auction auction, @RequestParam String auctionnumber, HttpSession session) {
//        System.out.println("###################################### in checkValidate##############################");
//        Integer deptId = (Integer) session.getAttribute("deptId");
//        int auctionId = (Integer) session.getAttribute("auctionId");
//        auction.setDeptId(deptId);
//        auction.setAuctionId(auctionId);
//        System.out.println("auctionId" + auctionId);
//        System.out.println("fetch in:" + auction.getAuctionFees());
//        System.out.println("fdgf" + auction.getAuctionDispatchDate());
//        System.out.println("superadminnnnnnn: " + auction);
//        auctionModal.validate(auction, auctionnumber);
//        System.out.println("Validate successfully & go for operation");
//        return "done";
//    }
//
//    @RequestMapping("/updateAuctionDocument")
//    @ResponseBody
//    public String updateAuctionDocument(@RequestParam Integer addMoreButton, int auctionId, Integer auctiondocumentVisibility, Model m) {
//        DocumentAuction document = null;
//        try {
//            System.out.println("addMoreButtongfgdgfgdfgdfgdgdfggdgf" + addMoreButton);
//            //System.out.println("my dataataatatatatatatata is :" +document.getAuctionId());
//            auctionDaoImpl.updateTenderDocumentStatus(auctionId, auctiondocumentVisibility, addMoreButton);
//            System.out.println("my dataataatatatatatatata is :" + document.getAuctionId());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    //************************--------------------View AuctionAll Fetch data Controller------------******************************
//     /* This method is used to view auction details.
//     *
//     *@Param auctionId
//     *@Param model m
//     *@param request
//     *
//     *@return jsp page.
//     */
//    @RequestMapping("/viewauction")
//    public ModelAndView ViewAuctionData(@RequestParam int auctionId, Model m) {
//        System.out.println("*******************ALL Inventry List Show in controller****************************************");
//        Auction auction = auctionDaoImpl.editAuctionData(auctionId);
//        AuctionKeyDates auctionKeyDates = auctionDaoImpl.auctionKeyDatesFetchId(auction.getAuctionId());
//        auction.setAuctionPurchaseDateTime(auctionKeyDates.getAuctionPurchaseDateTime());
//        auction.setAuctionBiddingDateTime(auctionKeyDates.getAuctionBiddingDateTime());
//        auction.setDocumentSubmissionDateTime(auctionKeyDates.getDocumentSubmissionDateTime());
//        List<DocumentAuction> auctionDocument = (List<DocumentAuction>) auctionDaoImpl.fetchTenderDocumentByAuctionId(auction.getAuctionId());
//        for (DocumentAuction a : auctionDocument) {
//            String Name = a.getDoc_Name();
//            auction.setDoc_Name(Name);
//            String original_name = a.getDoc_OrignalName();
//            auction.setDoc_OrignalName(original_name);
//            String document_Path = a.getDoc_path();
//            auction.setDoc_path(document_Path);
//            System.out.println("document Name  " + Name);
//            System.out.println("original_name " + original_name);
//            System.out.println("document_Path  " + document_Path);
//        }
//        List<AssetDetails> assetDetails = (List<AssetDetails>) auctionDaoImpl.itemDetailsFetchIdLiist(auction.getAuctionId());
//        for (AssetDetails itemDetails : assetDetails) {
//            int categoryname = itemDetails.getAssetcId();
//            auction.setAssetcId(categoryname);
//            int subcategoryname = itemDetails.getAsset_sid();
//            auction.setAsset_sid(subcategoryname);
//            String description = itemDetails.getBriefDescription();
//            auction.setBriefDescription(description);
//            Integer reversePrice = itemDetails.getReversePrice();
//            auction.setReversePrice(reversePrice);
//            String startValue = itemDetails.getAuctionStartValue();
//            auction.setAuctionStartValue(startValue);
//            System.out.println("categoryname" + categoryname);
//            System.out.println("subcategoryname " + subcategoryname);
//            System.out.println("description  " + description);
//            System.out.println("reversePrice  " + reversePrice);
//            System.out.println("startValue  " + startValue);
//        }
//        m.addAttribute("assetDetails", assetDetails);
//        m.addAttribute("auction", auction);
//        m.addAttribute("auctionDocument", auctionDocument);
//        System.out.println("*******************END****************************************");
//        return new ModelAndView("/DepartmentUser/ViewCreateAuction", "auction", auction);
//    }
////************************--------------------View AuctionAll Fetch data Controller------------******************************
//     /* This method is used to view auction details.
//     *
//     *@Param auctionId
//     *@Param model m
//     *@param request
//     *
//     *@return jsp page.
//     */
//    
//    @RequestMapping("/viewAmedmentAuction")
//    public ModelAndView ViewAmedmentAuction(@RequestParam int auctionId, String auctionStatus, @Nullable Auction auction, @Nullable AuctionKeyDates auctionKeyDates, Model m, HttpSession session) {
//        
//        System.out.println("*******************ALL Inventry List Show in controller****************************************");
//        session.setAttribute("auctionId", auctionId);
//        System.out.println("my data" + session.getAttribute("auctionId") + "/auctionStatus: " + auctionStatus + "/");
//        Integer auctionamidmentID = (Integer) session.getAttribute("auctionamidmentId");
//        System.out.println("my AmidmentId is:" + auctionamidmentID);
//        AuctionAmidemntDescription auctionAmidemntDescription = (AuctionAmidemntDescription) session.getAttribute("auctionAmidemntDescriptionsss");
//        System.out.println("@@@@@@@my auctionAmidemntDescription @@@@@@@@@@@" + auctionAmidemntDescription);
//        AuctionAmidmentKeyDates auctionAmidmentKeyDates = (AuctionAmidmentKeyDates) session.getAttribute("auctionAmidmentKeyDates");
//        System.out.println("%%%%%% my auctionAmidmentKeyDates %%%%%%%%" + auctionAmidmentKeyDates);
//        String auctionStatusdata = auction.getAuctionStatus();
//        System.out.println("status__________" + auctionStatusdata);
//        if (auctionStatusdata.equalsIgnoreCase("Amendment")) {
//            List<AuctionAmidemntDescription> auction1 = auctionDaoImpl.editAuctionAmidmentData(auctionId);
//            Iterator iterator = auction1.iterator();
//            AuctionAmidemntDescription next = null;
//            while (iterator.hasNext()) {
//                next = (AuctionAmidemntDescription) iterator.next();
//                
//            }
//            AuctionAmidmentKeyDates auctionAmidmentKeyDates1 = auctionDaoImpl.auctionAmidmentKeyDatesFetchId(auction.getAuctionId());
//            next.setAuctionPurchaseDateTime(auctionAmidmentKeyDates1.getAuctionPurchaseDateTime());
//            System.out.println("my dates" + auctionAmidmentKeyDates1.getAuctionPurchaseDateTime());
//            next.setAuctionBiddingDateTime(auctionAmidmentKeyDates1.getAuctionBiddingDateTime());
//            next.setDocumentSubmissionDateTime(auctionAmidmentKeyDates1.getDocumentSubmissionDateTime());
//            System.out.println("++++++++++++++++++++---------------------------" + auction1);
//            BeanUtils.copyProperties(next, auction);
//            //BeanUtils.copyProperties(auctionAmidmentKeyDates1, auction);
//        }
//        if (!auctionStatusdata.equalsIgnoreCase("Amendment")) {
//            auction = auctionDaoImpl.editAuctionData(auctionId);
//            auctionKeyDates = auctionDaoImpl.auctionKeyDatesFetchId(auction.getAuctionId());
//            auction.setAuctionPurchaseDateTime(auctionKeyDates.getAuctionPurchaseDateTime());
//            System.out.println("(((((((((((((((((((((((%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
//            auction.setAuctionBiddingDateTime(auctionKeyDates.getAuctionBiddingDateTime());
//            auction.setDocumentSubmissionDateTime(auctionKeyDates.getDocumentSubmissionDateTime());
//        }
//        List<DocumentAuction> auctionDocument = (List<DocumentAuction>) auctionDaoImpl.fetchTenderDocumentByAuctionId(auction.getAuctionId());
//        List<InventoryDocument> auctionDocument1 = (List<InventoryDocument>) auctionDaoImpl.fetchAmidmentDocumentByAuctionId(auction.getAuctionId());
//        for (DocumentAuction a : auctionDocument) {
//            String Name = a.getDoc_Name();
//            auction.setDoc_Name(Name);
//            String original_name = a.getDoc_OrignalName();
//            auction.setDoc_OrignalName(original_name);
//            String document_Path = a.getDoc_path();
//            auction.setDoc_path(document_Path);
//            System.out.println("document Name  " + Name);
//            System.out.println("original_name " + original_name);
//            System.out.println("document_Path  " + document_Path);
//        }
//        for (InventoryDocument a : auctionDocument1) {
//            String Name = a.getDoc_Name();
//            auction.setDoc_Name(Name);
//            String original_name = a.getDoc_OrignalName();
//            auction.setDoc_OrignalName(original_name);
//            String document_Path = a.getDoc_path();
//            auction.setDoc_path(document_Path);
//            System.out.println("document Name  " + Name);
//            System.out.println("original_name " + original_name);
//            System.out.println("document_Path  " + document_Path);
//        }
//        List<AssetDetails> assetDetails = (List<AssetDetails>) auctionDaoImpl.itemDetailsFetchIdLiist(auction.getAuctionId());
//        for (AssetDetails itemDetails : assetDetails) {
//            int categoryname = itemDetails.getAssetcId();
//            auction.setAssetcId(categoryname);
//            int subcategoryname = itemDetails.getAsset_sid();
//            auction.setAsset_sid(subcategoryname);
//            String description = itemDetails.getBriefDescription();
//            auction.setBriefDescription(description);
//            Integer reversePrice = itemDetails.getReversePrice();
//            auction.setReversePrice(reversePrice);
//            String startValue = itemDetails.getAuctionStartValue();
//            auction.setAuctionStartValue(startValue);
//            System.out.println("categoryname" + categoryname);
//            System.out.println("subcategoryname " + subcategoryname);
//            System.out.println("description  " + description);
//            System.out.println("reversePrice  " + reversePrice);
//            System.out.println("startValue  " + startValue);
//        }
//        m.addAttribute("assetDetails", assetDetails);
//        m.addAttribute("auction", auction);
//        m.addAttribute("auctionDocument", auctionDocument);
//        m.addAttribute("auctionDocument1", auctionDocument1);
//        System.out.println("*******************END****************************************");
//        return new ModelAndView("/DepartmentUser/ViewCreateAuctionAmmedment", "auction", auction);
//    }
////*****************end******************************************************
//
//    @RequestMapping("/saveDynamicTemplate")
//    public String saveDynamicTemplate(@ModelAttribute DynamicTemplatePojo dynamicTemplatePojo, @RequestParam String name, String address, Integer sequenceIdA, Integer dynamicId, Integer auctionEnvelopeNameId, HttpSession session, Model m,
//            RedirectAttributes ra) throws IOException {
//        dynamicTemplatePojo.setDynamicId(dynamicId);
//        Integer auctionEnvelopeNameIdss = (Integer) session.getAttribute("auctionEnvelopeNameId");
//        System.out.println("my auctionEnvelopeNameId is :" + auctionEnvelopeNameIdss);
//        Integer auctionIds = (Integer) session.getAttribute("auctionId");
//        System.out.println("@@@@@@@my auctionId@@@@@@@@@@@" + auctionIds);
//        dynamicTemplatePojo.setAuctionId(auctionIds);
//        System.out.println("my auctionId is:" + auctionIds);
//        dynamicTemplatePojo.setName(name);
//        dynamicTemplatePojo.setAddress(address);
//        dynamicTemplatePojo.setSequenceIdA(sequenceIdA);
//        System.out.println("my auctionEnvelopeNameId  is  :" + dynamicTemplatePojo.getAuctionEnvelopeNameId());
//        System.out.println("my dynamic Id is  :" + dynamicTemplatePojo.getDynamicId());
//        System.out.println("The field is: " + dynamicTemplatePojo.getName());
//        System.out.println("The field is: " + dynamicTemplatePojo.getAddress());
//        System.out.println("gdfggdfgdfgd" + dynamicTemplatePojo.getSequenceIdA());
//        System.out.println("The field is: " + dynamicTemplatePojo.getDynamicId());
//        String s = dynamicTemplatePojo.getName();
//        String s2 = dynamicTemplatePojo.getAddress();
//        Integer s4 = dynamicTemplatePojo.getSequenceIdA();
//        String s1[] = s.split(",");
//        String s3[] = s2.split(",");
//        int count = 1;
//        for (int i = 0; i < s1.length; i++) {
//            DynamicTemplatePojo t = new DynamicTemplatePojo();
//            t.setName(s1[i]);
//            t.setAddress(s3[i]);
//            t.setSequenceIdA(count);
//            t.setAuctionEnvelopeNameId(auctionEnvelopeNameIdss);
//            t.setAuctionId(auctionIds);
//            auctionDaoImpl.insertData(t);
//            ra.addFlashAttribute("msg", "Auction Data Save Successfully");
//            dynamicTemplatePojo.setDynamicId(t.getDynamicId());
//            dynamicTemplatePojo.setSequenceIdA(t.getSequenceIdA());
//            System.out.println("my dynmic id m  " + dynamicTemplatePojo.getDynamicId());
//            System.out.println("dfgdfgdgdfgdf" + dynamicTemplatePojo.getSequenceIdA());
//            count++;
//        }
//        System.out.println("my auctionEnvelopeNameId  is data  :" + auctionEnvelopeNameIdss);
//        System.out.println("fsdfsfdsfdsfs" + dynamicTemplatePojo.getSequenceIdA());
//        Gson gson = new Gson();
//        String response = gson.toJson(auctionEnvelopeNameIdss);
//        gsonUtility.writeData(response);
//        m.addAttribute("dynamicTemplatePojo", dynamicTemplatePojo);
//        System.out.println("hjghljf.............");
//        return null;
//    }
//
//    //*******************************************SHOW THE ASSET LIST BY ID DATA*****************************************************
///*  fetchAssetInvnetoryDetailsById Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    @RequestMapping("/fetchDynamicData")
//    @ResponseBody
//    public String fetchDynamicData(@RequestParam Integer auctionEnvelopeNameId, Model m, HttpSession session) {
//        String response = "auctionEnvelopeNameIddata";
//        System.out.println("auctionEnvelopeNameId is :" + auctionEnvelopeNameId);
//        List<DynamicTemplatePojo> dynamicTemplatePojoList = null;
//        try {
//            DynamicTemplatePojo dynamicTemplatePojo = null;
//            //Integer auctionEnvelopeNameIds=(Integer) session.getAttribute("auctionEnvelopeNameId");
//            dynamicTemplatePojoList = auctionDaoImpl.dynamicTemplatePojoListDao(auctionEnvelopeNameId);
//            System.out.println("rrrrrrrrrrrrrr" + auctionEnvelopeNameId);
//            System.out.println("auctionEnvelopeName Details  Data" + dynamicTemplatePojoList.size());
//            Gson gson = new Gson();
//            writeData(gson.toJson(dynamicTemplatePojoList));
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("my error code" + e);
//        }
//        System.out.println("My data is successfully show" + response);
//        return null;
//    }
////*********************************************** FOr AssetInvnetory LIST BY ID Data End *********************************************       
////*******************Create Auction KeyDates****************************************************
///*  saveAuctionKeyDates Controller
//     *  @author Prashant Shukla
//     *  @Since 13-08-2018
//     *  @Version 2.0.0
//     */
//    
//    @RequestMapping("/saveAuctionEnvelpeName")
//    public String saveAuctionEnvelpeName(@ModelAttribute AuctionEnvelopeNameDynamic auctionEnvelopeNameDynamic, @RequestParam Integer auctionEnvelopeNameId, Model m, HttpSession session) {
//        try {
//            System.out.println("*******************insert the  data in Controller****************************************");
//            Integer auctionIds = (Integer) session.getAttribute("auctionId");
//            System.out.println("@@@@@@@my auctionId@@@@@@@@@@@" + auctionIds);
//            auctionDaoImpl.saveAuctionEnvelopeDynamic(auctionEnvelopeNameDynamic);
//            auctionEnvelopeNameId = auctionEnvelopeNameDynamic.getAuctionEnvelopeNameId();
//            System.out.println("My Id" + auctionEnvelopeNameId);
//            session.setAttribute("auctionEnvelopeNameId", auctionEnvelopeNameId);
//            System.out.println("My getId is auctionEnvelopeNameId:" + auctionEnvelopeNameId);
//            m.addAttribute("auctionEnvelopeNameDynamic", new AuctionEnvelopeNameDynamic());
//            System.out.println("*******************----------------END--------------****************************************");
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("my error code is:" + e);
//        }
//        return "AuctionCreationWizard";
//    }
////*********************************************** FOr AssetInvnetory LIST BY ID Data End *********************************************       
///*
//     * tenderStatusManaging
//     * Managing the tender status through this method
//     * @param tenderStatus, tender_Id
//     * @return redirect on other method
//     * @created 18 Aug 2018
//     */
//    
//    @RequestMapping("/auctionStatusManaging/{auctionStatus}/{auctionId}")
//    public String auctionStatusManaging(@PathVariable("auctionStatus") String auctionStatus, @PathVariable("auctionId") int auctionId) {
//        System.out.println("/::::::::::::::::::::::::::::::::::::::Auction Status Managing::::::::::::::::::::::/");
//        System.out.println("The Auction Status is: " + auctionStatus + " \n Auction Id: " + auctionId);
//        try {
//            auctionDaoImpl.auctionStatusCreate(auctionStatus, auctionId);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return "redirect:/auctionProcess";
//    }
//
//    //------------------- update Amidment page--------------------------------
//    @RequestMapping(value = "/AuctionAmendmentUpdate")
//    public String inventoryupdate(@ModelAttribute("auction") Auction auction, RedirectAttributes ra) {
//        System.out.println("update Method in DepartmentController is called successfully" + auction.getAuctionId());
//        ra.addFlashAttribute("msg", "department updated Successfully");
//        auctionDaoImpl.updateAmedmentAuction(auction);
//        System.out.println("updateCircle Method in DepartmentController is end successfully");
//        return "redirect:/ViewCreateAuction";
//    }
//    
//    @RequestMapping("/saveAuctionAmidment")
//    public String saveAuctionAmidment(@ModelAttribute AuctionAmidemntDescription auctionAmidemntDescription, AuctionAmidmentKeyDates auctionAmidmentKeyDates, @RequestParam Integer auctionamidmentId, Integer keyAmidmentId, Model m, HttpSession session) {
//        try {
//            Integer auctionID = (Integer) session.getAttribute("auctionId");
//            System.out.println("my Id is:" + auctionID);
//            System.out.println("*******************insert the  data in Controller****************************************");
//            // auctionDaoImpl.saveAuctionAmidment(auctionAmidemntDescription);
//            //System.out.println("*******************----------------END--------------****************************************");
//            keyAmidmentId = auctionAmidmentKeyDates.getAuctionamidmentId();
//            System.out.println("My Id" + keyAmidmentId);
//            //auctionDaoImpl.saveAmidmentKeyDates(auctionAmidmentKeyDates);
//            Integer auctionamidmentIds = (Integer) session.getAttribute("auctionamidmentId");
//            auctionAmidemntDescription.setAuctionamidmentId(auctionamidmentId);
//            System.out.println("auctionamidmentId" + auctionamidmentId);
//            keyAmidmentId = auctionAmidmentKeyDates.getAuctionamidmentId();
//            System.out.println("My Id" + keyAmidmentId);
//
////        session.setAttribute("auctionAmidmentKeyDates", auctionAmidmentKeyDates);
////           System.out.println("my data" +session.getAttribute("auctionAmidmentKeyDates"));
//            System.out.println("my keydates is" + auctionAmidmentKeyDates.getAuctionPurchaseDateTime());
//            System.out.println("*******************END****************************************");
//            m.addAttribute("auction", auctionAmidmentKeyDates);
//            m.addAttribute("auction", auctionAmidemntDescription);
//            return "/DepartmentUser/ViewCreateAuctionAmmedment";
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("my error code is:" + e);
//        }
//        return "/DepartmentUser/ViewCreateAuctionAmmedment";
//    }
//    
//    @RequestMapping("/saveAuctionAmidmentData")
//    public String saveAuctionAmidmentData(@ModelAttribute AuctionAmidemntDescription auctionAmidemntDescription, AuctionAmidmentKeyDates auctionAmidmentKeyDates, @RequestParam Integer auctionId, Integer keyAmidmentId, Model m, HttpSession session) {
//        try {
//            System.out.println("*******************insert the  data in Controller****************************************");
//            Integer auctionIds = (Integer) session.getAttribute("auctionId");
//            auctionAmidemntDescription.setAuctionId(auctionIds);
//            auctionDaoImpl.saveAuctionAmidment(auctionAmidemntDescription);
//            System.out.println("my idssss" + auctionAmidemntDescription.getAuctionamidmentId());
//            Integer ids = auctionAmidemntDescription.getAuctionamidmentId();
//            System.out.println("*******************----------------END--------------****************************************");
//            keyAmidmentId = auctionAmidmentKeyDates.getAuctionamidmentId();
//            System.out.println("My Id" + keyAmidmentId);
//            auctionAmidmentKeyDates.setAuctionamidmentId(ids);
//            System.out.println("my AMidemnt Id is:::::::::::::::" + ids);
//            auctionDaoImpl.saveAmidmentKeyDates(auctionAmidmentKeyDates);
//            keyAmidmentId = auctionAmidmentKeyDates.getAuctionamidmentId();
//            m.addAttribute("auctionAmidemntDescription", auctionAmidemntDescription);
//            m.addAttribute("auction AmidmentKeyDates", auctionAmidmentKeyDates);
//            System.out.println("my keydates is" + auctionAmidmentKeyDates.getAuctionPurchaseDateTime());
//            System.out.println("*******************END****************************************");
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("my error code is:" + e);
//        }
//        return "redirect:viewAmedmentAuction";
//    }
//    /*
//     * generateAuctionNumber
//     * create the new auction number before the auction creation process is start
//     * @param null
//     * @Created 10 Oct 2018
//     * @version 2.0.0
//     */
//    
//    @RequestMapping("/generateAuctionNumber")
//    @ResponseBody
//    public String generateAuctionNumber(HttpSession session, DepartmentAdmin departmentAdmin) {
//        System.out.println("/:::::::::::::::::::::::::::::::Generating the New Auction Number::::::::::::::::::::::/");
//        String newAuctionNumber = null;
//        String newVersion = null;
//        int length = 10;
//        int lastAuctionNumberGen = 0;
//        List<String> auctionnumber = new ArrayList<>();
//        try {
//            Integer deptId = 0;
//            deptId = (Integer) session.getAttribute("deptId");
//            System.out.println("The Department Admin Id: " + deptId);
//            //generatedTenderNumber = (String) UUID.randomUUID().toString().subSequence(0, length);
//            if (deptId != 0) {
//                auctionnumber = auctionDaoImpl.readAllauctionNo(deptId);
//                System.out.println("my Department data is:" + auctionnumber);
//            }
//            if (auctionnumber.isEmpty()) {
//                if (deptId != 0) {
//                    departmentAdmin = departmentAdminDAO.fetchData(deptId);
//                }
//                System.out.println("The Auction Prefix is: " + departmentAdmin.getAuctionPrefix());
//                System.out.println("The Tender Starting No.: " + departmentAdmin.getAuctionStartingNo());
//                newVersion = departmentAdmin.getAuctionPrefix() + "/" + departmentAdmin.getAuctionStartingNo();
//                System.out.println("The New Generated Auction Number: " + newVersion);
//            } else {
//                String auctioningNum = null;
//                System.out.println("The Auction List is: " + auctionnumber.size());
//                for (String auctionSq : auctionnumber) {
//                    System.out.println("The Auction Number is: " + auctionSq);
//                    auctioningNum = auctionSq;
//                }
//                System.out.println("The last auction Number is: " + auctioningNum);
//                String[] splittingNumber = auctioningNum.split("/");
//                int increasingSequnceBy = Integer.parseInt(splittingNumber[1]) + 1;
//                newAuctionNumber = splittingNumber[0] + "/" + String.valueOf(increasingSequnceBy);
//                System.out.println("Before Sending Auction Number: " + newAuctionNumber);
//                newVersion = newAuctionNumber;
//            }
//            gsonUtility.writeData(newVersion);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
}
