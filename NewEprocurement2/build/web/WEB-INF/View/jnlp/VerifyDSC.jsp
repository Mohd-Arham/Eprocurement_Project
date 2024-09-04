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

    String randomNo = request.getParameter("randomNo");
    String departmentUserId = "5";
    String contractorId = "5";
    String dsctype = request.getParameter("dscType");
    String userType = request.getParameter("userType");
    String deptclass2 = "true";
    String deptclass3 = "true";

    Map<String, String> map = new HashMap<String, String>();
    map.put("jsonId", pageContext.getSession().getId());
    map.put("browser", browser);
    map.put("randomNo", randomNo);
    map.put("departmentUserId", departmentUserId);
    if ("Contractor".equals(userType)) {
        if (session.getAttribute("contRegId") != null) {
            map.put("contractorId", session.getAttribute("contRegId").toString());
        }
    } else if ("deptUser".equals(userType)) {
        if (session.getAttribute("deptUserId") != null) {
            map.put("contractorId", session.getAttribute("deptUserId").toString());
        }
    } else if ("deptAdmin".equals(userType)) {
        if (session.getAttribute("deptId") != null) {
            map.put("contractorId", session.getAttribute("deptId").toString());
        }
    }

    map.put("dscType", dsctype);
    map.put("deptclass2", deptclass2);
    map.put("deptclass3", deptclass3);
    map.put("userType", userType);

    if (session.getAttribute("contractorName") != null) {
        map.put("userName", session.getAttribute("contractorName").toString());
    } else {
        map.put("userName", "user");
    }
    System.out.println("43434343434=public key jsp" + dsctype);
    session.setAttribute("DSC_TYPE", dsctype);

    Gson gson = new Gson();
    String jsonObject = gson.toJson(map).toString();

    System.out.println("json map is: " + jsonObject);

    String codebase = request.getScheme() + "://" + request.getServerName();
    if (request.getServerPort() != (request.isSecure() ? 443 : 80)) {
        codebase += ":" + request.getServerPort();
    }
    codebase += request.getContextPath();

    System.out.println("codebase is: " + codebase);

    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    response.setHeader("Content-Disposition", "filename=\"VerifyDigitalCertificate.jnlp\";");
    response.setContentType("application/x-java-jnlp-file");
%>







<jnlp spec="1.0+" codebase="<%= codebase%>">

    <information>

        <vendor>LINCPAY SOLUTION PRIVATE LIMTED</vendor>
        <title>Verify DSC</title>
        <description>Verify your Dsc</description>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <j2se version="1.6+" />  
        <jar href="<%= request.getContextPath()%>/resources/ReadPublickeyForContractor.jar" />

        <property name="jnlp.versionEnabled" value="false"/>
    </resources>
    <application-desc main-class="ReadPublicKey" >
        <argument><%=jsonObject%></argument>

    </application-desc>


</jnlp> 






