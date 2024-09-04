/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderSubmittedEnvelopeB;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderSubmittedEnvelopeBDao {
    
    public int create(TenderSubmittedEnvelopeB submittedEnvelopeB) throws Exception;
    public TenderSubmittedEnvelopeB read(int envelopeB_Id)throws Exception;
    public List<TenderSubmittedEnvelopeB> readAll()throws Exception;
    public List<TenderSubmittedEnvelopeB> readAll(int envelopeB_Id)throws Exception;
    public int update(TenderSubmittedEnvelopeB submittedEnvelopeB)throws Exception;
    public int delete(int envelopeB_Id)throws Exception;
     public boolean update(Integer tender_Id,String openedEBOfficers);
}
