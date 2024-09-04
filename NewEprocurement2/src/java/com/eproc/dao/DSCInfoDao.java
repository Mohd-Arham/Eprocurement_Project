package com.eproc.dao;

import com.eproc.domain.DSCInformationForContractor;
import com.eproc.domain.DSCInformationForDepartmentAdmin;
import com.eproc.domain.DSCInformationForDepartmentUser;
import java.util.List;

public interface DSCInfoDao {
    
    public List<DSCInformationForDepartmentUser> getDepartmentUserData(String deptId, String type);
     public List<DSCInformationForContractor> getBidderData(String bidderId, String type);
      public List<DSCInformationForDepartmentAdmin> getDepartmentAdminData(String deptAdminId, String type);
}