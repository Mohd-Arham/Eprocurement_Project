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
public class ResponseModel {
    public ResponseModel(String message, String status, int i, String string3, String string4, int count) {

		this.message = message;
		this.status = status;
		this.statusCode = i;
		this.data = string3;
		this.duplicateDate = string4;
		this.count = count;

		// TODO Auto-generated constructor stub
	}

	public ResponseModel(String message, String status, int statusCode, Object data) {
		this.message = message;
		this.status = status;
		this.statusCode = statusCode;
		this.data = data;
	}
	
	public ResponseModel(String message, String status, int statusCode, Object data, int count) {
		super();
		this.message = message;
		this.status = status;
		this.statusCode = statusCode;
		this.data = data;
		this.count = count;
	}

	private String message;
	private String status;
	private int statusCode;
	private Object data;
	private String duplicateDate;

	private int count;
    
}