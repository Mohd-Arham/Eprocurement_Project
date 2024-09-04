/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.TenderKeyword;
import java.util.List;

/**
 *
 * @author Naina Jain
 */
public interface TenderKeywordDAO extends DepartmentMaster<TenderKeyword> {

    String getDuplicateAddKeyword(TenderKeyword addkeywords,Integer deptId);
    List fetchAllTenderKeywordbyDept_ID(Integer id);
    public TenderKeyword read(int tenderKeyWordsId);
}
