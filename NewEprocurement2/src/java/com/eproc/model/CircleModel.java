
package com.eproc.model;

import com.eproc.domain.Circle;
import com.eproc.domain.Countries;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CircleModel {

    public String validate(Circle circle) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### Circle circle id ###" + circle.getCircleid());
        System.out.println("### Circle circle name ###" + circle.getCircle());
        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (circle.getCircle() == "") {
                System.out.println("::::::::::::1");
                map.put("circle_nameError", "Please Enter Circle");
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
