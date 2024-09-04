package com.eproc.domain;

import java.io.File;
import java.util.ArrayList;
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
import javax.persistence.Transient;

/*
 *  Inventory Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name = "inventory")
public class Inventory implements java.io.Serializable {

@Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Integer id;
    private String model_no;
    private String branch_name;
    private String product_name;
    private String manufacturer_date;
    private int price;
    private String price_in_word;
    private String product_Description;
    private String status= "in stock";
    private int cid;
     private Integer inventorydocumentId;
    private int sid;
    private String property1;
    private String property2;
    private String property3;
    private String property4;
    private int depId;
    private int quantity=2;
    private int InventoryNo=11;
    private Date currentdatetime;
    private String extraproperty;
    private String extrapropertyvalue;
    @Transient
    private String category_name;
    @Transient
    private String subcategoryname;

    public Integer getInventorydocumentId() {
        return inventorydocumentId;
    }

    public void setInventorydocumentId(Integer inventorydocumentId) {
        this.inventorydocumentId = inventorydocumentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModel_no() {
        return model_no;
    }

    public void setModel_no(String model_no) {
        this.model_no = model_no;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getManufacturer_date() {
        return manufacturer_date;
    }

    public void setManufacturer_date(String manufacturer_date) {
        this.manufacturer_date = manufacturer_date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPrice_in_word() {
        return price_in_word;
    }

    public void setPrice_in_word(String price_in_word) {
        this.price_in_word = price_in_word;
    }

    public String getProduct_Description() {
        return product_Description;
    }

    public void setProduct_Description(String product_Description) {
        this.product_Description = product_Description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getProperty1() {
        return property1;
    }

    public void setProperty1(String property1) {
        this.property1 = property1;
    }

    public String getProperty2() {
        return property2;
    }

    public void setProperty2(String property2) {
        this.property2 = property2;
    }

    public String getProperty3() {
        return property3;
    }

    public void setProperty3(String property3) {
        this.property3 = property3;
    }

    public String getProperty4() {
        return property4;
    }

    public void setProperty4(String property4) {
        this.property4 = property4;
    }

    public int getDepId() {
        return depId;
    }

    public void setDepId(int depId) {
        this.depId = depId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   

    public int getInventoryNo() {
        return InventoryNo;
    }

    public void setInventoryNo(int InventoryNo) {
        this.InventoryNo = InventoryNo;
    }

    public String getExtraproperty() {
        return extraproperty;
    }

    public void setExtraproperty(String extraproperty) {
        this.extraproperty = extraproperty;
    }

    public String getExtrapropertyvalue() {
        return extrapropertyvalue;
    }

    public void setExtrapropertyvalue(String extrapropertyvalue) {
        this.extrapropertyvalue = extrapropertyvalue;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getSubcategoryname() {
        return subcategoryname;
    }

    public void setSubcategoryname(String subcategoryname) {
        this.subcategoryname = subcategoryname;
    }

    public Date getCurrentdatetime() {
        return currentdatetime;
    }

    public void setCurrentdatetime(Date currentdatetime) {
        this.currentdatetime = currentdatetime;
    }
 

   
}

   


