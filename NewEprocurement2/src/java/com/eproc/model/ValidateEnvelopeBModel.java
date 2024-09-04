/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.daoImpl.TenderEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderEnvelopeBDaoImpl;
import com.eproc.domain.DynamicTemplatePojo;
import com.eproc.domain.TenderEnvelopeA;
import com.eproc.domain.TenderEnvelopeB;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Vaishali Gupta
 */@Component
public class ValidateEnvelopeBModel {
       @Autowired
    GsonUtility gsonUtility;
     
     @Autowired
     TenderEnvelopeBDaoImpl tenderEnvelopeBDaoImpl;

    public String validate(DynamicTemplatePojo dynamicTemplatePojo,HttpSession session) throws Exception {
        System.out.println("start Calling class Template Model  validate");
          Map<String,String> mapForValidation = new LinkedHashMap<>();
       
        List<TenderEnvelopeB> tenderEnvelopeBList = new ArrayList<>();
       
        String textfield2 = "^[a-zA-Z ]+$";
        Pattern textPattern = Pattern.compile("[A-Za-z ]+",Pattern.CASE_INSENSITIVE);
        Pattern numberPattern = Pattern.compile("[0-9 ]+",Pattern.CASE_INSENSITIVE);
        Pattern alphaNumericPattern = Pattern.compile("^(([a-zA-Z0-9 ]+$))",Pattern.CASE_INSENSITIVE);
        int EnvelopeBId=0;
        String response="";
        int theIndex=0;
       
       
      try {
              
              EnvelopeBId = (int) session.getAttribute("envelopeAId");
            if (EnvelopeBId != 0) {

                tenderEnvelopeBList = tenderEnvelopeBDaoImpl.readAll(EnvelopeBId);
             for (DynamicTemplatePojo dynamicTemplatePojo1 : dynamicTemplatePojo.getDatalist()) {
                    theIndex = dynamicTemplatePojo.getDatalist().indexOf(dynamicTemplatePojo1);
                    System.out.println(" index " + theIndex);
                 
                 String textfield=dynamicTemplatePojo1.getTextfield();
                  String labelName=tenderEnvelopeBList.get(theIndex).getLabelNameA();
                  System.out.println("theIndex type "+tenderEnvelopeBList.get(theIndex).getLabelTypeA());
                  System.out.println("theIndex label "+labelName);
                  System.out.println("theIndex value "+textfield);
              
                  
                  
                  if (tenderEnvelopeBList.get(theIndex).getLabelTypeA().equals("1")) {
               
                        if(textfield.equals(null) ||textfield.equals("")
                                && tenderEnvelopeBList.get(theIndex).getLabelMandatoryA().equals("true") ){
                          
                      
                          mapForValidation.put(labelName+"Error", labelName+" is required");
                        }else if(!textPattern.matcher(dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield()).matches() && !dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield().isEmpty()){
                        
                         mapForValidation.put(labelName+"Error", "Enter Only alphabates");
                        
                        }
                     
                    } else if (tenderEnvelopeBList.get(theIndex).getLabelTypeA().equals("2")) {
                        
              
                         if(textfield.equals(null) ||textfield.equals("")
                                && tenderEnvelopeBList.get(theIndex).getLabelMandatoryA().equals("true")){
                           
                       
                          mapForValidation.put(labelName+"Error", labelName+" is required");
                          
                          
                         }else if(!numberPattern.matcher(dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield()).matches() && !dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield().isEmpty()){
                         
                             mapForValidation.put(labelName+"Error", "Enter Only alphabates");
                         
                         }
                      
                    } else if (tenderEnvelopeBList.get(theIndex).getLabelTypeA().equals("3")) {
                        
                        if(dynamicTemplatePojo1.getFileFlag().equals("")|| dynamicTemplatePojo1.getFileFlag().equals(null) && dynamicTemplatePojo1.getFiles().getSize()<=0){
                        
                            mapForValidation.put(labelName+"Error", labelName+" is required");
                        
                        }
                        
                         } else if (tenderEnvelopeBList.get(theIndex).getLabelTypeA().equals("4")) {
                      
                   if(textfield.equals(null) ||textfield.equals("")
                                && tenderEnvelopeBList.get(theIndex).getLabelMandatoryA().equals("true")){
                        
                         mapForValidation.put(labelName+"Error", labelName+" is required");
                         
                         }else if(!numberPattern.matcher(dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield()).matches() && !dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield().isEmpty()){
                             mapForValidation.put(labelName+"Error", "Enter Only alphabates");
                         
                         }
                    }
            }        
                  if (mapForValidation.size() >= 1)
            {
                
                 System.out.println("VALIDATION "+mapForValidation);
                 Gson gson = new Gson();
                 response = gson.toJson(mapForValidation);

//             gsonUtility.writeData(response);
               gsonUtility.responseData(response);
               return response;  
                
            }
            }    
                
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       
    return "noError";
    }
}
