/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.serviceImpl;

import com.eproc.dto.AadhaarOtpVerifyDto;
import com.eproc.dto.AadhaarVerificationDto;
import com.eproc.dto.GstVerificationDto;
import com.eproc.dto.MerchantGstResponse;
import com.eproc.dto.PanVerificationDto;
import com.eproc.dto.response.AadharResponseDto;
import com.eproc.dto.response.GstResponse;
import com.eproc.dto.response.MerchantAadharResponse;
import com.eproc.dto.response.PanCardResponse;
import com.eproc.dto.response.ResponseModel;
import com.eproc.service.EKycService;
import com.google.gson.Gson;
import com.itextpdf.text.log.LoggerFactory;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Lincpay
 */
@Service
public class EKycServiceImpl implements EKycService {

    @Value("${ekyc.pan}")
    private String panUrl;

    @Value("${ekyc.gst}")
    private String gstUrl;

    @Value("${ekyc.aadhaar}")
    private String aadharUrl;

    @Value("${ekyc.aadhaarotp}")
    private String aadhaarOtpUrl;

    @Value("${ekyc.apikey}")
    private String apiKey;

    @Value("${ekyc.secreteKey}")
    private String secreteKey;

    private RestTemplate template = new RestTemplate();

    @Override
    public ResponseModel verifyPan(PanVerificationDto panDto) {
        Map<String, String> jsonMap = new HashMap<>();
        jsonMap.put("apikey", apiKey);
        jsonMap.put("secrete", secreteKey);
        jsonMap.put("panNumber", panDto.getPanNumber());

        HttpHeaders headers = new HttpHeaders();
        Gson gson = new Gson();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String json = gson.toJson(jsonMap);
        HttpEntity<String> httpEntity = new HttpEntity<>(json, headers);

        String object = template.postForObject(panUrl, httpEntity, String.class);
        PanCardResponse panHolder = gson.fromJson(object, PanCardResponse.class);

        if (panHolder.getCode().equals("200") && panHolder.getData().getStatus().equals("VALID")) {
            HashMap<String, String> map = new HashMap<>();
            map.put("Name", panHolder.getData().getFull_name());
//            logger.info(" method for Performs PAN verification using the provided PAN verification DTO. ");
            return new ResponseModel("Verified", "Success", 200, map);
        } else {
            return new ResponseModel("Not Verified", "PanNumber not verified ", 307,
                    "Denied");
        }
    }

    @Override
    public ResponseModel verifyAadhaar(AadhaarVerificationDto aadharDto) {

        try {
            if (aadharDto.getAadhaarNumber() == null) {
                return new ResponseModel("Not Verified", "Please Enter Aadhar Number", 307,
                        "Denied");
            }

            aadharDto.setApikey(apiKey);
            aadharDto.setSecrete(secreteKey);

            HttpHeaders header = new HttpHeaders();
            header.setContentType(MediaType.APPLICATION_JSON);

            Gson gson = new Gson();
            String toJson = gson.toJson(aadharDto);

            HttpEntity<String> httpEntity = new HttpEntity<>(toJson, header);

            String object = template.postForObject(aadharUrl, httpEntity, String.class);
            System.err.println("object>>>" + object);
            AadharResponseDto emp = gson.fromJson(object, AadharResponseDto.class);
            System.err.println("emp>>>" + emp);
            MerchantAadharResponse aadharResponse = new MerchantAadharResponse();
            aadharResponse.setAadharNumber(aadharDto.getAadhaarNumber());
            aadharResponse.setRef_id(emp.getData().getRef_id());
            aadharResponse.setStatus(emp.getData().getStatus());
            aadharResponse.setName(emp.getData().getName());
            emp.setData(aadharResponse);

            if (emp.getCode().equals("200")) {
                Map<String, String> map = new HashMap<>();
                map.put("Re", object);

                return new ResponseModel("Otp Send successfully", "Otp sended", 200,
                        emp.getData().getRef_id());
            } else {

                return new ResponseModel("invalid aadhar no", "please enter correct aadhar no",
                        307, "Denied");
            }
        } catch (NullPointerException e) {

            return new ResponseModel("invalid aadhar no", "please enter correct aadhar no",
                    307, "Denied");
        } catch (Exception e) {
            e.printStackTrace();

            return new ResponseModel("internal server error", "Internal Server Error",
                    307, null);

        }

    }

