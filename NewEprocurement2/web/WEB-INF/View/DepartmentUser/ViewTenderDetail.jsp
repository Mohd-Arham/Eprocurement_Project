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
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" /> -->
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

        <!--end::Web font -->
        <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" media="all" type="text/css" href=<c:url value="/resources/assets/jquery-ui-timepicker-addon.css"/>" />

              <!--begin:: Global Mandatory Vendors -->
              <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />
        <!--begin:: Global Mandatory Vendors -->
        <link href="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.css"/>" rel="stylesheet" type="text/css" />

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
        <!-- coustom_style_css -->
        <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
        <!--RTL version:<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

        <!--end::Page Vendors Styles -->
        <!-- Angular script -->
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>

        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/faviconlp.ico"/>" />
        <style>
            .border_boxesDiv {
                border: 1px solid #dedede;
                padding: 15px;
                border-radius: 4px;
                transition: all .2s ease-in-out;
                margin-bottom: 30px; 
            }
            .devider_boxed:hover .edit_tender_bt {
                opacity: 1;
            }
            .devider_boxed .k-portlet__head {
                min-height: 40px;
                margin-bottom: 30px;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                border-bottom: 1px solid rgb(238, 238, 244);
            }
            dt.ui_tpicker_second_label.ui_tpicker_unit_hide {
                display: none;
            }

            dd.ui_tpicker_second.ui_tpicker_unit_hide {
                display: none;
            }

            dt.ui_tpicker_millisec_label.ui_tpicker_unit_hide {
                display: none;
            }

            dd.ui_tpicker_millisec.ui_tpicker_unit_hide {
                display: none;
            }


            .ui_tpicker_microsec_slider.ui_tpicker_unit_hide.ui-slider.ui-slider-horizontal.ui-widget.ui-widget-content.ui-corner-all {
                display: none;
            }
            dd.ui_tpicker_timezone.ui_tpicker_unit_hide {
                display: none;
            }
            dt.ui_tpicker_timezone_label.ui_tpicker_unit_hide {
                display: none;
            }
            .ui_tpicker_microsec_slider.ui_tpicker_unit_hide {
                display: none;
            }
            dt.ui_tpicker_microsec_label.ui_tpicker_unit_hide {
                display: none;
            }

            .ui_tpicker_microsec_slider.ui_tpicker_unit_hide.ui-slider.ui-slider-horizontal.ui-widget.ui-widget-content.ui-corner-all {
                display: none;
            }
            dd.ui_tpicker_timezone.ui_tpicker_unit_hide {
                display: none;
            }
            dt.ui_tpicker_timezone_label.ui_tpicker_unit_hide {
                display: none;
            }
            .ui_tpicker_microsec_slider.ui_tpicker_unit_hide {
                display: none;
            }
            div#ui-datepicker-div {
                z-index: 99999!important;
                padding: 15px;
            }
            body .ui-tooltip {
                border-width: 2px;
                display: none;
            }
            .shake-horizontal{
                animation-name: shake-horizontal;
                animation-duration: 400ms;
                animation-timing-function: ease-in-out;
                animation-iteration-count: infinite;
            }
            /*-----------------------------------------------------------*?
            
                    .clock_section {
                        color: #fd3b96;
                        font-weight: 100;
                        font-size: 25px;
                        line-height: 1.2;
                        margin: 0;
                    }
                    
                    .clock_section i {
                        padding: 13px;
                        position: relative;
                        top: 7px;
                        font-size: 21px;
                    }
                    
                    .clock_section .day_view {
                        display: block;
                        font-size: 14px;
                    } 
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
            .errorColor{
                color: red;
            }


        </style>


    </head>

    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="MainCtrl">
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
        <%--<%@include file="Tiles/TenderCreationWizard.jsp" %>--%>
        <jsp:include page="Tiles/TenderCreationWizard.jsp"/>
        <!--END_TENDER_WIZARD_MODAL_FORM-->



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
                                    <a href="" class="k-content__head-breadcrumb-link">Tender Information</a>
                                </div>
                            </div>

                        </div>
                        <!-- end:: Content Head -->
                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">
                            <!--begin::Row-->


                            <!--begin::Portlet-->

                            <div class="k-portlet "> 
                                <section class="tender_destails">
                                    <div class="k-portlet__body">
                                        <!--Load the Envelope Officer and Keywords on page load -->
                                        <c:if test="${tender.tenderStatus.equalsIgnoreCase('Created') || tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                            <span ng-init="arrangingTenderCreationWizard(); empanelContractorShow(${tender.areaOfWork}); tenderKeyWordsShow(${tender.areaOfWork});"></span>
                                        </c:if>
                                        <button type="button" ng-hide="true" id="tenderKeyDateValueFetch" class="tenderKeyDateValueFetch"></button>
                                        <form:form modelAttribute="tender" action="sentForApprovalProcess" id="validateSentForApproval">
                                            <div class="containerjlkjk">
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

                                                            <c:if test="${tender.getSelectiveTender().equalsIgnoreCase('2') || tender.getSelectiveTender().equalsIgnoreCase('4')}">                         
                                                                <tr>
                                                                    <th><span class="dwn_arrow">Empanel Contractor</span></th>
                                                                        <c:if test="${tender.getEmpanelContractorList() != null}">
                                                                        <td colspan="3"><span class="rs_ic"><c:forEach  var="contractor" items="${tender.getEmpanelContractorList()}">
                                                                                    ${contractor.firstname}&nbsp;${contractor.lastname} ,
                                                                                </c:forEach></span></td>
                                                                            </c:if> 
                                                                </tr>
                                                            </c:if>

                                                            <c:if test="${tender.getTenderCategory().equalsIgnoreCase('1')}">
                                                                <c:if test="${tender.getUploadSorList() != null}">
                                                                    <tr>
                                                                        <th colspan="2"><span class="dwn_arrow" >SOR Applicable</span></th>
                                                                        <th colspan="2"><span class="dwn_arrow" >SOR Document</span></th>
                                                                    </tr>
                                                                    <c:forEach var="uploadSor" items="${tender.getUploadSorList()}">
                                                                        <tr>
                                                                            <td colspan="2"><span class="rs_ic">
                                                                                    <c:out value="${uploadSor.fileName}"/><br/>
                                                                                </span></td> 
                                                                            <td colspan="2"><span class="rs_ic">
                                                                                    <a href="${context}/resources/UploadedDocuments/sorDocs/<c:out value="${uploadSor.fileconvertedName}"/>" target="_blank">View</a><br/>
                                                                                </span></td>
                                                                        </tr>   
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:if>

                                                            <c:if test="${tender.getTenderCategory().equalsIgnoreCase('2')}">
                                                                <tr>    
                                                                    <th><span class="dwn_arrow">Buy Back Document</span></th>
                                                                        <c:if test="${tender.getBuyBackPolicy().equalsIgnoreCase('yes')}">
                                                                        <td colspan="3"><span class="rs_ic">
                                                                                <a href="${context}/resources/UploadedDocuments/buybackdocument/<c:out value="${tender.buyBackDocument}"/>" target="_blank">View</a>
                                                                            </span></td>
                                                                        </c:if>  
                                                                        <c:if test="${tender.getBuyBackPolicy().equalsIgnoreCase('no')}">
                                                                        <td colspan="3"><span class="rs_ic">
                                                                                Not Applicable
                                                                            </span></td>
                                                                        </c:if>     
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
                                                                Tender Details
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
                                                               <th><span class="dwn_arrow">Envelop Type Number</span></th>
                                                                <td colspan="2"><span class="rs_ic"><c:out value="${tender.EnvelopeType}"/></span></td>
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
                                                            <button type="button" class="btn btn-primary btn-sm" id="updateTenderStep4" data-toggle="modal" data-target="#createTenderWizard" onclick="$('#step4').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});"><i class="flaticon-edit"></i>Edit</button>
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
                                                                Bidder Templates												</h3>
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
                                                                        <td class="table_wth-18"><span class="rs_ic"><a data-toggle="modal" data-target="#m_select_modal_view_template" href="#" ng-click="showModelForGenerateTemplate(${submittedEnvelopeA.envelopeAId}, 'A');" class="k-link"> View Template</a></span></td>
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

                                                        <c:if test="${departmentUserEnvelopeC != null}">
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

                                                    <c:if test="${tenderDocument!=null}">
                                                        <table class="table table-striped- table-bordered table-hover table-checkable ">
                                                            <tbody>
                                                                <tr>
                                                                    <th><span class="dwn_arrow">Documents Name</span></th>
                                                                    <th><span class="dwn_arrow">Documents Links</span></th> 
                                                                    <th><span class="dwn_arrow">Documents Visibility</span></th> 
                                                                </tr>
                                                                <c:forEach items="${tenderDocument}" var="tenderDocument">
                                                                    <tr>
                                                                        <td><span class="rs_ic"><c:out value="${tenderDocument.doc_Name}"/></span></td>
                                                                        <td><span class="rs_ic"><a href="${context}<c:out value="${tenderDocument.doc_Path}"/>" class="k-link" target="_blank">View</a></span></td>
                                                                        <c:if test="${tenderDocument.documentVisibility==true}">
                                                                            <td><span class="rs_ic">After Purchase</span></td> 
                                                                        </c:if>
                                                                        <c:if test="${tenderDocument.documentVisibility==false}">
                                                                            <td><span class="rs_ic">Before Purchase</span></td> 
                                                                        </c:if> 
                                                                    </tr>
                                                                </c:forEach> 
                                                            </tbody>
                                                        </table>
                                                    </c:if>

                                                    <c:if test="${tenderDocument==null}">
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



                                                <c:forEach items="${tenderKeyDateses}" var="tenderKeyDateses">            
                                                    <div class="devider_boxed border_boxesDiv">
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

                                                                <c:if test="${tender.getTenderStage().equalsIgnoreCase('1') && tenderKeyDateses.openingECaftertechopening.equalsIgnoreCase('no')}">
                                                                    <tr>
                                                                        <td><span class="rs_ic">5</span></td>
                                                                        <td><span class="rs_ic">OPENING(EC)</span></td>
                                                                        <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time"><c:out value="${tenderKeyDateses.openingEC}"/></span>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${tender.getTenderStage().equalsIgnoreCase('1') && tenderKeyDateses.openingECaftertechopening.equalsIgnoreCase('yes')}">
                                                                    <tr>
                                                                        <td><span class="rs_ic">5</span></td>
                                                                        <td><span class="rs_ic">OPENING(EC)</span></td>
                                                                        <td colspan="2"><i class="flaticon-calendar-with-a-clock-time-tools pull-left"></i><span class="start_date pd_right date_time">Opening EC after technical Bid</span>
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
                                                                    <td colspan="5"><span class="rs_ic"><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createTenderWizard" onclick="$('#step8').click();" ng-click="tenderKeyWordsShow(${tender.areaOfWork}); fetchTenderDetails(${tender.tender_Id});">Tender Notice</button></span></td>
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
                                                    <c:if test="${contractorClassMessage==null}"> 
                                                        <div class="button_section text-center ">
                                                            <input type="submit" class="btn btn-success" value="Sent For Approval" ></input>
                                                            <a href="eTendering" class="btn btn-secondary exit_bt btn-outline-hover-danger">Discard Changes</a>
                                                        </div>
                                                    </c:if> 
                                                    <c:if test="${contractorClassMessage.equalsIgnoreCase('Please Update Contractor Class')}"> 
                                                        <div class="button_section text-center ">
                                                            <input type="submit" class="btn btn-success" value="Sent For Approval" ng-disabled="true"></input>
                                                            <a href="eTendering" class="btn btn-secondary exit_bt btn-outline-hover-danger">Discard Changes</a>
                                                        </div>
                                                    </c:if>    
                                                    <div class="button_section text-right">
                                                        <button type="button" class="btn btn-danger exit_bt" ng-click="tenderDataReset(${tender.tender_Id}, '${tender.tenderNumber}', '${tender.nitNumber}', '${tender.nitDate}');">Reset</button>
                                                    </div>
                                                </c:if>
                                            </form:form> 
                                            <c:if test="${contractorClassMessage==null}">             
                                                <c:if test="${tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                    <c:if test="${tenderDocument!=null}">
                                                        <div class="button_section text-center ">
                                                            <a href="javascript:approveTenderProcess(${tender.tender_Id});" class="btn btn-success">Approve</a>
                                                            <a href="tenderStatusManaging/Canceled/${tender.tender_Id}" class="btn btn-warning">Cancellation Tender</a>
                                                            <a href="eTendering" class="btn btn-secondary exit_bt btn-outline-hover-danger">Discard Changes</a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${tenderDocument==null}">

                                                        <div class="button_section text-center ">
                                                            <button type="button" data-toggle="k-tooltip" title="Please Upload Singed PDF Documents To Approved this tender" data-placement="top" class="btn btn-success disabled_bt">Approved</button>
                                                            <a href="tenderStatusManaging/Canceled/${tender.tender_Id}" class="btn btn-warning">Cancellation Tender</a>
                                                            <a href="eTendering"  class="btn btn-secondary exit_bt btn-outline-hover-danger">Discard Changes</a>
                                                        </div>      
                                                    </c:if>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${contractorClassMessage.equalsIgnoreCase('Please Update Contractor Class')}"> 
                                                <c:if test="${tender.tenderStatus.equalsIgnoreCase('Sent For Approval')}">
                                                    <div class="button_section text-center ">
                                                        <input type="submit" class="btn btn-success disabled_bt" value="Approved" ng-disabled="true"></input>
                                                        <a href="tenderStatusManaging/Canceled/${tender.tender_Id}" class="btn btn-warning">Cancellation Tender</a>
                                                        <a href="eTendering"  class="btn btn-secondary exit_bt btn-outline-hover-danger">Discard Changes</a>
                                                    </div>    
                                                </c:if>
                                            </c:if> 
                                        </div>
                                    </div>
                                </section>
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
                        <%-- <jsp:include page="Tiles/AsideNavSecondary.jsp"/> --%>
                        <!-- end:: Aside Secondary -->
                        <!-- begin::Global Config -->
                        <!-- begin::Quick Panel -->
                        <%--    <jsp:include page="Tiles/QuickPanel.jsp"/>--%>
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
                        <!--<script src="<c:url value="/resources/vendors/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>-->
                        <!--<script src="<c:url value="/resources/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>" type="text/javascript"></script>-->
                        <!--<script src="<c:url value="/resources/vendors/theme/framework/vendors/bootstrap-timepicker/init.js"/>" type="text/javascript"></script>-->
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
                        <script src="<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script> 
                        <!--end::Page Vendors -->
                        <!--begin::Page Scripts -->
                        <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> 
                        <!--end::Page Scripts -->
                        <!--end::Global Theme Bundle -->
                        <!--<script src="<c:url value="/resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>--> 
                        <!-- Calender New DatePicker -->
                        <script src="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.full.js"/>" type="text/javascript"></script>
                        <!--Validating JS -->
                        <script src="<c:url value="/resources/validation/TenderValidation/TenderValidation.js"/>" type="text/javascript"></script> 
                        <script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
                        <script type="text/javascript" src="<c:url value="/resources/assets/jquery-ui-timepicker-addon.js"/>"></script>

                        <script>
                                    $('#slider_example_2').datetimepicker(
                            {dateFormat: 'dd-mm-yy', controlType: 'select', timeFormat: 'hh:mm TT'}
                            );</script>
                        <script>

                            <c:if test="${contractorClassMessage!=null}">
                            //Condition if the selective tenderer is update.
                            $(document).ready(function(){
                            var contractorClassMessage = '<c:out value="${contractorClassMessage}"/>';
                                    if (contractorClassMessage != ""){
                            swal(
                                    'Error',
                                    contractorClassMessage,
                                    'error'
                                    );
                                    $("#updateTenderStep4").click();
                                    $('#contractorClass').css("border-color", "red");
                    //                    $('#contractorClass').addClass('shake-horizontal');
                    //                    setTimeout("$('#contractorClass').removeClass('shake-horizontal');", 500);
                            }
                            });
                            </c:if>

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
                            console.log("prev button vapas hatana hai");
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
                                    $select.append($('<option>Select Tender Number</option>').val(0).html('<option>Select Tender Number</option>'));
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
                            });</script>
                        <script>
                        //    function abc1() {
                        //        var s_interval = $("input[name=radio2]:checked").val();
                        //        alert(s_interval);
                        //        if (s_interval == 7) {
                        //       // var tt = $("input[name=tenderCyclingManaging]").val();
                        //        var tt = $("input[name=tenderCyclingManaging]").datepicker({ dateFormat: 'dd/mm/yy hh:ii' }).val();
                        //        alert(tt);
                        //        var d = Date.parse(tt);
                        //        var date = new Date(d);
                        //        alert(date);
                        //        var newdate = new Date(date);
                        //        var five = new Date(newdate);
                        //        var se = new Date(five);
                        //        var js = new Date(se);
                        //        var jk = new Date(js);
                        //        var la = new Date(jk);
                        //       
                        //        newdate.setDate(newdate.getDate() + 5);
                        //        var dd = newdate.getDate();
                        //        var mm = newdate.getMonth() + 1;
                        //        var y = newdate.getFullYear();
                        //        var sunriseMills = newdate.getHours();
                        //        var offsetCityMills = newdate.getMinutes();
                        //        var offsetDeviceMills = newdate.getSeconds();
                        //        var textTime = new Date(sunriseMills + offsetCityMills + offsetDeviceMills).toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        
                        //        five.setDate(five.getDate() - 0);
                        //        var DD = five.getDate();
                        //        var MM = newdate.getMonth() + 1;
                        //        var Y = five.getFullYear();
                        //        var s = five.getHours();
                        //        var o = five.getMinutes();
                        //        var f = five.getTimezoneOffset();
                        //        var t = new Date(s + o + f)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        
                        //        se.setDate(se.getDate() + 5);
                        //        var ddd = se.getDate();
                        //        var mmm = se.getMonth() + 1;
                        //        var yy = se.getFullYear();
                        //        var s1 = se.getHours();
                        //        var o1 = se.getMinutes();
                        //        var f1 = se.getTimezoneOffset();
                        //        var t1 = new Date(s1 + o1 + f1)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        
                        //        js.setDate(js.getDate() + 6);
                        //        var DDD = js.getDate();
                        //        var MMM = js.getMonth() + 1;
                        //        var YY = js.getFullYear();
                        //        var s2 = js.getHours();
                        //        var o2 = js.getMinutes();
                        //        var f2 = js.getTimezoneOffset();
                        //        var t2 = new Date(s2 + o2 + f2)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        
                        //        jk.setDate(jk.getDate() + 6);
                        //        var dddd = jk.getDate();
                        //        var mmmm = jk.getMonth() + 1;
                        //        var yyy = jk.getFullYear();
                        //        
                        //        var s3 = jk.getHours();
                        //        var o3 = jk.getMinutes();
                        //        var f3 = jk.getTimezoneOffset();
                        //        var t3 = new Date(s3 + o3 + f3)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        
                        //        la.setDate(la.getDate() + 7);
                        //        var DDDD = la.getDate();
                        //        var MMMM = la.getMonth() + 1;
                        //        var YYY = la.getFullYear();
                        //        
                        //        var s4 = la.getHours();
                        //        var o4 = la.getMinutes();
                        //        var f4 = la.getTimezoneOffset();
                        //        var t4 = new Date(s4 + o4 + f4)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        var someFormattedDate = tt + "  -  " + dd + '/' + mm + '/' + y + " - " + textTime;
                        //        
                        //        document.getElementById('tenderPurchaseDate').value = someFormattedDate;
                        //        var someformattedDate = DD + '/' + MM + '/' + Y + " - " + t + "  -  " + ddd + '/' + mmm + '/' + yy + " - " + t1;
                        //        document.getElementById('bidSubmissionDate').value = someformattedDate;
                        //        var SomeformattedDate = DDD + '/' + MMM + '/' + YY + " - " + t2;
                        //        
                        //        $(".openingEA").val(SomeformattedDate);
                        //        var Someformatteddate = dddd + '/' + mmmm + '/' + yyy + " - " + t3;
                        //        $(".openingEB").val(SomeformattedDate);
                        //        var formatteddate = DDDD + '/' + MMMM + '/' + YYY + " - " + t4;
                        //        $(".openingEC").val(formatteddate);
                        //        
                        //    }
                        //
                        //    if (s_interval == 15) {
                        //         var tt = $("input[name=tenderCyclingManaging]").val();
                        //        var date = new Date(tt);
                        //        var newdate = new Date(date);
                        //        var five = new Date(newdate);
                        //        var se = new Date(five);
                        //        var js = new Date(se);
                        //        var jk = new Date(js);
                        //        var la = new Date(jk);
                        //        newdate.setDate(newdate.getDate() + 10);
                        //        var dd = newdate.getDate();
                        //        var mm = newdate.getMonth() + 1;
                        //        
                        //        var y = newdate.getFullYear();
                        //        var sunriseMills = newdate.getHours();
                        //        var offsetCityMills = newdate.getMinutes();
                        //        var offsetDeviceMills = newdate.getTimezoneOffset();
                        //        var textTime = new Date(sunriseMills + offsetCityMills + offsetDeviceMills)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        five.setDate(five.getDate() - 0);
                        //        var DD = five.getDate();
                        //        var MM = five.getMonth() + 1;
                        //        var Y = five.getFullYear();
                        //        var s = five.getHours();
                        //        var o = five.getMinutes();
                        //        var f = five.getTimezoneOffset();
                        //        var t = new Date(s + o + f)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        se.setDate(se.getDate() + 10);
                        //        var ddd = se.getDate();
                        //        var mmm = se.getMonth() + 1;
                        //        var yy = se.getFullYear();
                        //        js.setDate(js.getDate() + 11);
                        //        var DDD = js.getDate();
                        //        var MMM = js.getMonth() + 1;
                        //        var YY = js.getFullYear();
                        //        jk.setDate(jk.getDate() + 11);
                        //        var dddd = jk.getDate();
                        //        var mmmm = jk.getMonth() + 1;
                        //        var yyy = jk.getFullYear();
                        //        la.setDate(la.getDate() + 15);
                        //        var DDDD = la.getDate();
                        //        var MMMM = la.getMonth() + 1;
                        //        var YYY = la.getFullYear();
                        //        var someFormattedDate = tt + "  -  " + mm + '/' + dd + '/' + y + " " + textTime;
                        //        document.getElementById('tenderPurchaseDate').value = someFormattedDate;
                        //        var someformattedDate = MM + '/' + DD + '/' + Y + " " + t + "    " + mmm + '/' + ddd + '/' + yy + " " + textTime;
                        //        document.getElementById('bidSubmissionDate').value = someformattedDate;
                        //        var SomeformattedDate = MMM + '/' + DDD + '/' + YY + " " + textTime;
                        //        $(".openingEA").val(SomeformattedDate);
                        //        var Someformatteddate = dddd + '/' + mmmm + '/' + yyy + " - " + t3;
                        //        $(".openingEB").val(SomeformattedDate);
                        //        var formatteddate = DDDD + '/' + MMMM + '/' + YYY + " - " + t4;
                        //        $(".openingEC").val(formatteddate);
                        //        alert("15 Days Tender Key Cycle Successfully Added ");
                        //    }
                        //
                        //    if (s_interval == 30) {
                        //        var tt = $("input[name=tenderCyclingManaging]").val();
                        //        
                        //        var date = new Date(tt);
                        //        var newdate = new Date(date);
                        //        var five = new Date(newdate);
                        //        var se = new Date(five);
                        //        var js = new Date(se);
                        //        var jk = new Date(js);
                        //        var la = new Date(jk);
                        //        newdate.setDate(newdate.getDate() + 20);
                        //        var dd = newdate.getDate();
                        //        var mm = newdate.getMonth() + 1;
                        //        var y = newdate.getFullYear();
                        //        var sunriseMills = newdate.getHours();
                        //        var offsetCityMills = newdate.getMinutes();
                        //        var offsetDeviceMills = newdate.getTimezoneOffset();
                        //        var textTime = new Date(sunriseMills + offsetCityMills + offsetDeviceMills)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        five.setDate(five.getDate() - 0);
                        //        var DD = five.getDate();
                        //        var MM = five.getMonth() + 1;
                        //        var Y = five.getFullYear();
                        //        var s = five.getHours();
                        //        var o = five.getMinutes();
                        //        var f = five.getTimezoneOffset();
                        //        var t = new Date(s + o + f)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        se.setDate(se.getDate() + 20);
                        //        var ddd = se.getDate();
                        //        var mmm = se.getMonth() + 1;
                        //        var yy = se.getFullYear();
                        //        js.setDate(js.getDate() + 21);
                        //        var DDD = js.getDate();
                        //        var MMM = js.getMonth() + 1;
                        //        var YY = js.getFullYear();
                        //        jk.setDate(jk.getDate() + 21);
                        //        var dddd = jk.getDate();
                        //        var mmmm = jk.getMonth() + 1;
                        //        var yyy = jk.getFullYear();
                        //        la.setDate(la.getDate() + 22);
                        //        var DDDD = la.getDate();
                        //        var MMMM = la.getMonth() + 1;
                        //        var YYY = la.getFullYear();
                        //        var someFormattedDate = tt + "  -  " + mm + '/' + dd + '/' + y + " " + textTime;
                        //        document.getElementById('tenderPurchaseDate').value = someFormattedDate;
                        //        var someformattedDate = MM + '/' + DD + '/' + Y + " " + t + "    " + mmm + '/' + ddd + '/' + yy + " " + textTime;
                        //        document.getElementById('bidSubmissionDate').value = someformattedDate;
                        //        var SomeformattedDate = MMM + '/' + DDD + '/' + YY + " " + textTime;
                        //       $(".openingEA").val(SomeformattedDate);
                        //        var Someformatteddate = dddd + '/' + mmmm + '/' + yyy + " - " + t3;
                        //        $(".openingEB").val(SomeformattedDate);
                        //        var formatteddate = DDDD + '/' + MMMM + '/' + YYY + " - " + t4;
                        //        $(".openingEC").val(formatteddate);
                        //        alert("30 Days Tender Key Cycle Successfully Added ");
                        //    }
                        //
                        //    if (s_interval == 45) {
                        //         var tt = $("input[name=tenderCyclingManaging]").val();
                        //        
                        //        var date = new Date(tt);
                        //        var newdate = new Date(date);
                        //        var five = new Date(newdate);
                        //        var se = new Date(five);
                        //        var js = new Date(se);
                        //        var jk = new Date(js);
                        //        var la = new Date(jk);
                        //        newdate.setDate(newdate.getDate() + 30);
                        //        var dd = newdate.getDate();
                        //        var mm = newdate.getMonth() + 1;
                        //        var y = newdate.getFullYear();
                        //        var sunriseMills = newdate.getHours();
                        //        var offsetCityMills = newdate.getMinutes();
                        //        var offsetDeviceMills = newdate.getTimezoneOffset();
                        //        var textTime = new Date(sunriseMills + offsetCityMills + offsetDeviceMills)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        five.setDate(five.getDate() - 0);
                        //        var DD = five.getDate();
                        //        var MM = five.getMonth() + 1;
                        //        var Y = five.getFullYear();
                        //        var s = five.getHours();
                        //        var o = five.getMinutes();
                        //        var f = five.getTimezoneOffset();
                        //        var t = new Date(s + o + f)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        se.setDate(se.getDate() + 30);
                        //        var ddd = se.getDate();
                        //        var mmm = se.getMonth() + 1;
                        //        var yy = se.getFullYear();
                        //        js.setDate(js.getDate() + 31);
                        //        var DDD = js.getDate();
                        //        var MMM = js.getMonth() + 1;
                        //        var YY = js.getFullYear();
                        //        jk.setDate(jk.getDate() + 31);
                        //        var dddd = jk.getDate();
                        //        var mmmm = jk.getMonth() + 1;
                        //        var yyy = jk.getFullYear();
                        //        la.setDate(la.getDate() + 45);
                        //        var DDDD = la.getDate();
                        //        var MMMM = la.getMonth() + 1;
                        //        var YYY = la.getFullYear();
                        //        var someFormattedDate = tt + "  -  " + mm + '/' + dd + '/' + y + " " + textTime;
                        //        document.getElementById('tenderPurchaseDate').value = someFormattedDate;
                        //        var someformattedDate = MM + '/' + DD + '/' + Y + " " + t + "    " + mmm + '/' + ddd + '/' + yy + " " + textTime;
                        //        document.getElementById('bidSubmissionDate').value = someformattedDate;
                        //        var SomeformattedDate = MMM + '/' + DDD + '/' + YY + " " + textTime;
                        //        $(".openingEA").val(SomeformattedDate);
                        //        var Someformatteddate = dddd + '/' + mmmm + '/' + yyy + " - " + t3;
                        //        $(".openingEB").val(SomeformattedDate);
                        //        var formatteddate = DDDD + '/' + MMMM + '/' + YYY + " - " + t4;
                        //        $(".openingEC").val(formatteddate);
                        //        alert("45 Days Tender Key Cycle Successfully Added ");
                        //    }
                        //
                        //    if (s_interval == 60) {
                        //         var tt = $("input[name=tenderCyclingManaging]").val();
                        //        
                        //        var date = new Date(tt);
                        //        var newdate = new Date(date);
                        //        var five = new Date(newdate);
                        //        var se = new Date(five);
                        //        var js = new Date(se);
                        //        var jk = new Date(js);
                        //        var la = new Date(jk);
                        //        newdate.setDate(newdate.getDate() + 50);
                        //        var dd = newdate.getDate();
                        //        var mm = newdate.getMonth() + 1;
                        //        var y = newdate.getFullYear();
                        //        var sunriseMills = newdate.getHours();
                        //        var offsetCityMills = newdate.getMinutes();
                        //        var offsetDeviceMills = newdate.getTimezoneOffset();
                        //        var textTime = new Date(sunriseMills + offsetCityMills + offsetDeviceMills)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        five.setDate(five.getDate() - 0);
                        //        var DD = five.getDate();
                        //        var MM = five.getMonth() + 1;
                        //        var Y = five.getFullYear();
                        //        var s = five.getHours();
                        //        var o = five.getMinutes();
                        //        var f = five.getTimezoneOffset();
                        //        var t = new Date(s + o + f)
                        //                .toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric'});
                        //        se.setDate(se.getDate() + 50);
                        //        var ddd = se.getDate();
                        //        var mmm = se.getMonth() + 1;
                        //        var yy = se.getFullYear();
                        //        js.setDate(js.getDate() + 51);
                        //        var DDD = js.getDate();
                        //        var MMM = js.getMonth() + 1;
                        //        var YY = js.getFullYear();
                        //        jk.setDate(jk.getDate() + 51);
                        //        var dddd = jk.getDate();
                        //        var mmmm = jk.getMonth() + 1;
                        //        var yyy = jk.getFullYear();
                        //        la.setDate(la.getDate() + 60);
                        //        var DDDD = la.getDate();
                        //        var MMMM = la.getMonth() + 1;
                        //        var YYY = la.getFullYear();
                        //        var someFormattedDate = tt + "  -  " + mm + '/' + dd + '/' + y + " " + textTime;
                        //        document.getElementById('tenderPurchaseDate').value = someFormattedDate;
                        //        var someformattedDate = MM + '/' + DD + '/' + Y + " " + t + "    " + mmm + '/' + ddd + '/' + yy + " " + textTime;
                        //        document.getElementById('bidSubmissionDate').value = someformattedDate;
                        //        var SomeformattedDate = MMM + '/' + DDD + '/' + YY + " " + textTime;
                        //        $(".openingEA").val(SomeformattedDate);
                        //        var Someformatteddate = dddd + '/' + mmmm + '/' + yyy + " - " + t3;
                        //        $(".openingEB").val(SomeformattedDate);
                        //        var formatteddate = DDDD + '/' + MMMM + '/' + YYY + " - " + t4;
                        //        $(".openingEC").val(formatteddate);
                        //        alert("60 Days Tender Key Cycle Successfully Added ");
                        //    }
                        //      }
                        //    function confirmreset()
                        //
                        // {
                        //
                        //  return confirm("Do you want to reset the form?");
                        //
                        // }
                                    $("#viewQCBSButton").hide();</script>
                        <script>
                                    $(function() {
                                    $(".preloader").fadeOut(2000, function() {
                                    $(".loader_main").fadeIn(1000);
                                    });
                                            });
                        </script>
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
                            var tenderid = "";
                                    function approveTenderProcess(tenderId) {
                                    $('#preloaderSpinner').show();
                                            randomNo = getRandomInt(1, 300000);
                                            randomNo = randomNo + "TAB";
                                            var url = "ApproveTenderProcess?randomNo=" + randomNo;
                                            window.open(url);
                                            tenderid = tenderId;
                                            //alert("tenderId : "+tenderid);

                                            checkJnlpExeStatus(tenderId);
                                    }



                            function checkJnlpExeStatus(tenderId) {
                            $.ajax({
                            url: "accessJnlpExeStatus?randomNo=" + randomNo,
                                    cache: false,
                                    success: function (response) {
                                    var data = JSON.parse(response);
                                            console.log
                                            // Run if status is active and result is success
                                            if (data[0] == 'success' && data[1] == 'active') {
                                    console.log("polling end...");
                                            $('#preloaderSpinner').hide();
                                            if (randomNo.indexOf('NEWTAB') > - 1) { // open url in new tab
                                    window.open(data[2], "_blank");
                                    } else { // open url in same tab
                                    alert("tenderId : " + tenderid);
                                            window.location.href = "tenderStatusManaging/Approved/" + tenderid;
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


                        </script>
                        <script>
                        //resources/js/addons/datatables.min.js    
                            $(document).ready(function() {
                            $('.tenderData').DataTable({
                            "order": [[ 1, "desc" ]]
                            });
                                    });
                        </script>
                        </body>
                        <!-- end::Body -->
                        </html>