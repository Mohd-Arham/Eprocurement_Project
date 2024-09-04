/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dto.response;

import com.eproc.dto.MerchantGstResponse;

/**
 *
 * @author Lincpay
 */
public class GstResponse {
	
	private String timestamp;
	private String transaction_id;
	private String code;
	private MerchantGstResponse data;
        

    public GstResponse() {
    } 

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public MerchantGstResponse getData() {
        return data;
    }

    public void setData(MerchantGstResponse data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "GstResponse{" + "timestamp=" + timestamp + ", transaction_id=" + transaction_id + ", code=" + code + ", data=" + data + '}';
    }
        
        
        
}

