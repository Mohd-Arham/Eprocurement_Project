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
public class GstVerificationDto {

	private String gstNumber;
	@JsonIgnore
	private String apikey;
	@JsonIgnore
	private String secrete;

    public String getGstNumber() {
        return gstNumber;
    }

    public void setGstNumber(String gstNumber) {
        this.gstNumber = gstNumber;
    }

    public String getApikey() {
        return apikey;
    }

    public void setApikey(String apikey) {
        this.apikey = apikey;
    }

    public String getSecrete() {
        return secrete;
    }

    public void setSecrete(String secrete) {
        this.secrete = secrete;
    }
        
        
}
