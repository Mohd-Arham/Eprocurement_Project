<%-- 
Document   : new_livetenderauctioninfo
Created on : 27 Nov, 2018, 11:18:42 AM
Author     : Naina Jain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" ng-app="myApp">
    
    <!-- begin::Head -->
    <head>
       <%@include file="../Contractor/Tiles/csslink.jsp" %>  
        <style>
            .dataTables_wrapper .row:nth-child(1){
                display:none;
            }
        </style>
    </head>
    <!-- end::Head -->

    <!-- begin::Body -->
    <body onload="hideTableOnload();selectAllClick();radioClick();" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled"  ng-controller="myCtrl">

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
                                <h3 class="k-content__head-title">  Tender/Auction Purchase</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link"> Dashboards</a>

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
                       
                        </div>

                        <!-- end:: Content Head -->



                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->
<div class="row">
    <!--begin::Portlet-->
    <div class="col-lg-12">
        <div class="k-portlet">	
            <div class="k-portlet__body description_acc_tender">
                <form class="k-form border_boxesDiv">
<!--                                                <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                        <div class="k-portlet__head-label"> 
                            <h3 class="k-portlet__head-title">Search Live Tender </h3>
                        </div>

                    </div>-->
<div class="middle_radiobt">
    <div class="k-portlet__head"> 
        <div class="k-portlet__head-label">
                <h3 class="k-portlet__head-title">Search Live Tender/Auction</h3>
        </div>
        <div class="k-portlet__head-toolbar">
                <div class="k-radio-inline">
                    <label class="k-radio">
                    <input type="radio" id="liveTender" checked="checked" name="radio4"> Live Tender
                    <span></span>
                    </label>
                    <label class="k-radio">
                    <input type="radio" id="liveAuction"  name="radio4">Live Auction
                    <span></span>
