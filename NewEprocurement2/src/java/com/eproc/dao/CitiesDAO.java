package com.eproc.dao;

import java.util.List;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Shashank Shukla
 * @param <Cities>
 */

public interface CitiesDAO<Cities> extends DepartmentMaster<Cities> {

    public Cities fetchByIdEdit(int city_id);
    public abstract List fetchCitiesByState(int state_id);
    public String getDuplicateCities(Cities cities);
    public boolean  removeDataList(Cities city);

}
