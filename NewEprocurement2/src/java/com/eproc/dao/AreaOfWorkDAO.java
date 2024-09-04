/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.AreaOfWork;
import java.util.List;

/**
 *
 * @author Naina Jain
 */
public interface AreaOfWorkDAO extends DepartmentMaster<AreaOfWork> {

    String getDuplicateAreaOfWork(AreaOfWork addareaofwork,Integer deptId);
     List fetchAllAreaOfWorkbyDept_ID(Integer tender_category_id);
     public List fetchAreaOfWorkbyTenderCategory(Integer tender_category_id);
}
