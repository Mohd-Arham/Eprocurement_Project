/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.AssetDetails;
import com.eproc.domain.AssetDocument;
import com.eproc.domain.Asset_Category;
import com.eproc.domain.Asset_Subcategory;
import com.eproc.domain.Auction;
import com.eproc.domain.AuctionEnvelopeNameDynamic;
import com.eproc.domain.AuctionKeyDates;
import com.eproc.domain.Category;
import com.eproc.domain.CloudFile;
import com.eproc.domain.CloudFolder;
import com.eproc.domain.DocumentAuction;
import com.eproc.domain.DynamicTemplatePojo;
import com.eproc.domain.Inventory;
import com.eproc.domain.Subcategory;
import com.eproc.domain.Tender;
import java.util.List;

/*
 *  This Dao AuctionDao and AssetAuctionDao Method
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
public interface AuctionDao {

    void saveAuction(Auction auction) throws Exception;

    String saveAuctionKeyDates(AuctionKeyDates auctionKeyDates);

    void saveAuction(DocumentAuction tenderDocument);

    List<Inventory> showList();

    String saveAddAsset(AssetDetails assetDetails);

    void saveAssetFile(AssetDocument tenderDocument);

    String saveAssetCategory(Asset_Category assetcategory);

    String saveAssetSubcategory(Asset_Subcategory assetsubcategory);

    List<Asset_Category> fetchAllAssetCategory();

    List<Asset_Subcategory> fetchAllSubCategoryAsset();

    AssetDetails fetchById(int asset_id);

    List<CloudFolder> cloudFolderList();

    List<CloudFile> cloudFileList();

    Auction getCopyAuction(String auctionnumber);

    AuctionKeyDates saveAuctionKeyDatesList(int keyId);

    List<AssetDetails> showListInventoryAsset();

    List<AssetDetails> assetDetailsFetchIdLiist(int asset_id);

    Asset_Category fetchByIDAssetCategory(int assetcId);

    List<Inventory> assetDetailsFetchIdLiist1(int id);

    List<Auction> showAuctionList();

    Category fetchByIDInventoryCategory(int cid);

    Subcategory fetchByIDInventorySubCategory(int sid);

    Auction editAuctionData(int auctionId);

    AuctionKeyDates auctionKeyDatesFetchId(int keyId);

    DocumentAuction fetchAuctiondocumentId(Integer fileId);

    Asset_Subcategory fetchByIDAssetSubCategory(int asset_sid);

    Auction fetchAllDataAuction(int auctionId);

    List getDuplicateAuction(Auction auction);

    String updateTenderDocumentStatus(int auctionId, Integer auctiondocumentVisibility, Integer fileId);

    boolean insertData(DynamicTemplatePojo dynamicTemplatePojo);

    List<DynamicTemplatePojo> dynamicTemplatePojoListDao(Integer id);

    Integer saveAuctionEnvelopeDynamic(AuctionEnvelopeNameDynamic auctionEnvelopeNameDynamic);

    AuctionEnvelopeNameDynamic fetchByIDdynamicTemplateName(Integer auctionEnvelopeNameId);

    List<AuctionEnvelopeNameDynamic> fetchAllAuctionEnvelopeNameDynamic();

    List<DocumentAuction> fetchAuctiondocumentIddata(Integer fileId);

    void deleteNewItem(Integer asset_id);
    
    String auctionStatusCreate(String auctionStatus, int auctionId);

    public List<Auction> fetchAuctionStatus(String Approved,String Amended);
    public AuctionKeyDates readAuctionKeyDate(int auctionId) throws Exception;
 public List searchAucLive(String deptName);
}
