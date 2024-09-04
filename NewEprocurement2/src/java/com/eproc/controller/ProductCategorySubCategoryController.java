/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.ProductCategoryDAOImpl;
import com.eproc.daoImpl.ProductSubCategoryDAOImpl;
import com.eproc.domain.Logs;
import com.eproc.domain.ProductCategory;
import com.eproc.domain.ProductSubCategory;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.google.gson.Gson;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Mansi Jain
 */
@Controller
public class ProductCategorySubCategoryController {

    @Autowired
    ProductCategoryDAOImpl productCategoryDao;
    @Autowired
    ProductSubCategoryDAOImpl productSubCategoryDao;
    @Autowired
    SessionFactory sessionfactory;
    @Autowired
    LogsActionDao logsActionDao;
    @Autowired
    LogsAction LogsAction;
    Logs logs = new Logs();
    
    Gson gson = new Gson();

    /*
     *  initBinder 
     * Method used to apply the server side validation 
     * @param binder
     * @return CircleDivisionSubDivision.jsp
     */
    @InitBinder("category")
    protected void initProductCategoryBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for ProductCategory");
        //binder.setValidator((Validator) new ProductCategoryModel());
    }

    @InitBinder("productSubCategory")
    protected void initProductSubCategoryBinder(WebDataBinder binder) {
        System.out.println("Call initBinder Method for productSubCategory");
        //binder.setValidator((Validator) new ProductSubCategoryModel());
    }

    @RequestMapping("/manageProductCategorySubCategory")
    public String manageProductCategory(Model m, @ModelAttribute("category") ProductCategory productCategory, @ModelAttribute("productSubCategory") ProductSubCategory productSubCategory, HttpSession session) {
        System.out.println("Manage Product Category here");
        m.addAttribute("pcategory", new ProductCategory());
        m.addAttribute("productSubCategory", new ProductSubCategory());
        List<ProductCategory> productList = productCategoryDao.fetchAllProductCategorybyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("productList", productList);
        return "DepartmentAdmin/ProductCategorySubCategory";
    }

    @RequestMapping("/AllProductCategory")
    public String AllProductCategory(Model m, @ModelAttribute("category") ProductCategory productCategory, @ModelAttribute("productSubCategory") ProductSubCategory productSubCategory, HttpSession session) {
        System.out.println("Manage Product Category here");
        m.addAttribute("category", new ProductCategory());
        List<ProductCategory> productCategoryList = productCategoryDao.fetchAllProductCategorybyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("productCategoryList", productCategoryList);
        m.addAttribute("msg21", "List of all ProductCategories");
        return "DepartmentAdmin/viewAllData";
    }

    @RequestMapping("/AllProductSubCategory")
    public String AllProductSubCategory(Model m, @ModelAttribute("productSubCategory") ProductSubCategory productSubCategory, HttpSession session) {
        System.out.println("Manage Product Category here");
        m.addAttribute("productSubCategory", new ProductSubCategory());
        List<ProductSubCategory> productSubCategoryList = productSubCategoryDao.fetchAllProductSubCategorybyDept_ID((Integer) session.getAttribute("deptId"));
        m.addAttribute("productSubCategoryList", productSubCategoryList);
        m.addAttribute("msg22", "List of all ProductSubCategories");
        return "DepartmentAdmin/viewAllData";
    }

    /*
     * add ProductCategory 
     * Method used to add Product  Category 
     * @param modelAtribute Category
     * @return jsp page
     */
    @RequestMapping("/saveProductCategories")
    @ResponseBody
    public String saveCategory(@ModelAttribute("pcategory") @Validated ProductCategory pcategory, BindingResult result, @ModelAttribute("productSubCategory") ProductSubCategory productSubCategory, Model m,
            @RequestParam Integer productCategoryId, HttpServletRequest request, HttpSession session) {
        System.out.println("---------------------------Method called to save Product category-----------------------------------"+pcategory.getProductCategoryName());
        System.out.println("ProductCategoryId is::" + productCategoryId);
        String message = "";
        Gson gson = new Gson();
        List<ProductCategory> productCategoryList = null;
        Date date = new Date();
        pcategory.setCreated_date(date);

        if (productCategoryId != null) {
            pcategory.setProductCategoryId(productCategoryId);
            ProductCategory p = productCategoryDao.fetchData(productCategoryId);
            logs.setLogMessage(p.getProductCategoryName() + " Product Category Updated Successfully " + pcategory.getProductCategoryName());
        } else {
            logs.setLogMessage("Product Category Added Successfully");
        }
        try {
            if (result.hasErrors()) {
                System.out.println("****************validate******************");
                return "ProductCategorySubCategory";
            }

            Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
            pcategory.setDeptId(deptID);
            message = productCategoryDao.checkDuplicateValue(pcategory, deptID);

            if (!message.equalsIgnoreCase("Duplicate productCategory Name") && !message.equalsIgnoreCase("Enter productCategory Name")) {
                logs.setIpAddress(LogsAction.fetchIpAddress());
                logs.setOsName(LogsAction.FetchOSName());
                logs.setBrowserName(LogsAction.getClientBrowser(request));
                logs.setMacAddress(LogsAction.fetchMacAddress());
                logsActionDao.save(logs);
                productCategoryDao.insertData(pcategory);
                String msg = "Product Category Added Successfully";
                return gson.toJson(msg);
            } else if (message.equals("Duplicate productCategory Name")) {
//                ra.addFlashAttribute("msg2", "Product Category is Alredy Exists");
//                return "redirect:/manageProductCategorySubCategory";
                String msg2 = "Product Category Already Exist";
                return gson.toJson(msg2);
            } else if (message.equals("Enter productCategory Name")) {
//                ra.addFlashAttribute("msg2", "Please Enter ProductCategory");
//                return "redirect:/manageProductCategorySubCategory";
                String msg2 = "Please Enter Product Category name";
                return gson.toJson(msg2);
            }
            productCategoryList = productCategoryDao.fetchAllProductCategorybyDept_ID(deptID);

        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductCategoryController\nMethod:saveCategory");
        }
        System.out.println("---------------------------Method End to save Product category-----------------------------------");
        return gson.toJson(productCategoryList);
    }

    /*
     * add ProductSubCategory 
     * Method used to add Product Sub Category 
     * @param modelAtribute productSubCategory
     * @return jsp page
     */
    @RequestMapping("/saveProductSubCategory")
    @ResponseBody
    public String saveProductSubCategory(@ModelAttribute("productSubCategory")
            @Validated ProductSubCategory productSubCategory, BindingResult result,
            @ModelAttribute("category") ProductCategory productCategory, Model m,
            @RequestParam Integer productSubCategoryId, @RequestParam Integer productCategoryId,
            HttpServletRequest request, HttpSession session) {
        System.out.println("---------------------------Method called to save Product Subcategory-----------------------------------");
        System.out.println("cateID::" + productCategoryId);
        Gson gson = new Gson();

        if (productSubCategoryId != null) {
            productSubCategory.setProductSubCategoryId(productSubCategoryId);
        }
//              productSubCategory.setProductCategoryId(Integer.parseInt(productCategoryId));
        List<ProductCategory> productSubCategoryList = null;
        try {

            if (result.hasErrors()) {
                System.out.println("****************validate******************");
                return "ProductCategorySubCategory";
            }

            System.out.println("The category id is: " + productSubCategory.getProductCategoryId());
            productCategory = productCategoryDao.fetchData(productSubCategory.getProductCategoryId());
            System.out.println("The product category name is: " + productCategory);
            productSubCategory.setProductCategoryName(productCategory.getProductCategoryName());

            Date date = new Date();
            productSubCategory.setCreated_Date(date);
            Integer deptID = (Integer) session.getAttribute("deptId");
            System.out.println("department id  " + deptID);
            productSubCategory.setDeptId(deptID);
            String message = "";
            message = productSubCategoryDao.checkDuplicateValue(productSubCategory, deptID);
            System.out.println("-------------#1-----------------" + message);
            if (!message.equalsIgnoreCase("Duplicate productSubCategory") && !message.equalsIgnoreCase("Enter ProductSubCategory")) {
                productSubCategoryDao.insertData(productSubCategory);
//                ra.addFlashAttribute("msg", "Product Sub-Category Added Successfully");
                logs.setIpAddress(LogsAction.fetchIpAddress());
                logs.setOsName(LogsAction.FetchOSName());
                logs.setBrowserName(LogsAction.getClientBrowser(request));
                logs.setMacAddress(LogsAction.fetchMacAddress());
                logsActionDao.save(logs);
                String msg = "Product Sub-Category Added Successfully";
                return gson.toJson(msg);
            } else if (message.equals("Duplicate productSubCategory")) {
//                ra.addFlashAttribute("msg2", "Product Sub-Category is Alredy Exists");
//                return "redirect:/manageProductCategorySubCategory";
                String msg2 = "Product Sub-Category Already Exist";
                return gson.toJson(msg2);
            } else if (message.equals("Enter productSubCategory")) {
//                ra.addFlashAttribute("msg2", "Please Enter ProductSubCategory");
//                return "redirect:/manageProductCategorySubCategory";
                String msg2 = "Please Enter Product Sub-Category name";
                return gson.toJson(msg2);
            }
            productSubCategoryList = productSubCategoryDao.fetchProductSubCategory(productCategoryId);
            System.out.println(" productSubCategoryId:: " + productSubCategoryId);

        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductSubCategoryController \n Method:saveProductSubCategory");

        }
        System.out.println("---------------------------Method end to save Product Sub category-----------------------------------");

        return gson.toJson(productSubCategoryList);
    }

    /*
     * getProductCategory
     * Method used to fetchProduct Category 
     * @return productList
     */
    @RequestMapping("/getProductcategory")
    @ResponseBody
    public List<ProductCategory> getProductcategory(HttpSession session) {
        System.out.println("---------------------------Method called to Fetch Product category-----------------------------------");
        List<ProductCategory> productCategoryList = productCategoryDao.fetchAllProductCategorybyDept_ID((Integer) session.getAttribute("deptId"));
        System.out.println("---------------------------Method End to Fetch Product category-----------------------------------");
        return productCategoryList;
    }

    /*
     *  getProductCategory
     * Method used to fetchProduct Category 
     * @return productList
     */
    @RequestMapping("/getAllProductSubcategory")
    @ResponseBody
    public List<ProductSubCategory> getAllProductSubcategory(HttpSession session) {
        System.out.println("---------------------------Method called to Fetch Product category-----------------------------------");
        List<ProductSubCategory> productSubCategoryList = productSubCategoryDao.fetchAllProductSubCategorybyDept_ID((Integer) session.getAttribute("deptId"));
        System.out.println("---------------------------Method End to Fetch Product category-----------------------------------");
        return productSubCategoryList;
    }

    @RequestMapping(value = "/getProductSubCategory")
    @ResponseBody
    public List<ProductSubCategory> getProductSubCategory(@RequestParam Integer productCategoryId) {
        System.out.println("...............getProductSubCategory controller................");
        System.out.println("ProductSubCategory Id@@" + productCategoryId);
        List<ProductSubCategory> productSubCategoryList = productSubCategoryDao.fetchProductSubCategory(productCategoryId);
        System.out.println("productSubCategory list size:: " + productSubCategoryList.size());
        return productSubCategoryList;
    }

    /*
     * edit ProductSubCategory 
     * Method used to edit Product Sub Category 
     * @param productSubCategoryId
     * @return jsp page
     */
    @RequestMapping("/editProductSubCategory")
    @ResponseBody
    public ProductSubCategory editProductSubCategory(@RequestParam Integer productSubCategoryId) {
        System.out.println("---------------------------Method called to edit Product Sub category-----------------------------------");
        ProductSubCategory productSubCategory = null;
        try {
            productSubCategory = productSubCategoryDao.fetchData(productSubCategoryId);
            Integer p_id = productSubCategory.getProductCategoryId();
            ProductCategory productCategory = productCategoryDao.fetchData(p_id);
            productSubCategory.setProductCategoryName(productCategory.getProductCategoryName());

        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductSubCategoryController\nMethod:editProductSubCategory");
        }
        System.out.println("---------------------------Method End to edit Product Subcategory-----------------------------------");
        return productSubCategory;

    }

    /*
     * edit ProductSubCategory 
     * Method used to edit Product Sub Category 
     * @param productSubCategoryId
     * @return jsp page
     */
    @RequestMapping("/editProductCategory")
    @ResponseBody
    public ProductCategory editProductCategory(@RequestParam Integer productCategoryId) {
        System.out.println("---------------------------Method called to edit Product category-----------------------------------");
        ProductCategory productCategory = null;
        try {
            productCategory = productCategoryDao.fetchData(productCategoryId);

        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:ProductSubCategoryController\nMethod:editProductCategory");
        }
        System.out.println("---------------------------Method End to edit Product Category-----------------------------------");
        return productCategory;

    }
    
    //Delete_ProductCategory AlertDeleteButton*//    
    @RequestMapping("/delete_ProductCategoryAlert")
    @ResponseBody
    public String delete_ProductCategoryAlert(@RequestParam Integer id, Model m) {
        System.out.println("editKeyword method run"+id); 
        try {
            String response="";
   ProductCategory procategory = productCategoryDao.fetchData(id);
            System.out.println("RRRRRRRRRRRRRRRRRRR bbbbbbbbbbbbbbbbbbbb");
boolean productCategorydelete=productCategoryDao.removeData(procategory.getProductCategoryId());
            System.out.println("productSubCategorydelete .........................."+productCategorydelete);
  if(productCategorydelete){
      System.out.println("Tender ProductSubCategory Deleted Successfully");
      response="Tender Product Category Deleted Successfully";
  }
  else{
    
      response="FALSE";
  }
  
            
            return gson.toJson(response);
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
    }
    
       //Delete_ProductSubCategory AlertDeleteButton*//    
    @RequestMapping("/delete_ProductSubCategoryAlert")
    @ResponseBody
    public String delete_ProductSubCategoryAlert(@RequestParam Integer id, Model m) {
        System.out.println("editKeyword method run"+id); 
        try {
            String response="";
   ProductSubCategory proSubcategory = productSubCategoryDao.fetchData(id);
            System.out.println("RRRRRRRRRRRRRRRRRRR bbbbbbbbbbbbbbbbbbbb");

                         
            boolean productSubCategorydelete=productSubCategoryDao.removeData(proSubcategory.getProductSubCategoryId());
            System.out.println("productSubCategorydelete .........................."+productSubCategorydelete);
  if(productSubCategorydelete){
      System.out.println("Tender ProductSubCategory Deleted Successfully");
      response="Tender Product SubCategory Deleted Successfully";
  }
           
  else{
    
      response="FALSE";
      }
 
            
            return gson.toJson(response);
            
        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
    }
}
