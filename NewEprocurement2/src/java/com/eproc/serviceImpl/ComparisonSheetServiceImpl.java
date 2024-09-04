/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.serviceImpl;

import com.eproc.dao.ComparisonSheetDao;
import com.eproc.dao.ContractorDetailsDao;
import com.eproc.domain.ComparisonSheet;
import com.eproc.domain.ContractorDetails;
import com.eproc.service.ComparisonSheetService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lincpay Solutions
 */
@Service
public class ComparisonSheetServiceImpl implements ComparisonSheetService {

    @Autowired
    private ComparisonSheetDao dao;
    
    @Autowired
    private ContractorDetailsDao  contractorDao;
    
    @Override
    public Integer saveData(ComparisonSheet sheet) {
          boolean flag= dao.findByCotracotrIdAndTenderId(sheet);
          if(flag)
          {
              dao.saveData(sheet);
              return 1;
          }
         
              
        return 0;  
    }

    @Override
    public List<ComparisonSheet> getAllByTenderId(Integer tenderId, Integer departmentUserId) {
           List<ComparisonSheet>data = dao.getAllByTenderId(tenderId,departmentUserId);
           System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddddddd"+departmentUserId);
           if(data!=null)
           {
           if(!data.isEmpty())
           {
               ArrayList<ComparisonSheet> newData= new ArrayList<ComparisonSheet>();
            for(ComparisonSheet sheet:data)
            {
                  ContractorDetails    contractorDetails = (ContractorDetails) contractorDao.fetchDatabyRegID(sheet.getContractorId());
                if(contractorDetails!=null)
                {
             sheet.setCompanyName(contractorDetails.getIndianOrgName());}
                newData.add(sheet);
            }
               System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+newData);
           return newData;
           }
           else
           {
            return new ArrayList<ComparisonSheet>();
           } 
           }
           else
              
           {
                 return new ArrayList<ComparisonSheet>();
           }
    }
    
}
