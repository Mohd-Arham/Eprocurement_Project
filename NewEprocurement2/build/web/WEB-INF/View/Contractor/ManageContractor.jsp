<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html lang="en" ng-app="myApp">

<!-- begin::Head -->

<head>
    <meta charset="utf-8" />
    <title>Manage Contractor</title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--begin::Web font -->
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
       <script src="<c:url value="/resources/angular/ContractorController.js" />"></script>
         <style>
              .validateField {
                color: red;
                font-size: 13px;
            }
            </style>
    <script>
        WebFont.load({
            google: {
                "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
            },
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!--end::Web font -->

    <!--begin:: Global Mandatory Vendors -->
    <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>"  rel="stylesheet" type="text/css" />

    <!--end:: Global Mandatory Vendors -->

    <!--begin:: Global Optional Vendors -->
    <link href="<c:url value="/resources/vendors/tether/dist/css/tether.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-timepicker/css/bootstrap-timepicker.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-select/dist/css/bootstrap-select.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/nouislider/distribute/nouislider.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/owl.carousel/dist/assets/owl.carousel.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/owl.carousel/dist/assets/owl.theme.default.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/dropzone/dist/dropzone.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/summernote/dist/summernote.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/bootstrap-markdown/css/bootstrap-markdown.min.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/animate.css/animate.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/toastr/build/toastr.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/morris.js/morris.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/chartist/dist/chartist.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/sweetalert2/dist/sweetalert2.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/socicon/css/socicon.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/vendors/line-awesome/css/line-awesome.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/vendors/flaticon/css/flaticon.css"/>"  rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/vendors/vendors/fontawesome5/css/all.min.css"/>"  rel="stylesheet" type="text/css" />

    <!--end:: Global Optional Vendors -->

    <!--begin::Global Theme Styles -->
    <link href="<c:url value="/resources/assets/demo/base/style.bundle.css" />" rel="stylesheet" type="text/css" />

    <!--RTL version:<link href="assets/demo/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Global Theme Styles -->
    <!--begin::Page Vendors Styles -->
    <link href="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.css"/>"  rel="stylesheet" type="text/css" />
    <!--begin::Page Vendors Styles -->
    <link href="<c:url value="/resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css"/>"  rel="stylesheet" type="text/css" />

    <!--RTL version:<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Page Vendors Styles -->
    <link rel="shortcut icon" href="assets/demo/media/faviconlp.ico" />
	<!-- coustom_style_css -->
	 <link href="<c:url value="/resources/assets/mystyle.css"/>"  rel="stylesheet" type="text/css"  />
	  <link href="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.css"/>"  rel="stylesheet" type="text/css" /> 
	</head>

<!-- end::Head -->

<!-- begin::Body -->

<body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">
  
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
            <button class="k-aside-close " id="k_aside_close_btn"><i class="la la-close"></i></button>
            <div class="k-aside  k-aside--fixed k-aside--skin-default 	k-grid__item k-grid k-grid--desktop k-grid--hor-desktop" id="k_aside">

                <!-- begin:: Aside -->
                <div class="k-aside__brand	k-grid__item  k-aside__brand--skin-default " id="k_aside_brand">
                    <div class="k-aside__brand-logo">
                        <a href="index.html">
                            <img alt="Logo" src="resources/assets/demo/media/logo-light.png" style="max-width: 80%;" />
                        </a>
                    </div>
                    <div class="k-aside__brand-tools">
                        <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                    </div>
                </div>

                <!-- end:: Aside -->

                
                <!-- begin:: Aside Menu -->
                <div class="k-aside-menu-wrapper	k-grid__item k-grid__item--fluid" id="k_aside_menu_wrapper">
                    <div id="k_aside_menu" class="k-aside-menu " data-kmenu-vertical="1" data-kmenu-scroll="1" data-kmenu-dropdown-timeout="500" style="position: relative;">
                        <ul class="k-menu__nav " style="padding-top:4px;">
                             <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover" style="padding: 20px 0;"><a href="#" class="k-menu__link k-menu__toggle" style="background-color:#fff!important;cursor:inherit;"><i class="k-menu__link-icon la la-clock-o" style="color: #fd3995;font-size: 21px;"></i><span class="k-menu__link-text time_view"><p class="clock_section">05:10:20<span class="">PM</span><span class="day_view">10-09-2018 | Wednesday</span></p></span></a>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu k-menu__item--open k-menu__item--expanded" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="index.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-line-graph"></i><span class="k-menu__link-text">Dashboards</span></a>
                            </li>
                            <li class="k-menu__section ">
                                <h4 class="k-menu__section-text">Components</h4>
                                <i class="k-menu__section-icon flaticon-more-v2"></i>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="tender.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Tender</span></a>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="auction.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-gavel"></i><span class="k-menu__link-text">Auction</span></a>
                            </li>
                              <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-user-lock"></i><span class="k-menu__link-text">Administration</span> </a>
                             </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-cubes"></i><span class="k-menu__link-text">Inventory</span></a>
                            </li>
                           	<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-tabs"></i><span class="k-menu__link-text">DSC Details</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
									<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
										<ul class="k-menu__subnav">
											<li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Keen Datatable</span></span></li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Base</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/data-local.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/data-json.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">JSON Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/data-ajax.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Ajax Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/html-table.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">HTML Table</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/record-selection.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Record Selection</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/local-sort.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Sort</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/row-details.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Row Details</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/column-rendering.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Column Rendering</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/column-width.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Column Width</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/responsive-columns.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Responsive Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/translation.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Translation</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Scrolling</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/vertical.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Vertical Scrolling</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/horizontal.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Horizontal Scrolling</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/both.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Both Scrolling</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Locked Columns</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/left.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Left Locked Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/right.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Right Locked Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/both.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Both Locked Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/html-table.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">HTML Table</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Child Datatables</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/child/data-local.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/child/data-ajax.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Remote Data</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">API</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/api/methods.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">API Methods</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/api/events.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Events</span></a></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-list"></i><span class="k-menu__link-text">MIS Reports</span></a></li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-share"></i><span class="k-menu__link-text">Icons</span><span class="k-menu__link-badge"><span class="k-badge k-badge--danger">5</span></span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/flaticon.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Flaticon</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/fontawesome5.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Fontawesome 5</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/lineawesome.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Lineawesome</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/socicons.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Socicons</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-interface-1"></i><span class="k-menu__link-text">Portlets</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Portlets</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/portlets/base.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Base</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/portlets/draggable.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Draggable</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-calendar"></i><span class="k-menu__link-text">Calendar</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Calendar</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/basic.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Basic</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/list-view.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">List View</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/google.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Google Calendar</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/external.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">External Events</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/rendering.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Event Rendering</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-diagram"></i><span class="k-menu__link-text">Charts</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Charts</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/flotcharts.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Flot Charts</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/google-charts.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Google Charts</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/morris-charts.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Morris Charts</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/chart-js.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Chart JS</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__section ">
                                <h4 class="k-menu__section-text">Tools</h4>
                                <i class="k-menu__section-icon flaticon-more-v2"></i>
                            </li>
                            <li class="k-menu__item " aria-haspopup="true" data-kmenu-link-redirect="1"><a target="_blank" href="https://keenthemes.com/keen/preview/?page=builder" class="k-menu__link "><i class="k-menu__link-icon flaticon-settings"></i><span class="k-menu__link-text">Layout Builder</span></a></li>
                            <li class="k-menu__section ">
                                <h4 class="k-menu__section-text">Custom</h4>
                                <i class="k-menu__section-icon flaticon-more-v2"></i>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-interface-9"></i><span class="k-menu__link-text">Pricing</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Pricing</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/pricing/pricing-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Pricing v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/pricing/pricing-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Pricing v2</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-piggy-bank"></i><span class="k-menu__link-text">Invoices</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Invoices</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/invoices/invoice-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Invoice v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/invoices/invoice-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Invoice v2</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-exclamation-2"></i><span class="k-menu__link-text">FAQs</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">FAQs</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v2</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v3.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v3</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v4.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v4</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-user"></i><span class="k-menu__link-text">User Pages</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/user/login-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Login v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/user/login-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Login v2</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/user/profile-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Profile v1</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-warning"></i><span class="k-menu__link-text">Error Pages</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v2</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v3.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v3</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v4.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v4</span></a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- end:: Aside Menu -->

                <!-- begin:: Aside -->
                <div class="k-aside__footer		k-grid__item" id="k_aside_footer">
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
                <div id="k_header" class="k-header k-grid__item  k-header--fixed k-header--skin-default ">

                    <!-- begin: Header Menu -->
                    <button class="k-header-menu-wrapper-close" id="k_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
                    <div class="k-header-menu-wrapper" id="k_header_menu_wrapper">

                    </div>

                    <!-- end: Header Menu -->

                    <!-- begin:: Header Topbar -->
                    <div class="k-header__topbar">

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

                        <!--begin: Notifications -->
                        <div class="k-header__topbar-item dropdown">
                            <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                <span class="k-header__topbar-icon"><i class="flaticon-alarm"></i></span>
                                <span class="k-badge k-badge--dot k-badge--sm k-badge--danger"></span>
                            </div>
                            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl">
                                <div class="k-head" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                    <h3 class="k-head__title">User Notifications</h3>
                                    <div class="k-head__sub"><span class="k-head__desc">23 new notifications</span></div>
                                </div>
                                <div class="k-notification k-margin-t-30 k-margin-b-20 k-scroll" data-scroll="true" data-height="270" data-mobile-height="220">
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
                                            <i class="flaticon-exclamation-2"></i>
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

                        <!--end: Notifications -->

                        <!--begin: Quick actions -->
                        <div class="k-header__topbar-item dropdown">
                            <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="30px -2px">
                                <span class="k-header__topbar-icon"><i class="flaticon-settings"></i></span>
                            </div>
                            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl">
                                <div class="k-head" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                    <h3 class="k-head__title">Quick Actions</h3>
                                </div>
                                <div class="k-grid-nav">
                                    <a href="#" class="k-grid-nav__item">
                                        <div class="k-grid-nav__item-icon"><i class="flaticon-computer"></i></div>
                                        <div class="k-grid-nav__item-title">Customers</div>
                                        <div class="k-grid-nav__item-desc">per department</div>
                                    </a>
                                    <a href="#" class="k-grid-nav__item">
                                        <div class="k-grid-nav__item-icon"><i class="flaticon-business"></i></div>
                                        <div class="k-grid-nav__item-title">Orders</div>
                                        <div class="k-grid-nav__item-desc">latest orders</div>
                                    </a>
                                    <a href="#" class="k-grid-nav__item">
                                        <div class="k-grid-nav__item-icon"><i class="flaticon-line-graph"></i></div>
                                        <div class="k-grid-nav__item-title">Reports</div>
                                        <div class="k-grid-nav__item-desc">finance & accounting</div>
                                    </a>
                                    <a href="#" class="k-grid-nav__item">
                                        <div class="k-grid-nav__item-icon"><i class="flaticon-settings"></i></div>
                                        <div class="k-grid-nav__item-title">Administration</div>
                                        <div class="k-grid-nav__item-desc">settings and logs</div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!--end: Quick actions -->

                        <!--begin: Language bar -->
                        <div class="k-header__topbar-item k-header__topbar-item--langs">
                            <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="10px -2px">
                                <span class="k-header__topbar-icon">
				<img class="" src="resources/assets/media/flags/020-flag.svg" alt="" />
									</span>
                            </div>
                            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround">
                                <ul class="k-nav k-margin-t-10 k-margin-b-10">
                                    <li class="k-nav__item k-nav__item--active">
                                        <a href="#" class="k-nav__link">
                                            <span class="k-nav__link-icon"><img src="resources/assets/media/flags/020-flag.svg" alt="" /></span>
                                            <span class="k-nav__link-text">English</span>
                                        </a>
                                    </li>
                                    <li class="k-nav__item">
                                        <a href="#" class="k-nav__link">
                                            <span class="k-nav__link-icon"><img src="resources/assets/media/flags/016-spain.svg" alt="" /></span>
                                            <span class="k-nav__link-text">Spanish</span>
                                        </a>
                                    </li>
                                    <li class="k-nav__item">
                                        <a href="#" class="k-nav__link">
                                            <span class="k-nav__link-icon"><img src="resources/assets/media/flags/017-germany.svg" alt="" /></span>
                                            <span class="k-nav__link-text">German</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!--end: Language bar -->

                        <!--begin: User bar -->
                        <div class="k-header__topbar-item k-header__topbar-item--user">
                            <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="10px -2px">
                                <span class="k-header__topbar-welcome k-hidden-mobile">Hi,</span>
                                <span class="k-header__topbar-username k-hidden-mobile">Alex</span>
                                <img alt="Pic" src="resources/assets/media/users/300_21.jpg" />
                            </div>
                            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-md">
                                <div class="k-user-card k-margin-b-50 k-margin-b-30-tablet-and-mobile" style="background-image: url(assets/media/misc/head_bg_sm.jpg)">
                                    <div class="k-user-card__wrapper">
                                        <div class="k-user-card__pic">
                                            <img alt="Pic" src="resources/assets/media/users/300_21.jpg" />
                                        </div>
                                        <div class="k-user-card__details">
                                            <div class="k-user-card__name">Alex Stone</div>
                                            <div class="k-user-card__position">CTO, Loop Inc.</div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="k-nav k-margin-b-10">
                                    <li class="k-nav__item">
                                        <a href="custom/user/profile-v1.html" class="k-nav__link">
                                            <span class="k-nav__link-icon"><i class="flaticon-profile"></i></span>
                                            <span class="k-nav__link-text">My Profile</span>
                                        </a>
                                    </li>
                                    <li class="k-nav__item">
                                        <a href="#" class="k-nav__link">
                                            <span class="k-nav__link-icon"><i class="flaticon-signs"></i></span>
                                            <span class="k-nav__link-text">Tasks</span>
                                        </a>
                                    </li>
                                    <li class="k-nav__item">
                                        <a href="#" class="k-nav__link">
                                            <span class="k-nav__link-icon"><i class="flaticon-mail-1"></i></span>
                                            <span class="k-nav__link-text">Messages</span>
                                        </a>
                                    </li>
                                    <li class="k-nav__item">
                                        <a href="#" class="k-nav__link">
                                            <span class="k-nav__link-icon"><i class="flaticon-settings"></i></span>
                                            <span class="k-nav__link-text">Settings</span>
                                        </a>
                                    </li>
                                    <li class="k-nav__item k-nav__item--custom k-margin-t-15">
                                        <a href="custom/user/login-v2.html" class="btn btn-outline-metal btn-hover-brand btn-upper btn-font-dark btn-sm btn-bold">Sign Out</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!--end: User bar -->

                        <!--begin: Quick panel toggler -->
                        <div class="k-header__topbar-item k-header__topbar--aside-secondary-toggler" data-toggle="k-tooltip" title="Quick panel" data-placement="right">
                            <span class="k-header__topbar-icon" id="k_quick_panel_toggler_btn"><i class="flaticon-grid-menu"></i></span>
                        </div>

                        <!--end: Quick panel toggler -->
                    </div>

                    <!-- end:: Header Topbar -->
                </div>

                <!-- end:: Header -->

                <!-- begin:: Content -->
                <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">
 
                    <!-- begin:: Content Body -->
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
										 <tr class="group tbl_row_bg"><td colspan="10" class="clearfix tbl_td_bg"><span class="pull-left tbl_head">Contractor's Details</span><button type="button" class="btn btn-sm btn-elevate btn-brand pull-right" data-toggle="modal" data-target="#secondaryContractorModal">
											<i class="la la-plus-circle"></i>Add User's
										</button></td></tr>
											<tr> 
												<th>Name</th>
												<th>Email</th>
												<th>Mobile No.</th>
												<th>Action</th>
												<th>Status</th>
												<th>More</th> 
											</tr>
										</thead>
										<tbody id="abcd">
											<tr ng-repeat="all_Contractor in all_Contractor" current-page="currentPage" >
												<td> {{ all_Contractor.firstName}}</td>
                                                                                                <td><a href="#" class="k-link email_id">{{all_Contractor.emailid}}</a></td>
												<td><span class="mobile_no">{{all_Contractor.mobileno}}</span></td>
												<td><span class="action_b"><span class="dtr-data">
                        <span class="dropdown">
                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                              <i class="flaticon-menu-button"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end"> 
                                <a class="dropdown-item" href="updateSecondaryContractor?id={{all_Contractor.contractorSecndry_regId}}"><i class="flaticon-information"></i>View/Edit</a>
                             
                            </div>
                        </span>
</span></td>
												<td>
												 <span class="srtaus_msg"><div id="statuss{{all_Contractor.contractorSecndry_regId}}">{{all_Contractor.status}}</div></span>
												 </td> 
												<td>
                                                                                              <div ng-if="all_Contractor.status === 'Enable'">  
                                                                                                  <div class="status_enable">
														<span class="k-switch k-switch--outline k-switch--icon k-switch--success">
															<label>
																<input type="checkbox"  id="status{{all_Contractor.contractorSecndry_regId}}"  name="status" value="{{all_Contractor.contractorSecndry_regId}}" onclick="editStatus(this.value)" checked="checked" >
																<span></span>
															</label>
														</span>
													</div> 
                                                                                                  </div>
                                                                                                     <div ng-if="all_Contractor.status === 'Disable'">
                                                                                                    <div class="status_enable">
														<span class="k-switch k-switch--outline k-switch--icon k-switch--success">
															<label>
																<input type="checkbox"  id="status{{all_Contractor.contractorSecndry_regId}}"  name="status" value="{{all_Contractor.contractorSecndry_regId}}" onclick="editStatus(this.value)">
																<span></span>
															</label>
														</span>
													</div> 
                                                                                                       </div>
												</td>
                                                                                              </tr>
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
               <input type="hidden" id="openModel" data-toggle="modal" data-target="#myModalforImpNotice"/>
               <input type="hidden" id="openModel1" data-toggle="modal" data-target="#myModaldetail"/>

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
                    <div class="k-grid__item k-aside-secondary__nav-foot">
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
                                            <a href="https://themes.getbootstrap.com/product/keen-the-ultimate-bootstrap-admin-theme/" class="k-nav__link">
                                                <i class="k-nav__link-icon fa fa-donate"></i>
                                                <span class="k-nav__link-text">Purchase Keen</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="https://keenthemes.com/keen/?page=docs" class="k-nav__link">
                                                <i class="k-nav__link-icon fa fa-book"></i>
                                                <span class="k-nav__link-text">Documentation</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="builder.html" class="k-nav__link">
                                                <i class="k-nav__link-icon fa fa-charging-station"></i>
                                                <span class="k-nav__link-text">Layout Builder</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="https://keenthemes.com/support" class="k-nav__link" id="export_excel">
                                                <i class="k-nav__link-icon fa fa-headset"></i>
                                                <span class="k-nav__link-text">Theme Support</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
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
    <script src="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>"type="text/javascript"></script>
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
		<script src="<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script> 
    <!--end::Page Vendors -->
    <!--begin::Page Scripts -->
    <!-- <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> -->
    <!--end::Page Scripts -->
    <!--end::Global Theme Bundle -->
    <script src="<c:url value="/resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script> 
	<script src="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.full.js"/>"></script>
	 <script>
            /*jslint browser:true*/
            /*global jQuery, document*/

            jQuery(document).ready(function () {
                'use strict';

                jQuery('#filter-date, #filter-date-2, #search-from-date, #search-to-date').datetimepicker();
				allowTimes:[
  '12:10', '13:00', '15:00', 
  '17:00', '17:05', '17:20', '19:00', '20:00'
 ]
            });
        </script>
<script>
$(document).ready(function() {
    $('.tenderData').DataTable();
} );
</script>
    <script>
                    $(document).ready(function () {
//  alert("welcome");
//function checkEmail_Mobile(){
                    $("#emailid").change(function () {
                       
                    var email = $("#emailid").val();
                            $.ajax({
                            url: "checkEmail",
                                    data: {email: email},
                                    success: function (res) {
//                     alert(res);
                                    if (res !== "valid Email") {
                                    // alert("done");
                                    $("#emailError").css('color', 'red');
                                            $("#emailError").html("Email address is already exist");
                                            $("#email").append(res);
                                            $("#saveDept").attr('disabled', 'disabled');
                                    } else{
                                    $("#emailError").css('color', 'red');
                                            $("#emailError").html("");
                                            $("#email").append(res);
                                            $('#saveDept').removeAttr('disabled');
                                    }
                                    }
                            });
                    });
                            $("#mobile_no").keyup(function () {
                               

                    var mobile_no = $("#mobile_no").val();
                   
                            $.ajax({
                            url: "checkContacts",
                                    data: {mobile_no: mobile_no},
                                    success: function (res) {
//                                     alert(res);
                                    if (res !== "valid mobile_no") {
                                    // alert("done");
                                    $("#mobileNoError").css('color', 'red');
                                            $("#mobileNoError").html("Mobile No. is already exist");
                                            $("#mobile_no").append(res);
                                            $("#saveDept").attr('disabled', 'disabled');
                                            return false;
                                    } else{
                                    $("#mobileNoError").css('color', 'red');
                                            $("#mobileNoError").html("");
                                            $("#mobile_no").append(res);
                                    }

                                    }
                            });
                    });
                            $("#cpassword").change(function(){

                    var password = $('#password').val();
                            var cpassword = $('#cpassword').val();
                            if (password !== cpassword){
                    $("#errorcpassword").css('color', 'red');
                            $("#errorcpassword").html("Password does not match");
                    }


                    });
                            $("#password").change(function(){
                    var password = $('#password').val();
                            var passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;
                            if (password !== passreg){

                    $("#PasswordError").css('color', 'red');
                            $("#PasswordError").html("Please Enter valid Password");
                    }      });
                    });
//}
        </script>
        <script>
                            $(document).ready(function () {
                    $('.search').on('keyup', function () {
                    var searchTerm = $(this).val().toLowerCase();
                            $('#abcd tr').each(function () {
                    var lineStr = $(this).text().toLowerCase();
                            if (lineStr.indexOf(searchTerm) === - 1) {
                    $(this).hide();
                    } else {
                    $(this).show();
                    }
                    });
                    });
                    });        </script>
        <script type="text/javascript">
                            $(document).ready(function () {
                    $(".dropdown").hover(
                            function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                                    $(this).toggleClass('open');
                            },
                            function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                                    $(this).toggleClass('open');
                            }
                    );
                    });        </script>

        <script>
                            function editStatus(reg_Id) {
//                           alert(reg_Id);
                            var status = $('#status' + reg_Id).is(':checked');
//             var status = $('#status' + id).is(':checked');
//alert(status);
                                    swal({
                                    title: 'Are you sure?',
                                            text: "You want to change the status",
                                            type: 'question',
                                            showCancelButton: true,
                                            confirmButtonText: 'Yes',
                                            cancelButtonText: 'No',
                                            showLoaderOnConfirm: true,
                                            reverseButtons: true
                                    }).then((result) => {
                            if (result.value) {
                            swal(
                                    'Changed',
                                    'Your Status Has Been Changed',
                                    'success'
                                    )
                                    if (status === true) {
//                    alert("enable");
                            status = "Enable";
                                    $.ajax({
                                    type: "GET",
                                            url: "statusChange",
                                            data: {reg_Id: reg_Id, 'status': status},
                                            success: function (response) {
                     alert(response);
                                            $('#statuss' + reg_Id).html(response);
                                            }
                                    });
                            } else if (status === false) {
//                    alert("disable");

                            status = "Disable";
                                    $.ajax({
                                    type: "GET",
                                            url: "statusChange",
                                            data: {reg_Id: reg_Id, 'status': status},
                                            success: function (response) {
//                     alert(response);
                                            $('#statuss' + reg_Id).html(response);
                                            }
                                    });
                            }
                            }
                            // Read more about handling dismissals
                            else if (result.dismiss === swal.DismissReason.cancel) {
                            swal(
                                    'Cancelled',
                                    'Your Status has not changed',
                                    'error'
                                    )
                                    if (status === true){
                            $('#status' + reg_Id).prop('checked', false);
                            }
                            else{
                            $('#status' + reg_Id).prop('checked', true);
                            }
                            }
                            })
                            }



                    function checkdeptinfo() {

                    var dept = '<%= session.getAttribute("deptName")%>'
                            var form = $("form").serialize();
//                    alert(dept);
                            $.ajax({
                            type: "GET",
                                    url: "checkdepartment",
                                    data: form,
                                    success: function (response) {

//                        alert(""+response);
                                    if (response === 'valid Email') {
                                    $(".close").click();
                                            window.location.href = 'register';
                                    }
                                    if (response === "exists as secondary"){
                                    $(".close").click();
                                            alert("This User is already exists in " + dept + " Department");
                                    }

                                    var obj = JSON.parse(response);
                                            $.each(obj, function (key, value) {

                                            if (response !== null || response !== '') {


                                            if (value.deptName === dept) {


                                            $(".close").click();
                                                    alert(value.firstName + " is already exists in " + dept + " Department");
                                            } else {
//                   
                                            $("#userName").append(value.firstName);
                                                    $("#user2reg_id").val(value.reg_Id);
                                                    $("#userdept").append(value.deptName);
                                                    $("#sessionDept").append(dept);
                                            }
                                            }

                                            });
                                    }

                            });
                    }
                    function clearModal(){

                    $('#reset').click();
                    }
                    function Impmessage(){
                    var dept = '<%= session.getAttribute("deptName")%>';
                            var designationList = '<c:out value="${designationList}"/>';
                            var circleList = '<c:out value="${circleList}"/>';
                            var divisionList = '<c:out value="${divisionList}"/>';
                            var subDivisionList = '<c:out value="${subDivisionList}"/>';
                            if (designationList === 'size is zero' || circleList === 'size is zero' || divisionList === 'size is zero' || subDivisionList === 'size is zero'){
//             $(".close").click();
//         alert(designationList+" "+circleList+" "+divisionList+" "+subDivisionList); 

                    $("#openModel").click();
                            $(".sessionDept").append(dept);
                    } else{


                    $("#openModel1").click();
                    }
                    }
                    function view(id){
                        
//                        alert(id);
                            $.ajax({
                                
                              
                                        type: "GET",
                                            url: "updateSecondaryContractor",
                                            data: {id: id},
                                            success: function (response) {
//                     alert(response);
//                     alert(response.firstName);
                       
//                                            $('#statuss' + reg_Id).html(response);
                                            }
                                    });
                        
                        
                    }
                   
        </script>
          <script>
                                                                        $(document).ready(function() {

                                                                var firstregex = new RegExp(
                                                                        '^(([a-zA-Z ]+$))'
                                                                        );
                                                                        var emailregex = new RegExp(
                                                                                '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                                                                                '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                                                                                '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{3,3}))$'
                                                                                );
                                                                        var mobregex = new RegExp(
                                                                                '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                                                                );
                                                                        $('.Name').on('keyup', function(e) {

                                                                if (firstregex.test($(this).val())){
                                                                $(this).parent().removeClass('works-active');
                                                                        $(this).parent().addClass('success');
                                                                        console.log("success");
                                                                } else{

                                                                $(this).parent().removeClass('success');
                                                                        $(this).parent().addClass('works-active');
                                                                        console.log("error");
                                                                }

                                                                });
                                                                        $('.Email_Id').on('keyup', function(e) {

                                                                if (emailregex.test($(this).val())){
                                                                $(this).parent().removeClass('works-active');
                                                                        $(this).parent().addClass('success');
                                                                        console.log("success");
                                                                } else{

                                                                $(this).parent().removeClass('success');
                                                                        $(this).parent().addClass('works-active');
                                                                        console.log("error");
                                                                }

                                                        });
                                                                        $('.Mobile_No').on('keyup', function(e) {

                                                                if (mobregex.test($(this).val())){
                                                                $(this).parent().removeClass('works-active');
                                                                        $(this).parent().addClass('success');
                                                                        console.log("success");
                                                                } else{

                                                                $(this).parent().removeClass('success');
                                                                        $(this).parent().addClass('works-active');
                                                                        console.log("error");
                                                                }

                                                            });
                                                                });        </script>

        <script>


                            $(document).ready(function() {
                    $(function() {
                    $('#saveDept').attr('disabled', 'disabled'); //disable button
                    });
                            var regex = /^[a-zA-Z ]*$/;
                            var mobNoreg = /^[0]?[789]\d{9}$/;
                            var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                            $('input[type=text],input[type=password]').keyup(function() {
                    if ($('.Name').val() != '' && regex.test($('.Name').val()) &&
                            $('.Email_Id').val() != '' && emailidreg.test($('.Email_Id').val()) &&
                            $('.Mobile_No').val() != '' && mobNoreg.test($('.Mobile_No').val())){

                    $('#saveDept').removeAttr('disabled'); //enable button


                    } else {
                    $('#saveDept').attr('disabled', 'disabled'); //disable button
                    }
                    });
                    });
                         
                            
                      
                            


        </script>
        
        <jsp:include page="../Contractor/SecondaryContractorRegistrationModel.jsp"></jsp:include>

</body>

<!-- end::Body -->

</html>
