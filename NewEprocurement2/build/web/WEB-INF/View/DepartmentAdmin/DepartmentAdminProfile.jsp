<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/0.8.1/cropper.min.js"></script>
<link rel="stylesheet" type="text/css" href="cropper.css">
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
    <head>
        <!--        <style type="text/css">
                    .error {
                        color: red;
                    }
                    </style>-->
        <style>
            .hide {
                display: none;
            }
            img {
                max-width: 100%;
            }

        </style> 
        <style>
            .cropper-container{
                font-size:0;
                line-height:0;
                position:relative;
                -webkit-user-select:none;
                -moz-user-select:none;
                -ms-user-select:none;
                user-select:none;
                direction:ltr!important
            }
            .cropper-container img{
                display:block;
                width:100%;
                min-width:0!important;
                max-width:none!important;
                height:100%;
                min-height:0!important;
                max-height:none!important;
                image-orientation:0deg!important
            }
            .cropper-canvas,
            .cropper-crop-box,
            .cropper-drag-box,
            .cropper-modal,
            .cropper-wrap-box
            {
                position:absolute;
                top:0;
                right:0;
                bottom:0;
                left:0
            }
            .cropper-wrap-box{ overflow:hidden}
            .cropper-drag-box{opacity:0;background-color:#fff;filter:alpha(opacity=0)}
            .cropper-dashed,.cropper-modal{opacity:.5;filter:alpha(opacity=50)}
            .cropper-modal{background-color:#000}
            .cropper-view-box{display:block;
                              overflow:hidden;
                              width:100%;
                              height:100%;
                              outline:#39f solid 1px;
                              outline-color:rgba(51,153,255,.75)}
            .cropper-dashed{position:absolute;display:block;border:0 dashed #eee}
            .cropper-dashed.dashed-h{top:33.33333%;
                                     left:0;
                                     width:100%;
                                     height:33.33333%;
                                     border-top-width:1px;
                                     border-bottom-width:1px}
            .cropper-dashed.dashed-v{top:0;
                                     left:33.33333%;width:33.33333%;
                                     height:100%;
                                     border-right-width:1px;
                                     border-left-width:1px}
            .cropper-center{position:absolute;top:50%;left:50%;display:block;width:0;height:0;opacity:.75;filter:alpha(opacity=75)}.cropper-center:after,.cropper-center:before{position:absolute;display:block;content:' ';background-color:#eee}.cropper-center:before{top:0;left:-3px;width:7px;height:1px}.cropper-center:after{top:-3px;left:0;width:1px;height:7px}.cropper-face,.cropper-line,.cropper-point{position:absolute;display:block;width:100%;height:100%;opacity:.1;filter:alpha(opacity=10)}.cropper-face{top:0;left:0;background-color:#fff}.cropper-line,.cropper-point{background-color:#39f}.cropper-line.line-e{top:0;right:-3px;width:5px;cursor:e-resize}.cropper-line.line-n{top:-3px;left:0;height:5px;cursor:n-resize}.cropper-line.line-w{top:0;left:-3px;width:5px;cursor:w-resize}.cropper-line.line-s{bottom:-3px;left:0;height:5px;cursor:s-resize}.cropper-point{width:5px;height:5px;opacity:.75;filter:alpha(opacity=75)}.cropper-point.point-e{top:50%;right:-3px;margin-top:-3px;cursor:e-resize}.cropper-point.point-n{top:-3px;left:50%;margin-left:-3px;cursor:n-resize}.cropper-point.point-w{top:50%;left:-3px;margin-top:-3px;cursor:w-resize}.cropper-point.point-s{bottom:-3px;left:50%;margin-left:-3px;cursor:s-resize}.cropper-point.point-ne{top:-3px;right:-3px;cursor:ne-resize}.cropper-point.point-nw{top:-3px;left:-3px;cursor:nw-resize}.cropper-point.point-sw{bottom:-3px;left:-3px;cursor:sw-resize}.cropper-point.point-se{right:-3px;bottom:-3px;width:20px;height:20px;cursor:se-resize;opacity:1;filter:alpha(opacity=100)}.cropper-point.point-se:before{position:absolute;right:-50%;bottom:-50%;display:block;width:200%;height:200%;content:' ';opacity:0;background-color:#39f;filter:alpha(opacity=0)}@media (min-width:768px){.cropper-point.point-se{width:15px;height:15px}}@media (min-width:992px){.cropper-point.point-se{width:10px;height:10px}}@media (min-width:1200px){.cropper-point.point-se{width:5px;height:5px;opacity:.75;filter:alpha(opacity=75)}}.cropper-invisible{opacity:0;filter:alpha(opacity=0)}.cropper-bg{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAAA3NCSVQICAjb4U/gAAAABlBMVEXMzMz////TjRV2AAAACXBIWXMAAArrAAAK6wGCiw1aAAAAHHRFWHRTb2Z0d2FyZQBBZG9iZSBGaXJld29ya3MgQ1M26LyyjAAAABFJREFUCJlj+M/AgBVhF/0PAH6/D/HkDxOGAAAAAElFTkSuQmCC)}.cropper-hide{position:absolute;display:block;width:0;height:0}.cropper-hidden{display:none!important}.cropper-move{cursor:move}.cropper-crop{cursor:crosshair}.cropper-disabled .cropper-drag-box,.cropper-disabled .cropper-face,.cropper-disabled .cropper-line,.cropper-disabled .cropper-point{cursor:not-allowed} 
        </style>
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
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">My Profile</h3>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="k-portlet alert_part circle_create">
                                    <div id="ViewAdminId">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon ">
                                                    <i class="flaticon-add"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">Department Admin Details</h3>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body">
                                            <div class="border_boxesDiv mb-4">
                                                <table class="table table-striped- table-bordered table-hover table-checkable ">
                                                    <tbody>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Admin Full Name</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="admin">${departmentadmin.deptAdminName}</span></td>
                                                            <th><span class="dwn_arrow">Designation</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="design">${departmentadmin.designation}</span></td>
                                                        </tr>

                                                        <tr>
                                                            <th><span class="dwn_arrow">Email Id</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="email">${departmentadmin.deptEmailId}</span></td>
                                                            <th><span class="dwn_arrow">Mobile No.</span></th>
                                                            <td class="upr_text" ><span class="rs_ic" id="mobile">${departmentadmin.deptMobNo}</span></td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <button type="button" class="btn btn-primary btn-sm"  onclick="editAdmin();"><i class="flaticon-edit"></i>Update Details</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>                           
                             </div>                              
                         </div>
                        

                        <div class="row">
                            <div class="col-md-12">
                                <div class="k-portlet alert_part circle_create">
                                    <div class="k-portlet__body">
                                    <div id="ViewDepartmentId">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon ">
                                                    <i class="flaticon-add"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">Department Details</h3>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body">
                                            <div class="border_boxesDiv mb-4">
                                                <table class="table table-striped- table-bordered table-hover table-checkable ">
                                                    <tbody>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Department Name</span></th>
                                                            <td class="upr_text" ><span id="viewdeptName" class="rs_ic">${departmentadmin.deptName}</span></td>
                                                            <th><span class="dwn_arrow">Short Name</span></th>
                                                            <td class="upr_text" ><span id="viewdeptShortName" class="rs_ic">${departmentadmin.deptShortName}</span></td>
                                                        </tr>

                                                        <tr>
                                                            <th><span class="dwn_arrow">Bank Name</span></th>
                                                            <td class="upr_text" ><span  id="viewbankName" class="rs_ic">${departmentadmin.bankName}${departmentadmin.bankOtherName}</span></td>
                                                            <th><span class="dwn_arrow">Branch Name</span></th>
                                                            <td class="upr_text" ><span id="viewbankBranchName" class="rs_ic">${departmentadmin.bankBranchName}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Account Number</span></th>
                                                            <td class="upr_text" ><span id="viewaccountNumber" class="rs_ic">${departmentadmin.accountNumber}</span></td>
                                                            <th><span class="dwn_arrow">IFSC Code</span></th>
                                                            <td class="upr_text" ><span id="viewifscCode" class="rs_ic">${departmentadmin.ifscCode}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Sub Account Name</span></th>
                                                            <td class="upr_text" ><span id="viewsubAccountName" class="rs_ic">${departmentadmin.subAccountName}</span></td>
                                                            <th><span class="dwn_arrow">Web URL</span></th>
                                                            <td class="upr_text" ><span id="viewdeptWebUrl" class="rs_ic">${departmentadmin.deptWebUrl}</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Auction Prefix</span></th>
                                                            <td class="upr_text" ><span id="viewauctionPrefix" class="rs_ic">${departmentadmin.auctionPrefix}</span></td>
                                                            <th><span class="dwn_arrow">Auction Starting No.</span></th>
                                                            <td class="upr_text" ><span id="viewauctionStartingNo" class="rs_ic">${departmentadmin.auctionStartingNo}</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Tender prefix</span></th>
                                                            <td class="upr_text" ><span id="viewtenderPrefix" class="rs_ic">${departmentadmin.tenderPrefix}</span></td>
                                                            <th><span class="dwn_arrow">Tender Starting No.</span></th>
                                                            <td class="upr_text" ><span id="viewtenderStartingNo" class="rs_ic">${departmentadmin.tenderStartingNo}</span></td>

                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Department Address</span></th>
                                                            <td class="upr_text" ><span id="viewdeptAddress" class="rs_ic">${departmentadmin.deptAddress}</span></td>
                                                            <th><span class="dwn_arrow">Description</span></th>
                                                            <td><button data-toggle="modal"  class="btn btn-primary btn-sm" data-target="#deptdesc"><span>View Description</span></button></td>   
                                                        </tr>
                                                        <tr>
                                                            <th><span class="dwn_arrow">Work Order</span></th>
                                                            <td class="upr_text" ><span  class="rs_ic"><a href="${departmentadmin.deptWorkOrderFileUrl}" id="viewdeptWorkOrderFileName"  target="_blank">${departmentadmin.deptWorkOrderFileName}</a></span></td>
                                                            <th><span class="dwn_arrow">Department Logo</span></th>
                                                            <td class="upr_text" ><span  id="viewdeptLogoFileName" class="rs_ic"><a href="${departmentadmin.deptLogoFileUrl}"  target="_blank">${departmentadmin.deptLogoFileName}</a></span></td>

                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <button type="button" class="btn btn-primary btn-sm"  onclick="editDept();"><i class="flaticon-edit"></i>Update Details</button>
                                            </div>
                                            <!--########################-->

                                        </div>
                                        <!--########################-->
                                    </div>
                               
                                <div class="modal mdl-bg fade" id="deptdesc" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Department Description</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">Close</span>
                                                </button>
                                            </div>
                                            <div class="modal-body notification_md">
                                                <span id="viewdeptDescription">${departmentadmin.deptDescription}</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="border_boxesDiv mb-4" id="EditAdminId" style="display: none;"> 
                                    <div class="k-content__body	k-grid__item k-grid__item--fluid">
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
                                                <button type="button" class="btn btn-elevate btn-success btn-sm" onclick="Previous();" value="submit" >Previous</button> 
                                                <button type="button" class="btn btn-primary btn-sm"  onclick="saveDepartment();"   value="submit" >Update</button>

                                            </div>
                                        </form:form>   
                                    </div>
                                </div>
                                <div id="content" style="display: none;" style="max-width:50%;"> 
                                    <!--STAR_TENDER_WIZARD_MODAL -->
                                    <form:form  class="k-form" modelAttribute="superAdmin"  enctype="multipart/form-data"> 
                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon">
                                                    <i class="flaticon-cogwheel"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">
                                                    Update Department
                                                </h3>
                                            </div>
                                        </div>
                                        <form:hidden path="deptId" id="deptId"/>

                                        <div class="k-content__body	k-grid__item k-grid__item--fluid">
                                            <div class="form-group border_boxesDiv">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Department Name<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control Name" id="deptName" placeholder="" onchange="changeDeptName();"  name="deptName" value="${superAdmin.deptName}"/> 
                                                        <span class="form-text text-danger ValidationMsg" id="deptNameError"></span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Department Short Name<span class="text-danger">*</span></label>

                                                        <input type="text" class="form-control ShortName" id="deptShortName" placeholder=" " onchange="changeShortName();"  name="deptShortName"   value="${superAdmin.deptShortName}" />
                                                        <span class="form-text text-danger ValidationMsg" id="deptShortNameError"></span>
                                                    </div>
                                                </div>
                                            </div>	

                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Phone No.<span class="text-danger">*</span></label>
                                                        <input type="text"  class="form-control Phone_No" id="deptPhoneNo" placeholder=" "  name="deptPhoneNo" value="${superAdmin.deptPhoneNo}" />
                                                        <span class="form-text text-danger ValidationMsg" id="deptPhoneNoError" > </span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Fax No.</label>

                                                        <input type="text" class="form-control" id="deptFaxNo"  name="deptFaxNo" onchange="changedeptFaxNo();" value="${superAdmin.deptFaxNo}" />
                                                        <!--<span class="form-text text-danger ValidationMsg" id="deptFaxNoError" > </span>-->

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Bank Name <span class="text-danger">*</span></label>
                                                        <select class="form-control"  id="bankName"  name="bankName" onchange="admSelectCheck(this);changeBank();" >

                                                            <c:if test="${superAdmin.bankName!=null}">
                                                                <option value="${superAdmin.bankName}${departmentadmin.bankOtherName}">${superAdmin.bankName}${departmentadmin.bankOtherName}</option>  
                                                            </c:if>
                                                            <option value="">Select</option>
                                                            <option value="ALLAHABAD BANK">ALLAHABAD BANK</option>
                                                            <option value="ANDHRA BANK">ANDHRA BANK</option>
                                                            <option value="BANK OF BARODA">BANK OF BARODA</option>
                                                            <option value="BANK OF INDIA">BANK OF INDIA</option>
                                                            <option value="ALLAHABAD BANK">ALLAHABAD BANK</option>
                                                            <option value="BANK OF MAHARASHTRA">BANK OF MAHARASHTRA</option>
                                                            <option value="CANARA BANK">CANARA BANK</option>
                                                            <option value="CENTRAL BANK OF INDIA">CENTRAL BANK OF INDIA</option>
                                                            <option value="CORPORATION BANK">CORPORATION BANK</option>
                                                            <option value="DENA BANK">DENA BANK</option>
                                                            <option value="IDBI BANK LTD.">IDBI BANK LTD.</option>
                                                            <option value="IND BANK HOUSING LTD.">IND BANK HOUSING LTD.</option>
                                                            <option value="INDBANK MERCHANT BANKING SERVICES LTD.">INDBANK MERCHANT BANKING SERVICES LTD.</option>
                                                            <option value="INDIAN BANK">INDIAN BANK</option>
                                                            <option value="INDIAN OVERSEAS BANK">INDIAN OVERSEAS BANK</option>
                                                            <option value="JAMMU & KASHMIR BANK LTD.,THE">JAMMU & KASHMIR BANK LTD.,THE</option>
                                                            <option value="ORIENTAL BANK OF COMMERCE">ORIENTAL BANK OF COMMERCE</option>
                                                            <option value="PNB GILTS LTD">PNB GILTS LTD</option>
                                                            <option value="PUNJAB & SIND BANK">PUNJAB & SIND BANK</option>
                                                            <option value="PUNJAB NATIONAL BANK">PUNJAB NATIONAL BANK</option>
                                                            <option value="STATE BANK OF INDIA">STATE BANK OF INDIA</option>
                                                            <option value="SYNDICATE BANK">SYNDICATE BANK</option>
                                                            <option value="UCO BANK">UCO BANK</option>
                                                            <option value="UNION BANK OF INDIA">UNION BANK OF INDIA</option>
                                                            <option value="UNITED BANK OF INDIA">UNITED BANK OF INDIA</option>
                                                            <option value="ALLAHABAD BANK">ALLAHABAD BANK</option>
                                                            <option value="VIJAYA BANK">VIJAYA BANK</option>
                                                            <option value="Other" id="otherid">Other</option>

                                                        </select>  
                                                        <span class="form-text text-danger ValidationMsg" id="bankNameError" ></span>
                                                    </div>

                                                    <div class="col-lg-6" id="admDivCheck" style="display:none;">
                                                        <label>Bank Other Name<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control bankOtherName" id="bankOtherName" name="bankOtherName" onchange="changeBank();"  value="${superAdmin.bankOtherName}" />
                                                        <span class="form-text text-danger ValidationMsg" id="bankOtherNameError"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label class="">Branch Name <span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control BranchName" id="bankBranchName" onchange="changeBranch();"  name="bankBranchName" value="${superAdmin.bankBranchName}" />
                                                        <span class="form-text text-danger ValidationMsg" id="bankBranchNameError"> </span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Account Number<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control accountNumber" id="accountNumber" onchange="changeAccNum();"  name="accountNumber" value="${superAdmin.accountNumber}"  />
                                                        <span class="form-text text-danger ValidationMsg" id="accountNumberError"> </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label class="">IFSC Code<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control ifscCode" id="ifscCode" onchange="changeIfsc();"   name="ifscCode" value="${superAdmin.ifscCode}"  />
                                                        <span class="form-text text-danger ValidationMsg" id="ifscCodeError"> </span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Sub Account Name<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control subAccountName" id="subAccountName" onchange="changeSubAccount();"  name="subAccountName" value="${superAdmin.subAccountName}"  />
                                                        <span class="form-text text-danger ValidationMsg" id="subAccountNameError"> </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Auction Prefix<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control auctionPrefix" id="auctionPrefix" name="auctionPrefix" onchange="changeAucPre();"  value="${superAdmin.auctionPrefix}" />
                                                        <span class="form-text text-danger ValidationMsg" id="auctionPrefixError"></span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Auction Starting No.<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control auctionStartingNo" id="auctionStartingNo" onchange="changeAucNum();"  name="auctionStartingNo" value="${superAdmin.auctionStartingNo}"  />
                                                        <span class="form-text text-danger ValidationMsg" id="auctionStartingNoError"> </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Tender Prefix<span class="text-danger">*</span></label>

                                                        <input type="text" class="form-control auctionPrefix" id="tenderPrefix" name="tenderPrefix" onchange="changeTenPre();" value="${superAdmin.tenderPrefix}" />
                                                        <span class="form-text text-danger ValidationMsg" id="tenderPrefixError"> </span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Tender Starting No.<span class="text-danger">*</span></label>

                                                        <input type="text" class="form-control auctionStartingNo" id="tenderStartingNo" onchange="changeTenNum();"  name="tenderStartingNo" value="${superAdmin.tenderStartingNo}" />
                                                        <span class="form-text text-danger ValidationMsg" id="tenderStartingNoError"> </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Web URL<span class="text-danger">*</span></label>

                                                        <input type="text" class="form-control" id="deptWebUrl" placeholder=" " onchange="changeWeburl();" name="deptWebUrl"  value="${superAdmin.deptWebUrl}"/>
                                                        <span class="form-text text-danger ValidationMsg" id="deptWebUrlError"> </span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Password<span class="text-danger">*</span></label>

                                                        <input type="text" class="form-control Password" id="deptLoginPass" placeholder=" "   name="deptLoginPass"/>
                                                        <span class="form-text text-danger ValidationMsg" id="deptLoginPassError"> </span>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="form-group border_boxesDiv">	
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Department Address <span class="text-danger">*</span></label>
                                                        <form:textarea  path="deptAddress" class="form-control Address" id="deptAddress" onchange="changeAddress();"  value="${superAdmin.deptAddress}"></form:textarea>
                                                            <span class="form-text text-danger ValidationMsg" id="deptAddressError"></span>
                                                        </div> 
                                                        <div class="col-lg-6">
                                                            <label>Department Description(Maximum 300 words)<span class="text-danger">*</span></label>
                                                        <form:textarea  path="deptDescription"  class="form-control deptDescription"  id="deptDescription"  onChange="maxlength(this, 300);changeDesc();"  pattern="^(?:\b\w+\b[\s\r\n]*){1,300}$"  value="${superAdmin.deptDescription}"></form:textarea>
                                                            <span class="form-text text-danger ValidationMsg" id="deptDescriptionError"></span>
                                                        </div> 

                                                    </div>
                                                </div> 
                                                <div class="form-group border_boxesDiv">	
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <label>Work Order<span class="text-danger">*</span></label>
                                                            <div></div>
                                                            <div class="custom-file">
                                                                <input type="hidden"  value="${superAdmin.deptWorkOrderFileName}" id="deptWorkOderLink">
                                                            <input type="file" class="custom-file-input workorderclass" id="workOrder" onchange="saveWorkFile(this.id);changeWork();"  name="deptWorkOrderFileName"/>        
                                                            <label class="custom-file-label" for="customFile"><span id="workorderspan">Choose File</span></label>
                                                            <%--<a href="${superAdmin.deptWorkOrderFileUrl}" id="hrefworkId" target="_blank">${superAdmin.deptWorkOrderFileName}</a>--%>  
                                                        </div>
                                                        <span class="form-text text-danger ValidationMsg"  id="workOrderError"></span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label class="">Department Logo<span class="text-danger">*</span></label>
                                                        <div></div>
                                                        <div class="custom-file">
                                                            <input type="hidden"  value="${superAdmin.deptLogoFileName}" id="deptLogoLink" >
                                                            <input type="file" data-toggle="modal" data-target="#myymodel" class="custom-file-input logoclass"    name="deptLogo" id="file-input" />        
                                                            <label class="custom-file-label " for="customFile" ><span id="logospan">Choose File</span></label>
                                                            <%--<a href="${superAdmin.deptLogoFileUrl}" id="hrefLogoId" target="_blank">${superAdmin.deptLogoFileName}</a>--%>
                                                        </div>
                                                        <span class="form-text text-danger ValidationMsg" id="file-inputError"></span>
                                                        <span class="form-text text-danger ValidationMsg" id="file-inputspan"></span>
                                                    </div>
                                                </div>
                                            </div> 
                                        </form:form>
                                    </div>
                                    <div class="k-margin-t-30 k-align-center">
                                        <button type="button" class="btn btn-elevate btn-success btn-sm" onclick="PreviousDeptEdit();" value="submit" >Previous</button> 
                                        <button type="button" class="btn btn-primary btn-sm saveDept"   id="saveDept"  >Update</button>
                                    </div>
                                </div>
                                <!--DEPARTMENT_LOGO_MODEL START-->

                                <div class="modal mdl-bg fade" id="myymodel" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Department Logo</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form:form>
                                                
                                            <div class="modal-body notification_md">
                                                <div class="k-portlet__body">
                                                    <main class="page">
                                                        <div class="box">
                                                        </div>
                                                        <div class="box-2">
                                                            <div class="result"></div>
                                                        </div>
                                                        <div  class="box-2 img-result">
                                                            <img class="cropped" id="croppedimg" src=""  alt="">
                                                        </div>
                                                        <div id="hide" class="box">
                                                            <div class="options hide">
                                                                <input type="hidden" class="img-w" value="300" min="100" max="1200" />
                                                            </div>
                                                            <input type="hidden" class="btn save hide" id="save_btn"/>
                                                        </div>
                                                    </main> 
                                                </div>
                                            </div>
                                           
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-success btn-sm"   data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-success btn-sm" id="submitLogo"   data-dismiss="modal">Submit</button>
                                            </div>
                                             </form:form>
                                        </div>
                                    </div>
                                </div>
                                <!--dEPARTMENT_LOGO_MODEL END-->
                                <!--End Update Department-->
                                 </div>
                                 </div>            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!--end::Portlet-->
    <!--end::Row
    

    <!-- end::Global Config -->
    <!-- Angular js Controller --> 
    <script type="text/javascript">
        var result = document.querySelector('.result'),
                img_result = document.querySelector('.img-result'),
                img_w = document.querySelector('.img-w'),
                img_h = document.querySelector('.img-h'),
                options = document.querySelector('.options'),
                save = document.querySelector('.save'),
                cropped = document.querySelector('.cropped'),
                dwn = document.querySelector('.download'),
                Emailcheck = document.querySelector('#deptEmailId');
               upload = document.querySelector('#file-input'),
                cropper = '';
        
//                function saveLogoFile(name)
//        {
//        alert("in saveLogoFile " + name); 
        $("#file-input").change(function (e) {
                    //alert("file-input....");
        if (e.target.files.length) {
        var reader = new FileReader();
        reader.onload = function (e) {
        if (e.target.result) {
        var img = document.createElement('img');
        img.id = 'image';
        img.src = e.target.result;
        result.innerHTML = '';
        result.appendChild(img);
        save.classList.remove('hide');
        options.classList.remove('hide');
        cropper = new Cropper(img);
        }
        };
        //      alert(e.target.files[0].name);
        $("#croppedimg").val(e.target.files[0].name);
        reader.readAsDataURL(e.target.files[0]);
        }
        
        
        });
//        }

   $("#submitLogo").click(function (e) {
       var formdata1= new FormData();
//        alert("submitLogo");
        var departmentId =$("#deptId").val();
         var imgSrc = cropper.getCroppedCanvas({
         width: img_w.value
        }).toDataURL();
        //        }
//        alert("imgSrc:::" + imgSrc);
        console.log(imgSrc);
        cropped.classList.remove('hide');
        img_result.classList.remove('hide');
        cropped.src = imgSrc;

//        alert("departmentId"+departmentId);
            //-------------------convert cropper Canvas to Blob---------------//
        cropper.getCroppedCanvas().toBlob(function (blob) {  
        var logolink = $("#deptLogoLink").val();
        var croppedimg = $("#croppedimg").val();
        
//        alert(" croppedimg " + croppedimg);
        $("#logospan").html(croppedimg);
        formdata1.append('departmentId',departmentId);
        formdata1.append('cropedFile', blob);
        formdata1.append('deptLogo', croppedimg);
        $.ajax({
        url: "saveLogo",
                type: "POST",
                data: formdata1,
                processData: false,
                contentType: false,
                success: function (response) {
//                $('#preloaderSpinner').hide();
//               alert("Response is : " + response);

                $('.ValidationMsg').html('');
                if (response == "Department Logo Successfully Uploaded")
                {

                swal(
                        '',
                        'Department Logo Successfully Uploaded',
                        'success'
                        )
                 $("#logospan").html(croppedimg);
                }
                else
                {
                   swal(
                        '',
                        'Department Logo has not been Uploaded',
                        'error'
                        )  
                 
                }
                },
                error: function () {
                console.log('Upload error');
                }
        });
  
        });
    });
        $("#saveDept").click(function (e) {
            //alert("savesaveDept called");
             $('#preloaderSpinner').show();
         var formdata = new FormData();
           
        e.preventDefault();
        //        if($("#file-input").change())
        //        {
       
      
        var deptId = $("#deptId").val();
        $('#content').find('input[type != file],textarea,select').each(function () {
        formdata.append(this.name, this.value);
        });
        var workOrderFile = document.getElementById('workOrder').files[0];
        //                                        formdata.append("workOrderFile", document.getElementById('workOrder').files[0]);
        //                                        alert("workorder file name=" + document.getElementById('workOrder').files[0].name);

        var workorderlink = $("#deptWorkOderLink").val();
       
//        alert("croppedimg:- " + croppedimg + " , workOrderFile :- " + workOrderFile + ",  workorderlink :- " + workorderlink + " , logolink :- " + logolink);
        if (!(typeof workOrderFile === "undefined" || workOrderFile === '') && (workorderlink !== null || workorderlink !== ''))
        {

        //alert("workOrderFile has changed in updation");
        formdata.append("workOrderFile", workOrderFile);
        } else if ((typeof workOrderFile === "undefined" || workOrderFile === '') && (workorderlink !== null || workorderlink !== ''))
        {

        //alert("workOrderFile has not changed in updation");
        }

        $.ajax({
        url: "saveDepartment",
                type: "POST",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (response) {
                $('#preloaderSpinner').hide();
                //                                                alert("Response is : " + response);
                //                                     alert(JSON.stringify(response));

                $('.ValidationMsg').html('');
                if (response == "Department Successfully Updated")
                {

                swal(
                        '',
                        'Department Successfully Updated',
                        'success'
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

        function saveWorkFile(name)
        {
//            alert("in saveWorkFile " + name);
        var workOrderFile = document.getElementById('workOrder').files[0].name;
        //   alert("file:::"+file);
//        $("#workorderspan").html("");
        $("#workorderspan").html(workOrderFile);
        }
    </script>

    <script>
        function admSelectCheck(nameSelect)
        {
//        alert("nameSelect " + nameSelect);
        console.log(nameSelect);
        if (nameSelect) {
        admOptionValue = document.getElementById("otherid").value;
        if (admOptionValue == nameSelect.value) {
        document.getElementById("admDivCheck").style.display = "block";
        } else {
        document.getElementById("admDivCheck").style.display = "none";
        }
        } else {
        document.getElementById("admDivCheck").style.display = "none";
        }
        }
    </script>
    <script>
        function maxlength(element, maxvalue){
//            alert("element  " + element + "maxvalue " + maxvalue);
        var q = element.value.split(/[\s]+/).length;
          //  alert("length" + q)
        if (q > maxvalue){
//            alert("q > maxvalue");
        var r = q - maxvalue;
        swal(
                '',
                "Sorry, you have entered " + q + " words into the Department Description. You can not input more than " +
                maxvalue + " words to be processed.",
                'error'
                )

        }
        }
    </script>
    <script>
        $(document).ready(function ()
        {
//        alert("call ready function in onclick ");
        var firstregex = new RegExp(
                '^(([a-zA-Z]+$))'
                );
        var adminregex = new RegExp(
                '^(([a-zA-Z ]+$))'
                );
        var urlregex = new RegExp(
                //                        '^(([a-zA-Z0-9/]+$))'
                '^((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$)'

                );
        var emailregex = new RegExp(
                '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{3,3}))$'
                );
        var passregex = new RegExp(
                '^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,10})'
                );
        var mobregex = new RegExp(
                '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                );
        var addressregex = new RegExp(
                '^(([a-zA-Z0-9/- ]+$))'
                );
        var subaccountnoregex = new RegExp(
                '^(([a-zA-Z0-9]+$))'
                );
        var auctionprefix = new RegExp
                (
                        '^(([a-zA-Z0-9/]+$))'
                        );
        var auctionNoregex = new RegExp(
                '^(([0-9 ]+$))'
                );
        var mobregex = new RegExp(
                '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                );
        //            var reg = /^[A-Za-z]{4}[0-9]{6,7}$/;
        var ifscregex = new RegExp('^[A-Za-z]{4}[0-9]{6,7}$';
        );
        var accregex = '^([0-9]{11})|([0-9]{2}-[0-9]{3}-[0-9]{6})$';
        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.doc|\.docx|\.xl|\.xlx|\.pdf|\.rar|\.zip|\.cdr|\.dwg)$/i;
        $('.Phone_No').on('change', function (e) {
        if (mobregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid Phone number");
        //                        $("#"+id).val(' ');
        }
        });
        $('.Name').on('change', function (e) {
        if (firstregex.test($(this).val())) {
//        alert("in if name");
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid name");
        //                        $("#"+id).val(' ');
        }

        });
        $('.ShortName').on('change', function (e) {
        if (firstregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid short name");
        //                        $("#"+id).val(' ');
        }

        });
        $('.auctionPrefix').on('change', function (e) {
        if (auctionprefix.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid auction prefix");
        //                        $("#"+id).val(' ');
        }

        });
        $('.auctionStartingNo').on('change', function (e) {
        if (auctionNoregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid auction number");
        //                        $("#"+id).val(' ');
        }

        });
        $('.Password').on('change', function (e) {
        if (passregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid password");
        //                        $("#"+id).val(' ');
        }
        });
        $('.workorderclass').on('change', function (e) {
        if (allowedExtensions.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter Valid address");
        //                        $("#"+id).val(' ');
        }
        });
        $('.logoclass').on('change', function (e) {
        if (allowedExtensions.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter");
        //                        $("#"+id).val(' ');
        }
        });
        $('.Address').on('change', function (e) {
        if (addressregex.test($(this).val())) {
        $("#" + this.id + "Error").html(" ");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Please Enter a");
        //                        $("#"+id).val(' ');
        }
        });
        $('.subAccountName').on('change', function (e) {
        if (subaccountnoregex.test($(this).val())) {
        $("#" + this.id + "Error").html("");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("This field should be alphanumeric");
        //                        $("#"+id).val(' ');
        }
        });
        $('.ifscCode').on('change', function (e) {
        if (ifscregex.test($(this).val())) {
        $("#" + this.id + "Error").html("");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("This field should be alphanumeric");
        //                        $("#"+id).val(' ');
        }
        });
        $('.accountNumber').on('change', function (e) {
        if (accregex.test($(this).val())) {
        $("#" + this.id + "Error").html("");
        $("#" + this.id).css("border-color", "green");
        console.log("success");
        } else {
        $("#" + this.id).css("border-color", "red");
        $("#" + this.id + "Error").html("Invalid account number");
        //                        $("#"+id).val(' ');
        }
        });
        }
    </script>
    <script>
        function clientValidation() {
//        alert("clientValidation called");
        var deptName = $("#deptName").val();
//        alert("deptName " + deptName);
        var deptShortName = $("#deptShortName").val();
        var deptAddress = $("#deptAddress").val();
        var deptPhoneNo = $("#deptPhoneNo").val();
        var deptFaxNo = $("#deptFaxNo").val();
        var deptWebUrl = $("#deptWebUrl").val();
        var deptLoginPass = $("#deptLoginPass").val();
        var deptLogoFileName = $("#deptLogoFileName").val();
        var deptWorkOrderFileName = $("#deptWorkOrderFileName").val();
        var auctionPrefix = $("#auctionPrefix").val();
        var auctionStartingNo = $("#auctionStartingNo").val();
        var tenderPrefix = $("#tenderPrefix").val();
        var tenderStartingNo = $("#tenderStartingNo").val();
        //                var alpha = /^[a-zA-Z]*$/;
        //                var alphneu = /^[0-9]*$/;
        //            var mobNoreg = /^[0]?[789]\d{9}$/;
        //            var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.doc|\.docx|\.xl|\.xlx|\.pdf|\.rar|\.zip|\.cdr|\.dwg)$/i;
        if (deptWorkOrderFileName === "") {
        document.getElementById("deptWorkOrderFileNamespan").innerHTML = "deptWorkOrderFileName";
        } else
                if (!allowedExtensions.equals(deptWorkOrderFileName)) {
//        alert('Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.');
        document.getElementById("deptWorkOrderFileNamespan").innerHTML = "Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.";
        } else {
        document.getElementById("deptWorkOrderFileNamespan").innerHTML = "";
        }
        if (deptLogoFileName === "") {
        document.getElementById("deptLogoFileNamespan").innerHTML = "deptLogoFileName";
        } else
                if (!allowedExtensions.equals(deptLogoFileName)) {
//        alert('Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.');
        document.getElementById("deptWorkOrderFileNamespan").innerHTML = "Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.";
        } else {
        document.getElementById("deptLogoFileNamespan").innerHTML = "";
        }
        if (deptName == "") {
//        alert("in deptname");
        //                    document.getElementById("deptNamespan").innerHTML = "deptName";
        $("deptNamespan").html("deptName");
        } else {
        document.getElementById("deptNamespan").innerHTML = "";
        }
        if (deptShortName === "") {
        document.getElementById("deptShortNamespan").innerHTML = "deptShortName";
        } else {
        document.getElementById("deptShortNamespan").innerHTML = "";
        }
        if (deptAddress === "") {
        document.getElementById("deptAddressspan").innerHTML = "deptAddress";
        } else {
        document.getElementById("deptAddressspan").innerHTML = "";
        }

        if (deptPhoneNo === "") {
        document.getElementById("deptPhoneNospan").innerHTML = "deptPhoneNo";
        } else {
        document.getElementById("deptPhoneNospan").innerHTML = "";
        }

        if (deptLoginPass === "") {
        document.getElementById("deptLoginPassspan").innerHTML = "deptLoginPass";
        } else {
        document.getElementById("deptLoginPassspan").innerHTML = "";
        }
        if (auctionPrefix === "") {
        document.getElementById("auctionPrefixspan").innerHTML = "auctionPrefix";
        } else {
        document.getElementById("auctionPrefixspan").innerHTML = "";
        }
        if (auctionStartingNo === "") {
        document.getElementById("auctionStartingNospan").innerHTML = "auctionStartingNo";
        } else {
        document.getElementById("auctionStartingNospan").innerHTML = "";
        }
        if (tenderPrefix === "") {
        document.getElementById("tenderPrefixspan").innerHTML = "tenderPrefix";
        } else {
        document.getElementById("tenderPrefixspan").innerHTML = "";
        }
        if (tenderStartingNo === "") {
        document.getElementById("tenderStartingNospan").innerHTML = "tenderStartingNo";
        } else {
        document.getElementById("tenderStartingNospan").innerHTML = "";
        }
        }

        });
    </script>
    <script>
        function saveDepartment() {
//                    alert("savesaveDept called");
        $('#preloaderSpinner').show();
        var formdata = new FormData();
        var dept = $("#deptId").val();
        var deptemail = $("#deptEmailId").val();
        var deptMobNo = $("#deptMobNo").val();
        var designation = $("#designation").val();
        var deptAdminName = $("#deptAdminName").val();
        //            alert("dept " + dept);
        //            alert("deptEmailId " + deptemail);
        //            alert("deptMobNo " + deptMobNo);
        //            alert("designation " + designation);
        formdata.append("deptemail", deptemail);
        formdata.append("deptMobNo", deptMobNo);
        formdata.append("designation", designation);
        formdata.append("deptAdminName", deptAdminName);
        $.ajax({
        url: "updateDepartmentAdmin?dept=" + dept,
                type: "POST",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (response) {
                //                    alert("Response is : " + response);
                //                    alert(JSON.stringify(response));

                $('#preloaderSpinner').hide();
                $('.ValidationMsg').html('');
                if (response == "Department Admin Successfully Updated")
                {

                swal(
                        '',
                        'Department Admin Successfully Updated',
                        'success'
                        )
                } else if (response == "Duplicate Email")
                {
                swal(
                        '',
                        'Duplicate Email',
                        'error'
                        )
                } else if (response == "Duplicate Mobile Number")
                {
                swal(
                        '',
                        'Duplicate Mobile Number',
                        'error'
                        )
                } else if (response == "Duplicate Email and Mobile number")
                {
                swal(
                        '',
                        'Duplicate Email and Mobile number',
                        'error'
                        )
                } else
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
        }
    </script>
    <script>
        function editAdmin() {
//        alert("editAdmin");
        $("#content").hide();
        $("#ViewAdminId").hide();
        $("#ViewDepartmentId").hide();
        $("#EditAdminId").show();
        }

        function editDept() {
//        $("#preloaderSpinner").show();
        $("#content").show();
        $("#ViewAdminId").hide();
        $("#ViewDepartmentId").hide();
        $("#EditAdminId").hide();
        }

        function Previous() {
        $("#content").hide();
        $("#ViewAdminId").show();
        $("#ViewDepartmentId").show();
        $("#EditAdminId").hide();
        }

        function PreviousDeptEdit() {
        $("#content").hide();
        $("#ViewAdminId").show();
        $("#ViewDepartmentId").show();
        $("#EditAdminId").hide();
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
        function changeDeptName()
        {
        var deptName = $("#deptName").val();
        $("#viewdeptName").html("");
        $("#viewdeptName").html(deptName);
        }

        function changedeptFaxNo()
        {
        var deptFaxNo = $("#deptFaxNo").val();
        $("#viewdeptFaxNo").html("");
        $("#viewdeptFaxNo").html(deptFaxNo);
        }
        function changeShortName()
        {
        var deptShortName = $("#deptShortName").val();
        $("#viewdeptShortName").html("");
        $("#viewdeptShortName").html(deptShortName);
        $('#subAccountName').val(deptShortName);
        }
        function changeBank()
        {
        var bankName = $("#bankName").val();
        var bankOtherName = $("#bankOtherName").val();
        $("#viewbankName").html("");
        $("#viewbankName").html(bankOtherName);
        $("#viewbankName").html(bankName);
        
        }
        function changeBranch()
        {
        var bankBranchName = $("#bankBranchName").val();
        $("#viewbankBranchName").html("");
        $("#viewbankBranchName").html(bankBranchName);
        }
        function changeAccNum()
        {
        var accountNumber = $("#accountNumber").val();
        $("#viewaccountNumber").html("");
        $("#viewaccountNumber").html(accountNumber);
        }
        function changeIfsc()
        {
        var ifscCode = $("#ifscCode").val();
        $("#viewifscCode").html("");
        $("#viewifscCode").html(ifscCode);
        }
        function changeSubAccount()
        {
        var subAccountName = $("#subAccountName").val();
        $("#viewsubAccountName").html("");
        $("#viewsubAccountName").html(subAccountName);
        }
        function changeWeburl()
        {
        var deptWebUrl = $("#deptWebUrl").val();
        $("#viewdeptWebUrl").html("");
        $("#viewdeptWebUrl").html(deptWebUrl);
        }
        
        function changeAucPre()
        {
        var auctionPrefix = $("#auctionPrefix").val();
        $("#viewauctionPrefix").html("");
        $("#viewauctionPrefix").html(auctionPrefix);
        }
        function changeAucNum()
        {
        var accountNumber = $("#auctionStartingNo").val();
        $("#viewauctionStartingNo").html("");
        $("#viewauctionStartingNo").html(accountNumber);
        }
        function changeTenPre()
        {
        var tenderPrefix = $("#tenderPrefix").val();
        $("#viewtenderPrefix").html("");
        $("#viewtenderPrefix").html(tenderPrefix);
        }
        function changeTenNum()
        {
        var tenderStartingNo = $("#tenderStartingNo").val();
        $("#viewtenderStartingNo").html("");
        $("#viewtenderStartingNo").html(tenderStartingNo);
        }
        
        function changeAddress()
        {
        var deptAddress = $("#deptAddress").val();
        $("#viewdeptAddress").html("");
        $("#viewdeptAddress").html(deptAddress);
        }
        function changeDesc()
        {
        var deptDescription = $("#deptDescription").val();
        $("#viewdeptDescription").html("");
        $("#viewdeptDescription").html(deptDescription);
        }
    </script>
    <script>
        $(document).ready(function () {
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
//        alert("client validation function called");
        var deptAdminName = $("#deptAdminName").val();
        var designation = $("#designation").val();
        var deptEmailId = $("#deptEmailId").val();
        var deptMobNo = $("#deptMobNo").val();
        var alpha = /^[a-zA-Z]*$/;
        var mobNoreg = /^[0]?[789]\d{9}$/;
        var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
        if (deptAdminName === "") {

        $("#" + this.id + "Error").html("Please Enter Admin Name");
        } else {
        $("#" + this.id + "Error").html("");
        }
        if (designation === "") {
        $("#" + this.id + "Error").html("Please Enter Designation");
        } else {

        $("#" + this.id + "Error").html("");
        }
        if (deptEmailId == "") {
        $("#" + this.id + "Error").html("Please Enter Email Id");
        } else {
        $("#" + this.id + "Error").html("");
        }
        if (deptMobNo === "") {
        $("#" + this.id + "Error").html("Please Enter Mobile No.");
        } else {
        $("#" + this.id + "Error").html("");
        }
        }
        });
    </script>

    <script>
        function backButtonDisable() {
        window.history.pushState(null, "", window.location.href);
        window.onpopstate = function () {
        window.history.pushState(null, "", window.location.href);
        };
        }
    </script>
    <script>
        $(function () {
//        alert("call function");
        $(".preloader").fadeOut(2000, function () {
        $(".loader_main").fadeIn(1000);
        });
        });
    </script>
</body>
<!-- end::Body -->
</html>