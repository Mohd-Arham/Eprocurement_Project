<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title> e-Procurement | Home</title>
        <!-- Favicon lotus procure -->
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" /> -->
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon lotus procure -->
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
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
        ></script> 
    <!--begin:: Global Mandatory Vendors -->
    <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />

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

    <!--RTL version:<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Page Vendors Styles -->
    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/faviconlp.ico"/>" />
    <!-- coustom_style_css -->
    <link href="<c:url value="/resources/assets/customstyle.css"/>" rel="stylesheet" type="text/css" />
    <!-- Angular script -->
    <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
    <style>
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

        .clock_section {
            color: #fd3b96;
            font-weight: 100;
            font-size: 28px;
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

        .modal-body .ps > .ps__rail-y > .ps__thumb-y {
            background: #5867dc;
            opacity: 1;
        }

        .space_btn_height {
            height: 21px;
        }
    </style>
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
            <jsp:include page="Tiles/DashBoardAsidenav.jsp"/>
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
                        <!--                        <div class="k-header__topbar-item k-header__topbar-item--search dropdown">
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
                                                </div>-->

                        <!--end: Search -->









                        <!--end: Quick panel toggler -->
                    </div>

                    <!-- end:: Header Topbar -->
                </div>
                <!-- end:: Header -->

                <!-- begin:: Content -->
                <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                    <!-- begin:: Content Head -->
                    <div class="k-content__head	k-grid__item">
                        <div class="k-content__head-main">
                            <h3 class="k-content__head-title">Which Department Do you want to Login?</h3>
                            <div class="k-content__head-breadcrumbs">

                                <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                            </div>
                        </div>

                    </div>

                    <!-- end:: Content Head -->



                    <!-- begin:: Content Body -->
                    <div class="k-content__body	k-grid__item k-grid__item--fluid">

                        <!--begin::Row-->
                        <div class="row">
                            <c:forEach var="deptoption" items="${deptoption}" varStatus="i">
                                <div class="col-xl-6 col-xxl-6 order-xxl-1">

                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                        <div class="k-portlet__body text-center">
                                            <form action="departmentUserBydeptId" method="post" id="form" > 


                                                <input hidden="true" name="deptName" value="${deptoption.value.deptName}">
                                                <input hidden="true" name="deptId" value="${deptoption.value.deptId}">
                                                <div class="k-widget-10__wrapper">

                                                    <a  class="dipartment_logo" onclick="return confirmFun(${i.count});" >
                                                        <img  src="${deptoption.value.deptLogoFileUrl}" style="max-width: 80%;" />
                                                    </a>


                                                </div>
                                                <br>
                                                <h5> <a  onclick="return confirmFun(${i.count});" class="k-widget-10__desc">${deptoption.value.deptName}</a></h5>
                                                <button type="submit" hidden="true" id="submitbtn${i.count}" ></button>


                                            </form>
                                        </div>  
                                    </div>

                                    <!--end::Portlet-->
                                </div>
                            </c:forEach>

                            <!--                            <div class="col-xl-6 col-xxl-6 order-xxl-1">
                            
                                                            begin::Portlet
                                                          <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                                                <div class="k-portlet__body text-center">
                                                                    <div class="k-widget-10__wrapper">
                                                                         <img alt="Logo" src="/NewEprocurement/resources/assets/demo/media/logo-light.png" style="max-width: 80%;">
                                                                    </div>
                                                                       <br>
                                                                     <br>
                                                                    <h5> <a href="#" class="k-widget-10__desc">Department Login User's</a></h5>
                                                                </div>  
                                                            </div>
                            
                                                            end::Portlet
                                                        </div>-->


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

            <!-- end:: Aside Secondary -->
        </div>
    </div>
    <!-- end:: Page -->

    <!-- begin::Global Config -->
    <!-- begin::Quick Panel -->
    <jsp:include page="Tiles/QuickPanel.jsp"/>
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
    <script src="assets/demo/custom/components/forms/widgets/bootstrap-select.js" type="text/javascript"></script>

    <!--end::Page Vendors -->

    <script src="<c:url value="/resources/assets/demo/custom/components/base/popovers.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/resources/assets/app/scripts/custom/dashboard.js"/>" type="text/javascript"></script>



    <!--begin::Page Scripts -->
    <script src="<c:url value="/resources/assets/demo/custom/components/calendar/basic.js"/>" type="text/javascript"></script>
    <!-- Angular js Controller --> 
    <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js" />"


    <script>
                $(document).ready(function () {

                    $(".btn_next").click(function (e) {
                        var $active = $('.nav-tabs-btn .nav-item a.active');
                        $($active).addClass("sve_class_cl");
                        $($active).find('.nav-link-title').hide();
                        $($active).find('.fa').show();
                        nextTab($active);

                    });
                    $(".btn_prev").click(function (e) {
                        var $active = $('.nav-tabs-btn .nav-item a.active.show');
                        prevTab($active);
                    });
                });

                function nextTab(elem) {
                    var li = $(elem).closest("li");
                    $(li).next('li').find('a').click();
                }

                function prevTab(elem) {
                    var li = $(elem).closest("li");
                    $(li).prev('li').find('a').click();
                    $(li).prev('li').find('a').removeClass('sve_class_cl');
                    $(li).prev('li').find('a').find('.nav-link-title').show();
                    $(li).prev('li').find('a').find('.fa').hide();
                }
        </script>
        <script>
                    $(document).ready(function () {

                        $("#save_next_btn").click(function (e) {
                            var $active = $('.nav-tabs-btn .nav-item a.active');
                            $($active).addClass("sve_class_cl");
                            $($active).find('.nav-link-title').hide();
                            $($active).find('.fa').show();
                            nextTab($active);

                        });
                        $("#previous").click(function (e) {
                            var $active = $('.nav-tabs-btn .nav-item a.active.show');
                            prevTab($active);
                        });
                    });

                    function nextTab(elem) {
                        var li = $(elem).closest("li");
                        $(li).next('li').find('a').click();
                    }

                    function prevTab(elem) {
                        var li = $(elem).closest("li");
                        $(li).prev('li').find('a').click();
                        $(li).prev('li').find('a').removeClass('sve_class_cl');
                        $(li).prev('li').find('a').find('.nav-link-title').show();
                        $(li).prev('li').find('a').find('.fa').hide();
                    }
        </script>
        <script>
                    function confirmFun(id) {
                        var confirmStatus = confirm('Do You Really Wants to Login With This department ?');
                        if (confirmStatus == true) {
                            $('#submitbtn' + id).click();
                            return true;
                        }
                    }
        </script>

    </body>

    <!-- end::Body -->

</html>