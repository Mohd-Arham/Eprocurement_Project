package com.eproc.dao;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Shashank Shukla
 * @param <Countries>
 *
 */
public interface CountriesDAO<Countries> extends DepartmentMaster<Countries> {

    public String checkDuplicateValue(Countries countries);

   }
