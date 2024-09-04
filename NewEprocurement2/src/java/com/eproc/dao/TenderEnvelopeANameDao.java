/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderEnvelopeA;
import com.eproc.domain.TenderEnvelopeANames;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderEnvelopeANameDao {
  
    public int create(TenderEnvelopeANames envelopeAName) throws Exception;
    public TenderEnvelopeANames read(int tender_EnvelopeAName_Id)throws Exception;
    public List<TenderEnvelopeANames> readAll()throws Exception;
    public List<TenderEnvelopeANames> readAll(int deptId)throws Exception;
    public int update(TenderEnvelopeANames envelopeAName)throws Exception;
    public int delete(int tender_EnvelopeAName_Id)throws Exception;
    public Boolean checkDuplicateEnvelopeAName(String envelopeAName);
}
