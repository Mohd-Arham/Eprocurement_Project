package com.eproc.dao;


import com.eproc.dao.DepartmentMaster;
import java.util.List;
/**
 * This Interface content method to mange country master at department level
 *
 * @author Mansi Jain
 * @param <Division>
 */

public interface DivisionDAO<Division> extends DepartmentMaster<Division>

{
public List fetchDivision(Integer division_id);
public List fetchDivision(Integer division_id, Integer deptId);
String checkDuplicateValue(Division division);
public List fetchAllbyDept_ID(Integer id);
public String divisionName(Integer divisionId);
}
