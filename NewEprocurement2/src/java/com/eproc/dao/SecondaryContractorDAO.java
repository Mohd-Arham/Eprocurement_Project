/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.Secondary_Contractor;
import java.util.List;
import javax.crypto.SecretKey;

/**
 *
 * @author Vaishali Gupta
 * 19-09-2018
 */
public interface SecondaryContractorDAO<Secondary_Contractor> extends DepartmentMaster<Secondary_Contractor>{
    public String statusValue(Integer reg_Id, String status);

    public boolean checkDuplicateEmail(String email);

    public boolean checkDuplicateContect(String mobile);

    public boolean emailverified(int id);

     public boolean createPassword(int reg_Id,String encreptPassword,SecretKey secretKey);
     
      public boolean mobileverified(int id);
       public abstract List fetchAllByPrimaryContractor(int id);
}
