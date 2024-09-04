/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.EmpanelmentTemplateData;
import java.util.List;

/**
 *
 * @author Mansi Jain
 */
public interface EmpanelmentTemplateDataDAO extends DepartmentMaster<EmpanelmentTemplateData>{
    
     public List fetchAllBytemplateNameid(Integer templatenameId);
}
