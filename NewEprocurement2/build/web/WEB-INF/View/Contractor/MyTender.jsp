
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title> e-Procurement | Home</title>
        <!-- Favicon lotus procure -->
    <!--    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" /> -->
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <%@include file="../Contractor/Tiles/csslink.jsp" %>  
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
        <script>
            $(function () {
                $(".preloader").fadeOut(2000, function () {
                    $(".loader_main").fadeIn(1000);
                });
            });
        </script>

        <!--end::Web font -->
        <!--begin:: Global Mandatory Vendors -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>


        <style>

            textarea.wrd_conversion{
                height:40px;
            }
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


    </head>


    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">
        <!-- Modal -->
        <!-- end::Scrolltop -->


        <!-- MODAL_FORM_START  -->
        <div class="modal fade mdl-bg mdal-lg" id="tenderOpening" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content"> 
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="<c:url value="/resources/assets/demo/media/logo-dark.png"/>" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Lotus Procure</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">Ã—</span>
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
                                    <a href="#" class="btn btn-sm btn-elevate btn-success radius_0 btn_width"> 
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
        </div>

        <!-- ON LOAD OPEN NOTIFICATION MODAL  -->

        <!-- begin:: Page -->

        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="#">
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
                            <a href="#">
                                <img alt="Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" style="max-width: 80%;" />
                            </a>
                        </div>
                        <div class="k-aside__brand-tools">
                            <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                        </div>
                    </div>

                    <!-- end:: Aside -->


                    <!-- begin:: Aside Menu -->
                    <jsp:include page="Tiles/DashBoardAsideNav.jsp"/>"
                    <!-- end:: Aside Menu -->

                    <!-- begin:: Aside -->


                    <!-- end:: Aside -->
                </div>

                <!-- end:: Aside -->
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                    <!-- begin:: Header -->
                    <%@include  file="../Contractor/Tiles/Header.jsp" %> 

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">My Tender</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>


                                </div>
                            </div>
                            <div class="k-content__head-toolbar">

                            </div>
                        </div>

                        <!-- end:: Content Head -->



                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->
                            <div class="row"> 
                                <div class="col-lg-12">	
                                    <div class="k-portlet k-portlet--tabs tender_tab">
                                        <div class="k-portlet__body description_acc_tender">
                                            <div class="accordion accordion-outline" id="accordionExample3">
                                                <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Name Of Department</th>
                                                            <th>Description</th>
                                                            <th style="width:67px;">PAC</th>
                                                            <th>Bidding Key Date</th>
                                                            <!--												<th style="width:67px;">Status</th> -->
                                                            <th>Action</th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="purchasedTender" items="${purchasedTenderList}" varStatus="i">
                                                            <tr>
                                                            </tr>
                                                            <tr>
                                                                <td>${purchasedTender.tenderNumber}</td>
                                                                <td>${purchasedTender.nitNumber}</td>
                                                                <td><span class="creation_dates"> ${purchasedTender.deptName}</span></td>
                                                                <td><div class="description_acc_tender">
                                                                        <div class="card">
                                                                            <div class="card-header" id="headingTwo3">
                                                                                <div class="card-title collapsed" data-toggle="collapse" data-target="#collapseTwo3${i.count}" aria-expanded="false" aria-controls="collapseTwo3">
                                                                                    ${purchasedTender.descriptionOfWork}
                                                                                </div>
                                                                            </div>
                                                                            <div id="collapseTwo3${i.count}" class="card-body-wrapper collapse" aria-labelledby="headingTwo2" data-parent="#accordionExample3">
                                                                                <div class="card-body">
                                                                                    ${purchasedTender.descriptionOfWork} </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </td>


                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${purchasedTender.estimateValueInFig}</span></td>
                                                                <td><span class="creation_dates"> ${purchasedTender.tenderKeyDates.bidSubmissionDate}</span></td>
                                                                <!--<td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">${purchasedTender.tender_Id}</span></td>-->

                                                                <td>
                                                                    <c:if test="${purchasedTender.proceedtoBid=='true' || purchasedTender.processtoCBid=='true'}">
                                                                     <!--<a href="#"><button type="button" class="btn btn-success" value="Proceed to bid" ng-click="gettenderIdforBid('${purchasedTender.tender_Id}');">Proceed to bid</button></a>-->

 <!--<a href="#" ><button type="button" class="btn btn-success" id="proceedtoBid${purchasedTender.tender_Id}" value="Proceed to bid" style="display: none;">Proceed to bid</button></a>-->
                                                                        <a href="proceedtoBid?tenderId=${purchasedTender.tender_Id}" ><button type="button" class="btn btn-success" id="proceedtoBid${purchasedTender.tender_Id}" value="Proceed to bid" style="display: none;">Proceed to bid</button></a>
                                                                        <a href="viewBid?tenderId=${purchasedTender.tender_Id}"   id="viewBid${purchasedTender.tender_Id}" class="btn btn-success" style="display: none;">View Bid</a>
                    <!--                                                    <button type="button" data-toggle="modal" data-target="#Envelope A not Submitted" onclick="getTenderDetail(${purchasedTender.tender_Id});">model</button>-->
                                                                    </c:if>
                                                                   <c:if test="${purchasedTender.proceedtoBid==true || purchasedTender.processtoCBid==true }">
   

    <span class="dtr-data">
        <span class="dropdown">
            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                <i class="flaticon-menu-button"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                <!--                                                              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                              <a class="dropdown-item" href="#" ><i class="flaticon-information"></i>Tender Details</a>-->
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#tenderOpeningEnvelope" onclick="getTenderDetail(${purchasedTender.tender_Id}, true);"><i class="la la-leaf"></i> Proceed To Bid</a> 
                <!--<a class="dropdown-item" href="#" data-toggle="modal" data-target="#tenderOpeningEnvelope" onclick="verifyDSCProcess('Encryption');"><i class="la la-leaf"></i> Proceed To Bid</a>--> 
                <!--<a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${purchasedTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>--> 
            </div>
        </span>
    </span>
</c:if>

                                                                    <%--<c:if test="${purchasedTender.proceedtoBid==false && purchasedTender.viewOnly==true}">--%>
                                                                    <c:if test="${purchasedTender.proceedtoBid==false && purchasedTender.viewOnly==true}">
                                                                        <span class="dtr-data">
                                                                            <span class="dropdown">
                                                                                <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                    <i class="flaticon-menu-button"></i>
                                                                                </a>
                                                                                <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">


                                                                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#tenderOpeningEnvelope" onclick="getTenderDetail(${purchasedTender.tender_Id}, false);"><i class="la la-leaf"></i> View Bid</a>  


                                                                                </div>
                                                                            </span>
                                                                        </span>





                                                                    </c:if>

                                                                    <c:if test="${purchasedTender.proceedtoBid==false && purchasedTender.viewOnly==false && purchasedTender.processtoCBid == false}">

                                                                        <button type="button" class="btn-danger" value="bid not allowed">bidding not allowed</button>

                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>	





                                                    </tbody>
                                                </table>
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
                    <script>
                                $(document).ready(function () {

                                    $.ajax({
                                        type: "post",
                                        url: 'checkBidButton',
                                        success: function (response) {

                                            $.each(JSON.parse(response), function (key, value) {

                //                           alert("key is "+key+ " value "+value);
                                                if (value === 'viewBid') {

                                                    //alert(key) ; 
                                                    $('#viewBid' + key).show();
                                                    $('#proceedtoBid' + key).hide();
                                                } else {

                                                    $('#viewBid' + key).hide();
                                                    $('#proceedtoBid' + key).show();
                                                }

                                            });

                                        },
                                        error: function (e) {
                                            //alert('Error: ' + e);
                                            document.getElementById('wait').style.display = 'none';
                                        }
                                    });

                                });








                    </script>
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

                <!--<button class="k-aside-secondary-close k-hide " id="k_aside_secondary_close_btn"><i class="la la-close"></i></button>-->


                <!-- end:: Aside Secondary -->
            </div>
        </div>

        <!-- end:: Page -->

        <!-- begin::Scrolltop -->
        <div id="k_scrolltop" class="k-scrolltop">
            <i class="la la-arrow-up"></i>
        </div>

        <!-- end::Scrolltop -->

        <!-- MODAL_FORM_START  -->
        <!--begin::Modal-->
        <div class="modal fade mdl-bg" id="m_select_modal" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" style="max-width: 65%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Add Envelope A</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <form class="k-form k-form--label-left">
                        <div class="modal-body">
                            <div class="form-group row k-margin-t-20">
                                <label class="col-form-label col-lg-3 col-sm-12">Opening Authority</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control k_selectpicker" multiple>
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Minimum Opening Authority</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control" id="exampleSelect1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Envelope A</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control">
                                        <optgroup label="Select" data-max-options="2">
                                            <option>envelopea1</option>
                                        </optgroup>
                                        <optgroup label="Camping" data-max-options="2">
                                            <option>Tent</option>
                                            <option>Flashlight</option>
                                            <option>Toilet Paper</option>
                                        </optgroup>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#m_select_modal_new_template">New Template</button>
                                <button type="button" class="btn btn-success btn-sm">Submit</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!--end::Modal-->

        <!--begin::Modal-New-template -->
        <div class="modal fade mdl-bg" id="m_select_modal_new_template" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog  modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Envelope A</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="k-form">
                            <div class="form-group">
                                <label class="">Template Name</label>
                                <div class="">
                                    <input type="text" class="form-control" id="recipient-name" placeholder="Template Name">
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                            <div class="k-repeater">
                                <div class="k-repeater__data-set">
                                    <div data-repeater-list="demo3-list2">
                                        <div data-repeater-item class="k-repeater__item">
                                            <div class="form-group row">
                                                <div class="col-lg-4">
                                                    <label>Label Name :</label>
                                                    <input type="email" class="form-control" placeholder="Enter NIT number">
                                                    <span class="form-text text-muted">Please enter your nit number</span>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>Label Type :</label>
                                                    <input type="email" class="form-control" placeholder="Enter NIT number">
                                                    <span class="form-text text-muted">Please enter your nit number</span>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>Submission Mandatory</label>
                                                    <div class="k-checkbox-list">
                                                        <label class="k-checkbox k-checkbox--brand">
                                                            <input type="checkbox">
                                                            <span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <label>Remove</label>
                                                    <div class="k-repeater__close k-repeater__data form-group">
                                                        <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                            <i class="la la-close"></i> Close
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-separator k-separator--border-dashed"></div>
                                            <div class="k-separator k-separator--height-sm"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="k-repeater__add-data">
                                    <span data-repeater-create="" class="btn btn-info btn-sm">
                                        <i class="la la-plus"></i> Add More
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success">Save Envelope A</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end::Modal-->

        <!--begin::Modal-View-template -->
        <div class="modal fade mdl-bg" id="m_select_modal_view_template" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Envelope A</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="k-form">
                            <div class="form-group">
                                <label class="">Template Name</label>
                                <div class="">
                                    <input type="text" class="form-control" id="recipient-name" placeholder="Template Name">
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-success btn-sm">Add</button>
                                <button type="button" class="btn btn-secondary btn-sm">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end::Modal-->

        <!--begin::Modal-New-template -->
        <div class="modal fade mdl-bg" id="m_select_modal_tender_document" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog  modal-lg" role="document" style="max-width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Envelope A</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="k-form">
                            <div class="form-group">
                                <label class="">Template Name</label>
                                <div class="">
                                    <input type="text" class="form-control" id="recipient-name" placeholder="Template Name">
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                            <div class="k-repeater">
                                <div class="k-repeater__data-set">
                                    <div data-repeater-list="demo3-list2">
                                        <div data-repeater-item class="k-repeater__item">
                                            <div class="form-group row">
                                                <div class="col-lg-4">
                                                    <label>Label Name :</label>
                                                    <input type="email" class="form-control" placeholder="Enter NIT number">
                                                    <span class="form-text text-muted">Please enter your nit number</span>
                                                </div>
                                                <div class="col-lg-4">
                                                    <label>Label Type :</label>
                                                    <input type="email" class="form-control" placeholder="Enter NIT number">
                                                    <span class="form-text text-muted">Please enter your nit number</span>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label>Submission Mandatory</label>
                                                    <div class="k-checkbox-list">
                                                        <label class="k-checkbox k-checkbox--brand">
                                                            <input type="checkbox">
                                                            <span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1">
                                                    <label>Remove</label>
                                                    <div class="k-repeater__close k-repeater__data form-group">
                                                        <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                            <i class="la la-close"></i> Close
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-separator k-separator--border-dashed"></div>
                                            <div class="k-separator k-separator--height-sm"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="k-repeater__add-data">
                                    <span data-repeater-create="" class="btn btn-info btn-sm">
                                        <i class="la la-plus"></i> Add More
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success">Save Envelope A</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end::Modal-->
        <!--begin::Modal-New-template -->
        <div class="modal fade mdl-bg" id="m_select_modal_view_tender_number" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog  modal-lg" role="document" style="max-width: 90%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">View Tenders Number</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                        <div class="modal-body">
                            <div class="k-portlet k-portlet--mobile">

                                <!--begin: Datatable -->
                                <table class="table table-striped- table-bordered table-hover table-checkable" id="k_table_1">
                                    <thead>
                                        <tr>
                                            <th>Record ID</th>
                                            <th>Order ID</th>
                                            <th>Country</th>
                                            <th>Ship City</th>
                                            <th>Ship Address</th>
                                            <th>Company Agent</th>
                                            <th>Company Name</th>
                                            <th>Ship Date</th>
                                            <th>Status</th>
                                            <th>Type</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>61715-075</td>
                                            <td>China</td>
                                            <td>Tieba</td>
                                            <td>746 Pine View Junction</td>
                                            <td>Nixie Sailor</td>
                                            <td>Gleichner, Ziemann and Gutkowski</td>
                                            <td>2/12/2018</td>
                                            <td>3</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>63629-4697</td>
                                            <td>Indonesia</td>
                                            <td>Cihaur</td>
                                            <td>01652 Fulton Trail</td>
                                            <td>Emelita Giraldez</td>
                                            <td>Rosenbaum-Reichel</td>
                                            <td>8/6/2017</td>
                                            <td>6</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>68084-123</td>
                                            <td>Argentina</td>
                                            <td>Puerto IguazÃº</td>
                                            <td>2 Pine View Park</td>
                                            <td>Ula Luckin</td>
                                            <td>Kulas, Cassin and Batz</td>
                                            <td>5/26/2016</td>
                                            <td>1</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>67457-428</td>
                                            <td>Indonesia</td>
                                            <td>Talok</td>
                                            <td>3050 Buell Terrace</td>
                                            <td>Evangeline Cure</td>
                                            <td>Pfannerstill-Treutel</td>
                                            <td>7/2/2016</td>
                                            <td>1</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>31722-529</td>
                                            <td>Austria</td>
                                            <td>Sankt AndrÃ¤-HÃ¶ch</td>
                                            <td>3038 Trailsway Junction</td>
                                            <td>Tierney St. Louis</td>
                                            <td>Dicki-Kling</td>
                                            <td>5/20/2017</td>
                                            <td>2</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>64117-168</td>
                                            <td>China</td>
                                            <td>Rongkou</td>
                                            <td>023 South Way</td>
                                            <td>Gerhard Reinhard</td>
                                            <td>Gleason, Kub and Marquardt</td>
                                            <td>11/26/2016</td>
                                            <td>5</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>43857-0331</td>
                                            <td>China</td>
                                            <td>Baiguo</td>
                                            <td>56482 Fairfield Terrace</td>
                                            <td>Englebert Shelley</td>
                                            <td>Jenkins Inc</td>
                                            <td>6/28/2016</td>
                                            <td>2</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>64980-196</td>
                                            <td>Croatia</td>
                                            <td>Vinica</td>
                                            <td>0 Elka Street</td>
                                            <td>Hazlett Kite</td>
                                            <td>Streich LLC</td>
                                            <td>8/5/2016</td>
                                            <td>6</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td>0404-0360</td>
                                            <td>Colombia</td>
                                            <td>San Carlos</td>
                                            <td>38099 Ilene Hill</td>
                                            <td>Freida Morby</td>
                                            <td>Haley, Schamberger and Durgan</td>
                                            <td>3/31/2017</td>
                                            <td>2</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>52125-267</td>
                                            <td>Thailand</td>
                                            <td>Maha Sarakham</td>
                                            <td>8696 Barby Pass</td>
                                            <td>Obed Helian</td>
                                            <td>Labadie, Predovic and Hammes</td>
                                            <td>1/26/2017</td>
                                            <td>1</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td>54092-515</td>
                                            <td>Brazil</td>
                                            <td>Canguaretama</td>
                                            <td>32461 Ridgeway Alley</td>
                                            <td>Sibyl Amy</td>
                                            <td>Treutel-Ratke</td>
                                            <td>3/8/2017</td>
                                            <td>4</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td>0185-0130</td>
                                            <td>China</td>
                                            <td>Jiamachi</td>
                                            <td>23 Walton Pass</td>
                                            <td>Norri Foldes</td>
                                            <td>Strosin, Nitzsche and Wisozk</td>
                                            <td>4/2/2017</td>
                                            <td>3</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td>21130-678</td>
                                            <td>China</td>
                                            <td>Qiaole</td>
                                            <td>328 Glendale Hill</td>
                                            <td>Myrna Orhtmann</td>
                                            <td>Miller-Schiller</td>
                                            <td>6/7/2016</td>
                                            <td>3</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td>40076-953</td>
                                            <td>Portugal</td>
                                            <td>Burgau</td>
                                            <td>52550 Crownhardt Court</td>
                                            <td>Sioux Kneath</td>
                                            <td>Rice, Cole and Spinka</td>
                                            <td>10/11/2017</td>
                                            <td>4</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td>36987-3005</td>
                                            <td>Portugal</td>
                                            <td>Bacelo</td>
                                            <td>548 Morrow Terrace</td>
                                            <td>Christa Jacmar</td>
                                            <td>Brakus-Hansen</td>
                                            <td>8/17/2017</td>
                                            <td>1</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>16</td>
                                            <td>67510-0062</td>
                                            <td>South Africa</td>
                                            <td>Pongola</td>
                                            <td>02534 Hauk Trail</td>
                                            <td>Shandee Goracci</td>
                                            <td>Bergnaum, Thiel and Schuppe</td>
                                            <td>7/24/2016</td>
                                            <td>5</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>17</td>
                                            <td>36987-2542</td>
                                            <td>Russia</td>
                                            <td>Novokizhinginsk</td>
                                            <td>19427 Sloan Road</td>
                                            <td>Jerrome Colvie</td>
                                            <td>Kreiger, Glover and Connelly</td>
                                            <td>3/4/2016</td>
                                            <td>3</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>18</td>
                                            <td>11673-479</td>
                                            <td>Brazil</td>
                                            <td>ConceiÃ§Ã£o das Alagoas</td>
                                            <td>191 Stone Corner Road</td>
                                            <td>Michaelina Plenderleith</td>
                                            <td>Legros-Gleichner</td>
                                            <td>2/21/2018</td>
                                            <td>1</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>19</td>
                                            <td>47781-264</td>
                                            <td>Ukraine</td>
                                            <td>Yasinya</td>
                                            <td>1481 Sauthoff Place</td>
                                            <td>Lombard Luthwood</td>
                                            <td>Haag LLC</td>
                                            <td>1/21/2016</td>
                                            <td>1</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>20</td>
                                            <td>42291-712</td>
                                            <td>Indonesia</td>
                                            <td>Kembang</td>
                                            <td>9029 Blackbird Point</td>
                                            <td>Leonora Chevin</td>
                                            <td>Mann LLC</td>
                                            <td>9/6/2017</td>
                                            <td>2</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>21</td>
                                            <td>64679-154</td>
                                            <td>Mongolia</td>
                                            <td>Sharga</td>
                                            <td>102 Holmberg Park</td>
                                            <td>Tannie Seakes</td>
                                            <td>Blanda Group</td>
                                            <td>7/31/2016</td>
                                            <td>6</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>22</td>
                                            <td>49348-055</td>
                                            <td>China</td>
                                            <td>Guxi</td>
                                            <td>45 Butterfield Street</td>
                                            <td>Yardley Wetherell</td>
                                            <td>Gerlach-Schultz</td>
                                            <td>4/3/2017</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>23</td>
                                            <td>47593-438</td>
                                            <td>Portugal</td>
                                            <td>Viso</td>
                                            <td>97 Larry Center</td>
                                            <td>Bryn Peascod</td>
                                            <td>Larkin and Sons</td>
                                            <td>5/22/2016</td>
                                            <td>6</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>24</td>
                                            <td>54569-0175</td>
                                            <td>Japan</td>
                                            <td>Minato</td>
                                            <td>077 Hoffman Center</td>
                                            <td>Chrissie Jeromson</td>
                                            <td>Brakus-McCullough</td>
                                            <td>11/26/2017</td>
                                            <td>2</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>25</td>
                                            <td>0093-1016</td>
                                            <td>Indonesia</td>
                                            <td>Merdeka</td>
                                            <td>3150 Cherokee Center</td>
                                            <td>Gusti Clamp</td>
                                            <td>Stokes Group</td>
                                            <td>4/12/2018</td>
                                            <td>6</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>26</td>
                                            <td>0093-5142</td>
                                            <td>China</td>
                                            <td>Jianggao</td>
                                            <td>289 Badeau Alley</td>
                                            <td>Otis Jobbins</td>
                                            <td>Ruecker, Leffler and Abshire</td>
                                            <td>3/6/2018</td>
                                            <td>4</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>27</td>
                                            <td>51523-026</td>
                                            <td>Germany</td>
                                            <td>Erfurt</td>
                                            <td>132 Chive Way</td>
                                            <td>Lonnie Haycox</td>
                                            <td>Feest Group</td>
                                            <td>4/24/2018</td>
                                            <td>1</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>28</td>
                                            <td>49035-522</td>
                                            <td>Australia</td>
                                            <td>Eastern Suburbs Mc</td>
                                            <td>074 Algoma Drive</td>
                                            <td>Heddi Castelli</td>
                                            <td>Kessler and Sons</td>
                                            <td>1/12/2017</td>
                                            <td>5</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>29</td>
                                            <td>58411-198</td>
                                            <td>Ethiopia</td>
                                            <td>Kombolcha</td>
                                            <td>91066 Amoth Court</td>
                                            <td>Tuck O'Dowgaine</td>
                                            <td>Simonis, Rowe and Davis</td>
                                            <td>5/6/2017</td>
                                            <td>1</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>30</td>
                                            <td>27495-006</td>
                                            <td>Portugal</td>
                                            <td>Arrifes</td>
                                            <td>3 Fairfield Junction</td>
                                            <td>Vernon Cosham</td>
                                            <td>Kreiger-Nicolas</td>
                                            <td>2/8/2017</td>
                                            <td>4</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>31</td>
                                            <td>55154-8284</td>
                                            <td>Philippines</td>
                                            <td>Talisay</td>
                                            <td>09 Sachtjen Junction</td>
                                            <td>Bryna MacCracken</td>
                                            <td>Hyatt-Witting</td>
                                            <td>7/22/2017</td>
                                            <td>2</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>32</td>
                                            <td>62678-207</td>
                                            <td>Libya</td>
                                            <td>ZuwÄrah</td>
                                            <td>82 Thackeray Pass</td>
                                            <td>Freda Arnall</td>
                                            <td>Dicki, Morar and Stiedemann</td>
                                            <td>7/22/2016</td>
                                            <td>3</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>33</td>
                                            <td>68428-725</td>
                                            <td>China</td>
                                            <td>Zhangcun</td>
                                            <td>3 Goodland Terrace</td>
                                            <td>Pavel Kringe</td>
                                            <td>Goldner-Lehner</td>
                                            <td>4/2/2017</td>
                                            <td>4</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>34</td>
                                            <td>0363-0724</td>
                                            <td>Morocco</td>
                                            <td>Temara</td>
                                            <td>9550 Weeping Birch Crossing</td>
                                            <td>Felix Nazaret</td>
                                            <td>Waters, Quigley and Keeling</td>
                                            <td>6/4/2016</td>
                                            <td>5</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>35</td>
                                            <td>37000-102</td>
                                            <td>Paraguay</td>
                                            <td>Los Cedrales</td>
                                            <td>1 Ridge Oak Way</td>
                                            <td>Penrod Allanby</td>
                                            <td>Rodriguez Group</td>
                                            <td>3/5/2018</td>
                                            <td>2</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>36</td>
                                            <td>55289-002</td>
                                            <td>Philippines</td>
                                            <td>Dologon</td>
                                            <td>9 Vidon Terrace</td>
                                            <td>Hubey Passby</td>
                                            <td>Lemke-Hermiston</td>
                                            <td>6/29/2017</td>
                                            <td>2</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>37</td>
                                            <td>15127-874</td>
                                            <td>Tanzania</td>
                                            <td>Nanganga</td>
                                            <td>33 Anniversary Parkway</td>
                                            <td>Magdaia Rotlauf</td>
                                            <td>Hettinger, Medhurst and Heaney</td>
                                            <td>2/18/2018</td>
                                            <td>3</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>38</td>
                                            <td>49349-123</td>
                                            <td>Indonesia</td>
                                            <td>Pule</td>
                                            <td>77292 Bonner Plaza</td>
                                            <td>Alfonse Lawrance</td>
                                            <td>Schuppe-Harber</td>
                                            <td>4/14/2017</td>
                                            <td>1</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>39</td>
                                            <td>17089-415</td>
                                            <td>Palestinian Territory</td>
                                            <td>Zaâ€˜tarah</td>
                                            <td>42806 Ridgeview Terrace</td>
                                            <td>Kessiah Chettoe</td>
                                            <td>Mraz LLC</td>
                                            <td>3/4/2017</td>
                                            <td>5</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>40</td>
                                            <td>51327-510</td>
                                            <td>Philippines</td>
                                            <td>Esperanza</td>
                                            <td>4 Linden Court</td>
                                            <td>Natka Fairbanks</td>
                                            <td>Mueller-Greenholt</td>
                                            <td>6/21/2017</td>
                                            <td>3</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>41</td>
                                            <td>0187-2201</td>
                                            <td>Brazil</td>
                                            <td>Rio das Ostras</td>
                                            <td>5722 Buhler Place</td>
                                            <td>Shaw Puvia</td>
                                            <td>Veum LLC</td>
                                            <td>6/10/2017</td>
                                            <td>3</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>42</td>
                                            <td>16590-890</td>
                                            <td>Indonesia</td>
                                            <td>Krajan Gajahmati</td>
                                            <td>54 Corry Street</td>
                                            <td>Alden Dingate</td>
                                            <td>Heidenreich Inc</td>
                                            <td>10/27/2016</td>
                                            <td>5</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>43</td>
                                            <td>75862-001</td>
                                            <td>Indonesia</td>
                                            <td>Pineleng</td>
                                            <td>4 Messerschmidt Point</td>
                                            <td>Cherish Peplay</td>
                                            <td>McCullough-Gibson</td>
                                            <td>11/23/2017</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>44</td>
                                            <td>24559-091</td>
                                            <td>Philippines</td>
                                            <td>AmuÃ±gan</td>
                                            <td>5470 Forest Parkway</td>
                                            <td>Nedi Swetman</td>
                                            <td>Gerhold Inc</td>
                                            <td>3/23/2017</td>
                                            <td>5</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>45</td>
                                            <td>0007-3230</td>
                                            <td>Russia</td>
                                            <td>Bilyarsk</td>
                                            <td>5899 Basil Place</td>
                                            <td>Ashley Blick</td>
                                            <td>Cummings-Goodwin</td>
                                            <td>10/1/2016</td>
                                            <td>4</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>46</td>
                                            <td>50184-1029</td>
                                            <td>Peru</td>
                                            <td>Chocope</td>
                                            <td>65560 Daystar Center</td>
                                            <td>Saunders Harmant</td>
                                            <td>O'Kon-Wiegand</td>
                                            <td>11/7/2017</td>
                                            <td>3</td>
                                            <td>2</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>47</td>
                                            <td>10819-6003</td>
                                            <td>France</td>
                                            <td>Rivesaltes</td>
                                            <td>4981 Springs Center</td>
                                            <td>Mellisa Laurencot</td>
                                            <td>Jacobs Group</td>
                                            <td>10/30/2017</td>
                                            <td>1</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>48</td>
                                            <td>62750-003</td>
                                            <td>Mongolia</td>
                                            <td>Jargalant</td>
                                            <td>94 Rutledge Way</td>
                                            <td>Orland Myderscough</td>
                                            <td>Gutkowski Inc</td>
                                            <td>11/2/2016</td>
                                            <td>5</td>
                                            <td>3</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>49</td>
                                            <td>68647-122</td>
                                            <td>Philippines</td>
                                            <td>Cardona</td>
                                            <td>4765 Service Hill</td>
                                            <td>Devi Iglesias</td>
                                            <td>Ullrich-Dibbert</td>
                                            <td>7/21/2016</td>
                                            <td>1</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                        <tr>
                                            <td>50</td>
                                            <td>36987-3093</td>
                                            <td>China</td>
                                            <td>Jiantou</td>
                                            <td>373 Northwestern Plaza</td>
                                            <td>Bliss Tummasutti</td>
                                            <td>Legros-Cummings</td>
                                            <td>11/27/2017</td>
                                            <td>5</td>
                                            <td>1</td>
                                            <td nowrap></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!--end: Datatable -->

                            </div>

                        </div>
                    </div>
                    <!--Start::Modal::Footer-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    </div>
                    <!--end::Modal::Footer-->
                </div>
            </div>
        </div>

        <!--end::Modal-->

        <!-- Inventory Modal to add item-->

        <!--end::Modal-->
        <!--begin::Modal-New-template -->
        <div class="modal fade mdl-bg" id="add_Items" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog  modal-lg" role="document" style="max-width: 85%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Add Items</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                        <div class="modal-body">
                            <form class="k-form">
                                <div class="form-group row">

                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-lg-8">
                                                <label>Select Category :</label>
                                                <select class="form-control" id="exampleSelect1">
                                                    <option value="-1"> Select </option>
                                                    <option value="1">computer</option>
                                                    <option value="2">Furnature</option>
                                                    <option value="3">Vehicle</option>
                                                </select>
                                                <span class="form-text text-muted">Please enter your nit number</span>
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="space_btn_height"></label>
                                                <div class=" ">
                                                    <button type="button" class="btn btn-accent btn-sm" data-toggle="modal" data-target="#add_category"><i class="fa fa-plus-circle"></i>Add Category</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-lg-8">
                                                <label class="">Select Sub Category :</label>
                                                <select class="form-control" id="exampleSelect1">
                                                    <option value="-1"> Select </option>
                                                    <option value="1">Mouse</option>
                                                    <option value="2">Keyboard</option>
                                                    <option value="3">Desktop</option>
                                                </select>
                                                <span class="form-text text-muted">Please select nit date</span>
                                            </div>
                                            <div class="col-lg-4">
                                                <label class="space_btn_height"></label>
                                                <div class=" ">
                                                    <button type="button" class="btn btn-accent btn-sm" data-toggle="modal" data-target="#add_Subcategory"><i class="fa fa-plus-circle"></i>Add Sub Category</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="documentts">
                                    <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                                    <div class="k-repeater">
                                        <div class="k-repeater__data-set">
                                            <div data-repeater-list="demo3-list2">
                                                <div data-repeater-item="" class="k-repeater__item">
                                                    <div class="form-group row">
                                                        <div class="col-lg-4">
                                                            <label>Label Name :</label>
                                                            <input type="email" class="form-control" placeholder="Enter NIT number">
                                                            <span class="form-text text-muted">Please enter your nit number</span>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <label>Label Type :</label>
                                                            <div class="custom-file">
                                                                <input type="file" class="custom-file-input" id="customFile2">
                                                                <label class="custom-file-label selected" for="customFile"> </label>
                                                            </div>
                                                            <span class="form-text text-muted">Please enter your nit number</span>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <label>Document Link </label>
                                                            <div><a href="#" target="_blank" class="k-link">info@osmoindia.com</a></div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <label>Action</label>
                                                            <div class="k-repeater__close k-repeater__data form-group">
                                                                <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                                    <i class="la la-close"></i> Remove
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="k-repeater__add-data form-group">
                                            <span data-repeater-create="" class="btn btn-info btn-sm">
                                                <i class="la la-plus"></i> Add More
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-lg-12">
                                        <label>Brief Description :</label>
                                        <textarea class="form-control" id="k_autosize_1" rows="3"></textarea>
                                        <span class="form-text text-muted">Please enter your nit number</span>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="">Reverse Price (In fig):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>
                                    <div class="col-lg-9">
                                        <label class="">Reverse Price (In Word):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="">Auction Start Value (In fig):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>
                                    <div class="col-lg-9">
                                        <label class="">Auction Start Value (In Word):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>

                                </div>

                                <div class="documentts">
                                    <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                                    <div class="k-repeater">
                                        <div class="k-repeater__data-set">
                                            <div data-repeater-list="demo3-list2">
                                                <div data-repeater-item="" class="k-repeater__item">
                                                    <div class="form-group row">
                                                        <div class="col-lg-4">
                                                            <label>S.No.</label>
                                                            <input type="email" class="form-control" placeholder="Enter NIT number">
                                                            <span class="form-text text-muted">Please enter your nit number</span>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <label>Property Name</label>
                                                            <div class="dropzone dropzone-primary dz-clickable" action="inc/api/dropzone/upload.php" id="k-dropzone-one" style="min-height: auto;padding:0;   border: 1px solid #dedede;">
                                                                <div class="dropzone-msg dz-message needsclick" style="margin:2px 0;">
                                                                    <span class=" btn btn-sm">Upload Document</span>
                                                                </div>
                                                            </div>
                                                            <span class="form-text text-muted">Please enter your nit number</span>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <label>Property Description</label>
                                                            <div><a href="#" target="_blank" class="k-link">info@osmoindia.com</a></div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <label>Action</label>
                                                            <div class="k-repeater__close k-repeater__data form-group">
                                                                <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                                    <i class="la la-close"></i> Remove
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="k-repeater__add-data form-group">
                                            <span data-repeater-create="" class="btn btn-success btn-sm">
                                                <i class="la la-plus"></i> Add More Property
                                            </span> <span class="text-danger">Please Upload the .PDF  format only at the time of document upload.</span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--Start::Modal::Footer-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    </div>
                    <!--end::Modal::Footer-->
                </div>
            </div>
        </div>

        <!--end::Modal-->
        <!--begin::Modal-New-template -->
        <div class="modal fade mdl-bg" id="add_From_Inventory" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog  modal-lg" role="document" style="max-width: 75%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Inventory Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="dataTables_length" id="k_table_1_length">
                                        <label>Show
                                            <select name="k_table_1_length" aria-controls="k_table_1" class="custom-select custom-select-sm form-control form-control-sm">
                                                <option value="10">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select> entries</label>
                                    </div>
                                </div>

                                <div class="col-sm-12 col-md-6">
                                    <div id="k_table_1_filter" class="dataTables_filter">
                                        <label>Search:
                                            <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="k_table_1">
                                        </label>
                                    </div>
                                </div>
                                <!-- <div class="col-sm-12 col-md-3 order-1 order-xl-2 k-align-right"> -->
                                <!-- <label>	<a href="#" class="btn btn-accent btn-sm"> -->
                                <!-- <i class="la la-plus"></i> Add Items -->
                                <!-- </a> -->
                                <!-- <div class="k-separator k-separator--border-dashed k-separator--space-lg d-xl-none"></div> -->
                                <!-- </label> -->
                                <!-- </div> -->
                            </div>
                            <!--begin: Datatable -->
                            <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1">
                                <thead>
                                    <tr>
                                        <th>Select</th>
                                        <th>Inventory Number</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Details</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>1</td>
                                        <td>61715-075</td>
                                        <td>China</td>
                                        <td>Tieba</td>
                                        <td>746 Pine View Junction</td>
                                        <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>2</td>
                                        <td>63629-4697</td>
                                        <td>Indonesia</td>
                                        <td>Cihaur</td>
                                        <td>01652 Fulton Trail</td>
                                        <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>3</td>
                                        <td>68084-123</td>
                                        <td>Argentina</td>
                                        <td>Puerto IguazÃº</td>
                                        <td>2 Pine View Park</td>
                                        <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>4</td>
                                        <td>67457-428</td>
                                        <td>Indonesia</td>
                                        <td>Talok</td>
                                        <td>3050 Buell Terrace</td>
                                        <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>25</td>
                                        <td>0093-1016</td>
                                        <td>Indonesia</td>
                                        <td>Merdeka</td>
                                        <td>3150 Cherokee Center</td>
                                        <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>26</td>
                                        <td>0093-5142</td>
                                        <td>China</td>
                                        <td>Jianggao</td>
                                        <td>289 Badeau Alley</td>
                                        <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="k-radio k-radio--bold k-radio--success">
                                                <input type="radio" name="radio6">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>50</td>
                                        <td>36987-3093</td>
                                        <td>China</td>
                                        <td>Jiantou</td>
                                        <td>373 Northwestern Plaza</td>
                                        <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                    </tr>
                                </tbody>
                            </table>

                            <!--end: Datatable -->
                            <div class="row">
                                <div class="col-sm-12 col-md-5">
                                    <div class="dataTables_info" id="k_table_1_info" role="status" aria-live="polite">Showing 1 to 25 of 50 entries</div>
                                </div>
                                <div class="col-sm-12 col-md-7">
                                    <div class="dataTables_paginate paging_simple_numbers" id="k_table_1_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button page-item previous disabled" id="k_table_1_previous"><a href="#" aria-controls="k_table_1" data-dt-idx="0" tabindex="0" class="page-link"><i class="la la-angle-left"></i></a></li>
                                            <li class="paginate_button page-item active"><a href="#" aria-controls="k_table_1" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                            <li class="paginate_button page-item "><a href="#" aria-controls="k_table_1" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                                            <li class="paginate_button page-item next" id="k_table_1_next"><a href="#" aria-controls="k_table_1" data-dt-idx="3" tabindex="0" class="page-link"><i class="la la-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Start::Modal::Footer-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#add_Items_From_Inventory">Add Items</button>
                    </div>
                    <!--end::Modal::Footer-->
                </div>
            </div>
        </div>

        <!--end::Modal-->

        <!--begin::Modal-New-template -->
        <div class="modal fade mdl-bg" id="add_Items_From_Inventory" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog  modal-lg" role="document" style="max-width: 70%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Inventory Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                        <div class="modal-body">
                            <form class="k-form">
                                <div class="form-group row">
                                    <div class="col-lg-6">
                                        <label>Select Category :</label>
                                        <select class="form-control" id="exampleSelect1">
                                            <option value="-1"> Select </option>
                                            <option value="1">computer</option>
                                            <option value="2">Furnature</option>
                                            <option value="3">Vehicle</option>
                                        </select>
                                        <span class="form-text text-muted">Please enter your nit number</span>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="">Select Sub Category :</label>
                                        <select class="form-control" id="exampleSelect1">
                                            <option value="-1"> Select </option>
                                            <option value="1">Mouse</option>
                                            <option value="2">Keyboard</option>
                                            <option value="3">Desktop</option>
                                        </select>
                                        <span class="form-text text-muted">Please select nit date</span>
                                    </div>

                                </div>
                                <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                    <!--begin: Datatable -->
                                    <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1">
                                        <thead>
                                            <tr>
                                                <th><b>Item Document Name</b></th>
                                                <th><b>Select File</b></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Auction Document</td>
                                                <td>Hydrangeas313256.jpg</td>
                                            </tr>
                                            <tr>
                                                <td>Auction Document</td>
                                                <td>Hydrangeas313256.jpg</td>
                                            </tr>
                                            <tr>
                                                <td>Auction Document</td>
                                                <td>Hydrangeas313256.jpg</td>
                                            </tr>
                                            <tr>
                                                <td>Auction Document</td>
                                                <td>Hydrangeas313256.jpg</td>
                                            </tr>
                                            <tr>
                                                <td>Auction Document</td>
                                                <td>Hydrangeas313256.jpg</td>
                                            </tr>
                                            <tr>
                                                <td>Auction Document</td>
                                                <td>Hydrangeas313256.jpg</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!--end: Datatable -->
                                </div>

                                <div class="form-group row">
                                    <div class="col-lg-12">
                                        <label>Brief Description :</label>
                                        <textarea class="form-control" id="k_autosize_1" rows="3"></textarea>
                                        <span class="form-text text-muted">Please enter your nit number</span>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="">Reverse Price (In fig):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>
                                    <div class="col-lg-9">
                                        <label class="">Reverse Price (In Word):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-lg-3">
                                        <label class="">Auction Start Value (In fig):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>
                                    <div class="col-lg-9">
                                        <label class="">Auction Start Value (In Word):</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                            <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                        </div>
                                        <span class="form-text text-muted">Please enter your postcode</span>
                                    </div>

                                </div>

                            </form>

                        </div>
                        <!--Start::Modal::Footer-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success btn-sm">Save Inventory</button>
                    </div>
                    <!--end::Modal::Footer-->
                </div>
            </div>
        </div>
        <!--end::Modal-->

        <!--begin::Modal-->
        <div class="modal fade mdl-bg" id="add_category" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 65%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <form class="k-form">
                        <div class="modal-body">
                            <div class="form-group row k-margin-t-20">
                                <label class="col-form-label col-lg-3 col-sm-12">Opening Authority</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control k_selectpicker" multiple>
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Minimum Opening Authority</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control" id="exampleSelect1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Envelope A</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control">
                                        <optgroup label="Select" data-max-options="2">
                                            <option>envelopea1</option>
                                        </optgroup>
                                        <optgroup label="Camping" data-max-options="2">
                                            <option>Tent</option>
                                            <option>Flashlight</option>
                                            <option>Toilet Paper</option>
                                        </optgroup>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <button type="button" class="btn btn-info btn-sm">Add</button>
                                <button type="button" class="btn btn-success btn-sm">Reset</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!--end::Modal-->

        <!-- Small Modal -->
        <div class="modal fade bd-example-modal-sm mdl-bg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><div class="form-group">
                            <div class="input-group pull-right" id="k_daterangepicker_58">
                                <input type="text" class="form-control" readonly="" placeholder="Select date &amp; time range">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                </div>
                            </div>
                        </div></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-sm">Submit</button>
                    </div>
                </div>
            </div>
        </div>

        <!---Start-Modal-Tab-Upload-Documents---> 
        <style>
            .uplodeFolderFile .modal-header{
                border-bottom:0;
                padding-bottom:0;
            }
            .pd-tp{
                padding-top:0px;
            }
            .pd-bt{
                padding-bottom:0px;
            }
            .pd-lt{
                padding-left:0px;
            }
            .pd-right{
                padding-top:0px;
            }
            .paddingboth {
                padding: 0!important;
            }
            .input_upload {
                margin: 60px auto;
                text-align: center;
            }
            .input_upload label {
                border: 1px solid #dedede;
                padding: 10px;
                font-size: 13px;
            }
        </style>

        <!-- Modal -->
        <div class="modal mdl-bg fade uplodeFolderFile" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Insert files using Google Drive</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pd-tp pd-bt">
                        <div class="k-portlet k-portlet--tabs" style="margin-bottom:0;">
                            <div class="k-portlet__head paddingboth">
                                <div class="k-portlet__head-toolbar">
                                    <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-primary" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_1_1_tab_content" role="tab" aria-selected="false">
                                                <i class="la la-desktop"></i> My Computer
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active show" data-toggle="tab" href="#k_portlet_base_demo_1_2_tab_content" role="tab" aria-selected="true">
                                                <i class="la la-cloud-upload"></i> Cloud Folder
                                            </a>
                                        </li> 
                                    </ul>
                                </div>
                            </div>
                            <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="225" data-mobile-height="225" style="height: 225px; overflow: hidden;">
                                <div class="tab-content">
                                    <div class="tab-pane" id="k_portlet_base_demo_1_1_tab_content" role="tabpanel">

                                        <div class="custom-file input_upload">
                                            <label class="selected" for="customFile"> Select files from your computer</label>
                                        </div>

                                    </div>
                                    <div class="tab-pane active show" id="k_portlet_base_demo_1_2_tab_content" role="tabpanel">
                                        2
                                    </div> 
                                </div>
                            </div>
                        </div>	
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm  btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-sm btn-primary">Upload</button>
                    </div>
                </div>
            </div>
        </div>


        <!---End-Modal-Tab-Upload-Documents---> 
        <!--begin::Modal-->
        <div class="modal fade mdl-bg" id="add_Subcategory" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 50%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create Sub Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="la la-remove"></span>
                        </button>
                    </div>
                    <form class="k-form">
                        <div class="modal-body">
                            <div class="form-group row k-margin-t-20">
                                <label class="col-form-label col-lg-3 col-sm-12">Item Category</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control" id="exampleSelect1">
                                        <option value="">Select</option>

                                        <option value="1">Computer</option>

                                        <option value="2">Furnature</option>

                                        <option value="3">Vehicle</option>
                                    </select>
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Sub Division Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <input type="email" class="form-control" placeholder=" ">
                                    <span class="form-text text-muted">Select boxes with optgroups</span>
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <button type="button" class="btn btn-info btn-sm">Add</button>
                                <button type="button" class="btn btn-success btn-sm">Reset</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!-- begin::Global Config -->
        <!-- begin::Quick Panel -->
        <div id="k_quick_panel" class="k-quick-panel">
            <div class="k-quick-panel__nav">
                <ul class="nav nav-pills" role="tablist">
                    <li class="nav-item active">
                        <a class="nav-link active" data-toggle="tab" href="#k_quick_panel_tab_notifications" role="tab">Notifications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#k_quick_panel_tab_actions" role="tab">Actions</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#k_quick_panel_tab_settings" role="tab">Settings</a>
                    </li>
                </ul>
                <button class="k-quick-panel__close" id="k_quick_panel_close_btn"><i class="la la-close"></i></button>
            </div>
            <div class="k-quick-panel__content">
                <div class="tab-content">
                    <div class="tab-pane fade show k-scroll active" id="k_quick_panel_tab_notifications" role="tabpanel">

                        <!--Begin::Timeline -->
                        <div class="k-timeline">

                            <!--Begin::Item -->
                            <div class="k-timeline__item k-timeline__item--success">
                                <div class="k-timeline__item-section">
                                    <div class="k-timeline__item-section-border">
                                        <div class="k-timeline__item-section-icon">
                                            <i class="flaticon-feed k-font-success"></i>
                                        </div>
                                    </div>
                                    <span class="k-timeline__item-datetime">02:30 PM</span>
                                </div>
                                <a href="" class="k-timeline__item-text">
                                    KeenThemes created new layout whith tens of new options for Keen Admin panel
                                </a>
                                <div class="k-timeline__item-info">
                                    HTML,CSS,VueJS
                                </div>
                            </div>

                            <!--End::Item -->

                            <!--Begin::Item -->
                            <div class="k-timeline__item k-timeline__item--danger">
                                <div class="k-timeline__item-section">
                                    <div class="k-timeline__item-section-border">
                                        <div class="k-timeline__item-section-icon">
                                            <i class="flaticon-safe-shield-protection k-font-danger"></i>
                                        </div>
                                    </div>
                                    <span class="k-timeline__item-datetime">01:20 AM</span>
                                </div>
                                <a href="" class="k-timeline__item-text">
                                    New secyrity alert by Firewall & order to take aktion on User Preferences
                                </a>
                                <div class="k-timeline__item-info">
                                    Security, Fieewall
                                </div>
                            </div>

                            <!--End::Item -->

                            <!--Begin::Item -->
                            <div class="k-timeline__item k-timeline__item--brand">
                                <div class="k-timeline__item-section">
                                    <div class="k-timeline__item-section-border">
                                        <div class="k-timeline__item-section-icon">
                                            <i class="flaticon-box-1 k-font-brand"></i>
                                        </div>
                                    </div>
                                    <span class="k-timeline__item-datetime">Yestardey</span>
                                </div>
                                <a href="" class="k-timeline__item-text">
                                    FlyMore design mock-ups been uploadet by designers Bob, Naomi, Richard
                                </a>
                                <div class="k-timeline__item-info">
                                    PSD, Sketch, AJ
                                </div>
                            </div>

                            <!--End::Item -->

                            <!--Begin::Item -->
                            <div class="k-timeline__item k-timeline__item--warning">
                                <div class="k-timeline__item-section">
                                    <div class="k-timeline__item-section-border">
                                        <div class="k-timeline__item-section-icon">
                                            <i class="flaticon-pie-chart-1 k-font-warning"></i>
                                        </div>
                                    </div>
                                    <span class="k-timeline__item-datetime">Aug 13,2018</span>
                                </div>
                                <a href="" class="k-timeline__item-text">
                                    Meeting with Ken Digital Corp ot Unit14, 3 Edigor Buildings, George Street, Loondon<br> England, BA12FJ
                                </a>
                                <div class="k-timeline__item-info">
                                    Meeting, Customer
                                </div>
                            </div>

                            <!--End::Item -->

                            <!--Begin::Item -->
                            <div class="k-timeline__item k-timeline__item--info">
                                <div class="k-timeline__item-section">
                                    <div class="k-timeline__item-section-border">
                                        <div class="k-timeline__item-section-icon">
                                            <i class="flaticon-notepad k-font-info"></i>
                                        </div>
                                    </div>
                                    <span class="k-timeline__item-datetime">May 09, 2018</span>
                                </div>
                                <a href="" class="k-timeline__item-text">
                                    KeenThemes created new layout whith tens of new options for Keen Admin panel
                                </a>
                                <div class="k-timeline__item-info">
                                    HTML,CSS,VueJS
                                </div>
                            </div>

                            <!--End::Item -->

                            <!--Begin::Item -->
                            <div class="k-timeline__item k-timeline__item--accent">
                                <div class="k-timeline__item-section">
                                    <div class="k-timeline__item-section-border">
                                        <div class="k-timeline__item-section-icon">
                                            <i class="flaticon-bell k-font-accent"></i>
                                        </div>
                                    </div>
                                    <span class="k-timeline__item-datetime">01:20 AM</span>
                                </div>
                                <a href="" class="k-timeline__item-text">
                                    New secyrity alert by Firewall & order to take aktion on User Preferences
                                </a>
                                <div class="k-timeline__item-info">
                                    Security, Fieewall
                                </div>
                            </div>

                            <!--End::Item -->
                        </div>

                        <!--End::Timeline -->
                    </div>
                    <div class="tab-pane fade k-scroll" id="k_quick_panel_tab_actions" role="tabpanel">

                        <!--begin::Portlet-->
                        <div class="k-portlet k-portlet--solid-success">
                            <div class="k-portlet__head">
                                <div class="k-portlet__head-label">
                                    <span class="k-portlet__head-icon k-hide"><i class="flaticon-stopwatch"></i></span>
                                    <h3 class="k-portlet__head-title">Recent Bills</h3>
                                </div>
                                <div class="k-portlet__head-toolbar">
                                    <div class="k-portlet__head-group">
                                        <div class="dropdown dropdown-inline">
                                            <button type="button" class="btn btn-sm btn-font-light btn-outline-hover-light btn-circle btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="flaticon-more"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Separated link</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="k-portlet__body">
                                <div class="k-portlet__content">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting simply dummy text of the printing industry.
                                </div>
                            </div>
                            <div class="k-portlet__foot k-portlet__foot--sm k-align-right">
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">Dismiss</a>
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">View</a>
                            </div>
                        </div>

                        <!--end::Portlet-->

                        <!--begin::Portlet-->
                        <div class="k-portlet k-portlet--solid-focus">
                            <div class="k-portlet__head">
                                <div class="k-portlet__head-label">
                                    <span class="k-portlet__head-icon k-hide"><i class="flaticon-stopwatch"></i></span>
                                    <h3 class="k-portlet__head-title">Latest Orders</h3>
                                </div>
                                <div class="k-portlet__head-toolbar">
                                    <div class="k-portlet__head-group">
                                        <div class="dropdown dropdown-inline">
                                            <button type="button" class="btn btn-sm btn-font-light btn-outline-hover-light btn-circle btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="flaticon-more"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Separated link</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="k-portlet__body">
                                <div class="k-portlet__content">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting simply dummy text of the printing industry.
                                </div>
                            </div>
                            <div class="k-portlet__foot k-portlet__foot--sm k-align-right">
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">Dismiss</a>
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">View</a>
                            </div>
                        </div>

                        <!--end::Portlet-->

                        <!--begin::Portlet-->
                        <div class="k-portlet k-portlet--solid-info">
                            <div class="k-portlet__head">
                                <div class="k-portlet__head-label">
                                    <h3 class="k-portlet__head-title">Latest Invoices</h3>
                                </div>
                                <div class="k-portlet__head-toolbar">
                                    <div class="k-portlet__head-group">
                                        <div class="dropdown dropdown-inline">
                                            <button type="button" class="btn btn-sm btn-font-light btn-outline-hover-light btn-circle btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="flaticon-more"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Separated link</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="k-portlet__body">
                                <div class="k-portlet__content">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting simply dummy text of the printing industry.
                                </div>
                            </div>
                            <div class="k-portlet__foot k-portlet__foot--sm k-align-right">
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">Dismiss</a>
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">View</a>
                            </div>
                        </div>

                        <!--end::Portlet-->

                        <!--begin::Portlet-->
                        <div class="k-portlet k-portlet--solid-warning">
                            <div class="k-portlet__head">
                                <div class="k-portlet__head-label">
                                    <h3 class="k-portlet__head-title">New Comments</h3>
                                </div>
                                <div class="k-portlet__head-toolbar">
                                    <div class="k-portlet__head-group">
                                        <div class="dropdown dropdown-inline">
                                            <button type="button" class="btn btn-sm btn-font-light btn-outline-hover-light btn-circle btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="flaticon-more"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Separated link</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="k-portlet__body">
                                <div class="k-portlet__content">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting simply dummy text of the printing industry.
                                </div>
                            </div>
                            <div class="k-portlet__foot k-portlet__foot--sm k-align-right">
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">Dismiss</a>
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">View</a>
                            </div>
                        </div>

                        <!--end::Portlet-->

                        <!--begin::Portlet-->
                        <div class="k-portlet k-portlet--solid-brand">
                            <div class="k-portlet__head">
                                <div class="k-portlet__head-label">
                                    <h3 class="k-portlet__head-title">Recent Posts</h3>
                                </div>
                                <div class="k-portlet__head-toolbar">
                                    <div class="k-portlet__head-group">
                                        <div class="dropdown dropdown-inline">
                                            <button type="button" class="btn btn-sm btn-font-light btn-outline-hover-light btn-circle btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="flaticon-more"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Separated link</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="k-portlet__body">
                                <div class="k-portlet__content">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting simply dummy text of the printing industry.
                                </div>
                            </div>
                            <div class="k-portlet__foot k-portlet__foot--sm k-align-right">
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">Dismiss</a>
                                <a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">View</a>
                            </div>
                        </div>

                        <!--end::Portlet-->
                    </div>
                    <div class="tab-pane fade k-scroll" id="k_quick_panel_tab_settings" role="tabpanel">
                        <form class="k-form">
                            <div class="k-heading k-heading--space-sm">Notifications</div>
                            <div class="form-group form-group-xs row">
                                <label class="col-8 col-form-label">Enable notifications:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm">
                                        <label>
                                            <input type="checkbox" checked="checked" name="quick_panel_notifications_1">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group form-group-xs row">
                                <label class="col-8 col-form-label">Enable audit log:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm">
                                        <label>
                                            <input type="checkbox" name="quick_panel_notifications_2">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group form-group-last form-group-xs row">
                                <label class="col-8 col-form-label">Notify on new orders:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm">
                                        <label>
                                            <input type="checkbox" checked="checked" name="quick_panel_notifications_2">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="k-separator k-separator--space-md k-separator--border-dashed"></div>
                            <div class="k-heading k-heading--space-sm">Orders</div>
                            <div class="form-group form-group-xs row">
                                <label class="col-8 col-form-label">Enable order tracking:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm k-switch--danger">
                                        <label>
                                            <input type="checkbox" checked="checked" name="quick_panel_notifications_3">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group form-group-xs row">
                                <label class="col-8 col-form-label">Enable orders reports:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm k-switch--danger">
                                        <label>
                                            <input type="checkbox" name="quick_panel_notifications_3">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group form-group-last form-group-xs row">
                                <label class="col-8 col-form-label">Allow order status auto update:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm k-switch--danger">
                                        <label>
                                            <input type="checkbox" checked="checked" name="quick_panel_notifications_4">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="k-separator k-separator--space-md k-separator--border-dashed"></div>
                            <div class="k-heading k-heading--space-sm">Customers</div>
                            <div class="form-group form-group-xs row">
                                <label class="col-8 col-form-label">Enable customer singup:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm k-switch--success">
                                        <label>
                                            <input type="checkbox" checked="checked" name="quick_panel_notifications_5">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group form-group-xs row">
                                <label class="col-8 col-form-label">Enable customers reporting:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm k-switch--success">
                                        <label>
                                            <input type="checkbox" name="quick_panel_notifications_5">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group form-group-last form-group-xs row">
                                <label class="col-8 col-form-label">Notifiy on new customer registration:</label>
                                <div class="col-4 k-align-right">
                                    <span class="k-switch k-switch--sm k-switch--success">
                                        <label>
                                            <input type="checkbox" checked="checked" name="quick_panel_notifications_6">
                                            <span></span>
                                        </label>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="<c:url value="/resources/angular/ContractorController.js"/>" type="text/javascript" ></script>
        <script src="<c:url value="/resources/angular/tenderScript.js"/>" type="text/javascript" ></script>

        <script>
                    $(document).ready(function () {

                        $(".btn_next").click(function (e) {
                            $('.btn_next').prev("button").css("display", "block");
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
        </script>
        <script>
                    $(document).ready(function () {
                        $('.tenderData').DataTable();
                    });
        </script>
        <script>
                    var randomNo = "70331";
                            function verifyDSCProcess(dscType) {
                                $('#preloaderSpinner').show();
                                randomNo = getRandomInt(1, 300000);

                                randomNo = randomNo + "TAB";
                                var url = "VerifyDSCProcess?randomNo=" + randomNo + '&dscType=' + dscType + '&userType=Contractor';
                                window.open(url);
                                checkJnlpExeStatus();
                            }


                    function checkJnlpExeStatus() {
                        $.ajax({
                            url: "accessJnlpExeStatus?randomNo=" + randomNo,
                            cache: false,
                            success: function (response) {
                                var data = JSON.parse(response);

                                // Run if status is active and result is success
                                if (data[0] == 'success' && data[1] == 'active') {
                                    console.log("polling end...");

                                    $('#preloaderSpinner').hide();
                                    if (randomNo.indexOf('NEWTAB') > -1) { // open url in new tab
                                        window.open(data[2], "_blank");
                                    } else { // open url in same tab
                                        window.location.href = data[2];
                                    }
                                } else {
                                    setTimeout(checkJnlpExeStatus, 2000);
                                    console.log("polling continue....");
                                }
                            },
                            error: function (data) {
                                console.log("error in ajax call...");
                            },
                            complete: function (data) {
                                console.log("ajax call completed..");
                            }
                        });
                    }

                    function getRandomInt(min, max) {
                        return Math.floor(Math.random() * (max - min + 1)) + min;
                    }
        </script>
    </body>

    <jsp:include page="../DepartmentUser/Tiles/TenderSummary.jsp"/>
    <jsp:include page="ProceedtoBidModel.jsp"/>
    <!-- end::Body -->
    <!-- Angular script -->
    <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
    <script src="<c:url value="/resources/angular/DepartmentUserController.js" />"></script>
</html>