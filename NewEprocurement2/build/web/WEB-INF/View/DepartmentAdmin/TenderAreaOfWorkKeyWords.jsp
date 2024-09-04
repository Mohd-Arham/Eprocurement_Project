<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Procurelinc e-Procurement | Home</title>
        <!-- Favicon lotus procure -->
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
        <!--begin:: Global Mandatory Vendors -->
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

        <!--begin:: Global Mandatory Vendors -->
        <link href="<c:url value="vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />

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

    <!--RTL version:<link href="<c:url value="/resources/assets/demo/base/style.bundle.rtl.css"/>" rel="stylesheet" type="text/css" />-->

        <!--end::Global Theme Styles -->
        <!--begin::Page Vendors Styles -->
        <link href="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.css"/>" rel="stylesheet" type="text/css" />
        <!--end::Global Theme Styles -->

        <link href="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css"/>" rel="stylesheet" type="text/css" />

        <!--RTL version:<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

        <!--end::Page Vendors Styles -->
        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/faviconlp.ico"/>" />
        <!-- coustom_style_css -->
        <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>

    </head>

    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="MyController">


        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="index.html">
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

                    <jsp:include page="../DepartmentAdmin/Tiles/Asidemenu.jsp"></jsp:include>

                        <!-- begin:: Aside -->
                        <div class="k-aside__footer k-grid__item d-none" id="k_aside_footer">
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

                    <jsp:include page="../DepartmentAdmin/Tiles/AdminHeader.jsp"></jsp:include>


                        <!-- begin:: Content -->
                        <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                            <!-- begin:: Content Head -->
                            <div class="k-content__head	k-grid__item">
                                <div class="k-content__head-main">
                                    <h3 class="k-content__head-title">Tender Category Area Of Work Tender Keyword</h3>
                                    <div class="k-content__head-breadcrumbs">
                                        <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                        <span class="k-content__head-breadcrumb-separator"></span>
                                        <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                        <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                    </div>
                                </div>
                            </div>

                            <!-- end:: Content Head --> 
                            <!-- begin:: Content Body -->
                            <div class="k-content__body	k-grid__item k-grid__item--fluid">

                                <!--begin::Row-->

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="k-portlet alert_part circle_create"> 
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon ">
                                                        <i class="flaticon-add"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">Tender Category</h3>
                                                </div>
                                                <div class="k-portlet__head-toolbar">
                                                    <div class="k-portlet__head-group">
                                                        <div class="btn-group">
                                                            <!--begin: Search -->
                                                            <div class="k-header__topbar-item k-header__topbar-item--search dropdown">
                                                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                                                    <span class="k-header__topbar-icon"><i class="flaticon-search"></i></span>
                                                                </div>
                                                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-lg">
                                                                    <form method="get">
                                                                        <div class="k-input-icon k-input-icon--left">
                                                                            <input type="text" name="query" value="" class="form-control" placeholder="Search...">
                                                                            <span class="k-input-icon__icon k-input-icon__icon--left">
                                                                                <span><i class="la la-search"></i></span>
                                                                            </span>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>

                                                            <!--end: Search -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body1">
                                                <div class="k-notification k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" style="height: 400px; overflow: hidden;">
                                                    <a href="#" class="k-notification__item" ng-repeat="x in all_Category">
                                                        <!--                                                        <div class="k-notification__item-icon" data-toggle="modal" data-target="#circle_create">
                                                                                                              </div>-->
                                                        <style>         
                                                            .category0{
                                                                color:#5867dd !important;
                                                            }
                                                        </style>
                                                        <div class="k-notification__item-details">
                                                            <div class="k-notification__item-title">
                                                                <span id="tender_category_id" class="category{{$index}}" role="tab" data-toggle="tab" ng-class="{'active': $index == activeTab}" ng-click="areaofwork(x.tender_category_id)">{{x.tender_category_name}}</span>
                                                            </div>

                                                        </div>
                                                    </a> 
                                                </div>
                                                <div class="text-center mb-2 mt-2">
                                                    <!--<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#circle_create"><i class="flaticon-add-circular-button"></i>Add Circle</button>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div><!--end::Portlet-->
                                    <div class="col-md-4">
                                        <div class="k-portlet alert_part circle_create"> 
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon" >
                                                        <i class="flaticon-add"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">Area Of Work</h3>
                                                </div>
                                                <div class="k-portlet__head-toolbar">
                                                    <div class="k-portlet__head-group">
                                                        <div class="btn-group">
                                                            <!--begin: Search -->
                                                            <div class="k-header__topbar-item k-header__topbar-item--search dropdown">
                                                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                                                    <span class="k-header__topbar-icon"><i class="flaticon-search"></i></span>
                                                                </div>
                                                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-lg">
                                                                    <form method="get">
                                                                        <div class="k-input-icon k-input-icon--left">
                                                                            <input type="text" value="" class="form-control" placeholder="Search..." onkeyup="myFunctionAreaOfWork()" name="search" id="search1" >
                                                                            <span class="k-input-icon__icon k-input-icon__icon--left">
                                                                                <span><i class="la la-search"></i></span>
                                                                            </span>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>

                                                            <!--end: Search -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body1">
                                                <div class="k-notification k-scroll k-scroller ps ps--active-y" id="awDiv" data-scroll="true" data-height="400" style="height: 400px; overflow: hidden;">
                                                    <span class="contentNotFound">{{msg_AreaOfWork}}</span>
                                                    <a href="#" class="k-notification__item" ng-repeat="y in all_AreaOfWork">
                                                        <div class="k-notification__item-icon" data-toggle="modal" data-target="#myModal2">
                                                            <i class="la la-edit" ng-click="updateAreaOfWork(y.areaofwork_id)"></i>
                                                        </div>
                                                        <style>  
                                                            .areaofworks0{
                                                                color:#5867dd !important;
                                                            }
                                                        </style>
                                                        <div class="k-notification__item-details">
                                                            <div class="k-notification__item-title">
                                                                <span id="areaofwork_id" class="areaofworks{{$index}}" role="tab" data-toggle="tab" ng-class="{'active': $index == activeTab}" ng-click="keyword(y.areaofwork_id)">{{y.areaofwork_name}}</span>
                                                            </div>

                                                        </div>
                                                        <div class="k-notification__item-icon" >
                                                            <button ng-click="AreaOfWorkshowAlert(y.areaofwork_id)" style="border: none; cursor: pointer; background-color:#F3F6F4;"><i class="la la-archive"></i></button>
                                                        </div>
                                                    </a> 
                                                </div> 
                                                <div class="text-center mb-2 mt-2">
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal2"><i class="flaticon-add-circular-button"></i>Add Area Of Work</button>
                                                </div>
                                            </div> 
                                        </div>
                                    </div><!--end::Portlet-->
                                    <div class="col-md-4">
                                        <div class="k-portlet alert_part circle_create"> 
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon" >
                                                        <i class="flaticon-add"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">Tender Keyword</h3>
                                                </div>
                                                <div class="k-portlet__head-toolbar">
                                                    <div class="k-portlet__head-group">
                                                        <div class="btn-group">
                                                            <!--begin: Search -->
                                                            <div class="k-header__topbar-item k-header__topbar-item--search dropdown">
                                                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                                                    <span class="k-header__topbar-icon"><i class="flaticon-search"></i></span>
                                                                </div>
                                                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-lg">
                                                                    <form method="get">
                                                                        <div class="k-input-icon k-input-icon--left">
                                                                            <input type="text" name="search" value="" class="form-control" placeholder="Search..." onkeyup="myFunctionKeyword()" id="search2">
                                                                            <span class="k-input-icon__icon k-input-icon__icon--left">
                                                                                <span><i class="la la-search"></i></span>
                                                                            </span>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>

                                                            <!--end: Search -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body1">
                                                <div class="k-notification k-scroll k-scroller ps ps--active-y" id="keywordDiv" data-scroll="true" data-height="400" style="height: 400px; overflow: hidden;">
                                                    <span class="contentNotFound">{{msg_Keyword}}</span>
                                                    <a href="#" class="k-notification__item" ng-repeat="z in all_Keyword">
                                                        <div class="k-notification__item-icon" data-toggle="modal" data-target="#myModal3">
                                                            <i class="la la-edit"  ng-click="updateKeyword(z.tenderKeyWordsId)"></i>
                                                        </div>
                                                        <style>  
                                                            .keywords0{
                                                                color:#5867dd !important;
                                                            }
                                                        </style>
                                                        <div class="k-notification__item-details">
                                                            <div class="k-notification__item-title">
                                                                <span id="tenderKeyWordsId" class="keywords{{$index}}" role="tab" data-toggle="tab" ng-class="{'active': $index == activeTab}" >{{z.tenderKeyWordsName}}</span>
                                                            </div>

                                                        </div>
                                                        <div class="k-notification__item-icon" >
                                                            <button ng-click="showAlert(z.tenderKeyWordsId)" style="border: none; cursor: pointer; background-color:#F3F6F4;"><i class="la la-archive"></i></button>
                                                        </div>
                                                    </a> 
                                                </div>
                                                <div class="text-center mb-2 mt-2">
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal3"><i class="flaticon-add-circular-button"></i>Add Tender Keyword</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!--end::Portlet-->
                                </div>
                                <!--end::Row-->
                            </div>
                            <!-- end:: Content Body -->
                        </div>
                        <!-- end:: Content -->
                    </div>

                    <!-- begin:: Aside Secondary -->
                <jsp:include page="Tiles/AsideNavSecondary.jsp"/>
                <!-- end:: Aside Secondary -->
            </div>
        </div>

        <!-- end:: Page -->

        <!-- begin::Scrolltop -->
        <div id="k_scrolltop" class="k-scrolltop">
            <i class="la la-arrow-up"></i>
        </div>

        <!-- end::Scrolltop -->

        <!-- begin::Quick Panel -->
        <jsp:include page="Tiles/QuickPanel.jsp"/>

        <!-- end::Quick Panel -->


        <div class="modal fade mdl-bg" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="assets/demo/media/logo-dark.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Create Division</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form:form modelAttribute="addareaofwork" name="myForm" id="form_Id" class="k-form">
                        <form:hidden path="areaofwork_id" id="areaofwork_idP"/>
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Tender Category</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <span id="spanid11" style="color:red"></span> 
                                    <form:select path="tender_category_id" class="form-control" id="tender_category_idP">
                                        <form:option value="-1">Select</form:option>
                                        <c:forEach var="categoryList" items="${categoryList}" >   
                                            <form:option value="${categoryList.tender_category_id}">${categoryList.tender_category_name}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Area Of Work</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <span id="spanid22" style="color:red"></span>
                                    <form:input path="areaofwork_name" id="areaofwork_name" class="form-control" placeholder="Area Of Work"  style="text-transform: uppercase;"/>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success btn-sm" id="myForm" ng-click="save_AreaOfWork()">Add</button>
                            <button type="button" class="btn btn-primary btn-sm">Reset</button>
                            <button type="button" class="btn btn-secondary btn-sm" id="awBTN" data-dismiss="modal">Close</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

        <div class="modal fade mdl-bg" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="assets/demo/media/logo-dark.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Tender Keywords</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <form:form modelAttribute="addkeywords" name="mineForm" id="form_Id2" class="k-form">                                  
                        <form:hidden path="tenderKeyWordsId" id="tenderKeyWordsIdP"/>
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Tender Category</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <span id="spanid1" style="color:red"></span>
                                    <form:select path="tender_category_id" id="selectcategoryidP" onchange="categoryid()" class="form-control">
                                        <form:option value="-1">Select</form:option>
                                        <form:option ng-repeat="x in all_Category" value="{{x.tender_category_id}}">{{x.tender_category_name}}</form:option>  
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Area Of Work</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <span id="spanid2" style="color:red"></span> 
                                    <form:select path="areaofwork_id" id="areaofwork" class="form-control">  
                                        <form:option value="-1">Select</form:option>       
                                        <form:option value="1">First Select Category</form:option>
                                    </form:select>   
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Tender Keyword</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <div id="spanid3" style="color:red"></div>
                                    <form:input path="tenderKeyWordsName" id="tenderkeywordid"  class="form-control" placeholder="Keywords"  style="text-transform: uppercase;"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success btn-sm" id="mineForm" ng-click="save_Keywords()">Add</button>
                                <button type="button" class="btn btn-primary btn-sm">Reset</button>
                                <button type="button" class="btn btn-secondary btn-sm" id="keywordBTN" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </form:form>
                </div>
            </div>
        </div>

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
        <script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.min.js" />"type="text/javascript"></script>
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
        <script src="<c:url value="/resources/vendors/bootstrap-maxlength/src/bootstrap-maxlength.js" />"type="text/javascript"></script>
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


        <!--end::Page Scripts -->

        <script src="<c:url value="/resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

        <script src="<c:url value="/resources/assets/vendors/custom/flot/flot.bundle.js"/>" type="text/javascript"></script>

        <script src="<c:url value="/resources/assets/demo/custom/components/charts/flotcharts.js"/>" type="text/javascript"></script>
        <!--begin::Global App Bundle -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>

        <!--end:: Global Optional Vendors -->


        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>


        <!--begin::Page Vendors -->
        <script src="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-select.js"/>"  type="text/javascript"></script>

        <!--end::Page Vendors -->

        <script src="<c:url value="/resources/assets/demo/custom/components/base/popovers.js"/>"  type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/app/scripts/custom/dashboard.js"/>"  type="text/javascript"></script>



        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/calendar/basic.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/angular/script.js" />"></script>
        <script type="text/javascript">
                    $(window).on('load', function () {
                        $('#contractor_notification').modal('show');
                    });
        </script>

        <!--begin::Global Theme Bundle -->

        <script>
                    function categoryid() {
                        var tender_category_id = $("#selectcategoryidP").val();
                        //                alert(tender_category_id);
                        $.ajax({
                            type: "GET",
                            url: "getTenderAreaWorkByCatId",
                            data: {'tender_category_id': tender_category_id},
                            dataType: 'text',
                            success: function (response) {
                                // alert(response);
                                var $select = $('#areaofwork');
                                $select.find('option').remove();
                                $('<option>').val("-1").text("Select").appendTo($select);
                                $.each(JSON.parse(response), function (key, value) {
                                    $('<option>').val(value["areaofwork_id"]).text(value["areaofwork_name"]).appendTo($select);
                                });
                                //again onchange function
                                $("#areaofwork").change(function () {
                                    var areaofwork_id = $("#areaofwork").val();
                                    var areaofwork_name = $("areaofwork").val();
                                    //                            alert(areaofwork_name);
                                });
                                document.getElementById('wait').style.display = 'none';
                            },
                            error: function (e) {
                                alert('Error: ' + e);
                                document.getElementById('wait').style.display = 'none';
                            }
                        });
                    }
        </script>
        <!-----------------------JS VALIDATION---------------->
        <script>
                    function validateForm() {
                        alert("validation");
                        var countError = 0;
                        var x = document.forms["myForm"]["tender_category_id"].value;
                        alert("x::" + x)
                        var y = document.forms["myForm"]["areaofwork_name"].value;
                        alert("y::" + y);
                        if (x == "-1")
                        {
                            //  alert("Tender Category must be filled out");
                            document.getElementById("spanid11").innerHTML = "Please Select Tender Category";
                            countError++;
                        } else {
                            document.getElementById("spanid11").innerHTML = "";
                        }
                        if (y == "") {
                            //  alert("Area of Work must be filled out");
                            document.getElementById("spanid22").innerHTML = "Please Enter Area Of Work";
                            countError++;
                        } else {
                            document.getElementById("spanid22").innerHTML = "";
                        }
                        if (!/^[a-zA-Z0-9 ]*$/g.test(document.myForm.areaofwork_name.value)) {
                            //   alert("Enter Alphabets Only");
                            document.getElementById("spanid22").innerHTML = "Special Characters are not Allowed";
                            countError++;
                        }
                        return countError;

                    };
        </script>-->

        <script>
                    function formValidation() {
                        alert("validation ");
                        var countError = 0;
                        var x = document.forms["mineForm"]["tender_category_id"].value;
                        var y = document.forms["mineForm"]["areaofwork_id"].value;
                        var z = document.forms["mineForm"]["tenderKeyWordsName"].value;
                        if (x == -1)
                        {
                            // alert("Tender Category must be filled out");
                            document.getElementById("spanid1").innerHTML = "Please Select Tender Category";
                            countError++;
                        } else {
                            document.getElementById("spanid1").innerHTML = "";
                        }
                        if (y == -1) {
                            //  alert("Area of Work must be filled out");
                            document.getElementById("spanid2").innerHTML = "Please Select Area Of Work";
                            countError++;
                        } else {
                            document.getElementById("spanid2").innerHTML = "";
                        }
                        if (z == "") {
                            //  alert("Keyword must be filled out");
                            document.getElementById("spanid3").innerHTML = "Please Enter Tender Keyword";
                            countError++;
                        } else {
                            document.getElementById("spanid3").innerHTML = "";
                        }
                        if (!/^[a-zA-Z0-9 ]*$/g.test(document.mineForm.tenderKeyWordsName.value)) {
    //                        alert("Enter Alphabets Only");
                            document.getElementById("spanid3").innerHTML = "Special Characters are not Allowed";
                            countError++;
                        }
                        return countError;
                    };

                    function myFunctionAreaOfWork() {
                        var input, filter, a, i, div, span;
                        input = document.getElementById("search1");
                        filter = input.value.toUpperCase();
                        div = document.getElementById("awDiv");
                        a = div.getElementsByTagName("a");
                        for (i = 0; i < a.length; i++) {
                            span = a[i].getElementsByTagName("span")[0];
                            if (span.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                a[i].style.display = "";
                            } else {
                                a[i].style.display = "none";
                            }
                        }
                    }

                    function myFunctionKeyword() {
                        var input, filter, a, i, div, span;
                        input = document.getElementById("search2");
                        filter = input.value.toUpperCase();
                        div = document.getElementById("keywordDiv");
                        a = div.getElementsByTagName("a");
                        for (i = 0; i < a.length; i++) {
                            span = a[i].getElementsByTagName("span")[0];
                            if (span.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                a[i].style.display = "";
                            } else {
                                a[i].style.display = "none";
                            }
                        }
                    }
        </script>
        <!-----------------------JS VALIDATION END---------------->
    </body>
    <!-- end::Body -->

</html>
