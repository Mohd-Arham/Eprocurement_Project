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
public class MerchantGstResponse {

    private String lgnm;
    private String gstin;
    private String sts;
//        private String full_name;
//    private String status;

    public String getLgnm() {
        return lgnm;
    }

    public void setLgnm(String lgnm) {
        this.lgnm = lgnm;
    }

    public String getGstin() {
        return gstin;
    }

    public void setGstin(String gstin) {
        this.gstin = gstin;
    }

    public String getSts() {
        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

}
