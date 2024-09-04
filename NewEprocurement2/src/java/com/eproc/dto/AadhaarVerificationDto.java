/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 *
 * @author Lincpay
 */
public class AadhaarVerificationDto {

    private String aadhaarNumber;
    @JsonIgnore
    private String apikey;
    @JsonIgnore
    private String secrete;

    public String getAadhaarNumber() {
        return aadhaarNumber;
    }

    public String getApikey() {
        return apikey;
    }

    public String getSecrete() {
        return secrete;
    }

    public void setAadhaarNumber(String aadhaarNumber) {
        this.aadhaarNumber = aadhaarNumber;
    }

    public void setApikey(String apikey) {
        this.apikey = apikey;
    }

    public void setSecrete(String secrete) {
        this.secrete = secrete;
    }

    
    
}