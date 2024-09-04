/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.domain.States;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Shashank Shukla
 */
public class StatesModel {
    
    public String validate(States state) {
        System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### States Countrty id ###" + state.getCountry_id());
        System.out.println("### States Countrty name ###" + state.getCountry_name());
        System.out.println("### States state id ###" + state.getState_id());
        System.out.println("### States state name ###" + state.getState_name());
        Map map = new HashMap();
        Gson gson = new Gson();
        try {
            if (state.getCountry_id() == null) {
                System.out.println("::::::::::::1");
                map.put("country_nameError1", "Please Select Country");
            }
            if (state.getState_name() == "") {
                System.out.println("::::::::::::2");
                map.put("state_nameError1", "Please Enter State");
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
