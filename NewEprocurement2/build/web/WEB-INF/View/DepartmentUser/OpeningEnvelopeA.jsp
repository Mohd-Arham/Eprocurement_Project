<%-- 
    Document   : TenderOpening
    Created on : Nov 29, 2018, 2:29:01 PM
    Author     : vaishali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Department User | Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon lotus procure -->
<!--    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" /> -->
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
            });</script>
        <script>
            $(document).ready(function () {
                $('.tenderData').DataTable();
            });

        </script>

        <!--end::Web font -->

        <!--begin:: Global Mandatory Vendors -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
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
    <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>

        <style>
            .checkB_center .k-checkbox > span{
                left: 40px;
            }
            .widthUploadBt{
                margin:0 auto;
                width:40%;
            }
            .input_upload label:after{
                display:none;
            }

            textarea.wrd_conversion {
                height: 40px;
            }
            /*****NAV-TABS-CSS*****/

            .tender_view_tab .k-portlet__body {
                padding-top: 6px;
            }

            .nav-tabs.nav-tabs-line .nav-link {}

            .nav-tabs.nav-tabs-line {}

            .nav-tabs.nav-tabs-line.nav-tabs-line-danger.nav.nav-tabs .nav-link:hover,
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger.nav.nav-tabs .nav-link.active,
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger a.nav-link:hover,
            .nav-tabs.nav-tabs-line.nav-tabs-line-danger a.nav-link.active {}

            .tender_view_tab .k-portlet__head {
                min-height: inherit;
            }

            .tender_view_tab.k-portlet--tabs .nav-tabs.nav-tabs-line {}

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

            .payment_mode {
                position: relative;
                top: 9px;
                left: 11px;
                font-weight: normal;
            }

            .tender_search {
                padding: 0;
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
                margin: 0 3.5rem;
                cursor: no-drop;
            }

            .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 90%;
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

    </head>

    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">



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
                <button class="k-aside-close " id="k_aside_close_btn"><i class="la la-close"></i></button>
                <div class="k-aside  k-aside--fixed k-aside--skin-default 	k-grid__item k-grid k-grid--desktop k-grid--hor-desktop" id="k_aside">

                    <!-- begin:: Aside -->
                    <div class="k-aside__brand	k-grid__item  k-aside__brand--skin-default " id="k_aside_brand">
                        <div class="k-aside__brand-logo">
                            <a href="index.html">
                                <img alt="Logo" src="assets/demo/media/logo-light.png" style="max-width: 80%;" />
                            </a>
                        </div>
                        <div class="k-aside__brand-tools">
                            <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                        </div>
                    </div>

                    <!-- end:: Aside -->

                    <!-- begin:: Aside Menu -->
                    <jsp:include page="Tiles/AsideNav.jsp"/>
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
                   <jsp:include page="Tiles/Header.jsp"/>
                        <!-- end:: Header Topbar -->
                    </div>

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">Tender</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
<!--                            <div class="k-content__head-toolbar">
                                <div class="k-content__head-toolbar-wrapper"> 
                                    <a href="#" class="btn btn-sm btn-elevate btn-danger" data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                        <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp;
                                        <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16</span>
                                        <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                    </a>
                                </div>
                            </div>-->
                        </div>

                        <!-- end:: Content Head -->


                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->
                            <div class="row"> 
                                <div class="col-lg-12"> 
                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid">  
                                        <div class="k-portlet__body bidder_template"> 
                                            <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon">
                                                        <i class="la la-info-circle"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">
                                                        Open Envelope A 
                                                    </h3> 
                                                </div> 
                                            </div>
                                            <div class="bider_table_dt">


                                                <table class="table table-bordered table-hover table-checkable"> 
                                                    <tbody>
                                                        <tr><th>Tender No.</th>
                                                            <td>${tender.tenderNumber}</td>
                                                            <th>NIT No.</th>
                                                            <td>${tender.nitNumber}</td>

                                                        </tr>

                                                        <tr>
                                                            <th>Department </th>
                                                            <td colspan="6">${tender.deptName}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Name of Work</th>
                                                            <td colspan="6">${tender.nameOfWork}</td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <!--end::Portlet-->
                                </div>

                            </div>




                            <!--end::Row-->
                        </div>

                        <div class="k-content__body k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->
                            <div class="row"> 
                                <!--begin::Portlet-->
                                <div class="col-lg-12">
                                    <div class="k-portlet"> 
                                        <div class="k-portlet__body">
                                            <div class="sirfektable">
                                                <div class="simple_table"> 
                                                    <!--begin: Datatable -->
                                                    <table class="table table-striped- table-bordered  table-hover table-checkable tenderData">
                                                        <thead>
                                                            <tr>
                                                                <th>Contractor Name</th>
                                                                <th> Name</th>
                                                                <th>Action</th>
                                                                <th>Rejection Remark</th>
                                                                <th>Bidder Document</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody >
                                                            <c:forEach items="${ContractorList}" var="ContractorList" varStatus="i">
                                                                <tr>

                                                                    <td>${ContractorList.fullname}</td> 
                                                                    <td>${ContractorList.companyName}</td> 
