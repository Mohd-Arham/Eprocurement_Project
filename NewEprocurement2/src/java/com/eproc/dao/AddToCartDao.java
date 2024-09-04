package com.eproc.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.eproc.domain.AddToCart;
import com.eproc.domain.Auction;
import com.eproc.domain.Tender;
import java.util.List;

/**
 *
 * @author Naina Jain
 */
public interface AddToCartDao extends DepartmentMaster<AddToCart> {

    public boolean deleteTenderFromCart(int id, int contractorId);

    public boolean deleteAuctionFromCart(int id, int contractorId);

    public List<Tender> liveTenderList(List<Tender> tenderList);

    public List<Auction> liveAuctionList(List<Auction> auctionList);

    public AddToCart fetchTnDataWithContId(Integer id, int contractorId);

    public AddToCart fetchAnDataWithContId(Integer id, int contractorId);
    
     public List<AddToCart> fetchAnDataWithContId(int contractorId);

    public List<Tender> liveTenderList(int tender_Id);

    public List<Auction> liveAuctionList(int auctionId);
}
