/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Mansi Jain
 */
@Entity
@Table(name = "EmpanelmentTemplateName")
public class EmpanelmentTemplateName {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "templatenameId", unique = true, nullable = false)
 private Integer templatenameId;
    @Column(name = "templatename")
   private String templatename;
    @Column(name="createdDate")
      private Date createdDate;

    public Integer getTemplatenameId() {
        return templatenameId;
    }

    public void setTemplatenameId(Integer templatenameId) {
        this.templatenameId = templatenameId;
    }

    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
}
