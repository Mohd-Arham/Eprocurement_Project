/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderSubmittedEnvelopeA;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderSubmittedEnvelopeADao {
    
    public int create(TenderSubmittedEnvelopeA submittedEnvelopeA) throws Exception;
    public TenderSubmittedEnvelopeA read(int envelopeA_Id)throws Exception;
    public List<TenderSubmittedEnvelopeA> readAll()throws Exception;
    public List<TenderSubmittedEnvelopeA> readAll(int envelopeA_Id)throws Exception;
    public boolean update(Integer tender_Id,String openedEAOfficers);
    public int delete(int envelopeA_Id)throws Exception;

}
