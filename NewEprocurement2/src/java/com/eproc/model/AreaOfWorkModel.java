package com.eproc.model;

import com.eproc.domain.AreaOfWork;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;

/**
 *
 * @author Naina Jain
 */
@Component
public class AreaOfWorkModel {

    public String validate(AreaOfWork addareaofwork) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### addareaofwork Tender_category_id ###" + addareaofwork.getTender_category_id());
        System.out.println("### addareaofwork Tender_category_name ###" + addareaofwork.getTender_category_name());
        System.out.println("### addareaofwork area of id ###" + addareaofwork.getAreaofwork_id());
        System.out.println("### addareaofwork area of name ###" + addareaofwork.getAreaofwork_name());

        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (addareaofwork.getTender_category_id() == -1) {
                System.out.println("::::::::::::1");
                map.put("tender_category_idError", "Please Select Tender Category");
            }
            if ((addareaofwork.getAreaofwork_name() == null) || (addareaofwork.getAreaofwork_name().trim().equals(""))) {
                System.out.println("::::::::::::1");
                map.put("areaofwork_idError", "Please Enter Area Of Work");
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
