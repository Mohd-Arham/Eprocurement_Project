/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderDocument;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderDocumentDao{
    
    public String createTenderDocument(TenderDocument document);
    public TenderDocument fetchTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId);
    public String deleteTenderDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId);
    public String deleteTenderDocument(int id);
    public List<TenderDocument> fetchTenderDocumentByTenderId(int tender_Id);
    public String updateTenderDocumentStatus(int tender_Id, String documentVisibility, int docSequnceId); 
    public String deleteTenderDocumentByTenderId(int tender_Id);
}
