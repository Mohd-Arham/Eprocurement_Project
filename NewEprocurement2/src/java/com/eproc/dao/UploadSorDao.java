
package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import com.eproc.domain.UploadSOR;
import java.util.List;
/** This is  the  UploadSorDao class which extends DepartmentMaster<UploadSOR>
@author Palak Tiwari
**/

public interface UploadSorDao extends DepartmentMaster<UploadSOR>{
    public String checkDuplicateValue(String fileName);
    public abstract boolean updateStatus(int id,String status);
     public List<UploadSOR> fetchSORDocumentByDeptId(int dept_id);
    public UploadSOR fecthSORDocumentByIdDeptIdAndStatus(int sorDocumentId, int dept_id, String status);
   
}
 