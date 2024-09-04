/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.service;
import com.eproc.dto.AadhaarOtpVerifyDto;
import com.eproc.dto.PanVerificationDto;
import com.eproc.dto.AadhaarVerificationDto;
import com.eproc.dto.GstVerificationDto;
import com.eproc.dto.response.ResponseModel;

/**
 *
 * @author Lincpay
 */
public interface EKycService {
    
    public ResponseModel verifyPan(PanVerificationDto dto);
    public ResponseModel verifyAadhaar(AadhaarVerificationDto dto);
    public ResponseModel verifyAAdharOTP(AadhaarOtpVerifyDto aadharOTPDto);
    public ResponseModel verifyGst(GstVerificationDto dto);
}