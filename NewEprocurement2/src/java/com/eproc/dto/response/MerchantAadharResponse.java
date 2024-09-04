/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dto.response;

/**
 *
 * @author Lincpay
 */
public class MerchantAadharResponse {

    private String status;
    private String name;
    private String ref_id;

    public void setRef_id(String ref_id) {
        this.ref_id = ref_id;
    }

    public String getRef_id() {
        return ref_id;
    }
    private String aadharNumber;

    public String getStatus() {
        return status;
    }

    public String getName() {
        return name;
    }

    public String getAadharNumber() {
        return aadharNumber;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAadharNumber(String aadharNumber) {
        this.aadharNumber = aadharNumber;
    }

    @Override
    public String toString() {
        return "MerchantAadharResponse{" + "status=" + status + ", name=" + name + ", ref_id=" + ref_id + ", aadharNumber=" + aadharNumber + '}';
    }

    
    
    
}