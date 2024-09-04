package com.eproc.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.eproc.domain.PurchaseDetails;
import java.util.List;
/**
 *
 * @author Naina Jain
 */
public interface PaymentDAO extends DepartmentMaster<PurchaseDetails>{
    
public List fetchAllPurchaseDetailsByContId(int id);
public List fetchAllBidderByTenderId(int id);
 public PurchaseDetails fetchPurchaseDetailsWithContId(Integer tender_Id,int auctionId, int contractorId);
 public PurchaseDetails fetchAllBidderByTenderIdContId(int tender_Id,int contractorId);
}
