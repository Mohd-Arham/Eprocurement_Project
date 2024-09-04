package com.eproc.dao;

import com.eproc.domain.Common_Logon_Status;
import com.eproc.domain.DepartmentUser;
import java.util.List;
import javax.crypto.SecretKey;

/*
 * @author Gaurav Dubey
 * @param <DepartmentUser>
 */
public interface DepartmentUserDao<DepartmentUser> extends DepartmentMaster<DepartmentUser> {

    public String checkDuplicateValue(DepartmentUser departmentUser);
    
    public boolean checkDuplicateEmail(String email,Integer deptId );
    
    public boolean checkDuplicateContect(String mobile, Integer deptId);
            
    public String checkLogin(String validUser);

    public List<Common_Logon_Status> fetchAllLogonStatus();

    public void saveStatus(Common_Logon_Status commonlogin);

    public boolean updateDataUserType(Integer reg_Id, String status);

    public String statusValue(Integer reg_Id, String status);

    public List userOfAmmendmentPrivilege(int deptId, String status);
    
    public List getEA_UERS();

    public List getEB_UERS();

    public List getEC_UERS();

    public List enable_User();

    public List fetchAllByDept_Id(Integer deptId);
    
    public List fetchAllByCircle_Id(Integer circleId);

    public List fetchAllByDivision_Id(Integer divisionId);

    public List fetchAllBySubdivision_id(Integer subdivisionId);
    
    public String emailverified(Integer EmailNo);
    
    public String mobileverified(String mobNo);
    public String createPassword(Integer red_Id,String Password,String secretKey);
    
     public String otpAlertStatus(String emailid, String otpstatus);
      public boolean checkDuplicateContect(String mobile);
    public boolean checkDuplicateEmail(String email);
    public List userOfTenderApproval(int deptId, String status);
    public DepartmentUser fetchData(int deptId, int deptUserId);
      public int changeEmail(String newEmail, String oldEmail);
      public int changeContect(String newContect, String oldContect);
      public DepartmentUser fetchData(String userExists);
}
