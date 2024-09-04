/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.EnvelopeAData;
import com.eproc.domain.EnvelopeBData;
import java.util.List;

/**
 *
 * @author Vaishali Gupta
 * 10-10-2018
 */
public interface EnvelopeBDataDao <EnvelopeBData> extends DepartmentMaster<EnvelopeBData>{
    
    
  public List fetchEnvelopeBById(Integer tenderId, Integer contId);
  public List fetchEnvelopeBById(Integer tenderId, Integer contId,Integer deptUserId);
   public EnvelopeBData envelopeBContractorListbyId(Integer tenderId, Integer contractorId);
    public List envelopeBContractorList(Integer tenderId);
  public boolean updateShortlistedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId,String shortlistedstatus) ;
  public boolean updateRejectedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEB) ;
  public boolean updateRevertedContrctrStatus(Integer tenderId, Integer contractorId, Integer departmentUserId, String shortlistedstatus, String rejectRemarkEB, String revertRemark) ;
 public List fetchEnvelopeBContractor(Integer tenderId);
}
