/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/*
 *  Category Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name="category")
public class Category implements java.io.Serializable {
   @Id
   @GeneratedValue(strategy= GenerationType.AUTO)  
     private int cid;
    private String category_name;
    private int deptId;
public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }
    
}
