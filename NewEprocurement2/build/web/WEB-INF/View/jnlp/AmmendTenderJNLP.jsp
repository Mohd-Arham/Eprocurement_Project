<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="application/x-java-jnlp-file" %>

<%
    String browserDetails = request.getHeader("User-Agent");
    String userAgent = browserDetails;
    String user = userAgent.toLowerCase();

    String os = "";
    String browser = "";

    if (user.contains("msie")) {
        browser = "iexplore";
    } else if (user.contains("safari") && user.contains("version")) {
        browser = "safari";
    } else if (user.contains("opr") || user.contains("opera")) {
        if (user.contains("opera")) {
            browser = "opera";
        } else if (user.contains("opr")) {
            browser = "opera";
        }
    } else if (user.contains("chrome")) {
        browser = "chrome";
    } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1) || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1)) {
        //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
        browser = "netscape";

    } else if (user.contains("firefox")) {
        browser = "firefox";
    } else if (user.contains("rv")) {
        browser = "iexplore";
    } else {
        browser = "UnKnown, More-Info: " + userAgent;
    }

    // String filePath = "/SignedPDF";
    Map<String, String> map = new HashMap<String, String>();

//    System.out.println("dddddddddddllllllllllllllllllllllllllllllll : "+request.getParameter("serialNumber"));
    map.put("jsonId", pageContext.getSession().getId());
    map.put("tender_id", "1");
    map.put("tender_no", "2");
    
    map.put("browser", browser);
    String serialNumber = (String) request.getAttribute("serialNumber");
    map.put("dscSerialNo",serialNumber);
    if (request.getAttribute("departmentUserId") != null) {
        map.put("departmentUserId", request.getAttribute("departmentUserId").toString());
    }
    map.put("departmentUserId", request.getAttribute("departmentUserId").toString());
    if (request.getParameter("randomNo") != null) {
        map.put("randomNo", request.getParameter("randomNo"));
    }

//    System.out.println("departmentUserId: " + request.getAttribute("departmentUserId"));
    System.out.println("randomNo: " + request.getParameter("randomNo"));

    // send department user allowed type of DSC Class status
    if (session != null) {
        map.put("deptclass3", "true");

        map.put("deptclass2", "true");
    }
    if (session.getAttribute("userName") != null) {
        map.put("userName", "");
    } else {
        map.put("userName", "user");
    }
    map.put("deptclass3", "true");
    map.put("deptclass2", "true");
    map.put("actionMessage", "Tender Ammended Successfully");

    String codebase = request.getScheme() + "://" + request.getServerName();
    if (request.getServerPort() != (request.isSecure() ? 443 : 80)) {
        codebase += ":" + request.getServerPort();
    }

    codebase += request.getContextPath();
    Gson gson = new Gson();
    String jsonObject = gson.toJson(map).toString();

    System.out.println("codebase of codebase codebase isaaaa  " + codebase + "tender id is:" + session.getAttribute("tender_id") + "tender no is:" + session.getAttribute("tender_no") + "jsonId" + pageContext.getSession() + "dscSerialNo" + request.getAttribute("dscSerialNo"));

    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    response.setHeader("Content-Disposition", "filename=\"SignTender.jnlp\";");
    response.setContentType("application/x-java-jnlp-file");

%>


<jnlp spec="1.0+" codebase="<%= codebase%>">

    <information>

        <vendor>LINCPAY SOLUTION PRIVATE LIMTED</vendor>
        <title>Tender Approval</title>
        <description>Verify your Dsc</description>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <j2se version="1.6+" />  
        <jar href="<%= request.getContextPath()%>/resources/MultiTenderActionSign.jar" />
    </resources>
    <application-desc main-class="MultiTenderActionSign" >
        <argument><%=jsonObject%></argument>
    </application-desc>


</jnlp>