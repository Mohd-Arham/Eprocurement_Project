
package com.eproc.model;
import com.eproc.domain.ContractorDetails;
import com.eproc.domain.ContractorOrganizationType;
import com.eproc.util.GsonUtility;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class ContractorDetailsModel  {
    @Autowired
    GsonUtility gsonUtility;
    Gson gson = new Gson();
 
 public String checkValidation(ContractorDetails contractorDetails, @RequestParam String step,String contrctorType,Integer contOtherId) {
        System.out.println("-----------------checkValidation Method is run------------------------");
//        System.out.println("contractor detail is:" + contractorDetails.getContractor());
        Map map = new HashMap();
        int index = 0;
//        =(String) session.getAttribute("contractortype");
        System.out.println("step of wizard is:" + step);
       Pattern Regno = Pattern.compile("^(([a-zA-Z0-9]+$))", Pattern.CASE_INSENSITIVE);
       Pattern PANno = Pattern.compile("^([A-Za-z]{5}[0-9]{4}[A-Za-z]{1})$", Pattern.CASE_INSENSITIVE);
       Pattern GISTNno = Pattern.compile("^([0-9]{2}[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}[0-9]{1}[Z][0-9]{1})$", Pattern.CASE_INSENSITIVE);
       Pattern address = Pattern.compile("^([A-Za-z0-9\\s,-_ ]+$)", Pattern.CASE_INSENSITIVE);
       Pattern pincode = Pattern.compile("^([1-9][0-9]{5})$", Pattern.CASE_INSENSITIVE);
       Pattern aadharNo = Pattern.compile("^([0-9]{12})$", Pattern.CASE_INSENSITIVE);
       Pattern mobileNo = Pattern.compile("^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$", Pattern.CASE_INSENSITIVE);
       Pattern webSite = Pattern.compile("^(http:\\/\\/|https:\\/\\/)?(www.)?([a-zA-Z0-9]+).[a-zA-Z0-9]*.[a-z]{3}.?([a-z]+)?$", Pattern.CASE_INSENSITIVE); 
       Pattern name = Pattern.compile("^(([a-zA-Z ]+$))", Pattern.CASE_INSENSITIVE);
       Pattern din = Pattern.compile("^([0-9]{8})$", Pattern.CASE_INSENSITIVE);
        Pattern tinRegex = Pattern.compile("[0-9]{3}\\-[0-9]{2}\\-[0-9]{4}$", Pattern.CASE_INSENSITIVE);
                   
                 
        //Integer contOtherId = (Integer) session.getAttribute("contOtherId");
        //   ContractorDetails contractorDetailsFetch = contractor_detailsdaoImpl.fetchData(contOtherId);
        try {
           //check validation for step 1
            if (step.equalsIgnoreCase("step1")) {
                
                if(contrctorType.equalsIgnoreCase("foreign")){
                  if ((contractorDetails.getForeignOrgName() == null) || (contractorDetails.getForeignOrgName().trim().equals(""))) {
                    map.put("foreignOrgName", "Name of Organization is Required");
                }
                    if ((contractorDetails.getForeignfName()== null) || (contractorDetails.getForeignfName().trim().equals(""))) {
                    map.put("ForeignfName", "First Name is Required");
                }
                      if ((contractorDetails.getForeignlName()== null) || (contractorDetails.getForeignlName().trim().equals(""))) {
                    map.put("ForeignlName", "Last Name is Required");
                }
                  if (!(name.matcher(contractorDetails.getForeignOrgName()).matches()) && !contractorDetails.getForeignOrgName().equals("")) {
                map.put("foreignOrgName", "Please Enter Valid Organization Name ");
                   }
                  
               if ((contractorDetails.getForeignRegno() == null) || (contractorDetails.getForeignRegno().trim().equals(""))) {
                    map.put("foreignRegno", "Registration number is Required");
                }
           
                 if (!(Regno.matcher(contractorDetails.getForeignRegno()).matches()) && !contractorDetails.getForeignRegno().equals("")) {
                  map.put("foreignRegno", "Enter only alphabates and number");
                 }   
              
              if ((contractorDetails.getForeignAddress() == null) || (contractorDetails.getForeignAddress().trim().equals(""))) {
                    map.put("foreignAddress", "Address is Required");
                }
                if (!(address.matcher(contractorDetails.getForeignAddress()).matches()) && !contractorDetails.getForeignAddress().equals("")) {
                map.put("foreignAddress", "Enter Valid Address");
                   }
               if ((contractorDetails.getCountry()== null) || (contractorDetails.getCountry().equals(""))) {
                    map.put("country", "Country is Required");
                }
                if ((contractorDetails.getForeignState()== null) || (contractorDetails.getForeignState().equals("-1"))) {
                    map.put("foreignState", "State is Required");
                }
                 if ((contractorDetails.getForeignCity() == null) || (contractorDetails.getForeignCity().equals("-1"))) {
                    map.put("foreignCity", "City is Required");
                }
                 if ((contractorDetails.getForeignPincode() == null) || (contractorDetails.getForeignPincode().trim().equals(""))) {
                    map.put("foreignPincode", "Pincode is Required");
                }
                  if (!(pincode.matcher(contractorDetails.getForeignPincode()).matches()) && !contractorDetails.getForeignPincode().equals("")) {
                  map.put("foreignPincode", "Enter Valid Pincode");
                    }
              
                 if ((contractorDetails.getForeignemail()== null) || (contractorDetails.getForeignemail().trim().equals(""))) {
                    map.put("foreignemail", "Email is Required");
                }
                  if ((contractorDetails.getForeignContact1()== null) || (contractorDetails.getForeignContact1().trim().equals(""))) {
                    map.put("foreignContact1", "Contact is Required");
                }
                   if (!(mobileNo.matcher(contractorDetails.getForeignContact2()).matches()) && !contractorDetails.getForeignContact2().equals("")) {
                  map.put("foreignContact2", "Please Enter Valid Contact Number");
                   }
                  
                   if ((contractorDetails.getForeignTINNo()== null) || (contractorDetails.getForeignTINNo().trim().equals(""))) {
                    map.put("foreignTINNo", "TIN number is Required");
                }
                    if (!(tinRegex.matcher(contractorDetails.getForeignTINNo()).matches()) && !contractorDetails.getForeignTINNo().equals("")) {
                  map.put("foreignTINNo", "Please Enter Valid TIN Number");
                   }
                  if(contOtherId == 0){
                      if ((contractorDetails.getForeignRegDoc() == null) || (contractorDetails.getForeignRegDoc().equals(""))) {
                    map.put("foreignRegDoc", "Registration Certificate is Required");
                }
                    
                      if ((contractorDetails.getForeignTINDoc() == null) || (contractorDetails.getForeignTINDoc().equals(""))) {
                    map.put("foreignTINDoc", "TIN Certificate is Required");
                }
                  }
                    
//                    if ((contractorDetails.getForeignRegDoc()== null) || (contractorDetails.getForeignRegDoc().equals(""))) {
//                    map.put("foreignRegDocName", "Registration Certificate is Required");
//                }
//                     if ((contractorDetails.getForeignTINDoc()== null) || (contractorDetails.getForeignTINDoc().equals(""))) {
//                    map.put("foreignTINDocName", "TIN Certificate is Required");
//                }
                }
              }
            //Check validation for step 2
            if (step.equalsIgnoreCase("step2")) {
                if ((contractorDetails.getIndianOrgName() == null) || (contractorDetails.getIndianOrgName().trim().equals(""))) {
                    map.put("indianOrgName", "Name of Organization is Required");
                }
                 if (!(name.matcher(contractorDetails.getIndianOrgName()).matches()) && !contractorDetails.getIndianOrgName().equals("")) {
                map.put("indianOrgName", "Please Enter Valid Organization Name ");
                   }
                 if ((contractorDetails.getAgentRegno() == null) || (contractorDetails.getAgentRegno().trim().equals(""))) {
                    map.put("agentRegno", "Registration number is Required");
                }
                 
                if (!(Regno.matcher(contractorDetails.getAgentRegno()).matches()) && !contractorDetails.getAgentRegno().equals("")) {
                map.put("agentRegno", "Enter Valid Registration Number");
                   }
                 
              if ((contractorDetails.getAgentAddress() == null) || (contractorDetails.getAgentAddress().trim().equals(""))) {
                    map.put("agentAddress", "Address is Required");
                }
              
              if (!(address.matcher(contractorDetails.getAgentAddress()).matches()) && !contractorDetails.getAgentAddress().equals("")) {
                map.put("agentAddress", "Enter Valid Address");
                   }
              
              
               if ((contractorDetails.getAgentState()== null) || (contractorDetails.getAgentState().equals(""))) {
                    map.put("agentState", "State is Required");
                }
               
                if ((contractorDetails.getAgentCity() == null) || (contractorDetails.getAgentCity().equals("-1"))) {
                    map.put("agentCity", "City is Required");
                }
                 if ((contractorDetails.getAgentPincode() == null) || (contractorDetails.getAgentPincode().trim().equals(""))) {
                    map.put("agentPincode", "Pincode is Required");
                }
                 if (!(pincode.matcher(contractorDetails.getAgentPincode()).matches()) && !contractorDetails.getAgentPincode().equals("")) {
                  map.put("agentPincode", "Enter Valid Pincode");
                    }
                
                  if (!(webSite.matcher(contractorDetails.getAgentWebsite()).matches()) && !contractorDetails.getAgentWebsite().equals("")) {
                  map.put("agentWebsite", "Please Enter Valid Website");
                    }
                  if ((contractorDetails.getAgentemail()== null) || (contractorDetails.getAgentemail().trim().equals(""))) {
                    map.put("agentemail", "Email is Required");
                }
                  if ((contractorDetails.getAgentContact1()== null) || (contractorDetails.getAgentContact1().trim().equals(""))) {
                    map.put("agentContact1", "Contact is Required");
                }
                 if (!(mobileNo.matcher(contractorDetails.getAgentContact2()).matches()) && !contractorDetails.getAgentContact2().equals("")) {
                  map.put("agentContact2", "Please Enter Valid Contact Number");
                   }
                  if ((contractorDetails.getOrgPAN()== null) || (contractorDetails.getOrgPAN().trim().equals(""))) {
                   map.put("orgPAN", "Organization PAN is Required");
                }
                  if (!(PANno.matcher(contractorDetails.getOrgPAN()).matches()) && !contractorDetails.getOrgPAN().equals("")) {
                  map.put("orgPAN", "Please Enter Valid PAN Number");
                    }
                if (!contractorDetails.getOrgPAN().equals("") && !contractorDetails.getGistnNo().equals("")) {
                   String gistnSubStr=contractorDetails.getGistnNo().substring(2,12);
                   System.out.println("Gistn number after substring is:  "+gistnSubStr);
                   if(!gistnSubStr.equalsIgnoreCase(contractorDetails.getOrgPAN())){
                      map.put("orgPAN", "Organization PAN is not matched with GISTN Number");   
                    }
                  } 
//                if (!(aadharNo.matcher(contractorDetails.getComAadharNo()).matches()) && !contractorDetails.getComAadharNo().equals("")) {
//                  map.put("comAadharNo", "Please Enter 111111Valid Aadhar Number");
//                   }
                if ((contractorDetails.getContOrganization()== null) || (contractorDetails.getContOrganization().equals(""))) {
                    map.put("contOrganization", "Type of Organization is Required");
                }
                  if ((contractorDetails.getContCompanyType()== null) || (contractorDetails.getContCompanyType().equals(""))) {
                    map.put("contCompanyType", "Statutory bodies is Required");
                }
                    if ((contractorDetails.getSocialCategory()== null) || (contractorDetails.getSocialCategory().equals(""))) {
                    map.put("socialCategory", "Social Category is Required");
                }
                    if ((contractorDetails.getContractorClass()== null) || (contractorDetails.getContractorClass().equals(""))) {
                    map.put("contractorClass", "Contractor Class Name is Required");
                }
//                if ((contractorDetails.getAgentRegDoc()== null) || (contractorDetails.getAgentRegDoc().equals(""))) {
//                    map.put("agentRegDocName", "Registration Certificate is Required");
//                }
//                 if ((contractorDetails.getAgentPANDoc()== null) || (contractorDetails.getAgentPANDoc().equals(""))) {
//                    map.put("agentPANDocName", "PAN Card is Required");
//                }
             }
            if(step.equalsIgnoreCase("step3")){
           if ((contractorDetails.getContOrganization().equalsIgnoreCase("4")) || (contractorDetails.getContOrganization().equalsIgnoreCase("5")|| (contractorDetails.getContOrganization().equalsIgnoreCase("6")))) 
           {
              if((contractorDetails.getContApplication()!=null)&& (contractorDetails.getContApplication().size()>0)){
              for (ContractorOrganizationType contApplication : contractorDetails.getContApplication()){
               int x=index++;
               System.out.println("Current indexing is:"+x);
                
            if((contApplication.getShAadharNo()==null) || (contApplication.getShAadharNo().trim().equals(""))){
              map.put("shAadharNo"+x,"Please Enter Aadhar No.");
              }  
              if (!(aadharNo.matcher(contApplication.getShAadharNo()).matches()) && !contApplication.getShAadharNo().equals("")) {
                  map.put("shAadharNo"+x, "Please Enter Valid Aadhar Number");
                   }
              if((contApplication.getShDirName()==null) || (contApplication.getShDirName().trim().equals(""))){
              map.put("shDirName"+x,"Please Enter Director Name");
                 }
               if (!(name.matcher(contApplication.getShDirName()).matches()) && !contApplication.getShDirName().equals("")) {
                map.put("shDirName"+x, "Please Enter Alphabets Only");
                   }
               if((contApplication.getShMobNo()==null)||(contApplication.getShMobNo().trim().equals(""))){
              map.put("shMobNo"+x,"Please Enter Mobile Number");
         }
               if (!(mobileNo.matcher(contApplication.getShMobNo()).matches()) && !contApplication.getShMobNo().equals("")) {
                  map.put("shMobNo"+x, "Please Enter Valid Mobile Number");
                   }
              if((contApplication.getShPANNo()==null)||(contApplication.getShPANNo().trim().equals(""))){
               map.put("shPANNo"+x,"Please Enter PAN Number");
           }
               if (!(PANno.matcher(contApplication.getShPANNo()).matches()) && !contApplication.getShPANNo().equals("")) {
                  map.put("shPANNo"+x, "Please Enter Valid PAN Number");
                    }
               if((contApplication.getDinNo()==null)||(contApplication.getDinNo().trim().equals(""))){
              map.put("dinNo"+x,"Please Enter DIN Number");
               }
               if (!(din.matcher(contApplication.getDinNo()).matches()) && !contApplication.getDinNo().equals("")) {
                  map.put("dinNo"+x, "Please Enter Valid DIN Number");
                    }
               
             }
             }       
           }
           if ((contractorDetails.getContOrganization().equalsIgnoreCase("7"))) {
             int x=index++;
             System.out.println("Current indexing is:"+x);
//             if((contractorDetails.getContApplication()==null) || (contractorDetails.getContApplication().isEmpty())){
//             map.put("contApplication","Please enter Partnership details");
//             }  
             if((contractorDetails.getContApplication()!=null) && (contractorDetails.getContApplication().size()>0)){
              for (ContractorOrganizationType contApplication : contractorDetails.getContApplication()){
              if((contApplication.getPtnrPop()==null) || (contApplication.getPtnrPop().trim().equals(""))){
              map.put("ptnrPop"+x,"Please enter Percentage in firm");
              }
            if((contApplication.getPtnrName()==null) || (contApplication.getPtnrName().trim().equals(""))){
             map.put("ptnrName"+x,"Please enter Partner Name");
         }
             if (!(name.matcher(contApplication.getPtnrName()).matches()) && !contApplication.getPtnrName().equals("")) {
                map.put("ptnrName"+x, "Please Enter Alphabets Only ");
                   }
            if((contApplication.getPtnrMobNo()==null)||(contApplication.getPtnrMobNo().trim().equals(""))){
            map.put("ptnrMobNo"+x,"Please Enter Mobile Number");
         }
            if (!(mobileNo.matcher(contApplication.getPtnrMobNo()).matches()) && !contApplication.getPtnrMobNo().equals("")) {
                  map.put("ptnrMobNo"+x, "Please Enter Valid Mobile Number");
                   }
             if((contApplication.getPtnrAadharNo()==null)||(contApplication.getPtnrAadharNo().trim().equals(""))){
             map.put("ptnrAadharNo"+x,"Please Enter Aadhar Number");
              }
              if (!(aadharNo.matcher(contApplication.getPtnrAadharNo()).matches()) && !contApplication.getPtnrAadharNo().equals("")) {
                  map.put("ptnrAadharNo"+x, "Please Enter Valid Aadhar Number");
                   }
           if((contApplication.getPtnrPANNo()==null)||(contApplication.getPtnrPANNo().trim().equals(""))){
             map.put("ptnrPANNo"+x,"Please Enter PAN Number");
              }
           if (!(PANno.matcher(contApplication.getPtnrPANNo()).matches()) && !contApplication.getPtnrPANNo().equals("")) {
                  map.put("ptnrPANNo"+x, "Please Enter Valid PAN Number");
                    }
             }
            }
           }
          }
               if (map.size() >= 1) {
                System.out.println("map validation is:" + gson.toJson(map));
                return gson.toJson(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Class:ContractorDetailsController and Method:checkValidation ");
        }
        System.out.println("------------------checkValidation Method is end-------------------");
        return "done";
    }

 
 
}

