/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderKeyDatesAmendment;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderAmendmentKeyDatesDao {
    
    public int create(TenderKeyDatesAmendment tenderKeyDatesAmendment) throws Exception;
    public TenderKeyDatesAmendment readKeyDates(int keyDatesId)throws Exception;
    public List<TenderKeyDatesAmendment> readAllKeyDates()throws Exception;
    public int update(TenderKeyDatesAmendment tenderKeyDatesAmendment)throws Exception;
    public int deleteKeyDate(int keyDatesId)throws Exception;
    public List<TenderKeyDatesAmendment> readAllKeyDates(int tender_Id)throws Exception;
    public TenderKeyDatesAmendment readKeyDate(int tender_Id)throws Exception;
    public TenderKeyDatesAmendment readLastKeyDate(int tender_Id)throws Exception;
}
