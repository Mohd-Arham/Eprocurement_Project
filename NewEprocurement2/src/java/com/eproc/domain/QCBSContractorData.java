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

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "qcbs_contractordata")
public class QCBSContractorData {
    
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer templateId;
    private Integer tenderId;
    private String contractorId;
    
    
    
}
