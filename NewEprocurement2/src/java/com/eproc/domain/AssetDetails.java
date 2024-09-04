/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author PrashantShukla
 */
@Entity
@Table(name = "auctionassetdetails")
public class AssetDetails 
{
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "asset_id", unique = true, nullable = false)
 private Integer asset_id;
    @Column(name = "briefDescription")
     private String briefDescription;
@Column(name = "reversePrice")
    private Integer reversePrice;
@Column(name = "reversePrice_in_word")
    private String reversePrice_in_word;
@Column(name = "auctionStartValue")
    private String auctionStartValue;
@Column(name = "auctionStartValue_in_word")
    private String auctionStartValue_in_word; 
@Column(name = "emdStartValue")
    private Integer emdStartValue;
@Column(name = "emdStartValue_in_word")
    private String emdStartValue_in_word;
@Column(name = "assetcId")
private int assetcId;
@Column(name = "asset_sid")
private int asset_sid;
@Column(name = "extrapropertyItem")
 private String extrapropertyItem;
@Column(name = "extrapropertyItemvalue")
private String extrapropertyItemvalue;
@Column(name = "portalCharge")
 private String portalCharge;
@Column(name = "portalCharge_In_Word")
    private String portalCharge_In_Word;
@Column(name = "auctionId")
    private int auctionId;
@Transient
private String asset_category_name;
@Transient
private String asset_subcategoryname;

    public Integer getAsset_id() {
        return asset_id;
    }

    public void setAsset_id(Integer asset_id) {
        this.asset_id = asset_id;
    }

    public String getBriefDescription() {
        return briefDescription;
    }

    public void setBriefDescription(String briefDescription) {
        this.briefDescription = briefDescription;
    }

    public Integer getReversePrice() {
        return reversePrice;
    }

    public void setReversePrice(Integer reversePrice) {
        this.reversePrice = reversePrice;
    }

    public String getReversePrice_in_word() {
        return reversePrice_in_word;
    }

    public void setReversePrice_in_word(String reversePrice_in_word) {
        this.reversePrice_in_word = reversePrice_in_word;
    }

    public String getAuctionStartValue() {
        return auctionStartValue;
    }

    public void setAuctionStartValue(String auctionStartValue) {
        this.auctionStartValue = auctionStartValue;
    }

    public String getAuctionStartValue_in_word() {
        return auctionStartValue_in_word;
    }

    public void setAuctionStartValue_in_word(String auctionStartValue_in_word) {
        this.auctionStartValue_in_word = auctionStartValue_in_word;
    }

    public Integer getEmdStartValue() {
        return emdStartValue;
    }

    public void setEmdStartValue(Integer emdStartValue) {
        this.emdStartValue = emdStartValue;
    }

    public String getEmdStartValue_in_word() {
        return emdStartValue_in_word;
    }

    public void setEmdStartValue_in_word(String emdStartValue_in_word) {
        this.emdStartValue_in_word = emdStartValue_in_word;
    }

    public int getAssetcId() {
        return assetcId;
    }

    public void setAssetcId(int assetcId) {
        this.assetcId = assetcId;
    }

    public int getAsset_sid() {
        return asset_sid;
    }

    public void setAsset_sid(int asset_sid) {
        this.asset_sid = asset_sid;
    }

    public String getExtrapropertyItem() {
        return extrapropertyItem;
    }

    public void setExtrapropertyItem(String extrapropertyItem) {
        this.extrapropertyItem = extrapropertyItem;
    }

    public String getExtrapropertyItemvalue() {
        return extrapropertyItemvalue;
    }

    public void setExtrapropertyItemvalue(String extrapropertyItemvalue) {
        this.extrapropertyItemvalue = extrapropertyItemvalue;
    }

    public String getPortalCharge() {
        return portalCharge;
    }

    public void setPortalCharge(String portalCharge) {
        this.portalCharge = portalCharge;
    }

    public String getPortalCharge_In_Word() {
        return portalCharge_In_Word;
    }

    public void setPortalCharge_In_Word(String portalCharge_In_Word) {
        this.portalCharge_In_Word = portalCharge_In_Word;
    }

    public String getAsset_category_name() {
        return asset_category_name;
    }

    public void setAsset_category_name(String asset_category_name) {
        this.asset_category_name = asset_category_name;
    }

    public String getAsset_subcategoryname() {
        return asset_subcategoryname;
    }

    public void setAsset_subcategoryname(String asset_subcategoryname) {
        this.asset_subcategoryname = asset_subcategoryname;
    }

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }
}
