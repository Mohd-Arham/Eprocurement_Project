/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Decrypt_envelopQCBS;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface Decrypt_envelopQCBSDao extends DepartmentMaster<Decrypt_envelopQCBS>{
    
     public int fetchEBBidder(String tendreId);
     public List fetchEnvelopeBById(String tendreId,Integer contId,Integer deptUserId);
}
