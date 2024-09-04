/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.util;

import com.eproc.daoImpl.AreaOfWorkDAOImpl;
import com.eproc.daoImpl.ContractorClassDAOImpl;
import com.eproc.daoImpl.DepartmentAdminDAOImpl;
import com.eproc.daoImpl.DepartmentSecondaryUserDaoImpl;
import com.eproc.daoImpl.DepartmentUserDaoImpl;
import com.eproc.daoImpl.EnvelopeTypeDAOImpl;
import com.eproc.daoImpl.SelectiveTenderDAOImpl;
import com.eproc.daoImpl.TenderCategoryDAOImpl;
import com.eproc.daoImpl.TenderDaoImpl;
import com.eproc.daoImpl.TenderKeywordDAOImpl;
import com.eproc.daoImpl.TenderStageDAOImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeADaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeBDaoImpl;
import com.eproc.daoImpl.TenderSubmittedEnvelopeCDaoImpl;
import com.eproc.daoImpl.TypeOfTendersDAOImpl;
import com.eproc.daoImpl.UploadSorDaoImpl;
import com.eproc.domain.AreaOfWork;
import com.eproc.domain.ContractorClass;
import com.eproc.domain.DepartmentAdmin;
import com.eproc.domain.DepartmentUser;
import com.eproc.domain.Designation;
import com.eproc.domain.EnvelopeType;
import com.eproc.domain.SelectiveTender;
import com.eproc.domain.Tender;
import com.eproc.domain.TenderCategory;
import com.eproc.domain.TenderKeyDates;
import com.eproc.domain.TenderKeyword;
import com.eproc.domain.TenderStage;
import com.eproc.domain.TenderSubmittedEnvelopeA;
import com.eproc.domain.TenderSubmittedEnvelopeB;
import com.eproc.domain.TenderSubmittedEnvelopeC;
import com.eproc.domain.TypeOfTenders;
import com.eproc.domain.UploadSOR;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*  AuctionController
 *  @author Shashank Shukla
 *  @Since 01-01-2019
 *  @Version 2.0.0
 */
@Repository
public class PDFBuilder {

    @Autowired
    TenderDaoImpl tenderDaoImpl;
    @Autowired
    TenderKeywordDAOImpl tenderKeywordDAOImpl;
    @Autowired
    TenderStageDAOImpl stageDAOImpl;
    @Autowired
    EnvelopeTypeDAOImpl typeDAOImpl;
    @Autowired
    TenderCategoryDAOImpl categoryDAOImpl;
    @Autowired
    AreaOfWorkDAOImpl areaOfWorkDAOImpl;
    @Autowired
    ContractorClassDAOImpl classDAOImpl;
    @Autowired
    TypeOfTendersDAOImpl ofTendersDAOImpl;
    @Autowired
    SelectiveTenderDAOImpl selectiveTenderDAOImpl;
    @Autowired
    UploadSorDaoImpl sorDaoImpl;
    @Autowired
    DepartmentAdminDAOImpl departmentAdminDAOImpl;
    @Autowired
    TenderSubmittedEnvelopeADaoImpl envelopeADaoImpl;
    @Autowired
    DepartmentUserDaoImpl departmentUserDaoImpl;
    @Autowired
    TenderSubmittedEnvelopeBDaoImpl submittedEnvelopeBDaoImpl;
    @Autowired
    TenderSubmittedEnvelopeCDaoImpl envelopeCDaoImpl;
    @Autowired
    DepartmentSecondaryUserDaoImpl departmentSecondaryUserDaoImpl;

    public String buildPdf1Document(Tender tenderD, String UPLOAD_Created_PDFFOLDER, String UPLOAD_Approval_PDFFOLDER, HttpServletRequest request) throws Exception {

        String pathOfFile = "";
        String name = "report" + new Date().getTime() + "PQ";
        TenderKeyDates tenderKeyDates = new TenderKeyDates();
        DepartmentAdmin departmentAdmin = null;

        try {
            int tender_id = tenderD.getTender_Id();
            System.out.println("TENDER ID IS " + tender_id);
            int dept_id = tenderD.getDeptId();
            System.out.println("DEPARTMENT ID IS  " + dept_id);
            departmentAdmin = departmentAdminDAOImpl.fetchData(dept_id);

            tenderKeyDates = tenderDaoImpl.readKeyDate(tender_id);
            Document document = new Document();

            System.out.println("Create time pdf path  : " + FileUtility.UPLOAD_Created_PDFFOLDER);
            System.out.println("Approval time pdf path :  " + FileUtility.UPLOAD_Approval_PDFFOLDER);

            if ("created".equalsIgnoreCase(tenderD.getTenderStatus())) {
                pathOfFile = request.getRealPath(FileUtility.UPLOAD_Created_PDFFOLDER + "/" + name + ".pdf");
                System.out.println("PATH OF FILE IS " + pathOfFile);
            }
            if ("Sent For Approval".equalsIgnoreCase(tenderD.getTenderStatus())) {
                System.out.println("INSIAD SENT FOR APPROVAL IF CONDITION ");
                pathOfFile = request.getRealPath(FileUtility.UPLOAD_Approval_PDFFOLDER + "/" + name + ".pdf");
                System.out.println("PATH OF FILE IS " + pathOfFile);
            }

            File file = new File(pathOfFile);
            if (!file.exists()) {
                file.createNewFile();
            }

            FileOutputStream fileOutputStream = new FileOutputStream(file);
            PdfWriter writer = PdfWriter.getInstance(document, fileOutputStream);
            document.setPageSize(PageSize.A4);
            document.open();

            if (departmentAdmin.getDeptLogoFileUrl() != null) {
                System.out.println("departmentAdmin.getDeptLogoFileUrl() " + request.getRealPath(departmentAdmin.getDeptLogoFileUrl()));
                Image image2 = Image.getInstance(request.getRealPath(departmentAdmin.getDeptLogoFileUrl()));
                image2.setAbsolutePosition(50, 768);
                image2.scaleAbsolute(100f, 50f);
                image2.setAlignment(Image.ALIGN_RIGHT);
                document.add(image2);
                document.add(new Paragraph("                                                    "+departmentAdmin.getDeptName()));
            }

            //define font for table header row
            Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN, 10, Font.NORMAL);
            Font heading = new Font(Font.FontFamily.TIMES_ROMAN, 11);
            Font heading1 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLD);
            font.setColor(BaseColor.BLACK);

