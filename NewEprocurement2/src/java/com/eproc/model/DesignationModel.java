package com.eproc.model;

import com.eproc.domain.Designation;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * @author Mansi Jain
 * @since 18june2018
 * @version 2.0.0
 */
public class DesignationModel implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Designation.class.equals(type);
    }

    @Override
    public void validate(Object obj, Errors err) {
        Designation designation = (Designation) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(err, "designation", "required.name", "Designation should not be empty");
    }

}
