 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderEnvelopeBNames;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderEnvelopeBNameDao {
    
    public int create(TenderEnvelopeBNames envelopeBName) throws Exception;
    public TenderEnvelopeBNames read(int tender_EnvelopeAName_Id)throws Exception;
    public List<TenderEnvelopeBNames> readAll()throws Exception;
    public List<TenderEnvelopeBNames> readAll(int deptId)throws Exception;
    public int update(TenderEnvelopeBNames envelopeBName)throws Exception;
    public int delete(int tender_EnvelopeAName_Id)throws Exception;
    public Boolean checkDuplicateEnvelopeBName(String envelopeAName);
}
