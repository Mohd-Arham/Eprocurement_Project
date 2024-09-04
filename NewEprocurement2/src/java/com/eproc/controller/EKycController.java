/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.dto.PanVerificationDto;
import com.eproc.dto.AadhaarVerificationDto;
import com.eproc.dto.AadhaarOtpVerifyDto;
import com.eproc.dto.GstVerificationDto;
import com.eproc.dto.response.ResponseModel;
import com.eproc.service.EKycService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Lincpay
 */
@RestController
@RequestMapping("/ekyc")
public class EKycController {

    @Autowired
    private EKycService ekycService;

    @RequestMapping(value = "/panVerification", method = RequestMethod.POST)
    public ResponseEntity<ResponseModel> verifyPan(@RequestBody PanVerificationDto panDto) {
        return ResponseEntity.ok(ekycService.verifyPan(panDto));
    }
    
    @RequestMapping(value="/gstVerification", method=RequestMethod.POST)
    public ResponseEntity<ResponseModel> verifyGst(@RequestBody GstVerificationDto gstDto){
        return ResponseEntity.ok(ekycService.verifyGst(gstDto));
    }
    
    @RequestMapping(value="/adharVerification", method=RequestMethod.POST)
    public ResponseEntity<ResponseModel> verifyAdhar(@RequestBody AadhaarVerificationDto aadhaarDto){
        return ResponseEntity.ok(ekycService.verifyAadhaar(aadhaarDto));
    }
    
    // verify AADHAAR OTP
    @RequestMapping(value="/aadhar-otp-verification", method = RequestMethod.POST)
    public ResponseEntity<ResponseModel> aadharOTPVerification(@RequestBody AadhaarOtpVerifyDto aadharOtpdto) {
        return ResponseEntity.ok(ekycService.verifyAAdharOTP(aadharOtpdto));
    }

}