/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.QcbsData;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface QcbsDataDao {
    
   public String create(QcbsData qcbsData)throws Exception;
   
   public List fetchQcbsById(String tenderId, Integer contId)throws Exception;
    public List fetchEnvelopeQCBSById(String tenderId, Integer contId,Integer deptUserId);
 
   public QcbsData read(String tenderId)throws Exception;
   
   public List envelopeQCBSContractorList(String tenderId);
   
     public QcbsData envelopeQCBSContractorListbyId(String tenderId, Integer contractorId);
     
        public boolean update(String tenderId,Integer contractorId,String template);
        
        public boolean updateShortlistedContractorStatus(String tenderId, Integer contractorId, Integer departmentUserId,String shortlistedstatus) ;
 
}
