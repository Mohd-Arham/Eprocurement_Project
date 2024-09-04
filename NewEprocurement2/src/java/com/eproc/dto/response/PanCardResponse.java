/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dto.response;

import com.eproc.dto.MerchantPanResponse;

/**
 *
 * @author Lincpay
 */
public class PanCardResponse {

    private String timestamp;
    private String transaction_id;
    private String code;
    private MerchantPanResponse data;

    public String getTimestamp() {
        return timestamp;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public String getCode() {
        return code;
    }

    public MerchantPanResponse getData() {
        return data;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setData(MerchantPanResponse data) {
        this.data = data;
    }

    
    
    @Override
    public String toString() {
        return "PanCardResponse{" + "timestamp=" + timestamp + ", transaction_id=" + transaction_id + ", code=" + code + ", data=" + data + '}';
    }
    
    
    
    

}