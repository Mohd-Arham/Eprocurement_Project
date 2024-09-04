/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Decrypt_envelopeB;
import java.util.List;

/**
 *
 * @author Vaishali Gupta
 */
public interface Decrypt_envelopeBDao extends DepartmentMaster<Decrypt_envelopeB>{
     public int fetchEBBidder(Integer tendreId);
     public List fetchEnvelopeBById(Integer tendreId,Integer contId,Integer deptUserId);
}
