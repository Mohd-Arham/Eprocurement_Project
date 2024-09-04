<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="en" ng-app="myApp">

<!-- begin::Head -->

<head>
    <meta charset="utf-8" />
    <title>Department User | Dashboard</title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon lotus procure -->
<!--    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
    <!--begin::Web font -->
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        WebFont.load({
            google: {
                "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
            },
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <style>
        .ValidationMsg{
            color: red;
        }
        .form-group .k-list .k-list__item {
    padding: 0.04rem 0;
}
    </style>

    <!--end::Web font -->
 
    <!--begin:: Global Mandatory Vendors -->
    <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />

    <!--end:: Global Mandatory Vendors -->

    <!--begin:: Global Optional Vendors -->
    <link href="<c:url value="/resources/vendors/tether/dist/css/tether.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-timepicker/css/bootstrap-timepicker.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-select/dist/css/bootstrap-select.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/nouislider/distribute/nouislider.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/owl.carousel/dist/assets/owl.carousel.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/owl.carousel/dist/assets/owl.theme.default.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/dropzone/dist/dropzone.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/summernote/dist/summernote.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-markdown/css/bootstrap-markdown.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/animate.css/animate.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/toastr/build/toastr.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/morris.js/morris.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/chartist/dist/chartist.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/sweetalert2/dist/sweetalert2.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/socicon/css/socicon.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/vendors/line-awesome/css/line-awesome.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/vendors/flaticon/css/flaticon.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/vendors/fontawesome5/css/all.min.css"/>" rel="stylesheet" type="text/css" />

    <!--end:: Global Optional Vendors -->

    <!--begin::Global Theme Styles -->
    <link href="<c:url value="/resources/assets/demo/base/style.bundle.css"/>" rel="stylesheet" type="text/css" />

    <!--RTL version:<link href="assets/demo/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Global Theme Styles -->
    <!--begin::Page Vendors Styles -->
    <link href="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.css"/>" rel="stylesheet" type="text/css" />
    <!--begin::Page Vendors Styles -->
    <link href="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css"/>" rel="stylesheet" type="text/css" />

    <!--RTL version:<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Page Vendors Styles -->
    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/faviconlp.ico"/>" />
    <!-- coustom_style_css -->
    <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
     <!-- Angular script -->
   
     
    
</head>

<!-- end::Head -->

<!-- begin::Body -->

<body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="MyController">
<div id="preloaderSpinner" class="preloader spinner">
    <div class="spinWrap">
        <p class="spinnerImage"></p>
        <p class="loader"></p>
        <p class="loadingMessage" id="spinnerMessage"></p>
    </div>
</div> 
    

    <!-- begin:: Page -->

    <!-- begin:: Header Mobile -->
    <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
        <div class="k-header-mobile__logo">
            <a href="index.html">
                <img alt="Logo" src="assets/demo/media/logo-light.png" style="max-width: 100%;" />
            </a>
        </div>
        <div class="k-header-mobile__toolbar">
            <button class="k-header-mobile__toolbar-toggler k-header-mobile__toolbar-toggler--left" id="k_aside_mobile_toggler"><span></span></button>
            <button class="k-header-mobile__toolbar-toggler" id="k_header_mobile_toggler"><span></span></button>
            <button class="k-header-mobile__toolbar-topbar-toggler" id="k_header_mobile_topbar_toggler"><i class="flaticon-more-1"></i></button>
        </div>
    </div>

    <!-- end:: Header Mobile -->
    <div class="k-grid k-grid--hor k-grid--root">
        <div class="k-grid__item k-grid__item--fluid k-grid k-grid--ver k-page">

            <!-- begin:: Aside -->
            <jsp:include page="Tiles/DashBoardAsidenav.jsp"/>
            <!-- end:: Aside -->
            <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                <!-- begin:: Header -->
              <jsp:include page="Tiles/Header.jsp"/>
                <!-- end:: Header -->

                <!-- begin:: Content -->
                <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

              
                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">My Profile</h3>

                            </div>
                        </div>

                        <!-- end:: Content Head -->
                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="k-portlet alert_part circle_create">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon ">
                                                    <i class="flaticon-add"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">Basic Details</h3>
                                            </div>
                                        </div>
                                     
                                        <div class="k-portlet__body">
                                            
                                            <div class="border_boxesDiv mb-4" id="showReadonly">
                               
                               <table class="table table-striped- table-bordered table-hover table-checkable ">
                         <tbody>
                            <tr>
                                <th><span class="dwn_arrow">Name</span></th>
                                <td class="upr_text" ><span class="rs_ic">${departmentUser.firstName}&nbsp;${departmentUser.lastName}</span></td>
                                <th><span class="dwn_arrow">Designation</span></th>
                                <td class="upr_text" ><span class="rs_ic">${departmentUser.designations}</span></td>
                            </tr>
                          
                            <tr>
                                <th><span class="dwn_arrow">Email</span></th>
                                <td class="upr_text" ><span class="rs_ic">${departmentUser.emailAdd}</span></td>
                                 <th><span class="dwn_arrow">Mobile</span></th>
                                <td class="upr_text" ><span class="rs_ic">${departmentUser.mobNo}</span></td>
                                
                            </tr>
                           
                             </tbody>
                    </table>
                                     <table class="table table-striped- table-bordered  table-checkable ">
                                            <tbody>
                                                <tr>
                                                    <th><span class="dwn_arrow">Circle</span></th>
                                                    <td class="upr_text" ><span class="rs_ic">${departmentUser.circle}</span></td>
                                                    <th><span class="dwn_arrow">Division</span></th>
                                                    <td class="upr_text" ><span class="rs_ic">${departmentUser.division}</span></td>
                                                    <th><span class="dwn_arrow">Subdivision</span></th>
                                                    <td class="upr_text" ><span class="rs_ic">${departmentUser.subDivision}</span></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                                 
                                                 
                                                 
                                                 
                                        <table class="table table-striped- table-bordered  table-checkable ">
                                            <tbody>
                                                <tr>
                                                        <th><span class="dwn_arrow">Address</span></th>
                                                    <td colspan="2" class="upr_text" ><span class="rs_ic">${departmentUser.address}</span></td> 
                                               
                                                    <th><span class="dwn_arrow">PinCode</span></th>
                                                    <td class="upr_text" ><span class="rs_ic">${departmentUser.pincode}</span></td>
                                                 </tr>
                                            </tbody>
                                        </table>
                                   
                           
                          
                           
               
                                                <button type="button" class="btn btn-primary btn-sm"  onclick="editDeptUserProfile();"><i class="flaticon-edit"></i>Edit</button>
                          </div>
                                            <!--########################-->
                                            <div class="border_boxesDiv mb-4" id="showEdit" >
                                                
                                                 <form:form   id="form" modelAttribute="departmentUser" class="registerForm k-form" >
                                                    <form:hidden path="reg_Id" id="reg_Id"/>
                                                    <div class="form-group border_boxesDiv">
                                                       <div class="row">
                                                            <div class="col-lg-6">
                                                                <label for="firstName">First Name<i style="color: red;">*</i></label>
                                                                <div class="k-input-icon k-input-icon--right">

                                                                    <form:input class="form-control" id="firstName" placeholder="" path="firstName" style="text-transform: uppercase;"/>

                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                <span class="form-text  ValidationMsg"  id="firstNameError"></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label for="lastName">Last Name<i style="color: red;">*</i></label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    <form:input class="form-control" id="lastName" placeholder=" " path="lastName"  style="text-transform: uppercase;"/>
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                <span class="form-text  ValidationMsg"  id="lastNameError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group border_boxesDiv">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <label for="emailAdd">Email Id<i style="color: red;">*</i></label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    
                                                                  
                                                                    <form:input class="form-control emailAdd" id="emailAdd" path="emailAdd" placeholder=" " />
                                                                   <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-envelope"></i></span></span>
                                                                <span class="form-text  ValidationMsg"  id="emailAddError"></span>
                                                                </div>
                                                                   <input type="hidden" id="isEmail"  value="${departmentUser.emailAdd}" >
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label for="mobNo">Mobile No.<i style="color: red;">*</i></label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                   
                                                                   
                                                                    <form:input class="form-control" id="mobNo" path="mobNo" placeholder=" "/>
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                                 <span class="form-text  ValidationMsg"  id="mobNoError"></span>
                                                                </div>
                                                                     <input type="hidden" id="isMobile"  value="${departmentUser.mobNo}" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group border_boxesDiv">
                                                         <div class="row">
                                                            <div class="col-lg-6">
                                                                <label for="designationList">Designation<i style="color: red;">*</i></label>
                                                                <form:select  class="form-control " path="designationName" id="designationList" ><form:option value="">Select Designation</form:option>
                                                                    <c:forEach var="designationList" items="${designationList}" >  
                                                                        <form:option value="${designationList.designationid}">${designationList.designation}</form:option>  
                                                                    </c:forEach>
                                                                </form:select>


                                                                <span></span>
                                                                   <span class="form-text  ValidationMsg"  id="designationError" style="color: red;"></span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label for="circle1">Circle/Basin/Project<i style="color: red;">*</i></label>
                                                                <input type="hidden" value="${departmentUser.deptcircle}" id="circle11">
                                                                <form:select  class="form-control " path="deptcircle" id="circle1" onchange="getDivision(this.value,'0')" ><form:option value="">Select Circle</form:option>
                                                                    <c:forEach var="circleList" items="${circleList}" >  
                                                                        <form:option value="${circleList.circleid}">${circleList.circle}</form:option>  
                                                                    </c:forEach>
                                                                </form:select>
                                                                <span></span>
                                                                <span class="form-text  ValidationMsg"  id="circleError" style="color: red;"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group border_boxesDiv">
                                                         <div class="row">
                                                            <div class="col-lg-6">
                                                                <label for="division1">Division<i style="color: red;">*</i></label>
                                                                <input type="hidden" value="${departmentUser.deptDivision}" id="division11">
                                                                <form:select class="form-control " path="deptDivision" id="division1" onchange="getSubDivision(this.value,'0');"  >

                                                                </form:select>
                                                                <span></span>
                                                                <span class="form-text  ValidationMsg"  id="divisionError" style="color: red;"></span>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label for="subDivision1">Sub Division<i style="color: red;">*</i></label>
                                                                <input type="hidden" value="${departmentUser.deptSubDivision}" id="subDivision11">
                                                                <form:select class="form-control " path="deptSubDivision" id="subDivision1" >

                                                                </form:select>
                                                                <span></span>
                                                                  <span class="form-text  ValidationMsg"  id="subDivisionError" style="color: red;"></span>
                                                           
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group border_boxesDiv">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <label for="pincode">Pincode<i style="color: red;">*</i></label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    <form:input class="form-control" id="pincode" placeholder=" " path="pincode"  />

                                                                    <span class=""><span><i class=""></i></span></span>
                                                                 <span class="form-text  ValidationMsg"  id="pincodeError"></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label for="address">Address<i style="color: red;">*</i></label>
                                                                <form:textarea class="form-control" id="address" placeholder="" path="address"   />
                                                                <span></span> 
                                                                <span class="form-text ValidationMsg"  id="AddressError" style="color: red;"></span>
                                                           
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <form:hidden path="userPrivileges" id="user"/>  
                                                    <form:hidden path="paclimit"/>
                                                    <form:hidden path="paclimitInWords"/>
                                                    <div class="form-group text-center">
                                                            <div class="form-group ">
                                                        <c:if test="${deptUserRole=='PrimaryDeptUser'}">
                                                            <button type="button" class="btn btn-elevate btn-success btn-sm" id="saveDept" ng-click="addMoreForDeptUser()" value="submit" addMoreForDeptUser>Update Basic Details </button>
                                                         <input type="button" hidden="true" class="btn btn-elevate btn-success btn-sm" id="saveData"  ng-click="updateForDeptUser();">
                                                        </c:if>
                                                        <c:if test="${deptUserRole=='SecondaryDeptUser'}">
                                                            <button type="button" class="btn btn-elevate btn-success btn-sm" id="saveDept" ng-click="addSecondaryUserForDeptUser()" value="submit" >Update Basic Details </button>
                                                             <input type="button" hidden="true" class="btn btn-elevate btn-success btn-sm" id="saveData"  ng-click="updateSecondaryUserForDeptUser();">
                                                      
                                                        </c:if>
                                                        
                                                           <!--<input type="button"  hidden="true" class="btn btn-elevate btn-success btn-sm" id="getotp" data-toggle="modal" data-target="#OTPVerificationDeptUser_onUpdate" onclick="getOtpForAdmin();"/>-->
                                                           <input type="button"  hidden="true" class="btn btn-elevate btn-success btn-sm" id="getotp" data-toggle="modal" data-target="#OTPVerificationDeptUser_onUpdate" onclick="getOtpForDeptUser();"/>
                                                              
                                                            
                                                    </div>
                                                          
                                                            

                                                            <!--                                                    <button type="button" class="btn btn-elevate btn-brand">Submit</button>
                                                                                                                <button type="button" class="btn btn-elevate btn-danger">Reset</button>-->
                                                        </div>
                                                   
                                                </form:form> 
                                                
                                            </div>
                                              
                                           
                                            <!--########################-->
                                          
                                                <div class="privilige_select">
                                                    
                                                           
                                                    
                                                 
                                                  
                                                      
                                                    
                                                         <div class="privilige_select">
                               
                                                <div class="form-group border_boxesDiv pt-0"> 
                                                                          <div class="row">
                               
                                    <div class="k-portlet alert_part circle_create">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label"> 
                                                <h3 class="k-portlet__head-title">Privileges</h3>
                                            </div>
                                        </div>
                                        
                                    </div>
                            
                                <!--end::Portlet-->
                            </div>
                                                    <div class="row"> 
                                                           <c:forEach var="entry" items="${privilege}">
                                                               <c:if test="${entry.key=='Administration'}">
                                                         <div class="col-md-4 mb-4"> 
                                                    <div class="k-portlet__head mb-2">
                                                        <div class="k-portlet__head-label">
                                                            <h3 class="k-portlet__head-title">${entry.key} Privileges</h3>
                                                        </div>
                                                    </div>
                                                    <div class="form-group k-list k-list--badge">
                                                        <c:forEach var="values" items="${entry.value}">
                                                            <div class="k-list__item">
                                                                <span class="k-list__badge"></span>
                                                            <span class="k-list__text">${values}</span>
                                                        </div> 
                                                        </c:forEach>
                                                    </div> 
                                                        </div>
                                                           </c:if>
                                                     <c:if test="${entry.key=='E-Tendering'}">
                                                     <div class="col-md-4 mb-4"> 
                                                    <div class="k-portlet__head mb-2">
                                                        <div class="k-portlet__head-label">
                                                            <h3 class="k-portlet__head-title">${entry.key} Privileges</h3>
                                                        </div>
                                                    </div>
                                                    <div class="form-group k-list k-list--badge">
                                                        <c:forEach var="values" items="${entry.value}">
                                                           <div class="k-list__item">
                                                                <span class="k-list__badge"></span>
                                                            <span class="k-list__text">${values}</span>
                                                        </div> 
                                                        </c:forEach>
                                                           <c:if test="${departmentUser.paclimit!='' && departmentUser.paclimit!=null}">
                                                            <div class="form-group">
                                                                <div class="k-list__item pl-4"> <span class="k-list__text">P.A.C. Limit <b class="ml-2">${departmentUser.paclimit}</b></span></div>
                                                                <div class="k-list__item pl-4"> <span class="k-list__text">P.A.C. Limit In Words<b class="ml-2">${departmentUser.paclimitInWords}</b></span></div>
                                                            </div> 
                                                        </c:if>
                                                    </div> 
                                                        </div>
                                                             
                                                           
                                                             </c:if>
                                                     <c:if test="${entry.key=='Pre-Tendering'}">
                                                      <div class="col-md-4 mb-4"> 
                                                    <div class="k-portlet__head mb-2">
                                                        <div class="k-portlet__head-label">
                                                            <h3 class="k-portlet__head-title">${entry.key} Privileges</h3>
                                                        </div>
                                                    </div>
                                                    <div class="form-group k-list k-list--badge">
                                                        <c:forEach var="values" items="${entry.value}">
                                                           <div class="k-list__item">
                                                                <span class="k-list__badge"></span>
                                                            <span class="k-list__text">${values}</span>
                                                        </div> 
                                                        </c:forEach>
                                                    </div> 
                                                        </div>
                                                             </c:if>
                                                     <c:if test="${entry.key=='E-Auction'}">
                                                      <div class="col-md-4 mb-4"> 
                                                    <div class="k-portlet__head mb-2">
                                                        <div class="k-portlet__head-label">
                                                            <h3 class="k-portlet__head-title">${entry.key} Privileges</h3>
                                                        </div>
                                                    </div>
                                                    <div class="form-group k-list k-list--badge">
                                                        <c:forEach var="values" items="${entry.value}">
                                                           <div class="k-list__item">
                                                                <span class="k-list__badge"></span>
                                                            <span class="k-list__text">${values}</span>
                                                        </div> 
                                                        </c:forEach>
                                                    </div> 
                                                        </div>
                                                             </c:if>
                                                     <c:if test="${entry.key=='RFX'}">
                                                      <div class="col-md-4 mb-4"> 
                                                    <div class="k-portlet__head mb-2">
                                                        <div class="k-portlet__head-label">
                                                            <h3 class="k-portlet__head-title">${entry.key} Privileges</h3>
                                                        </div>
                                                    </div>
                                                    <div class="form-group k-list k-list--badge">
                                                        <c:forEach var="values" items="${entry.value}">
                                                            <div class="k-list__item">
                                                                <span class="k-list__badge"></span>
                                                            <span class="k-list__text">${values}</span>
                                                        </div> 
                                                        </c:forEach>
                                                    </div> 
                                                        </div>
                                                             </c:if>
                                                     <c:if test="${entry.key=='Inventory'}">
                                                      <div class="col-md-4 mb-4"> 
                                                    <div class="k-portlet__head mb-2">
                                                        <div class="k-portlet__head-label">
                                                            <h3 class="k-portlet__head-title">${entry.key} Privileges</h3>
                                                        </div>
                                                    </div>
                                                    <div class="form-group k-list k-list--badge">
                                                        <c:forEach var="values" items="${entry.value}">
                                                            <div class="k-list__item">
                                                                <span class="k-list__badge"></span>
                                                            <span class="k-list__text">${values}</span>
                                                        </div> 
                                                        </c:forEach>
                                                    </div> 
                                                        </div>
                                                             </c:if>
                                                    </c:forEach>
                                                     </div>
                                                     </div>
                                              </div>
                                        
<!--                                                   <a href="manageDepartmentUser"><button type="button" class="btn btn-elevate btn-danger" style="width:auto;">Close</button></a>   
                                                    -->
                                                    </div>
                                               

                                            
                                        </div>
                                    </div>
                                </div>
                                <!--end::Portlet-->
                            </div>
                            <!--end::Row-->
                        </div>
 
                    <!-- end:: Content Body -->
                </div>

                <!-- end:: Content -->

                <!-- begin:: Footer -->
<!--                <div class="k-footer	k-grid__item k-grid k-grid--desktop k-grid--ver-desktop">
                    <div class="k-footer__copyright">
                        2018&nbsp;&copy;&nbsp;<a href="#" class="k-link">OSMO IT SOLUTION PVT. LTD.</a>
                    </div>
                    <div class="k-footer__menu">
                        <a href="#" target="_blank" class="k-footer__menu-link k-link">About</a>
                        <a href="#" target="_blank" class="k-footer__menu-link k-link">Team</a>
                        <a href="#" target="_blank" class="k-footer__menu-link k-link">Contact</a>
                    </div>
                </div>-->

                <!-- end:: Footer -->
            </div>

            <!-- begin:: Aside Secondary -->
          
            <!-- end:: Aside Secondary -->
        </div>
    </div>
    <!-- end:: Page -->

    <!-- begin::Global Config -->
		<!-- begin::Quick Panel -->
                <jsp:include page="Tiles/QuickPanel.jsp"/>
                <jsp:include page="OTPVerificationDeptUser_onUpdate.jsp"/>
		<!-- end::Quick Panel -->
    <script>
        var KAppOptions = {
            "colors": {
                "brand": "#6e4ff5",
                "metal": "#c4c5d6",
                "light": "#ffffff",
                "accent": "#00c5dc",
                "primary": "#5867dd",
                "success": "#34bfa3",
                "info": "#36a3f7",
                "warning": "#ffb822",
                "danger": "#fd3995",
                "focus": "#9816f4"
            }
        };
    </script>

    <!-- end::Global Config -->
<!--begin:: Global Mandatory Vendors -->
    <script src="<c:url value="/resources/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>

    <!--end:: Global Mandatory Vendors -->

    <!--begin:: Global Optional Vendors -->
    <script src="<c:url value="/resources/vendors/jquery-form/dist/jquery.form.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/block-ui/jquery.blockUI.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/theme/framework/vendors/bootstrap-datepicker/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/theme/framework/vendors/bootstrap-timepicker/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-maxlength/src/bootstrap-maxlength.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-select/dist/js/bootstrap-select.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/typeahead.js/dist/typeahead.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/handlebars/dist/handlebars.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/inputmask/dist/jquery.inputmask.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/inputmask/dist/inputmask/inputmask.date.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/inputmask/dist/inputmask/inputmask.numeric.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/inputmask/dist/inputmask/inputmask.phone.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/nouislider/distribute/nouislider.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/owl.carousel/dist/owl.carousel.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/autosize/dist/autosize.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/clipboard/dist/clipboard.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/dropzone/dist/dropzone.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/summernote/dist/summernote.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/markdown/lib/markdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/bootstrap-markdown/js/bootstrap-markdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/theme/framework/vendors/bootstrap-markdown/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/jquery-validation/dist/jquery.validate.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/jquery-validation/dist/additional-methods.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/theme/framework/vendors/jquery-validation/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/toastr/build/toastr.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/raphael/raphael.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/morris.js/morris.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/chartist/dist/chartist.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/chart.js/dist/Chart.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/vendors/jquery-idletimer/idle-timer.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/waypoints/lib/jquery.waypoints.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/counterup/jquery.counterup.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/es6-promise-polyfill/promise.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/sweetalert2/dist/sweetalert2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/vendors/theme/framework/vendors/sweetalert2/init.js"/>" type="text/javascript"></script>

    <!--end::Page Scripts -->
	
    <script src="<c:url value="/resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

    <script src="<c:url value="/resources/assets/vendors/custom/flot/flot.bundle.js"/>" type="text/javascript"></script>

    <script src="<c:url value="/resources/assets/demo/custom/components/charts/flotcharts.js"/>" type="text/javascript"></script>
    <!--begin::Global App Bundle -->
    <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>

    <!--end:: Global Optional Vendors -->


    <!--begin::Page Scripts -->
    <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
   

    <!--begin::Page Vendors -->
    <script src="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="assets/demo/custom/components/forms/widgets/bootstrap-select.js" type="text/javascript"></script>

    <!--end::Page Vendors -->

    <script src="<c:url value="/resources/assets/demo/custom/components/base/popovers.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/resources/assets/app/scripts/custom/dashboard.js"/>" type="text/javascript"></script>

    

    <!--begin::Page Scripts -->
    <script src="<c:url value="/resources/assets/demo/custom/components/calendar/basic.js"/>" type="text/javascript"></script>
<!-- Angular js Controller --> 
     <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
     <script src="<c:url value="/resources/angular/DepartmentUserScript.js" />"></script>

    <script>
        $(document).ready(function() {

            $(".btn_next").click(function(e) {
                var $active = $('.nav-tabs-btn .nav-item a.active');
                $($active).addClass("sve_class_cl");
                $($active).find('.nav-link-title').hide();
                $($active).find('.fa').show();
                nextTab($active);

            });
            $(".btn_prev").click(function(e) {
                var $active = $('.nav-tabs-btn .nav-item a.active.show');
                prevTab($active);
            });
        });

        function nextTab(elem) {
            var li = $(elem).closest("li");
            $(li).next('li').find('a').click();
        }

        function prevTab(elem) {
            var li = $(elem).closest("li");
            $(li).prev('li').find('a').click();
            $(li).prev('li').find('a').removeClass('sve_class_cl');
            $(li).prev('li').find('a').find('.nav-link-title').show();
            $(li).prev('li').find('a').find('.fa').hide();
        }
    </script>
    <script>
        $(document).ready(function() {

            $("#save_next_btn").click(function(e) {
                var $active = $('.nav-tabs-btn .nav-item a.active');
                $($active).addClass("sve_class_cl");
                $($active).find('.nav-link-title').hide();
                $($active).find('.fa').show();
                nextTab($active);

            });
            $("#previous").click(function(e) {
                var $active = $('.nav-tabs-btn .nav-item a.active.show');
                prevTab($active);
            });
            
           // To Show Dropdown values   
          
          
            var circle_id = $('#circle1').val();
            var division = $('#division11').val();
            var subDivision = $('#subDivision11').val();
                                          
            if (circle_id != null || circle_id != '' || circle_id != '0' || circle_id != '-1'){
            getDivision(circle_id, division);
             }
            if (division != null || division != '' || division != '-1'){
            getSubDivision(division, subDivision);
            }   
            
            
            $('#showEdit').hide(); 
            
        });

        function nextTab(elem) {
            var li = $(elem).closest("li");
            $(li).next('li').find('a').click();
        }

        function prevTab(elem) {
            var li = $(elem).closest("li");
            $(li).prev('li').find('a').click();
            $(li).prev('li').find('a').removeClass('sve_class_cl');
            $(li).prev('li').find('a').find('.nav-link-title').show();
            $(li).prev('li').find('a').find('.fa').hide();
        }
           function getDivision(circleid, divisionid)
                                    {

                                    $.ajax({
                                    type: "GET",
                                            url: 'getDivisionByAjax',
                                            data: {'circleid': circleid},
                                            success: function (response) {
                                            var $select = $('#division1');
                                                    $select.find('option').remove();
                                                    $('<option>').val("-1").text("Select Division").appendTo($select);
                                                    $.each(JSON.parse(response), function (key, value) {

                                                    $('<option>').val(value["division_id"]).text(value["division"]).appendTo($select);
                                                    });
                                                    if (divisionid != '0') {
                                            $('#division1').val(divisionid);
                                            }

                                            },
                                            error: function (e) {
//                                            alert('Error: ' + e);
                                                    document.getElementById('wait').style.display = 'none';
                                            }
                                    });
                                    }

                                    function getSubDivision(division_id, subdivisionid)
                                    {
                                    $.ajax({
                                    type: "GET",
                                            url: 'getSubDivisionByAjax.action',
                                            data: {'division_id': division_id},
                                            success: function (response) {
                                            var $select = $('#subDivision1');
                                                    $select.find('option').remove();
                                                    $('<option>').val("-1").text("Select SubDivision").appendTo($select);
                                                    $.each(JSON.parse(response), function (key, value) {
                                                    $('<option>').val(value["subdivision_id"]).text(value["subdivision"]).appendTo($select);
                                                    });
                                                    if (subdivisionid != '0') {
                                            $('#subDivision1').val(subdivisionid);
                                            }

                                            },
                                            error: function (e) {
//                                            alert('Error: ' + e);
                                                    document.getElementById('wait').style.display = 'none';
                                            }
                                    });
                                    }
         
function editDeptUserProfile(){
    $("#showEdit").show();
    $("#showReadonly").hide();
    
    
}

  function deptUserClientValidationForBasic(){
      var countError = 0; 
  
//      var countcheck=0; 
    $("#form input[type=text],textarea").each(function () { 
//             console.log(this.id);
            var inputlavel=$("label[for='"+this.id+"']").text().replace("*", "");

           var alphabates=new RegExp("[a-zA-z]+");
           var pincodeRegex=new RegExp("^[1-9][0-9]{5}$");
           var addressRegex =new RegExp("^[a-zA-Z0-9\\s\\s\\.\\-\\(\\)\\/\\,]*$");
           
            if($(this).val()==""||$(this).val()==null){
                if(this.id=="paclimit"){
                   $(this).next("span").next("span").text(" ");    
                }else{
                     $(this).next("span").next("span").text("Please Enter "+inputlavel); 
                      countError++;
                    
                }
                
            
               
            }else if(inputlavel=='Email Id'){
                
                var emailRegex=new RegExp("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");
                  var email=this.value;
                if(!emailRegex.test(email)){
                    
                    $(this).next("span").next("span").text("Enter Valid Email"); 
                    countError++;
                }
               
                
                 
            }else if(inputlavel=='Mobile No.'){
                
                 console.log(this.id);
                 var mobile_no=this.value;
                 var mobileRegex=new RegExp("^([0-9]){10}$");
                 if(!mobileRegex.test(mobile_no)){
                   $(this).next("span").next("span").text("Enter Valid Mobile No."); 
                    countError++;   
                 }
                
            }else if(inputlavel=='First Name'||inputlavel=='Last Name'){
               if(!alphabates.test($(this).val())){
                 $(this).next("span").next("span").text("Please Enter Only Alphabates"); 
                 countError++;
               } 
                
            }else if(inputlavel=='Pincode'){
//                console.log($(this).val());
                if(!pincodeRegex.test($(this).val())){
                     $(this).next("span").next("span").text("Please Enter Valid Pincode");  
                  countError++;
                }
                
            }else if(inputlavel=='Address'){
                if(!addressRegex.test($(this).val())){
                     $(this).next("span").next("span").text("Please Enter Valid Address");  
                  countError++;
                } 
                
            }else{
                
               $(this).next("span").next("span").text(" ");     
            }

    });
   
    $("#form select").each(function () { 
//             console.log(this.id);
//             console.log(this.value);
             
            var inputlavel=$("label[for='"+this.id+"']").text().replace("*", "");

           if($(this).val()==""||$(this).val()==null||$(this).val()=="-1"){
                
               $(this).next("span").next("span").text("Please Select "+inputlavel); 
                countError++;
            }else{
              $(this).next("span").next("span").text(" ");   
                
            }

    });
    return countError;
}
    </script>

</body>

<!-- end::Body -->
<script>
    $(function(){$(".preloader").fadeOut(2000,function(){$(".loader_main").fadeIn(1000);});});
</script>
</html>