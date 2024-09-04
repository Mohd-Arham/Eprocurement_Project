package com.eproc.daoImpl;

import com.eproc.domain.DSCInformationForContractor;
import com.eproc.domain.DSCInformationForDepartmentAdmin;
import com.eproc.domain.DSCInformationForDepartmentUser;
import com.eproc.service.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

/**
 *
 * @author Aditya Vyas
 */
public class DSCMappingDAO {

    private static ArrayList<DSCInformationForDepartmentAdmin> dcsUniqueStatus = new ArrayList<DSCInformationForDepartmentAdmin>();
    private String message;

    public static ArrayList<DSCInformationForDepartmentAdmin> getDcsUniqueStatus() {
        return dcsUniqueStatus;
    }

    public static void setDcsUniqueStatus(ArrayList<DSCInformationForDepartmentAdmin> dcsUniqueStatus) {
        DSCMappingDAO.dcsUniqueStatus = dcsUniqueStatus;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String insertDSCInformation(Map<String, String> dscMap, HttpSession session) {
        System.out.println("---------------------Inside DSCMappingDAO method insertDSCInformation start-------------------------");
        String result = "error";
        String userType="user";
        userType=dscMap.get("userType");
       //  changes
      
       
        System.out.println("userType"+userType);
        
        if (userType != null) {
            if (userType.equals("deptUser")) {
                result = this.insertDSCInformationForDeptUser(dscMap, session);
            } else if (userType.equals("Contractor")) {
                result = this.insertDSCInformationForContractor(dscMap, session);
            } else if (userType.equals("DeptAdmin")) {
                result = this.insertDSCInformationForDeptAdmin(dscMap, session);
            }
        } else {
            System.out.println("userType is NULL===>" + userType);
        }
        System.out.println("---------------------insertDSCInformation End-------------------------");
        return result;
    }

    public String insertDSCInformationForDeptUser(Map<String, String> dscMap, HttpSession session) {
        String dscUniqueStatusFlag = "";
        String dscExpiredStatusFlag = "";
        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
        String today = sdf.format(new Date());
        String result = "error";
        DSCInformationForDepartmentUser dSCInformationForDepartmentUser = new DSCInformationForDepartmentUser();
        dSCInformationForDepartmentUser.setCommonName(dscMap.get("commonName"));
        dSCInformationForDepartmentUser.setDateOfSubmission(today);
        dSCInformationForDepartmentUser.setDscExpiryDate(dscMap.get("expiryDate"));
        dSCInformationForDepartmentUser.setDscName(dscMap.get("aliasName"));
        dSCInformationForDepartmentUser.setDscPublicKey(dscMap.get("publicKey"));;
        dSCInformationForDepartmentUser.setDscSerialNo(dscMap.get("serialNo"));
        dSCInformationForDepartmentUser.setDscType(dscMap.get("dscType"));
        dSCInformationForDepartmentUser.setDscUserId(dscMap.get("contractorId"));

        Session hbsession = null;

        try {
            hbsession = HibernateUtil.getSessionFactory().openSession();
            hbsession.beginTransaction();
            hbsession.saveOrUpdate(dSCInformationForDepartmentUser);
            hbsession.getTransaction().commit();
            result = "success";
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (hbsession != null) {
                hbsession.close();
            }
        }
        return result;
    }

    public String insertDSCInformationForContractor(Map<String, String> dscMap, HttpSession session) {
        System.out.println("---------------insertDSCInformationForContractor start---------------");
        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
        String today = sdf.format(new Date());
        String result = "error";

        System.out.println(dscMap);
        DSCInformationForContractor dSCInformationForContractor = new DSCInformationForContractor();
        dSCInformationForContractor.setCommonName(dscMap.get("commonName"));
        dSCInformationForContractor.setDateOfSubmission(today);
        dSCInformationForContractor.setDscExpiryDate(dscMap.get("expiryDate"));
        dSCInformationForContractor.setDscName(dscMap.get("aliasName"));
        dSCInformationForContractor.setDscPublicKey(dscMap.get("publicKey"));;
        dSCInformationForContractor.setDscSerialNo(dscMap.get("serialNo"));
        dSCInformationForContractor.setDscType(dscMap.get("dscType"));
        dSCInformationForContractor.setDscUserId(dscMap.get("contractorId"));

        Session hbsession = null;

        try {
            hbsession = HibernateUtil.getSessionFactory().openSession();
            hbsession.beginTransaction();
            hbsession.saveOrUpdate(dSCInformationForContractor);
            hbsession.getTransaction().commit();
            result = "success";
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (hbsession != null) {
                hbsession.close();
            }
        }
        System.out.println("----------------------insertDSCInformationForContractor end-----------------");
        return result;
    }

    public String insertDSCInformationForDeptAdmin(Map<String, String> dscMap, HttpSession session) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
        String today = sdf.format(new Date());
        String result = "error";

        DSCInformationForDepartmentAdmin dSCInformationForDepartmentAdmin = new DSCInformationForDepartmentAdmin();
        dSCInformationForDepartmentAdmin.setCommonName(dscMap.get("commonName"));
        dSCInformationForDepartmentAdmin.setDateOfSubmission(today);
        dSCInformationForDepartmentAdmin.setDscExpiryDate(dscMap.get("expiryDate"));
        dSCInformationForDepartmentAdmin.setDscName(dscMap.get("aliasName"));
        dSCInformationForDepartmentAdmin.setDscPublicKey(dscMap.get("publicKey"));;
        dSCInformationForDepartmentAdmin.setDscSerialNo(dscMap.get("serialNo"));
        dSCInformationForDepartmentAdmin.setDscType(dscMap.get("dscType"));
        dSCInformationForDepartmentAdmin.setDscUserId(dscMap.get("contractorId"));

        Session hbsession = null;

        try {
            hbsession = HibernateUtil.getSessionFactory().openSession();
            hbsession.beginTransaction();
            hbsession.saveOrUpdate(dSCInformationForDepartmentAdmin);
            hbsession.getTransaction().commit();
            result = "success";
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (hbsession != null) {
                hbsession.close();
            }
        }

        return result;
    }

