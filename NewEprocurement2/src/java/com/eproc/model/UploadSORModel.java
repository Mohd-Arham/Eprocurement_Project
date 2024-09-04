
package com.eproc.model;

import com.eproc.domain.UploadSOR;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Palak Tiwari
 * UploadSORModel class class for validation
 */
@Component
public class UploadSORModel implements Validator {

    @Override
    public boolean supports(Class<?> UploadSOR) {
        return UploadSOR.class.equals(UploadSOR);
    }

    @Override
    public void validate(Object obj, Errors err) {
      System.out.println("----------Validate Method is run------------------");
      UploadSOR uploadSor=(UploadSOR) obj;
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "fileName","required.name", "Please Enter Valid filename");
      ValidationUtils.rejectIfEmptyOrWhitespace(err, "file","required.name", "Please Select file");
        System.out.println("---------Validate Method is Closed");
    }
    
}
