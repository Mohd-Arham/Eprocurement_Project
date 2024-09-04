/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderTemporaryAmendDocument;
import java.util.List;

/**
 *
 * @author Gaurav Dubey
 */
public interface TenderTemporaryAmendDocumentDao {
    
    public String createTenderTemporaryDocument(TenderTemporaryAmendDocument temporaryAmendDocument);
    public TenderTemporaryAmendDocument fetchTenderTemporaryDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId);
    public String deleteTenderTemporaryDocumentByTenderIdAndDocSeq(int tender_Id, int docSequnceId);
    public String deleteTenderTemporaryDocument(int tender_Id);
    public List<TenderTemporaryAmendDocument> fetchTenderTemporaryDocumentByTenderId(int tender_Id);
    public String updateTenderTemporaryDocumentStatus(int tender_Id, String documentVisibility, int docSequnceId); 
    public String deleteTenderTemporaryDocumentByTenderId(int tender_Id);
}