`								</label>
                </div>
        </div>
        </div>
</div>
<!----------------------------liveTenderRadio start------------------------------------->
<div id="liveTenderRadio" style="border: none;">
<div class="form-group">
    <div class="row">
        <div class="col-lg-4"> 
            <select class="form-control" id="typeSelectId">
                <option value="-1">Type</option>
                <option>Tender</option>
                <option>Auction</option>
            </select> 
        </div>
        <div class="col-lg-4"> 
            <select class="form-control" id="deptSelectId">
                <option value="-1">Select Department</option> 
                <c:forEach var="deptList" items="${deptList}">
                    <option value="${deptList}">${deptList}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="col-lg-4"> 
            <input type="email" class="form-control" placeholder="NIT Number" id="nitNoId">
        </div>
    </div>
</div> 
<div class="form-group">
    <div class="row"> 
        <div class="col-lg-4"> 
            <input type="email" class="form-control" placeholder="Tender Number" id="tenderNoId"> 
        </div>
        <div class="col-lg-4"> 
            <select class="form-control" id="contClassSelectId">
                <option value="-1">Contactor Class</option>
                <c:forEach var="contClassList" items="${contClassList}">
                    <option value="${contClassList.contractorClass_id}">${contClassList.contractorClass_Name}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="col-lg-4"> 
            <select class="form-control" id="tenderCatSelectId">
                <option value="-1">Tender Categories</option>
                <c:forEach var="categoryList" items="${categoryList}">
                    <option value="${categoryList.tender_category_id}">${categoryList.tender_category_name}</option>
                </c:forEach>
            </select> 
        </div>
    </div>
</div>
<div class="form-group row">
    <div class="col-lg-4"> 
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
            <input type="text" class="form-control" placeholder="Estimate Value" aria-describedby="basic-addon1" id="pacId">
        </div> 
    </div>
    <div class="col-lg-4"> 
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
            <input type="text" class="form-control" placeholder="EMD Value " aria-describedby="basic-addon1" id="emdId">
        </div> 
    </div>
    <div class="col-lg-4"> 
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
            <input type="text" class="form-control" placeholder="Tender Fees " aria-describedby="basic-addon1" id="tenderFeeId">
        </div> 
    </div>

</div>

<div class="form-group row">
    <div class="col-lg-4"> 
        <select class="form-control" id="selectiveTenderId">
            <option value="-1">Selective Tender</option>
            <c:forEach var="SelectiveTenderList" items="${SelectiveTenderList}">
                <option value="${SelectiveTenderList.selectiveTender_id}">${SelectiveTenderList.selectivetender_Name}</option>
            </c:forEach>
        </select> 
    </div>
    <div class="col-lg-4"> 
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="la la-calendar-o"></i></span></div>
            <input type="text" class="form-control" placeholder="Start Date of Purchase" aria-describedby="basic-addon1" id="filter-date">
        </div> 
    </div>
    <div class="col-lg-4">    
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="la la-calendar-o"></i></span></div>
            <input type="text" class="form-control" placeholder="Last Date of Purchase " aria-describedby="basic-addon1" id="filter-date-2">
        </div> 
    </div>
</div>
<div class="form_group text-center">
    <button type="button" id="tenderSearchId" class="btn btn-sm btn-elevate btn-brand" onclick="searchLive()" >Search</button>
    <button type="button" class="btn btn-sm btn-elevate btn-secondary">Reset</button>
</div>
</div>
<!----------------------------liveTenderRadio END------------------------------------->
<!----------------------------liveAuctionRadio start------------------------------------->
<div id="liveAuctionRadio" style="display: none;border: none;">
<div class="form-group">
    <div class="row">
        <div class="col-lg-4"> 
            <select class="form-control" id="typeAucSelectId">
                <option value="-1">Type</option>
                <option>Tender</option>
                <option>Auction</option>
            </select> 
        </div>
        <div class="col-lg-4"> 
            <select class="form-control" id="deptAucSelectId">
                <option value="-1">Select Department</option> 
                <c:forEach var="deptList" items="${deptList}">
                    <option value="${deptList}">${deptList}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="col-lg-4"> 
            <input type="email" class="form-control" placeholder="Auction Dispatch Number" id="aucDispId">
        </div>
    </div>
</div> 
<div class="form-group">
    <div class="row"> 
          <div class="col-lg-4"> 
            <select class="form-control" id="auctionPattSelectId">
                <option value="-1">Auction Pattern</option>
                <option>Forward Auction</option>
                <option>Reverse Auction</option>               
            </select> 
    </div> 
        <div class="col-lg-4"> 
            <input type="email" class="form-control" placeholder="Auction Number" id="auctionNoId"> 
        </div>
        <div class="col-lg-4"> 
            <select class="form-control" id="auctionCatSelectId">
                <option value="-1">Auction Categories</option>
                <c:forEach var="categoryList" items="${categoryList}">
                    <option value="${categoryList.tender_category_name}">${categoryList.tender_category_name}</option>
                </c:forEach>
            </select> 
        </div>
    </div>
</div>
<div class="form-group row">
  <div class="col-lg-4"> 
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
            <input type="text" class="form-control" placeholder="Auction Fees " aria-describedby="basic-addon1" id="auctionFeeId">
        </div> 
    </div>
    <div class="col-lg-4"> 
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="la la-calendar-o"></i></span></div>
            <input type="text" class="form-control" placeholder="Start Date of Purchase" aria-describedby="basic-addon1" id="filter-date">
        </div> 
    </div>
    <div class="col-lg-4">    
        <div class="input-group">
            <div class="input-group-prepend"><span class="input-group-text"><i class="la la-calendar-o"></i></span></div>
            <input type="text" class="form-control" placeholder="Last Date of Purchase " aria-describedby="basic-addon1" id="filter-date-2">
        </div> 
    </div>
</div>
<div class="form_group text-center">
    <button type="button" id="aucSearchId" class="btn btn-sm btn-elevate btn-brand" onclick="searchLiveAuction()" style="display: none">Search</button>
    <button type="button" class="btn btn-sm btn-elevate btn-secondary">Reset</button>
</div>
            </div>
<!----------------------------liveAuctionRadio END------------------------------------->

   
</form>

                                            <div class="accordion accordion-outline" id="accordionExample3">
                                           <table class="table table-striped- table-bordered table-hover tenderData" id="internalSearch"> 
                                                    <thead>
                                                        <tr class="group tbl_row_bg">
                                                            <td colspan="10" class="clearfix tbl_td_bg">
                                                                <span class="pull-left tbl_head">Live Tender / Auction</span>
                                                                <button type="button" id="allSelectedToCarthidden" style="display: none;" onclick="addToCartAll();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button>
                                                                <button type="button" id="selectedTenderToCarthidden" style="display: none;" onclick="addToCartSelectedTenderAction();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button></td></tr>
                                                        <tr>
                                                            <th><label class="k-checkbox k-checkbox--single k-checkbox--brand">
                                                                    <input type="checkbox" id="selectAllSearch" value="${tenderIdList}${auctionIdList}" class="k-group-checkable">
                                                                    <span></span>
                                                                </label></th>
                                                            <th>Type</th>
                                                            <th>Tender/Auction</th>
                                                            <th>Department Name</th>
                                                            <th>Document Fees</th>
                                                            <th>Portal Charge</th>
                                                            <th>More Details</th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody id="contentSearch"></tbody>
                                                    <tbody id="contentSearchs"></tbody>
                                                </table>              
                                                <table class="table table-striped- table-bordered table-hover tenderData" id="tableSearch"> 
                                                    <thead>
                                                        <tr class="group tbl_row_bg">
                                                            <td colspan="10" class="clearfix tbl_td_bg">
                                                                    <span class="pull-left tbl_head">Live Tender / Auction</span>
                                                                <button type="button" id="allSelectedToCart" style="display: none;" onclick="addToCartAll();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button>
                                                                <button type="button" id="selectedTenderToCart" style="display: none;"  onclick="addToCartSelectedTenderAction();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button></td></tr>
                                                        <tr>
                                                            <th><label class="k-checkbox k-checkbox--single k-checkbox--brand">
                                                                    <input type="checkbox" id="selectAll" value="${tenderIdList}${auctionIdList}" class="k-group-checkable">
                                                                    <span></span>
                                                                </label></th>
                                                            <th>Type</th>
                                                            <th>Tender/Auction</th>
                                                            <th>Department Name</th>
                                                            <th>Document Fees</th>
                                                            <th>Portal Charge</th>
                                                            <th>More Details</th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>                                                        
                                                        <c:forEach var="tenderList" items="${tenderList}">  
                                                            <tr>
                                                                <td>
                                                                    <label class="k-checkbox k-checkbox--single k-checkbox--brand">
                                                                        <input type="checkbox" class="k-group-checkable" id="checkboxvalue${tenderList.tender_Id}" name="options[]" value="${tenderList.tender_Id}" onclick="checkboxWithIdTender('${tenderList.tender_Id}')">
                                                                        <span></span>
                                                                    </label>
                                                                </td>
                                                                <td>${tenderRole}</td>
                                                                <td>${tenderList.tenderNumber}</td>
                                                                <td>${tenderList.deptName}</td>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${tenderList.tenderFeeInFig}</span></td>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${tenderList.portalCharge}</span></td>
                                                                <td>
                                                                    <a href="viewTenderAllDetails?tender_Id=${tenderList.tender_Id}" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>Details</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach var="auctionList" items="${auctionList}">  
                                                            <tr>
                                                                <td><label class="k-checkbox k-checkbox--single k-checkbox--brand">
                                                                        <input type="checkbox" class="k-group-checkable" id="checkboxvalue${auctionList.auctionId}" name="options[]" value="${auctionList.auctionId}" onclick="checkboxWithIdAuction('${auctionList.auctionId}')">
                                                                        <span></span>
                                                                    </label></td>
                                                                <td>${auctionRole}</td>
                                                                <td>${auctionList.auctionnumber}</td>
                                                                <td>${auctionList.deptName}</td>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${auctionList.auctionFees}</span></td>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${auctionList.portalCharge}</span></td>
                                                                <td>
                                                                    <a href="#" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>Details</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    <td colspan="9"><h4 align="center" style="color: red">${NODataMsg}</h4></td>
                                                    </tbody> 
                                                     <tr class="group tbl_row_bg">
                                                            <td colspan="10" class="clearfix tbl_td_bg">
                                                                <button type="button" id="allSelectedToCarthidden" style="display: none;" onclick="addToCartAll();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button>
                                                                <button type="button" id="selectedTenderToCarthidden" style="display: none;" onclick="addToCartSelectedTenderAction();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button>
                                                     <button type="button" id="allSelectedToCart2" style="display: none;" onclick="addToCartAll();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button>
                                                                <button type="button" id="selectedTenderToCart2" style="display: none;"  onclick="addToCartSelectedTenderAction();" class="btn btn-sm btn-elevate btn-brand pull-right">
                                                                    <i class="la la-plus-circle"></i>Add to Purchase
                                                                </button>
                                                            </td>
                                                     </tr>
                                                </table>
                                                    
                                                     
                                                    


                                                <!--end: Datatable -->

                                            </div>
                                        </div>         
                                    </div>
                                    <!--end::Portlet-->

                                </div>

                                <!--end::Row-->
                             </div>
                    <!-- end:: Content Body -->
                </div>
                    </div>
                     <!-- end:: Content -->
                     <!-- begin:: Footer -->
              <%--       <%@include  file="../Contractor/Tiles/Footer.jsp" %>   --%>  
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
 <!---End-Modal-Tab-Upload-Documents---> 

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
                /*jslint browser:true*/
                /*global jQuery, document*/

                jQuery(document).ready(function () {
                    'use strict';

                    jQuery('#filter-date, #filter-date-2, #search-from-date, #search-to-date').datetimepicker();
                });
            </script>          
            <script type="text/javascript">
                function selectAllClick() {
                    // $("table.table td a.edit").css("cursor", "no-drop");
                    // Activate tooltip
                    $('[data-toggle="tooltip"]').tooltip();
                    // Select/Deselect checkboxes
                    var checkbox = $('table tbody input[type="checkbox"]');
                    $("#selectAll").click(function () {                        
                        if (this.checked) {
                            checkbox.each(function () {
                                this.checked = true;
                                $("#allSelectedToCart").show();
                                $("#allSelectedToCart2").show();
                                $("#allSelectedToCarthidden").show();
                                $("#selectedTenderToCart").hide();
                                $("#selectedTenderToCarthidden").hide();
                            });
                        } else {
                            checkbox.each(function () {
                                this.checked = false;
                                $("#allSelectedToCart").hide();
                                $("#allSelectedToCart2").hide();
                                $("#allSelectedToCarthidden").hide();
                            });
                        }
                    });
                    checkbox.click(function () {
                        if (!this.checked) {
                            $("#selectAll").prop("checked", false);
                        }
                    });
                }
            </script>

            <script>
                var tender_Idvalues = new Array();
                tender_Idvalues.push('');
                var auctionIdvalues = new Array();
                auctionIdvalues.push('');
                function checkboxWithIdTender(tender_Id) {
                    if ($("#checkboxvalue" + tender_Id).prop("checked") == true) {
                        tender_Idvalues.push(tender_Id);
                    } else {
                        tender_Idvalues.splice($.inArray(tender_Id, tender_Idvalues), 1);
                    }
                    // alert("tender_Idvalues " + tender_Idvalues);
                    var number_checked = $('input[type="checkbox"]:checked').length;
                    if (number_checked > 1) {
                        $("#selectedTenderToCart").show();
                        $("#selectedTenderToCarthidden").show();
                        $("#allSelectedToCart").hide();
                        $("#allSelectedToCart2").hide();
                        $("#allSelectedToCarthidden").hide();
                    } else if (number_checked == 1) {
                        $("#allSelectedToCart").hide();
                        $("#allSelectedToCart2").hide();
                        $("#allSelectedToCarthidden").hide();
                        $("#selectedTenderToCart").show();
                        $("#selectedTenderToCarthidden").show();
                    }
                }
                function checkboxWithIdAuction(auctionId) {
//                    // alert("func called "+auctionId);                    
                    if ($("#checkboxvalue" + auctionId).prop("checked") == true) {
                        auctionIdvalues.push(auctionId);
                    } else {
                        auctionIdvalues.splice($.inArray(auctionId, auctionIdvalues), 1);
                        $("#allSelectedToCart").hide();
                        $("#allSelectedToCart2").hide();
                        $("#allSelectedToCarthidden").hide();
                    }
                    // alert("auctionIdvalues " + auctionIdvalues);
                    var number_checked = $('input[type="checkbox"]:checked').length;
                    if (number_checked > 1) {
                        // alert("skkkkkkkk");
//                        document.getElementById("selectedTenderToCart").style.display = "block";
//                       $("#selectedTenderToCart").css('display','block');
                         $("#selectedTenderToCart").show();
                         $("#selectedTenderToCarthidden").show();
                        $("#allSelectedToCart").hide();
                        $("#allSelectedToCart2").hide();
                        $("#allSelectedToCarthidden").hide();
                    } else if (number_checked == 1) {
                        // alert("nnnnnnnnn");
                        $("#allSelectedToCart").hide();
                        $("#allSelectedToCart2").hide();
                        $("#allSelectedToCarthidden").hide();
                           $("#selectedTenderToCart").show();
                           $("#selectedTenderToCarthidden").show();
//                        document.getElementById("selectedTenderToCart").style.display = "block";
                    }
                }

                var tenderIdListVal = '<c:out value="${tenderIdList}"></c:out>';
                var auctionIdListVal = '<c:out value="${auctionIdList}"></c:out>';
                var tenderRole = '<c:out value="${tenderRole}"></c:out>';
                var auctionRole = '<c:out value="${auctionRole}"></c:out>';
                function addToCartSelectedTenderAction() {
                    var tenderIdList = tender_Idvalues;
                    var auctionIdList = auctionIdvalues;
                    // alert("tenderIdList in addToCartSelectedTenderAction " + tenderIdList);
                    // alert("auctionIdList in addToCartSelectedTenderAction " + auctionIdList);
                    window.location = 'addToPurchaseAll?tenderIdListVal=' + tenderIdList + "&auctionIdListVal=" + auctionIdList + "&tenderRole=" + tenderRole + "&auctionRole=" + auctionRole;
                }
                function addToCartAll() {
                    window.location = 'addToPurchaseAll?tenderIdListVal=' + tenderIdListVal + "&auctionIdListVal=" + auctionIdListVal + "&tenderRole=" + tenderRole + "&auctionRole=" + auctionRole;
                }
                </script>
                <script>
                  function hideTableOnload() {
                        $("#tableSearch").hide();
                        $("#internalSearch").hide();
                        var liveFound = '<c:out value="${NODataMsg}"></c:out>';
                        if (liveFound != "") {
                            $('#allSelectedToCart').css('cursor', 'no-drop');
                            $('#allSelectedToCarthidden').css('cursor', 'no-drop');
                            $('#selectedTenderToCart').css('cursor', 'no-drop');
                            $('#selectedTenderToCarthidden').css('cursor', 'no-drop');
                        }
                    }
            </script>
            <script>
                function radioClick(){
            $("#liveTender").click(function (){
                $("#liveAuctionRadio").hide();               
                $("#liveTenderRadio").show();
                 $("#aucSearchId").hide();
                $("#tenderSearchId").show();
                
            });
            $("#liveAuction").click(function (){
                $("#liveTenderRadio").hide();
                $("#liveAuctionRadio").show();
                 $("#tenderSearchId").hide();
                 $("#aucSearchId").show();
            });
        }
            </script>
<script>
    function searchLiveAuction() {
         var type = $("#typeAucSelectId").val();
        var deptName = $("#deptAucSelectId").val(); 
           if((type == "-1") && (deptName == "-1")){
         $("#tableSearch").show();
           } else{
              $.ajax({
                url: "liveAucOnSearch",
                data: {'type': type, 'deptName': deptName},
                  success: function (response) {
                      // alert(response);
                    $("#contentSearch").html("");
                    $("#contentSearchs").html("");
                    $("#tableSearch").hide();
                    $("#internalSearch").show();
                      $.each(JSON.parse(response), function (key, value) {
                     console.log(key+" : "+value);
                       $.each(JSON.parse(JSON.stringify(value)), function (key, value) {
                           console.log(key+" : "+value);  
       var htmls = '<tr>\n\
                    <td><label class="k-checkbox k-checkbox--single k-checkbox--brand"><input type="checkbox" class="k-group-checkable" id="checkboxvalue' + value["auctionId"] + '" name="options[]" value="' + value["auctionId"] + '" onclick="checkboxWithIdTender(' + value["auctionId"] + ')"><span></span></label></td >\n\
                    <td>Auction</td >\n\
                    <td>' + value["auctionnumber"] + '</td >\n\
                    <td>' + value["deptName"] + '</td >\n\
                    <td><span class="rs_ic"><i class="la la-rupee"></i>' + value["auctionFees"] + '</span></td >\n\
                    <td><span class="rs_ic"><i class="la la-rupee"></i>' + value["portalCharge"] + '</span></td >\n\
                    <td><a href="#" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>Details</a></td >\n\\n\
</tr>';
                          $("#contentSearchs").append(htmls);                                                   
                     
                       
                        $("#selectAllSearch").click(function () {
                            var checkbox = $('#checkboxvalue' + value["tender_Id"]);
                            if (this.checked) {
                                checkbox.each(function () {
                                    this.checked = true;
                                    $("#allSelectedToCart").show();
                                    $("#allSelectedToCart2").show();
                                    $("#allSelectedToCarthidden").show();
                                    $("#selectedTenderToCart").hide();
                                    $("#selectedTenderToCarthidden").hide();
                                });
                            } else {
                                checkbox.each(function () {
                                    this.checked = false;
                                    $("#allSelectedToCart").hide();
                                    $("#allSelectedToCart2").hide();
                                    $("#allSelectedToCarthidden").hide();
                                });
                            }
                        });
                        checkbox.click(function () {
                            if (!this.checked) {
                                $("#selectAllSearch").prop("checked", false);
                            }
                        });
                     }); 
                 });
                  }
        });
      }
    }
    function searchLive() {
        var type = $("#typeSelectId").val();
        var deptName = $("#deptSelectId").val();
        var nitNumber = $("#nitNoId").val();
        var tender_Number = $("#tenderNoId").val();
        var contractorClass = $("#contClassSelectId").val();
        var tenderCategory = $("#tenderCatSelectId").val();
        var estimateValueInFig = $("#pacId").val();
        var emdInFig = $("#emdId").val();
        var tenderFeeInFig = $("#tenderFeeId").val();
        var selectiveTender = $("#selectiveTenderId").val();
        var filter_date = $("#filter-date").val();
        var filter_date_2 = $("#filter-date-2").val();
//        // alert("deptName " + deptName);
        if((type == "-1") && (deptName == "-1") && nitNumber == "" && tender_Number == "" && 
                (contractorClass == "-1") && (tenderCategory == "-1") && estimateValueInFig == "" &&
                emdInFig == "" && tenderFeeInFig == "" && (selectiveTender == "-1") && 
                filter_date == "" && filter_date_2 == ""){
//             // alert("if part");
         $("#tableSearch").show();
        } else{
//            // alert("else part");
            $.ajax({
                url: "liveOnSearch",
                data: {'type': type, 'deptName': deptName, 'nitNumber': nitNumber,
                'tender_Number': tender_Number, 'contractorClassId': contractorClass,
                'tenderCategoryId': tenderCategory, 'estimateValueInFig': estimateValueInFig,
                'emdInFig': emdInFig, 'tenderFeeInFig': tenderFeeInFig,'selectiveTenderId': selectiveTender,
                'startDate': filter_date, 'endDate': filter_date_2},
            success: function (response) {
                $("#contentSearch").html("");
                $("#contentSearchs").html("");
                
                $("#tableSearch").hide();
                $("#internalSearch").show();
                $.each(JSON.parse(response), function (key, value) {
                     console.log(key+" : "+value);
                       $.each(JSON.parse(JSON.stringify(value)), function (key, value) {
                           console.log(key+" : "+value);  
        var html = '<tr>\n\
            <td><label class="k-checkbox k-checkbox--single k-checkbox--brand"><input type="checkbox" class="k-group-checkable" id="checkboxvalue' + value["tender_Id"] + '" name="options[]" value="' + value["tender_Id"] + '" onclick="checkboxWithIdTender(' + value["tender_Id"] + ')"><span></span></label></td >\n\
            <td>Tender</td >\n\
            <td>' + value["tenderNumber"] + '</td >\n\
            <td>' + value["deptName"] + '</td >\n\
            <td><span class="rs_ic"><i class="la la-rupee"></i>' + value["tenderDocumentFees"] + '</span></td >\n\
            <td><span class="rs_ic"><i class="la la-rupee"></i>' + value["portalCharge"] + '</span></td >\n\
            <td><a href="#" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>Details</a></td >\n\\n\
</tr>';
                            $("#contentSearch").append(html);
                          var checkbox = $('#checkboxvalue' + value["tender_Id"]);
                        $ ("#selectAllSearch").click(function () {
                            if (this.checked) {
                                checkbox.each(function () {
                                    this.checked = true;
                                    $("#allSelectedToCart").show();
                                    $("#allSelectedToCart2").show();
                                    $("#allSelectedToCarthidden").show();
                                    $("#selectedTenderToCart").hide();
                                    $("#selectedTenderToCarthidden").hide();
                                });
                            } else {
                                checkbox.each(function () {
                                    this.checked = false;
                                    $("#allSelectedToCart").hide();
                                    $("#allSelectedToCart2").hide();
                                    $("#allSelectedToCarthidden").hide();
                                });
                            }
                        });
                        checkbox.click(function () {
                            if (!this.checked) {
                                $("#selectAllSearch").prop("checked", false);
                            }
                        });
                         }); 
                   
                 });
               }
            });
            }
         }
</script>
<%@include file="../Contractor/Tiles/jslink.jsp" %>
    </body>
    <!-- end::Body -->

</html>
