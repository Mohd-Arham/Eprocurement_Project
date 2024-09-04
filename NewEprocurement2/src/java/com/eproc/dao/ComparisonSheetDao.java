/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dao;

import com.eproc.domain.ComparisonSheet;
import java.util.List;

/**
 *
 * @author lincpay Solutions
 */
public interface ComparisonSheetDao {
    
        boolean saveData(ComparisonSheet sheet);
        boolean findByCotracotrIdAndTenderId(ComparisonSheet sheet);
        List<ComparisonSheet> getAllByTenderId(Integer tenderId,Integer departmentUserId);
}
