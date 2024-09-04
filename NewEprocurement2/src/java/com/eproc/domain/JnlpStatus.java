package com.eproc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "jnlp_status")
public class JnlpStatus {

    @Id
    @GeneratedValue
    private Integer id;
    private String deptId;
    private String userId;
    private String randomNo;
    private String status;
    private String url;
    private String deptUserId;

    public JnlpStatus(String deptId, String userId, String randomNo, String status, String url, String deptUserId) {
        this.deptId = deptId;
        this.userId = userId;
        this.randomNo = randomNo;
        this.status = status;
        this.url = url;
        this.deptUserId = deptUserId;
    }

    public JnlpStatus() {
    }
   
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRandomNo() {
        return randomNo;
    }

    public void setRandomNo(String randomNo) {
        this.randomNo = randomNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDeptUserId() {
        return deptUserId;
    }

    public void setDeptUserId(String deptUserId) {
        this.deptUserId = deptUserId;
    }

}
