package com.eproc.domain;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class QCBSTemplateDTO {
    private String question;
    private Map<Integer, String> criteria = new LinkedHashMap<Integer, String>();
    private List<String> criteriaNew = new ArrayList<>();
    private List<QCBSTemplateDTO> criteriaNewQCBS = new ArrayList<>();
    private Map<Integer, String> criteriaStrUser = new LinkedHashMap<Integer, String>();
    private String filePath;
    private String strUser;
    private String fileName;
    private String contrMark;
    private String actualMark;
    private String remark;
    private String fileOrtext;
    private String text;
    private String inputFiled;
    private String selected;

    public String getStrUser() {
        return strUser;
    }

    public void setStrUser(String strUser) {
        this.strUser = strUser;
    }

    public List<QCBSTemplateDTO> getCriteriaNewQCBS() {
        return criteriaNewQCBS;
    }

    public void setCriteriaNewQCBS(List<QCBSTemplateDTO> criteriaNewQCBS) {
        this.criteriaNewQCBS = criteriaNewQCBS;
    }

    public List<String> getCriteriaNew() {
        return criteriaNew;
    }

    public void setCriteriaNew(List<String> criteriaNew) {
        this.criteriaNew = criteriaNew;
    }
    
    public Map<Integer, String> getCriteriaStrUser() {
        return criteriaStrUser;
    }

    public void setCriteriaStrUser(Map<Integer, String> criteriaStrUser) {
        this.criteriaStrUser = criteriaStrUser;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Map<Integer, String> getCriteria() {
        return criteria;
    }

    public void setCriteria(Map<Integer, String> criteria) {
        this.criteria = criteria;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getContrMark() {
        return contrMark;
    }

    public void setContrMark(String contrMark) {
        this.contrMark = contrMark;
    }

    public String getActualMark() {
        return actualMark;
    }

    public void setActualMark(String actualMark) {
        this.actualMark = actualMark;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getFileOrtext() {
        return fileOrtext;
    }

    public void setFileOrtext(String fileOrtext) {
        this.fileOrtext = fileOrtext;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getInputFiled() {
        return inputFiled;
    }

    public void setInputFiled(String inputFiled) {
        this.inputFiled = inputFiled;
    }

    public String getSelected() {
        return selected;
    }

    public void setSelected(String selected) {
        this.selected = selected;
    }
    
    
}
