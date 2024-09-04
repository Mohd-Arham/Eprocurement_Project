
package com.eproc.model;
import com.eproc.domain.Division;
import com.eproc.domain.SubDivision;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SubDivisionModel{
    
 public String validate(SubDivision subdivision) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### SubDivision circle id ###" + subdivision.getCircleid());
        System.out.println("### SubDivision circle name ###" + subdivision.getCircle());
        System.out.println("### SubDivision division id ###" + subdivision.getDivision_id());
        System.out.println("### SubDivision division name ###" + subdivision.getDivision());
        System.out.println("### SubDivision division id ###" + subdivision.getSubdivision_id());
        System.out.println("### SubDivision division name ###" + subdivision.getSubdivision());
        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (subdivision.getCircleid() == null) {
                System.out.println("::::::::::::1");
                map.put("circle_nameError2", "Please Enter Circle");
            }
            if (subdivision.getDivision_id() == null) {
                System.out.println("::::::::::::2");
                map.put("division_nameError2", "Please Enter Division");
            }
            if (subdivision.getSubdivision() == "") {
                System.out.println("::::::::::::2");
                map.put("subdivision_nameError2", "Please Enter Sub-Division");
            }
            System.out.println(" Size of map :: " + map.size());
            if (map.size() >= 1) {
                return gson.toJson(map);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "done";
    }    
}
