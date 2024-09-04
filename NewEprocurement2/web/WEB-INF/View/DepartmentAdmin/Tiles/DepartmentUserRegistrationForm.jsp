<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Procurelinc e-Procurement | Home</title>
        <!-- Favicon lotus procure -->
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
        <!--begin:: Global Mandatory Vendors -->
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script>
            WebFont.load({
            google: {
            "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
            },
                    active: function () {
                    sessionStorage.fonts = true;
                    }
            });
        </script>
        <style>
            .ValidationMsg{
                color: red;
                font-size: 13px;
            }
            .list_inline label {
                width: 33.33%!important;
            }
            .disabledClass{
                background: #eee;
                pointer-events: none;
                touch-action: none;
            }
        </style>
        <!--end::Web font -->

        <!--begin:: Global Mandatory Vendors -->
        <link href="vendors/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />

        <!--end:: Global Mandatory Vendors -->
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
        <!--begin:: Global Optional Vendors -->
        <link  rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/tether/dist/css/tether.css"/>"/>
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
        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/faviconlp.ico"/>"/>
        <!-- coustom_style_css -->
        <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />


    </head>

    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="MyController"> 

        <!-- begin:: Page -->
        <div id="preloaderSpinner" class="preloader spinner">
            <div class="spinWrap">
                <p class="spinnerImage"></p>
                <p class="loader"></p>
                <p class="loadingMessage" id="spinnerMessage"></p>
            </div>
        </div> 
        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="index.html">
                    <img alt="Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" style="max-width: 100%;" />
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
                <button class="k-aside-close " id="k_aside_close_btn"><i class="la la-close"></i></button>
                <div class="k-aside  k-aside--fixed k-aside--skin-default 	k-grid__item k-grid k-grid--desktop k-grid--hor-desktop" id="k_aside">

                    <!-- begin:: Aside -->
                    <div class="k-aside__brand	k-grid__item  k-aside__brand--skin-default " id="k_aside_brand">
                        <div class="k-aside__brand-logo">
                            <a href="index.html">
                                <img alt="Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" style="max-width: 80%;" />
                            </a>
                        </div>
                        <div class="k-aside__brand-tools">
                            <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                        </div>
                    </div>

                    <!-- end:: Aside -->
                    <jsp:include page="DashBoardAsideNav.jsp"/>

                    <!-- end:: Aside -->
                </div>

                <!-- end:: Aside -->
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                    <!-- begin:: Header -->
                    <jsp:include page="AdminHeader.jsp"/>

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">Department User Registration</h3>

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
                                                <h3 class="k-portlet__head-title">Department User Registration</h3>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body valid">
                                            <!--<form class="k-form">-->

                                            <form:form action="saveDepartmentUser" class="k-form" modelAttribute="departmentUser" id="form">
                                                <div class="form-group border_boxesDiv">
                                                    <form:hidden path="reg_Id" id="reg_Id"/>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <label for="firstName">First Name<a style="color:red;">*</a></label>
                                                            <div class="k-input-icon k-input-icon--right" >
                                                                <c:if test="${departmentUser.firstName==null}">
                                                                    <form:input class="form-control" id="firstName" placeholder="" path="firstName" style="text-transform: uppercase;" />
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                            </c:if>


                                                                <!--// For Another new Department User Registration -->
                                                                <c:if test="${departmentUser.firstName!=null}">

                                                                    <form:input class="form-control " id="firstName" placeholder=""  path="firstName" readonly="true" /> 
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                            </c:if>
                                                                <span class="form-text  ValidationMsg"  id="firstNameError"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <label for="lastName">Last Name<a style="color:red;">*</a></label>
                                                            <div class="k-input-icon k-input-icon--right">
                                                                <c:if test="${departmentUser.lastName==null}">
                                                                    <form:input class="form-control " id="lastName" placeholder=" " path="lastName" style="text-transform: uppercase;"/> 
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                            </c:if>
                                                                            <c:if test="${departmentUser.lastName!=null}">
                                                                                <form:input class="form-control " id="lastName" placeholder=" " path="lastName" readonly="true" /> 
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                            </c:if>
                                                                <span class="form-text  ValidationMsg"  id="lastNameError"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group border_boxesDiv">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <label for="email">Email Id<a style="color:red;">*</a></label><span id="errorEmail"></span>
                                                            <div class="k-input-icon k-input-icon--right">
                                                                <c:if test="${departmentUser.emailAdd==null}">
                                                                    <form:input class="form-control" id="email" placeholder=" " path="emailAdd"  readonly="true" /> 

                                                                </c:if>
                                                                <c:if test="${departmentUser.emailAdd!=null}">

                                                                    <form:input class="form-control" path="emailAdd" id="emails" placeholder=""  value="${departmentUser.emailAdd}" readonly="true"></form:input>
                                                                </c:if>
                                                                <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-envelope"></i></span></span>
                                                                <span class="form-text  ValidationMsg"  id="emailAddError"></span>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-6">
                                                            <label for="mobile_no">Mobile No.</label>
                                                            <div class="k-input-icon k-input-icon--right">
                                                                <select class="form-control float_lft">
                                                                    <option value="0">+91</option>
                                                                    <option>+91</option>
                                                                    <option>+223</option>
                                                                </select>
                                                                <c:if test="${departmentUser.emailAdd==null}">
                                                                    <form:input class="form-control mob_no" id="mobile_no" placeholder=" " path="mobNo"  readonly="true"/> 
                                                                </c:if>
                                                                <c:if test="${departmentUser.emailAdd!=null}">
                                                                    <form:input class="form-control mob_no" id="mobile_nos" placeholder=" " path="mobNo"  readonly="true" />
                                                                </c:if>
                                                                <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                                <span class="form-text  ValidationMsg"  id="mobNoError"></span>
                                                            </div>
                                                        </div>
                                                        <!--                                                         <div class="col-lg-6">
                                                                                                                <label class="">Mobile No.<a style="color:red;">*</a></label><span id="errorMobile_no"></span>
                                                                                                                <div class="k-input-icon k-input-icon--right ValidationMsg" id="MobileNoError">
                                                                                                                    <select class="form-control float_lft">
                                                                                                                        <option value="0">+91</option>
                                                                                                                        <option>+91</option>
                                                                                                                        <option>+223</option>
                                                                                                                    </select>
                                                        <c:if test="${departmentUser.emailAdd==null}">
                                                            <form:input class="form-control" id="mobile_no" placeholder=" " path="mobNo"  readonly="true"/> 
                                                            <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                        </c:if>
                                                        <c:if test="${departmentUser.emailAdd!=null}">
                                                            <form:input class="form-control" id="mobile_nos" placeholder=" " path="mobNo"  readonly="true" />
                                                <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                        </c:if>

                                        </div>
                                    </div>-->
                                                    </div>

                                                </div>

                                                <div class="form-group border_boxesDiv">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <label id="des" for="designationList">Designation<a style="color:red;">*</a></label><div class="ValidationMsg" ></div>
                                                            <form:select  class="form-control" path="designationName" id="designationList" ><form:option value="">Select Designation</form:option>
                                                                <c:forEach var="designationList" items="${designationList}" >  
                                                                    <form:option value="${designationList.designationid}">${designationList.designation}</form:option>  
                                                                </c:forEach>
                                                            </form:select> 
                                                            <span></span>
                                                            <span class="form-text  ValidationMsg"  id="designationError" style="color: red;"></span>

                                                        </div>
                                                        <div class="col-lg-6">
                                                            <label class="" for="circle1">Circle/Basin/Project<a style="color:red;">*</a></label><div class="ValidationMsg" ></div>
                                                            <form:select  class="form-control" path="deptcircle" id="circle1" onchange="getDivision(this.value)"><form:option value="">Select Circle</form:option>
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
                                                            <label for="division1">Division<a style="color:red;">*</a></label>
                                                            <form:select class="form-control Select ABC" path="deptDivision" id="division1" onchange="getSubDivision(this.value);" >
                                                                <form:option value="">Select Division</form:option>

                                                            </form:select> 
                                                            <span></span>
                                                            <span class="form-text  ValidationMsg"  id="divisionError" style="color: red;"></span>

                                                        </div>
                                                        <div class="col-lg-6">
                                                            <label for="subDivision1">Sub Division<a style="color:red;">*</a></label><div class="ValidationMsg" ></div>
                                                            <form:select class="form-control Select ABC" path="deptSubDivision" id="subDivision1" >
                                                                <form:option value="">Select SubDivision</form:option>
                                                            </form:select> 
                                                            <span></span>
                                                            <span class="form-text  ValidationMsg"  id="subDivisionError" style="color: red;"></span>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group border_boxesDiv">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <label for="pincode">Pincode<a style="color:red;">*</a></label><div class="ValidationMsg" ></div>
                                                            <div class="k-input-icon k-input-icon--right">
                                                                <form:input class="form-control" id="pincode" placeholder="Enter pincode" path="pincode"  />
                                                                <span class="k-input-icon__icon k-input-icon__icon--right"><span></span></span>
                                                                <span class="form-text  ValidationMsg"  id="pincodeError"></span>

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <label for="address">Address<a style="color:red;">*</a></label><div class="ValidationMsg" ></div>
                                                            <form:textarea class="form-control Address ABC" id="address" placeholder="Enter Address" path="address" style="text-transform: capitalize;"/> 
                                                            <span></span>      
                                                            <span class="form-text ValidationMsg"  id="AddressError" style="color: red;"></span>

                                                        </div>
                                                    </div>
                                                </div>
                                                <!--@@@@@@@@@@@@@@@@@@@@@@@@2-->

                                                <div class="privilige_select">
                                                    <div class="form-group border_boxesDiv">
                                                        <div class="k-checkbox-list d-inline-block mb-4">

                                                            <label class="k-checkbox k-checkbox--brand">
                                                                <input type="checkbox" id="select_all" class="checkboxall"> Select All Privileges
                                                                <span> </span>
                                                            </label> 
                                                            <span class="ValidationMsg" id="userPrivilegesError"> </span>
                                                        </div>

                                                        <div class="k-portlet__head mb-4">
                                                            <div class="k-portlet__head-label">
                                                                <h3 class="k-portlet__head-title labelbdr-bt">Administration Privileges</h3>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="k-checkbox-list list_inline">
                                                                <c:forEach var="administration" items="${administration}"> 
                                                                    <label class="k-checkbox k-checkbox--brand d-inline-block">
                                                                        <input type="checkbox" class="checkboxall" name="userPrivileges" value="${administration.key}" id="userPrivileges${administration.key}"> ${administration.value}
                                                                        <span></span>
                                                                    </label>
                                                                </c:forEach> 
                                                            </div>
                                                        </div>


                                                        <div class="k-portlet__head mb-4">
                                                            <div class="k-portlet__head-label">
                                                                <h3 class="k-portlet__head-title labelbdr-bt">E-Tendering Privileges</h3>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group">
                                                                <div class="k-checkbox-list list_inline">
                                                                    <c:forEach var="etendering" items="${ETendering}"> 
                                                                        <label class="k-checkbox k-checkbox--brand d-inline-block">
                                                                            <input type="checkbox" class="checkboxall" name="userPrivileges" value="${etendering.key}" id="userPrivileges${etendering.key}" onclick="showMe(this);"> ${etendering.value}
                                                                            <span></span>
                                                                        </label>
                                                                    </c:forEach> 
                                                                    <div id="div1">Please enter P.A.C. Limit for this officer:
                                                                        <div class="input-group"><div class="input-group-prepend">
                                                                                <span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div> 
                                                                                    <form:input path="paclimit" class="form-control PAC col-lg-6" id="paclimit" placeholder="Enter PAC value" onkeypress="return validateFloatKeyPress(this,event);" onkeyup="dynamicTemplateConv(this.value,1);"/>
                                                                        </div>

                                                                        <span></span>
                                                                        <span class="form-text ValidationMsg"  id="paclimitError" ></span>   <div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div> <form:input path="paclimitInWords"  cssClass="form-control col-lg-6 disabledClass" id="dynamicTemplateValue1" placeholder="PAC value In Words"  /></div>

                                                                    </div>
                                                                </div> 
                                                            </div>
                                                        </div>

                                                        <div class="k-portlet__head mb-4">
                                                            <div class="k-portlet__head-label">
                                                                <h3 class="k-portlet__head-title labelbdr-bt">E-Auction Privileges</h3>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="k-checkbox-list list_inline">
                                                                <c:forEach var="eauction" items="${EAuction}"> 
                                                                    <label class="k-checkbox k-checkbox--brand d-inline-block">
                                                                        <input type="checkbox" class="checkboxall" name="userPrivileges" value="${eauction.key}" id="userPrivileges${eauction.key}">  ${eauction.value}
                                                                        <span></span>
                                                                    </label>
                                                                </c:forEach> 
                                                            </div>
                                                        </div>
                                                        <div class="k-portlet__head mb-4">
                                                            <div class="k-portlet__head-label">
                                                                <h3 class="k-portlet__head-title labelbdr-bt">Inventory Privileges</h3>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="k-checkbox-list list_inline">
                                                                <c:forEach var="inventory" items="${Inventory}"> 
                                                                    <label class="k-checkbox k-checkbox--brand d-inline-block">
                                                                        <input type="checkbox" class="checkboxall" name="userPrivileges" value="${inventory.key}" id="userPrivileges${inventory.key}"> ${inventory.value}
                                                                        <span></span>
                                                                    </label>
                                                                </c:forEach> 
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-group text-center"> 
                                                        <c:if test="${departmentUser.emailAdd!=null}">
                                                            <form:button type="button" class="btn btn-success" id="saveDept1" ng-click="addSecondaryUser()" value="submit" >Register</form:button>
                                                        </c:if>
                                                        <c:if test="${departmentUser.emailAdd==null}">
                                                            <form:button type="button" class="btn btn-success" id="saveDept" ng-click="addMore()" value="submit">Register</form:button>
                                                        </c:if>
                                                    </div>      
                                                </div>          
                                                <!--@@@@@@@@@@@@@@@@@@@@@@@@2-->
                                            </form:form>
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


                    <!-- end:: Footer -->
                </div>

                <!-- begin:: Aside Secondary -->

                <jsp:include page="AsideNavSecondary.jsp"/>

                <!-- end:: Aside Secondary -->
            </div>
        </div>

        <!-- end:: Page -->

        <!-- begin::Scrolltop -->
        <div id="k_scrolltop" class="k-scrolltop">
            <i class="la la-arrow-up"></i>
        </div>

        <!-- end::Scrolltop -->

        <!-- begin::Quick Panel -->
        <jsp:include page="QuickPanel.jsp"/>

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


        <script src="<c:url value="/resources/angular/DepartmentUserScript.js" />"></script>
        <script src="<c:url value="/resources/angular/WordConversionFilter.js" />"></script>
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
        <script src="<c:url value="/resources/vendors/autosize/dist/autosize.js"/>' type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/clipboard/dist/clipboard.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/dropzone/dist/dropzone.js"/>' type="text/javascript"></script>
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

        <!--end:: Global Optional Vendors -->

        <!--begin::Global Theme Bundle -->
        <script src="<c:url value="/resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

        <!--end::Global Theme Bundle -->

        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
        <!--begin::Global Theme Bundle -->
        <script src="<c:url value="/resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

        <!--end::Global Theme Bundle -->

        <!--begin::Page Vendors -->
        <script src="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-select.js"/>" type="text/javascript"></script>

        <!--end::Page Vendors -->

        <script src="<c:url value="/resources/assets/demo/custom/components/base/popovers.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/app/scripts/custom/dashboard.js"/>" type="text/javascript"></script>

        <!--begin::Global App Bundle -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/dropzone.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/jquery.repeater.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/demo/repeater.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/demo/scripts.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/summernote.js"/>" type="text/javascript"></script>
        <!--begin::Page Vendors -->
        <script src="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script>
        <!--end::Page Vendors -->
        <!--begin::Page Scripts -->
        <!-- <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> -->
        <!--end::Page Scripts -->
        <!--end::Global Theme Bundle -->
        <script src="<c:url value="/resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
            $('.tenderData').DataTable();
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function(){

            var departmentUserEmail = '<%= session.getAttribute("departmentUserEmail")%>';
            var departmentUserMobNo = '<%= session.getAttribute("departmentUserMobNo")%>';
            //    alert(departmentUserEmail);
            //     alert(departmentUserMobNo);
            if (departmentUserMobNo !== null && departmentUserEmail !== null){
            $('#email').val(departmentUserEmail);
            $('#mobile_no').val(departmentUserMobNo);
            }

            if ($('#userPrivileges5').is(':checked')){

            $('#div1').show();
            } else{
            $('#div1').hide();
            }


            $('#select_all').on('click', function(){


            if (this.checked){
            $('.checkboxall').each(function(){
            this.checked = true;
            if ($('#userPrivileges5').is(':checked')){
            $('#div1').show();
            }

            });
            } else{
            $('.checkboxall').each(function(){
            this.checked = false;
            if ($('#userPrivileges5').is(':checked')){
            $('#div1').hide();
            }
            });
            }
            });
            $('.checkboxall').on('click', function(){
            if ($('.checkboxall:checked').length == $('.checkboxall').length){
            $('#select_all').prop('checked', true);
            } else{
            $('#select_all').prop('checked', false);
            }
            });
            //for privilege Checkbox auto checked on update
            var privilege = $('#user').val();
            var array = new Array();
            array = privilege.split(',');
            $.each(array, function(value, key) {

            $("#userPrivileges" + key).prop("checked", true);
            });
            });
            function showMe(val) {
//                alert("Show me");
            var cvalue = val.id;
//            alert(cvalue);
            if (cvalue === 'userPrivileges5'){
            if ($('#' + cvalue).is(':checked')){
            $('#div1').show();
            } else{
            $('#div1').hide();
            }
            }
            }
            function getDivision(circleid)
            {
//                alert(circleid);
            $.ajax({
            type: "GET",
                    url: 'getDivisionByAjax',
                    data: {'circleid': circleid},
                    dataType: 'text',
                    success: function (response) {
//                                            alert(response);
                    var $select = $('#division1');
                    $select.find('option').remove();
                    $('<option>').val("").text("Select Division").appendTo($select);
                    $.each(JSON.parse(response), function (key, value) {
                    //                  alert(key+"  "+ value);
                    $('<option>').val(value["division_id"]).text(value["division"]).appendTo($select);
                    });
                    document.getElementById('wait').style.display = 'none';
                    },
                    error: function (e) {
                    alert('Error: ' + e);
                    document.getElementById('wait').style.display = 'none';
                    }
            });
            }

            function getSubDivision(division_id)
            {
            $.ajax({
            type: "GET",
                    url: 'getSubDivisionByAjax.action',
                    data: {'division_id': division_id},
                    dataType: 'text',
                    success: function (response) {
                    var $select = $('#subDivision1');
                    $select.find('option').remove();
                    $('<option>').val("").text("Select SubDivision").appendTo($select);
                    $.each(JSON.parse(response), function (key, value) {
                    $('<option>').val(value["subdivision_id"]).text(value["subdivision"]).appendTo($select);
                    });
                    document.getElementById('wait').style.display = 'none';
                    },
                    error: function (e) {
                    alert('Error: ' + e);
                    document.getElementById('wait').style.display = 'none';
                    }
            });
            }

            function formValidation() {
//                alert("validation");
            var countError = 0;
//                alert("validation called ");
            var revertRemark = $("#revertremark_detail").val();
            if (revertRemark == null || revertRemark == "") {
            $("#errormsg").html("Remark is Required");
            countError++;
            }
            return countError;
            }

            function validateFloatKeyPress(el, evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            var number = el.value.split('.');
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
            }
            //just one dot
            if (number.length > 1 && charCode == 46){
            return false;
            }
            //get the carat position
            var caratPos = getSelectionStart(el);
            var dotPos = el.value.indexOf(".");
            if (caratPos > dotPos && dotPos > - 1 && (number[1].length > 1)){
            return false;
            }
            return true;
            }

