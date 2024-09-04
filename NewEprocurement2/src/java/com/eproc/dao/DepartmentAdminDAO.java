/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.DepartmentAdmin;
import java.util.List;

/**
 *
 * @author Naina Jain
 */
public interface DepartmentAdminDAO extends DepartmentMaster<DepartmentAdmin> {

    List<Common_Logon_Status> fetchAllLogonStatus();
    void saveStatus(Common_Logon_Status commonlogin);
    boolean checkLogin(String validUser);
    public Common_Logon_Status fetchDetails(Integer id); 
    public List fetchAllDeptName() ;
       public boolean checkDuplicateEmail(String email,Integer deptId);
    public boolean checkDuplicateContact(String mobile, Integer deptId);
}
