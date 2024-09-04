<%-- 
    Document   : new_viewpurchasealltenderauction
    Created on : 4 Dec, 2018, 12:21:40 PM
    Author     : Naina Jain

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en" ng-app="myApp">

<!-- begin::Head -->

<head>
     <%@include  file="../Contractor/Tiles/csslink.jsp" %>  
    <style>
	.dataTables_wrapper .row:nth-child(1){
	display:none;
	}
  </style>
	</head>
<!-- end::Head -->

<!-- begin::Body -->
<body onload="cartDataFound();" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">
  
    <!-- begin:: Page -->

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
                    <%@include  file="../Contractor/Tiles/Header.jsp" %>     
                     <!-- end:: Header -->
                     

                <!-- begin:: Content -->
                <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                    <!-- begin:: Content Head -->
                    <div class="k-content__head	k-grid__item">
                        <div class="k-content__head-main">
                            <h3 class="k-content__head-title">Cart</h3>
                            <div class="k-content__head-breadcrumbs">
                                <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                <span class="k-content__head-breadcrumb-separator"></span>
                                <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                            </div>
                        </div>
                        <div class="k-content__head-toolbar">
                            <div class="k-content__head-toolbar-wrapper"> 
                                <a href="#" class="btn btn-sm btn-elevate btn-danger"  data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                    <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp;
                                    <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16</span>
                                    <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- end:: Content Head -->

                 

<!-- begin:: Content Body -->
 <form method="post" name="customerData" action="http://14.192.19.132:22222/payment_bsnl/home/request_data">
<div class="k-content__body	k-grid__item k-grid__item--fluid">

    <!--begin::Row-->
    <div class="row">
<!--begin::Portlet-->
<div class="col-lg-12">
   <div class="k-portlet">	
    <div class="k-portlet__body description_acc_tender">

<div class="accordion accordion-outline" id="accordionExample3">
   
<table class="table table-striped- table-bordered table-hover tenderData"> 
<thead>
 <tr class="group tbl_row_bg"><td colspan="10" class="clearfix tbl_td_bg"><span class="pull-left tbl_head">Tender / Auction In Cart</span>
         <button type="button" class="btn btn-sm btn-elevate btn-brand pull-right" id="emptyCartBtn" onclick="removeAll();">
        <i class="la la-minus-circle"></i>Empty Cart
</button></td></tr>
        <tr>
                <th>Type</th>
                <th>Tender/Auction</th>
                <th>Department Name</th>
                <th>Document Fees</th>
                <th>Portal Charge</th>
            <th>GST (18%)</th>
                 <th>Total (Include Tax)</th>
                <th>More Details</th>
                <th>Remove</th> 
        </tr>
</thead>
<tbody>
   <c:forEach var="tenderList" items="${tenderList}" varStatus="loopCounterOuter">                            
        <tr> 
        <td>${tenderRole}</td>
        <td>${tenderList.tenderNumber}</td>
        <td>${tenderList.deptName}</td>
        <td><span class="rs_ic"><i class="la la-rupee"></i>${tenderList.tenderFeeInFig}</span></td>
        <td><span class="rs_ic"><i class="la la-rupee"></i>${tenderList.portalCharge}</span></td>
        <td><span class="gst">18</span></td>
        <td><span class="Include_Tax">
              <c:forEach var="tntotaldocfeewithtaxList" items="${tntotaldocfeewithtaxList}" varStatus="loopCounterInner" >  
                    <c:if test="${loopCounterOuter.count == loopCounterInner.count}">
                        <c:out value="${tntotaldocfeewithtaxList}"/>
                    </c:if>
                </c:forEach>            
            </span></td>
           <td>
                <a href="viewTenderAllDetails?tender_Id=${tenderList.tender_Id}" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>Details</a>
            </td>
        <td>
        <a href="#" class="btn btn-hover-danger btn-icon btn-pill">
