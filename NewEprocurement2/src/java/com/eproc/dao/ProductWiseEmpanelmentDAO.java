/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.ProductWiseEmpanelment;

/**
 *
 * @author Mansi Jain
 */
public interface ProductWiseEmpanelmentDAO extends DepartmentMaster<ProductWiseEmpanelment>{
    public int updateData(int empanelmentId, int templatenameId);
    public boolean updateStatus(Integer empanelmentId,String status );
     public boolean updatePendigrequest(Integer templatenameId, String templateStatus);
      public boolean updatePendigrequestandfillRemark(Integer templatenameId, String templateStatus,String rejectremark,String remarkDate);
}
