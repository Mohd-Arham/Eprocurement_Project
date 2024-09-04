/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.Cities;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;

/**
 *
 * @author Shashank Shukla
 */
@Component
public class CitiesModel {

    public String validate(Cities cities) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### Cities Countrty id ###" + cities.getCountry_id());
        System.out.println("### Cities Countrty name ###" + cities.getCountry_name());
        System.out.println("### Cities state id ###" + cities.getState_id());
        System.out.println("### Cities state name ###" + cities.getState_name());
        System.out.println("### Cities city id ###" + cities.getCity_id());
        System.out.println("### Cities cities name ###" + cities.getCity_name());
        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (cities.getCountry_id() == null) {
                System.out.println("::::::::::::1");
                map.put("country_nameError2", "Please Select Country");
            }
            if (cities.getState_id() == null) {
                System.out.println("::::::::::::2");
                map.put("state_nameError2", "Please Select State");
            }
            if (cities.getCity_name() == "") {
                System.out.println("::::::::::::3");
                map.put("city_nameError2", "Please Enter City");
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
