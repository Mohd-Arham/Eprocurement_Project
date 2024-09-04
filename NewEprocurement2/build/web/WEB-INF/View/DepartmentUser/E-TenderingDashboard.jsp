<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html lang="en" ng-app="app">
    <!-- begin::Head -->
    <head>
        <meta charset="utf-8" />
        <title>Department User | Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon lotus procure -->
        <!--<link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />--> 
        <link rel="stylesheet" type="text/css" href="https://csshake.surge.sh/csshake.min.css">
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
            });

        </script>
        <style>
            .card-title{
                display: inline-block;
                width: 120px;
                white-space: nowrap;
                overflow: hidden !important;
                text-overflow: ellipsis;
            }
            .dropdown.document_dropdowm {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                width: 100%;
            }
            .dropdown.document_dropdowm dd,
            .dropdown.document_dropdowm dt {
                margin: 0px;
                padding: 0px;
            }
            .dropdown.document_dropdowm ul {
                margin: -1px 0 0 0;
            }

            .dropdown.document_dropdowm dd {
                position: relative;
            }

            .dropdown.document_dropdowm a,
            .dropdown.document_dropdowm a:visited {
                text-decoration: none;
                outline: none;
                font-size: 12px;
            }  

            .dropdown.document_dropdowm dt a {
                display: block;
                padding: 8px 20px 5px 10px;
                min-height: 25px;
                line-height: 24px;
                overflow: hidden;
                width: 100%;
                min-height: calc(3rem + 2px);
                padding: .75rem 1rem;
                font-size: 1rem!important;
                line-height: 1.5;
                color: #495057!important;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #e2e5ec;
                border-radius: .25rem;
                -webkit-transition: border-color 0.15s ease-in-out,-webkit-box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out,-webkit-box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out,box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out,box-shadow 0.15s ease-in-out,-webkit-box-shadow 0.15s ease-in-out;
                font-weight: 500;
            }

            .dropdown.document_dropdowm dt a span,
            .multiSel span {
                cursor: pointer;
                display: inline-block;
            }

            .dropdown.document_dropdowm dd ul {
                background-color: #fff;
                border: 0;
                display: none;
                left: 0px;
                padding: 0px 0px 2px 0px;
                position: absolute;
                top: 2px;
                width:100%;
                list-style: none;
                height: 200px;
                overflow: auto;
                -webkit-box-shadow: 0px 0px 50px 0px rgba(82, 63, 105, 0.15);
                box-shadow: 0px 0px 50px 0px rgba(82, 63, 105, 0.15);
                border-radius: 4px;
            }

            .dropdown.document_dropdowm span.value {
                display: none;
            }
            .dropdown.document_dropdowm dd ul li {
                clear: both;
                overflow: hidden;
                padding:10px;
            }
            .dropdown.document_dropdowm dd ul li a {
                display: inline-block;
            }
            .dropdown.document_dropdowm dd ul li:hover {
                background-color: #f7f8fa;
            }
            .dropdown.document_dropdowm dd ul li a:hover {
                text-decoration:underline;
            }
        </style>
        <!--end::Web font -->
        <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" media="all" type="text/css" href=<c:url value="/resources/assets/jquery-ui-timepicker-addon.css"/>"/>

              <!--begin:: Global Mandatory Vendors -->
              <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />
        <!--begin:: Global Mandatory Vendors -->
        <%-- <link href="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.css"/>" rel="stylesheet" type="text/css" /> --%>

        <!--end:: Global Mandatory Vendors -->

        <!--begin:: Global Optional Vendors -->
        <link href="<c:url value="/resources/vendors/tether/dist/css/tether.css"/>" rel="stylesheet" type="text/css" />
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
        <!--end::Global Theme Styles -->
        <!--begin::Page Vendors Styles -->
        <link href="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.css"/>" rel="stylesheet" type="text/css" />
        <!--begin::Page Vendors Styles -->
        <%--  <link href="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css"/>" rel="stylesheet" type="text/css" />  --%>
        <!-- coustom_style_css -->
        <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/tendercreatinon.css"/>" rel="stylesheet" type="text/css" />
        <!--end::Page Vendors Styles -->
        <!-- Angular script -->
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>

    </head>
    <!-- end::Head -->

    <!-- begin::Body -->
    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="MainCtrl">
        <!-- Loader Start -->
        <!-- Loader Start --> 
        <div id="preloaderSpinner" class="preloader spinner">
            <div class="spinWrap">
                <p class="spinnerImage"></p>
                <p class="loader"></p>
                <p class="loadingMessage" id="spinnerMessage"></p>
            </div>
        </div>   

        <!--STAR_TENDER_WIZARD_MODAL -->
        <!-- Large Modal -->
        <jsp:include page="Tiles/TenderCreationWizard.jsp"/>
        <!--END_TENDER_WIZARD_MODAL_FORM-->
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
                <jsp:include page="Tiles/AsideNav.jsp"/>
                <!-- end:: Aside -->
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                    <!-- begin:: Header -->
                    <jsp:include page="Tiles/Header.jsp" />


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
                            <div class="k-content__head-toolbar">
                                <div class="k-content__head-toolbar-wrapper">
                                    <c:if test="${tenderCreation!=null}">
                                        <div class="dropdown dropdown-inline mt-3" data-toggle="k-tooltip" title="Create New Tender" data-placement="top">
                                            <button type="button" class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper tenderWizardOpen" ng-click="arrangingTenderCreationWizard();" data-toggle="modal" data-target="#createTenderWizard" >
                                                <i class="la la-map-signs"></i> Create Tender 
                                            </button>
                                            <button type="button" ng-hide="true" id="tenderKeyDateValueFetch" class="tenderKeyDateValueFetch"></button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <!-- end:: Content Head -->
                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->
                            <div class="row">


                                <!--Searching of tender starts from here -->
                                <div class="col-lg-12">  
                                    <!--begin::Portlet-->
                                    <div class="k-portlet" style="margin-bottom:-10px;">
                                        <div class="k-portlet__body"> 
                                            <div class="row">
                                                <form id="searchingTender">  
                                                    <div class="col-lg-11" style="padding-right:0;"> 
                                                        <ul class="tender_search">

                                                            <li><input type="text" class="form-control" placeholder="Tender NO. / NIT NO." id="tenderNoSearch"></li>

                                                            <li><select class="form-control" id="statusSearch">
                                                                    <option value="0">Select Status</option>
                                                                    <option value="Created">Created</option>
                                                                    <option value="Sent For Approval">Sent For Approval</option>
                                                                    <option value="Approved">Approved</option>
                                                                    <option value="Amended">Amended</option>
                                                                    <option value="Canceled">Canceled</option>
                                                                </select>
                                                            </li>

                                                            <li><select class="form-control" id="officerNameSearch">                                                           <option value="0">Select Officer Name</option>                                                                  <c:if test="${departmentUserList!=null}">                                                                       <c:forEach var="officerNames" items="${departmentUserList}">                                                      <option value="${officerNames.key}">${officerNames.value}</option>
                                                                        </c:forEach>                                                                                                </c:if>                                                                                                 </select>
                                                                </li>

                                                                <li><div class="input-group">
                                                                        <input type="text" class="form-control" id="nitDateSearch" readonly="" placeholder="Select NIT Date">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text"><i class="la la-calendar-check-o glyphicon-th"></i></span>
                                                                        </div>
                                                                    </div> 
                                                                </li>

                                                            </ul> 
                                                        </div>
                                                    </form>    
                                                    <div class="col-lg-1" style="padding-left:0;">
                                                        <button type="button" class="btn btn-brand" ng-click="searchingOfTender();">Search</button>
                                                    </div>													
                                                </div>

                                            </div>
                                        </div>

                                        <!--end::Portlet--> 
                                    </div>
                                    <!-- Searching of tender end from here -->

                                    <!--                            <input class="form-control" id="k_maxlength_1_modal" maxlength="100" placeholder="" type="text">-->
                                    <!--begin::Portlet-->
                                    <div class="col-lg-12">	
                                        <div class="k-portlet k-portlet--tabs tender_tab tender_view_tab">
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-toolbar">
                                                    <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-danger nav-tabs-line-2x nav-tabs-line-right nav-tabs-bold" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_2_1_tab_content" role="tab">
                                                                All
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_2_tab_content" role="tab">
                                                                Created
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_3_tab_content" role="tab">
                                                                Sent For Approval
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_4_tab_content" role="tab">
                                                                Approved
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_5_tab_content" role="tab">
                                                                Live / In Process
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_6_tab_content" role="tab">
                                                                Amended</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_7_tab_content" role="tab">
                                                                Canceled
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_8_tab_content" role="tab">
                                                                View CS
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body description_acc_tender">
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="k_portlet_base_demo_2_1_tab_content" role="tabpanel">
                                                        <div class="detail-tender">
                                                            <p><span>All Tenders:</span>List of all tenders related to you.</p>
                                                        </div>
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Ordering.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Work Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:if test="${fetchAllTender!=null}">
                                                                    <c:forEach var="fetchAllTender" items="${fetchAllTender}" varStatus="loop">                                                         <tr>
                                                                            <td ng-hide="true"><c:out value="${loop.index}"/></td>
                                                                            <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                            <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                            <td><div class="description_acc_tender">
                                                                                    <!--begin::Accordion-->

                                                                                    <div class="card">
                                                                                        <div class="card-header" id="headingOne3">                                      <div class="card-title allTenders" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3" id="${fetchAllTender.tender_Id}"><span ng-hide="true"><c:out value="${fetchAllTender.nameOfWork}"/> </span><span id="collapseData${fetchAllTender.tender_Id}"></span>                                                                                               </div>                                                                  </div>
                                                                                        <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                <c:out value="${fetchAllTender.nameOfWork}"/> 
                                                                                            </div>                                                                  </div>
                                                                                    </div>


                                                                                    <!--end::Accordion-->

                                                                                </div></td>
                                                                            <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                    <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                <td>
                                                                                <c:choose>
                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                        <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                    </c:when>
                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                        <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                    </c:when>
                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                        <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                    </c:when>
                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                        <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                    </c:when>
                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                        <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                    </c:when>
                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Canceled')}">
                                                                                        <span class="k-badge  k-badge--inline k-badge--success k-badge--pill" style="background-color: yellowgreen;"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                    </c:when>
                                                                                </c:choose>    
                                                                            </td>
                                                                            <td>
                                                                                <span class="dtr-data">
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                            <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                            </a> 
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                            <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                <i class="fa fa-file-pdf"></i>
                                                                                            </a>
                                                                                        </c:when>
                                                                                    </c:choose>            
                                                                                </span>
                                                                            </td>
                                                                            <td><span class="dtr-data">
                                                                                    <span class="dropdown">
                                                                                        <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                            <i class="flaticon-menu-button"></i>
                                                                                        </a>
                                                                                        <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                            <c:choose> 
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                            <c:choose> 
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="#"  ng-click="tenderKeyWordsShow(${fetchAllTender.areaOfWork}); empanelContractorShow(${fetchAllTender.areaOfWork}); fetchTenderDetails(${fetchAllTender.tender_Id}, '${fetchAllTender.tenderNumber}');" data-toggle="modal" data-target="#createTenderWizard"><i class="flaticon-information"></i>Create Tender</a>
                                                                                                </c:when>                                
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Sent For Approval</a>
                                                                                                </c:when>                                
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')&& fetchAllTender.statusManaging==true}">  
                                                                                                </c:when> 
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')&& fetchAllTender.statusManaging==false}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Approve</a>
                                                                                                </c:when> 
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')&& fetchAllTender.statusManaging==true}">                                 
                                                                                                </c:when> 
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')&& fetchAllTender.statusManaging==false}">                                      <a class="dropdown-item" href="viewAmendedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Amendment</a>
                                                                                                </c:when>
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')&& fetchAllTender.statusManaging==true}">            
                                                                                                </c:when> 
                                                                                                <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')&& fetchAllTender.statusManaging==false}">     <a class="dropdown-item" href="viewAmendedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Amendment</a>
                                                                                                    <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                </c:when> 
                                                                                            </c:choose>                                             
                                                                                            <!--<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                        </div>
                                                                                    </span>
                                                                                </span></td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>


                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <!--end: Datatable -->

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_2_tab_content" role="tabpanel">
                                                    <div class="detail-tender">
                                                        <p><span>Created Tenders:</span>List of tenders, either created by you or sent to you for approval.</p>
                                                    </div>
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">

                                                        <!--begin: Datatable -->
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Ordering.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllCreatedTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllCreatedTender}" varStatus="loop">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${loop.index}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                           </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                            <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                            <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                            <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information.">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>

                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <c:choose>
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="#" onclick="onfetchModelData();"  ng-click="tenderKeyWordsShow(${fetchAllTender.areaOfWork}); empanelContractorShow(${fetchAllTender.areaOfWork}); fetchTenderDetails(${fetchAllTender.tender_Id}, '${fetchAllTender.tenderNumber}');" data-toggle="modal" data-target="#createTenderWizard"><i class="flaticon-information"></i>Create Tender</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Sent For Approval</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Approved</a>
                                                                                                    </c:when>                                
                                                                                                    <c:otherwise>    
                                                                                                        <a class="dropdown-item" href="viewAmendedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Amendment</a>
                                                                                                        <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:otherwise>
                                                                                                </c:choose>                                             
                                                                                                <!--<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!--end: Datatable -->

                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_3_tab_content" role="tabpanel">
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="detail-tender">
                                                            <p><span>Sent For Approval Tenders:</span>List of All Sent For Approval Tenders.</p>
                                                        </div>
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Tender Id.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllSentForApprovalTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllSentForApprovalTender}">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${fetchAllTender.tender_Id}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                           </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                            <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                            <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                            <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                         <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <c:choose>
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="#"  ng-click="fetchTenderDetails(${fetchAllTender.tender_Id}, '${fetchAllTender.tenderNumber}');" data-toggle="modal" data-target="#createTenderWizard"><i class="flaticon-information"></i>Create Tender</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Sent For Approval</a>
                                                                                                    </c:when>                               
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval') && fetchAllTender.statusManaging==true}">                                     
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval') && fetchAllTender.statusManaging==false}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Approved</a>
                                                                                                    </c:when>                                
                                                                                                    <c:otherwise>    
                                                                                                        <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:otherwise>
                                                                                                </c:choose>                                                 
                                                                                                <!--<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_4_tab_content" role="tabpanel">
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="detail-tender">
                                                            <p><span>Approved Tenders:</span>List of All Approved Tenders.</p>
                                                        </div>
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Tender Id.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllApprovedTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllApprovedTender}">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${fetchAllTender.tender_Id}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                           </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                            <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                            <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                            <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <c:choose>                      
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') && fetchAllTender.statusManaging==true}"> 
                                                                                                        <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:when>  
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') && fetchAllTender.statusManaging==false}">  <a class="dropdown-item" href="viewAmendedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Amendment</a>
                                                                                                        <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:when>
                                                                                                </c:choose>                                                
                                                                                                <!--<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_5_tab_content" role="tabpanel">
                                                    <div class="detail-tender">
                                                        <p><span>Live Tenders:</span>Tenders that are currently available for purchase.
                                                            <span>In Progress:</span>Tenders that are currently active and available for bid submission.</p>
                                                    </div>
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Tender Id.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllLiveInprocessTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllLiveInprocessTender}">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${fetchAllTender.tender_Id}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                           </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                            <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                            <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                            <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <c:choose>                                                                     <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}"> <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:when>   
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">  <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:when> 
                                                                                                </c:choose>                                         
                                                                                                <!--<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_6_tab_content" role="tabpanel">
                                                    <div class="detail-tender">
                                                        <p><span>Amended Tenders:</span>List of amended tenders or corrigendum.</p>
                                                    </div>
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Tender Id.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllAmendedTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllAmendedTender}">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${fetchAllTender.tender_Id}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                                                            </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                            <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                            <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                            <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <c:choose>
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="#"  ng-click="fetchTenderDetails(${fetchAllTender.tender_Id}, '${fetchAllTender.tenderNumber}');" data-toggle="modal" data-target="#createTenderWizard"><i class="flaticon-information"></i>Create Tender</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Sent For Approval</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Approved</a>
                                                                                                    </c:when>                                
                                                                                                    <c:otherwise>    
                                                                                                        <a class="dropdown-item" href="viewAmendedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Amendment</a>
                                                                                                        <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                    </c:otherwise>
                                                                                                </c:choose>                                                 
                                                                                                <!--<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_7_tab_content" role="tabpanel">
                                                    <div class="detail-tender">
                                                        <p><span>Canceled Tenders:</span> Tenders are canceled for a reason by tender authority.</p>
                                                    </div>
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Tender Id.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllCancelledTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllCancelledTender}">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${fetchAllTender.tender_Id}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                           </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Canceled')}">
                                                                                            <span class="k-badge  k-badge--inline k-badge--success k-badge--pill" style="background-color: yellowgreen;"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>
                                                                                                <!--                <a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="k_portlet_base_demo_2_8_tab_content" role="tabpanel">
                                                    <div class="detail-tender">
                                                        <p><span>View CS:</span>View the Comparison Sheet(CS) of financial bid. </p>
                                                    </div>
                                                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="accordion accordion-outline" id="accordionExample3">
                                                            <table class="table table-striped- table-bordered table-hover table-checkable tenderData">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-hide="true">Tender Id.</th>
                                                                        <th>Tender No.</th>
                                                                        <th>NIT No.</th>
                                                                        <th>Description</th>
                                                                        <th>Approval Authority</th>
                                                                        <th>Creation Dates</th>
                                                                        <th style="width:67px;">Status</th>
                                                                        <th style="width:67px;">PDF</th>
                                                                        <th>Action</th> 
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${fetchAllTender!=null}">
                                                                        <c:forEach var="fetchAllTender" items="${fetchAllTender}">                                                         <tr>
                                                                                <td ng-hide="true"><c:out value="${fetchAllTender.tender_Id}"/></td>
                                                                                <td><c:out value="${fetchAllTender.tenderNumber}"/></td>
                                                                                <td><c:out value="${fetchAllTender.nitNumber}"/></td>
                                                                                <td><div class="description_acc_tender">
                                                                                        <!--begin::Accordion-->

                                                                                        <div class="card">
                                                                                            <div class="card-header" id="headingOne3">                                      <div class="card-title" data-toggle="collapse" data-target="#collapseOne${fetchAllTender.tender_Id}" aria-expanded="false" aria-controls="collapseOne3">                                                                      <c:out value="${fetchAllTender.nameOfWork}"/>                           </div>                                                                  </div>
                                                                                            <div id="collapseOne${fetchAllTender.tender_Id}" class="card-body-wrapper collapse" aria-labelledby="headingOne3" data-parent="#accordionExample3">       <div class="card-body">
                                                                                                    <c:out value="${fetchAllTender.descriptionOfWork}"/>
                                                                                                </div>                                                                  </div>
                                                                                        </div>


                                                                                        <!--end::Accordion-->

                                                                                    </div></td>
                                                                                <td><c:forEach var="officerApproval" items="${fetchAllTender.ammendmentPrivilegeOfficerList}">
                                                                                        <c:out value="${officerApproval.firstName}"/>&nbsp;<c:out value="${officerApproval.lastName}"/>                                                           </c:forEach></td>                                                                <td><span class="creation_dates"><c:out value="${fetchAllTender.nitDate}"/></span></td>
                                                                                    <td>
                                                                                    <c:choose>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8') }">
                                                                                            <span class="k-badge  k-badge--info k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                                                            <span class="k-badge  k-badge--brand k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved')}">
                                                                                            <span class="k-badge  k-badge--success k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                        <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">
                                                                                            <span class="k-badge  k-badge--danger k-badge--inline k-badge--pill"><c:out value="${fetchAllTender.tenderStatus}"/></span>
                                                                                        </c:when>
                                                                                    </c:choose>    
                                                                                </td>
                                                                                <td>
                                                                                    <span class="dtr-data">
                                                                                        <c:choose>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">  
                                                                                                <a href="${context}/resources/UploadedDocuments/Approval_PDF/${fetchAllTender.sent_for_approval_pdf}" class="btn btn-hover-danger btn-icon btn-pill" title="Download" target="_blank">                                                                        <i class="fa fa-file-pdf"></i>
                                                                                                </a> 
                                                                                            </c:when>
                                                                                            <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Approved') || fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}"> 
                                                                                                <a href="#" class="btn btn-hover-success btn-icon btn-pill" title="Digitally Sign Pdf Document. Download & View to Signature Information." target="_blank">
                                                                                                    <i class="fa fa-file-pdf"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                        </c:choose>            
                                                                                    </span>
                                                                                </td>
                                                                                <td><span class="dtr-data">
                                                                                        <span class="dropdown">
                                                                                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="flaticon-menu-button"></i>
                                                                                            </a>
                                                                                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; transform: translate3d(-208px, -147px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                                                                <c:choose> 
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Amended')}">       <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetailAmend(${fetchAllTender.tenderAmend_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a>
                                                                                                    </c:when>
                                                                                                    <c:otherwise>
                                                                                                        <a class="dropdown-item" href="#" ng-click="fetchPreviouTenderDetail(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#tableViewTender"><i class="flaticon-list-1"></i>Summary</a> 
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <c:choose>
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && !fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="#"  ng-click="fetchTenderDetails(${fetchAllTender.tender_Id}, '${fetchAllTender.tenderNumber}');" data-toggle="modal" data-target="#createTenderWizard"><i class="flaticon-information"></i>Create Tender</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Created') && fetchAllTender.wizardStep.equalsIgnoreCase('step8')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Sent For Approval</a>
                                                                                                    </c:when>                                
                                                                                                    <c:when test="${fetchAllTender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">                                     <a class="dropdown-item" href="viewCreatedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Approved</a>
                                                                                                    </c:when>                                                                           <c:otherwise>                                                                         <a class="dropdown-item" href="viewAmendedTenderDetails?tender_Id=${fetchAllTender.tender_Id}" ><i class="flaticon-information"></i>Amendment</a>                 <a class="dropdown-item" href="#" ng-click="tenderAmendmentHistory(${fetchAllTender.tender_Id});" data-toggle="modal" data-target="#m_select_modal_view_Amendment_History" ><i class="flaticon-file-2"></i>History</a>                             </c:otherwise>
                                                                                                </c:choose>  
                                                                                                <!--                                                                                            <a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>  -->
                                                                                            </div>
                                                                                        </span>
                                                                                    </span></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>


                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end::Portlet-->

                            </div>

                            <!--end::Row-->

                            <!-- begin::Scrolltop -->
                            <div id="k_scrolltop" class="k-scrolltop">
                                <i class="la la-arrow-up"></i>
                            </div>

                            <!-- end::Scrolltop -->

                            <!---Start-Modal-Tab-Upload-Documents---> 
                            <jsp:include page="Tiles/CloudFolderModel.jsp" /> 
                            <!---End-Modal-Tab-Upload-Documents---> 
                            <!---Start-Modal-Tab-Envelope--->
                            <jsp:include page="Tiles/TenderEnvelopeModel.jsp" />
                            <!---Start-Modal-Tab-Create Dynamic Template--->
                            <jsp:include page="Tiles/CreateDynamicTemplate.jsp" />
                            <!---End-Modal-Tab-Create Dynamic Template---> 
                            <!---Start-Modal-Tab-Create Dynamic Template--->
                            <jsp:include page="Tiles/ViewDynamicTemplate.jsp" />
                            <!---End-Modal-Tab-Create Dynamic Template---> 
                            <!--begin::Modal-New-template -->
                            <jsp:include page="Tiles/CopyTenderModel.jsp" /> 
                            <!--end::Modal-->
                            <!--STAR_AMENDMENT_HISTORY_MODAL -->
                            <jsp:include page="Tiles/viewAmmendHistoryModel.jsp"/>
                            <!--END_AMENDMENT_HISTORY_FORM-->
                            <!--STAR_TENDER_SUMMARY_MODAL -->
                            <jsp:include page="Tiles/TenderSummary.jsp"/>
                            <!--END_TENDER_SUMMARY_MODAL_FORM-->
                            <!--STAR_QCBS_MODAL -->
                            <jsp:include page="Tiles/QCBSTemplatePlug.jsp"/>
                            <!--END_QCBS_MODAL-->
                            <!-- begin:: Aside Secondary -->
                            <%--  <jsp:include page="Tiles/AsideNavSecondary.jsp"/> --%>
                            <!-- end:: Aside Secondary -->
                            <!-- begin::Global Config -->
                            <!-- begin::Quick Panel -->
                            <%--     <jsp:include page="Tiles/QuickPanel.jsp"/>--%>
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

                            <!-- Angular js Controller --> 
                            <script type="text/javascript" src="<c:url value="/resources/angular/tenderScript.js" />" ></script> 
                            <script type="text/javascript" src="<c:url value="/resources/angular/WordConversionFilter.js" />" ></script> 

                            <!-- end::Global Config -->
                            <!--begin:: Global Mandatory Vendors -->
                            <script src="<c:url value="/resources/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
                            <!--<script src="<c:url value="/resources/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>-->

                            <!--end:: Global Mandatory Vendors -->

                            <!--begin:: Global Optional Vendors -->

                            <script src="<c:url value="/resources/vendors/jquery-form/dist/jquery.form.min.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/block-ui/jquery.blockUI.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/theme/framework/vendors/bootstrap-datepicker/init.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>
                        <!--    <script src="<c:url value="/resources/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>" type="text/javascript"></script>-->
                            <script src="<c:url value="/resources/vendors/theme/framework/vendors/bootstrap-timepicker/init.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>" type="text/javascript"></script> 
                            <script src="<c:url value="/resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/bootstrap-maxlength/src/bootstrap-maxlength.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js"/>" type="text/javascript"></script>
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
                            <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-maxlength.js"/>" type="text/javascript"></script>
                            <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/summernote.js"/>" type="text/javascript"></script>
                            <!--begin::Page Vendors -->
                            <script src="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.js"/>" type="text/javascript"></script>
                            <!--begin::Page Scripts -->
                            <script src="<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script> 
                            <!--end::Page Vendors -->
                            <!--begin::Page Scripts -->
                            <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> 
                            <!--end::Page Scripts -->
                            <!--end::Global Theme Bundle -->

                            <!-- Calender New DatePicker -->
                            <script type="text/javascript" src="<c:url value="/resources/assets/jquery-ui.min.js"/>"></script>
                            <script type="text/javascript" src="<c:url value="/resources/assets/jquery-ui-timepicker-addon.js"/>"></script>
                            <!--Validating JS -->
                            <script type="text/javascript" src="<c:url value="/resources/validation/TenderValidation/TenderValidation.js" />" ></script> 


                            <script>

                                        $(document).ready(function () {
                                $(".allTenders").each(function(key, value){
                                var ids = $(this).attr('id');
                                        var nameOfWork = $("#collapseOne" + ids).text().trim();
                                        //alert(nameOfWork.length);
                                        var dots = "...";
                                        if (nameOfWork.length > 15)
                                {
                                // you can also use substr instead of substring
                                nameOfWork = nameOfWork.substring(0, 15) + dots;
                                        //alert(nameOfWork);
                                        $("#collapseData" + ids).html(nameOfWork);
                                } else{
                                $("#collapseData" + ids).html(nameOfWork);
                                }
                                });
                                });
                                        $(document).ready(function() {
                                $(".btn_next").click(function(e) {
                                $(".btn_prev").css("display", "inline-block");
                                        var li_first = $('.nav-tabs-btn');
                                        console.log(li_first);
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
                                console.log("prev button");
                                        $(".btn_prev").css("display", "none");
                                }
                                prevTab($active);
                                });
                                });
                                        function nextTab(elem) {
                                        var li = $(elem).closest("li");
                                                $(li).next('li').find('a').click();
                                        };
                                        function prevTab(elem) {
                                        var li = $(elem).closest("li");
                                                $(li).prev('li').find('a').click();
                                                $(li).prev('li').find('a').removeClass('sve_class_cl');
                                                $(li).prev('li').find('a').find('.nav-link-title').show();
                                                $(li).prev('li').find('a').find('.fa').hide();
                                        };
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

                                /*
                                 * Function Call to show the drop down at copy tender for total tender number
                                 * @type int
                                 * 5th Sep 2018
                                 */
                                $(function(){
                                var $select = $("#copyTenderNumber");
                                        for (i = 1; i <= 100; i++){
                                $select.append($('<option></option>').val(i).html(i));
                                }
                                });
                                        $(document).ready(function() {
                                var max_fields = 100; //maximum input boxes allowed
                                        var wrapper = $(".input_fields_wrap2"); //Fields wrapper
                                        var add_button = $(".add_More_EnvelopeA"); //Add button ID
                                        var x = 1; //initlal text box count
                                        $(add_button).click(function(e){ //on add input button cl ick"
                                //alert(x);
                                e.preventDefault();
                                        if (x < max_fields){ //max input box allowed
                                x++; //text box increment
                                        $(wrapper).append('<div class="clearfix" id="cloneTab' + x + '"><div class="k-repeater__data-set"><div ><div data-repeater-item class="k-repeater__item"><div class="form-group row"> <div class="col-lg-4"><input type="hidden" name="tender_EnvelopeA_SequnceIdList"  value="' + x + '"/><label>Label Name </label><input type="text" name="labelNameAList" id="labelNameAList' + x + '"  class="form-control upr_text" placeholder="Enter Label Name"><span class="form-text text-muted">Please Mention Label Name</span></div><div class="col-lg-3"><label>Label Type </label><select name="labelTypeAList" id="labelTypeAList' + x + '" class="form-control upr_text"><option value="0">Select</option><option value="1"> Alpha-Numeric</option><option value="2"> Numeric</option><option value="3"> File</option><option value="4"> Currency</option></select><span class="form-text text-muted">Please Select Label Type</span></div><div class="col-lg-3"><label>Submission Mandatory</label><div class="k-checkbox-list"><label class="k-checkbox k-checkbox--brand"><input type="checkbox" value="true" id="labelMandatoryAList" name="labelMandatoryAList" checked="checked"/><span></span></label></div></div><div class="col-lg-2"><label>Remove</label><div class="k-repeater__close k-repeater__data form-group"><button class="k-repeater__close btn btn-elevate-hover btn-sm  btn-font-danger remove_field2" id="remove_field2' + x + '" style="padding: 0.45rem 0rem;"><i class="la la-trash"></i></button></div></div></div><div class="k-separator k-separator--border-dashed"></div><div class="k-separator k-separator--height-sm"></div></div></div></div></div>'); //add input box
                                }
                                });
                                        $(wrapper).on("click", ".remove_field2", function(e){ //user click on remove text
                                e.preventDefault(); $("#cloneTab" + x).remove();
                                        x--;
                                });
                                        $("#remove_field2" + x).click(function(){
                                $("#cloneTab" + x).remove();
                                        x--;
                                });
                                });
                                        $("#viewQCBSButton").hide();
                            </script>
                            <!--<script>
                                $('#btnDelete').click(function () {
                                    $('#myModal7').modal('hide');
                                });
                            </script>-->
                            <script>
                                        $(document).ready(function () {
                                var s_date = '';
                                        var s_interval = '';
                                        $('input[name="radio2"]').change(function () {
                                if ($(this).is(':checked')) {
                                s_interval = $("input[name=radio2]:checked").val();
                                        $('#myModal7').modal();
                                        alert("Your Have Select " + s_interval + " Days Tender Cycle and date: " + s_date);
                                }
                                });
                                        $('.sk').datepicker({
                                format: 'mm/dd/yyyy',
                                        startDate: '-3d'
                                });
                                        //        $(".sk").calentim({
                                        //            singleDate: true,
                                        //             calendarCount: 1,
                                        //            showHeader: false,
                                        //            showFooter: false,
                                        //            autoCloseOnSelect: false,
                                        //            format: "DD/M/YYYY  h:mm",
                                        //           
                                        //          });
                                });
                                        function documentCloudData() {
                                        // alert("my data is:" + i);
                                        alert("Sequence Id" + id);
                                                alert("urlGlobal" + urlGlobal);
                                                var fileId = $("#fileId").val();
                                                alert("fileId  " + fileId);
                                                var formData = new FormData();
                                                formData.append("fileId", fileId);
                                                var documentName = $("#documentName" + id).val();
                                                //alert(documentName);
                                                formData.append("documentName", documentName);
                                                //alert(file);
                                                $.ajax({
                                                url: 'documentCloudData?fileId=' + fileId,
                                                        data: formData,
                                                        processData: false,
                                                        contentType: false,
                                                        type: 'POST',
                                                        success: function (response) {
                                                        $("#customFile").html("Choose file");
                                                                alert("my Result data is success:" + response);
                                                        },
                                                        error: function (error) {
                                                        alert("error : " + error);
                                                        }
                                                });
                                        }


                            </script>
                            <script>
                                function dynamicTemplateConv(value, id) {
                                alert("inside number2text   " + value + "Id :" + id);
                                        var fraction = Math.round(frac(value) * 100);
                                        var f_text = "";
                                        if (fraction > 0) {
                                f_text = "And " + convert_number(fraction) + " Paise";
                                }
                                var word = convert_number(value);
                                        //       alert(word);
                                        if (word !== "" || word !== null) {

                                document.getElementById(id + "InWords").value = word + " Rupees " + f_text + " Only";
                                } else {

                                document.getElementById(id + "InWords").value = word + "  " + f_text + " ";
                                }

                                }


                                function frac(f) {
                                return f % 1;
                                }


                                function convert_number(number)
                                {
                                //                alert("inside convert_number");
                                if ((number < 0) || (number > 9999999999999))
                                {
                                return "Number Out Of Range!";
                                }
                                var An = Math.floor(number / 1000000000); /* Arab */
                                        number -= An * 1000000000;
                                        var Gn = Math.floor(number / 10000000); /* Crore */
                                        number -= Gn * 10000000;
                                        var kn = Math.floor(number / 100000); /* lakhs */
                                        number -= kn * 100000;
                                        var Hn = Math.floor(number / 1000); /* thousand */
                                        number -= Hn * 1000;
                                        var Dn = Math.floor(number / 100); /* Tens (deca) */
                                        number = number % 100; /* Ones */
                                        var tn = Math.floor(number / 10);
                                        var one = Math.floor(number % 10);
                                        var res = "";
                                        if (An > 0)
                                {
                                res += (((res === "") ? "" : " ") +
                                        convert_number(An) + " Arab");
                                }
                                if (Gn > 0)
                                {
                                res += (((res === "") ? "" : " ") +
                                        convert_number(Gn) + " Crore");
                                }
                                if (kn > 0)
                                {
                                res += (((res === "") ? "" : " ") +
                                        convert_number(kn) + " Lakh");
                                }
                                if (Hn > 0)
                                {
                                res += (((res === "") ? "" : " ") +
                                        convert_number(Hn) + " Thousand");
                                }
                                if (Dn)
                                {
                                res += (((res === "") ? "" : " ") +
                                        convert_number(Dn) + " Hundred");
                                }
                                var ones = Array("", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen");
                                        var tens = Array("", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety");
                                        if (tn > 0 || one > 0)
                                {
                                if (!(res === ""))
                                {
                                res += " And ";
                                }
                                if (tn < 2)
                                {
                                res += ones[tn * 10 + one];
                                } else
                                {
                                res += tens[tn];
                                        if (one > 0)
                                {
                                res += (" " + ones[one]);
                                }
                                }
                                }

                                if (res === "")
                                {
                                res = "";
                                }
                                return res;
                                }

                            </script>
                            <script>
                                //resources/js/addons/datatables.min.js    
                                $(document).ready(function() {
                                $('.tenderData').DataTable({
                                "order": [[ 1, "desc" ]]
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
                            <script type="text/javascript">

                                        $(".dropdown.document_dropdowm dt a").on('click', function() {
                                $(".dropdown.document_dropdowm dd ul").slideToggle('fast');
                                });
                                        $(".dropdown.document_dropdowm dd ul li a").on('click', function() {
                                $(".dropdown.document_dropdowm dd ul").hide();
                                });
                                        function getSelectedValue(id) {
                                        return $("#" + id).find("dt a span.value").html();
                                        }

                                $(document).bind('click', function(e) {
                                var $clicked = $(e.target);
                                        if (!$clicked.parents().hasClass("dropdown")) $(".dropdown.document_dropdowm dd ul").hide();
                                });
                                        $('.mutliSelect input[type="checkbox"]').on('click', function() {

                                var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
                                        title = $(this).val() + ",";
                                        alert(title);
                                        title2 = $('input[value="' + title + '"]').id + ",";
                                        alert(title2);
                                        if ($(this).is(':checked')) {
                                var html = '<input type="hidden" value="' + title2 + '">' + title + '</input>';
                                        $('.multiSel').append(html);
                                        $(".hida").hide();
                                } else {
                                $('input[value="' + title2 + '"]').remove();
                                        var ret = $(".hida");
                                        $('.dropdown.document_dropdowm dt a').append(ret);
                                }
                                });
                            </script>
                            <c:if test="${message != null}">
                                <script>
                                            var tender_Id = '<c:out value="${tender_Id}"/>';
                                            var message = '<c:out value="${message}"/>';
                                            var nitNumber = '<c:out value="${nitNumber}"/>';
                                            var nitDate = '<c:out value="${nitDate}"/>';
                                            var tenderNumber = '<c:out value="${tenderNumber}"/>';
                                            $("#tender_Id").val(tender_Id);
                                            $(".tenderWizardOpen").click();
                                </script>
                                <span ng-init="nitNumber = '<c:out value="${nitNumber}"/>'"></span>
                                <span ng-init="nitDate = '<c:out value="${nitDate}"/>'"></span>
                                <span ng-init="tenderNumber = '<c:out value="${tenderNumber}"/>'"></span>
                                <span ng-init="resetTender = true"></span>
                            </c:if>
                            </body>
                            <!-- end::Body -->
                            </html>