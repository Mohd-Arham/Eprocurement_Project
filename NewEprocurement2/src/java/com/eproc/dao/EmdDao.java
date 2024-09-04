/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;
import java.util.List;
/*
 * @author Anshu Baghel
 */
public interface EmdDao<EmdPayment> extends DepartmentMaster<EmdPayment>
{
     public EmdPayment fetchEmdById(Integer tenderId, Integer contId);
     
}
