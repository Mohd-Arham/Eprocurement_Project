<%-- 
    Document   : contractorotherdetail
    Created on : 1 Nov, 2018, 5:53:58 PM
    Author     : Windows7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Contractor Profile Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
        <!--<link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />-->
        <!-- coustom_style_css -->
        <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
         <link href="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.css"/>" rel="stylesheet" type="text/css" />
    
 
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
 <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">
       <jsp:include page="../Contractor/Tiles/ContractorRegistrationModal.jsp"></jsp:include> 
        <jsp:include page="../Contractor/Tiles/otpModal.jsp"></jsp:include>  
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
                    <%@include  file="../Contractor/Tiles/Header.jsp" %>     
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
                                                <h3 class="k-section__title"><span class="nav-link-icon"><i class="flaticon-box"></i></span>Contractor Profile</h3>
                                            </div>
                                           <table class="table table-striped- table-bordered table-hover table-checkable ">
                             <tbody>
                            <tr>
                                <th><span class="dwn_arrow">Name</span></th>
                                <td class="upr_text" style="text-transform: uppercase;">${contractor.fullname}</td>
                                <th><span class="dwn_arrow">Email ID</span></th>
                                <td class="upr_text" >${contractor.emailid}</td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Contractor Type</span></th>
                                <td class="upr_text" >${contractor.contractorType}</td>
                                <th><span class="dwn_arrow">Mobile No.</span></th>
                                <td>${contractor.mobileno}</td>
                            </tr>
                            <tr>
                                <th><span class="dwn_arrow">Designation</span></th>
                                <td class="upr_text" >${contractor.designationName}</td>
                                <c:if test="${contractor.otherDesignation!=null||contractor.otherDesignation!=''}">
                                    <th><span class="dwn_arrow">Other Designation</span></th>
                                    <td class="upr_text">${contractor.otherDesignation}</td>
                                </c:if>
                            </tr>
                            </tbody>
                    </table>
                   <button type="button" class="btn btn-primary btn-sm" onclick="editRegDetails();"><i class="flaticon-edit"></i>Edit</button>
                    <button type="button" class="btn btn-brand btn-elevate" data-toggle="modal" data-target="#otpModal" id="OTP_modal" hidden="true"></button>   
                    <button class="btn btn-brand btn-elevate" data-toggle="modal" data-target="#contaractorRegistrationForm" id="openRegModal" hidden="true"></button> 
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
                                  <c:if test="${contractorDetails.contCompanyName!='Not Applicable'}">
                                <th><span class="dwn_arrow">(MSME,NSIC)Document</span></th>
                                <td class="upr_text"><span class="rs_ic"><a href="${contractorDetails.msmeDocUrl}" target="blank">View Document</a></span></td>
                                  </c:if>
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
                                <th><span class="dwn_arrow">Organization PAN</span></th>
                                <td class="upr_text" ><span class="rs_ic">${contractorDetails.orgPAN}</span></td>
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
                           <button class="btn btn-brand btn-elevate openotpModal" data-toggle="modal" data-target="#otpModal" id="openotpModal" hidden="true"></button>
                 
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
              <%--       <%@include  file="../Contractor/Tiles/Footer.jsp" %>   --%>  
                 <!-- end:: Footer -->   
                </div>
            <button type="submit" hidden="true" id="otpForEdit"></button>
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
                    <div>

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
//               alert("openModal "+openModal);
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
      var contReg='<c:out value="${contractor.id}"></c:out>';
           var desui='<c:out value="${contractor.designation}"></c:out>';
           var prevemailId='<c:out value="${contractor.emailid}"></c:out>';
           var email = $("#email").val();
        alert("contReg "+contReg+"  desui"+desui);
       if (desui === '3'){
              $("#otherDes").show();
           } else{
                    $("#otherDes").hide();
           }
        if(contReg != '0'){
            $("#crf").click();
        }
         $("#email").change(function () {
             var email = $("#email").val();
           
              if(contReg!='0'){
               swal({
               title: 'Are you Sure',
               text: 'If you change your mobile number or EmailId.You need to Re-login',
                type: 'question',
               showCancelButton: true,
               confirmButtonText: 'Yes',
               cancelButtonText: 'No',
                }).then((result) => {
              if (result.value) {
              
                 $.ajax({
                url: "CheckEmail",
                data: {email: email},
                success: function (res) {
//                 alert(res);
                    if (res !== "valid Email") {
                    $("#"+this.id+"Error").html("Email Id Is Already Registered");
                    $("#"+this.id).val(" ");
                       }
                    else {
                      
                        $("#"+this.id+"Error").html("");
//                        $('.sbtbtn').removeAttr('disabled'); 
                     }
                }, error: function (error){
//               alert("error : "+error); 
               }
            });
      
      
              } else if (
// Read more about handling dismissals
            result.dismiss === swal.DismissReason.cancel
         ) {
          
           $("#email").val(prevemailId);
        
           }
         }) 
 
     }
    
//              alert("checkEmail  id is: "+this.id);
              $.ajax({
                url: "CheckEmail",
                data: {email: email},
                success: function (res) {
//                   alert(res);
                    if (res !== "valid Email") {
//                        alert("done");
                       $("#emailError").html("Email Id Is Already Registered");
                        $("#"+this.id).val(" ");
//                        $('.sbtbtn').attr('disabled', 'disabled');
         
                    }
                    else {
                       $("#"+this.id+"Error").html("");
                        $('.sbtbtn').removeAttr('disabled'); 
                  }
               }, error: function (error){
//               alert("error : "+error); 
               }
           });
       });
      $("#mobileno").change(function () {
       var mobileno='<c:out value="${contractor.mobileno}"></c:out>';
        var mobile = $("#mobileno").val();
        alert("mobile number is:"+mobile);
        alert("contReg  "+contReg);
              if(contReg!='0'){
               swal({
               title: 'Are you Sure',
               text: 'If you change your mobile number or EmailId.You need to Re-login',
                type: 'question',
               showCancelButton: true,
               confirmButtonText: 'Yes',
               cancelButtonText: 'No',
               
               }).then((result) => {
              if (result.value) {
             
            $.ajax({
                url: "checkUserContact",
                data: {mobile: mobile},
                success: function (res) {
//                alert(res);
                    if (res !== "valid mobile_no") {
//                                    alert("done");
                     
                        $("#"+this.id+"Error").html("Mobile Number. Is Already Registered");
                          $("#"+this.id).val(" ");
//                        $("#mobile").append(res);
//                       $('.sbtbtn').attr('disabled', 'disabled');
                    }
                    else {
                      $("#"+this.id+"Error").html("");
                      $('.sbtbtn').removeAttr('disabled'); 
                    }
                }, error: function (error){
//               alert("error : "+error); 
               }
            });
              
          
//        window.location.href='verifyOtherDetails?regid='+regId+'&step='+step;
              } else if (
// Read more about handling dismissals
            result.dismiss === swal.DismissReason.cancel
         ) {
           $("#mobileno").val(mobileno);
            }
         }) 
 
     }
          
          
          
          $.ajax({
                url: "checkUserContact",
                data: {mobile: mobile},
                success: function (res) {
//                               alert(res);
                    if (res !== "valid mobile_no") {
//                                    alert("done");
                   
                        $("#"+this.id+"Error").html("Mobile Number. Is Already Registered");
                        $("#"+this.id).val(" ");
//                         $('.sbtbtn').attr('disabled', 'disabled');
                    }
                    else {
                        $("#"+this.id+"Error").html("");
                        $('.sbtbtn').removeAttr('disabled'); 
                    }
                }, error: function (error){
//               alert("error : "+error); 
               }
            });
    
        });
    });
     $('#otpForEdit').click(function(){
        alert("id=" +this.id);
          $.ajax({
                url: "verifyMob",
             success: function (res) {
                alert(res);
                $('#generatedotp').val(res);
                $('#otpFor').val("registrationDone");
                 $('#OTP_modal').click();
                //$('#openotpModal').click();    
                 }
            });
            });
</script>
 <script>
	$(function() {
    $(".preloader").fadeOut(2000, function() {
        $(".loader_main").fadeIn(1000);        
    });
});
	</script>

  
 



        <%---function  to called the validation of second step---%>

    
    
  <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js" />" type="text/javascript"></script>
    </body>

    <!-- end::Body -->

</html>