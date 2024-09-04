/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.AuctionAmidmentKeyDates;
import java.util.List;

/**
 *
 * @author Naina Jain
 */
public interface AuctionAmendmentKeyDatesDao extends DepartmentMaster<AuctionAmidmentKeyDates> {

    public List<AuctionAmidmentKeyDates> readAllKeyDates(int auctionId) throws Exception;
}
