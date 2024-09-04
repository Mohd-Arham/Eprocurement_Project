/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.EnvelopeAData;
import java.util.List;

/**
 *
 * @author Vaishali Gupta
 * 10-10-2018
 */
public interface EnvelopeADataDao <EnvelopeAData> extends DepartmentMaster<EnvelopeAData> {
    
    public List fetchEnvelopeAById(Integer tenderId, Integer contId);

    public List fetchEnvelopeAById(Integer tenderId, Integer contId, Integer deptUserId);

    public List envelopeAContractorList(Integer tenderId, Integer departmentUserId);

      public List envelopeAShortlistedContractorList(Integer tenderId);
    
    public EnvelopeAData envelopeAContractorListbyId(Integer tenderId, Integer contractorId);

    public boolean updateShortlistedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus);

    public boolean updateRejectedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEA);

    public boolean updateRevertedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEA, String revertRemark);
    public boolean allEnvelopeSubmittedStatus(Integer tenderId, Integer contId) ;
    public int fetchEABidderCount(int tenderId);
}