            //1st Table Start
            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100.0f);
            table.setTotalWidth(500);
            table.setLockedWidth(true);
            table.setSpacingBefore(40);
            table.setSpacingAfter(4f);
            table.setHeaderRows(1);
            PdfPCell cell = new PdfPCell();

            //2nd Header
            PdfPCell tDetailHeader = new PdfPCell(new Paragraph("TENDER INFORMATION ", heading1));
            tDetailHeader.setPaddingLeft(10);
            tDetailHeader.setFixedHeight(20f);
            tDetailHeader.setColspan(4);
            tDetailHeader.setVerticalAlignment(cell.ALIGN_MIDDLE);
            tDetailHeader.setBackgroundColor(new BaseColor(255, 219, 174));
            table.addCell(tDetailHeader);

            PdfPCell cell41 = new PdfPCell(new Paragraph("Depatment Name ", heading));
            table.addCell(cell41);

            PdfPCell cell42 = new PdfPCell(new Paragraph(tenderD.getDeptName(), font));
            table.addCell(cell42);

            PdfPCell cell1 = new PdfPCell(new Paragraph("Tender Number ", heading));
            table.addCell(cell1);

            PdfPCell cell2 = new PdfPCell(new Paragraph(tenderD.getTenderNumber(), font));
            table.addCell(cell2);

            PdfPCell cel1l = new PdfPCell(new Paragraph("NIT Number ", heading));
            table.addCell(cel1l);

            PdfPCell ce1ll = new PdfPCell(new Paragraph(tenderD.getNitNumber(), font));
            table.addCell(ce1ll);

            PdfPCell cel11l = new PdfPCell(new Paragraph("NIT Date ", heading));
//         cel11l.setColspan(1);
            table.addCell(cel11l);

            PdfPCell ce112l = new PdfPCell(new Paragraph(tenderD.getNitDate(), font));
//         ce112l.setColspan(2);
            table.addCell(ce112l);

            document.add(table);
            //1st Table End

            //2nd Table Start
            PdfPTable table2 = new PdfPTable(4);
            table2.setWidthPercentage(100.0f);
            table2.setTotalWidth(500);
            table2.setLockedWidth(true);
            table2.setSpacingBefore(4);
            table2.setSpacingAfter(4f);
            table2.setHeaderRows(1);
            PdfPCell Cell = new PdfPCell();

            //2nd Header
            PdfPCell tDetailHeader1 = new PdfPCell(new Paragraph("TENDER DETAILS", heading1));
            tDetailHeader1.setPaddingLeft(10);
            tDetailHeader1.setFixedHeight(20f);
            tDetailHeader1.setColspan(4);
            tDetailHeader1.setVerticalAlignment(Cell.ALIGN_MIDDLE);
            tDetailHeader1.setBackgroundColor(new BaseColor(255, 219, 174));
            table2.addCell(tDetailHeader1);

            PdfPCell Cell1 = new PdfPCell(new Paragraph("Tender Stage ", heading));
            table2.addCell(Cell1);

            TenderStage stage = stageDAOImpl.fetchData(Integer.parseInt(tenderD.getTenderStage()));

            PdfPCell Ceell1 = new PdfPCell(new Paragraph(stage.getTenderStage_Name(), font));
            table2.addCell(Ceell1);

            PdfPCell Cell2 = new PdfPCell(new Paragraph("Selective Tenderer", heading));
            table2.addCell(Cell2);

            SelectiveTender SelectiveTender = selectiveTenderDAOImpl.fetchData(Integer.parseInt(tenderD.getSelectiveTender()));

            PdfPCell Ceell2 = new PdfPCell(new Paragraph(SelectiveTender.getSelectivetender_Name(), font));
            table2.addCell(Ceell2);

            PdfPCell Ccell3 = new PdfPCell(new Paragraph("Tender Categories", heading));
            table2.addCell(Ccell3);

            TenderCategory category = categoryDAOImpl.fetchData(Integer.parseInt(tenderD.getTenderCategory()));

            PdfPCell cceell85 = new PdfPCell(new Paragraph(category.getTender_category_name(), font));
            table2.addCell(cceell85);

            PdfPCell Cell3 = new PdfPCell(new Paragraph("Area of Work", heading));
            table2.addCell(Cell3);

            AreaOfWork areaOfWork = areaOfWorkDAOImpl.fetchData(Integer.parseInt(tenderD.getAreaOfWork()));

            PdfPCell Ceell3 = new PdfPCell(new Paragraph(areaOfWork.getAreaofwork_name(), font));
            table2.addCell(Ceell3);

            List<TenderKeyword> tenderkeywords = new ArrayList<>();
            String[] keyWords = tenderD.getTenderKeywords().split(",");
            List<TenderKeyword> name1 = tenderD.getTenderKeywordsNameList();
            PdfPCell Cell4 = new PdfPCell(new Paragraph("Tender Keyword", heading));
            table2.addCell(Cell4);

            PdfPCell Cceell4 = null;
            if (keyWords != null) {
                for (String key : keyWords) {
                    TenderKeyword word = null;
                    if (key != null) {
                        word = tenderKeywordDAOImpl.read(Integer.parseInt(key));
                        tenderkeywords.add(word);
                    }
                }
                String kama = "";
                int i = 0;
                for (TenderKeyword keyword : tenderkeywords) {
                    if (i == 0) {
                        kama = tenderkeywords.get(i).getTenderKeyWordsName();
                        Cceell4 = new PdfPCell(new Paragraph(kama, font));
                    } else {
                        kama = kama + ", " + tenderkeywords.get(i).getTenderKeyWordsName();
                        Cceell4 = new PdfPCell(new Paragraph(kama, font));
                    }
                    i++;
                }

//                for (int i = 0; i < tenderkeywords.size(); i++) {
//                     if (i == 0) {
//                kama = tenderkeywords.get(i).getTenderKeyWordsName();
//                Cceell4 = new PdfPCell(new Paragraph(kama, font));
//            } else {
//                kama = kama + ", " + tenderkeywords.get(i).getTenderKeyWordsName();
//                Cceell4 = new PdfPCell(new Paragraph(kama, font));
//            }
//            i++; 
//                }
                System.out.println("ye aaya hai " + kama);
                Cceell4.setColspan(3);
                table2.addCell(Cceell4);
            }

