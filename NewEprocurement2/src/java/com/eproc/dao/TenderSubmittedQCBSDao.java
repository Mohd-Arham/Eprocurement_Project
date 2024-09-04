/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderSubmittedQCBS;
import java.util.List;

/**
 *
 * @author Windows7
 */
public interface TenderSubmittedQCBSDao {
    
    public int create(TenderSubmittedQCBS submittedQCBS) throws Exception;
    public TenderSubmittedQCBS read(int tender_Id)throws Exception;
    public List<TenderSubmittedQCBS> readAll()throws Exception;
    public List<TenderSubmittedQCBS> readAll(int envelopeA_Id)throws Exception;
    public int update(TenderSubmittedQCBS submittedEnvelopeA)throws Exception;
    public int delete(int envelopeA_Id)throws Exception;
     public boolean update(Integer tender_Id,String openedEBOfficers);
}
