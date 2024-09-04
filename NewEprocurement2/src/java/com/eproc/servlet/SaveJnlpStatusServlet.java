/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.servlet;

import com.eproc.daoImpl.JnlpStatusDaoImpl;
import com.eproc.domain.JnlpStatus;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Window7
 */
@WebServlet(name = "SaveJnlpStatusServlet", urlPatterns = {"/SaveJnlpStatus.JPG", "/AccessJnlpStatus.JPG"})
public class SaveJnlpStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String tenderId = null;
            String contractorId = null;
            String departmentUserId = null;
            String randomNo = null;
            String status = null;

            System.out.println("fetch detail by jnlp request type: " + request.getMethod());

            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i] != null) {
                    if (cookies[i].getName().equals("tenderId") && !cookies[i].getValue().equals("null")) {
                        tenderId = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("contractorId") && !cookies[i].getValue().equals("null")) {
                        contractorId = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("departmentUserId") && !cookies[i].getValue().equals("null")) {
                        departmentUserId = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("randomNo") && !cookies[i].getValue().equals("null")) {
                        randomNo = cookies[i].getValue();
                    }
                }
            }
            System.out.println("------------- RandomNo -------------- : " + randomNo);
            System.out.println(tenderId + ":" + contractorId + ":" + departmentUserId + ":" + randomNo);

//            if(tenderId != null){
//               if(contractorId != null && departmentUserId == null)// for contractor with tender
//               status = JnlpStatus.getContractorJnlpStatus(tenderId, contractorId, randomNo);      
//               if(contractorId == null && departmentUserId != null) // for department user with tender
//               status = JnlpStatus.getDepartmentUserJnlpStatus(tenderId, departmentUserId, randomNo); 
//            }else{
//               // check for verfiy dsc
//               if(contractorId != null && departmentUserId == null)// for contractor without tender
//                  status = JnlpStatus.getContractorJnlpStatusWithoutTender(contractorId, randomNo);
//               if(contractorId == null && departmentUserId != null)// for department user without tender
//                  status = JnlpStatus.getDepartmentUserJnlpStatusWithoutTender(departmentUserId, randomNo);
//            }
            ServletOutputStream outputStream = response.getOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(outputStream);

            status = "inactive";
            out.writeObject(status);
            outputStream.close();
            System.out.println("----------------- status return inactive ------------------");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectInputStream objectInputStream = null;
        try {
            objectInputStream = new ObjectInputStream(request.getInputStream());
            Map<String, String> map = null;;
            String tenderId = null;
            String contractorId = null;
            String departmentUserId = null;
            String randomNo = null;
            String status = null;
            String url = null;
            Gson gson = new Gson();
            System.out.println("request type: " + request.getMethod());

            if (objectInputStream != null) {
                map = (Map<String, String>) objectInputStream.readObject();
                Iterator iterator = map.entrySet().iterator();
                while (iterator.hasNext()) {
                    Map.Entry s = (Map.Entry) iterator.next();
                    String key = (String) s.getKey();
                    if ("url".equals(key)) {
                        url = (String) s.getValue();
                    }
                }
            }

            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i] != null) {
                    if (cookies[i].getName().equals("tenderId") && !cookies[i].getValue().equals("null")) {
                        tenderId = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("contractorId") && !cookies[i].getValue().equals("null")) {
                        contractorId = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("departmentUserId") && !cookies[i].getValue().equals("null")) {
                        departmentUserId = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("randomNo") && !cookies[i].getValue().equals("null")) {
                        randomNo = cookies[i].getValue();
                    }
                }
            }// for loop end here

            String methodType = request.getMethod();
            System.out.println(tenderId + ":" + contractorId + ":" + randomNo + ":" + url);

            if (methodType != null && url != null) {
                url = gson.fromJson(url, String.class);
                System.out.println("decoded url is: " + url);
                JnlpStatus jnlpStatus = new JnlpStatus("2", "1", randomNo, "active", url, "7");
                int i = new JnlpStatusDaoImpl().updateJnlpStatus(jnlpStatus, randomNo);
                System.out.println("result of save jnlp status.." + i);
            }
            ServletOutputStream outputStream = response.getOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(outputStream);

            // write response
            out.writeObject(status);
            if (objectInputStream != null) {
                objectInputStream.close();
            }
            outputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
