/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderEnvelopeCNames;
import java.util.List;


/**
 *
 * @author lincpay Solutions
 */
public interface TenderEnvelopeCNameDao {
    
    public int create(TenderEnvelopeCNames envelopeBName) throws Exception;
    public TenderEnvelopeCNames read(int tender_EnvelopeAName_Id)throws Exception;
    public List<TenderEnvelopeCNames> readAll()throws Exception;
    public List<TenderEnvelopeCNames> readAll(int deptId)throws Exception;
    public int update(TenderEnvelopeCNames envelopeBName)throws Exception;
    public int delete(int tender_EnvelopeAName_Id)throws Exception;
    public Boolean checkDuplicateEnvelopeBName(String envelopeAName);
}