//            List<TenderKeyword> tenderkeywords = new ArrayList<>();
//            String[] keyWords = tenderD.getTenderKeywords().split(",");
//            List<TenderKeyword> name1 = tenderD.getTenderKeywordsNameList();
//            PdfPCell Cell4 = new PdfPCell(new Paragraph("Tender Keyword", heading));
//            table2.addCell(Cell4);
//
//            PdfPCell Cceell4 = null;
//            if (keyWords != null) {
//                for (String key : keyWords) {
//                    TenderKeyword word = null;
//                    if (key != null) {
//                        word = tenderKeywordDAOImpl.read(Integer.parseInt(key));
//                        tenderkeywords.add(word);
//                    }
//                }
//                String kama = " , ";
//                for (int i = 0; i < tenderkeywords.size(); i++) {
//                    kama = tenderkeywords.get(i).getTenderKeyWordsName().concat(kama);
//                    Cceell4 = new PdfPCell(new Paragraph(kama, font));
//                }
//                Cceell4.setColspan(3);
//                table2.addCell(Cceell4);
//            }
            if ("Work".equals(category.getTender_category_name())) {
                PdfPCell Cell5 = new PdfPCell(new Paragraph("SOR Applicable", heading));
                table2.addCell(Cell5);

                UploadSOR uploadSOR = sorDaoImpl.fecthSORDocumentById(Integer.parseInt(tenderD.getSorDocument()));

                PdfPCell Cceell5 = new PdfPCell(new Paragraph(uploadSOR.getFileName(), font));
                Cceell5.setColspan(3);
                table2.addCell(Cceell5);
            }

            if ("Procurement".equals(category.getTender_category_name())) {

                PdfPCell Cl7 = new PdfPCell(new Paragraph("Buy Back Policy", heading));
                table2.addCell(Cl7);

                if (tenderD.getBuyBackPolicy() == "yes") {

                    PdfPCell Ccell7 = new PdfPCell(new Paragraph("Applicabel", font));
                    Ccell7.setColspan(3);
                    table2.addCell(Ccell7);

                } else {

                    PdfPCell Cceill7 = new PdfPCell(new Paragraph("Not Applicabel", font));
                    Cceill7.setColspan(3);
                    table2.addCell(Cceill7);
                }

            }

            PdfPCell Cell7 = new PdfPCell(new Paragraph("Tender Re-Bid", heading));
            table2.addCell(Cell7);

            PdfPCell Cceell7 = new PdfPCell(new Paragraph(tenderD.getTenderRebid(), font));
            table2.addCell(Cceell7);

            PdfPCell Cell8 = new PdfPCell(new Paragraph("Tender Bid Withdraw", heading));
            table2.addCell(Cell8);

            PdfPCell Cceell8 = new PdfPCell(new Paragraph(tenderD.getTenderBidWithdraw(), font));
            table2.addCell(Cceell8);

            document.add(table2);
            //2nd Table End

            //3nd Table Start
            PdfPTable table3 = new PdfPTable(4);
            table3.setWidthPercentage(100.0f);
            table3.setSpacingBefore(4);
            table3.setSpacingAfter(4f);
            table3.setHeaderRows(1);
            table3.setTotalWidth(500);
            table3.setLockedWidth(true);
            PdfPCell Ccell = new PdfPCell();
            PdfPCell tHeader2 = new PdfPCell(new Paragraph("TENDER DETAILS", heading1));
            tHeader2.setPaddingLeft(10);
            tHeader2.setFixedHeight(20f);
            tHeader2.setColspan(4);
            tHeader2.setVerticalAlignment(Ccell.ALIGN_MIDDLE);
            tHeader2.setBackgroundColor(new BaseColor(255, 219, 174));
            table3.addCell(tHeader2);

