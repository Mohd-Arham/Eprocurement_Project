
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Secondary Contractor View Profile</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="<c:url value="/resources/js/angular/ContractorController.js" />"></script>
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

        <!--end::Web font -->

        <!--begin:: Global Mandatory Vendors -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
        <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />

        <!--end:: Global Mandatory Vendors -->
         <script src="<c:url value="/resources/angular/ContractorController.js" />" type="text/javascript"></script>
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
         <link href="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.css"/>" rel="stylesheet" type="text/css" />
        <style>


            /*****NAV-TABS-CSS*****/
            .tender_view_tab .k-portlet__body{
                padding-top:6px;
            }
            .nav-tabs.nav-tabs-line .nav-link {

            }
            .nav-tabs.nav-tabs-line {

            }
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger.nav.nav-tabs .nav-link:hover, .nav-tabs.nav-tabs-line.nav-tabs-line-danger.nav.nav-tabs .nav-link.active, .nav-tabs.nav-tabs-line.nav-tabs-line-danger a.nav-link:hover, .nav-tabs.nav-tabs-line.nav-tabs-line-danger a.nav-link.active {

            }
            .tender_view_tab .k-portlet__head { 
                min-height: inherit;
            }
            .tender_view_tab.k-portlet--tabs .nav-tabs.nav-tabs-line {

            }
            .tender_view_tab.k-portlet--tabs .nav-tabs.nav-tabs-line .nav-item {
                margin-right: 15px;
                margin-bottom: -1px;
            }
            .tender_view_tab .nav-tabs.nav-tabs-line .nav-link {
                border: 0;
                border-bottom: 1px solid transparent;
                padding: 12px 15px;
                font-size: 1rem;
                font-weight: 400;
            }
            /*****NAV-TABS-CSS-END****/
            .payment_mode{
                position: relative;
                top: 9px;
                left: 11px;
                font-weight:normal;
            }
            .tender_search{
                padding:0;
            }
            .tender_search li {
                width: 23.5%;
                float: left;
                list-style: none;
                margin-right: 10px;
            } 

            .AuctionWizard .wizard_tb .nav-pills.nav-tabs-btn .nav-item {
                border-radius: 100px;
                background-color: #fff;
                height: 45px;
                width: 45px;
                margin: 0 5.3rem;
                cursor: no-drop;
            }

            .AuctionWizard .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 87%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 50%;
                z-index: 1;
            }

            .mdl-bg {
                background-color: #000000ab;
            }

            .k-separator.k-separator--height-sm {
                height: 0.5rem;
            }
            /*.k-aside__brand-logo:before {
        background-color: #ffffff;
        top: 0;
        left: -45px;
        bottom: 0;
        content: "";
        position: absolute;
        -webkit-transform: skew(-30deg);
        -moz-transform: skew(-30deg);
        -ms-transform: skew(-30deg);
        -o-transform: skew(-30deg);
        transform: rotate(0deg);
        width: 100%;
    }
            .k-aside__brand-logo{
            position:relative;}
    .k-aside__brand-logo:after {
        background-color: #ffffff;
        top: 0px;
        right: 15px;
        bottom: 0;
        content: "";
        width: 48%;
        position: absolute;
        -webkit-transform: skew(-30deg);
        -moz-transform: skew(-30deg);
        -ms-transform: skew(-30deg);
        -o-transform: skew(-30deg);
        transform: rotate(44deg);
    }*/

            .wizard_tb .nav-pills.nav-tabs-btn .nav-link {
                padding: 8px!important;
                border-radius: 100px;
                border: 1px solid #dedede;
                height: 45px;
                width: 45px;
                pointer-events: none;
            }

            .wizard_tb .nav-pills.nav-tabs-btn .nav-item {
                border-radius: 100px;
                background-color: #fff;
                height: 45px;
                width: 45px;
                margin: 0 12.05rem;
                cursor: no-drop;
            }

            .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 67%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 42%;
                z-index: 1;
            }

            .sve_class_cl {
                background-color: #44cb99;
            }

            .sve_class_cl span {
                color: #fff!important;
            }

            .sve_class_already {
                background-color: #00BCD4;
            }

            .sve_class_already span {
                color: #fff!important;
            }

            <!-- .sve_class_cl:before {
                --> <!-- content: "\f150";
                --> <!-- color: #fff;
                --> <!-- background-color: #44cb99;
                --> <!-- height: 45px;
                --> <!-- width: 45px;
                --> <!-- border-radius: 100px;
                --> <!-- line-height: 45px;
                --> <!-- position: absolute;
                --> <!--
            }

            --> .modal-body .ps > .ps__rail-y > .ps__thumb-y {
                background: #5867dc;
                opacity: 1;
            }

            .space_btn_height {
                height: 21px;
            }

            .detail-tender {
                padding: 5px 0px 8px;
            }
            .detail-tender p {
                text-align: center;
                margin: 0;
                color: #6e4ff6;
                font-size: 13px;
            }
            .detail-tender p span {
                /* font-size: 12px; */
                color: #fd3995;
                padding-right: 8px;
                padding-left: 8px;
            }		
        </style>
        <style>
            .Validatingfield {
                color: red;
                font-size: 13px;
            }
            span.staric {
                font-size: 19px;
                color: red;
                font-weight: normal;
            }
        </style>



    </head>


    <!-- end::Head -->

    <!-- begin::Body -->

    <body ng-controller="myCtrl" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">
        <jsp:include page="../Contractor/SecondaryContractorRegistrationModel.jsp"></jsp:include> 
        <jsp:include page="../Contractor/Tiles/otpModal.jsp"></jsp:include>  