    // For check DSC is expired Or not
    public String dscExpiredOrNot(String dscExpiryDate) throws ParseException {
        String message = null;
        int i;
        long days = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
        String today = sdf.format(new Date());
        Date convertExpiryDate = sdf.parse(dscExpiryDate);
        Date todayDate = sdf.parse(today);
        if (new Date().after(todayDate) && new Date().before(convertExpiryDate)) {
            days = convertExpiryDate.getTime() - todayDate.getTime();
        }
        String days1 = "" + TimeUnit.DAYS.convert(days, TimeUnit.MILLISECONDS);
        int daysCount = Integer.parseInt(days1);
        System.out.println("No. of Days : " + daysCount);
        if (daysCount > 0) {
            message = "DSC not Expired";
            System.out.print("-----if---------- " + message);
        } else {
            System.out.print("-----else--------- ");
            message = "Your DSC is Expired";
        }
        return message;
    }

    public String DSCUniqueOrNot(String dscSerialNo) {
        System.out.println("==================Inside DSCUniqueOrNot method======================" + dscSerialNo);

        String dcsUniqueFlag = "";
        Session hibSession = HibernateUtil.getSessionFactory().openSession();

        int id = 1;
        try {
            String dscSerialNo1 = dscSerialNo;
            dcsUniqueStatus = (ArrayList<DSCInformationForDepartmentAdmin>) hibSession.createQuery("FROM DSCInformation d1, DSCInformationForDepartment d2, DSCInformationForContractor d3 WHERE d1.dscSerialNo='" + dscSerialNo1 + "' OR d2.dscSerialNo='" + dscSerialNo1 + "' OR d3.dscSerialNo='" + dscSerialNo1 + "'").list();
            if (dcsUniqueStatus.size() > 0) {
                dcsUniqueFlag = "DSCNotUnique";
                System.out.println("DSC Not Unique | DSC Not Unique ");
                message = "This DSC is already in use. Please insert your own DSC.";
                System.out.println("" + message);
                this.setMessage(message);
            } else {
                dcsUniqueFlag = "DSCUnique";
                System.out.println("DSC Unique | DSC Unique | DSC Unique");
            }
            hibSession.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Data Fatch Exception" + ex);
        }

        return dcsUniqueFlag;
    }
}
