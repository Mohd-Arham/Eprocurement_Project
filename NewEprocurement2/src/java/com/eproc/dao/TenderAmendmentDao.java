/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderAmendment;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderAmendmentDao {
   
    public int create(TenderAmendment tenderAmendment) throws Exception;
    public TenderAmendment read(int tender_Id)throws Exception;
    public List<TenderAmendment> readAll(int tender_Id)throws Exception;
    public List<TenderAmendment> readAll()throws Exception;
    public List<TenderAmendment> readAll(Integer deptId)throws Exception;
    public List readAlltenderNo(Integer deptName)throws Exception;
    public int update(TenderAmendment tenderAmendment)throws Exception;
    public int delete(int tender_Id)throws Exception;
    
    public String buyBackDocumentCreate(String buyBackDocument, int tender_Id)throws Exception;
    public String tenderNoticeCreate(String tenderNotice, int tender_Id)throws Exception;
    public String tenderStatusCreate(String tenderStatus, int tender_Id)throws Exception;
    public String createEnvelopeAInfo(String envelopeAId, int tender_Id, String envelopeAOfficers)throws Exception;
    public String createEnvelopeBInfo(String envelopeAId, int tender_Id, String envelopeBOfficers)throws Exception;
    public boolean checkTenderNumber(String tenderNumber)throws Exception;
    public int updateTenderDescription(TenderAmendment tenderAmendment);
}
