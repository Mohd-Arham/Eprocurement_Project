package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import javax.persistence.Table;
/** This class content object property of SubcategoryInventory with their setter and getter
/*
 *  SubcategoryInventory Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name="subcategory")
public class Subcategory implements java.io.Serializable
{
@Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "sid", unique = true, nullable = false)
    private int sid;
    private String subcategoryname;
    private int cid;
    
//    @ManyToOne
//   @JoinColumn(name = "cid")
//   private Category category;
//    
    public Subcategory() {
    }

    public Subcategory(String subcategoryname)
    {
        this.subcategoryname = subcategoryname;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }


    public String getSubcategoryname() 
    {
        return subcategoryname;
    }

    public void setSubcategoryname(String subcategoryname) 
    {
        this.subcategoryname = subcategoryname;
    }

//    public Category getCategory() {
//        return category;
//    }
//
//    public void setCategory(Category category) {
//        this.category = category;
//    }
    
}
