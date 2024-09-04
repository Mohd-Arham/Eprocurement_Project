/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderDocumentAmendment;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderDocumentAmendmentDao {
    
    public String createTenderDocument(TenderDocumentAmendment documentAmendment);
    public TenderDocumentAmendment fetchTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId);
    public String deleteTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId);
    public String deleteTenderDocument(int id);
    public List<TenderDocumentAmendment> fetchTenderDocumentByTenderId(int tender_Id);
    public String updateTenderDocumentStatus(int tender_Id, String documentVisibility, int docSequnceId); 
    public String deleteTenderDocumentByTenderId(int tender_Id);
}
