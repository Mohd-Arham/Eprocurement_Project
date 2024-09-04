<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js"/>"></script>
    </head>

    <!-- end::Head -->

    <!-- begin::Body -->

    <body  ng-controller="myCtrl" onload="backButtonDisable();" class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled">

        <!-- Modal -->
        <div class="modal fade" id="contractor_notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:63%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Digital Signature Certificate (DSC) Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification_md">
                        <div class="k-portlet__body">
                            <table class="table table-bordered tenderData"> 
                                <thead> 
                                    <tr class="table_th tbl_row_bg"> 
                                        <th class="k-font-bolder">Certificate Type</th>
                                        <th class="k-font-bolder">Status</th>
                                        <th class="k-font-bolder">Verify Certificate</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table_data_viewDSC">
                                        <td><p class="td_data">Signing</p></td>
                                        <td><p class="td_data">Verified</p></td>
                                        <td><p class="td_data"><a href="#" class="btn btn-info btn-sm">Verify Now</a></p></td>										
                                    </tr>
                                    <tr class="table_data_viewDSC">
                                        <td><p class="td_data">Encryption</p></td>
                                        <td><p class="td_data">Not Verified</p></td> 
                                        <td><p class="td_data"><a href="#" class="btn btn-info btn-sm">Verify Now</a></p></td>
                                    </tr> 
                                </tbody>
                            </table>



                            <style>
                                .table_data_viewDSC{

                                }
                                .table_data_viewDSC p{
                                    margin:0px;
                                }
                                .fa_lineheight{
                                    line-height:inherit;}
                                .important_note .alert .alert-icon i{
                                    font-size:1.6rem;
                                }
                                .important_note .alert .alert-text{
                                    font-weight:600;
                                }
                            </style>
                            <div class="important_note">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-group-last">
                                            <div class="alert alert-secondary" role="alert">
                                                <div class="alert-icon"><i class="flaticon-close k-font-danger"></i></div>
                                                <div class="alert-text">
                                                    Not Verified / Revoked
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-group-last">
                                            <div class="alert alert-secondary" role="alert">
                                                <div class="alert-icon"><i class="flaticon-exclamation-1 k-font-warning"></i></div>
                                                <div class="alert-text">
                                                    About to Expired
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-group-last">
                                            <div class="alert alert-secondary" role="alert">
                                                <div class="alert-icon"><i class="fa fa-check-circle k-font-success fa_lineheight"></i></div>
                                                <div class="alert-text">
                                                    Verified & Valid
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div> 
                            </div>
                        </div> 	
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


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
                    <jsp:include page="Tiles/DashBoardAsideNav.jsp"/>
                    <!-- end:: Aside -->


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

                    <jsp:include page="Tiles/AdminHeader.jsp"></jsp:include>
                        <!-- end:: Header -->

                        <!-- begin:: Content -->
                        <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                            <!-- begin:: Content Head -->
                            <div class="k-content__head	k-grid__item">
                                <div class="k-content__head-main">
                                    <h3 class="k-content__head-title">Department Admin</h3>
                                    <div class="k-content__head-breadcrumbs">
                                        <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                        <span class="k-content__head-breadcrumb-separator"></span>
                                        <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                        <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                    </div>
                                </div>
                                <div class="k-content__head-toolbar d-none">
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
                            <div class="k-content__body	k-grid__item k-grid__item--fluid">
                                <!--begin::Row-->
                                <div class="row">
                                    <div class="col-xl-4 col-xxl-4 order-xxl-1">

                                        <!--begin::Portlet-->
                                        <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                            <div class="k-portlet__body">
                                                <div class="k-widget-10__wrapper">
                                                    <div class="k-widget-10__details">
                                                        <div class="k-widget-10__title">Total Tender</div>
                                                        <div class="k-widget-10__desc">December 2018</div>
                                                    </div>
                                                    <div class="k-widget-10__num">
                                                        7599
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body k-portlet__body--fit">
                                                <div class="k-widget-10__chart">
                                                    <canvas id="k_widget_mini_chart_1" height="100"></canvas>
                                                </div>
                                            </div>
                                        </div>

                                        <!--end::Portlet-->
                                    </div>
                                    <div class="col-xl-4 col-xxl-4 order-xxl-1">

                                        <!--begin::Portlet-->
                                        <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                            <div class="k-portlet__body">
                                                <div class="k-widget-10__wrapper">
                                                    <div class="k-widget-10__details">
                                                        <div class="k-widget-10__title">Tender Purchase</div>
                                                        <div class="k-widget-10__desc">December 2018</div>
                                                    </div>
                                                    <div class="k-widget-10__num">
                                                        7,300
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body k-portlet__body--fit">
                                                <div class="k-widget-10__chart">
                                                    <canvas id="k_widget_mini_chart_2" height="100"></canvas>
                                                </div>
                                            </div>
                                        </div>

                                        <!--end::Portlet-->
                                    </div>
                                    <div class="col-xl-4 col-xxl-4 order-xxl-1">

                                        <!--begin::Portlet-->
                                        <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                            <div class="k-portlet__body">
                                                <div class="k-widget-10__wrapper">
                                                    <div class="k-widget-10__details">
                                                        <div class="k-widget-10__title">Total Bidder Participate</div>
                                                        <div class="k-widget-10__desc">December 2018</div>
                                                    </div>
                                                    <div class="k-widget-10__num">
                                                        1958
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body k-portlet__body--fit">
                                                <div class="k-widget-10__chart">
                                                    <canvas id="k_widget_mini_chart_3" height="100"></canvas>
                                                </div>
                                            </div>
                                        </div>

                                        <!--end::Portlet-->
                                    </div>
                                </div>

                                <!--end::Row-->
                                <!--begin::Row-->

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="k-portlet alert_part status_menu">
                                            <div class="k-portlet__body1">
                                                <!--begin: Quick actions -->
                                                <div class="k-header__topbar-item dropdown">
                                                    <div class=" dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl">
                                                        <div class="k-head" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                                            <h3 class="k-head__title">Today's Stats</h3>
                                                        </div>
                                                        <div class="k-grid-nav">
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="flaticon-users"></i></div>
                                                                <div class="k-grid-nav__item-title">1212</div>
                                                                <div class="k-grid-nav__item-desc">Department User's</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="la la-user"></i></div>
                                                                <div class="k-grid-nav__item-title">1328</div>
                                                                <div class="k-grid-nav__item-desc">Bidder</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="la la-map-signs"></i></div>
                                                                <div class="k-grid-nav__item-title">1995</div>
                                                                <div class="k-grid-nav__item-desc">Live Tender</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="la la-gavel"></i></div>
                                                                <div class="k-grid-nav__item-title">43434</div>
                                                                <div class="k-grid-nav__item-desc">Live Auction</div>
                                                            </a>

                                                        </div>
                                                    </div>
                                                </div>

                                                <!--end: Quick actions -->

                                            </div>
                                        </div>
                                    </div>
                                    <!--end::Portlet-->
                                    <div class="col-md-8">
                                        <div class="k-portlet alert_part quickAction_menu">
                                            <div class="k-portlet__body1">
                                                <!--begin: Quick actions -->
                                                <div class="k-header__topbar-item dropdown">
                                                    <div class=" dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl">
                                                        <div class="k-head" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                                            <h3 class="k-head__title">Important Shortcuts</h3>
                                                        </div>
                                                        <div class="k-grid-nav">
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="flaticon-app"></i></div>
                                                                <div class="k-grid-nav__item-title">App</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="la la-bookmark-o"></i></div>
                                                                <div class="k-grid-nav__item-title">Bookmarks</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="flaticon-line-graph"></i></div>
                                                                <div class="k-grid-nav__item-title">Reports</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="la la-tags"></i></div>
                                                                <div class="k-grid-nav__item-title">Keywords</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="fa fa-percent"></i></div>
                                                                <div class="k-grid-nav__item-title">Division</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="flaticon-squares-4"></i></div>
                                                                <div class="k-grid-nav__item-title">Product Category</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="flaticon-file-1"></i></div>
                                                                <div class="k-grid-nav__item-title">Upload SOR</div>
                                                            </a>
                                                            <a href="#" class="k-grid-nav__item">
                                                                <div class="k-grid-nav__item-icon"><i class="flaticon-profile-1"></i></div>
                                                                <div class="k-grid-nav__item-title">Designation</div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--end: Quick actions -->

                                            </div>
                                        </div>
                                    </div>
                                    <!--end::Portlet-->

                                </div>
                                <!--end::Row-->
                                <div class="row">
                                    <div class="col-lg-12">

                                        <!--begin::Portlet-->
                                        <div class="k-portlet" id="k_portlet">
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <h3 class="k-portlet__head-title">Pie Chart 1</h3>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body">
                                                <div id="k_flotcharts_1" style="height: 300px;"></div>

                                            </div>
                                        </div>

                                        <!--end::Portlet-->

                                    </div>
                                    <div class="col-lg-12">

                                        <!--begin::Portlet-->
                                        <div class="k-portlet" id="k_portlet">
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon">
                                                        <i class="flaticon-map-location"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">
                                                        Basic Calendar
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="k-portlet__body">
                                                <div id="k_calendar"></div>
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
        <div class="modal fade mdl-bg" id="circle_create" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="assets/demo/media/logo-light.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Create Circle</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="k-form">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Circle Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <input type="email" class="form-control" aria-describedby="emailHelp" placeholder="">
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

        <div class="modal fade mdl-bg" id="circle_division" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                    <form class="k-form">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Circle Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control" id="exampleSelectd">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Division Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <input type="email" class="form-control" aria-describedby="emailHelp" placeholder="">
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

        <div class="modal fade mdl-bg" id="circle_subdivision" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                    <form class="k-form">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Circle Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control" id="exampleSelectd">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Division Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <select class="form-control" id="exampleSelectd">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">SubDivision Name</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <input type="email" class="form-control" aria-describedby="emailHelp" placeholder="">
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

        <script type="text/javascript">
                        $(window).on('load', function () {
                            $('#contractor_notification').modal('show');
                        });
        </script>

        <!--begin::Global Theme Bundle -->

    </body>
    <!-- end::Body -->
    <script>
        function backButtonDisable() {
    //                alert("backButtonDisable");
            window.history.pushState(null, "", window.location.href);
            window.onpopstate = function () {
                window.history.pushState(null, "", window.location.href);
            };
        }
    </script>

</html>
