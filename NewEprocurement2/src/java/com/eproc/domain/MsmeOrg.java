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
@Table(name="msmeorg")
public class MsmeOrg {
 @Id
 @GeneratedValue(strategy = GenerationType.AUTO)
 @Column(name = "Id")
    private Integer msmeId;
  @Column(name = "Name")
    private String comName;
  @Column(name = "shortName")
    private String shortName;

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public Integer getMsmeId() {
        return msmeId;
    }

    public void setMsmeId(Integer msmeId) {
        this.msmeId = msmeId;
    }
  public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }
  
}
