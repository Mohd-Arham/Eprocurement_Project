/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Decrypt_envelopeA;
import java.util.List;

/**
 *
 * @author Vaishali Gupta
 */
public interface Decrypt_envelopeADao extends DepartmentMaster<Decrypt_envelopeA>{
     public List fetchEnvelopeAById(Integer tendreId,Integer contId,Integer deptUserId);
     public int fetchEABidder(Integer tendreId);
}
