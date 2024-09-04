/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.model;

import com.eproc.dao.TenderDao;
import com.eproc.domain.Tender;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Gaurav Dubey
 */
@Component
public class TenderModel implements Validator{

    @Autowired
    TenderDao tenderDao;
    
    @Override
    public boolean supports(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validate(Object o, Errors errors) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Map<String, String> validatingTender(Tender tender, String step){
        Map<String, String> tenders = new HashMap<>();
        Calendar cal = Calendar.getInstance(); 
        System.out.println("The time in millisecond: "+cal.getTimeInMillis());
        System.out.println("The Step is: "+step);
        try{
            tenders.clear();
            if("step1".equalsIgnoreCase(step)){
                    System.out.println("Inside the step 1 of wizard");
                    System.out.println("The Tender Nit Number: "+tender.getNitNumber());
                    if(tender.getNitNumber() == null || tender.getNitNumber() == ""){
                        System.out.println("The Nit Number validation call");
                        tenders.put("tenderNitNumberError", "Please Mention NIT Number");
                    }else{
                        tenders.put("tenderNitNumberError", "");  
                    }
                    System.out.println("The Tender NIT Date: "+tender.getNitDate());
                    if(tender.getNitDate() == null || tender.getNitDate() == ""){
                        System.out.println("The Nit Date validation call");
                        tenders.put("tenderNitDateError", "Please Mention NIT Date");
                    }else{
                        tenders.put("tenderNitDateError", "");  
                    }
            }
            if("step2".equalsIgnoreCase(step)){
                    System.out.println("Inside the step2 of wizard");
                    System.out.println("The Tender Stage is: "+tender.getTenderStage());
                    if(tender.getTenderStage().equalsIgnoreCase("0")){
                        System.out.println("The Tender Stage Validation call");
                        tenders.put("tenderStageError", "Please Select Tender Stage");
                    }else{
                        System.out.println("The Tender Stage Validation not call");
                        tenders.put("tenderStageError", "");
                    }
                    System.out.println("The Selective Tenderer is: "+tender.getSelectiveTender());
                    if(tender.getSelectiveTender().equalsIgnoreCase("0")){
                        System.out.println("The Selective Tenderer Validation call");
                        tenders.put("selectiveTendererError", "Please Select Selective Tenderer");
                        
                    }else{
                        System.out.println("The Selective Tenderer Validation not call");
                        tenders.put("selectiveTendererError", "");
                    }
                    System.out.println("The Tender Category is: "+tender.getSelectiveTender());
                    if(tender.getSelectiveTender().equalsIgnoreCase("0")){
                        System.out.println("The Tender Category Validation call");
                        tenders.put("tenderCategoryError", "Please Select Tender Category");
                    }else{
                        tenders.put("tenderCategoryError", "");
                    }
                    System.out.println("The Area of work is: "+tender.getAreaOfWork());
                    if(tender.getAreaOfWork().equalsIgnoreCase("0")){
                        System.out.println("The Area of work Validation call");
                        tenders.put("areaOfWorkError", "Please Select Area of Work");
                    }else{
                        tenders.put("areaOfWorkError", "");
                    }
                    System.out.println("The Keywords is: "+tender.getTenderKeywords());
                    if(tender.getTenderKeywords() == null){
                        System.out.println("The Keywords Validation call");
                        tenders.put("keywordsError", "Please Select Keywords");
                    }else{
                        tenders.put("keywordsError", "");
                    }
                    System.out.println("The SOR Documents: "+tender.getSorDocument());
                    if(tender.getTenderCategory().equalsIgnoreCase("1") || 
                            tender.getTenderCategory().equalsIgnoreCase("3")){
                        if(tender.getSorDocument().equalsIgnoreCase("0")){
                           System.out.println("The SOR Documents Validation call");
                           tenders.put("sorDocumentError", "Please Select SOR Documents"); 
                        }else{
                           tenders.put("sorDocumentError", "");
                        }
                    }
            }
             if("step3".equalsIgnoreCase(step)){
                 System.out.println("The Name of Work: "+tender.getNameOfWork());
                 if(tender.getNameOfWork() == null || tender.getNameOfWork() == ""){
                     System.out.println("The Name of Work Validation call");
                     tenders.put("nameOfWorkError", "Please Mention Name of Work");
                 }else{
                     tenders.put("nameOfWorkError", "");
                 }
                 System.out.println("The Description of tender: "+tender.getDescriptionOfWork());
                 if(tender.getDescriptionOfWork() == null || tender.getDescriptionOfWork() == ""){
                     System.out.println("The Description About work: "+tender.getDescriptionOfWork());
                     tenders.put("descriptionError", "Please Mention Description of Tender");
                 }else{
                     tenders.put("descriptionError", "");
                 }
                 System.out.println("The Estimate Value of tender is: "+tender.getEstimateValueInFig());
                 if(tender.getEstimateValueInFig() == null || tender.getEstimateValueInFig() == ""){
                     tenders.put("estimateValueError", "Please Mention Estimate Value");
                 }else{
                     tenders.put("estimateValueError", "");
                 }
                 System.out.println("The Tender Fee is: "+tender.getTenderFeeInFig());
                 if(tender.getTenderFeeInFig() == null || tender.getTenderFeeInFig() == ""){
                     tenders.put("tenderFeeError", "Please Mention Tender Fee");
                 }else{
                     tenders.put("tenderFeeError", "");
                 }
                 System.out.println("The Bid Validate Type: "+tender.getBidValidateType());
                 if(tender.getBidValidateType().equalsIgnoreCase("0")){
                     tenders.put("bidValidateTypeError", "Please Select Bid Validate Type");
                 }else{
                     tenders.put("bidValidateTypeError", "");
                 }
                 System.out.println("The Bid Validate Period: "+tender.getBidValidatePeriod());
                 if(tender.getBidValidatePeriod() == null || tender.getBidValidatePeriod() == ""){
                     tenders.put("bidValidatePeriodError", "Please Mention Bid Validate Period");
                 }else{
                     tenders.put("bidValidatePeriodError", "");
                 }
                 System.out.println("The Work Completion Type: "+tender.getWorkCompletionType());
                 if(tender.getWorkCompletionType().equalsIgnoreCase("0")){
                     tenders.put("workCompletionTypeError", "Please Select Work Completion Type");
                 }else{
                     tenders.put("workCompletionTypeError", ""); 
                 }
                 System.out.println("The Work Completion Period: "+tender.getWorkCompletionPeriod());
                 if(tender.getWorkCompletionPeriod() == null || tender.getWorkCompletionPeriod() == ""){
                     tenders.put("workCompletionPeriodError", "Please Mention Work Completion Period");
                 }else{
                     tenders.put("workCompletionPeriodError", "");
                 }
                 System.out.println("The Rainy Season: "+tender.getRainySeason());
                 if(tender.getRainySeason() == null || tender.getRainySeason() == ""){
                     tenders.put("rainySeasonError", "Please Select Rainy Season Period");
                 }else{
                     tenders.put("rainySeasonError", "");
                 }
             }
             if("step4".equalsIgnoreCase(step)){
                 System.out.println("The Envelope Type: "+tender.getEnvelopeType());
                 if(tender.getEnvelopeType().equalsIgnoreCase("0")){
                     tenders.put("envelopeTypeError", "Please Select Envelope Type");
                 }else{
                     tenders.put("envelopeTypeError", "");
                 }
                 System.out.println("The Contractor Class: "+tender.getContractorClass());
                 if(tender.getContractorClass().equalsIgnoreCase("0")){
                     tenders.put("contractorClassError", "Please Select Contractor Class");
                 }else{
                     tenders.put("contractorClassError", "");
                 }
                 System.out.println("The Type of Tender: "+tender.getTypeOfTender());
                 if(tender.getTypeOfTender().equalsIgnoreCase("0")){
                     tenders.put("typeOfTendersError", "Please Select Type Of Tender");
                 }else{
                     tenders.put("typeOfTendersError", "");
                 }
             }
//                 System.out.println("The EMD Applicable: "+tender.getEmdApplicable());
//                 if(tender.getEmdApplicable() == null || tender.getEmdApplicable() == ""){
//                     tenders.put("emdApplicableError", "Please Select EMD Applicable");
//                 }else{
//                     tenders.put("emdApplicableError", "");
//                 }
//                 System.out.println("The EMD Applicable: "+tender.getEmdInFig());
//                 if(tender.getEmdInFig() == null || tender.getEmdInFig() == ""){
//                     tenders.put("emdInFigError", "Please Mention EMD");
//                 }else{
//                     tenders.put("emdInFigError", "");
//                 }
             

        }catch(Exception ex){
            ex.printStackTrace();
        }
        return tenders;
    }
    
    
    public boolean chechTenderNumberExistence(String tenderNumber){
        boolean existence = false;
        try{
         existence = tenderDao.checkTenderNumber(tenderNumber);
            System.out.println("The Tender Number existence is: "+existence);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return existence;
    }
}
