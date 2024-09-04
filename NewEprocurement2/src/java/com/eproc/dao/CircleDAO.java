package com.eproc.dao;

//import com.eproc.dao.DepartmentMaster;

import java.util.List;

//import com.eproc.domain.Circle;
/**
 * This Interface content method to mange country master at department level
 *
 * @author Mansi Jain
 * @param <Circle>
 */
public interface CircleDAO<Circle> extends DepartmentMaster<Circle> {

    String checkDuplicateValue(Circle circle,Integer deptId);
     List fetchAllCirclebyDept_ID(Integer id);
}
