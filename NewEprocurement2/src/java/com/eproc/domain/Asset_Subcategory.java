package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 *  Asset_Subcategory Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name="asset_subcategory")
public class Asset_Subcategory {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "asset_sid", unique = true, nullable = false)
    private int asset_sid;
    private String asset_subcategoryname;
    private int assetcId;

    public int getAsset_sid() {
        return asset_sid;
    }

    public void setAsset_sid(int asset_sid) {
        this.asset_sid = asset_sid;
    }

    public String getAsset_subcategoryname() {
        return asset_subcategoryname;
    }

    public void setAsset_subcategoryname(String asset_subcategoryname) {
        this.asset_subcategoryname = asset_subcategoryname;
    }

    public int getAssetcId() {
        return assetcId;
    }

    public void setAssetcId(int assetcId) {
        this.assetcId = assetcId;
    }
    
    
}
