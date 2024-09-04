package com.eproc.daoImpl;

import com.eproc.dao.AuctionDao;
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
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/*
 *  This DaoImpl AuctionDaoImpl and AssetAuctionDaoImpl Method
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */

@Repository
public class AuctionDaoImpl implements AuctionDao {

    @Autowired
    AddToCartDaoImpl addToCartDaoImpl;

    @Autowired
    SessionFactory sessionFactory;
    Auction auction;
    Inventory inventory;

//*********************insert auction Data the data******************************************************************************
    @Override
    public void saveAuction(Auction auction) {
        System.out.println("*******************Save Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        System.out.println("inside dqao auctoin notice is : " + auction.getAuctionNotice());
        Transaction txn = session.beginTransaction();
        session.saveOrUpdate(auction);
        txn.commit();
        session.close();
        System.out.println("*******************END****************************************");
    }
//*********************END***********************************************************************************************************
    //*********************insert auction Data the data******************************************************************************

    @Override
    public String saveAuctionKeyDates(AuctionKeyDates auctionKeyDates) {
        System.out.println("*******************Save auctionKeyDates Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        System.out.println("inside dqao  is : " + auctionKeyDates.getAuctionBiddingDateTime());
        Transaction txn = session.beginTransaction();
        session.saveOrUpdate(auctionKeyDates);
        txn.commit();
        session.close();
        System.out.println("*******************END****************************************");
        return null;
    }

    //************************************END****************************************************************************************
    //*********************insert auction Data the data******************************************************************************
    @Override
    public Integer saveAuctionEnvelopeDynamic(AuctionEnvelopeNameDynamic auctionEnvelopeNameDynamic) {
        System.out.println("*******************Save auctionEnvelopeNameDynamic Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        System.out.println("inside dqao  is : " + auctionEnvelopeNameDynamic.getAuctionEnvelope_name());
        Transaction txn = session.beginTransaction();
        session.saveOrUpdate(auctionEnvelopeNameDynamic);
        System.out.println("auction dynamicEnvelope Id" + auctionEnvelopeNameDynamic.getAuctionEnvelopeNameId());
        txn.commit();
        session.close();
        System.out.println("*******************END****************************************");
        return null;
    }

    //************************************END****************************************************************************************
    @Override
    public AuctionKeyDates saveAuctionKeyDatesList(int keyId) {
        List<AuctionKeyDates> auctionKeyDates = new ArrayList();
        AuctionKeyDates auctionKeyDates1 = new AuctionKeyDates();
        Session session = sessionFactory.openSession();
        try {
            System.out.println("AuctionDaoImpl ghjthjghjhg " + keyId);
            Query query = session.createQuery("FROM AuctionKeyDates where auctionId =:auctionId");
            query.setParameter("auctionId", keyId);
            auctionKeyDates = query.list();
            System.out.println("My List fporm data kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk  " + auctionKeyDates.size());
            for (AuctionKeyDates auctionKeyDate : auctionKeyDates) {
                auctionKeyDates1 = auctionKeyDate;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return auctionKeyDates1;
    }
    //*********************END***********************************************************************************************************
    //*********************-----------------auctionKeyDatesFetchId------------------***********************************************************************************************************

    @Override
    public AuctionKeyDates auctionKeyDatesFetchId(int keyId) {
        AuctionKeyDates auctionKeyDates = new AuctionKeyDates();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM AuctionKeyDates where auctionId =:auctionId");
            query.setParameter("auctionId", keyId);
            auctionKeyDates = (AuctionKeyDates) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return auctionKeyDates;
    }
//*********************END***********************************************************************************************************

    @Override
    public List<Inventory> showList() {
        System.out.println("*******************Show List Inventry Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Inventory");//here persistent class name is Inventry  
        List list = query.list();
        System.out.println("*******************END****************************************");
        return list;
    }

    @Override
    public List<CloudFolder> cloudFolderList() {
        System.out.println("*******************Show List CloudFolder Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from CloudFolder");//here persistent class name is CloudFolder  
        List list = query.list();
        System.out.println("*******************END****************************************");
        return list;
    }

    @Override
    public List<CloudFile> cloudFileList() {
        System.out.println("*******************Show List CloudFile Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from CloudFile");//here persistent class name is CloudFolder  
        List list = query.list();
        System.out.println("*******************END****************************************");
        return list;
    }

//********************************************DocumentAuctionImage**************************************
    @Override
    public void saveAuction(DocumentAuction tenderDocument) {
        Session session = null;
        try {
            System.out.println("/********************************************DocumentAuctionImage**************************************");
            session = sessionFactory.openSession();
            System.out.println("session is opened");
            // Transaction txn = session.beginTransaction();
            session.saveOrUpdate(tenderDocument);
            System.out.println("Save auction Document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
                System.out.println("session is closed");
                System.out.println("/********************************************End**************************************");
            }
        }
    }

//********************************************End*******************************************************************************
    //*********************insert the data************************
    @Override
    public String saveAddAsset(AssetDetails assetDetails) {
        System.out.println("*******************Save Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        System.out.println("inside dqao  is : " + assetDetails.getAsset_id());
        Transaction txn = session.beginTransaction();
        session.saveOrUpdate(assetDetails);
        txn.commit();
        session.close();
        System.out.println("*******************END****************************************");
        return null;
    }

    //***********************************Save fileUploading Data In DAOIMP****************************************************
    @Override
    public void saveAssetFile(AssetDocument tenderDocument) {
        Session session = null;
        try {
            System.out.println("********************************************Document Asset Image**************************************");
            session = sessionFactory.openSession();
            System.out.println("session is opened");
            // Transaction txn = session.beginTransaction();
            session.saveOrUpdate(tenderDocument);
            System.out.println("Save asset Document");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
                System.out.println("session is closed");
                System.out.println("********************************************End**************************************");
            }
        }
    }

    @Override
    public String saveAssetCategory(Asset_Category assetcategory) {
        System.out.println("*******************Save Category Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        session.save(assetcategory);
        session.close();
        System.out.println("*******************END****************************************");

        return null;
    }

    @Override
    public String saveAssetSubcategory(Asset_Subcategory assetsubcategory) {
        System.out.println("*******************Save SubCategory Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        session.save(assetsubcategory);
        session.close();
        System.out.println("*******************END****************************************");
        return null;
    }
    //******************************Delete Data************************************

    @Override
    public void deleteNewItem(Integer asset_id) {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("DELETE FROM AssetDetails WHERE asset_id =:asset_id");
        query.setParameter("asset_id", asset_id);
        query.executeUpdate();
        session.close();
    }
//******************end***************************************************

    @Override
    public List<Asset_Category> fetchAllAssetCategory() {
        System.out.println("*******************List in Dropdown Asset category Data In DAOIMP****************************************");
        List<Asset_Category> assetcategoryList = new ArrayList<Asset_Category>();
        Session session = sessionFactory.openSession();
        assetcategoryList = session.createQuery("FROM Asset_Category").list();
        System.out.println("");
        session.close();
        System.out.println("*******************END****************************************");
        return assetcategoryList;
    }

    @Override
    public List<AuctionEnvelopeNameDynamic> fetchAllAuctionEnvelopeNameDynamic() {
        System.out.println("*******************List in Dropdown AuctionEnvelopeNameDynamic Data In DAOIMP****************************************");
        List<AuctionEnvelopeNameDynamic> auctionEnvelopeNameDynamicList = new ArrayList<AuctionEnvelopeNameDynamic>();
        Session session = sessionFactory.openSession();
        auctionEnvelopeNameDynamicList = session.createQuery("FROM AuctionEnvelopeNameDynamic").list();
        System.out.println("");
        session.close();
        System.out.println("*******************END****************************************");
        return auctionEnvelopeNameDynamicList;
    }

    @Override
    public Asset_Category fetchByIDAssetCategory(int assetcId) {
        Asset_Category asset_Category = new Asset_Category();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Asset_Category where assetcId =:assetcId");
            query.setParameter("assetcId", assetcId);
            asset_Category = (Asset_Category) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return asset_Category;
    }

    @Override
    public AuctionEnvelopeNameDynamic fetchByIDdynamicTemplateName(Integer auctionEnvelopeNameId) {
        AuctionEnvelopeNameDynamic auctionEnvelopeNameDynamic = new AuctionEnvelopeNameDynamic();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM AuctionEnvelopeNameDynamic where auctionEnvelopeNameId =:auctionEnvelopeNameId");
            query.setParameter("auctionEnvelopeNameId", auctionEnvelopeNameId);
            auctionEnvelopeNameDynamic = (AuctionEnvelopeNameDynamic) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return auctionEnvelopeNameDynamic;
    }

    @Override
    public List<Asset_Subcategory> fetchAllSubCategoryAsset() {
        System.out.println("*******************List in Asset_Subcategory Data In DAOIMP****************************************");
        List<Asset_Subcategory> assetsubcategoryList = new ArrayList<Asset_Subcategory>();
        Session session = sessionFactory.openSession();
        assetsubcategoryList = session.createQuery("FROM Asset_Subcategory").list();
        System.out.println("");
        session.close();
        System.out.println("*******************END****************************************");
        return assetsubcategoryList;
    }

    @Override
    public Asset_Subcategory fetchByIDAssetSubCategory(int asset_sid) {
        Asset_Subcategory asset_Subcategory = new Asset_Subcategory();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Asset_Subcategory where asset_sid =:asset_sid");
            query.setParameter("asset_sid", asset_sid);
            asset_Subcategory = (Asset_Subcategory) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return asset_Subcategory;
    }

    @Override
    public AssetDetails fetchById(int asset_id) {
        AssetDetails assetDetails = new AssetDetails();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM AssetDetails where asset_id =:asset_id");
            query.setParameter("asset_id", asset_id);
            assetDetails = (AssetDetails) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return assetDetails;
    }

    @Override
    public DocumentAuction fetchAuctiondocumentId(Integer fileId) {
        DocumentAuction auctionDocument = new DocumentAuction();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM DocumentAuction where auctionId =:auctionId");
            //System.out.println("my data is document:" +auctionDocument.getAuctionId());
            query.setParameter("auctionId", fileId);
            auctionDocument = (DocumentAuction) query.uniqueResult();
            System.out.println("aggsggdsg" + auctionDocument);
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return auctionDocument;
    }

    @Override
    public List<DocumentAuction> fetchAuctiondocumentIddata(Integer fileId) {
        List<DocumentAuction> auctionDocument = null;
        try {
            System.out.println("*******************EDIT auctionDocument Data In DAOIMP****************************************");
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Document where auctionId =:auctionId");//here persistent class name is Inventry  
            query.setParameter("auctionId", fileId);
            auctionDocument = query.list();
            //session.close();
            System.out.println("*******************END****************************************" + auctionDocument.size());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gdgdf" + e);
        }
        return auctionDocument;
    }

    @Override
    public Auction getCopyAuction(String auctionnumber) {
        System.out.println("*******************EDIT Auction Data In DAOIMP****************************************" + auctionnumber);
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Auction where auctionnumber=:auctionnumber");
        query.setParameter("auctionnumber", auctionnumber);
        Auction auction = (Auction) query.uniqueResult();
        System.out.println("my auction number fetch data " + auction);
        // auction.setAuctionKeyDates(auction.getAuctionKeyDates());
        session.close();
        System.out.println("*******************END****************************************");
        return auction;
    }

    @Override
    public Auction editAuctionData(int auctionId) {
        System.out.println("*******************EDIT Auction Data In DAOIMP*********************************");
        Auction auctionData = null;
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Auction where auctionId=:auctionId");
        query.setParameter("auctionId", auctionId);
        auctionData = (Auction) query.uniqueResult();
        session.close();
        System.out.println("*******************END****************************************");
        return auctionData;
    }

    @Override
    public List<AssetDetails> showListInventoryAsset() {
        System.out.println("*******************Show List InventryAsset Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from AssetDetails");//here persistent class name is Inventry  
        List assetInventorylist = query.list();
        System.out.println("*******************END****************************************");
        return assetInventorylist;
    }
//    *****************************SHOW ASSETLIST BY ID******************************************

    @Override
    public List<AssetDetails> assetDetailsFetchIdLiist(int asset_id) {
        List<AssetDetails> assetDetails = null;
        try {
            System.out.println("*******************Fetch assetDetailsFetchIdLiist Data In DAOIMP****************************************");
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from AssetDetails where asset_id = :asset_id");//here persistent class name is Inventry  
            query.setParameter("asset_id", asset_id);
            assetDetails = query.list();
            session.close();
            System.out.println("*******************END****************************************" + assetDetails.size());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gdgdf" + e);
        }
        return assetDetails;
    }
//    *************************************END******************************************************************************
    //    *****************************SHOW ASSETLIST BY ID******************************************

    public List<Inventory> assetDetailsFetchIdLiist1(int id) {
        List<Inventory> inventoryList = null;
        try {
            System.out.println("*******************Fetch assetDetailsFetchIdLiist Data In DAOIMP****************************************");
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from Inventory where id = :id");//here persistent class name is Inventry  
            query.setParameter("id", id);
            inventoryList = query.list();
            session.close();
            System.out.println("*******************END****************************************" + inventoryList.size());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gdgdf" + e);
        }
        return inventoryList;
    }

    public List<DynamicTemplatePojo> dynamicTemplatePojoListDao(Integer auctionEnvelopeNameId) {
        List<DynamicTemplatePojo> dynamicTemplatePojoList = null;
        try {
            System.out.println("*******************Fetch assetDetailsFetchIdLiist Data In DAOIMP****************************************");
            Session session = sessionFactory.openSession();
            System.out.println("my id data is dao" + auctionEnvelopeNameId);
            Query query = session.createQuery("from DynamicTemplatePojo where auctionEnvelopeNameId =:auctionEnvelopeNameId");//here persistent class name is Inventry  
            query.setParameter("auctionEnvelopeNameId", auctionEnvelopeNameId);
            dynamicTemplatePojoList = query.list();
            // System.out.println("gdugghadgdgd" +dynamicTemplatePojoList);
            //session.close();
            System.out.println("*******************END****************************************" + dynamicTemplatePojoList.size());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gdgdf" + e);
        }
        return dynamicTemplatePojoList;
    }

    //*******************Auction Show List*************************************************
    @Override
    public List<Auction> showAuctionList() {
        System.out.println("*******************Show Auction List Data In DAOIMP****************************************");
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Auction");//here persistent class name is Inventry  
//        SELECT auctionkeydates.keyId, auctionkeydates.DateTime
//FROM auctionkeydates
//INNER JOIN auctiontable
//ON auctionkeydates.auctionId=auctiontable.auctionId;
        List auctionList = query.list();
        System.out.println("*******************END****************************************");
        return auctionList;
    }

    //***********************End***************************************************
    @Override
    public Category fetchByIDInventoryCategory(int cid) {
        Category inventoryCategory = new Category();
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("FROM Category where cid =:cid");
            query.setParameter("cid", cid);
            inventoryCategory = (Category) query.uniqueResult();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            session.close();
        }
        return inventoryCategory;
    }

    @Override
    public Subcategory fetchByIDInventorySubCategory(int sid) {
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^subcateogry^^^^^^^^^^^^^^");
        Subcategory inventorySubcategory = new Subcategory();
        Session session = sessionFactory.openSession();
        System.out.println("my Session data****************** :" + inventorySubcategory.getSid());
        try {
            Query query = session.createQuery("FROM Subcategory where sid =:sid");
            query.setParameter("sid", sid);
            inventorySubcategory = (Subcategory) query.uniqueResult();
            System.out.println("my subcategory name" + inventorySubcategory.getSubcategoryname());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventorySubcategory;
    }
//    **********************--------------------Fetch All Auction Data--------------------******************************
/* This method is used to fetch department details by department Id.
     *
     * @Param auctionId.
     *
     * @return Department class object. 
     */

    @Override
    public Auction fetchAllDataAuction(int auctionId) {
        System.out.println("----------------Method call to fetch data by auctionpojo id  in DepartmentDaoImpl----------------");
        Auction auctionpojo = new Auction();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Auction WHERE auctionId =:auctionId");
            query.setParameter("auctionId", auctionId);
            auctionpojo = (Auction) query.uniqueResult();
        } catch (Exception ex) {
            System.out.print("Exception in fetch auctionpojo " + ex.getMessage());
        } finally {
            session.close();
        }
        System.out.println("----------------Method end to fetch data by auctionpojo id  in DepartmentDaoImpl----------------");
        return auctionpojo;
    }

    @Override
    public List getDuplicateAuction(Auction auction) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String auctionnumber = auction.getAuctionnumber();
        return session.createCriteria(Auction.class).add(Restrictions.eq("auctionnumber", auctionnumber)).list();
    }

    @Override
    public String updateTenderDocumentStatus(int auctionId, Integer auctiondocumentVisibility, Integer addMoreButton) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Document SET auctiondocumentVisibility =:auctiondocumentVisibility WHERE auctionId =:auctionId AND addMoreButton =:addMoreButton");
            query.setParameter("auctionId", auctionId);
            query.setParameter("auctiondocumentVisibility", auctiondocumentVisibility);
            query.setParameter("addMoreButton", addMoreButton);
            query.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return null;
    }
//    @Override
//public List readAlltenderNo(Integer deptName) throws Exception {
//       Session session=sessionFactory.openSession(); 
//        List <String>tender = new ArrayList<>();
////        List<String> tenderNumber = new ArrayList<>();
////        Map tendernumber=new HashMap();
//        
//        try{
//            
//                session = sessionFactory.openSession();     
//                String hql = "SELECT E.tenderNumber FROM Tender E where deptId=eptId";
//                Query query = session.createQuery(hql);
//                query.setParameter("deptId", deptName);
//                    tender = query.list();
//            System.out.println("The Tender Object are: "+tender);
//        }catch(Exception ex){
//            ex.printStackTrace();
//        }
//     return tender;
//    }

    @Override
    public boolean insertData(DynamicTemplatePojo dynamicTemplatePojo) {
        System.out.print(" call insertData method to save data of the database ");
        Session session = sessionFactory.openSession();
        Transaction txn = session.beginTransaction();
        session.saveOrUpdate(dynamicTemplatePojo);
        System.out.println("my sequenceId Is :" + dynamicTemplatePojo.getSequenceIdA());
        txn.commit();
        session.close();
        return true;
    }

    @Override
    public String auctionStatusCreate(String auctionStatus, int auctionId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("UPDATE Auction SET auctionStatus =:auctionStatus WHERE auctionId=:auctionId");
            query.setParameter("auctionStatus", auctionStatus);
            query.setParameter("auctionId", auctionId);
            query.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Auction> fetchAuctionStatus(String Approved, String Amended) {
        Session session = null;
        List<Auction> auctionList = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM Auction WHERE auctionStatus=:Approved or auctionStatus=:Amended");
            query.setParameter("Approved", Approved);
            query.setParameter("Amended", Amended);
            auctionList = query.list();
            System.out.println("auctionList impl " + auctionList);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return auctionList;
    }

    @Override
    public AuctionKeyDates readAuctionKeyDate(int auctionId) throws Exception {
        AuctionKeyDates auctionKeyDateses = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery("FROM AuctionKeyDates WHERE auctionId =:auctionId");
            query.setParameter("auctionId", auctionId);
            auctionKeyDateses = (AuctionKeyDates) query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return auctionKeyDateses;
    }

    @Override
    public List searchAucLive(String deptName) {
        System.out.println("deptName  " + deptName);
        Session session = null;
        String str1 = "Approved", str2 = "Amended";
        List combinedList = new ArrayList();
        List<Auction> allAuctionList = new ArrayList();
        try {
            session = sessionFactory.openSession();
            List<Auction> auctionList2 = this.fetchAuctionStatus(str1, str2);
            System.out.println("auctionList2  " + auctionList2);
            List<Auction> auctionList = addToCartDaoImpl.liveAuctionList(auctionList2);
            System.out.println("auctionList  " + auctionList);
            for (Auction auctionListData : auctionList) {
                System.out.println(" deptName auctionList  " + auctionListData.getDeptName());
                System.out.println(deptName.equals(auctionListData.getDeptName()));
                if (deptName.equals(auctionListData.getDeptName())) {
                    allAuctionList.add(auctionListData);
                }
            }
            System.out.println(" All Auction List " + allAuctionList);
            combinedList.add(allAuctionList);
            System.out.println(" All combinedList List " + combinedList);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return combinedList;
    }

}
