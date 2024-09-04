<%-- 
    Document   : paymentRequestPage
    Created on : 30 Dec, 2018, 2:03:51 PM
    Author     : Windows7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <!-- begin::Head -->
    <head>
        <%@include  file="../Contractor/Tiles/csslink.jsp" %>    
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    </head>

    <!-- end::Head -->

    <!-- begin::Body -->

    <body onload="paasEncryptedResponse()" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled">
        <!-- begin:: Page -->
        <h6>${encResp}</h6>
        <h1>Hello Friend.....!!!Transaction Done Successfully.</h1>   

        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="#">
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
                            <a href="#">
                                <img alt="Logo" src="resources/assets/demo/media/logo-dark.png" style="max-width: 80%;" />
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
                    <%@include  file="../Contractor/Tiles/Header.jsp" %>     
                    <!-- end:: Header -->


                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">E-receipt</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
                            <div class="k-content__head-toolbar">
                                <div class="k-content__head-toolbar-wrapper"> 
                                    <a href="#" class="btn btn-sm btn-elevate btn-danger" data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                        <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp;
                                        <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16</span>
                                        <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- end:: Content Head -->

                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid" id="printTable">
                            <div class="row">
                                <div class="col-lg-12" >
                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid">
                                        <div class="k-portlet__body bidder_template" >
                                            <!--begin::E-receipt-->
                                            <div class="tender_billing_receipt">
                                                <table class="table table-striped- table-bordered table-hover tenderData dataTable no-footer tender_receipt" id="printTable">
                                                    <thead>
                                                        <tr class="group tbl_row_bg">
                                                            <th class="border_right" style="border-right:none;"><a href="#" class="logo_recipt"><img alt="department_logo" src="resources/assets/demo/media/logo-light.png"></a></th>
                                                            <th style="border-right:none;" colspan="4" class="align-middle widt_6_ text-center border_left"><h2 class="tender_receipt_dpt_name">E-Proc</h2></th> 
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr> 
                                                            <th><span class="contractor_name">Company Name</span></th>
                                                            <td><p class="dtl_p" id="contOrgName"><p></td> 
                                                            <th><span class="contractor_name">Contarctor Name</span></th>
                                                            <td><p class="dtl_p" id="contName"></p></td> 
                                                        </tr> 
                                                        <tr> 
                                                            <th><span class="transations_id">Transaction Id</span></th>
                                                            <td><p class="dtl_p" id="tracking_id"></p></td> 
                                                            <th><span class="contractor_name">Transaction Date</span></th>
                                                            <td><p class="dtl_p" id="trans_date"></p></td>
                                                        </tr> 
                                                        <tr> 
                                                            <th><span class="contractor_name">Status</span></th>
                                                            <td><p class="dtl_p" id="order_status"></p><!--<p class="dtl_p">Faield</p>--></td> 
                                                            <th><span class="contractor_name">Bank Reference Number</span></th>
                                                            <td><p class="dtl_p" id="bank_ref_no"></p><!--<p class="dtl_p">Faield</p>--></td> 
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table class="table table-striped- table-bordered table-hover tenderData dataTable no-footer" id="DataTables_Table_0"> 
                                                <thead>
                                                        <tr class="group tbl_row_bg"><td colspan="10" class="clearfix tbl_td_bg"><span class="pull-left tbl_head">Tender / Auction Details</span</td></tr>
                                                        <tr>
                                                            <th>Type</th>
                                                            <th>Tender/Auction</th>
                                                            <th>Department Name</th>
                                                            <th>Document Fees</th>
                                                            <th>Portal Charge</th>
                                                            <th>GST (18%)</th>
                                                            <th>Total (Include Tax)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr role="row"> 
                                                            <c:forEach var="tenderList" items="${tenderList}" varStatus="loopCounterOuter">                            
                                                            <tr> 
                                                                <td>Tender</td>
                                                                <td>${tenderList.tenderNumber}</td>
                                                                <td>${tenderList.deptName}</td>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${tenderList.tenderDocumentFees}</span></td>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${tenderList.portalCharge}</span></td>
                                                                <td><span class="gst">18</span></td>
                                                                <td><span class="Include_Tax">
                                                                        <c:forEach var="tntotaldocfeewithtaxList" items="${tntotaldocfeewithtaxList}" varStatus="loopCounterInner" >  
                                                                            <c:if test="${loopCounterOuter.count == loopCounterInner.count}">
                                                                                <c:out value="${tntotaldocfeewithtaxList}"/>
                                                                            </c:if>
                                                                        </c:forEach>            
                                                                    </span></td>                                                                                  
                                                            </tr>                                                                            
                                                        </c:forEach>   	
                                                        <tr class="tbl_row_bg"> 
                                                            <td colspan="6"><b>Grand Total</b></td>
                                                            <td colspan="4"><span class="total_Tax"><b>${grandtotaldocfeewithtax}</b></span></td> 
                                                        </tr> </tbody>
                                                </table>
                                                <div class="ptint_reciept_bt"> 
                                                    <button type="button" class="btn btn-info btn-sm print_bt"><i class="k-nav__link-icon la la-print"></i><span class="k-nav__link-text" onclick="printTable();">Print</span></button>
                                                </div>
                                            </div>
                                            <!--end::E-receipt-->
                                        </div>
                                    </div>

                                    <!--end::Portlet-->
                                </div>

                            </div>

                        </div>

                        <!-- end:: Content Body -->
                    </div>

                    <!-- end:: Content -->

                    <!-- begin:: Footer -->
                 
                    <%--       <%@include  file="../Contractor/Tiles/Footer.jsp" %>   --%>  
                    <!-- end:: Footer -->
                </div>

                <!-- begin:: Aside Secondary -->

                <!--<button class="k-aside-secondary-close k-hide " id="k_aside_secondary_close_btn"><i class="la la-close"></i></button>-->
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
                        <!---------------Quick Menu START------------->
                        <%--    <div class="k-grid__item k-aside-secondary__nav-foot">
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
                                                    <a href="#" class="k-nav__link">
                                                        <i class="k-nav__link-icon fa fa-donate"></i>
                                                        <span class="k-nav__link-text">Purchase Keen</span>
                                                    </a>
                                                </li>
                                                <li class="k-nav__item">
                                                    <a href="#" class="k-nav__link">
                                                        <i class="k-nav__link-icon fa fa-book"></i>
                                                        <span class="k-nav__link-text">Documentation</span>
                                                    </a>
                                                </li>
                                                <li class="k-nav__item">
                                                    <a href="#" class="k-nav__link">
                                                        <i class="k-nav__link-icon fa fa-charging-station"></i>
                                                        <span class="k-nav__link-text">Layout Builder</span>
                                                    </a>
                                                </li>
                                                <li class="k-nav__item">
                                                    <a href="#" class="k-nav__link" id="export_excel">
                                                        <i class="k-nav__link-icon fa fa-headset"></i>
                                                        <span class="k-nav__link-text">Theme Support</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>--%>
                        <!---------------Quick Menu END------------->
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


        <!-- begin::Global Config -->

        <!-------------Quick-Panel START-------------------->
        <%@include file="../Contractor/Tiles/RightSideNav.jsp" %>
        <!-------------Quick-Panel END-------------------->
        <script>
