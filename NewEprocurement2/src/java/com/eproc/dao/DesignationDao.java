package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import com.eproc.domain.Designation;
import java.util.List;

/**
 * @author Mansi Jain
 * @since 18 june 2018
 * @version 2.0.0
 */
public interface DesignationDao <Designation> extends DepartmentMaster<Designation>{
    public List fetchAllbyDept_ID(Integer id); 
}
