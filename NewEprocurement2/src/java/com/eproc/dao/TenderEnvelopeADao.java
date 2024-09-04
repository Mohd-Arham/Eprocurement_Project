/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderEnvelopeA;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderEnvelopeADao {
    
    public int create(TenderEnvelopeA envelopeA) throws Exception;
    public TenderEnvelopeA read(int tender_EnvelopeA_Id)throws Exception;
    public List<TenderEnvelopeA> readAll()throws Exception;
    public List<TenderEnvelopeA> readAll(int tender_EnvelopeA_Id)throws Exception;
    public int update(TenderEnvelopeA envelopeA) throws Exception ;
    public int checkedDynamicField(int tender_Id)throws Exception;
    public int delete(int tender_EnvelopeA_Id)throws Exception;
    public List<TenderEnvelopeA> fetchTemplateNameByDeptId(String deptId);
}
