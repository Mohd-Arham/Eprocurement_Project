///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.eproc.util;
//
///**
// *
// * @author Kamlesh Patidar
// */
//import com.itextpdf.text.pdf.PdfArray;
//import com.itextpdf.text.pdf.PdfDictionary;
//import com.itextpdf.text.pdf.PdfName;
//import com.itextpdf.text.pdf.PdfReader;
//
//import com.aspose.words.Document;
//import com.aspose.words.FileFormatInfo;
//import com.aspose.words.FileFormatUtil;
//import com.aspose.words.NodeCollection;
//import com.aspose.words.NodeType;
//import com.aspose.words.Shape;
//import ij.IJ;
//import ij.ImagePlus;
//import ij.io.Opener;
//import ij.process.ImageProcessor;
//
//import java.io.*;
//import java.nio.file.Files;
//import java.nio.file.StandardCopyOption;
//import java.util.*;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.apache.tika.metadata.Metadata;
//import org.apache.tika.parser.dwg.DWGParser;
//import org.apache.tika.sax.BodyContentHandler;
//import org.springframework.stereotype.Component;
//import org.springframework.web.multipart.MultipartFile;
//import org.xml.sax.ContentHandler;
//
//
//
//@Component
//public class FileDetector {
//
//   public static void main(String[] args) {
//      File f = new File("C:\\Users\\Windows7\\Pictures\\location\\rnd.png");
//      File fWord = new File("C:\\Users\\Windows7\\Documents\\admin.doc");
//
//      File fImg = new File("C:\\Users\\Windows7\\Documents\\sla.jpg");
//      boolean flag = pdfDetectorImpl(f);
//      boolean flagWord = wordDetectorImpl(f);
//      boolean flagImg = imageDetectorImpl(f);
//      boolean flagImg1 = isExecutable(f);
//      boolean flagImg2 = dwgDetectorImpl(f);
//      System.out.println(" Main Test pdf " + flag);
//      System.out.println(" Main Test word " + flagWord);
//      System.out.println(" Main Test Img " + flagImg);
//      System.out.println(" Main Test Exe " + flagImg1);
//      System.out.println(" Main Test dwg " + flagImg2);
//      
//      
//   }
//
//   public static boolean pdfDetectorImpl(File f) {
//      boolean safeState = false;
//      try {
//         if ((f != null) && f.exists()) {
//				// Load stream in PDF parser
//            // If the stream is not a PDF then exception will be throwed
//            // here and safe state will be set to FALSE
//            PdfReader reader = new PdfReader(f.getAbsolutePath());
//				// Check 1:
//            // Detect if the document contains any JavaScript code
//            String jsCode = reader.getJavaScript();
//            if (jsCode == null) {
//		// OK no JS code then when pass to check 2:
//               // Detect if the document has any embedded files
//               PdfDictionary root = reader.getCatalog();
//               PdfDictionary names = root.getAsDict(PdfName.NAMES);
//               PdfArray namesArray = null;
//               if (names != null) {
//                  PdfDictionary embeddedFiles = names.getAsDict(PdfName.EMBEDDEDFILES);
//                  namesArray = embeddedFiles.getAsArray(PdfName.NAMES);
//               }
//               // Get safe state from number of embedded files
//               safeState = ((namesArray == null) || namesArray.isEmpty());
//            }
//         }
//      } catch (Exception e) {
//         safeState = false;
//         System.out.println("Message : " + e.getMessage());
//      }
//      return safeState;
//   }
//
//   public static boolean imageDetectorImpl(File f) {
//      boolean safeState = false;
//      try {
//         if ((f != null) && f.exists() && f.canRead() && f.canWrite()) {
//            // Load image
//            ImagePlus image = new Opener().openImage(f.getAbsolutePath());
//
//            // Check that image has been successfully loaded
//            if (image == null) {
//               throw new Exception("Cannot load the original image !");
//            }
//
//            // Get current Width and Height of the image
//            int originalWidth = image.getWidth();
//            int originalHeight = image.getHeight();
//
//            // Obtain an Image processor on this image
//            ImageProcessor originalImageProcessor = image.getProcessor();
//            if (originalImageProcessor == null) {
//               throw new Exception("Cannot obtains an image processor for the original image !");
//            }
//
//            // Resize the image by removing 1px on Width and Height
//            ImageProcessor resizedImageProcessor = originalImageProcessor.resize(originalWidth - 1, originalHeight - 1);
//            if (resizedImageProcessor == null) {
//               throw new Exception("Cannot resize the original image !");
//            }
//
//				// Resize the resized image by adding 1px on Width and Height
//            // In fact set image to is initial size
//            ImageProcessor initialSizedImageProcessor = resizedImageProcessor.resize(originalWidth, originalHeight);
//            if (initialSizedImageProcessor == null) {
//               throw new Exception("Cannot restore the initial size of the original image !");
//            }
//
//            // Save image and detect the image format for provided file
//            String imageFormat = Opener.getFileFormat(f.getAbsolutePath());
//            ImagePlus finalImg = new ImagePlus("", initialSizedImageProcessor);
//            IJ.saveAs(finalImg, imageFormat, f.getAbsolutePath());
//
//				// IJ will save the file with the extension associated to the image format (ex: jpg or png)
//            // but, as the provided input file can have any extension (we do not use it to detect image format),
//            // then we must manage the case in which 2 files exists at this point:
//            // 1) The input file provided (ex: myfile.tmp)
//            // 2) The new file saved by IJ (ex: myfile.png)
//            String tmp = f.getName();
//            String newSavedFileName = tmp.substring(0, tmp.lastIndexOf(".") + 1) + imageFormat;
//            File newSavedFile = new File(f.getParentFile(), newSavedFileName);
//            if (newSavedFile.exists() && !f.getAbsolutePath().equalsIgnoreCase(newSavedFile.getAbsolutePath())) {
//               // Overwrite content of the input file with the content of the new saved file
//               Files.copy(newSavedFile.toPath(), f.toPath(), StandardCopyOption.REPLACE_EXISTING);
//               // Remove file saved by IJ
//               newSavedFile.delete();
//            }
//
//            // Set state flag
//            safeState = true;
//         }
//
//      } catch (Exception e) {
//         safeState = false;
//         System.out.println("Message : " + e.getMessage());
//      }
//
//      return safeState;
//   }
//
//   public static boolean wordDetectorImpl(File f) {
//      final List<String> ALLOWED_FORMAT = Arrays.asList(new String[]{"doc", "docx", "docm", "wml", "dot", "dotm"});
//      boolean safeState = false;
//      try {
//         if ((f != null) && f.exists() && f.canRead()) {
//            // Perform a first check on Word document format
//            FileFormatInfo formatInfo = FileFormatUtil.detectFileFormat(f.getAbsolutePath());
//            String formatExtension = FileFormatUtil.loadFormatToExtension(formatInfo.getLoadFormat());
//            if ((formatExtension != null) && ALLOWED_FORMAT.contains(formatExtension.toLowerCase(Locale.US).replaceAll("\\.", ""))) {
//               // Load the file into the Word document parser
//               Document document = new Document(f.getAbsolutePath());
//               // Get safe state from Macro presence
//               safeState = !document.hasMacros();
//               // If document is safe then we pass to OLE objects analysis
//               if (safeState) {
//                  // Get all shapes of the document
//                  NodeCollection shapes = document.getChildNodes(NodeType.SHAPE, true);
//                  Shape shape = null;
//                  // Search OLE objects in all shapes
//                  int totalOLEObjectCount = 0;
//                  for (int i = 0; i < shapes.getCount(); i++) {
//                     shape = (Shape) shapes.get(i);
//                     // Check if the current shape has OLE object
//                     if (shape.getOleFormat() != null) {
//                        totalOLEObjectCount++;
//                     }
//                  }
//                  // Update safe status flag according to number of OLE object found
//                  if (totalOLEObjectCount != 0) {
//                     safeState = false;
//                  }
//
//               }
//            }
//         }
//      } catch (Exception e) {
//         safeState = false;
//         System.out.println("Message : " + e.getMessage());
//      }
//      return safeState;
//   }
//   public static boolean isExecutable(File file) {
//        byte[] firstBytes = new byte[4];
//        try {
//            FileInputStream input = new FileInputStream(file);
//            input.read(firstBytes);
//
//            // Check for Windows executable
//            if (firstBytes[0] == 0x4d && firstBytes[1] == 0x5a) {
//                return false;
//            }
//            return true;
//        } catch (Exception e) {           
//            e.printStackTrace();
//            //return false;
//        }
//        return true;
//    }
//   
//   public static boolean dwgDetectorImpl(File file)  {
//    boolean flag =false;
//        try {
//           InputStream input = new FileInputStream(file);
//            Metadata metadata = new Metadata();
//            ContentHandler handler = new BodyContentHandler();
//            new DWGParser().parse(input, handler, metadata);
//            
//             flag = true;
//
//                 
//        } catch(Exception ex){
//           System.out.println("Msg dwg : "+ex.getMessage());
//        }
//        
//        return flag;
//    }
//   
//   public static boolean readXLSFile(File file)  {
//        boolean flag = false;
//        try {
//           InputStream ExcelFileToRead = new FileInputStream(file);
//           XSSFWorkbook xssfWorkBook = new XSSFWorkbook(ExcelFileToRead);
//            flag = true;           
//            return flag;
//        } catch (Exception e) {
//           System.out.println("Message excel "+e.getMessage());
//        }
//        return flag;
//    }
//
//}
