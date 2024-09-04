/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Vaishali Gupta
 */

@Entity
@Table(name="bidder_privilege")
public class BidderPrivilege {
    
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "privilegeId")
    private int privilegeid;
     
    @Column(name = "privilegeName")
    private String privilegeName;
     
    @Column(name = "privilegeArea")
    private String privilegeArea;
     
    @Column(name="privilegeAction")
    private String privilegeAction; 
    
    public int getPrivilegeid() {
        return privilegeid;
    }

    public void setPrivilegeid(int privilegeid) {
        this.privilegeid = privilegeid;
    }

    public String getPrivilegeName() {
        return privilegeName;
    }

    public void setPrivilegeName(String privilegeName) {
        this.privilegeName = privilegeName;
    }

    public String getPrivilegeArea() {
        return privilegeArea;
    }

    public void setPrivilegeArea(String privilegeArea) {
        this.privilegeArea = privilegeArea;
    }

    public String getPrivilegeAction() {
        return privilegeAction;
    }

    public void setPrivilegeAction(String privilegeAction) {
        this.privilegeAction = privilegeAction;
    }
    
}
