/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.ContractorLogs;

/**
 *
 * @author Mansi Jain
 */
public interface ContractorLogsDao<Status>extends DepartmentMaster<Status>{
    
       public ContractorLogs fetchDataByContId(Integer id);
}
