
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
/*
 *  Asset_Category Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name = "assetcategory")
public class Asset_Category {
   @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "assetcId", unique = true, nullable = false)
    private int assetcId;
    private String asset_category_name; 

    public int getAssetcId() {
        return assetcId;
    }

    public void setAssetcId(int assetcId) {
        this.assetcId = assetcId;
    }

    public String getAsset_category_name() {
        return asset_category_name;
    }

    public void setAsset_category_name(String asset_category_name) {
        this.asset_category_name = asset_category_name;
    }
    
}
