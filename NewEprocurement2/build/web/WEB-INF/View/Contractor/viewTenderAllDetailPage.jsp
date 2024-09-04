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
    <body onload="hideTableOnload()" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled"  ng-controller="myCtrl">

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
                                <h3 class="k-content__head-title"> Details </h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link"> Dashboards</a>

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
                            <div class="k-content__head-toolbar">
                                <div class="k-content__head-toolbar-wrapper"> 
                                    <a href="#" class="btn btn-sm btn-elevate btn-danger"  data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                        <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp;
                                        <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16 </span>
                                        <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- end:: Content Head -->



                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <div class="container">
                                <div class="devider_boxed border_boxesDiv">
                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-information"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Information
                                                <!-- <small>some sub title</small> -->
                                            </h3>
                                        </div>
                                    </div>
                                    <!-- <div class="k-content__head-main"> -->
                                    <!-- <h3 class="tender_head text-white">Tender Information</h3>  -->
                                    <!-- </div> -->
                                    <table class="table table-striped- table-bordered table-hover table-checkable ">
                                        <tbody>
                                            <tr>
                                                <th><span class="dwn_arrow">Tender Number</span></th>
                                                <td><c:out value="${tender.tenderNumber}"/></td>
                                                <th><span class="dwn_arrow">NIT Number</span></th>
                                                <td><c:out value="${tender.nitNumber}"/></td>
                                                <th><span class="dwn_arrow">NIT Date</span></th>
                                                <td><c:out value="${tender.nitDate}"/></td>
                                            </tr>

                                            <!--                        <tr>
                                                                        <th><span class="dwn_arrow">Portal Charge (In figure)</span></th>
                                                                        <td><span class="rs_ic"><i class="fa fa-rupee"></i>100000</span></td>
                                                                        <th><span class="dwn_arrow">Portal Charge (In words)</span></th>
                                                                        <td colspan="3"><span class="rs_ic"><i class="fa fa-rupee"></i>one thousand one hundred eighty only</span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th><span class="dwn_arrow">Pre-Bid Meeting Date & Time</span></th>
                                                                        <td><span class="rs_ic">31-10-2018 04:30 PM</span></td>
                                                                        <th><span class="dwn_arrow">Pre-Bid Meeting Venue</span></th>
                                                                        <td colspan="3"><span class="rs_ic">    </span></td>
                                                                    </tr>-->
                                        </tbody>
                                    </table>

                                    <div class="edit_tender_bt">
                                        <%--  <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createTenderWizard" class="btn btn-primary btn-sm" onclick="$('#step1').click();" ng-click="fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit"></i>Edit</button> --%>
                                    </div> 
                                </div>

                                <div class="devider_boxed border_boxesDiv">
                                    <!-- <div class="k-content__head-main"> -->
                                    <!-- <h3 class="tender_head text-white">Tender Category</h3>  -->
                                    <!-- </div> -->
                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-layers"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Category
                                                <!-- <small>some sub title</small> -->
                                            </h3>
                                        </div>
                                    </div>
                                    <table class="table table-striped- table-bordered table-hover table-checkable ">
                                        <tbody>
                                            <tr>
                                                <th><span class="dwn_arrow">Tender Stage</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.tenderStageName}"/></span></td>
                                                <th><span class="dwn_arrow">Selective Tenderer</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.selectiveTenderName}"/></span></td>
                                            </tr>
                                            <tr>
                                                <th><span class="dwn_arrow">Tender Categories</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.tenderCategoryName}"/></span></td>
                                                <th><span class="dwn_arrow">Area of Work</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.areaOfWorkName}"/></span></td>
                                            </tr>
                                            <tr>
                                                <th><span class="dwn_arrow">Tender Keyword</span></th><c:if test="${tender.getTenderKeywordsNameList() != null}">
                                                    <td colspan="3"><span class="rs_ic"><c:forEach  var="keywords" items="${tender.getTenderKeywordsNameList()}">
                                                                ${keywords.getTenderKeyWordsName()},
                                                            </c:forEach></span></td></c:if> 
                                                </tr>

                                            <c:if test="${tender.getSelectiveTender().equalsIgnoreCase('3') || tender.getSelectiveTender().equalsIgnoreCase('4')}">                         
                                                <tr>
                                                    <th><span class="dwn_arrow">Empanel Contractor</span></th>
                                                        <c:if test="${tender.getEmpanelContractorList() != null}">
                                                        <td colspan="3"><span class="rs_ic"><c:forEach  var="contractor" items="${tender.getEmpanelContractorList()}">
                                                                    ${contractor.firstname}&nbsp;${contractor.lastname} ,
                                                                </c:forEach></span></td>
                                                            </c:if> 
                                                </tr>
                                            </c:if>

                                            <c:if test="${!tender.getTenderCategory().equalsIgnoreCase('2')}">
                                                <c:if test="${tender.getUploadSOR() != null}">
                                                    <tr>
                                                        <th><span class="dwn_arrow">SOR Document Label</span></th>
                                                        <td><span class="rs_ic">
                                                                <c:out value="${tender.getUploadSOR().fileName}"/>
                                                            </span></td>
                                                        <th><span class="dwn_arrow">SOR Document</span></th>
                                                        <td><span class="rs_ic">
                                                                <a href="${context}/<c:out value="${tender.getUploadSOR().fileconvertedName}"/>">View</a>
                                                            </span></td>
                                                    </tr>
                                                </c:if>                     
                                            </c:if>
                                            <c:out value="${tender.buyBackDocument}"/>                
                                            <c:if test="${tender.getTenderCategory().equalsIgnoreCase('2')}">
                                                <tr>    
                                                    <th><span class="dwn_arrow">Buy Back Document</span></th>
                                                    <td colspan="3"><span class="rs_ic">
                                                            <a href="${context}/<c:out value="${tender.buyBackDocument}"/>">View</a>
                                                        </span></td>
                                                </tr>
                                            </c:if>                       
                                            <tr>
                                                <th><span class="dwn_arrow">Tender Re-Bid</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.tenderRebid}"/></span></td>
                                                <th><span class="dwn_arrow">Tender Bid Withdraw</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.tenderBidWithdraw}"/></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                        <div class="edit_tender_bt">
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createTenderWizard" onclick="$('#step2').click();" ng-click="fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit"></i>Edit</button>
                                        </div>
                                    </c:if>
                                </div>

                                <div class="devider_boxed border_boxesDiv">
                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="la la-info-circle"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Details
                                                <!-- <small>some sub title</small> -->
                                            </h3>
                                        </div>
                                    </div>
                                    <!-- <div class="k-content__head-main"> -->
                                    <!-- <h3 class="tender_head text-white">Tender Details</h3>  -->
                                    <!-- </div> -->
                                    <table class="table table-striped- table-bordered table-hover table-checkable ">
                                        <tbody>
                                            <tr>
                                                <th><span class="dwn_arrow">Name Of Work</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.nameOfWork}"/></span></td>
                                                <th><span class="dwn_arrow">Short Description</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.descriptionOfWork}"/></span></td>
                                            </tr>
                                            <!--                        <tr>
                                                                        <th><span class="dwn_arrow">Short Description</span></th>
                                                                        <td colspan="3"><span class="rs_ic">dvfdg </span></td>
                                                                    </tr>
                                                                    <tr>-->
                                        <th><span class="dwn_arrow">Estimate Value (In figure)</span></th>
                                        <td><span class="rs_ic"><i class="fa fa-rupee"></i><c:out value="${tender.estimateValueInFig}"/></span></td>
                                        <th><span class="dwn_arrow">Estimate Value (In words)</span></th>
                                        <td colspan="3"><span class="rs_ic"><i class="fa fa-rupee"></i><c:out value="${tender.estimateValueInWord}"/></span></td>
                                        </tr>
                                        <tr>
                                            <th><span class="dwn_arrow">Tender Fees (In figure)</span></th>
                                            <td><span class="rs_ic"><i class="fa fa-rupee"></i><c:out value="${tender.tenderFeeInFig}"/></span></td>
                                            <th><span class="dwn_arrow">Tender Fees (In words)</span></th>
                                            <td colspan="3"><span class="rs_ic"><i class="fa fa-rupee"></i><c:out value="${tender.tenderFeeInWord}"/></span></td>
                                        </tr>
                                        <tr>
                                            <th><span class="dwn_arrow">Bid Validate Type</span></th>
                                            <td><span class="rs_ic"><c:out value="${tender.bidValidateType}"/></span></td>
                                            <th><span class="dwn_arrow">Bid Validate Period</span></th>
                                            <td colspan="3"><span class="rs_ic"><c:out value="${tender.bidValidatePeriod}"/></span></td>
                                        </tr>
                                        <tr>
                                            <th><span class="dwn_arrow">Work Completion Type</span></th>
                                            <td><span class="rs_ic"><c:out value="${tender.workCompletionType}"/></span></td>
                                            <th><span class="dwn_arrow">Work Completion Period</span></th>
                                            <td colspan="3"><span class="rs_ic"><c:out value="${tender.workCompletionPeriod}"/></span></td>
                                        </tr>
                                        <tr>
                                            <th colspan="2"><span class="dwn_arrow">Rainy Season</span></th>
                                            <td colspan="2"><span class="rs_ic"><c:out value="${tender.rainySeason}"/></span></td>
                                        </tr>
                                        <c:if test="${!tender.getTenderSelectedDivision().equalsIgnoreCase('0') || !tender.getTenderSelectedSubDivision().equalsIgnoreCase('0')}">
                                            <tr>
                                                <th><span class="dwn_arrow">Division</span></th>
                                                <td><span class="rs_ic"><c:out value="${tender.tenderSelectedDivision}"/></span></td>
                                                <th><span class="dwn_arrow">Sub Division</span></th>
                                                <td colspan="3"><span class="rs_ic"><c:out value="${tender.tenderSelectedSubDivision}"/></span></td>
                                            </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                    <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}"> 
                                        <div class="edit_tender_bt">
                                            <button type="reset" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createTenderWizard" onclick="$('#step3').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit"></i>Edit</button>
                                        </div>
                                    </c:if>
                                </div>

                                <div class="devider_boxed border_boxesDiv">
                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="la la-info-circle"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Bidder Details
                                                <!-- <small>some sub title</small> -->
                                            </h3>
                                        </div>
                                    </div>
                                    <!-- <div class="k-content__head-main"> -->
                                    <!-- <h3 class="tender_head text-white">Bidder Details</h3>  -->
                                    <!-- </div> -->
                                    <table class="table table-striped- table-bordered table-hover table-checkable ">
                                        <tbody>
                                            <tr>
                                                <th><span class="dwn_arrow">Envelope Type</span></th>
                                                <td colspan="2"><span class="rs_ic"><c:out value="${tender.envelopeTypeName}"/></span></td>
                                                <th><span class="dwn_arrow">Contractor Class</span></th>
                                                <td colspan="2"><span class="rs_ic"><c:out value="${tender.contractorClassName}"/></span></td>
                                            </tr>
                                            <tr>
                                                <th><span class="dwn_arrow">Type Of Tender</span></th>
                                                <td colspan="2"><span class="rs_ic"><c:out value="${tender.typeOfTenderName}"/></span></td>
                                                <th><span class="dwn_arrow">EMD Applicable</span></th>
                                                <td colspan="2"><span class="rs_ic"><c:out value="${tender.emdApplicableName}"/></span></td>
                                            </tr>

                                            <c:if test="${tender.emdApplicable=='1'}">
                                                <tr>
                                                    <th><span class="dwn_arrow">EMD (In figure)</span></th>
                                                    <td><span class="rs_ic"><i class="fa fa-rupee"></i><c:out value="${tender.emdInFig}"/></span></td>
                                                    <th><span class="dwn_arrow">EMD (In words)</span></th>
                                                    <td colspan="3"><span class="rs_ic"><i class="fa fa-rupee"></i><c:out value="${tender.emdInWords}"/></span></td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${tender.emdApplicable=='2'}">
                                                <tr>
                                                    <th><span class="dwn_arrow">EMD Status</span></th>
                                                    <td><span class="rs_ic"><i class="fa fa-rupee"></i>EMD as per Item wise as mentioned in tender document</span></td>  
                                                </tr>   
                                            </c:if>

                                            <c:if test="${tender.getMsmensicExemption().equalsIgnoreCase('Allowed')}">
                                                <tr>
                                                    <th><span class="dwn_arrow">MSME / NSIC Exemption</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.msmensicExemption}"/></span></td>
                                                    <th><span class="dwn_arrow">E.M.D Cost</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.emdMSMENSICExemption}"/> %</span></td>
                                                    <th><span class="dwn_arrow">Tender Fees</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.tenderfeeMSMENSICExemption}"/> %</span></td>
                                                </tr>
                                            </c:if>

                                            <c:if test="${tender.getScstExemption().equalsIgnoreCase('Allowed')}">
                                                <tr>
                                                    <th><span class="dwn_arrow">ST / SC Exemption</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.scstExemption}"/></span></td>
                                                    <th><span class="dwn_arrow">E.M.D Cost</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.emdTenderSCSTFeeExemption}"/> %</span></td>
                                                    <th><span class="dwn_arrow">Tender Fees</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.tenderfeeSCSTExemption}"/> %</span></td>
                                                </tr>
                                            </c:if>

                                            <c:if test="${tender.getObcExemption().equalsIgnoreCase('Allowed')}">
                                                <tr>
                                                    <th><span class="dwn_arrow">OBC Exemption</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.obcExemption}"/></span></td>
                                                    <th><span class="dwn_arrow">E.M.D Cost</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.emdTenderOBCFeeExemption}"/> %</span></td>
                                                    <th><span class="dwn_arrow">Tender Fees</span></th>
                                                    <td><span class="rs_ic"><c:out value="${tender.tenderfeeOBCExemption}"/> %</span></td>
                                                </tr>
                                            </c:if>

                                        </tbody>
                                    </table>
                                    <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}"> 
                                        <div class="edit_tender_bt">
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createTenderWizard" onclick="$('#step4').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit"></i>Edit</button>
                                        </div>
                                    </c:if>        
                                </div>

                                <div class="devider_boxed border_boxesDiv">
                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-web"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Dynamic Templates												</h3>
                                        </div>
                                    </div>
                                    <c:if test="${departmentUserEnvelopeA != null}">
                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                            <tbody>
                                                <tr>
                                                    <th class="table_wth-25"><span class="dwn_arrow">Officer For Envelope A</span></th>
                                                    <td class="table_wth-60">
                                                        <span class="rs_ic"><c:forEach var="envelopeA" items="${departmentUserEnvelopeA}">
                                                                <c:out value="${envelopeA.firstName}"/> <c:out value="${envelopeA.lastName}"/> ,</c:forEach>
                                                            </span></td>
                                                        <td class="table_wth-18"><span class="rs_ic"><a data-toggle="modal" data-target="#m_select_modal_view_template" href="#" ng-click="showModelForGenerateTemplate(submittedEnvelopeA.envelopeAId, 'A')" class="k-link"> View Temsplate</a></span></td>
                                                </tr>
                                            </c:if>

                                            <c:if test="${tender.getEnvelopeType().equalsIgnoreCase('3')}">
                                                <c:if test="${departmentUserEnvelopeB != null}">
                                                    <tr>
                                                        <th class="table_wth-25"><span class="dwn_arrow">Officer For Envelope B</span></th>
                                                        <td class="table_wth-60"><span class="rs_ic"><c:forEach var="envelopeB" items="${departmentUserEnvelopeB}">     
                                                                    <c:out value="${envelopeB.firstName}"/> <c:out value="${envelopeB.lastName}"/> ,
                                                                </c:forEach></span></td>
                                                        <td class="table_wth-18"><span class="rs_ic"><a href="#" data-toggle="modal" data-target="#m_select_modal_view_template" ng-click="showModelForGenerateTemplate(${submittedEnvelopeB.envelopeBId}, 'B');" class="k-link"> View Template</a></span></td>
                                                    </tr>
                                                </c:if>
                                            </c:if>

                                            <c:if test="${tender.getEnvelopeType().equalsIgnoreCase('4')}">
                                                <c:if test="${departmentUserEnvelopeB != null}">
                                                    <tr>
                                                        <th class="table_wth-25"><span class="dwn_arrow">Officer For QCBS</span></th>
                                                        <td class="table_wth-60"><span class="rs_ic"><c:forEach var="envelopeB" items="${departmentUserEnvelopeB}">     
                                                                    <c:out value="${envelopeB.firstName}"/> <c:out value="${envelopeB.lastName}"/> ,</c:forEach></span></td>
                                                <input id="templateid" type="hidden" value="${submittedEnvelopeB.templateId}"/>
                                                <td class="table_wth-18"><span class="rs_ic"><a href="#"  onclick="viewQCBSTemplate();" class="k-link"> View Template</a></span></td>
                                                </tr>
                                            </c:if>
                                        </c:if>

                                        <c:if test="${departmentUserEnvelopeB != null}">
                                            <tr>
                                                <th class="table_wth-25"><span class="dwn_arrow">Officer For Envelope C</span></th>
                                                <td class="table_wth-60"><span class="rs_ic"><c:forEach var="envelopeC" items="${departmentUserEnvelopeC}">     
                                                            <c:out value="${envelopeC.firstName}"/> <c:out value="${envelopeC.lastName}"/> ,
                                                        </c:forEach></span></td>
                                                        <c:if test="${tender.getTypeOfTender().equalsIgnoreCase('1')}">
                                                    <td class="table_wth-18"><span class="rs_ic"><a href="#" data-toggle="modal" data-target="#m_select_modalCpercentage"  class="k-link"> View Template</a></span></td>
                                                </c:if>
                                                <c:if test="${tender.getTypeOfTender().equalsIgnoreCase('2')}">
                                                    <td class="table_wth-18"><span class="rs_ic"><a href="#" data-toggle="modal" data-target="#m_select_modalClumsum" class="k-link"> View Template</a></span></td></c:if>
                                                </tr>
                                        </c:if>


                                        <c:if test="${tender.ammendmentPrivilege.equalsIgnoreCase('Allowed')}">
                                            <tr>
                                                <th class="table_wth-25"><span class="dwn_arrow">Ammendment Privilege</span></th>
                                                <td colspan="2"><span class="rs_ic">The Ammendment Privilege is applicable on this tender.</span></td>
                                            </tr>


                                            <tr>
                                                <th><span class="dwn_arrow">Officer for Ammendment Privilege</span></th>
                                                <td colspan="2"><span class="rs_ic"><c:forEach items="${tender.ammendmentPrivilegeOfficerList}" var="ammendmentOfficer">  <c:out value="${ammendmentOfficer.firstName}"/>  <c:out value="${ammendmentOfficer.lastName}"/>,&nbsp;                                                      
                                                        </c:forEach></span></td>
                                            </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                    <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">      
                                        <div class="edit_tender_bt">
                                            <c:if test="${tender.getEnvelopeType().equalsIgnoreCase('2')}">
                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" onclick="$('#step5').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});" data-target="#createTenderWizard"><i class="flaticon-edit"></i>Edit</button>
                                            </c:if>
                                            <c:if test="${tender.getEnvelopeType().equalsIgnoreCase('3')}">
                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" onclick="$('#step5').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});" data-target="#createTenderWizard"><i class="flaticon-edit"></i>Edit</button>
                                            </c:if>
                                            <c:if test="${tender.getEnvelopeType().equalsIgnoreCase('4')}">
                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" onclick="$('#step5').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});" data-target="#createTenderWizard"><i class="flaticon-edit"></i>Edit</button>
                                            </c:if>
                                        </div>
                                    </c:if>         
                                </div>


                                <div class="devider_boxed border_boxesDiv">
                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">						<i class="flaticon-file-2"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">Tender Documents</h3>
                                        </div>
                                    </div>

                                    <c:if test="${tender.singedPDF.equalsIgnoreCase('yes')}">
                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                            <tbody>
                                                <tr>
                                                    <th><span class="dwn_arrow">Documents Name</span></th>
                                                    <th><span class="dwn_arrow">Documents Links</span></th> 
                                                    </a></span></td>
                                                </tr>
                                                <c:forEach items="${tenderDocument}" var="tenderDocument">
                                                    <tr>
                                                        <td><span class="rs_ic"><c:out value="${tenderDocument.doc_Name}"/></span></td>
                                                        <td><span class="rs_ic"><a href="<c:out value="${tenderDocument.doc_Path}"/>" class="k-link" target="_blank">View</a></span></td>
                                                    </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                    </c:if>

                                    <c:if test="${tender.singedPDF.equalsIgnoreCase('no')}">
                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                            <tbody>
                                                <tr>
                                                    <th><span class="dwn_arrow">Upload Sign PDF Documents Later</span></th>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                        <div class="edit_tender_bt">
                                            <button type="button" data-toggle="modal" data-target="#createTenderWizard" class="btn btn-primary btn-sm" onclick="$('#step6').click();" ng-click="fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit" ></i>Edit</button>
                       <!--                     <a href="zipfile?tender_Id=${tender.tender_Id}&fileName=doc.zip" class="btn btn-primary btn-sm">Zip File</a>-->
                                        </div>
                                    </c:if>      
                                </div>



                                <c:forEach items="${tenderKeyDateses}" var="tenderKeyDateses">            <div class="devider_boxed border_boxesDiv">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon">
                                                    <i class="flaticon-calendar-1"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">
                                                    Key Dates
                                                </h3>
                                            </div>
                                        </div>
                                        <!-- <div class="k-content__head-main"> -->
                                        <!-- <h3 class="tender_head text-white">Key Dates</h3>  -->
                                        <!-- </div> -->
                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                            <tbody>
                                                <tr>
                                                    <th><span class="dwn_arrow">Serial No.</span></th>
                                                    <th><span class="dwn_arrow">Stages Name</span></th>
                                                    <th class="table_wth-38"><span class="dwn_arrow date_time">Start Date and Time </span><span class="dwn_arrow date_time">End Date and Time </span></th>
                                                </tr>
                                                <tr>
                                                    <td><span class="rs_ic">1</span></td>
                                                    <td><span class="rs_ic">TENDER PURCHASE</span></td>
                                                    <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time"><c:out value="${tenderKeyDateses.tenderPurchaseDate}"/></span>
                                                        <!--							<span class="end_date date_time">31-10-2018 04:30 PM</span>--></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="rs_ic">2</span></td>
                                                    <td><span class="rs_ic">BID SUBMISSION</span></td>
                                                    <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time"><c:out value="${tenderKeyDateses.bidSubmissionDate}"/></span>
                                                        <!--							<span class="end_date date_time">31-10-2018 04:30 PM</span>-->
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="rs_ic">3</span></td>
                                                    <td><span class="rs_ic">OPENING(EA)</span></td>
                                                    <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time"><c:out value="${tenderKeyDateses.openingEA}"/></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="rs_ic">4</span></td>
                                                    <td><span class="rs_ic">OPENING(EB)</span></td>
                                                    <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time"><c:out value="${tenderKeyDateses.openingEB}"/></span>
                                                    </td>
                                                </tr>

                                                <c:if test="${tender.getTenderStage().equalsIgnoreCase('1')}">
                                                    <tr>
                                                        <td><span class="rs_ic">5</span></td>
                                                        <td><span class="rs_ic">OPENING(EC)</span></td>
                                                        <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time"><c:out value="${tenderKeyDateses.openingEC}"/></span>
                                                        </td>
                                                    </tr>
                                                </c:if>

                                            </tbody>
                                        </table>

                                        <c:if test="${ !tender.getPreBidMeetingVenue().equalsIgnoreCase('') || !tender.getPreBidMeetingDate().equalsIgnoreCase('')}"> 
                                            <table class="table table-striped- table-bordered table-hover table-checkable ">
                                                <tbody>
                                                    <tr>
                                                        <c:if test="${!tender.getPreBidMeetingVenue().trim().equalsIgnoreCase('')}" >
                                                            <th><span class="dwn_arrow">Pre-Bid Meeting Venue</span></th>
                                                            </c:if>
                                                            <c:if test="${!tender.getPreBidMeetingDate().trim().equalsIgnoreCase('')}" >
                                                            <th><span class="dwn_arrow">Pre-Bid Meeting date</span></th> 
                                                            </c:if>
                                                    </tr>

                                                    <tr>
                                                        <c:if test="${!tender.getPreBidMeetingVenue().trim().equalsIgnoreCase('')}" >
                                                            <td><span class="rs_ic"><c:out value="${tender.preBidMeetingVenue}"/></span></td>
                                                            </c:if>
                                                            <c:if test="${!tender.getPreBidMeetingDate().trim().equalsIgnoreCase('')}" >
                                                            <td><span class="rs_ic"><c:out value="${tender.preBidMeetingDate}"/></span></td>
                                                            </c:if>
                                                    </tr>

                                                </tbody>
                                            </table> 
                                        </c:if> 
                                        <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                            <div class="edit_tender_bt">
                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createTenderWizard" class="btn btn-primary btn-sm" onclick="$('#step7').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit"></i>Edit</button>
                                            </div>
                                        </c:if>        
                                    </div>
                                </c:forEach>

                                <form:hidden path="tender_Id"  value="${tender.tender_Id}"></form:hidden>            
                                <div class="devider_boxed border_boxesDiv">
                                    <!-- <div class="k-content__head-main"> -->
                                    <!-- <h3 class="tender_head text-white">Tender Notice</h3>  -->
                                    <!-- </div> -->

                                    <div class="k-portlet__head">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-notes"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">Tender Notice</h3>
                                        </div>
                                    </div>
                                    <table class="table table-striped- table-bordered table-hover table-checkable ">
                                        <tbody>
                                            <tr class="text-center">
                                                <td colspan="5"><span class="rs_ic"><button type="reset" class="btn btn-primary btn-sm" data-toggle="modal" data-toggle="modal" data-target="#createTenderWizard" onclick="$('#step8').click();">Tender Notice</button></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <c:if test="${tender.tenderStatus.equals('Created')}">
                                    <div class="devider_boxed border_boxesDiv">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon">
                                                    <i class="fa fa-user-check"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">Approval Authority</h3>
                                            </div>
                                        </div>
                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                            <tbody>
                                                <tr class="">
                                                    <td>
                                                        <div class="multi_select">
                                                            <form:select path="approvalOfficer" cssClass="form-control k_selectpicker" multiple="true" id="approvalOfficer">
                                                                <c:forEach var="approvalAuthority" items="${approvalAuthority}">
                                                                    <form:option value="${approvalAuthority.reg_Id}">${approvalAuthority.firstName}&nbsp;${approvalAuthority.lastName}</form:option>
                                                                    </c:forEach> 
                                                            </form:select>

                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </c:if>


                                <c:if test="${tender.tenderStatus.equals('Sent For Approval')}">
                                    <div class="devider_boxed border_boxesDiv">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon">
                                                    <i class="flaticon-profile-1"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">
                                                    Department Officer Details
                                                </h3>
                                            </div>
                                        </div>
                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                            <tbody>
                                                <tr>
                                                    <th><span class="dwn_arrow">Officer Name</span></th>
                                                    <th><span class="dwn_arrow">Officer Email ID</span></th>
                                                    <!--							<th><span class="dwn_arrow">Designation</span></th>-->
                                                </tr>
                                                <c:forEach var="approvalAuthority" items="${approvalAuthority}"> 
                                                    <tr> 
                                                        <td><span class="rs_ic"><c:out value="${approvalAuthority.firstName}"/>&nbsp;<c:out value="${approvalAuthority.lastName}"/></span></td> 
                                                        <td><span class="rs_ic"><a href="#" class="k-link"> <c:out value="${approvalAuthority.emailAdd}"/></a></span></td> 
                                    <!--                    <td><span class="rs_ic"><a href="#" class="k-link"><c:out value="${approvalAuthority.designationName}"/></a></span></td>-->
                                                    </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if> 

                                <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created')}">  
                                    <div class="button_section text-center ">
                                        <input type="submit" class="btn btn-success" value="Sent For Approval" ></input>
                                        <a href="eTendering" class="btn btn-secondary exit_bt btn-outline-hover-danger">Exit</a>
                                    </div>
                                    <div class="button_section text-right">
                                        <button type="button" class="btn btn-danger exit_bt" ng-click="tenderDataReset(${tender.tender_Id}, '${tender.tenderNumber}', '${tender.nitNumber}', '${tender.nitDate}');">Reset</button>
                                    </div>
                                </c:if>
                                </form:form>        
                                <c:if test="${tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                    <c:if test="${tender.singedPDF.equalsIgnoreCase('yes')}">
                                        <div class="button_section text-center ">
                                            <a href="tenderStatusManaging/Approved/${tender.tender_Id}" class="btn btn-success">Approved</a>
                                            <a href="eTendering" class="btn btn-secondary exit_bt btn-outline-hover-danger">Exit</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${tender.singedPDF.equalsIgnoreCase('no')}">

                                        <div class="button_section text-center ">
                                            <button type="button" data-toggle="k-tooltip" title="Please Upload Singed PDF Documents To Approved this tender" data-placement="top" class="btn btn-success disabled_bt">Approved</button>
                                            <a href="eTendering"  class="btn btn-secondary exit_bt btn-outline-hover-danger">Exit</a>
                                        </div>      
                                    </c:if>
                                </c:if>
                            </div>


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

    <%@include file="../Contractor/Tiles/jslink.jsp" %>
</body>
<!-- end::Body -->

</html>
