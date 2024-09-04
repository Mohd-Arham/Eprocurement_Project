/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderEnvelopeC;
import java.util.List;

/**
 *
 * @author lincpay Solutions
 */
public interface TenderEnvelopeCDao {
    
    public int create(TenderEnvelopeC envelopeB) throws Exception;
    public TenderEnvelopeC read(int tender_EnvelopeA_Id)throws Exception;
    public List<TenderEnvelopeC> readAll()throws Exception;
    public List<TenderEnvelopeC> readAll(int tender_EnvelopeA_Id)throws Exception;
    public int update(TenderEnvelopeC envelopeB)throws Exception;
    public int delete(int tender_EnvelopeA_Id)throws Exception;
    public List<TenderEnvelopeC> fetchTemplateNameByDeptId(String deptId);
}