<i class="la la-trash" id="purchaseid${tenderList.tender_Id}" onclick="removeParticularTenderAction('${tenderList.tender_Id}');"></i>
</a>
</td>
</tr>
</c:forEach>
<c:forEach var="auctionList" items="${auctionList}" varStatus="loopCounterOuters" >                            
        <tr> 
        <td>${auctionRole}</td>
        <td>${auctionList.auctionnumber}</td>
        <td>${auctionList.deptName}</td>
        <td><span class="rs_ic"><i class="la la-rupee"></i>${auctionList.auctionFees}</span></td>
        <td><span class="rs_ic"><i class="la la-rupee"></i>${auctionList.portalCharge}</span></td>
        <td><span class="gst">18</span></td>
        <td><span class="Include_Tax">
                <c:forEach var="antotaldocfeewithtaxList" items="${antotaldocfeewithtaxList}" varStatus="loopCounterIntoInner" >  
                    <c:if test="${loopCounterOuters.count == loopCounterIntoInner.count}">
                        <c:out value="${antotaldocfeewithtaxList}"/>
                    </c:if>
                </c:forEach>    
            </span></td>
        <td>
        <a href="viewCreatedTenderDetails" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>Details</a>
        </td>
        <td>
        <a href="#" class="btn btn-hover-danger btn-icon btn-pill">
<i class="la la-trash" id="purchaseid${auctionList.auctionId}" onclick="removeParticularAuctionAction('${auctionList.auctionId}');"></i>
</a>
                </td>
                </tr>
                </c:forEach> 
<td colspan="9"><h4 align="center" style="color: red">${notenderavail}</h4></td>
                <tr class="tbl_row_bg"> 
        <td colspan="6"><b>Grand Total</b></td>
                <td colspan="4"><span class="total_Tax"><b>${grandtotaldocfeewithtax}</b></span></td> 
                </tr>
</tbody>
</table>
                       <input type="hidden" name="merchant_id" value="198981"/>
                       <input type="hidden" name="order_id" value="${orderId}"/>
                       <input type="hidden" name="amount" value="1.00"/>
                       <input type="hidden" name="currency" value="INR"/>
                       <input type="hidden" name="redirect_url" value="http://localhost:8084/NewEprocurement/paymentResponse"/>
                       <input type="hidden" name="cancel_url" value="http://localhost:8084/NewEprocurement/liveTenderAuction"/>
                       <input type="hidden" name="language" value="EN"/>
                       <input type="hidden" name="billing_name" value="Charli"/>
                       <input type="hidden" name="billing_address" value="Room no 1101, near Railway station Ambad"/></td>
                       <input type="hidden" name="billing_city" value="Indore"/>
                       <input type="hidden" name="billing_state" value="MP"/>
                       <input type="hidden" name="billing_zip" value="425001"/>
                       <input type="hidden" name="billing_country" value="India"/>
                       <input type="hidden" name="billing_tel" value="9876543210"/>
                       <input type="hidden" name="billing_email" value="test@test.com"/>
                       <input type="hidden" name="delivery_name" value="Chaplin"/>
                       <input type="hidden" name="delivery_address" value="room no.701 near bus stand"/>
                       <input type="hidden" name="delivery_city" value="Hyderabad"/>
                       <input type="hidden" name="delivery_state" value="Andhra"/>
                       <input type="hidden" name="delivery_zip" value="425001"/>
                       <input type="hidden" name="delivery_country" value="India"/>
		       <input type="hidden" name="delivery_tel" value="9876543210"/>
		       <input type="hidden" name="merchant_param1" value="1"/>
		       <input type="hidden" name="merchant_param2" value="2"/>
		       <input type="hidden" name="merchant_param3" value="3"/>
                       <input type="hidden" name="merchant_param4" value="4"/>
                       <input type="hidden" name="merchant_param5" value="5"/>
                       <input type="hidden" name="promo_code" value=""/>
                       <input type="hidden" name="customer_identifier" value=""/>
<span class="proceed_pay pull-right">
    <input type="submit" href="javascript:void(0);" onclick="payment();" class="btn btn-sm btn-elevate btn-success" id="proToPay" value=">> Proceed to pay">
