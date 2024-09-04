
package com.eproc.model;
import com.eproc.domain.Division;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;

@Component
public class DivisionModel {
  public String validate(Division division) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### Division circle id ###" + division.getCircleid());
        System.out.println("### Division circle name ###" + division.getCircle());
        System.out.println("### Division division id ###" + division.getDivision_id());
        System.out.println("### Division division name ###" + division.getDivision());
        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (division.getCircleid() == null) {
                System.out.println("::::::::::::1");
                map.put("circle_nameError1", "Please Enter Circle");
            }
            if (division.getDivision() == "") {
                System.out.println("::::::::::::2");
                map.put("division_nameError1", "Please Enter Division");
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
