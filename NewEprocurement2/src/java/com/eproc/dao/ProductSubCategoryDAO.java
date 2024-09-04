

package com.eproc.dao;

import java.util.List;

/**
 * This Interface content method to mangeProductCategoryy master at department level
 *
 * @author Vaishali Gupta
 * @param <ProductSubCategory>
 */

public interface ProductSubCategoryDAO<ProductSubCategory> extends DepartmentMaster<ProductSubCategory>{
   
    
public List fetchProductSubCategory(Integer productSubCategoryId);
    public String checkDuplicateValue(ProductSubCategory productSubCategory,Integer deptId);
     List fetchAllProductSubCategorybyDept_ID(Integer id);
}
