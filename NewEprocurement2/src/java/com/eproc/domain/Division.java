
package com.eproc.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/*
 * Process Department Division Form page with all setter() and getter()
 * Department can insert and update Department Division.
#Author  Mansi Jain
 */
@Entity
@Table(name = "division")
public class Division {
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "division_id", unique = true, nullable = false)
    private Integer division_id;

    @Column(name = "division")
    private String division;
   
    @Column(name = "created_Date")
    private Date  created_Date ;

    @Column(name="circleid")
    private Integer circleid;
    
    @Column(name = "dept_Id")
    private Integer dept_Id; 
    
      @Column(name = "status")
     private String status;
    
    @Transient
    private  String circle;
  
    
    public Division() {
    }

    public Integer getDivision_id() {
        return division_id;
    }

    public void setDivision_id(Integer division_id) {
        this.division_id = division_id;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public Date getCreated_Date() {
        return created_Date;
    }

    public void setCreated_Date(Date created_Date) {
        this.created_Date = created_Date;
    }

    public Integer getCircleid() {
        return circleid;
    }

    public void setCircleid(Integer circleid) {
        this.circleid = circleid;
    }
    public String getCircle() {
        return circle;
    }
    public void setCircle(String circle) {
        this.circle = circle;
    } 

    public Integer getDept_Id() {
        return dept_Id;
    }

    public void setDept_Id(Integer dept_Id) {
        this.dept_Id = dept_Id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
 

}

