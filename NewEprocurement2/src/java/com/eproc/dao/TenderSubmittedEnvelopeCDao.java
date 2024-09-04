/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderSubmittedEnvelopeB;
import com.eproc.domain.TenderSubmittedEnvelopeC;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderSubmittedEnvelopeCDao {
    
    public int create(TenderSubmittedEnvelopeC submittedEnvelopeC) throws Exception;
    public TenderSubmittedEnvelopeC read(int envelopeC_Id)throws Exception;
    public List<TenderSubmittedEnvelopeC> readAll()throws Exception;
    public List<TenderSubmittedEnvelopeC> readAll(int envelopeC_Id)throws Exception;
    public int update(TenderSubmittedEnvelopeC submittedEnvelopeC)throws Exception;
    public int delete(int envelopeC_Id)throws Exception;
    public boolean updateofficers(Integer tender_Id,String openedEAOfficers);
}
