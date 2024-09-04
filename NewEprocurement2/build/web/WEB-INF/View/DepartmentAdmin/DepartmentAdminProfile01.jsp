<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Department  | Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon lotus procure -->
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
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
        <!-- Angular js Controller --> 
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
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
      
        <script src="<c:url value="/resources/angular/Script.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js" />" type="text/javascript"></script>
    
    </head>
    <!-- end::Head -->
    <!-- begin::Body -->

    <body ng-controller="myCtrl" onload="backButtonDisable();" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled">
<!-- Loader Start --> 
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
                <a href="#">
                    <img alt="Logo" src="resources/assets/demo/media/logo-light.png" style="max-width: 100%;" />
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
                            <a href="#">
                                <img alt="Logo" src="resources/assets/demo/media/logo-light.png" style="max-width: 80%;" />
                            </a>
                        </div>
                        <div class="k-aside__brand-tools">
                            <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                        </div>
                    </div>

                    <!-- end:: Aside -->


                    <!-- begin:: Aside Menu -->
                     <jsp:include page="Tiles/DashBoardAsideNav.jsp"/>

                    <!-- end:: Aside -->
                </div>

                <!-- end:: Aside -->
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                    <!-- begin:: Header -->
                    <%@include  file="../DepartmentAdmin/Tiles/AdminHeader.jsp" %> 

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                  
                          <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">My Profile</h3>
                            </div>
                         </div>
                  

                        <!-- end:: Content Head -->
                        <!-- begin:: Content Body -->
                  

                            <!--begin::Row-->

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="k-portlet alert_part circle_create">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon ">
                                                    <i class="flaticon-add"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">Department Details</h3>
                                            </div>
                                        </div>

                                        <div class="k-portlet__body">

                                            <div class="border_boxesDiv mb-4" id="showReadonlydept">

                                                <table class="table table-striped- table-bordered table-hover table-checkable ">
                                                    <tbody>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Admin Full Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="admin">${departmentadmin.deptAdminName}</span></td>
                                                            <th><span class="dwn_arrow">Designation</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="design">${departmentadmin.designation}</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Department Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.deptName}</span></td>
                                                            <th><span class="dwn_arrow">Short Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.deptShortName}</span></td>
                                                        </tr>

                                                        <tr>
                                                            <th><span class="dwn_arrow">Email Id</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="email">${departmentadmin.deptEmailId}</span></td>
                                                            <th><span class="dwn_arrow">Mobile No.</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="mobile">${departmentadmin.deptMobNo}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Bank Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.bankName}${bankOtherName}</span></td>
                                                            <th><span class="dwn_arrow">Branch Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.bankBranchName}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Account Number</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.accountNumber}</span></td>
                                                            <th><span class="dwn_arrow">IFSC Code</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.ifscCode}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Sub Account Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.subAccountName}</span></td>
                                                            <th><span class="dwn_arrow">Web URL</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.deptWebUrl}</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Auction Prefix</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.auctionPrefix}</span></td>
                                                            <th><span class="dwn_arrow">Auction Starting No.</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.auctionStartingNo}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Tender prefix</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.tenderPrefix}</span></td>
                                                            <th><span class="dwn_arrow">Tender Starting No.</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.tenderStartingNo}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Department Address</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.deptAddress}</span></td>
                                                            <th><span class="dwn_arrow">Description</span></th>
                                                            <td class="upr_text" ><span class="rs_ic">${departmentadmin.deptDescription}</span></td>   
                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Work Order</span></th>
                                                            <td class="upr_text" ><span class="rs_ic"><a href="${departmentadmin.deptWorkOrderFileUrl}"  target="_blank">${departmentadmin.deptWorkOrderFileName}</a></span></td>
                                                            <th><span class="dwn_arrow">Department Logo</span></th>
                                                            <td class="upr_text" ><span class="rs_ic"><a href="${departmentadmin.deptLogoFileUrl}"  target="_blank">${departmentadmin.deptLogoFileName}</a></span></td>

                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <button type="button" class="btn btn-primary btn-sm"  onclick="editDept();"><i class="flaticon-edit"></i>Update Basic Details</button>
                                            </div>
                                            <!--########################-->
                                            <div class="border_boxesDiv mb-4" id="showEditdept" style="display: none;">             
                                                <form:form class="registerForm k-form"  modelAttribute="departmentadmin" id="form">
                                                    <form:hidden path="deptId" id="deptId"/>
                                                    <div class="form-group border_boxesDiv">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <label>Admin Full Name</label>
                                                                <div class="k-input-icon k-input-icon--right">

                                                                    <input type="text" class="form-control  deptAdminName" id="deptAdminName" onchange="changeadmin();" placeholder=" " value="${departmentadmin.deptAdminName}" name="deptAdminName" />
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                    <span class="form-text text-danger ValidationMsg" id="deptAdminNameError"></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label class="">Designation</label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    <input type="text"  class="form-control designation" id="designation" onchange="changedesign();"  placeholder=" " value="${departmentadmin.designation}"  name="designation" />
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-user"></i></span></span>
                                                                  <span class="form-text text-danger ValidationMsg" id="designationError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <label>Email-Id</label>
                                                                <div class="k-input-icon k-input-icon--right">

                                                                    <input type="text" class="form-control deptEmailId" id="deptEmailId" placeholder=" " onchange="changeemail();" value="${departmentadmin.deptEmailId}" name="deptEmailId" />

                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-envelope"></i></span></span>
                                                                    <span class="form-text text-danger ValidationMsg" id="deptEmailIdError"></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label class="">Mobile No.</label>
                                                                <div class="k-input-icon k-input-icon--right">
                                                                    <input type="text"  class="form-control deptMobNo" id="deptMobNo"  placeholder=" " onchange="changemobile();" value="${departmentadmin.deptMobNo}"  name="deptMobNo" />
                                                                    <span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-phone-square"></i></span></span>
                                                                    <span class="form-text text-danger ValidationMsg" id="deptMobNoError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-center">
                                                        <button type="button" class="btn btn-elevate btn-success btn-sm" onclick="updatedept();" value="submit" >Previous</button> 
                                                        <button type="button" class="btn btn-primary btn-sm" id="saveDepartment"   value="submit" >Update</button>

                                                    </div>
                                                </form:form>                                               
                                            </div>
                                            <!--########################-->

                                        </div>
                                    </div>
                                </div>
                                <!--end::Portlet-->
                            </div>
                            <!--end::Row-->
                        </div>

                        <!-- end:: Content Body -->
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

          
        </div>
    </div>
    
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
        };</script>
    <!-- end::Global Config -->
    <!-- Angular js Controller --> 
    <script>
        $("#saveDepartment").click(function (e) {
//            alert("savesaveDept called");
            var formdata = new FormData();
            var dept = $("#deptId").val();
            var deptemail = $("#deptEmailId").val();
            var deptMobNo = $("#deptMobNo").val();
            var designation =$("#designation").val();
            var deptAdminName=$("#deptAdminName").val();
//            alert("dept " + dept);
//            alert("deptEmailId " + deptemail);
//            alert("deptMobNo " + deptMobNo);
//            alert("designation " + designation);
            formdata.append("deptemail",deptemail);
            formdata.append("deptMobNo",deptMobNo);
            formdata.append("designation",designation);
            formdata.append("deptAdminName",deptAdminName);
            
            $.ajax({
                url: "saveDepartment?dept="+dept,
                type: "POST",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (response) {
//                    alert("Response is : " + response);
//                    alert(JSON.stringify(response));

                    $('.ValidationMsg').html('');
                    if (response == "Department Successfully Updated")
                    {

                        swal(
                                '',
                                'Department Successfully Updated',
                                'success'
                                )
                    }
                                 else if(response == "Duplicate Email")
                    {
                       swal(
                                '',
                                'Duplicate Email',
                                'error'
                                ) 
                    }
                     else if(response == "Duplicate Mobile Number")
                    {
                       swal(
                                '',
                                'Duplicate Mobile Number',
                                'error'
                                ) 
                    }
                     else if(response == "Duplicate Email and Mobile number")
                    {
                       swal(
                                '',
                                'Duplicate Email and Mobile number',
                                'error'
                                ) 
                    }
                    
                      else 
                    {

                        swal(
                                '',
                                'Department has not been updated',
                                'error'
                                )

                        $.each(JSON.parse(response), function (key, value) {
                            $("#" + key + "Error").html(value);
                        });
                    }
       
                },
                error: function () {
                    console.log('Upload error');
                }
            });
        });
    </script>
    <script>
        function editDept() {
            $("#showEditdept").show();
            $("#showReadonlydept").hide();
        }
        function updatedept() {
            $("#showEditdept").hide();
            $("#showReadonlydept").show();
        }
        function changeadmin()
        {
         var newdeptAdminName = $("#deptAdminName").val();
                $("#admin").html("");
                $("#admin").html(newdeptAdminName);
        }
         function changedesign()
        {
         var designation = $("#designation").val();
                $("#design").html("");
                $("#design").html(designation);
        }
         function changeemail()
        {
         var deptEmailId = $("#deptEmailId").val();
                $("#email").html("");
                $("#email").html(deptEmailId);
        }
         function changemobile()
        {
         var deptMobNo = $("#deptMobNo").val();
                $("#mobile").html("");
                $("#mobile").html(deptMobNo);
        }
    </script>
