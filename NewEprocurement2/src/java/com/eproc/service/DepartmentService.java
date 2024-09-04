package com.eproc.service;
import java.io.*;
import java.util.Random;
//import com.eproc.domain.Department;
//import com.eproc.util.FileDetector;
import javax.mail.Multipart;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/*
 *This class is used for save file 
 * @Author Anshu baghel
 */
@Service
public class DepartmentService {

    public static final String TMP_DIR = System.getProperty("java.io.tmpdir");
    /* This method is used to save workorder file and department logo
     *
     *@Param file
     *@Param request
     *@Param fileOriginalName 
     *
     *@return string
     */
    public String saveDepartmentFile(MultipartFile file, HttpServletRequest request, String fileOriginalName) {
        System.out.println("-------------------method saveDepartmentFile call to save file-------------------- ");
        String contextPath = request.getContextPath() + "/resources/location";
        try {
//            String rootPath = System.getProperty("catalina.home");

            //File file12 = new File
            String ext = fileOriginalName.substring(fileOriginalName.indexOf("."));
            String convertedFileName = fileOriginalName.substring(0, fileOriginalName.indexOf(".")) + fetchRandomNo() + ext;

            String realPath = request.getRealPath("/resources/location");
            realPath = realPath + File.separator + convertedFileName;
//            System.out.println("TMP_DIR  " + TMP_DIR);
//            System.out.println("fileOriginalName : " + file12);
//            FileDetector filedetector = new FileDetector();
            // File file1 = new File(file12);           
//            boolean flag = filedetector.isExecutable(file12);
//            System.out.println("Flag   :  " + flag);
            byte[] bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(realPath)));
            stream.write(bytes);
            stream.close();

            contextPath = contextPath + File.separator + convertedFileName;
            System.out.println("context path***********************************" + contextPath);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        System.out.println("context path   end***********************************" + contextPath);
        System.out.println("-----------Method saveDepartmentFile end to save file----------------");
        return contextPath;
    }

    /* This method is used to get random number
     *
     *@return string
     */
    public String fetchRandomNo() {
        String str = "0123456789";
        try {
            StringBuilder sb = new StringBuilder();
            Random rand = new Random();
            for (int i = 0; i < 5; i++) {
                sb.append(str.charAt(rand.nextInt(str.length())));
            }
            System.out.println("Random no is : " + sb.toString());
            str = sb.toString();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return str;
    }
    
    public String saveFile(MultipartFile file, HttpServletRequest request, String fileOriginalName) {
        System.out.println("-------------------method saveDepartmentFile call to save file-------------------- ");
        String contextPath = request.getContextPath() + "/resources/location";
        try {
            file.getOriginalFilename();
            System.out.println("file.getOriginalFilename()" + file.getOriginalFilename());
            String ext = fileOriginalName.substring(fileOriginalName.indexOf("."));
            String convertedFileName = fileOriginalName.substring(0, fileOriginalName.indexOf(".")) + fetchRandomNo() + ext;

            String realPath = request.getRealPath("/resources/location");
            realPath = realPath + File.separator + convertedFileName;
            System.out.println("real path " + realPath);
            byte[] bytes = file.getBytes();
            try (BufferedOutputStream stream1 = new BufferedOutputStream(new FileOutputStream(new File(realPath)))) {
                stream1.write(bytes);
                stream1.close();
            }
            contextPath = contextPath + File.separator + convertedFileName;
            System.out.println("context path***********************************" + contextPath);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("context path   end***********************************" + contextPath);
        System.out.println("-----------Method saveDepartmentFile end to save file----------------");
        return contextPath;
    }
    
    public String convName(MultipartFile file, String fileOriginalName) 
    {
        file.getOriginalFilename();
        System.out.println("file.getOriginalFilename()" + file.getOriginalFilename());
        String ext = fileOriginalName.substring(fileOriginalName.indexOf("."));
        String convertedFileName = fileOriginalName.substring(0, fileOriginalName.indexOf(".")) + fetchRandomNo() + ext;
        return convertedFileName;
    }
}
