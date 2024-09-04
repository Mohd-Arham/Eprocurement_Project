/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Windows7
 */

@Entity
@Table(name="socialcategory")
public class SocialCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    private int socialCategoryId;
    
    @Column(name = "categoryShortName")
    private String categoryShortName;

    @Column(name = "categoryName")
    private String categoryName;

    public int getSocialCategoryId() {
        return socialCategoryId;
    }

    public void setSocialCategoryId(int socialCategoryId) {
        this.socialCategoryId = socialCategoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryShortName() {
        return categoryShortName;
    }

    public void setCategoryShortName(String categoryShortName) {
        this.categoryShortName = categoryShortName;
    }
    
 }
