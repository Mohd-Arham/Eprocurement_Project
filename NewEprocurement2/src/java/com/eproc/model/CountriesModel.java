/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.Countries;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;

/**
 *
 * @author Shashank Shukla
 */
@Component
public class CountriesModel {

    public String validate(Countries countries) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### Countries Countrty id ###" + countries.getCountry_id());
        System.out.println("### Countries Countrty name ###" + countries.getCountry_name());
        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (countries.getCountry_name() == "") {
                System.out.println("::::::::::::1");
                map.put("country_nameError", "Please Enter Country");
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
