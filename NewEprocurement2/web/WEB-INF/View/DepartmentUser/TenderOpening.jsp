<%-- 
    Document   : TenderOpening
    Created on : Nov 29, 2018, 2:29:01 PM
    Author     : Vaishali Dubey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>

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
  <script>
$(document).ready(function() {
    $('.tenderData').DataTable();
} );
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
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/faviconlp.ico"/>" />-->
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
        .swal2-popup .swal2-content {
    color: #464457;
    padding-left: 40px;
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
                <jsp:include page="Tiles/Header.jsp"/>
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
<!--                        <div class="k-content__head-toolbar">
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
                                                                <th>Tender No.</th>
                                                                <th>NIT No.</th>
                                                                <th>Name of Department</th>
                                                                <th>Name of Work</th>
                                                                <th>Status</th>
                                                                 <th>Action / Details</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${tenderList}" var="tenderList" varStatus="i">
                                                                <tr>
                                                                    <td>${tenderList.tenderNumber}</td> 
                                                                    <td>${tenderList.nitNumber}</td> 
                                                                    <td>${tenderList.descriptionOfWork}</td> 
                                                                    <td>${tenderList.nameOfWork}</td> 
                                                                    <td>${tenderList.tenderStatus}</td> 
                                                                    <td><span class="dtr-data">
                                                                                       
                        <span class="dropdown">
                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" id="${tendreList.tender_Id}" data-toggle="dropdown" aria-expanded="false">
                              <i class="flaticon-menu-button"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#tenderOpening"  id="${tenderList.tender_Id}"  onclick="openTender(this.id);"><i class="flaticon-list-1"></i>Open Tender </a>
<!--                                <a class="dropdown-item" href="#" ><i class="flaticon-information"></i>Tender Details</a>
                               
                                <a class="dropdown-item" href="#" id="${tenderList.tender_Id}"><i class="la la-leaf"></i> View Full Details</a>  
                                <a class="dropdown-item" href="#"><i class="la la-leaf"></i> View Participants</a>  
                                <a class="dropdown-item" href="#"><i class="la la-leaf"></i> View Purchase Details</a>  -->
                            </div>
                        </span>
                        </span></td> 
                                                                    
                                                                </tr> 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <!--end: Datatable -->
                                                
                                            </div>
                                           
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
            </div>

<!-- begin:: Aside Secondary -->
       <%--     <jsp:include page="Tiles/AsideNavSecondary.jsp"/> --%>
            <!-- end:: Aside Secondary -->
<!-- begin::Global Config -->
		<!-- begin::Quick Panel -->
            <%--    <jsp:include page="Tiles/QuickPanel.jsp"/>--%>
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
    <div class="modal fade mdl-bg mdal-lg" id="tenderOpening" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content"> 
                <div class="modal-header pd-header">
                    <h5 class="modal-title logo-modal"> 
                        <a href="#" class="dpt_logo">
                            <img alt="Department Logo" src="<c:url value="resources/assets/demo/media/logo-light.png"/>" class="logo-width">
                        </a>
                        <span class="dpt_name_logo" id="deptName"></span></h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modelEmpty();">
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
                                        <td><span id="tenderNumber"></span></td>
                                         <th>EMD (In fig.)</th>
                                         <td><span class="rs_ic" ><i class="la la-rupee"></i><span id="emdInFig"></span></span></td> 
                                    </tr>
                                    <tr>
									 <th>Bid Withdraw</th>
                                                                         <td><span class="text-success" id="tenderBidWithdrawAllowed"></span>
                                                                             <span class="text-danger" id="tenderBidWithdraw"></span>
										</td> 
                                        <th>Re-Bid</th>
                                        <td><span class="text-success" id="tenderRebidAllowed"></span>
                                            <span class="text-danger" id="tenderRebid"> </span>
										</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        
                        <ul class="nav nav-pills nav-tabs-btn nav-pills-btn-secondary span_txt">
                           <!--envelope A Strat -->
                            <li class="nav-item btn-secondary" >
				<a href="openEnvelopeA" class="btn btn-sm btn-elevate btn-success radius_0 btn_width"> 
				<span class="k-opacity-10">Click Here to Open</span> 
                               </a>
                                <a class="nav-link" href="#">
                                    <span class="nav-link-icon"><i class="flaticon-envelope text-success"></i></span>
                                    <span class="nav-link-title text-success">Envelope A</span>
                                </a>
                            </li>
                            <!--envelope A End -->
                            <!--envelope B Start -->
                            <li class="nav-item btn-secondary" id="envelopeBicon_countDown" >
				<a href="#" class="btn btn-sm btn-elevate btn-warning radius_0 btn_width" > 
                                    <span class="k-font-bold" id="clock123451" ></span>
                           
                                <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                            </a>
                                <a class="nav-link" href="#" >
                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                    <span class="nav-link-title">Envelope B</span>
                                </a>
                            </li>
                            <li class="nav-item btn-secondary" id="envelopeBicon_open" >
				
                                <a href="openEnvelopeB" class="btn btn-sm btn-elevate btn-success radius_0 btn_width"> 
				<span class="k-opacity-10">Click Here to Open</span> 
                               </a>
                                <a class="nav-link" href="#">
                                    <span class="nav-link-icon"><i class="flaticon-envelope text-success"></i></span>
                                    <span class="nav-link-title text-success">Envelope B</span>
                                </a>
                        
                            </li>
                              <!--envelope B End -->
                               <!--envelope C Start -->
                              <li class="nav-item btn-secondary" id="envelopeCicon_countDown" style="display: none;">
				<a href="#" class="btn btn-sm btn-elevate btn-warning radius_0 btn_width" > 
                                    <span class="k-font-bold" id="clock123450" ></span>
                           
                                <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                            </a>
                                <a class="nav-link" href="#" >
                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                    <span class="nav-link-title">Envelope C</span>
                                </a>
                            </li>
                            <li class="nav-item btn-secondary" id="envelopeCicon_open" style="display: none;">
				
                                <a href="openEnvelopeC" class="btn btn-sm btn-elevate btn-success radius_0 btn_width"> 
				<span class="k-opacity-10">Click Here to Open</span> 
                               </a>
                                <a class="nav-link" href="#">
                                    <span class="nav-link-icon"><i class="flaticon-envelope text-success"></i></span>
                                    <span class="nav-link-title text-success">Envelope C</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav nav-pills nav-tabs-btn nav-pills-btn-secondary open_min_officer">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span class="nav-link-title" > Minimum Opening Officer <span class="count_no">&nbsp;<b id="minOpeningOfficerA"></b></span></span>
                                </a>
                            </li>
                            
                            <li class="nav-item" id="Envelop4" >
                                <a class="nav-link" href="#">
                                    <span class="nav-link-title">Minimum Opening Officer <span class="count_no">&nbsp;<b id="minOpeningOfficerB"></b></span></span>
                                </a>
                            </li>
                              
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span class="nav-link-title">Minimum Opening Officer <span class="count_no">&nbsp;<b id="minOpeningOfficerC"></b></span></span>
                                </a>
                            </li>
                           
                        </ul>
                        <div class="tab-content_opening">
                            <div class="envelope_abc">
                                <div class="nav nav-pills nav-tabs-btn officer_name pb-0">
                                    <div class="nav-item" id="officers_EA">
<!--                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_0_EA_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_0_EA"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_1_EA_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_1_EA"></span></span>
                                        </a>
                                        
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_2_EA_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_2_EA"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_3_EA_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_3_EA"></span></span>
                                        </a>-->
                                    </div>
                                    <div class="nav-item" id="officers_EB">
<!--                                        <a class="nav-link" href="#" onclick="return getDetails()">
       
       
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_0_EB_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_0_EB"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_1_EB_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_1_EB"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_2_EB_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_2_EB"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_3_EB_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_3_EB"></span></span>
                                        </a>-->
                                        
                                    </div>
                                    <div class="nav-item" id="officers_EC">
<!--                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_0_EC_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_0_EC"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_1_EC_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_1_EC"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_2_EC_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_2_EC"></span></span>
                                        </a>
                                        <a class="nav-link" href="#">
                                            <span class="nav-link-title check_officer"><span class="sr_no" id="deptUserFullName_3_EC_Checked"></span></span>
                                            <span class="nav-link-title not_check"><span class="sr_no" id="deptUserFullName_3_EC"></span></span>
                                        </a>-->
                                       
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
    </div>

   <script src="<c:url value="resources/js/jquery.min.js"/>" type="text/javascript"></script>
   
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
    <script src="<c:url value="resources/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>
 


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
    <script src="<c:url value="resources/angular/DepartmentUserController.js"/>" type="text/javascript"></script>
    <script>
        $(document).ready(function() {

            $(".btn_next").click(function(e) {
                $('.btn_next').prev("button").css("display", "inline-block");
                var li_first = $('.nav-tabs-btn');
                var $active = $('.nav-tabs-btn .nav-item a.active');
                $($active).addClass("sve_class_cl");
                $($active).find('.nav-link-title').hide();
                $($active).find('.fa').show();
                nextTab($active);
            });

            $(".btn_prev").click(function(e) {
                var $active = $('.nav-tabs-btn .nav-item a.active.show');

                var current_li = $('.nav-tabs-btn .nav-item a.active.show').closest('li').attr('id');
                var first_li = $('.nav-tabs-btn').find('li:nth-child(2)').attr('id');

                if (current_li && (current_li === first_li)) {
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
        
        
        function  openTender(tenderId){
            startCountDown(tenderId);
           //alert("tenderId "+tenderId); 
           $.ajax({
             url: "openTender?tenderId="+tenderId,
             success: function (res) {
  //alert("response "+res);
                 //  console.log(res);
                     $.each(JSON.parse(res), function (key, value) {
                     
                        
                         
                       
                           var array1 = new Array();
                           var array2 = new Array();
                           
                           
                          if(key==='tenderRebid'&& value=='Allowed'){  //for appending tender details 
                                       $("#"+key+"Allowed").text(value);  
                                    }else if(key=='tenderBidWithdraw' && value=='Allowed'){
                                        $("#"+key+"Allowed").text(value); 
                                   }
                                   
                                 
                                        else if(key=='tenderSubmittedEnvelopeA'){ //for appending EA opening officers 
                                       $.each(value, function (key1, value1) {
                                          if(key1=='minOpeningOfficerA'){  //for appending EA min opening officers 
                                             $('#'+key1).text(value1);
                                           
                                       }
                                       
                                       
                                        if(key1=='envelopeAOfficers'){  //for appending EA total opening officers 
                                            array1 = value1.split(',');
                                            array1=array1.sort();
                                           // alert("total "+array1); 
                                            }
                                           
                                         if(key1=='openedEAOfficers'){  //for appending EA remaining officers to Open 
                                            array2 = value1.split(',');
                                            array2=array2.sort();
                                           // alert("opened by "+array2);
                                           }
                                       
                                        if(key1=='EAOfficersDetails'){   //for appending opening Ofiicers
                                         $.each(value1, function (key2, value2) {
                                               
                                           $.each(value2, function (key3, value3) {
                                         //        alert("bbbbbbbbkey is "+key3+" value is "+value3);
                                              if(key3=='deptUserFullName'){  //for appending Only Opening Officers Name
                                                   var getDetailsValue='\''+value2["deptUserFullName"]+'\',\''+value2["mobNo"]+'\',\''+value2["emailAdd"]+'\',\''
                                                             +value2["designations"]+'\',\''+value2["circle"]+'\',\''+value2["division"]+'\',\''+value2["subDivision"]+'\'';
                                             for(i=0;i<array1.length;i++){  //for appending checked Officers Name
                                                    if(key2===i){
                                                     // alert("value2 "+value2["reg_Id"]+"== array "+array2[i] +" i = "+i); 
                                                       if(value2["reg_Id"]==array2[i]) {
                                                var ateg='<a class="nav-link" href="#" onclick="getDetails('+getDetailsValue+')">\n\
                                                    <span class="nav-link-title check_officer" ><span class="sr_no">'+(key2+1)+'. </span>'+value3+'</span></a>';
                                                    $('#officers_EA').append(ateg); 
                                                }
                                                
                                               
                                                  else{  //for appending not checked Officers Name 
//                                                 
                                               var ateg='<a class="nav-link" href="#" onclick="getDetails('+getDetailsValue+')">\n\
                                                    <span class="nav-link-title not_check" ><span class="sr_no">'+(key2+1)+'. </span>'+value3+'</span></a>';
                                                    $('#officers_EA').append(ateg); 
                                                }     
                                                   }
                                                  }
                                                  }
                                              });  
                                           });   
                                        }
                                    });      
                                    }else if(key=='tenderSubmittedEnvelopeB'){
                                       
                                     $.each(value, function (key1, value1) {
                                       
                    alert("bbbbbbbbkey is "+key1+" value is "+value1);
                                       if(key1=='minOpeningOfficerB'){
                                           $('#'+key1).text(value1);
                                       }if(key1=='envelopeBOfficers'){
                                            array1 = value1.split(',');
                                            array1=array1.sort();
                                  //alert("envelopeBOfficers array1 "+array1); 
                                        }  if(key1=='openedEBOfficers'){  //for appending EB remaining officers to Open 
                                            array2 = value1.split(',');  
                                            array2=array2.sort();
                                           // alert("openedEBOfficers by "+array2);
                                           }
                                        if(key1=='EBOfficersDetails'){//for appending opening Ofiicers
                                          
                                          $.each(value1, function (key2, value2) {
                                             $.each(value2, function (key3, value3) {
//                                               alert("EB key3 is "+key3+" "+key2+" value2 is "+value3) ;
                                               if(key3=='deptUserFullName'){
                                                   var getDetailsValue='\''+value2["deptUserFullName"]+'\',\''+value2["mobNo"]+'\',\''+value2["emailAdd"]+'\',\''
                                                             +value2["designations"]+'\',\''+value2["circle"]+'\',\''+value2["division"]+'\',\''+value2["subDivision"]+'\'';
                                               for(i=0;i<array1.length;i++){
                                                   if(key2===i){
                                                 //        alert("EB  value2 "+value2["reg_Id"]+"== array "+array2[i] +" i = "+i);
                                                       if(value2["reg_Id"]==array2[i]) {
                                                     var ateg='<a class="nav-link" href="#" onclick="getDetails('+getDetailsValue+')">\n\
                                                    <span class="nav-link-title check_officer" ><span class="sr_no">'+(key2+1)+'. </span>'+value3+'</span></a>';
                                                    $('#officers_EB').append(ateg);
                                                   }else{
                                                 var ateg='<a class="nav-link" href="#" onclick="getDetails('+getDetailsValue+')">\n\
                                                    <span class="nav-link-title not_check" ><span class="sr_no">'+(key2+1)+'. </span>'+value3+'</span></a>';
                                                    $('#officers_EB').append(ateg);
                                                 }   
                                                    }
                                                 }
                                           }
                                               });  
                                           });   
                                         }
                                    });      
                                       
                                   }
                                   
                                   else
                                   {
                                         $('#envelopeBicon_countDown').hide();  
                                    $('#envelopeBicon_open').hide();
                                   } 
            if (key == 'tenderSubmittedEnvelopeQCBS') {
    var processedOfficers = new Set();

    $.each(value, function (key4, value4) {
        console.log("KEY@: " + key4 + " " + JSON.stringify(value4));

        if (key4 == 'minOpeningOfficerQCBS') {
            $('#minOpeningOfficerB').text(value4);
        }

        if (key4 == 'QCBSOfficers') {  // For appending EA total opening officers
            array1 = value4.split(',').sort();
            // Uncomment to debug
            // alert("total " + array1); 
        }

        if (key4 == 'QCBSOfficersDetails') {  // For appending opening officers
            // alert("Processing QCBSOfficersDetails: " + key4);
            $.each(value4, function (key2, value2) {
                // alert("KEY 2: " + key2 + " " + JSON.stringify(value2));

                $.each(value2, function (key3, value3) {
                    // alert("Inner KEY: " + key3 + " " + value3);

                    if (key3 == 'deptUserFullName' && !processedOfficers.has(value2["deptUserFullName"])) {
                        processedOfficers.add(value2["deptUserFullName"]);

                        var getDetailsValue = '\'' + value2["deptUserFullName"] + '\',\'' + value2["mobNo"] + '\',\'' + value2["emailAdd"] + '\',\''
                            + value2["designations"] + '\',\'' + value2["circle"] + '\',\'' + value2["division"] + '\',\'' + value2["subDivision"] + '\'';

                        for (i = 0;i<array1.length; i++) {
                            if (key2 === i) {
                                 //alert("Matching reg_Id: " + value2["reg_Id"] + " == array " + array1[i] + " i = " + i);

                            
                                if (value2["reg_Id"] == array1[i]) {
                                   var ateg = '<a class="nav-link" href="#" onclick="getDetails(' + getDetailsValue + ')">\n\
                                        <span class="nav-link-title check_officer" ><span class="sr_no">'+(key2+1)+'. </span>'+ value3+'</span></a>';
                 //   alert("hey")           
                    } else {
                                    ateg = '<a class="nav-link" href="#" onclick="getDetails(' + getDetailsValue + ')">\n\
                                        <span class="nav-link-title not_check" ><span class="sr_no">' + (key2+1)+ '. </span>' + value3 +'</span></a>';
                    //alert("gp")          
                    }
                                $('#officers_EB').append(ateg);
                            }
                        }
                    }
                });
            });
        }
    });
}


                         
                         
                                    if(key=='tenderSubmittedEnvelopeC'){
                                       
                                     $.each(value, function (key1, value1) {
//                                       alert("key is "+key1+" value is "+value1); 
  
                                       if(key1=='minOpeningOfficerC'){
                                           $('#'+key1).text(value1);
                                       }if(key1=='envelopeCOfficers'){
                                            array1 = value1.split(',');
                                            array1=array1.sort();
                                         //alert("EC array1 "+array1); 
                                        }if(key1=='openedECOfficers'){  //for appending EB remaining officers to Open 
                                            array2 = value1.split(','); 
                                            array2=array2.sort();
                                           // alert("EC opened by "+array2);
                                           }
                                        if(key1=='ECOfficersDetails'){
                                           
                                         $.each(value1, function (key2, value2) {
                                             $.each(value2, function (key3, value3) {
    // alert("EC key3 is "+key3+" "+key2+" value2 is "+value3) ;
                                               if(key3=='deptUserFullName'){
                                                    var getDetailsValue='\''+value2["deptUserFullName"]+'\',\''+value2["mobNo"]+'\',\''+value2["emailAdd"]+'\',\''
                                                             +value2["designations"]+'\',\''+value2["circle"]+'\',\''+value2["division"]+'\',\''+value2["subDivision"]+'\'';
                                                         for(i=0;i<array1.length;i++){
                                                             if(key2===i){
                                                           if(value2["reg_Id"]==array2[i]) {
                                                     var ateg='<a class="nav-link" href="#" onclick="getDetails('+getDetailsValue+')">\n\
                                                    <span class="nav-link-title check_officer" ><span class="sr_no">'+(key2+1)+'. </span>'+value3+'</span></a>';
                                                    $('#officers_EC').append(ateg);
                                                     }else{
                                                  var ateg='<a class="nav-link" href="#" onclick="getDetails('+getDetailsValue+')">\n\
                                                    <span class="nav-link-title not_check" ><span class="sr_no">'+(key2+1)+'. </span>'+value3+'</span></a>';
                                                    $('#officers_EC').append(ateg);
                                                 }    
                                                                 
                                                             }
                                                         }
                                                       }
                                               });  
                                            });   
                                       }
                                    });      
                                       
                                   }else{
                                     $("#"+key).text(value);   
                                    
                                   }
                                 });
               
                }
            });    
            
        }
        
                                      function getDetails(a,b,c,d,e,f,g){
       
                                            swal(
                                            '<h5>Officer Details</h5>',
                                    
                                            '<b>Name</b> : '+a+
                                            '<br/><b>Designation</b> : '+d+
                                            
                                           
                                            '<br/><b>Circle</b> : '+e+
                                            '<br/><b>Division</b> : '+f+
                                            '<br/><b>Subdivision</b> : '+g+
                                            '<br/><b><i class="fa fa-phone-square"></i> : +91 ' + b+
                                            '<br/><i class="flaticon-multimedia"></i> : ' +c
                                                     )
                                                          
                                                              }
    </script>
   <script>
     var countdownTimer;
     var tenderId1;
     var seconds;
     var minutes; 
     var remainingSeconds;
     
    function startCountDown(tenderId){
       tenderId1=tenderId;
                countdownTimer =setInterval(bidTimeCounter, 1000);
                
               
                function bidTimeCounter() {
//                   alert("gxxgxdgx");
                            $.ajax({
                        type: "POST",
                        url: "countDownTimerForOpening",
                        data: {'tenderId': tenderId1},
                        success: function (response) {
                            //alert("response "+response);
                             
                             $.each(JSON.parse(response), function (key, value) {
//                                alert("key is "+key+" value is "+value); //key==0 means EB key==1 means EC ..  
                                    seconds = value;
                                   // alert(seconds);
                            if (seconds === 0 || seconds < 0 ) {
                                if((seconds === 0 ||seconds <0) && key===0){
                                   $('#envelopeCicon_countDown').hide();  
                                   $('#envelopeCicon_open').show();  
                                    
                                clearInterval(countdownTimer);     
                                 }
//                               
//                                document.getElementById('clock12345'+key).innerHTML = "Opening Start";
                                if(seconds === 0 || seconds < 0 && key===1){
                                     $('#envelopeBicon_countDown').hide();  
                                    $('#envelopeBicon_open').show();
                                }
                               
//                                $(':button').prop('disabled', true);
//                                $(':input').prop('disabled', true);
//                                return;
                            } else {
                                var days = Math.floor(seconds / (1000 * 60 * 60 * 24));
                                var hours = Math.floor((seconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                minutes = Math.floor((seconds % (1000 * 60 * 60)) / (1000 * 60));
                               remainingSeconds = Math.floor((seconds % (1000 * 60)) / 1000);
                               //alert(hours+" : "+minutes);
//                               second = ("00" + second).substr(-2);
//                                if (remainingSeconds < 10) {
//                                    remainingSeconds = "0" + remainingSeconds;
//                                }
//                                alert(key);
                                 if(key===0){
                                   $('#envelopeCicon_countDown').show();     
//                                      document.getElementById('clock12345'+key).innerHTML = days + " Days & " + hours + " : " + minutes + " : " + remainingSeconds + " To Go";
                         
                                 }if(key===1){
                                     
                                   $('#envelopeBicon_countDown').show();  
//                                    document.getElementById('clock12345'+key).innerHTML = days + " Days & " + hours + " : " + minutes + " : " + remainingSeconds + " To Go";
                         
                                 }
                                document.getElementById('clock12345'+key).innerHTML = days + " Days & " + hours + " : " + minutes + " : " + remainingSeconds + " To Go";
                         
        
        }
                             }); 
                          
//                          
                        },
                        error: function (e) {

                        }
                    });
                }  
            
               
      }
             
    
    
    function modelEmpty(){
          $('#officers_EA').html("");
          $('#officers_EB').html("");
          $('#officers_EC').html("");
    }
  
 
    </script>

</body>

<!-- end::Body -->

</html>