//               //3nd Table Start
            PdfPCell Ccell1 = new PdfPCell(new Paragraph("Name Of Work", heading));
            table3.addCell(Ccell1);
            PdfPCell cceell87 = new PdfPCell(new Paragraph(tenderD.getNameOfWork(), font));
            table3.addCell(cceell87);
            PdfPCell Ccell2 = new PdfPCell(new Paragraph("Short Description", heading));
            table3.addCell(Ccell2);

            PdfPCell cceell86 = new PdfPCell(new Paragraph(tenderD.getDescriptionOfWork(), font));
            table3.addCell(cceell86);

            PdfPCell Ccell34 = new PdfPCell(new Paragraph("Estimate Value (In figure) ", heading));
            table3.addCell(Ccell34);

            PdfPCell cceell855 = new PdfPCell(new Paragraph(tenderD.getEmdInFig(), font));
            table3.addCell(cceell855);

            PdfPCell Ccell33 = new PdfPCell(new Paragraph("Estimate Value (In words) ", heading));
            table3.addCell(Ccell33);

            PdfPCell cceell854 = new PdfPCell(new Paragraph(tenderD.getEmdInWords(), font));
            table3.addCell(cceell854);

            PdfPCell ce = new PdfPCell(new Paragraph("Tender Fees (In figure) ", heading));
            table3.addCell(ce);

            PdfPCell e4 = new PdfPCell(new Paragraph(tenderD.getTenderFeeInFig(), font));
            table3.addCell(e4);

            PdfPCell c3 = new PdfPCell(new Paragraph("Tender Fees (In words) ", heading));
            table3.addCell(c3);

            PdfPCell e = new PdfPCell(new Paragraph(tenderD.getTenderFeeInWord(), font));
            table3.addCell(e);

            PdfPCell c = new PdfPCell(new Paragraph("Bid Validate Type", heading));
            table3.addCell(c);

            if ("1".equals(tenderD.getBidValidateType())) {
                PdfPCell e6 = new PdfPCell(new Paragraph("Day", font));
                table3.addCell(e6);
            } else {
                PdfPCell e6 = new PdfPCell(new Paragraph("Month", font));
                table3.addCell(e6);
            }

            PdfPCell c7 = new PdfPCell(new Paragraph("Bid Validate Period", heading));
            table3.addCell(c7);

            PdfPCell e67 = new PdfPCell(new Paragraph(tenderD.getBidValidatePeriod(), font));
            table3.addCell(e67);

            PdfPCell c97 = new PdfPCell(new Paragraph("Work Completion Type", heading));
            table3.addCell(c97);

            if ("1".equals(tenderD.getWorkCompletionType())) {
                PdfPCell e967 = new PdfPCell(new Paragraph("Day", font));
                table3.addCell(e967);
            } else {
                PdfPCell e967 = new PdfPCell(new Paragraph("Month", font));
                table3.addCell(e967);
            }

            PdfPCell c1 = new PdfPCell(new Paragraph("Work Completion Period", heading));
            table3.addCell(c1);

            PdfPCell e1 = new PdfPCell(new Paragraph(tenderD.getWorkCompletionPeriod(), font));
            table3.addCell(e1);

            PdfPCell c10 = new PdfPCell(new Paragraph("Rainy Season", heading));
            table3.addCell(c10);

            PdfPCell e01 = new PdfPCell(new Paragraph(tenderD.getRainySeason(), font));
            table3.addCell(e01);

            document.add(table3);

            //4th Table Start
            PdfPTable table4 = new PdfPTable(4);
            table4.setWidthPercentage(100.0f);
            table4.setTotalWidth(500);
            table4.setLockedWidth(true);
            table4.setSpacingBefore(4);
            table4.setSpacingAfter(4f);
            table4.setHeaderRows(1);
            PdfPCell CCell = new PdfPCell();
            PdfPCell tHeader = new PdfPCell(new Paragraph("BIDDING DETAILS", heading1));
            tHeader.setPaddingLeft(10);
            tHeader.setFixedHeight(20f);
            tHeader.setColspan(4);
            tHeader.setVerticalAlignment(CCell.ALIGN_MIDDLE);
            tHeader.setBackgroundColor(new BaseColor(255, 219, 174));
            table4.addCell(tHeader);

            PdfPCell CCell1 = new PdfPCell(new Paragraph("Envelope Type", heading));
            table4.addCell(CCell1);

            EnvelopeType envelopeType1 = typeDAOImpl.fetchData(Integer.parseInt(tenderD.getEnvelopeType()));

            PdfPCell cceell88 = new PdfPCell(new Paragraph(envelopeType1.getEnvelopeType_Name(), font));
            table4.addCell(cceell88);

            PdfPCell CCll1 = new PdfPCell(new Paragraph("Contractor Class", heading));
            table4.addCell(CCll1);

            ContractorClass contractorClass = classDAOImpl.fetchData(Integer.parseInt(tenderD.getContractorClass()));

            PdfPCell cceell8 = new PdfPCell(new Paragraph(contractorClass.getContractorClass_Name(), font));
            table4.addCell(cceell8);

            PdfPCell CCll = new PdfPCell(new Paragraph("Type Of Tender", heading));
            table4.addCell(CCll);

            TypeOfTenders ofTenders = ofTendersDAOImpl.fetchData(Integer.parseInt(tenderD.getTypeOfTender()));

            PdfPCell ccell8 = new PdfPCell(new Paragraph(ofTenders.getTypeOfTenders_Name(), font));
            table4.addCell(ccell8);

            PdfPCell CCl = new PdfPCell(new Paragraph("EMD Applicable", heading));
            table4.addCell(CCl);

            if ("1".equals(tenderD.getEmdApplicable())) {
                PdfPCell ccel8 = new PdfPCell(new Paragraph("Tender Wishe", font));
                table4.addCell(ccel8);
            } else {
                PdfPCell ccel8 = new PdfPCell(new Paragraph("Item Wishe", font));
                table4.addCell(ccel8);
            }

            PdfPCell CC = new PdfPCell(new Paragraph("EMD (In figure)", heading));
            table4.addCell(CC);

            PdfPCell ccel = new PdfPCell(new Paragraph(tenderD.getEmdInFig(), font));
            table4.addCell(ccel);

            PdfPCell C = new PdfPCell(new Paragraph("EMD (In words)", heading));
            table4.addCell(C);

            PdfPCell ccl = new PdfPCell(new Paragraph(tenderD.getEmdInWords(), font));
            table4.addCell(ccl);

            PdfPCell C0 = new PdfPCell(new Paragraph("MSME / NSIC Exemption", heading));
            table4.addCell(C0);

            if (tenderD.getMsmensicExemption() != null) {
                PdfPCell c0cl = new PdfPCell(new Paragraph(tenderD.getMsmensicExemption(), font));
                table4.addCell(c0cl);
            } else {
                PdfPCell c0cl = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(c0cl);
            }

            PdfPCell C01 = new PdfPCell(new Paragraph("E.M.D Cost", heading));
            table4.addCell(C01);

            if (tenderD.getMsmensicExemption() != null) {
                PdfPCell c0cl = new PdfPCell(new Paragraph(tenderD.getEmdMSMENSICExemption(), font));
                table4.addCell(c0cl);
            } else {
                PdfPCell c0cl = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(c0cl);
            }

            PdfPCell C1 = new PdfPCell(new Paragraph("Tender Fees", heading));
            table4.addCell(C1);

            if (tenderD.getMsmensicExemption() != null) {
                PdfPCell cc1l = new PdfPCell(new Paragraph(tenderD.getEmdMSMENSICExemption(), font));
                table4.addCell(cc1l);
            } else {
                PdfPCell cc1l = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(cc1l);
            }

            PdfPCell C011 = new PdfPCell(new Paragraph("ST / SC Exemption", heading));
            table4.addCell(C011);

            if (tenderD.getScstExemption() != null) {
                PdfPCell c0cl = new PdfPCell(new Paragraph(tenderD.getScstExemption(), font));
                table4.addCell(c0cl);
            } else {
                PdfPCell c0cl = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(c0cl);
            }

            PdfPCell C4011 = new PdfPCell(new Paragraph("E.M.D Cost", heading));
            table4.addCell(C4011);

            if (tenderD.getScstExemption() != null) {
                PdfPCell c0cl = new PdfPCell(new Paragraph(tenderD.getScstExemption(), font));
                table4.addCell(c0cl);
            } else {
                PdfPCell c0cl = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(c0cl);
            }

            PdfPCell C71 = new PdfPCell(new Paragraph("Tender Fees", heading));
            table4.addCell(C71);

            if (tenderD.getScstExemption() != null) {
                PdfPCell cc1l = new PdfPCell(new Paragraph(tenderD.getEmdMSMENSICExemption(), font));
                table4.addCell(cc1l);
            } else {
                PdfPCell cc1l = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(cc1l);
            }

            PdfPCell C11 = new PdfPCell(new Paragraph("OBC Exemption", heading));
            table4.addCell(C11);

            if (tenderD.getObcExemption() != null) {
                PdfPCell c0cl = new PdfPCell(new Paragraph(tenderD.getObcExemption(), font));
                table4.addCell(c0cl);
            } else {
                PdfPCell c0cl = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(c0cl);
            }

            PdfPCell C771 = new PdfPCell(new Paragraph("E.M.D Cost", heading));
            table4.addCell(C771);

            if (tenderD.getObcExemption() != null) {
                PdfPCell c077cl = new PdfPCell(new Paragraph(tenderD.getObcExemption(), font));
                table4.addCell(c077cl);
            } else {
                PdfPCell c077cl = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(c077cl);
            }

            PdfPCell C7771 = new PdfPCell(new Paragraph("Tender Fees", heading));
            table4.addCell(C7771);

            if (tenderD.getObcExemption() != null) {
                PdfPCell cc178l = new PdfPCell(new Paragraph(tenderD.getEmdMSMENSICExemption(), font));
                table4.addCell(cc178l);
            } else {
                PdfPCell cc178l = new PdfPCell(new Paragraph("Not Allowed", font));
                table4.addCell(cc178l);
            }

            document.add(table4);
            //4th Table End

            //5th Table Start               
            PdfPTable table5 = new PdfPTable(4);
            table5.setWidthPercentage(100.0f);
            table5.setTotalWidth(500);
            table5.setLockedWidth(true);
            table5.setSpacingBefore(4);
            table5.setSpacingAfter(4f);
            table5.setHeaderRows(1);
            PdfPCell Cll = new PdfPCell();
            PdfPCell t1Header = new PdfPCell(new Paragraph("DYNAMIC TEMPLATES", heading1));
            t1Header.setPaddingLeft(10);
            t1Header.setFixedHeight(20f);
            t1Header.setColspan(4);
            t1Header.setVerticalAlignment(Cll.ALIGN_MIDDLE);
            t1Header.setBackgroundColor(new BaseColor(255, 219, 174));
            table5.addCell(t1Header);

            if (tenderD.getEnvelopeAOfficersName() != null) {

                PdfPCell Cl = new PdfPCell(new Paragraph("Officer For Envelope A", heading));
                table5.addCell(Cl);

                TenderSubmittedEnvelopeA envelopeA = this.envelopeADaoImpl.read(tender_id);
                System.out.println("The Envelope A is: " + envelopeA.getEnvelopeAOfficers());
                DepartmentUser departmentUser = new DepartmentUser();
                String comma = " ";
                int ii = 0;
                PdfPCell C00l0 = null;
                if (envelopeA != null) {
                    String envelopeAOfficer[] = envelopeA.getEnvelopeAOfficers().split(",");
                    for (String officerA : envelopeAOfficer) {
                        departmentUser = (DepartmentUser) this.departmentUserDaoImpl.fetchData(Integer.parseInt(officerA));
                        System.out.println("The Department User is: " + departmentUser.getFirstName() + " " + departmentUser.getLastName());
                        //comma = departmentUser.getFirstName()+" "+departmentUser.getLastName().concat(comma);
                        if (ii == 0) {
                            comma = departmentUser.getFirstName() + " " + departmentUser.getLastName();
                            C00l0 = new PdfPCell(new Paragraph(comma, font));
                        } else {
                            comma = comma + ", " + departmentUser.getFirstName() + " " + departmentUser.getLastName();
                            C00l0 = new PdfPCell(new Paragraph(comma, font));
                        }
                        ii++;
                    }
                    System.out.println("OFFICER FOR ENVLOP  A IS :: " + comma);
                    C00l0.setColspan(3);
                    table5.addCell(C00l0);
                }

            }

            if (tenderD.getEnvelopeBOfficersName() != null) {

                PdfPCell i8 = new PdfPCell(new Paragraph("Officer For Envelope B", heading));
                table5.addCell(i8);

                TenderSubmittedEnvelopeB envelopeB = this.submittedEnvelopeBDaoImpl.read(tender_id);
                System.out.println("The Envelope B is: " + envelopeB.getEnvelopeBOfficers());
                DepartmentUser departmentUser1 = new DepartmentUser();
                String kama1 = " ";
                int iii = 0;
                PdfPCell C0l0 = null;
                if (envelopeB != null) {
                    String envelopeBOfficer[] = envelopeB.getEnvelopeBOfficers().split(",");
                    for (String officerB : envelopeBOfficer) {
                        departmentUser1 = (DepartmentUser) this.departmentUserDaoImpl.fetchData(Integer.parseInt(officerB));
//            kama1 = departmentUser1.getFirstName()+" "+departmentUser1.getLastName().concat(kama1);

                        if (iii == 0) {
                            kama1 = departmentUser1.getFirstName() + " " + departmentUser1.getLastName();
                            C0l0 = new PdfPCell(new Paragraph(kama1, font));
                        } else {
                            kama1 = kama1 + ", " + departmentUser1.getFirstName() + " " + departmentUser1.getLastName();
                            C0l0 = new PdfPCell(new Paragraph(kama1, font));
                        }
                        iii++;
                    }
                    System.out.println("OFFICER FOR ENVLOP B IS :: " + kama1);
                    C0l0.setColspan(3);
                    table5.addCell(C0l0);
                }

            }

            if (tenderD.getEnvelopeCOfficersName() != null) {

                PdfPCell i9 = new PdfPCell(new Paragraph("Officer For Envelope C", heading));
                table5.addCell(i9);

                TenderSubmittedEnvelopeC envelopeC = envelopeCDaoImpl.read(tender_id);
                System.out.println("The Envelope C is: " + envelopeC.getEnvelopeCOfficers());
                DepartmentUser departmentUser2 = new DepartmentUser();

                String kama2 = " ";
                int iiii = 0;
                PdfPCell C0l1 = null;
                if (envelopeC != null) {
                    String envelopeCOfficer[] = envelopeC.getEnvelopeCOfficers().split(",");
                    for (String officerC : envelopeCOfficer) {
                        departmentUser2 = (DepartmentUser) this.departmentUserDaoImpl.fetchData(Integer.parseInt(officerC));
                        System.out.println("The Department User is: " + departmentUser2.getFirstName() + " " + departmentUser2.getLastName());
//            kama2 = departmentUser2.getFirstName()+" "+departmentUser2.getLastName().concat(kama2);

                        if (iiii == 0) {
                            kama2 = departmentUser2.getFirstName() + " " + departmentUser2.getLastName();
                            C0l1 = new PdfPCell(new Paragraph(kama2, font));
                        } else {
                            kama2 = kama2 + ", " + departmentUser2.getFirstName() + " " + departmentUser2.getLastName();
                            C0l1 = new PdfPCell(new Paragraph(kama2, font));
                        }
                        iiii++;
                    }

                    C0l1.setColspan(3);
                    table5.addCell(C0l1);

                }

            }

            document.add(table5);
            //5th Table End

            // for key date add in pdf file        
            //6th Table Start
            PdfPTable table6 = new PdfPTable(4);
            int i = 1;
            table6.setWidths(new float[]{1, 3, 3, 4});
            table6.setWidthPercentage(100.0f);
            table6.setTotalWidth(500);
            table6.setLockedWidth(true);
            table6.setSpacingBefore(4);
            table6.setSpacingAfter(4f);
            table6.setHeaderRows(1);
            PdfPCell CCCell = new PdfPCell();
            PdfPCell tH1 = new PdfPCell(new Paragraph("TENDER KEY-DATES", heading1));
            tH1.setPaddingLeft(10);
            tH1.setFixedHeight(20f);
            tH1.setColspan(4);
            tH1.setVerticalAlignment(CCCell.ALIGN_MIDDLE);
            tH1.setBackgroundColor(new BaseColor(255, 219, 174));
            table6.addCell(tH1);

            PdfPCell CCCell21 = new PdfPCell(new Paragraph("S-No.", heading));
            table6.addCell(CCCell21);

            PdfPCell CCCeell21 = new PdfPCell(new Paragraph("Stage Name. ", heading));
            table6.addCell(CCCeell21);

            String date = tenderD.getTenderKeyDates().getTenderPurchaseDate();
            String[] dateParts = date.split("/");
            String startDate = dateParts[0];
            String endDate = dateParts[1];

            PdfPCell CCCeeell21 = new PdfPCell(new Paragraph("Start Date and Time", heading));
            table6.addCell(CCCeeell21);

            PdfPCell CCCceeell21 = new PdfPCell(new Paragraph("End Date and Time ", heading));
            table6.addCell(CCCceeell21);

            System.out.println("TENDER STAGE IS :::::#### " + tenderD.getTenderStage());
            System.out.println("openng ec date is  :::::#### " + tenderD.getTenderKeyDates().getOpeningEC());

            if ("2".equalsIgnoreCase(tenderD.getTenderStage())) {

                PdfPCell CCCl = new PdfPCell(new Paragraph("1 ", heading));
                table6.addCell(CCCl);

                PdfPCell Cll22 = new PdfPCell(new Paragraph("TENDER PURCHASE", heading));
                table6.addCell(Cll22);

                PdfPCell eeell22 = new PdfPCell(new Paragraph(startDate, font));
                table6.addCell(eeell22);

                PdfPCell eell22 = new PdfPCell(new Paragraph(endDate, font));
                table6.addCell(eell22);

                PdfPCell CCC = new PdfPCell(new Paragraph("2 ", heading));
                table6.addCell(CCC);

                PdfPCell Cll2 = new PdfPCell(new Paragraph("BID SUBMISSION", heading));
                table6.addCell(Cll2);

                String OPENING = tenderD.getTenderKeyDates().getBidSubmissionDate();
                String[] dateParts1 = date.split("/");
                String startDate1 = dateParts1[0];
                String endDate1 = dateParts1[1];

                PdfPCell eeell2 = new PdfPCell(new Paragraph(startDate1, font));
                table6.addCell(eeell2);

                PdfPCell eel2 = new PdfPCell(new Paragraph(endDate1, font));
                table6.addCell(eel2);

                PdfPCell C9C = new PdfPCell(new Paragraph("3", heading));
                table6.addCell(C9C);

                PdfPCell C2 = new PdfPCell(new Paragraph("OPENING(EA)", heading));
                table6.addCell(C2);

                PdfPCell eeel = new PdfPCell(new Paragraph(tenderD.getTenderKeyDates().getOpeningEA(), font));
                eeel.setColspan(2);
                table6.addCell(eeel);

                PdfPCell C91C = new PdfPCell(new Paragraph("4", heading));
                table6.addCell(C91C);

                PdfPCell C21 = new PdfPCell(new Paragraph("OPENING(EB)", heading));
                table6.addCell(C21);

                PdfPCell eee1l = new PdfPCell(new Paragraph(tenderD.getTenderKeyDates().getOpeningEB(), font));
                eee1l.setColspan(2);
                table6.addCell(eee1l);

            }

            if ("1".equalsIgnoreCase(tenderD.getTenderStage())) {

                PdfPCell pdcw11 = new PdfPCell(new Paragraph("1 ", heading));
                table6.addCell(pdcw11);

                PdfPCell pdcw22 = new PdfPCell(new Paragraph("TENDER PURCHASE", heading));
                table6.addCell(pdcw22);

                PdfPCell pdcw33 = new PdfPCell(new Paragraph(startDate, font));
                table6.addCell(pdcw33);

                PdfPCell eell22 = new PdfPCell(new Paragraph(endDate, font));
                table6.addCell(eell22);

                PdfPCell CCC = new PdfPCell(new Paragraph("2 ", heading));
                table6.addCell(CCC);

                PdfPCell Cll2 = new PdfPCell(new Paragraph("BID SUBMISSION", heading));
                table6.addCell(Cll2);

                String OPENING = tenderD.getTenderKeyDates().getBidSubmissionDate();
                String[] dateParts11 = date.split("/");
                String startDate11 = dateParts11[0];
                String endDate11 = dateParts11[1];

                PdfPCell eeell2 = new PdfPCell(new Paragraph(startDate11, font));
                table6.addCell(eeell2);

                PdfPCell eel2 = new PdfPCell(new Paragraph(endDate11, font));
                table6.addCell(eel2);

                PdfPCell C9C = new PdfPCell(new Paragraph("3", heading));
                table6.addCell(C9C);

                PdfPCell C2 = new PdfPCell(new Paragraph("OPENING(EA)", heading));
                table6.addCell(C2);

                PdfPCell eeel = new PdfPCell(new Paragraph(tenderD.getTenderKeyDates().getOpeningEA(), font));
                eeel.setColspan(2);
                table6.addCell(eeel);

                PdfPCell C91C = new PdfPCell(new Paragraph("4", heading));
                table6.addCell(C91C);

                PdfPCell C21 = new PdfPCell(new Paragraph("OPENING(EB)", heading));
                table6.addCell(C21);

                PdfPCell eee1l = new PdfPCell(new Paragraph(tenderD.getTenderKeyDates().getOpeningEB(), font));
                eee1l.setColspan(2);
                table6.addCell(eee1l);

//              	if (tenderD.getTenderKeyDates().getOpeningEC() != null) {
                PdfPCell CCCl = new PdfPCell(new Paragraph("5 ", heading));
                table6.addCell(CCCl);
//
                PdfPCell Cll22 = new PdfPCell(new Paragraph("OPENING(EC)", heading));
                table6.addCell(Cll22);

                if ("no".equals(tenderD.getTenderKeyDates().getOpeningECaftertechopening())) {
                    System.out.println("EC  ME AAYA ");
                    PdfPCell eeell22 = new PdfPCell(new Paragraph(tenderD.getTenderKeyDates().getOpeningEC(), font));
                    eeell22.setColspan(2);
                    table6.addCell(eeell22);
                } else {
                    System.out.println("EC  NHI ME AAYA ");
                    PdfPCell eeell22 = new PdfPCell(new Paragraph("Opening EC after technical Bid", font));
                    eeell22.setColspan(2);
                    table6.addCell(eeell22);

                }

//                 }
            }
            document.add(table6);
            //6th Table End

            if (tenderD.getPreBidMeetingDate() != null || tenderD.getPreBidMeetingDate().trim().equalsIgnoreCase(" ")) {

                //9th Table Start
                PdfPTable table9 = new PdfPTable(2);
                table9.setWidths(new float[]{3, 3});
                table9.setWidthPercentage(100.0f);
                table9.setTotalWidth(500);
                table9.setLockedWidth(true);
                table9.setSpacingBefore(4);
                table9.setSpacingAfter(4f);
                table9.setHeaderRows(1);
                PdfPCell CCCeell = new PdfPCell();
                PdfPCell teH1 = new PdfPCell(new Paragraph("PRE Bid MEETING VENUE", heading1));
                teH1.setPaddingLeft(10);
                teH1.setFixedHeight(20f);
                teH1.setColspan(4);
                teH1.setVerticalAlignment(CCCeell.ALIGN_MIDDLE);
                teH1.setBackgroundColor(new BaseColor(255, 219, 174));
                table9.addCell(teH1);

                PdfPCell CCCll281 = new PdfPCell(new Paragraph("Pre-Bid Meeting Date", heading));
                table9.addCell(CCCll281);

                PdfPCell CCeell281 = new PdfPCell(new Paragraph("Pre-Bid Meeting Venue", heading));
                table9.addCell(CCeell281);

                PdfPCell C00l = new PdfPCell(new Paragraph(tenderD.getPreBidMeetingDate(), heading));
                table9.addCell(C00l);

                PdfPCell C0l = new PdfPCell(new Paragraph(tenderD.getPreBidMeetingVenue(), heading));
                table9.addCell(C0l);

                document.add(table9);
                //9th Table End

            }

            //8th Table Start  
            PdfPTable table8 = new PdfPTable(2);
            table8.setWidths(new float[]{3, 3});
            table8.setWidthPercentage(100.0f);
            table8.setTotalWidth(500);
            table8.setLockedWidth(true);
            table8.setSpacingBefore(4);
            table8.setSpacingAfter(4f);
            table8.setHeaderRows(1);
            PdfPCell CCCe8ll = new PdfPCell();
            PdfPCell tH18 = new PdfPCell(new Paragraph("APPROVEL OFFICER DETAILS", heading1));
            tH18.setPaddingLeft(10);
            tH18.setFixedHeight(20f);
            tH18.setColspan(4);
            tH18.setVerticalAlignment(CCCe8ll.ALIGN_MIDDLE);
            tH18.setBackgroundColor(new BaseColor(255, 219, 174));
            table8.addCell(tH18);

            PdfPCell CCCell281 = new PdfPCell(new Paragraph("Officer Name", heading));
            table8.addCell(CCCell281);

            PdfPCell CCCeell281 = new PdfPCell(new Paragraph("Officer Email ID", heading));
            table8.addCell(CCCeell281);

            Integer deptId = tenderD.getDeptId();

            List<Object> approvalAuthority = tenderDaoImpl.showApprovalPrivilegeOfficer(deptId);
            //Fetch the approval authority selected in tender
            if (tenderD.getTenderStatus().equalsIgnoreCase("Sent For Approval")) {
                List<String> approvalAuthoritys = Arrays.asList(tenderD.getApprovalOfficer().replaceAll("\\s", "").split(","));

                System.out.println("pprovalAuthoritys" + approvalAuthoritys.size());
                if (approvalAuthoritys != null) {
                    approvalAuthoritys.forEach(new Consumer<String>() {
                        public void accept(String officerAre) {
                            DepartmentUser departmentUser9 = new DepartmentUser();
                            Designation designation = new Designation();
                            departmentUser9 = (DepartmentUser) departmentUserDaoImpl.fetchData(Integer.parseInt(officerAre));
                            
                             if(departmentUser9 !=null) {
                            System.out.println("departmentUser9"+departmentUser9.getReg_Id());
                            System.out.println("APPROVAL OFFICER NAME IS ##  " + departmentUser9.getFirstName());

                            String kama4 = " , ";
                            String kama5 = " , ";

                            kama4 = departmentUser9.getFirstName() + " " + departmentUser9.getLastName();
                            kama5 = departmentUser9.getEmailAdd();

                            PdfPCell C00l10 = new PdfPCell(new Paragraph(kama4, heading));
                            table8.addCell(C00l10);

                            PdfPCell C00l110 = new PdfPCell(new Paragraph(kama5, heading));
                            table8.addCell(C00l110);
                            }

                        }
                    });
                }

            }
            document.add(table8);

            //7th Table Start
            PdfPTable table7 = new PdfPTable(1);
            table7.setWidthPercentage(100.0f);
            table7.setTotalWidth(500);
            table7.setLockedWidth(true);
            table7.setSpacingBefore(4);
            table7.setSpacingAfter(4f);
            table7.setHeaderRows(1);
            PdfPCell CCCcell = new PdfPCell();
            PdfPCell tH11 = new PdfPCell(new Paragraph("TENDER NOTICE", heading1));
            tH11.setPaddingLeft(10);
            tH11.setFixedHeight(20f);
            tH11.setColspan(4);
            tH11.setVerticalAlignment(CCCcell.ALIGN_MIDDLE);
            tH11.setBackgroundColor(new BaseColor(255, 219, 174));
            table7.addCell(tH11);

            String data = tenderD.getTenderNotice();
            data = data.replace("<p>", "");
            data = data.replace("</p>", "");

            PdfPCell CCCcell2 = new PdfPCell(new Paragraph(data, font));
            CCCcell2.setFixedHeight(60f);
            table7.addCell(CCCcell2);

            document.add(table7);

            //7th Table End 
            document.close();
            writer.close();
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        return pathOfFile;
        return name + ".pdf";

    }

}
