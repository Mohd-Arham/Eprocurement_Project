/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Contractor;
import java.util.List;
import javax.crypto.SecretKey;

/*
 * @author Yashovardhan Singh
 * @Param<Contractor Registration>
 * Since 25 july 2018
 * @Version 2.0.0
 */
public interface ContractorDao<Contractor> extends DepartmentMaster<Contractor>{

    public boolean passwordcheck(String password, String newPassword, String currentPassword);
    public String emailverified(Integer EmailNo,String status); 
    public String mobileverified(String mobNo,String status);
    public String updateContractorMobileNumber(Integer id,String mobileNo);
    public String updateContractorEmailId(Integer id,String emailId);
    public Contractor fetchIdbyEmail(String Emailid);
    public List<Contractor> fetchAll(String areaOfWork, String contractorStatus); 
    public String updateContractorPassword(Integer regId, String Password, SecretKey secretKey);
}
