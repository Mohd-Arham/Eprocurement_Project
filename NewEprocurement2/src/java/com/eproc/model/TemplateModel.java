/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;
import com.eproc.domain.DynamicTemplatePojo;
import org.springframework.stereotype.Component;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

/*
 * @author Anshu Baghel
 */
@Component
public class TemplateModel {
    
    @Autowired
    GsonUtility gsonUtility;

    public String validate(DynamicTemplatePojo dynamicTemplatePojo) {
        System.out.println("start Calling class Template Model  validate");
        Map map = new HashMap();
        Gson gson = new Gson();
        String textfield = "^[a-zA-Z ]+$";
        String num="^[0-9]+$";

        try {
            if ((dynamicTemplatePojo.getTextfield()== null) || (dynamicTemplatePojo.getTextfield().trim().equals(""))) {
                System.out.println("textfield in validation");
                map.put("textfield", "This field is required");
            }
            else if(dynamicTemplatePojo.getTextfield().matches(textfield))
            {
                System.out.println("regex didn't match for textfield");
                map.put("textfield", "Field should be Alphabet");
            }
            if ((dynamicTemplatePojo.getTextfield()== null) || (dynamicTemplatePojo.getTextfield().trim().equals(""))) {
                System.out.println("numericfield in validation");
                map.put("textfield", "This field is required");
            }
            else if(!dynamicTemplatePojo.getTextfield().matches(num))
            {
                 System.out.println("regex didn't match for numericfield");
                 map.put("textfield", "Field should be Numeric");
            }
//            if ((dynamicTemplatePojo.getCurrencyfield() == null) || (dynamicTemplatePojo.getCurrencyfield().trim().equals(""))) {
//                System.out.println("::::::::::::6");
//                map.put("currencyfield", "This field is required");
//            } 
//            if ((dynamicTemplatePojo.getFilefield() == null) || (dynamicTemplatePojo.getFilefield().trim().equals(""))) {
//                map.put("filefield", "This field is required");
//            }
             if (map.size() >= 1)
            {
                 String result = gson.toJson(map);
                System.out.println("response "+result);
                gsonUtility.writeData(result);
                return result;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String result="Noerror";
    return result;
    }
}