<!--         <input type="hidden" value="${secondrycontractor.contractor_privilege}" id="contprivilege"/>-->
        <!--STAR_TENDER_WIZARD_MODAL -->
        <!-- Large Modal -->
        <div class="modal fade" id="contractorProfileWizard" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="max-width:90%;">
                <div class="modal-content">
                    <!--<div class="modal-header">
                                                                                                                                     </div>-->
                    <div class="modal-body" style="background-color: #f8f8f8;">
                        <div class="k-portlet" style="margin-bottom:0;">
                            <div class="k-portlet__head" style="padding: 12px 25px;">
                                <div class="wizard_tb" style="position:relative;">
                                    <div class="connecting-line"></div>
                                    <ul class="nav nav-pills nav-tabs-btn" role="tablist" style="padding-bottom:0px;position:relative;z-index:1;">

                                        <li class="nav-item" id="li1">
                                            <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_1_tab_content" id="step1" role="tab">
                                                <span class="nav-link-title">1</span>
                                                <span class="fa fa-check" style="display:none;"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item" id="test2">
                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_tab_content" id="step2" role="tab">
                                                <span class="nav-link-title">2</span>
                                                <span class="fa fa-check" style="display:none;"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item" id="test3">
                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_3_tab_content" id="step3" role="tab">
                                                <span class="nav-link-title">3</span>
                                                <span class="fa fa-check" style="display:none;"></span>
                                            </a>
                                        </li>
                                   </ul>
                                </div>
                            </div>
                            

                        </div>
                    </div>
                 
                </div>
            </div>
        </div>

        <!--END_TENDER_WIZARD_MODAL_FORM-->

        <!-- begin:: Page -->

        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="index.html">
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
                            <a href="index.html">
                                <img alt="Logo" src="resources/assets/demo/media/logo-light.png" style="max-width: 80%;" />
                            </a>
                        </div>
                        <div class="k-aside__brand-tools">
                            <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                        </div>
                    </div>

                    <!-- end:: Aside -->


                    <!-- begin:: Aside Menu -->
                    <div class="k-aside-menu-wrapper	k-grid__item k-grid__item--fluid" id="k_aside_menu_wrapper">
                        <div id="k_aside_menu" class="k-aside-menu " data-kmenu-vertical="1" data-kmenu-scroll="1" data-kmenu-dropdown-timeout="500" style="position: relative;">
                            <ul class="k-menu__nav " style="padding-top:4px;">
                                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover" style="padding: 20px 0;"><a href="#" class="k-menu__link k-menu__toggle" style="background-color:#fff!important;cursor:inherit;"><i class="k-menu__link-icon la la-clock-o" style="color: #fd3995;font-size: 21px;"></i><span class="k-menu__link-text time_view"><p class="clock_section">05:10:20<span class="">PM</span><span class="day_view">10-09-2018 | Wednesday</span></p></span></a>
                                </li>
                                <li class="k-menu__item  k-menu__item--submenu k-menu__item--open k-menu__item--expanded" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="index.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-line-graph"></i><span class="k-menu__link-text">Dashboards</span></a>
                                </li>
                                <li class="k-menu__section ">
                                    <h4 class="k-menu__section-text">Components</h4>
                                    <i class="k-menu__section-icon flaticon-more-v2"></i>
                                </li>
                                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="tender.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">My Tender</span></a>
                                </li>
                                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="auction.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-gavel"></i><span class="k-menu__link-text">My Auction</span></a>
                                </li>
                                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-user-lock"></i><span class="k-menu__link-text">DSC</span> </a>
                                </li>
                                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-cubes"></i><span class="k-menu__link-text">Live Tender</span></a>
                                </li>
                                    <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-tabs"></i><span class="k-menu__link-text">Live Auction</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                    <c:if test="${loginContractor !='secondaryContractor'} ">  
                                    <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="ManageContractor?id=${regId}" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-tabs"></i><span class="k-menu__link-text">Manage User</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                    </c:if>
                                    <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-tabs"></i><span class="k-menu__link-text">e-Receipt</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                    <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" onclick="changePassword();" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-cubes"></i><span class="k-menu__link-text">Change Password</span></a>
                                    </li>
                                    <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                        <ul class="k-menu__subnav">
                                            <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Keen Datatable</span></span></li>
                                           <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Scrolling</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                                    <ul class="k-menu__subnav">
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/vertical.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Vertical Scrolling</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/horizontal.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Horizontal Scrolling</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/both.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Both Scrolling</span></a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Locked Columns</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                                    <ul class="k-menu__subnav">
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/left.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Left Locked Columns</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/right.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Right Locked Columns</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/both.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Both Locked Columns</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/html-table.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">HTML Table</span></a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Child Datatables</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                                    <ul class="k-menu__subnav">
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/child/data-local.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Data</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/child/data-ajax.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Remote Data</span></a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">API</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                                    <ul class="k-menu__subnav">
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/api/methods.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">API Methods</span></a></li>
                                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/api/events.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Events</span></a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                              
                             </ul>
                        </div>
                    </div>

                    <!-- end:: Aside Menu -->

                    <!-- begin:: Aside -->
                    <div class="k-aside__footer		k-grid__item" id="k_aside_footer">
                        <a href="#" class="btn btn-elevate btn btn-icon btn-font-brand"><i class="flaticon-cogwheel"></i></a>
                        <a href="#" class="btn btn-elevate btn btn-icon btn-font-brand"><i class="flaticon-alert-2"></i></a>
                        <button type="button" class="btn btn-elevate btn btn-icon btn-font-brand" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="flaticon-add"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-left">
                            <ul class="k-nav">
                                <li class="k-nav__section k-nav__section--first">
                                    <span class="k-nav__section-text">Export Tools</span>
                                </li>
                                <li class="k-nav__item">
                                    <a href="#" class="k-nav__link">
                                        <i class="k-nav__link-icon la la-print"></i>
                                        <span class="k-nav__link-text">Print</span>
                                    </a>
                                </li>
                                <li class="k-nav__item">
                                    <a href="#" class="k-nav__link">
                                        <i class="k-nav__link-icon la la-copy"></i>
                                        <span class="k-nav__link-text">Copy</span>
                                    </a>
                                </li>
                                <li class="k-nav__item">
                                    <a href="#" class="k-nav__link">
                                        <i class="k-nav__link-icon la la-file-excel-o"></i>
                                        <span class="k-nav__link-text">Excel</span>
                                    </a>
                                </li>
                                <li class="k-nav__item">
                                    <a href="#" class="k-nav__link">
                                        <i class="k-nav__link-icon la la-file-text-o"></i>
                                        <span class="k-nav__link-text">CSV</span>
                                    </a>
                                </li>
                                <li class="k-nav__item">
                                    <a href="#" class="k-nav__link">
                                        <i class="k-nav__link-icon la la-file-pdf-o"></i>
                                        <span class="k-nav__link-text">PDF</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <a href="#" class="btn btn-elevate btn btn-icon btn-font-brand"><i class="flaticon-calendar-1"></i></a>
                    </div>

                    <!-- end:: Aside -->
                </div>

                <!-- end:: Aside -->
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                    <!-- begin:: Header -->
                    <div id="k_header" class="k-header k-grid__item  k-header--fixed k-header--skin-default ">

                        <!-- begin: Header Menu -->
                        <button class="k-header-menu-wrapper-close" id="k_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
                        <div class="k-header-menu-wrapper" id="k_header_menu_wrapper">

                        </div>

                        <!-- end: Header Menu -->

                        <!-- begin:: Header Topbar -->
                        <div class="k-header__topbar">

                            <!--begin: Search -->
                            <div class="k-header__topbar-item k-header__topbar-item--search dropdown">
                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                    <span class="k-header__topbar-icon"><i class="flaticon-search"></i></span>
                                </div>
                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-lg">
                                    <form method="get">
                                        <div class="k-input-icon k-input-icon--left">
                                            <input type="text" name="query" value="" class="form-control" placeholder="Search...">
                                            <span class="k-input-icon__icon k-input-icon__icon--left">
                                                <span><i class="la la-search"></i></span>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!--end: Search -->

                            <!--begin: Notifications -->
                            <div class="k-header__topbar-item dropdown">
                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                    <span class="k-header__topbar-icon"><i class="flaticon-alarm"></i></span>
                                    <span class="k-badge k-badge--dot k-badge--sm k-badge--danger"></span>
                                </div>
                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl">
                                    <div class="k-head" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                        <h3 class="k-head__title">User Notifications</h3>
                                        <div class="k-head__sub"><span class="k-head__desc">23 new notifications</span></div>
                                    </div>
                                    <div class="k-notification k-margin-t-30 k-margin-b-20 k-scroll" data-scroll="true" data-height="270" data-mobile-height="220">
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-time-2"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New order has been received
                                                </div>
                                                <div class="k-notification__item-time">
                                                    2 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-upload-1"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New customer is registered
                                                </div>
                                                <div class="k-notification__item-time">
                                                    3 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-interface-8"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    Application has been approved
                                                </div>
                                                <div class="k-notification__item-time">
                                                    3 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-file"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New file has been uploaded
                                                </div>
                                                <div class="k-notification__item-time">
                                                    5 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-user"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New user feedback received
                                                </div>
                                                <div class="k-notification__item-time">
                                                    8 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    System reboot has been successfully completed
                                                </div>
                                                <div class="k-notification__item-time">
                                                    12 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-light"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New order has been placed
                                                </div>
                                                <div class="k-notification__item-time">
                                                    15 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item k-notification__item--read">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-interface-2"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    Company meeting canceled
                                                </div>
                                                <div class="k-notification__item-time">
                                                    19 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-diagram"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New report has been received
                                                </div>
                                                <div class="k-notification__item-time">
                                                    23 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-pie-chart"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    Finance report has been generated
                                                </div>
                                                <div class="k-notification__item-time">
                                                    25 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-speech-bubble-1"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New customer comment recieved
                                                </div>
                                                <div class="k-notification__item-time">
                                                    2 days ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-exclamation-2"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New customer is registered
                                                </div>
                                                <div class="k-notification__item-time">
                                                    3 days ago
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                             <!--end: Notifications -->
                                <!--begin: Quick actions -->
                            <div class="k-header__topbar-item dropdown">
                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                    <span class="k-header__topbar-icon"><i class="flaticon-settings"></i></span>
                                </div>
                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl">
                                    <div class="k-head" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                        <h3 class="k-head__title">Quick Actions</h3>
                                    </div>
                                    <div class="k-grid-nav">
                                        <a href="#" class="k-grid-nav__item">
                                            <div class="k-grid-nav__item-icon"><i class="flaticon-computer"></i></div>
                                            <div class="k-grid-nav__item-title">Customers</div>
                                            <div class="k-grid-nav__item-desc">per department</div>
                                        </a>
                                        <a href="#" class="k-grid-nav__item">
                                            <div class="k-grid-nav__item-icon"><i class="flaticon-business"></i></div>
                                            <div class="k-grid-nav__item-title">Orders</div>
                                            <div class="k-grid-nav__item-desc">latest orders</div>
                                        </a>
                                        <a href="#" class="k-grid-nav__item">
                                            <div class="k-grid-nav__item-icon"><i class="flaticon-line-graph"></i></div>
                                            <div class="k-grid-nav__item-title">Reports</div>
                                            <div class="k-grid-nav__item-desc">finance & accounting</div>
                                        </a>
                                        <a href="#" class="k-grid-nav__item">
                                            <div class="k-grid-nav__item-icon"><i class="flaticon-settings"></i></div>
                                            <div class="k-grid-nav__item-title">Administration</div>
                                            <div class="k-grid-nav__item-desc">settings and logs</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                                       <!--end: Quick actions -->
                            <!--begin: Language bar -->
                            <div class="k-header__topbar-item k-header__topbar-item--langs">
                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="10px -2px">
                                    <span class="k-header__topbar-icon">
                                        <img class="" src="assets/media/flags/020-flag.svg" alt="" />
                                    </span>
                                </div>
                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround">
                                    <ul class="k-nav k-margin-t-10 k-margin-b-10">
                                        <li class="k-nav__item k-nav__item--active">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><img src="assets/media/flags/020-flag.svg" alt="" /></span>
                                                <span class="k-nav__link-text">English</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><img src="assets/media/flags/016-spain.svg" alt="" /></span>
                                                <span class="k-nav__link-text">Spanish</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><img src="assets/media/flags/017-germany.svg" alt="" /></span>
                                                <span class="k-nav__link-text">German</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                             <!--end: Language bar -->
                             <!--begin: User bar -->
                            <div class="k-header__topbar-item k-header__topbar-item--user" id="alexin">
                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="10px -2px">
                                    <span class="k-header__topbar-welcome k-hidden-mobile">Hi,</span>
                                    <span class="k-header__topbar-username k-hidden-mobile">Alex</span>
                                    <img alt="Pic" src="resources/assets/media/users/300_21.jpg" />
                                </div>
                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-md">
                                    <div class="k-user-card k-margin-b-50 k-margin-b-30-tablet-and-mobile" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                        <div class="k-user-card__wrapper">
                                            <div class="k-user-card__pic">
                                                <img alt="Pic" src="resources/assets/media/users/300_21.jpg" />
                                            </div>
                                            <div class="k-user-card__details">
                                                <div class="k-user-card__name">Alex Stone</div>
                                                <div class="k-user-card__position">CTO, Loop Inc.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="k-nav k-margin-b-10">
                                        <li class="k-nav__item">
                                            <a href="viewPrimaryContractor?id=${contRegId}" id="viewContractorOtherDetails" class="k-nav__link" >
                                                <span class="k-nav__link-icon"><i class="flaticon-profile"></i></span>
                                                <span class="k-nav__link-text">My Profile</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><i class="flaticon-signs"></i></span>
                                                <span class="k-nav__link-text">Tasks</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><i class="flaticon-mail-1"></i></span>
                                                <span class="k-nav__link-text">Messages</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><i class="flaticon-settings"></i></span>
                                                <span class="k-nav__link-text">Settings</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item k-nav__item--custom k-margin-t-15">
                                            <a href="logoutContractor" class="btn btn-outline-metal btn-hover-brand btn-upper btn-font-dark btn-sm btn-bold">Sign Out</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!--end: User bar -->

                            <!--begin: Quick panel toggler -->
                            <div class="k-header__topbar-item k-header__topbar--aside-secondary-toggler" data-toggle="k-tooltip" title="Quick panel" data-placement="right">
                                <span class="k-header__topbar-icon" id="k_quick_panel_toggler_btn"><i class="flaticon-grid-menu"></i></span>
                            </div>

                            <!--end: Quick panel toggler -->
                        </div>

                        <!-- end:: Header Topbar -->
                    </div>

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">
                          <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">Contractor Details</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
                            <div class="k-content__head-toolbar">
                                <div class="k-content__head-toolbar-wrapper">

                                    <div class="dropdown dropdown-inline" data-toggle="k-tooltip" title="Contractor Profile" data-placement="top">
                                        <button type="button" id="cod" class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper" data-toggle="modal" data-target="#contractorProfileWizard" hidden="true">
                                            <i class="la la-user-plus"></i> Secondary Contractor Profile
                                        </button>
                                        <button id="changePasswordSecCont" data-toggle="modal" data-target="#createNewPassword" hidden="true">changePwd</button>
                                    </div>
                                  <a href="#" class="btn btn-sm btn-elevate btn-danger"  data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                        <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp;
                                        <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16</span>
                                        <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                           <div class="k-content__body	k-grid__item k-grid__item--fluid">
                           <!--begin::Row-->
                        <div class="row">
                            <div class="col-lg-12">
                                <!--begin::Portlet-->
                                <div class="k-portlet" style="margin-bottom:-10px;">
                                    <div class="k-portlet__body">
                                        <div class="border_boxesDiv mb-4">
                                            <div class="k-section">
                                                <h3 class="k-section__title"><span class="nav-link-icon"><i class="flaticon-box"></i></span>Secondary Contractor Profile</h3>
                                            </div>
                                           <table class="table table-striped- table-bordered table-hover table-checkable ">
                             <tbody>
                            <tr>
                                <th><span class="dwn_arrow">Name</span></th>
                                <td class="upr_text">${secondrycontractor.firstName}&nbsp;${secondrycontractor.lastName}</td>
                                <th><span class="dwn_arrow">Status</span></th>
                                <td class="upr_text" >${secondrycontractor.status}</td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Email ID</span></th>
                                <td >${secondrycontractor.emailid} 
                                    <c:if test="${secondrycontractor.emailVerifyStatus=='NotVerified'}">
                                                    <span class="verifyStatus fa fa-times-circle" style="color: red;"> <u>${secondrycontractor.emailVerifyStatus}</u></span>
                                                </c:if>
                                                <c:if test="${secondrycontractor.emailVerifyStatus!='NotVerified'}">
                                                        <span class="verifyStatus fa fa-check-circle" style="color:green;"> <u>${secondrycontractor.emailVerifyStatus}</u></span>
                                                </c:if></td>
                                <th><span class="dwn_arrow">Mobile No.</span></th>
                                <td>${secondrycontractor.mobileno} 
                                                
                                                 <c:if test="${secondrycontractor.mobileVerifyStatus=='NotVerified'}">
                                           <span class="verifyStatus fa fa-times-circle"  style="color: red;"> <u>${secondrycontractor.mobileVerifyStatus}</u></span>
                                                </c:if>
                                                <c:if test="${secondrycontractor.mobileVerifyStatus!='NotVerified'}">
                                               <span class="verifyStatus fa fa-check-circle"  style="color: green;"> <u>${secondrycontractor.mobileVerifyStatus}</u></span>
                                                </c:if></td>
                            </tr>
                            <tr>
                                   <c:if test="${secondrycontractor.designation!=null||secondrycontractor.designation!=''}">
                                <th><span class="dwn_arrow">Designation</span></th>
                                <td class="upr_text" >${secondrycontractor.designationName}</td>
                                 </c:if>
                              
                            </tr>
                            </tbody>
                    </table>
                      <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#secondaryContractorModal" ><i class="flaticon-edit"></i>Edit Details</button>
                    <button type="button" class="btn btn-brand btn-elevate" data-toggle="modal" data-target="#otpModal" id="OTP_modal" hidden="true"></button>   
                    <button class="btn btn-brand btn-elevate" data-toggle="modal" data-target="#contractorRegistrationForm" id="openRegModal" hidden="true"></button> 
                          </div>
                                           
                        <c:if test="${contractor.contractorType=='foreign'}">
                             <div class="border_boxesDiv mb-4">
                                <div class="k-section">
                                    <h3 class="k-section__title"><span class="nav-link-icon"> <i class="la la-info-circle"></i></span>  Foreign Company Details</h3>
                              </div>
                               <table class="table table-striped- table-bordered table-hover table-checkable ">
                        <tbody>
                            <tr>
                                <th><span class="dwn_arrow">Name of Organization</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignOrgName}</span></td>
                                <th><span class="dwn_arrow">Website</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignWebsite}</span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Country</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignCountryName}</span></td>
                                <th><span class="dwn_arrow">State</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignStateName}</span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">City</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignCityName}</span></td>
                                <th><span class="dwn_arrow">Pincode</span></th>
                                <td class="upr_text" >${contractorDetails.foreignPincode}</td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Address</span></th>
                                <td class="upr_text" >${contractorDetails.foreignAddress}</td> 
                                <th><span class="dwn_arrow">Contact Number</span></th>
                                <td class="upr_text" >${contractorDetails.foreignContact2}</td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Registration Number</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignRegno}</span></td>
                                <th><span class="dwn_arrow">Registration Certificate</span></th>
                                <td class="upr_text" ><span class="rs_ic"><a href="${contractorDetails.foreignRegDocUrl}" target="blank">View Document</a></span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">TIN Number</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.foreignTINNo}</span></td>
                                <th><span class="dwn_arrow">TIN Certificate</span></th>
                                <td class="upr_text" ><span class="rs_ic"><a href="${contractorDetails.foreignTINDocUrl}" target="blank">View Document</a></span></td>
                            </tr>
                        </tbody>
                    </table>
                     <button type="button" class="btn btn-primary btn-sm" onclick="editOtherDetails('editForeignDetails');" ><i class="flaticon-edit"></i>Edit</button>
                       </div>
                       </c:if>
                          <div class="border_boxesDiv mb-4">
                               <div class="k-section">
                               <h3 class="k-section__title"><span class="nav-link-icon"> <i class="la la-info-circle"></i></span> Indian Bidder/Agent Details</h3>
                               </div>
                               <table class="table table-striped- table-bordered table-hover table-checkable ">
                         <tbody>
                            <tr>
                                <th><span class="dwn_arrow">Name of Organization</span></th>
                                <td class="upr_text" ><span class="rs_ic">${Contractordetails.indianOrgName}</span></td>
                                <th><span class="dwn_arrow">Website</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.agentWebsite}</span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">State</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.agentStateName}</span></td>
                                <th><span class="dwn_arrow">City</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.agentCityName}</span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Contact Number</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.agentContact2}</span></td>
                                <th><span class="dwn_arrow">Pincode</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.agentPincode}</span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Address</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.agentAddress}</span></td> 
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">GISTN No</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.gistnNo}</span></td>
                                <th><span class="dwn_arrow">Company Aadhar Number</span></th>
                                <td><span class="rs_ic">${contractorDetails.comAadharNo}</span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Type Of Organization</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.orgTypeName}</span></td>
                                <th><span class="dwn_arrow">Other Organization</span></th>
                                <td class="upr_text" ><span class="rs_ic"></span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Registration Details(MSME,NSIC,etc)</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.contCompanyName}</span></td>
                                <th><span class="dwn_arrow">(MSME,NSIC)Document</span></th>
                                <td class="upr_text"><span class="rs_ic"><a href="${contractorDetails.msmeDocUrl}" target="blank">View Document</a></span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Contractor Class</span></th>
                                <td class="upr_text"><span class="rs_ic">${contractorDetails.contractorClassName}</span></td>
                                 <c:if test="${contractorDetails.contractorClassName!='Open'}">
                                <th><span class="dwn_arrow">Contractor Class Certificate</span></th>
                                <td class="upr_text"><span class="rs_ic"><a href="${contractorDetails.contractorClassDocUrl}" target="blank">View Document</a></span></td>
                                  </c:if>

                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Registration Number</span></th>
                                <td  class="upr_text"><span class="rs_ic">${contractorDetails.agentRegno}</span></td>
                                <th><span class="dwn_arrow">Registration Certificate</span></th>
                                <td class="upr_text"><span class="rs_ic" style="text-transform: uppercase;"><a href="${contractorDetails.agentRegDocUrl}" target="blank">View Document</a></span></td>
                            </tr>
                            <tr>
                               
                                <th><span class="dwn_arrow">Organization PAN Card</span></th>
                                <td class="upr_text" ><span class="rs_ic"><a href="${contractorDetails.agentPANDocUrl}" target="blank">View Document</a></span></td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Social Category</span></th>
                                <td class="upr_text"><span class="rs_ic" >${contractorDetails.socialCategoryName}</span></td>
                            </tr>
                </tbody>
                    </table>
                  
                         <button type="button" class="btn btn-primary btn-sm" onclick="editOtherDetails('editBidderDetails');" ><i class="flaticon-edit"></i>Edit</button>
                        
        
                                        </div>
                               <c:if test="${!empty contractorDetails.contApplication}">
                                   <div class="border_boxesDiv mb-4">
                                            <div class="k-section">
                                                <h3 class="k-section__title"><span class="nav-link-icon"> <i class="la la-info-circle"></i></span>Organization Details</h3>
                                            </div>
                           <table class="table table-striped- table-bordered table-hover table-checkable ">
                         <c:if test="${(!empty contractorDetails.contApplication)&&(contractorDetails.contOrganization=='7')}">
                        <tbody>
                              <tr>
                                <th><span class="dwn_arrow">S.No.</span></th>
                                <th><span class="dwn_arrow">Name Of Partner</span></th>
                                <th><span class="dwn_arrow">Percentage in Firm</span></th>
                                <th><span class="dwn_arrow">PAN Of Partner</span></th>
                                <th><span class="dwn_arrow">Aadhar Number</span></th>
                                <th><span class="dwn_arrow">Mobile Number</span></th>
                           </tr>
                            <c:forEach items="${contractorDetails.contApplication}" var="data" varStatus="index">
                            <tr>
                                <td><span class="rs_ic">${index.index +1}</span></td> 
                                <td><span class="rs_ic" class="upr_text" ><input type="text" id="ptnrName${index.index}" name="contApplication[${index.index}].ptnrName" style="text-transform: uppercase;" value="${data.ptnrName}" class="form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td> 
                                <td><span class="rs_ic" ><div class="input-group"><input type="text" id="ptnrPop${index.index}" name="contApplication[${index.index}].ptnrPop" value="${data.ptnrPop}" class="form-control totalPercent" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"> <div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></span></td>
                                <td><span class="rs_ic" class="upr_text"><input type="text" id="ptnrPANNo${index.index}" name="contApplication[${index.index}].ptnrPANNo" style="text-transform: uppercase;" value="${data.ptnrPANNo}"  class="form-control " data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                                <td><span class="rs_ic"><input type="text" id="ptnrAadharNo${index.index}" name="contApplication[${index.index}].ptnrAadharNo"value="${data.ptnrAadharNo}" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                                <td><span class="rs_ic"><input type="text" id="ptnrMobNo${index.index}" name="contApplication[${index.index}].ptnrMobNo" value="${data.ptnrMobNo}" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                             </tr>
                              </c:forEach>
                         </tbody>
                            </c:if>
                          <c:if test="${(!empty contractorDetails.contApplication) && ((contractorDetails.contOrganization=='4')||(contractorDetails.contOrganization=='5')||(contractorDetails.contOrganization=='6'))}">
                        <tbody>
                           <tr>
                                <th><span class="dwn_arrow">S.No.</span></th>
                                <th><span class="dwn_arrow">Name of Director</span></th>
                                <th><span class="dwn_arrow">DIN Number.</span></th>
                                <th><span class="dwn_arrow">PAN Of Director.</span></th>
                                <th><span class="dwn_arrow">Aadhar Number.</span></th>
                                <th><span class="dwn_arrow">Mobile Number</span></th>
                             </tr>
                            <c:forEach items="${contractorDetails.contApplication}" var="data" varStatus="index">
                            <tr> 
                               <td><span class="rs_ic">${index.index +1}</span></td> 
                                <td><span class="rs_ic" class="upr_text" ><input type="text" id="shDirName${index.index}" name="contApplication[${index.index}].shDirName" style="text-transform: uppercase;" value="${data.shDirName}" class="form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                                <td><span class="rs_ic" ><input type="text" id="dinNo${index.index}" name="contApplication[${index.index}].dinNo"  value="${data.dinNo}" class="form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                                <td><span class="rs_ic" class="upr_text" ><input type="text" id="shPANNo${index.index}" name="contApplication[${index.index}].shPANNo" style="text-transform: uppercase;" value="${data.shPANNo}" class="form-control"  data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                                <td><span class="rs_ic"><input type="text" id="shAadharNo${index.index}" name="contApplication[${index.index}].shAadharNo" value="${data.shAadharNo}" class="form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                                <td><span class="rs_ic"><input type="text" id="shMobNo${index.index}" name="contApplication[${index.index}].shMobNo" value="${data.shMobNo}" class="form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" readonly="true"></span></td>
                              </tr>
                            </c:forEach>
                          </tbody>
                           </c:if>
                    </table>
                    
                         <button type="button" class="btn btn-primary btn-sm" onclick="editOtherDetails('editOrganizationDetails');" ><i class="flaticon-edit"></i>Edit</button>
                         
                 
				 </div>
                                    </c:if>
                               
                                 </div>
              <!--end::Portlet-->
                            </div>
                            <!--begin::Portlet-->
                     </div>
                     <!--end::Row-->
                    </div>
                    <!-- end:: Content Body -->
                </div>
                    </div>
                     <!-- end:: Content -->
                     <!-- begin:: Footer -->
                    <div class="k-footer	k-grid__item k-grid k-grid--desktop k-grid--ver-desktop">
                        <div class="k-footer__copyright">
                            2018&nbsp;&copy;&nbsp;<a href="#" class="k-link">OSMO IT SOLUTION PVT. LTD.</a>
                        </div>
                        <div class="k-footer__menu">
                            <a href="#" target="_blank" class="k-footer__menu-link k-link">About</a>
                            <a href="#" target="_blank" class="k-footer__menu-link k-link">Team</a>
                            <a href="#" target="_blank" class="k-footer__menu-link k-link">Contact</a>
                        </div>
                    </div>
                 <!-- end:: Footer -->
                </div>
          <div class="k-aside-secondary" id="k_aside_secondary">
                    <div class="k-aside-secondary__toggle" id="k_aside_secondary_toggler"></div>
                    <button class="k-aside-secondary__mobile-nav-toggler" id="k_aside_secondary_mobile_nav_toggler" data-toggle="k-tooltip" title="Aside Secondary" data-placement="left"></button>
                    <div class="k-aside-secondary__content">
                        <button class="btn btn-sm btn-circle btn-icon k-aside-secondary__close" id="k_aside_secondary_close" data-toggle="tooltip" title="Layout Builder" data-placement="Events">
                            <i class="la la-close"></i>
                        </button>
                        <div class="tab-content">
                            <div class="tab-pane fade" id="k_aside_secondary_tab_1" role="tabpanel">
                                <div class="k-aside-secondary__content-head">
                                    Create Event
                                </div>
                                <div class="k-aside-secondary__content-body k-scroll">
                                    <form class="k-form">
                                        <div class="k-section k-section--first">
                                            <div class="form-group">
                                                <label>Name:</label>
                                                <input type="email" class="form-control" placeholder="Enter full name">
                                                <span class="form-text text-muted">Please enter your event name</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Location:</label>
                                                <input type="email" class="form-control" placeholder="Enter email">
                                                <span class="form-text text-muted">Please enter event location</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Budget</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon2">$</span></div>
                                                    <input type="text" class="form-control" placeholder="321,999.99">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Channels:</label>
                                                <div class="k-checkbox-list">
                                                    <label class="k-checkbox">
                                                        <input type="checkbox"> Email
                                                        <span></span>
                                                    </label>
                                                    <label class="k-checkbox">
                                                        <input type="checkbox"> SMS
                                                        <span></span>
                                                    </label>
                                                    <label class="k-checkbox">
                                                        <input type="checkbox"> Phone
                                                        <span></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="k-form__actions">
                                        <button type="reset" class="btn btn-primary">Submit</button>
                                        <button type="reset" class="btn btn-secondary">Cancel</button>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="k_aside_secondary_tab_2" role="tabpanel">
                                <div class="k-aside-secondary__content-head">
                                    New Report
                                </div>
                                <div class="k-aside-secondary__content-body k-scroll">
                                    <form class="k-form">
                                        <div class="k-section k-section--first">
                                            <div class="form-group">
                                                <label>Name:</label>
                                                <input type="email" class="form-control" placeholder="Enter full name">
                                                <span class="form-text text-muted">Please enter report name</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleSelect">Category:</label>
                                                <select class="form-control" id="exampleSelect">
                                                    <option>Finance</option>
                                                    <option>Sales</option>
                                                    <option>System</option>
                                                    <option>Customers</option>
                                                    <option>Orders</option>
                                                </select>
                                                <span class="form-text text-muted">Please select report category</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Revenue:</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">#</span></div>
                                                    <input type="text" class="form-control" placeholder="Units" aria-describedby="basic-addon1">
                                                    <div class="input-group-append"><span class="input-group-text">$</span></div>
                                                </div>
                                                <span class="form-text text-muted">Please enter treshhold name</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Filter:</label>
                                                <div class="k-checkbox-list">
                                                    <label class="k-checkbox">
                                                        <input type="checkbox"> Pending transations
                                                        <span></span>
                                                    </label>
                                                    <label class="k-checkbox">
                                                        <input type="checkbox"> Include margins
                                                        <span></span>
                                                    </label>
                                                    <label class="k-checkbox">
                                                        <input type="checkbox"> Include balance
                                                        <span></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="k-form__actions">
                                        <button type="reset" class="btn btn-primary">Submit</button>
                                        <button type="reset" class="btn btn-secondary">Cancel</button>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="k_aside_secondary_tab_3" role="tabpanel">
                                <div class="k-aside-secondary__content-head">
                                    Notifications
                                </div>
                                <div class="k-aside-secondary__content-body k-scroll">
                                    <div class="k-notification">
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-time-2"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New order has been received
                                                </div>
                                                <div class="k-notification__item-time">
                                                    2 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-upload-1"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New customer is registered
                                                </div>
                                                <div class="k-notification__item-time">
                                                    3 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-interface-8"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    Application has been approved
                                                </div>
                                                <div class="k-notification__item-time">
                                                    3 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-file"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New file has been uploaded
                                                </div>
                                                <div class="k-notification__item-time">
                                                    5 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-user"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New user feedback received
                                                </div>
                                                <div class="k-notification__item-time">
                                                    8 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    System reboot has been successfully completed
                                                </div>
                                                <div class="k-notification__item-time">
                                                    12 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-light"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New order has been placed
                                                </div>
                                                <div class="k-notification__item-time">
                                                    15 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item k-notification__item--read">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-interface-2"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    Company meeting canceled
                                                </div>
                                                <div class="k-notification__item-time">
                                                    19 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-diagram"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New report has been received
                                                </div>
                                                <div class="k-notification__item-time">
                                                    23 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-pie-chart"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    Finance report has been generated
                                                </div>
                                                <div class="k-notification__item-time">
                                                    25 hrs ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-speech-bubble-1"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New customer comment recieved
                                                </div>
                                                <div class="k-notification__item-time">
                                                    2 days ago
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="k-notification__item">
                                            <div class="k-notification__item-icon">
                                                <i class="flaticon-warning-2"></i>
                                            </div>
                                            <div class="k-notification__item-details">
                                                <div class="k-notification__item-title">
                                                    New customer is registered
                                                </div>
                                                <div class="k-notification__item-time">
                                                    3 days ago
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="k-aside-secondary__nav k-grid k-grid--hor">
                        <div class="k-grid__item k-grid__item--fluid k-aside-secondary__nav-body">
                            <ul class="k-aside-secondary__nav-toolbar nav nav-tabs" role="tablist" id="k_aside_secondary_nav">
                                <li class="k-aside-secondary__nav-toolbar-item nav-item" data-toggle="k-tooltip" title="Events" data-placement="left">
                                    <a class="k-aside-secondary__nav-toolbar-icon nav-link" data-toggle="tab" href="#k_aside_secondary_tab_1" role="tab">
                                        <i class="flaticon-box-1 k-font-brand"></i>
                                        <span class="k-badge k-badge--dot k-badge--md k-badge--danger"></span>
                                    </a>
                                </li>
                                <li class="k-aside-secondary__nav-toolbar-item nav-item" data-toggle="k-tooltip" title="Reports" data-placement="left">
                                    <a class="k-aside-secondary__nav-toolbar-icon nav-link" data-toggle="tab" href="#k_aside_secondary_tab_2" role="tab">
                                        <i class="flaticon-rotate k-font-danger"></i>
                                    </a>
                                </li>
                                <li class="k-aside-secondary__nav-toolbar-item nav-item" data-toggle="k-tooltip" title="Notifications" data-placement="left">
                                    <a class="k-aside-secondary__nav-toolbar-icon nav-link" data-toggle="tab" href="#k_aside_secondary_tab_3" role="tab">
                                        <i class="flaticon-box k-font-success"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="k-grid__item k-aside-secondary__nav-foot">
                            <ul class="k-aside-secondary__nav-toolbar">
                                <li class="k-aside-secondary__nav-toolbar-item" data-toggle="k-tooltip" title="Quick menu" data-placement="left">
                                    <a class="k-aside-secondary__nav-toolbar-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-exclamation-circle k-font-warning"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-left">
                                        <ul class="k-nav">
                                            <li class="k-nav__section k-nav__section--first">
                                                <span class="k-nav__section-text">Quick Links</span>
                                            </li>
                                            <li class="k-nav__item">
                                                <a href="https://themes.getbootstrap.com/product/keen-the-ultimate-bootstrap-admin-theme/" class="k-nav__link">
                                                    <i class="k-nav__link-icon fa fa-donate"></i>
                                                    <span class="k-nav__link-text">Purchase Keen</span>
                                                </a>
                                            </li>
                                            <li class="k-nav__item">
                                                <a href="https://keenthemes.com/keen/?page=docs" class="k-nav__link">
                                                    <i class="k-nav__link-icon fa fa-book"></i>
                                                    <span class="k-nav__link-text">Documentation</span>
                                                </a>
                                            </li>
                                            <li class="k-nav__item">
                                                <a href="builder.html" class="k-nav__link">
                                                    <i class="k-nav__link-icon fa fa-charging-station"></i>
                                                    <span class="k-nav__link-text">Layout Builder</span>
                                                </a>
                                            </li>
                                            <li class="k-nav__item">
                                                <a href="https://keenthemes.com/support" class="k-nav__link" id="export_excel">
                                                    <i class="k-nav__link-icon fa fa-headset"></i>
                                                    <span class="k-nav__link-text">Theme Support</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- end:: Aside Secondary -->
            </div>
        </div>

        <!-- end:: Page -->

        <!-- begin::Scrolltop -->
        <div id="k_scrolltop" class="k-scrolltop">
            <i class="la la-arrow-up"></i>
        </div>
 <!---End-Modal-Tab-Upload-Documents---> 

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
        <script src=""<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script> 
        <!--end::Page Vendors -->
        <!--begin::Page Scripts -->
        <!-- <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> -->
        <!--end::Page Scripts -->
        <!--end::Global Theme Bundle -->
        <script src="<c:url value="/resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script> 
        <script src="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.full.js"/>" type="text/javascript"></script>
	 <script>
            $('#filter-date').datetimepicker({
timepicker:false,
format:'d/m/Y',
formatDate:'Y/m/d'
});
        </script>
        <script>
            $(document).ready(function () {
               var openModal = '<c:out value="${openModal}"></c:out>';   
               console.log("openModal "+openModal);
               if(openModal == 'registrationModal'){
                $('#openRegModal').click();   
                 }
               });
            </script>
            <script>
    
        
             function editRegDetails(){
             var regId='<c:out value="${contractor.id}"></c:out>';
                   swal({
               title: 'Are you sure?',
               text: 'You want to Edit Details',
               type: 'question',
               showCancelButton: true,
               confirmButtonText: 'Yes',
               cancelButtonText: 'No',
               
               }).then((result) => {
              if (result.value) {
           console.log("id=" +this.id);
          $.ajax({
                url: "verifyMob",
             success: function (res) {
                alert(res);
                $('#generatedotp').val(res);
                $('#otpFor').val("editRegDetails");
                $('#OTP_modal').click();    
                 }
            });
    
              } else if (
// Read more about handling dismissals
            result.dismiss === swal.DismissReason.cancel
         ) {
           swal(
             'Cancelled',
             'You Dont want to Edit ',
             'error'
             )
        
           }
         }) 
        }
  ///////////////////////////////
         function editOtherDetails(stepValue){
             console.log("stepValue");
             var regId='<c:out value="${contractor.id}"></c:out>';
                   swal({
               title: 'Are you sure?',
               text: 'You want to Edit Details',
               type: 'question',
               showCancelButton: true,
               confirmButtonText: 'Yes',
               cancelButtonText: 'No',
               
               }).then((result) => {
              if (result.value) {
           console.log("id=" +this.id);
          $.ajax({
                url: "verifyMob",
             success: function (res) {
                alert(res);
                $('#generatedotp').val(res);
                $('#otpFor').val(stepValue);
                $('#OTP_modal').click();    
                 }
            });
    
              } else if (
// Read more about handling dismissals
            result.dismiss === swal.DismissReason.cancel
         ) {
           swal(
             'Cancelled',
             'You Dont want to Edit ',
             'error'
             )
        
           }
         }) 
        }
         $('.checkOtp').on('input', function (e) {
                $("#validateOTP").html("");
                this.value = this.value.replace(/[^0-9\.]/g,"");
                if(this.value === ''){
                $("#validateOTP").html("Please Enter Valid OTP");
                    }else{
                       $("#validateOTP").html("");
                    }
                 });
        
        
        
        
          
            </script>
               <script>
    $(document).ready(function () {
    //for privilege Checkbox auto checked on update
          var prv=$("#contprivilege").val();
//              alert("privilege "+prv);
        
          var array = new Array();
             array = prv.split(',');
           $.each(array, function(value, key) {
//              alert("value "+value+" key "+key);
              $("#contractor_privilege"+key).prop("checked",true);
    });

        $("#email").change(function () {
           
            var email = $("#email").val();
            
           
            $.ajax({
                url: "checkUserEmail",
                data: {email: email},
                success: function (res) {
              
                    if (res !== "valid Email") {
                 
                        $("#errorEmail").css('color', 'red');
                        $("#errorEmail").html("Email address is already exist");
                        $("#email").append(res);
                    } else{
                          $("#errorEmail").css('color', 'red');
                        $("#errorEmail").html("");
                        $("#email").append(res);
                    }
                }
            });
        });

        $("#mobile_no").change(function () {
            
            var mobile_no = $("#mobile_no").val();
          
            $.ajax({
                url: "checkUserContacts",
                data: {mobile_no: mobile_no},
                success: function (res) {
                
                    if (res !== "valid mobile_no") {
                  
                        $("#errorMobile_no").css('color', 'red');
                        $("#errorMobile_no").html("Mobile No. is already exist");
                        $("#mobile_no").append(res);
                    }else{
                         $("#errorMobile_no").css('color', 'red');
                        $("#errorMobile_no").html("");
                        $("#mobile_no").append(res);
                    }

                }
            });
        });
       
        var message = '<c:out value="${result}"></c:out>';
                if (message !== "") {

                    swal(
                            '',
                            message,
                            'success'
                        );
                }
       
       
       
    });
</script>
  <script>
         $(document).ready(function () {
            

                var message = '<c:out value="${msg}"></c:out>';
//                alert(message);
                if (message !== "") {
                    swal(
                            '',
                            message,
                            'success'
                            );
                }
                var message = '<c:out value="${msg2}"></c:out>';
                if (message !== "") {

                    swal(
                            '',
                            message,
                            'error'
                        );
                }
               
             

            });
    </script>
    <script>
        function changePassword(){
            $("#changePasswordSecCont").click();
        }
        </script>
     <jsp:include page="../DepartmentUser/CreatePassword.jsp" ></jsp:include>   
  
 



        <%---function  to called the validation of second step---%>

    
    
 
    </body>

    <!-- end::Body -->

</html>
