/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderEnvelopeB;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderEnvelopeBDao {
    
    public int create(TenderEnvelopeB envelopeB) throws Exception;
    public TenderEnvelopeB read(int tender_EnvelopeA_Id)throws Exception;
    public List<TenderEnvelopeB> readAll()throws Exception;
    public List<TenderEnvelopeB> readAll(int tender_EnvelopeA_Id)throws Exception;
    public int update(TenderEnvelopeB envelopeB)throws Exception;
    public int delete(int tender_EnvelopeA_Id)throws Exception;
    public List<TenderEnvelopeB> fetchTemplateNameByDeptId(String deptId);
}
