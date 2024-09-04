/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.servlet;

import com.eproc.daoImpl.DSCMappingDAO;
import com.eproc.domain.DSCInformationForContractor;
import com.eproc.service.HibernateUtil;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Window7
 */
@WebServlet(name = "VerifyContractorDSCServlet", urlPatterns = {"/Read.jpg"})
public class VerifyContractorDSCServlet extends HttpServlet {

    Map<String, String> dscMap = new HashMap<String, String>();
    private String dscUniqueStatusFlag;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ObjectInputStream objIn;
        ServletOutputStream servletOut;
        String result="error";

        try {
            System.out.println("Inside VerifyContractorDSCSServlet comman Servlet for DSC");
            servletOut = res.getOutputStream();
            objIn = new ObjectInputStream(req.getInputStream());
            dscMap = (Map) objIn.readObject();
            
            System.out.println("serialNo : " + dscMap.get("serialNo"));
            System.out.println("aliasName : " + dscMap.get("aliasName"));
            System.out.println("expiryDate : " + dscMap.get("expiryDate"));
            System.out.println("commonName : " + dscMap.get("commonName"));
            System.out.println("dscType : " + dscMap.get("dscType"));
            System.out.println("publicKey : " + dscMap.get("publicKey"));

            HttpSession session = req.getSession();
            if (session == null) {
                System.out.println("Http sesion not found");
            } else {
               result  = new DSCMappingDAO().insertDSCInformation(dscMap, session);
            }
            ObjectOutputStream objout = new ObjectOutputStream(servletOut);
            Locale lcountry = req.getLocale();
            System.out.println("Country is " + lcountry.getCountry());
            objout.writeObject("success");
            session.setAttribute("result", dscUniqueStatusFlag);
            objIn.close();
            servletOut.close();
            System.out.println("--------------End Servlet code-------------");
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
