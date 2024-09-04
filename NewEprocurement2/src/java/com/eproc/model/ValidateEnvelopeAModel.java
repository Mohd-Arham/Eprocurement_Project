/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.daoImpl.TenderEnvelopeADaoImpl;
import com.eproc.domain.DynamicTemplatePojo;
import com.eproc.domain.EnvelopeAData;
import com.eproc.domain.TenderEnvelopeA;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.util.FileUtility;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Vaishali Gupta
 */
@Component
public class ValidateEnvelopeAModel {
     @Autowired
    GsonUtility gsonUtility;
     
     @Autowired
     TenderEnvelopeADaoImpl tenderEnvelopeADaoImpl;

    public String validate(DynamicTemplatePojo dynamicTemplatePojo,HttpSession session)  {
        System.out.println("start Calling class ValidateEnvelopeAModel validate");
        System.out.println("T&C  validate "+dynamicTemplatePojo.getTerms());
          Map<String,String> mapForValidation = new LinkedHashMap<>();
       
        List<TenderEnvelopeA> tenderEnvelopeAList = new ArrayList<>();
       
        String textfield2 = "^[a-zA-Z ]+$";
        Pattern textPattern = Pattern.compile("[A-Za-z ]+",Pattern.CASE_INSENSITIVE);
        Pattern numberPattern = Pattern.compile("[0-9 ]+",Pattern.CASE_INSENSITIVE);
        Pattern alphaNumericPattern = Pattern.compile("^(([a-zA-Z0-9 ]+$))",Pattern.CASE_INSENSITIVE);
        int EnvelopeAId=0;
         int theIndex = 0;
         int theIndexforFile = 0;
        try {
              
            
            
            EnvelopeAId = (int) session.getAttribute("envelopeAId");
            if (EnvelopeAId != 0) {

                tenderEnvelopeAList = tenderEnvelopeADaoImpl.readAll(EnvelopeAId);
                
                
             
               
             for (DynamicTemplatePojo dynamicTemplatePojo1 : dynamicTemplatePojo.getDatalist()) {
                    theIndex = dynamicTemplatePojo.getDatalist().indexOf(dynamicTemplatePojo1);
                    System.out.println(" index " + theIndex);
                 
                
                  String textfield=dynamicTemplatePojo1.getTextfield();
                  String labelName=tenderEnvelopeAList.get(theIndex).getLabelNameA();
                  System.out.println("theIndex type "+tenderEnvelopeAList.get(theIndex).getLabelTypeA());
                  System.out.println("theIndex label "+labelName);
                  System.out.println("theIndex value "+textfield);
                  System.out.println("theIndex file "+dynamicTemplatePojo1.getFiles().getOriginalFilename());
                  
                  
                  if (tenderEnvelopeAList.get(theIndex).getLabelTypeA().equals("1")) {
               
                        if(textfield.equals(null) ||textfield.equals("")
                                && tenderEnvelopeAList.get(theIndex).getLabelMandatoryA().equals("true") ){
                          
                      
                          mapForValidation.put(labelName+"Error", labelName+" is required");
                        }else if(!textPattern.matcher(dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield()).matches() && !dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield().isEmpty()){
                        
                         mapForValidation.put(labelName+"Error", "Enter Only alphabates");
                        
                        }
                     
                    } else if (tenderEnvelopeAList.get(theIndex).getLabelTypeA().equals("2")) {
                         if(textfield.equals(null) ||textfield.equals("")
                                && tenderEnvelopeAList.get(theIndex).getLabelMandatoryA().equals("true")){
                          mapForValidation.put(labelName+"Error", labelName+" is required");
                         }else if(!numberPattern.matcher(dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield()).matches() && !dynamicTemplatePojo.getDatalist().get(theIndex).getTextfield().isEmpty()){
                             mapForValidation.put(labelName+"Error", "Enter Only alphabates");
                          }
                      } else if (tenderEnvelopeAList.get(theIndex).getLabelTypeA().equals("3")) {
                       if(dynamicTemplatePojo1.getFileFlag().equals("")|| dynamicTemplatePojo1.getFileFlag().equals(null) && dynamicTemplatePojo1.getFiles().getSize()<=0){
                           mapForValidation.put(labelName+"Error", labelName+" is required");
                        }
                     } else if (tenderEnvelopeAList.get(theIndex).getLabelTypeA().equals("4")) {
                      
                             if(textfield.equals(null) ||textfield.equals("")
                                && tenderEnvelopeAList.get(theIndex).getLabelMandatoryA().equals("true")){
                        
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
           String response = gson.toJson(mapForValidation);

//             gsonUtility.writeData(response);
               gsonUtility.responseData(response);

                  
                return response;  
                
            }else {
            if(dynamicTemplatePojo.getTerms()==null){
                    
           String response = "Please Accept T&C.";

               gsonUtility.responseData(response);
                return response;  
                
            }
            
            }
            }    
                
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       
    return "noError";
    }
}
