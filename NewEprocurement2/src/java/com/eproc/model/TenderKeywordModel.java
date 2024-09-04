package com.eproc.model;

import com.eproc.domain.TenderKeyword;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Naina Jain
 */
@Component
public class TenderKeywordModel {
    
 public String validate(TenderKeyword addkeywords) {
     System.out.println("**************Calling class AreaOfWorkModel it's method validate***************");
        System.out.println("### addkeywords Tender_category_id ###" + addkeywords.getTender_category_id());
        System.out.println("### addkeywords Tender_category_name ###" + addkeywords.getTender_category_name());
        System.out.println("### addkeywords area of work id ###" + addkeywords.getAreaofwork_id());
        System.out.println("### addkeywords area of work name ###" + addkeywords.getAreaofwork_name());
        System.out.println("### addkeywords keyword id ###" + addkeywords.getTenderKeyWordsId());
        System.out.println("### addkeywords keyword name ###" + addkeywords.getTenderKeyWordsName());

        Map map = new HashMap();
        Gson gson = new Gson();
        try {

            if (addkeywords.getTender_category_id() == null) {
                System.out.println("::::::::::::1");
                map.put("tender_category_idError1", "Please Select Tender Category");
            }
            if ((addkeywords.getAreaofwork_id() == -1)) {
                System.out.println("::::::::::::2");
                map.put("areaofwork_idError1", "Please Select Area Of Work");
            }
            if (addkeywords.getTenderKeyWordsName() == "") {
                System.out.println("::::::::::::3");
                map.put("tenderKeyWordsNameError1", "Please Enter Tender Keyword");
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