//            $(document).ready(function () {
            function paasEncryptedResponse() {
                var encryptStr = '<c:out value="${encResp}"></c:out>';
                 var dataMap = {};
            
                if (encryptStr == '') {
                    setInterval(decryptBankJson(), 5000);
                } else {
                    decryptBankJson();
                }
                function decryptBankJson() {
                    $.ajax({
                        url: "https://www.bsnleprocurement.com/payment_bsnl/home/decrypt_data",
                        data: {'encryptStr': encryptStr},
                        success: function (response) {
                            //     alert("response ::" + response);
                            var obj = JSON.parse(response);
                            
                            if (response != '') {
                             $.each(obj, function (key, value) {
                                dataMap[key] = value;
                                if(key == 'tracking_id'){
                                    $("#tracking_id").html(value);
                                 }
                                if(key == 'trans_date'){
                                    $("#trans_date").html(value);
                                 }
                                if(key == 'order_status'){
                                    $("#order_status").html(value);
                                 }
                                if(key == 'bank_ref_no'){
                                    $("#bank_ref_no").html(value);
                                 }
                             });
                                bankResponse();
                            }
                        }
                    });
                }
                function bankResponse() {
                    $.ajax({
                        url: "bankResponse",
                        data : {'resData':dataMap, 'encryptStr':encryptStr},
                        success: function (res) {
                                //     alert("con details: "+res);
                                var name = res.split(",")[0];
                                var orgName = res.split(",")[1];
                                name = name.split("[");
                                orgName = orgName.split("]");
                                $("#contName").html(name);
                                $("#contOrgName").html(orgName);
                        },
                        error: function (e) {
                         alert('Error: ' + e);
                       }
                    });
                }
            }
//            });
            </script>
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

            <script>
                function printTable() {
    //  //     alert("hello");
                    var divName = "printTable";

                    var printContents = document.getElementById(divName).innerHTML;
                    var originalContents = document.body.innerHTML;

                    document.body.innerHTML = printContents;

                    window.print();

                    document.body.innerHTML = originalContents;
                }
            </script>
        <%@include file="../Contractor/Tiles/jslink.jsp" %>
    </body>

    <!-- end::Body -->
</html>