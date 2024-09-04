package com.eproc.dao;

import java.util.List;

/**
 * This Interface content method to mange country master at department level
 *
 * @author Shashank Shukla
 * @param <States>
 */

public interface StatesDAO<States> extends DepartmentMaster<States> {

    public abstract List fetchStates(int country_Id);
    public String getDuplicateState(States state);
}
