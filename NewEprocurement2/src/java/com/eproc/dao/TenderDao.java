/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Tender;
import java.util.List;

/**
 * <h1>TenderDao</h1>
 * 
 * @author Gaurav Dubey
 */
public interface TenderDao{
    
    public int create(Tender tender) throws Exception;
    public Tender read(int tender_Id)throws Exception;
    public List<Tender> readAll()throws Exception;
     public List<Tender> getAllApprovedTender();
    public List<Tender> readAll(Integer deptId)throws Exception;
    public List readAlltenderNo(Integer deptName)throws Exception;
    public List<Tender> readAllCanceledTender(Integer deptId)throws Exception;
    public int update(Tender tender)throws Exception;
    public int delete(int tender_Id)throws Exception;
    public String buyBackDocumentCreate(String buyBackDocument, int tender_Id)throws Exception;
    public String tenderNoticeCreate(String tenderNotice, int tender_Id)throws Exception;
    public String tenderStatusCreate(String tenderStatus, int tender_Id)throws Exception;
    public String createEnvelopeAInfo(String envelopeAId, int tender_Id, String envelopeAOfficers)throws Exception;
    public String createEnvelopeBInfo(String envelopeAId, int tender_Id, String envelopeBOfficers)throws Exception;
    public boolean checkTenderNumber(String tenderNumber)throws Exception;
    public int updateTenderDescription(Tender tender);
    public int updateApprovalOfficers(String approvalOfficer, int tender_Id);
    public List fetchTenderByDeptUser(int deptUserId, int deptId);
     public List<Tender> fetchTenderStatus(String Approved, String Amended);
     public List checkTenderTable(int tender_Id);
      public List searchLive(String deptName, String nitNumber, String tender_Number, String contractorClassId,
            String tenderCategoryId, String estimateValueInFig, String emdInFig, String selectiveTenderId,
            String startDate, String endDate);
}