//thanks: http://javascript.nwbox.com/cursor_position/
            function getSelectionStart(o) {
            if (o.createTextRange) {
            var r = document.selection.createRange().duplicate()
                    r.moveEnd('character', o.value.length)
                    if (r.text == '') return o.value.length
                    return o.value.lastIndexOf(r.text)
            } else return o.selectionStart
                    }

            function deptUserClientValidation(){
            alert('test');
            var countError = 0;
            var countcheck = 0;
            $("#form input[type=text],textarea").each(function () {

            var inputlavel = $("label[for='" + this.id + "']").text().replace("*", "");
            var alphabates = new RegExp("[a-zA-z]+");
            var pincodeRegex = new RegExp("^[1-9][0-9]{5}$");
            var addressRegex = new RegExp("^[a-zA-Z0-9\\s\\s\\.\\-\\(\\)\\/\\,]*$");
            if ($(this).val() == "" || $(this).val() == null){
            if (this.id == "paclimit"){
            $(this).next("span").next("span").text(" ");
            } else{
            $(this).next("span").next("span").text("Please Enter " + inputlavel);
            countError++;
            console.log(this.id);
            }



            } else if (inputlavel == 'First Name' || inputlavel == 'Last Name'){
            if (!alphabates.test($(this).val())){
            $(this).next("span").next("span").text("Please Enter Only Alphabates");
            countError++;
            }

            } else if (inputlavel == 'Pincode'){
//                console.log($(this).val());
            if (!pincodeRegex.test($(this).val())){
            $(this).next("span").next("span").text("Please Enter Valid Pincode");
            countError++;
            }

            } else if (inputlavel == 'Address'){
            if (!addressRegex.test($(this).val())){
            $(this).next("span").next("span").text("Please Enter Valid Address");
            countError++;
            }

            } else{

            $(this).next("span").next("span").text(" ");
            }

            });
            $("#form select").each(function () {

            var inputlavel = $("label[for='" + this.id + "']").text().replace("*", "");
            if ($(this).val() == "" || $(this).val() == null){

            $(this).next("span").next("span").text("Please Select " + inputlavel);
            countError++;
            } else{
            $(this).next("span").next("span").text(" ");
            }

            });
            $("#form input[type=checkbox]").each(function () {

            if ($('#' + this.id).is(':checked')){

            countcheck++;
            }

//            
            });
            console.log(countcheck);
            if (countcheck == 0){
            $('#userPrivilegesError').text("Please Select Atleast One Privilege");
            countError++;
            } else if ($('#userPrivileges5').is(':checked')){
            if ($('#paclimit').val() == "" || $('#paclimit').val() == null){
            $('#paclimitError').text("Enter PAC limit");
            countError++;
            }

            } else{
            $('#userPrivilegesError').text(" ");
            $('#paclimitError').text("");
            }
            return countError;
            }
        </script>

        <script>
            function dynamicTemplateConv(value, id) {
//                       alert("inside number2text   "+value);
            var fraction = Math.round(frac(value) * 100);
            var f_text = "";
            if (fraction > 0) {
            f_text = "And " + convert_number(fraction) + " Paise";
            }
            var word = convert_number(value);
//       alert(word);
            if (word !== "" || word !== null) {

            document.getElementById("dynamicTemplateValue" + id).value = word + " Rupees " + f_text + " Only";
            } else {

            document.getElementById("dynamicTemplateValue" + id).value = word + "  " + f_text + " ";
            }

            }


            function frac(f) {
            return f % 1;
            }


            function convert_number(number)
            {
            //                alert("inside convert_number");
            if ((number < 0) || (number > 9999999999999))
            {
            return "Number Out Of Range!";
            }
            var An = Math.floor(number / 1000000000); /* Arab */
            number -= An * 1000000000;
            var Gn = Math.floor(number / 10000000); /* Crore */
            number -= Gn * 10000000;
            var kn = Math.floor(number / 100000); /* lakhs */
            number -= kn * 100000;
            var Hn = Math.floor(number / 1000); /* thousand */
            number -= Hn * 1000;
            var Dn = Math.floor(number / 100); /* Tens (deca) */
            number = number % 100; /* Ones */
            var tn = Math.floor(number / 10);
            var one = Math.floor(number % 10);
            var res = "";
            if (An > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(An) + " Arab");
            }
            if (Gn > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(Gn) + " Crore");
            }
            if (kn > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(kn) + " Lakh");
            }
            if (Hn > 0)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(Hn) + " Thousand");
            }
            if (Dn)
            {
            res += (((res === "") ? "" : " ") +
                    convert_number(Dn) + " Hundred");
            }
            var ones = Array("", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen");
            var tens = Array("", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety");
            if (tn > 0 || one > 0)
            {
            if (!(res === ""))
            {
            res += " And ";
            }
            if (tn < 2)
            {
            res += ones[tn * 10 + one];
            } else
            {
            res += tens[tn];
            if (one > 0)
            {
            res += (" " + ones[one]);
            }
            }
            }

            if (res === "")
            {
            res = "";
            }
            return res;
            }

        </script>

    </body>
    <script>
        $(function(){$(".preloader").fadeOut(2000, function(){$(".loader_main").fadeIn(1000); }); });
    </script>
    <!-- end::Body -->

</html>