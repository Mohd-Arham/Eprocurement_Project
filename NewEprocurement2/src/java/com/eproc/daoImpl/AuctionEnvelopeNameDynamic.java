/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 *  AuctionEnvelopeNameDynamic Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */

@Entity
@Table(name = "auctionEnvelopeNameDynamic")
public class AuctionEnvelopeNameDynamic implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "auctionEnvelopeNameId", unique = true, nullable = false)
    private Integer auctionEnvelopeNameId;
    private String auctionEnvelope_name;
 public Integer getAuctionEnvelopeNameId() {
        return auctionEnvelopeNameId;
    }

    public void setAuctionEnvelopeNameId(Integer auctionEnvelopeNameId) {
        this.auctionEnvelopeNameId = auctionEnvelopeNameId;
    }
public String getAuctionEnvelope_name() {
        return auctionEnvelope_name;
    }

    public void setAuctionEnvelope_name(String auctionEnvelope_name) {
        this.auctionEnvelope_name = auctionEnvelope_name;
    }
    
    
}