    @Override
    public ResponseModel verifyAAdharOTP(AadhaarOtpVerifyDto aadharOTPDto) {
        try {

            aadharOTPDto.setApikey(apiKey);
            aadharOTPDto.setSecrete(secreteKey);
            HttpHeaders headers = new HttpHeaders();
            Gson gson = new Gson();
            headers.setContentType(MediaType.APPLICATION_JSON);
            String json = gson.toJson(aadharOTPDto);
            HttpEntity<String> httpEntity = new HttpEntity<>(json, headers);
            String object = template.postForObject(aadhaarOtpUrl, httpEntity, String.class);

            System.err.println("OTP>>>>" + object);

            AadharResponseDto emp = gson.fromJson(object, AadharResponseDto.class);
            System.err.println("OTP EMP>>>>" + emp);
            System.err.println(emp.getData());
            MerchantAadharResponse aadharResponse = new MerchantAadharResponse();

            String refId = "";
            if (emp.getData().getRef_id() != null || !emp.getData().getRef_id().isEmpty()) {
                aadharResponse.setRef_id(emp.getData().getRef_id());
            }

            aadharResponse.setStatus(emp.getData().getStatus());

            String name = "";
            if (emp.getData().getName() != null || !emp.getData().getName().isEmpty()) {
                aadharResponse.setName(emp.getData().getName());
            }

            if (emp.getCode().equals("200") && emp.getData().getStatus().equals("VALID")) {
                HashMap<String, String> map = new HashMap<>();
                map.put("Name", emp.getData().getName());
                return new ResponseModel("Aadhaar verfied", "Success", 200, map);
            } else {

                return new ResponseModel("invalid otp", "please enter correct otp", 307,
                        "Denied");
            }

        } catch (NullPointerException e) {
            return new ResponseModel("invalid otp", "please enter correct otp", 307,
                    "Denied");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseModel("internal server error", "Something Went Wrong.",
                    600, null);

        }
    }

    @Override
    public ResponseModel verifyGst(GstVerificationDto gstDto) {
        try {
            Map<String, String> jsonMap = new HashMap<>();
            jsonMap.put("apikey", apiKey);
            jsonMap.put("secrete", secreteKey);
            jsonMap.put("gstNumber", gstDto.getGstNumber());

            HttpHeaders headers = new HttpHeaders();
            Gson gson = new Gson();
            headers.setContentType(MediaType.APPLICATION_JSON);
            String json = gson.toJson(jsonMap);
            HttpEntity<String> httpEntity = new HttpEntity<>(json, headers);

            String object = template.postForObject(gstUrl, httpEntity, String.class);
            System.err.println("object >>>>>>>>>>>" + object);
            GstResponse gstHolder = gson.fromJson(object, GstResponse.class);
            System.err.println("gstHolder >>>>>>>>>>>>" + gstHolder);
            MerchantGstResponse gstResponse = new MerchantGstResponse();
            if (gstHolder.getData().getLgnm() != null || !gstHolder.getData().getLgnm().isEmpty()) {
                gstResponse.setLgnm(gstHolder.getData().getLgnm());
            }

            if (gstHolder.getData().getGstin() != null || !gstHolder.getData().getGstin().isEmpty()) {
                gstResponse.setGstin(gstHolder.getData().getGstin());
            }
            gstResponse.setSts(gstHolder.getData().getSts());
            if (gstHolder.getCode().equals("200") && gstHolder.getData().getSts().equals("Active")) {
                HashMap<String, String> map = new HashMap<>();
                map.put("companyName", gstHolder.getData().getLgnm());

                return new ResponseModel("Verified", "Succeess", 200, map);
            } else {

                return new ResponseModel("Not Verified", "Gst not verified ", 307,
                        "Denied");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseModel("invalid GST", "please enter correct gst", 307,
                    "Denied");
        }
    }

}
