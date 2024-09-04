/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.logs;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.eproc.domain.Logs;
import com.eproc.util.DateTimeUtil;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 *
 * @author OSMO-DES-5
 */
@Service
public class LogsAction {

    @Autowired
    LogsActionDao logsActionDao;

    private List<Logs> logs = new ArrayList<Logs>();
    private Logs log = null;

    public Logs getLog() {
        return log;
    }

    public void setLog(Logs log) {
        this.log = log;
    }

    public List<Logs> getLogs() {
        return logs;
    }

    public void setLogs(List<Logs> logs) {
        this.logs = logs;
    }

    public String saveLogs(Logs log) {
        String result = "error";
        int i = 0;
        try {
            i = logsActionDao.save(log);
            if (i > 0) {
                result = "success";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public String FetchOSName() {
        String name = "os.name";
        String version = "os.version";
        String architecture = "os.arch";

        name = System.setProperty(name, System.getProperty(name));
        return name;

    }

    public String fetchIpAddress() {
        
//        String s2 = "";
        String Ip = "";
        try {
////             
       HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Ip =request.getRemoteAddr();
     

        } catch (Exception e) {
            e.printStackTrace();
        }
           return Ip;
    }

    public String fetchMacAddress() throws Exception {
//        String macAddress = "";
//        InetAddress ip;
//        try {
//            ip = InetAddress.getLocalHost();
//            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
//            byte[] mac = network.getHardwareAddress();
//            StringBuilder sb = new StringBuilder();
//            for (int i = 0; i < mac.length; i++) {
//                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
//            }
//            System.out.println(sb.toString());
//            macAddress = sb.toString();
String macAddress = null;
    String command = "ifconfig";

    String osName = System.getProperty("os.name");
    System.out.println("Operating System is " + osName);

    if (osName.startsWith("Windows")) {
        command = "ipconfig /all";
    } else if (osName.startsWith("Linux") || osName.startsWith("Mac") || osName.startsWith("HP-UX")
            || osName.startsWith("NeXTStep") || osName.startsWith("Solaris") || osName.startsWith("SunOS")
            || osName.startsWith("FreeBSD") || osName.startsWith("NetBSD")) {
        command = "ifconfig -a";
    } else if (osName.startsWith("OpenBSD")) {
        command = "netstat -in";
    } else if (osName.startsWith("IRIX") || osName.startsWith("AIX") || osName.startsWith("Tru64")) {
        command = "netstat -ia";
    } else if (osName.startsWith("Caldera") || osName.startsWith("UnixWare") || osName.startsWith("OpenUNIX")) {
        command = "ndstat";
    } else {// Note: Unsupported system.
        throw new Exception("The current operating system '" + osName + "' is not supported.");
    }

    Process pid = Runtime.getRuntime().exec(command);
    BufferedReader in = new BufferedReader(new InputStreamReader(pid.getInputStream()));
    Pattern p = Pattern.compile("([\\w]{1,2}(-|:)){5}[\\w]{1,2}");
    while (true) {
        String line = in.readLine();
        System.out.println("line " + line);
        if (line == null)
            break;

        Matcher m = p.matcher(line);
        if (m.find()) {
            macAddress = m.group();
            break;
        }
    }
    in.close();
    return macAddress;
//        } catch (Exception e) {
//
//            e.printStackTrace();
//
//        }
//        return macAddress;
    }

    public String getClientBrowser(HttpServletRequest request) {
        final String browserDetails = request.getHeader("User-Agent");
        final String user = browserDetails.toLowerCase();

        String browser = "";

        //===============Browser===========================
        if (user.contains("msie")) {
            String substring = browserDetails.substring(browserDetails.indexOf("MSIE")).split(";")[0];
            browser = substring.split(" ")[0].replace("MSIE", "IE") + "-" + substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version")) {
            browser = (browserDetails.substring(browserDetails.indexOf("Safari")).split(" ")[0]).split(
                    "/")[0] + "-" + (browserDetails.substring(
                    browserDetails.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if (user.contains("opr") || user.contains("opera")) {
            if (user.contains("opera"))
                browser = (browserDetails.substring(browserDetails.indexOf("Opera")).split(" ")[0]).split(
                        "/")[0] + "-" + (browserDetails.substring(
                        browserDetails.indexOf("Version")).split(" ")[0]).split("/")[1];
            else if (user.contains("opr"))
                browser = ((browserDetails.substring(browserDetails.indexOf("OPR")).split(" ")[0]).replace("/",
                                                                                                           "-")).replace(
                        "OPR", "Opera");
        } else if (user.contains("chrome")) {
            browser = (browserDetails.substring(browserDetails.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1) || (user.indexOf(
                "mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf(
                "mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1)) {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
            browser = "Netscape-?";

        } else if (user.contains("firefox")) {
            browser = (browserDetails.substring(browserDetails.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if (user.contains("rv")) {
            browser = "IE";
        } else {
            browser = "UnKnown, More-Info: " + browserDetails;
        }
  return browser;
}
            public String getOs() {
        String os = System.getProperty("os.name");
        System.out.println("System Os");
        return os;
    }
  
    
public Logs generatingLogs(Integer deptId, Integer deptUserId, Integer contractorId, Integer tenderId, String activity, Integer auctionId, Integer rfqId, String dscId, String deptUser, String logMessage, String headingMsg, String status) throws Exception{
        DateTimeUtil dtu = new DateTimeUtil();
        Logs logs = new Logs();
        logs.setDeptId(deptId);
        logs.setDeptUserId(deptUserId);
        logs.setContractorId(contractorId);
        logs.setTenderId(tenderId);
        logs.setActivity(activity);
        logs.setAuctionId(auctionId);
        logs.setRfqId(rfqId);
        logs.setDscId(dscId);
        logs.setDeptUser(deptUser);
        logs.setDateTime(DateTimeUtil.currentDateInString());
        logs.setOsName(this.FetchOSName());
        logs.setBrowserName("");
        logs.setIpAddress(this.fetchIpAddress());
        System.out.println("The Mac Address is: "+this.fetchMacAddress());
        logs.setMacAddress(this.fetchMacAddress());
        logs.setLogMessage(logMessage);
        logs.setHeadingMsg(headingMsg);
        logs.setStatus(status);
        return logs;
    }


//   public String fetchAllLogs(){
//      String result = "error";
//      
//      try{
//         this.logs = LogsActionDao.fetchAll();
//         result = "success";
//         
//      }catch(Exception e){
//         e.printStackTrace();
//      }
//      return result;
//   }
//   
//   public String fetchLogsByLogId(int logId){
//      String result = "error";
//      
//      try{
//         this.log = LogsActionDao.fetchById(logId);
//         result = "success";
//         
//      }catch(Exception e){
//         e.printStackTrace();
//      }
//      return result;
//   }
//   
}
