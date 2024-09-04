package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Naina Jain
 */
@Entity
@Table(name = "tenderkeyword")

public class TenderKeyword {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tenderKeyWordsId")
    private Integer tenderKeyWordsId;

    @Column(name = "tenderKeyWordsName")
    private String tenderKeyWordsName;

    @Column(name = "dept_id")
    private Integer dept_id;

    @Column(name = "date")
    private Date date;
    
    @Column(name = "status")
    private String status;
    

    @Transient
    private Integer tender_category_id;

    @Transient
    private String tender_category_name;

    @Column(name = "areaofwork_id")
    private Integer areaofwork_id;

    @Transient
    private String areaofwork_name;

    public Integer getTenderKeyWordsId() {
        return tenderKeyWordsId;
    }

    public void setTenderKeyWordsId(Integer tenderKeyWordsId) {
        this.tenderKeyWordsId = tenderKeyWordsId;
    }

    public String getTenderKeyWordsName() {
        return tenderKeyWordsName;
    }

    public void setTenderKeyWordsName(String tenderKeyWordsName) {
        this.tenderKeyWordsName = tenderKeyWordsName;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

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

    public Integer getAreaofwork_id() {
        return areaofwork_id;
    }

    public void setAreaofwork_id(Integer areaofwork_id) {
        this.areaofwork_id = areaofwork_id;
    }

    @Override
    public String toString() {
        return "TenderKeyword{" + "tenderKeyWordsId=" + tenderKeyWordsId + ", tenderKeyWordsName=" + tenderKeyWordsName + ", dept_id=" + dept_id + ", date=" + date + ", status=" + status + ", tender_category_id=" + tender_category_id + ", tender_category_name=" + tender_category_name + ", areaofwork_id=" + areaofwork_id + ", areaofwork_name=" + areaofwork_name + '}';
    }

    public String getAreaofwork_name() {
        return areaofwork_name;
    }

    public void setAreaofwork_name(String areaofwork_name) {
        this.areaofwork_name = areaofwork_name;
    }

}
