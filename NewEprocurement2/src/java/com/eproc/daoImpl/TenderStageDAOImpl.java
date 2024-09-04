/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.daoImpl;

import com.eproc.dao.TenderStageDao;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderStage;
import com.eproc.util.PDFBuilder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Vishali Gupta
 */
@Repository
public class TenderStageDAOImpl implements TenderStageDao<TenderStage>{
    
    @Autowired
    SessionFactory sessionFactory;
    @Autowired
    TenderDaoImpl tenderDao;
    @Autowired
    PDFBuilder fBuilder;
    
    public static final String UPLOAD_Created_PDFFOLDER = "/resources/UploadedDocuments/Created_PDF";
    public static final String UPLOAD_Approval_PDFFOLDER = "/resources/UploadedDocuments/Approval_PDF";

    @Override
    public boolean insertData(TenderStage tenderStage) {
        System.out.println("-----------------Method called to save TenderStage in TenderStageDAOImpl----------------------------");
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Transaction txn = session.beginTransaction();
            session.saveOrUpdate(tenderStage);
            txn.commit();
        } catch (Exception ex) {
            System.out.println("Class::TenderStageDAOImpl, method::insertData");
            System.out.print("Exception in Save TenderStage" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to save TenderStage in TenderStageDAOImpl----------------------------");
        return true;
      
    }

    @Override
    public boolean removeData(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TenderStage fetchData(Integer tenderStage_id) {
        System.out.println("------------------------Method Called to show Tender Stage By Id----------------------");
        Session session = null;
        TenderStage tenderStage = null;
        System.out.println("The Tender Stage Id: "+tenderStage_id);
        try{
               session = sessionFactory.openSession();
               Query query = session.createQuery("FROM TenderStage WHERE tenderStage_id =:tenderStage_id");
               query.setParameter("tenderStage_id", tenderStage_id);
               tenderStage = (TenderStage) query.uniqueResult();
               System.out.println("The Tender Stage is: "+tenderStage);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(session != null){
                session.close();
            }
        }
        System.out.println("------------------------Method End to show Tender Stage By Id----------------------");
        return tenderStage;
    }

    @Override
    public boolean updateData(TenderStage e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List fetchAll() {
         System.out.println("-----------------Method called to fetchAll TenderStage in Dao----------------------------");
        List<TenderStage> TenderStageList = new ArrayList<TenderStage>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            TenderStageList = session.createQuery("FROM TenderStage").list();
            System.out.println("Size of TenderStageList is " + TenderStageList.size());

        } catch (Exception ex) {
            System.out.print("Exception in FetchAll TenderStageList " + ex);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        System.out.println("-----------------Method End to fetchAll TenderStagein Dao----------------------------");
        return TenderStageList;
    }
    
     public ModelAndView downloadpdf(@RequestParam int tender_Id, HttpServletRequest request) throws Exception {
        try {
            System.out.println("Tender id sec  is on idsaid action:  " + tender_Id);
            Tender tenderD = tenderDao.read(tender_Id);
            TenderKeyDates tenderKeyDates  = tenderDao.readKeyDate(tender_Id);
            System.out.println("The Tender Key Dates are: "+tenderKeyDates);
            tenderD.setTenderKeyDates(tenderKeyDates);
            System.out.println("List is:-" + tenderD.toString());
            String file_path =  fBuilder.buildPdf1Document(tenderD, this.UPLOAD_Created_PDFFOLDER, this.UPLOAD_Approval_PDFFOLDER,request);
           
//            tenderD.setSent_for_approval_pdf(file_path);
               tenderDao.updatePDFPath(tender_Id, file_path);
            
            System.out.println("RETURN IN METHOD AND OUTPUT IS "+file_path);
            
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        }
        return null;
    }  
    
    
    
}