<script>
    $(document).ready(function(){
//               alert("ready function called");
               var adminregex = new RegExp(
                '^(([a-zA-Z ]+$))'
                );
        
          var emailregex = new RegExp(
                '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{3,3}))$'
                );
         var mobregex = new RegExp(
                '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                );
        
        
        $('.deptAdminName').on('change', function (e) {
        if (adminregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please enter valid Admin Name");
//                        $("#"+id).val(' ');
        }
    });
            $('.designation').on('change', function (e) {
        if (adminregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please enter valid Designation");
//                        $("#"+id).val(' ');
        }

        });
        
                $('.deptEmailId').on('change', function (e) {
        if (emailregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please enter valid Email");
//                        $("#"+id).val(' ');
        }

        });
        
                $('.deptMobNo').on('change', function (e) {
        if (mobregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please enter valid Phone No.");
//                        $("#"+id).val(' ');
        }
        });
    
    function clientValidationOnUpdate() {
                alert("client validation function called");
                var deptAdminName = $("#deptAdminName").val();
                var designation = $("#designation").val();
                var deptEmailId = $("#deptEmailId").val();
                var deptMobNo = $("#deptMobNo").val();
                var alpha = /^[a-zA-Z]*$/;
                var mobNoreg = /^[0]?[789]\d{9}$/;
                var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
               
                if (deptAdminName=== "") {
                  
                     $("#" + this.id + "Error").html("Please Enter Admin Name");
                } 
                else {
                   $("#" + this.id + "Error").html("");
                }
                 if (designation=== "") {
                     $("#" + this.id + "Error").html("Please Enter Designation");
                } else{
           
                   $("#" + this.id + "Error").html("");
                }
                if (deptEmailId=="") {
                     $("#" + this.id + "Error").html("Please Enter Email Id");
                }  else {
                      $("#" + this.id + "Error").html("");
                }
                 if (deptMobNo==="") {
                    $("#" + this.id + "Error").html("Please Enter Mobile No.");
                } else {
                    $("#" + this.id + "Error").html("");
                }
            }
             });
</script>
<script>
            function backButtonDisable(){
               
                window.history.pushState(null, "", window.location.href);        
                window.onpopstate = function() {
                window.history.pushState(null, "", window.location.href);
                };
              }
</script>
<script>
	$(function() {
    $(".preloader").fadeOut(2000, function() {
        $(".loader_main").fadeIn(1000);        
    });
});
	</script>
</body>
<!-- end::Body -->
</html>