<!--    <a href="#" class="btn btn-sm btn-elevate btn-success" id="proToPay" onclick="payment();">
        <i class="la la-mail-forward"></i>Proceed to pay-->
</a></span>            
</div>
                       <input type="button" onclick="paymentDone();" class="btn btn-sm btn-elevate btn-success" id="proToPay" value=">> Payment Done Button">
<!--end: Datatable -->

</div>
                             </div>         
						</div>
                            <!--end::Portlet-->

                        </div>

                        <!--end::Row-->
                    </div>
</form>
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
                                                <input type="hidden" class="form-control" placeholder="321,999.99">
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
                                                <input type="hidden" class="form-control" placeholder="Units" aria-describedby="basic-addon1">
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
                <input type="hidden" class="form-control" id="recipient-name" placeholder="Template Name">
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

 <!-------------Quick-Panel START-------------------->
 <%@include file="../Contractor/Tiles/RightSideNav.jsp" %>
 <!-------------Quick-Panel END-------------------->
 
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
$(document).ready(function() {
    $('.tenderData').DataTable();
} );
</script>
 <script type="text/javascript">
        $(document).ready(function () {
//            $("table.table td a.delete").css("cursor", "no-drop");
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();
            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
//                        $("#allSelectedToCart").show();
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
//                        $("#allSelectedToCart").hide();
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>

    <script>
        var tenderIdListVal = '<c:out value="${tenderIdList}"></c:out>';
        var auctionIdListVal = '<c:out value="${auctionIdList}"></c:out>';
        var tenderRole = '<c:out value="${tenderRole}"></c:out>';
        var auctionRole = '<c:out value="${auctionRole}"></c:out>';
        function removeParticularTenderAction(tender_Id) {
            //alert("inside function")
            var confirm_msg = confirm("Are you sure you want to Remove this Tender?");
            if (confirm_msg == true) {
                //alert("tender id is :: " + tender_Id);
                
window.location = 'http://localhost:8084/NewEprocurement/removeselectedtender?tender_Id=' + tender_Id + "&tenderIdListVal=" + tenderIdListVal + "&auctionIdListVal=" + auctionIdListVal + "&tenderRole=" + tenderRole + "&auctionRole=" + auctionRole;
            }
        }
        function removeParticularAuctionAction(auctionId) {
            var confirm_msg = confirm("Are you sure you want to Remove this Auction?");
            if (confirm_msg == true) {
               // alert("Auction id is :: " + auctionId);
                window.location = 'http://localhost:8084/NewEprocurement/removeselectedauction?auctionId=' + auctionId + "&tenderIdListVal=" + tenderIdListVal + "&auctionIdListVal=" + auctionIdListVal + "&tenderRole=" + tenderRole + "&auctionRole=" + auctionRole;

            }
        }
        function removeAll() {
            var confirm_msg = confirm("Are you sure you want to Remove All Tender?");
            if (confirm_msg == true) {
                window.location = 'http://localhost:8084/NewEprocurement/removeAll?tenderIdListVal=' + tenderIdListVal + "&auctionIdListVal=" + auctionIdListVal + "&tenderRole=" + tenderRole + "&auctionRole=" + auctionRole;
            }
        }
        function payment() {
//            alert("func pay called");
             $.ajax({                            
                   url:"proceedtopayment", 
                   success:function (response){
//                       alert("res "+response);
                   }
               });         
        }
        function paymentDone() {
//            alert(" pay Done called");
             $.ajax({                            
                   url:"proceedDone", 
                   success:function (response){
                       alert("res "+response);
                   }
               });         
        }

    </script>
    <script>
    function cartDataFound(){
          var cartFound = '<c:out value="${notenderavail}"></c:out>';
          if(cartFound != ""){
              $('#emptyCartBtn').css( 'cursor', 'no-drop' );
              $('#proToPay').css( 'cursor', 'no-drop' );
          }
      }
    </script>
     <%@include file="../Contractor/Tiles/jslink.jsp" %>
</body>
<!-- end::Body -->

</html>