<!--                                                                    <td>OSMO</td> -->
                                                                    <td>
                                                                        <c:if test="${ContractorList.openingResult!='Shortlisted' && ContractorList.openingResult!='Rejected'}">
                                                                            <span class="openEA_act" >Pending</span>
                                                                        </c:if>   
                                                                        <c:if test="${ContractorList.openingResult=='Shortlisted'}">
                                                                            <span style="color: green">${ContractorList.openingResult}<i class="far fa-check-circle"></i></span> 
                                                                            </c:if> 
                                                                            <c:if test="${ContractorList.openingResult=='Rejected'}">
                                                                            <span style="color: red">${ContractorList.openingResult}</span> 
                                                                        </c:if> 
                                                                    </td>
                                                                    <td></td>
                                                                    <td> 
                                                                        <c:if test="${viewBidderDocument==true}">
                                                                            <a href="#" id="${ContractorList.id}" onclick="envelopeAdocument(this.id);"  data-toggle="modal" data-target="#modelEnvelope" >View document</a>
                                                                        </c:if>
                                                                    </td> 
                                                                </tr> 
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>



                                                <c:if test="${openEAflag==false && alredyVerifyByUser==false}">

                                                    <center><button type="button" class="btn btn-success" id="verifybtn" onclick="verifyEnvelopeA();">Verify Envelope A</button></center>

                                                </c:if> 
                                                <c:if  test="${EA_Opend!='EA_Opend'}"  >
                                                    <center><span id="verifyMsg" style="color: red;"></span></center>  
                                                </c:if>
                                                <c:if test="${alredyVerifyByUser==true &&  openEAflag==true && EA_Opend!='EA_Opend'}">
                                                    <center><span id="verifyMsg" style="color: red;">Envelope A is verified</span></center>
                                                    </c:if>

                                                <c:if test="${alredyVerifyByUser==false && openEAflag==true}">
                                                    <center><button type="button" class="btn btn-success" onclick="openEA();" id="openEA_btn">Open Envelope A</button></center>

                                                </c:if>
                                                <c:if test="${alredyVerifyByUser==true &&  openEAflag==true && EA_Opend=='EA_Opend'}">

                                                    <center><span style="color: red;"> Envelope A is Opened</span></center>

                                                </c:if>
                                                    <center> <a  class="btn btn-success" href="openEnvelopeB" id="continuetoEB" style="display: none">Continue To Envelope B</a></center>

                                              
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
                   <%-- <jsp:include page="Tiles/Footer.jsp"/> --%>

                    <!-- end:: Footer -->
                </div>

           <!-- begin:: Aside Secondary -->
        <%--    <jsp:include page="Tiles/AsideNavSecondary.jsp"/> --%>
            <!-- end:: Aside Secondary -->
