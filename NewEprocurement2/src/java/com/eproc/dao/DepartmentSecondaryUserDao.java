/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import java.util.List;

/**
 *
 * @author Windows7
 */
public interface DepartmentSecondaryUserDao<DepartmentSecondaryUser> extends DepartmentMaster<DepartmentSecondaryUser>{
   
    public String statusValue(Integer reg_Id, String status ) ;
    
    public List getEA_UERS();

    public List getEB_UERS();

    public List getEC_UERS();
    public List enable_User();
    public List fetchAllByDept_Id(Integer deptId);
     public List userOfTenderApproval(Integer deptId, String status);
     public List userOfAmmendmentPrivilege(Integer deptId, String status);
}
