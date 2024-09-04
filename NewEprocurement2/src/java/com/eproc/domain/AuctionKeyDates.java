package com.eproc.domain;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;
/*
 *  AuctionKeyDates Pojo
 *  @author Prashant Shukla
 *  @Since 14-08-2018
 *  @Version 2.0.0
 */
@Entity
@Table(name = "auctionkeydates")
public class AuctionKeyDates implements java.io.Serializable {
@Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "keyId", unique = true, nullable = false)
    private Integer keyId;
    //private String auctionReleseDateTime;
    private String auctionPurchaseDateTime;
    private String documentSubmissionDateTime;
    private String auctionBiddingDateTime;
    private Integer deptId;
    private Integer auctionId;

    public Integer getKeyId() {
        return keyId;
    }

    public void setKeyId(Integer keyId) {
        this.keyId = keyId;
    }

//    public String getAuctionReleseDateTime() {
//        return auctionReleseDateTime;
//    }
//
//    public void setAuctionReleseDateTime(String auctionReleseDateTime) {
//        this.auctionReleseDateTime = auctionReleseDateTime;
//    }

    public String getAuctionPurchaseDateTime() {
        return auctionPurchaseDateTime;
    }

    public void setAuctionPurchaseDateTime(String auctionPurchaseDateTime) {
        this.auctionPurchaseDateTime = auctionPurchaseDateTime;
    }

    public String getDocumentSubmissionDateTime() {
        return documentSubmissionDateTime;
    }

    public void setDocumentSubmissionDateTime(String documentSubmissionDateTime) {
        this.documentSubmissionDateTime = documentSubmissionDateTime;
    }

    public String getAuctionBiddingDateTime() {
        return auctionBiddingDateTime;
    }

    public void setAuctionBiddingDateTime(String auctionBiddingDateTime) {
        this.auctionBiddingDateTime = auctionBiddingDateTime;
    }

  

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Integer auctionId) {
        this.auctionId = auctionId;
    }

    
    

   
}
