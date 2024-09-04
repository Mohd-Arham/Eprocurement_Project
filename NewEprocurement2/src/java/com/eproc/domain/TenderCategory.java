package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Naina Jain
 */
@Entity
@Table(name = "tendercategory")
public class TenderCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tender_category_id")
    private Integer tender_category_id;

    @Column(name = "tender_category_name")
    private String tender_category_name;

    @Column(name = "dept_id")
    private Integer dept_id;

    @Column(name = "date")
    private Date date;

    public Integer getTender_category_id() {
        return tender_category_id;
    }

    public void setTender_category_id(Integer tender_category_id) {
        this.tender_category_id = tender_category_id;
    }

    public String getTender_category_name() {
        return tender_category_name;
    }

    public void setTender_category_name(String tender_category_name) {
        this.tender_category_name = tender_category_name;
    }

    public Integer getDept_id() {
        return dept_id;
    }

    public void setDept_id(Integer dept_id) {
        this.dept_id = dept_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

   
}
