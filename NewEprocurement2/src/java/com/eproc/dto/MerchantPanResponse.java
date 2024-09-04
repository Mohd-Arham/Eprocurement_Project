/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dto;

/**
 *
 * @author Lincpay
 */
public class MerchantPanResponse {

    private String pan;
    private String full_name;
    private String status;

    public String getPan() {
        return pan;
    }

    public String getFull_name() {
        return full_name;
    }

    public String getStatus() {
        return status;
    }

    public void setPan(String pan) {
        this.pan = pan;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}