<!-- begin::Global Config -->
		<!-- begin::Quick Panel -->
          <%--        <jsp:include page="Tiles/QuickPanel.jsp"/>--%>
		<!-- end::Quick Panel -->

            </div>
        </div>

        <!-- end:: Page -->

        <!-- begin::Scrolltop -->
        <div id="k_scrolltop" class="k-scrolltop">
            <i class="la la-arrow-up"></i>
        </div>

        <!-- end::Scrolltop -->
        <!-- MODAL_FORM_START  -->
<!--        <div class="modal fade mdl-bg mdal-lg" id="tenderOpening" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content"> 
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="assets/demo/media/logo-dark.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Lotus Procure</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body opening_tender">
                        <div class="k-portlet__body bidder_template">
                            <div class="bider_table_dt ">
                                <table class="table table-bordered table-hover table-checkable">
                                    <tbody>
                                        <tr class="group tbl_row_bg">
                                            <th colspan="10" class="clearfix tbl_td_bg text-center"><span class="tndr_cntr modal_heading"><i class="flaticon-information"></i> Tender Information</span></th>
                                        </tr>
                                        <tr>
                                            <th>Tender No.</th>
                                            <td>61715-075</td>
                                            <th>EMD (In fig.)</th>
                                            <td><span class="rs_ic"><i class="la la-rupee"></i>100000</span></td> 
                                        </tr>
                                        <tr>
                                            <th>Bid Withdraw</th>
                                            <td><span class="text-success">Allowed</span>
                                                <span class="text-danger">Not Allowed</span>
                                            </td> 
                                            <th>Re-Bid</th>
                                            <td><span class="text-success">Allowed</span>
                                                <span class="text-danger">Not Allowed</span>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <ul class="nav nav-pills nav-tabs-btn nav-pills-btn-secondary span_txt">
                                <li class="nav-item btn-secondary">
                                    <a href="openEnvelopeA" class="btn btn-sm btn-elevate btn-success radius_0 btn_width"> 
                                        <span class="k-opacity-10">Click Here to Open</span> 
                                    </a>
                                    <a class="nav-link" href="#">
                                        <span class="nav-link-icon"><i class="flaticon-envelope"></i></span>
                                        <span class="nav-link-title">Envelope A</span>
                                    </a>
                                </li>
                                <li class="nav-item btn-secondary">
                                    <a href="#" class="btn btn-sm btn-elevate btn-warning radius_0 btn_width"> 
                                        <span class="k-font-bold">2 Days</span>&nbsp;
                                        <span class="k-font-bold">&amp;</span>&nbsp;
                                        <span class="k-font-bold">05:10:20</span>&nbsp;
                                        <span class="k-font-bold">PM</span>&nbsp;
                                        <span class="k-opacity-10">To Go</span>
                                        <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                    </a>
                                    <a class="nav-link" href="#">
                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope B</span>
                                    </a>
                                </li>
                                <li class="nav-item btn-secondary">
                                    <a href="#" class="btn btn-sm btn-elevate btn-warning radius_0 btn_width"> 
                                        <span class="k-font-bold">2 Days</span>&nbsp;
                                        <span class="k-font-bold">&amp;</span>&nbsp;
                                        <span class="k-font-bold">05:10:20</span>&nbsp;
                                        <span class="k-font-bold">PM</span>&nbsp;
                                        <span class="k-opacity-10">To Go</span>
                                        <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                    </a>
                                    <a class="nav-link" href="#">
                                        <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                        <span class="nav-link-title">Envelope C</span>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav nav-pills nav-tabs-btn nav-pills-btn-secondary open_min_officer">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span class="nav-link-title">Minimum Opening Officer <span class="count_no">&nbsp;<b>4</b></span></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span class="nav-link-title">Minimum Opening Officer <span class="count_no">&nbsp;<b>4</b></span></span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span class="nav-link-title">Minimum Opening Officer <span class="count_no">&nbsp;<b>4</b></span></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content_opening">
                                <div class="envelope_abc">
                                    <div class="nav nav-pills nav-tabs-btn officer_name pb-0">
                                        <div class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title check_officer"><span class="sr_no">1.</span>Officer A</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title not_check"><span class="sr_no">2.</span>Officer A</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title check_officer"><span class="sr_no">3.</span>Officer A</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title not_check"><span class="sr_no">4.</span>Officer A</span>
                                            </a>
                                        </div>
                                        <div class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title not_check"><span class="sr_no">1.</span>Officer B</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title check_officer"><span class="sr_no">2.</span>Officer B</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title not_check"><span class="sr_no">3.</span>Officer B</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title check_officer"><span class="sr_no">4.</span>Officer B</span>
                                            </a>
                                        </div>
                                        <div class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title check_officer"><span class="sr_no">1.</span>Officer C</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title not_check"><span class="sr_no">2.</span>Officer C</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title check_officer"><span class="sr_no">3.</span>Officer C</span>
                                            </a>
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-title not_check"><span class="sr_no">4.</span>Officer C</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="modal-footer mdl_footer_pd">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>-->

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
            };</script>

        <!-- end::Global Config -->


        <!--begin:: Global Mandatory Vendors -->
        <script src="<c:url value="resources/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/js/jquery.min.js"/>" type="text/javascript"></script>


        <!--end:: Global Mandatory Vendors -->

        <!--begin:: Global Optional Vendors -->
        <script src="<c:url value="resources/vendors/jquery-form/dist/jquery.form.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/block-ui/jquery.blockUI.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/theme/framework/vendors/bootstrap-datepicker/init.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/theme/framework/vendors/bootstrap-timepicker/init.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-maxlength/src/bootstrap-maxlength.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-select/dist/js/bootstrap-select.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/typeahead.js/dist/typeahead.bundle.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/handlebars/dist/handlebars.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/inputmask/dist/jquery.inputmask.bundle.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/inputmask/dist/inputmask/inputmask.date.extensions.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/inputmask/dist/inputmask/inputmask.numeric.extensions.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/inputmask/dist/inputmask/inputmask.phone.extensions.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/nouislider/distribute/nouislider.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/owl.carousel/dist/owl.carousel.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/autosize/dist/autosize.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/clipboard/dist/clipboard.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/dropzone/dist/dropzone.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/summernote/dist/summernote.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/markdown/lib/markdown.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/bootstrap-markdown/js/bootstrap-markdown.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/theme/framework/vendors/bootstrap-markdown/init.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/jquery-validation/dist/jquery.validate.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/jquery-validation/dist/additional-methods.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/theme/framework/vendors/jquery-validation/init.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/toastr/build/toastr.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/raphael/raphael.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/morris.js/morris.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/chartist/dist/chartist.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/chart.js/dist/Chart.bundle.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/vendors/jquery-idletimer/idle-timer.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/waypoints/lib/jquery.waypoints.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/counterup/jquery.counterup.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/es6-promise-polyfill/promise.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/sweetalert2/dist/sweetalert2.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/vendors/theme/framework/vendors/sweetalert2/init.js"/>" type="text/javascript"></script>

        <!--end:: Global Optional Vendors -->

        <!--begin::Global Theme Bundle -->
        <script src="<c:url value="resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

        <!--end::Global Theme Bundle -->

        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
        <!--begin::Global Theme Bundle -->
        <script src="<c:url value="resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

        <!--end::Global Theme Bundle -->

        <!--begin::Page Vendors -->
        <script src="<c:url value="resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/bootstrap-select.js"/>" type="text/javascript"></script>

        <!--end::Page Vendors -->

        <script src="<c:url value="resources/assets/demo/custom/components/base/popovers.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/app/scripts/custom/dashboard.js"/>" type="text/javascript"></script>

        <!--begin::Global App Bundle -->
        <script src="<c:url value="resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/dropzone.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/jquery.repeater.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/assets/demo/repeater.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/assets/demo/scripts.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/summernote.js"/>" type="text/javascript"></script>
        <!--begin::Page Vendors -->
        <script src="<c:url value="resources/assets/vendors/custom/datatables/datatables.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script>
        <!--end::Page Vendors -->
        <!--begin::Page Scripts -->
        <script src="<c:url value="resources/assets/demo/custom/components/datatables/advanced/row-grouping.js"/>" type="text/javascript"></script> 
        <!--end::Page Scripts -->
        <!--end::Global Theme Bundle -->
        <script src="<c:url value="resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                $(".btn_next").click(function (e) {
                    $('.btn_next').prev("button").css("display", "inline-block");
                    var li_first = $('.nav-tabs-btn');
                    console.log(li_first);
                    var $active = $('.nav-tabs-btn .nav-item a.active');
                    $($active).addClass("sve_class_cl");
                    $($active).find('.nav-link-title').hide();
                    $($active).find('.fa').show();
                    nextTab($active);
                });
                $(".btn_prev").click(function (e) {
                    var $active = $('.nav-tabs-btn .nav-item a.active.show');
                    var current_li = $('.nav-tabs-btn .nav-item a.active.show').closest('li').attr('id');
                    var first_li = $('.nav-tabs-btn').find('li:nth-child(2)').attr('id');
                    if (current_li && (current_li === first_li)) {
                        console.log("prev button vapas hatana hai");
                        $('.btn_next').prev("button").css("display", "none");
                    }
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
            $(document).ready(function () {

//                alert("continue to EB ");

                $("#save_next_btn").click(function (e) {
                    var $active = $('.nav-tabs-btn .nav-item a.active');
                    $($active).addClass("sve_class_cl");
                    $($active).find('.nav-link-title').hide();
                    $($active).find('.fa').show();
                    nextTab($active);
                });
                $("#previous").click(function (e) {
                    var $active = $('.nav-tabs-btn .nav-item a.active.show');
                    prevTab($active);
                });
            });
            function nextTab(elem) {
                var li = $(elem).closest("li");
                $(elem).removeClass("sve_class_already");
                $(li).next('li').find('a').click();
            }

            function prevTab(elem) {
                var li = $(elem).closest("li");
                $(li).find('a').removeClass('active show');
                $(li).find('a').addClass('sve_class_already');
                $(li).prev('li').find('a').click();
                $(li).prev('li').find('a').removeClass('sve_class_cl');
                $(li).prev('li').find('a').addClass('sve_class_already');
                $(li).prev('li').find('a').find('.nav-link-title').show();
                $(li).prev('li').find('a').find('.fa').hide();
            }


            function envelopeAdocument(id) {

                $.ajax({
                    url: "envelopeAdataList?id=" + id,
                    success: function (res) {
//                        alert("response " + res);
                        $("#envAdata").html("");
                        $("#contDetailsDiv").html("");
                        $.each(JSON.parse(res), function (key, value) {
//                            alert("key  " + key + "  value " + value);
                            if (key == "0") {
                                var id = value["id"];
//                                alert("cont id  " + id)
                                $("#shortlistbtn").val(id);
                                $("#rejectbtn").val(id);
                                $("#revertbtn").val(id);
                                $("#verifybtn").val(id);
                                var data = '<tr>\n\<td>' + value["fullname"] + '</td >\n\
                                    <td>' + value["companyName"] + '</td>\n\<td>' + value["mobileno"] + '</td >\n\<td>' + value["mobileno"] + '</td >\n\</tr>';

                                $("#contDetailsDiv").append(data);
//                                alert(value.envelopeOpeningStatus);
//                                if (value.envelopeOpeningStatus == false) {
//                                    $("#rejectedbtn").hide();
//                                    $("#shortlistbtn").hide();
//                                    $("#verifybtn").show();
//                                } else if (value.envelopeOpeningStatus == true) {
//                                    $("#rejectedbtn").show();
//                                    $("#shortlistbtn").show();
//                                    $("#verifybtn").hide();
//
//                                }
                            } else if (key == "1") {
                                console.log("Status " + value.envelopeOpeningStatus);
                                $.each(JSON.parse(JSON.stringify(value)), function (key1, value1) {
                                    if (value1["shortListed_Status"] == 'Rejected') {
                                        $("#rejectedbtn").hide();
                                        $("#shortlistbtn").hide();
                                        $("#revertedbtn").show();
                                    } else if (value1["shortListed_Status"] == 'Shortlisted') {
                                        $("#shortlistbtn").hide();
                                        $("#rejectedbtn").hide();
                                        $("#revertedbtn").show();
                                    } else if (value1["shortListed_Status"] != 'Shortlisted' && value1["shortListed_Status"] != 'Rejected') {
                                        $("#rejectedbtn").show();
                                        $("#shortlistbtn").show();
                                        $("#revertedbtn").hide();
                                    }
                                    if (value1["fieldType"] == '3') {
                                        var html1 = '<tr>\n\<td>' + value1["fieldLabel"] + '</td >\n\<td><a href=' + value1["filePath"] + ' target="_blank">' + value1["fileName"] + '</a></td ></tr>';
                                        $("#envAdata").append(html1);
                                    } else {
                                        var html = '<tr>\n\<td>' + value1["fieldLabel"] + '</td >\n\
                                    <td>' + value1["fieldValueOfContractor"] + '</td >\n\</tr>';
                                        $("#envAdata").append(html);
                                    }
                                });
                            }
                        });
                    }
                });
            }




            function  shortlistStatus(id) {
//                alert("Contractor Id " + id);
                $.ajax({
                    url: "shortlistedContractorA?id=" + id,
                    success: function (res) {
//                        alert(res);

                       location.reload();;
                    }
                });
            }

            function  rejectStatus(id) {
                var check_validation=validationOnRejectRemark();
                if(check_validation==0){
//                alert("Contractor Id " + id);
                var remark_detail = $("#remarkdetail").val();
//                alert("remark_detail " + remark_detail);
                $.ajax({
                    url: "rejectedContractorA?id=" + id,
                    data: {'remark_detail': remark_detail},
                    success: function (res) {
//                        alert(res);

                        $("#modelEnvelope").click();
//                                    $("#rejectModal").hide();
                       location.reload();;
                    }
                });
            }
        }
            function  revertStatus(id) {
                var check_validation=validationOnRevertRemark();
                if(check_validation==0){
//                alert("Contractor Id " + id);
                var revertremark_detail = $("#revertremark_detail").val();
//                alert("revertremark_detail " + revertremark_detail);
                $.ajax({
                    url: "revertedContractorA?id=" + id,
                    data: {'revertremark_detail': revertremark_detail},
                    success: function (res) {
//                        alert(res);
                        location.reload();;
                    }
//                           
                });
            }
            }


        </script>
        <script>
            $(document).ready(function () {
//                alert("continue to EB rr");
            });
            function  verifyEnvelopeA() {
//                alert("verify ");

                $.ajax({
                    url: "verifyEnvelopeStatus",
                    success: function (res) {
//                        alert("response  " + res);
                        if (res == 'Envelope A is Verified') {
                            $('#verifybtn').hide();
                            $('#verifyMsg').text(res);
                        }

                    }
//                           
                });

            }
            function openEA() {
                verifyEnvelopeA();
//                alert("Now View the Doc");
                $('.openEA_Doc').show();
                $('.openEA_act').show();
                $('#openEA_btn').hide();
                $('#verifyMsg').text("Envelope A is opened ");

                location.reload();



            }

            function validationOnRevertRemark() {
                var countError = 0;
//                alert("validation called on remark");
                var revertRemark = $("#revertremark_detail").val();
                if (revertRemark == null || revertRemark == "") {
                    $("#errormsg").html("Remark is Required");
                    countError++;
                }
                return countError;
            }
            
            function validationOnRejectRemark() {
                var countError = 0;
//                alert("validation called on remark");
                var rejectRemark = $("#remarkdetail").val();
                if (rejectRemark == null || rejectRemark == "") {
                    $("#errormsg").html("Remark is Required");
                    countError++;
                }
                return countError;
            }


        </script>

        <!--Contractor Details and Envelope Details Modal-->
        <div class="modal fade" id="modelEnvelope" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content k-portlet">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Envelope A</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification_md">
                        <form class="k-form">
                            <div class="k-portlet__body pt-2 pb-2 pl-0 pr-0">
                                <div class="bider_table_dt">
                                    <table class="table table-bordered table-hover table-checkable"> 

                                        <thead>
                                            <tr class="row_bg_sec">
                                                <th>Contractor Name</th>
                                                <th>Company Name</th>
                                                <th>Mobile no.</th>
                                                <th>DSC Serial no.</th>
                                            </tr>
                                        </thead>

                                        <tbody id="contDetailsDiv">

                                        </tbody>
                                    </table>
                                </div>

                                <table class="table table-bordered table-hover table-checkable">
                                    <thead>
                                        <tr class="row_bg_sec">
                                            <th>Field Name</th>
                                            <th>Field Value</th>
                                        </tr>
                                    </thead>
                                    <tbody id="envAdata">

                                    </tbody>
                                </table>
                                <div class="form-group row">
                                    <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                    <div class="col-sm-8"> 
                                        <div class="">
                                            
                                        
                                            <c:if test="${hideSelectionOption!=true}">
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#revertModal" id="revertedbtn">Revert</button>


                                            <button  type="button" class="btn btn-success" value="" onclick="shortlistStatus(this.value);" id="shortlistbtn" >Shortlist</button>
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#rejectModal" id="rejectedbtn">Reject</button>
                                            </c:if>
                            
                                            <!--<button type="button" class="btn btn-success" value="" id="verifybtn" onclick="verifyEnvelope(this.value);">Verify</button>-->


                                        </div>
                                    </div>

                                </div>		 </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--Contractor Details and Envelope Details Modal END-->



        <!--Reject Remark Modal-->
        <div class="modal fade mdl-bg" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content k-portlet">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Rejection Remark</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification_md">
                        <form class="k-form">
                            <div class="k-portlet__body pt-2 pb-2 pl-0 pr-0">
                                <div class="form-group">
                                    <label>Remark</label>
                                    <textarea class="form-control" name="rejectRemarkEA" id="remarkdetail" rows="3"></textarea>
                                     <span id="errormsg" style="color: red"></span>
                                </div>
                                <div class="form-group">
                                    <label>File Browser</label>
                                    <div></div>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="k-portlet__foot pt-2 pb-2 pl-0 pr-0">
                        <div class="k-form__actions text-center"> 
                            <button type="button" class="btn btn-success" onclick="rejectStatus(this.value);" value="" id="rejectbtn">Yes</button>
                            <button type="reset" class="btn btn-secondary">No</button> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Reject Remark Modal End-->

        <!--Revert Remark Modal-->
        <div class="modal fade mdl-bg" id="revertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content k-portlet">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Revert Remark</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification_md">
                        <form class="k-form">
                            <div class="k-portlet__body pt-2 pb-2 pl-0 pr-0">
                                <div class="form-group">
                                    <label>Remark</label>
                                    <textarea class="form-control" id="revertremark_detail"  name="revertRemark" rows="3"></textarea>
                                    <span id="errormsg" style="color: red"></span>
                                </div>
                                <div class="form-group">
                                    <label>File Browser</label>
                                    <div></div>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="k-portlet__foot pt-2 pb-2 pl-0 pr-0">
                        <div class="k-form__actions text-center"> 
                            <button type="button" class="btn btn-success" onclick="revertStatus(this.value);" value="" id="revertbtn">Yes</button>
                            <button type="reset" class="btn btn-secondary">No</button> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Revert Remark Modal END-->

    </body>
    <script>

        function continueToEB() {

           // alert(" Alert inside my_code function");
            $.ajax({
                url: 'continuetoEB',

                success: function (res) {
                   // alert(res);

                    if ("Continue to EB" == res) {
                        $('#continuetoEB').show();

                    } else {


                    }



                }
            });
        }

        window.onload = continueToEB();
    </script>

    <!-- end::Body -->
<script src="<c:url value="resources/angular/DepartmentUserController.js"/>" type="text/javascript"></script>
</html>