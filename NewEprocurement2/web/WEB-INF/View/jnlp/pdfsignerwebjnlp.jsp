<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson" %>
<%@ page contentType="application/x-java-jnlp-file" %>

<%
    String userbrowser = request.getHeader("User-Agent").toLowerCase();
    String os = "";
    String browser = "";
    if (userbrowser.contains("safari") && userbrowser.contains("version")) {
        browser = "safari";
    } else if (userbrowser.contains("opr") || userbrowser.contains("opera")) {
        browser = "opera";
    } else if (userbrowser.contains("chrome")) {
        browser = "chrome";
    } else if ((userbrowser.indexOf("mozilla/7.0") > -1) || (userbrowser.indexOf("netscape6") != -1) || (userbrowser.indexOf("mozilla/4.7") != -1) || (userbrowser.indexOf("mozilla/4.78") != -1) || (userbrowser.indexOf("mozilla/4.08") != -1) || (userbrowser.indexOf("mozilla/3") != -1)) {
        //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
        browser = "netscape";
    } else if (userbrowser.contains("firefox")) {
        browser = "firefox";
    } else if (userbrowser.contains("msie") || userbrowser.contains("rv")) {
        browser = "iexplore";
    } else {
        browser = "UnKnown, More-Info: " + request.getHeader("User-Agent");
    }
    System.out.println("Browser is : " + browser);

    Map<String, String> map = new HashMap();

    String codebase = request.getScheme() + "://" + request.getServerName();
    if (request.getServerPort() != (request.isSecure() ? 443 : 80)) {
        codebase += ":" + request.getServerPort();
    }
    codebase += request.getContextPath();
    System.out.println("value of code base is" + codebase);

    String randomNo = request.getParameter("randomNo");
    System.out.println("Random No : " + randomNo);
    
    System.out.println(pageContext.getSession().getId());
    map.put("jsessionId", pageContext.getSession().getId());
    map.put("browser", browser);
    map.put("randomNo", randomNo);

    Gson gson = new Gson();
    String jsonObject = gson.toJson(map).toString();
    System.out.println("map : " + jsonObject);
%>


<jnlp spec="1.0+" codebase="<%= codebase%>">

    <information>
        <title>Procurement</title>
        <vendor>LINCPAY SOLUTION PRIVATE LIMITED</vendor>		
        <description>Testing Testing</description>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <j2se version="1.6+" />  
        <jar href="<%= request.getContextPath()%>/resources/PdfSignerWeb.jar"/>
        <property name="jnlp.versionEnabled" value="true"/>
    </resources>
    <application-desc main-class="PdfSignerWeb" >               
        <argument><%=jsonObject%></argument>
        <!--        <param name='dscId' value="1"> -->
    </application-desc>
</jnlp> 

