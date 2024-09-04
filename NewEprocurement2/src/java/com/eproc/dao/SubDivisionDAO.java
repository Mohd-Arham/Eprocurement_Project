package com.eproc.dao;


import com.eproc.dao.DepartmentMaster;
import java.util.List;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Mansi Jain
 * @param <SubDivision>
 */

public interface SubDivisionDAO<SubDivision> extends DepartmentMaster<SubDivision>
{
  String checkDuplicateValue(SubDivision subdivision);
 public List fetchSubDivision(Integer subdivision_id);
  public List fetchAllbyDept_ID(Integer id);
  public String subDivisionName(Integer division_id);  
    
}



 
    
 