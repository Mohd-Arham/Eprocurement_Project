

package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import java.util.List;

/**
 * This Interface content method to mangeProductCategoryy master at department level
 *
 * @author Vaishali Gupta
 * @param <ProductCategory>
 * @since 12 June 2018
 * @version 2.0.0
 */

public interface ProductCategoryDAO<ProductCategory> extends DepartmentMaster<ProductCategory>{
   
    public String checkDuplicateValue(ProductCategory productCategory,Integer deptId);
    List fetchAllProductCategorybyDept_ID(Integer id);
}
