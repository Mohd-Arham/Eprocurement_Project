/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.EmpanelmentDynamicTemplate;
import com.eproc.domain.EmpanelmentTemplateName;
import java.util.List;

/**
 *
 * @author Windows7
 */
public interface EmpanelmentDynamiclTemplateDAO extends DepartmentMaster <EmpanelmentDynamicTemplate>{
    public  List fetchAllbyTemplateid(int templatenameId);
    public boolean saveEmpanelmentTemplatename(EmpanelmentTemplateName empanelmentTemplateName);
     public List fetchAllTemplateNameData();
     
}
