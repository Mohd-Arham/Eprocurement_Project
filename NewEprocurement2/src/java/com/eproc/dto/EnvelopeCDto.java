/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.dto;

import java.util.Objects;

/**
 *
 * @author Lincpay
 */
public class EnvelopeCDto {
    
    private String DateOfBidding;
    private String EncryptedBidByContractor;
    private String TenderNumber;

    public EnvelopeCDto(String DateOfBidding, String EncryptedBidByContractor, String TenderNumber) {
        this.DateOfBidding = DateOfBidding;
        this.EncryptedBidByContractor = EncryptedBidByContractor;
        this.TenderNumber = TenderNumber;
    }

    public String getTenderNumber() {
        return TenderNumber;
    }

    public void setTenderNumber(String TenderNumber) {
        this.TenderNumber = TenderNumber;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + Objects.hashCode(this.DateOfBidding);
        hash = 67 * hash + Objects.hashCode(this.EncryptedBidByContractor);
        hash = 67 * hash + Objects.hashCode(this.TenderNumber);
        return hash;
    }
    
    

    public String getDateOfBidding() {
        return DateOfBidding;
    }

    public void setDateOfBidding(String DateOfBidding) {
        this.DateOfBidding = DateOfBidding;
    }

    public String getEncryptedBidByContractor() {
        return EncryptedBidByContractor;
    }

    public void setEncryptedBidByContractor(String EncryptedBidByContractor) {
        this.EncryptedBidByContractor = EncryptedBidByContractor;
    }

    
 

  
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final EnvelopeCDto other = (EnvelopeCDto) obj;
        if (this.EncryptedBidByContractor != other.EncryptedBidByContractor) {
            return false;
        }
        if (this.TenderNumber != other.TenderNumber) {
            return false;
        }
        if (!Objects.equals(this.DateOfBidding, other.DateOfBidding)) {
            return false;
        }
        return true;
    }
    
    
    
}