/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.dao.DepartmentMaster;
import com.eproc.domain.ContractorDetails;
import java.util.List;

/**
 *
 * @author Palak Tiwari
 */
public interface ContractorDetailsDao<ContractorDetails>   extends DepartmentMaster<ContractorDetails> {
   //   public String checkDuplicateValue(String contCompanyEmail);
//     public abstract boolean deletedoc(int id,String filename);
//      public abstract boolean updatedoc(int id,String filename,String filevar);
    public abstract boolean deleteApplicant(Integer contOtherId);
    public List<Integer> fetchApplicantIds(Integer id);
    public ContractorDetails fetchDatabyRegID(Integer id);
    public ContractorDetails fetchMsmeDoc();
    public ContractorDetails fetchContractorClassDoc();
    public String changeMsmeStatusDoc(Integer id);
    public String changeContractorClassStatus(Integer id);
       
  //  public String checkApplicantValidation(ContractorDetails contractorDetails,String appType);
}
