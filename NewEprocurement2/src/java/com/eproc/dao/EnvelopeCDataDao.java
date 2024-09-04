/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.EnvelopeCData;
import java.util.List;

/**
 *
 * @author Vaishali Gupta
 */
public interface EnvelopeCDataDao <EnvelopeCData> extends DepartmentMaster<EnvelopeCData> {
    
    
     public List fetchEnvelopeCById(Integer tenderId, Integer contId);
     public EnvelopeCData fetchEnvelopeCById(Integer tenderId, Integer contId,Integer departUserId);
   
     public List envelopeCContractorList(Integer tenderId, int departmentUserId) ;
      public List envelopeCContractorList(Integer tenderId) ;
     public List fetchEnvelopeCEncryById(Integer id,Integer contId,Integer deptUserId);
}
