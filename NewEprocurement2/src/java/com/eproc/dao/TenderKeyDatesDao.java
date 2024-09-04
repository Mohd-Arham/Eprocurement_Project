/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Tender;
import com.eproc.domain.TenderKeyDates;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderKeyDatesDao{
    
    public int create(TenderKeyDates tenderKeyDates) throws Exception;
    public TenderKeyDates readKeyDates(int keyDatesId)throws Exception;
    public List<TenderKeyDates> readAllKeyDates()throws Exception;
    public int update(TenderKeyDates tenderKeyDates)throws Exception;
    public int deleteKeyDate(int keyDatesId)throws Exception;
    public List<TenderKeyDates> readAllKeyDates(int tender_Id)throws Exception;
    public TenderKeyDates readKeyDate(int tender_Id)throws Exception;
}
