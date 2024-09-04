<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title> e-Procurement | Home</title>
        <!-- Favicon lotus procure -->
    <!--    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" /> -->
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
<style>
   .questioncss{display: inline-block; width: 88% !important;float: right;}
   .questiontable{width: 95% !important; font-size: 13px;}
   .headingcss{
      margin: 0; border-bottom: 1px solid; border-color: #ddd; padding: 0 0 20px; margin-bottom: 12px;
      font-size: 23px; border-radius: 6px;
   }
   .divcss{ text-align: center; border: 2px solid #dedede; width: 50%; margin: 35px auto; padding: 30px 0; }
   .textcss{font-size: 17px; color: #ff8700;}
   .viewtemph1{margin-bottom: 0; border: none; font-size: 18px; text-align: center;}
</style>
        <!--end::Web font -->

        <!--begin:: Global Mandatory Vendors -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
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
        <link href="<c:url value="/resources/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
        <!-- Angular script -->
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
        <style>
            .float_left_dynamic {
                float: left;
                width: 50%;
                padding-right: 15px;
                padding-left: 15px;
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
                margin: 0 12.05rem;
                cursor: no-drop;
            }

            .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 67%;
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
            .errormsg{
                color: red;
            }
            .fixme{
                z-index:999!important;
            }
            .d_blk_wdt{
                disply:block;
                width:100%;
            }
            .ValidationMsg {
                color: red;
                font-size: 13px;
            }
            .errormsg {
                color: red;
            }
            .vaishali_g{
                width:60%;
                margin:0 auto;
            }
            .envelope_success_messege{
                text-align: center;
                font-size: 1.3rem;
                border: 1px solid;
                padding: 15px;
                border-radius: 4px;
                margin: 0 auto;
                width: 50%;
                color: #3c993c;
                font-weight: 600;
            }
        </style>
    <input type="hidden" id="tenderId" value="<c:out value="${tenderId}"/>">


    <script>



            var minutes, remainingSeconds;
            var seconds;
            var countdownTimer = window.setInterval(bidTimeCounter, 1000);
            function bidTimeCounter() {

                var localdate = new Date();
                var year = localdate.getFullYear();
                //                      var month=localdate.getMonth();
                var date = localdate.getDate();

                var hrs = localdate.getHours();
                var min = localdate.getMinutes();
                var sec = localdate.getSeconds();
                var d = new Date();
                var weekday = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
                var monthName = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
                var day = weekday[d.getDay()];
                var month = monthName[d.getMonth()];

                $.ajax({
                    type: "POST",
                    url: "countDownTimer",
                    data: {'tenderId': $("#tenderId").val()},
                    success: function (response) {
                        seconds = response;
                        if (seconds === 0 || seconds < 0) {
                            clearInterval(countdownTimer);
                            document.getElementById('clock12345').innerHTML = "Bidding Closed";
                            $(':button').prop('disabled', false);
                            $(':input').prop('disabled', true);
                            return;
                        } else {
                            var days = Math.floor(seconds / 24 / 60 / 60);
                            var hoursLeft = Math.floor((seconds) - (days * 86400));
                            var hours = Math.floor(hoursLeft / 3600);
                            var minutesLeft = Math.floor((hoursLeft) - (hours * 3600));
                            minutes = Math.floor(minutesLeft / 60);
                            remainingSeconds = seconds % 60;
                            if (remainingSeconds < 10) {
                                remainingSeconds = "0" + remainingSeconds;
                            }
                            document.getElementById('clock12345').innerHTML = days + "Days " + hours + "h " + minutes + "m " + remainingSeconds + "s";
                            document.getElementById('time').innerHTML = hrs + ":" + min + ":" + sec;
                            document.getElementById('date').innerHTML = day + " | " + date + "-" + month + "-" + year;
                        }
                    },
                    error: function (e) {

                    }
                });
            }


    </script>



    <script>

    </script>

</head>

<!-- end::Head -->

<!-- begin::Body -->

<body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" onload="bodyLoad();" ng-controller="myCtrl">
    <!-- begin:: Page -->

    <!-- Modal -->
    <div class="modal fade mdl_bg mdl_frm" id="remark_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">				 
                <div class="modal-body remark_modal">
                    <div class="k-login-v2">
                        <!--begin::Body-->
                        <div class="k-login-v2__body">

                            <!--begin::Wrapper-->
                            <div class="k-login-v2__body-wrapper">
                                <div class="k-login-v2__body-container">
                                    <div class="k-login-v2__body-title">
                                        <h3>Remark</h3>
                                    </div>
                                    <button type="button" class="btn btn-default" id="closeRemark" data-dismiss="modal" hidden="true">Close</button>

                                    <!--begin::Form-->
                                    <form class="k-login-v2__body-form k-form" id="bidwithdrawform"action="#" autocomplete="off">
                                        <div class="form-group">
                                            <label class="">Remark<i style="color:red;">*</i></label>
                                            <textarea type="email" class="form-control" id="" placeholder=" " name="remarkNote"></textarea>
                                            <span class="form-text text-muted" id="" style="color: red;"></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Upload File<i style="color:red;">*</i></label>
                                            <div></div>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="" name="uploadfile">
                                                <label class="custom-file-label" for="customFile">Choose file</label>
                                                <span class="form-text text-muted" id="" style="color: red;"></span>
                                            </div>
                                        </div>

                                    </form>

                                    <!--end::Form-->

                                    <!--begin::Action-->
                                    <div class="k-login-v2__body-action k-login-v2__body-action--brand form-group"> 
                                        <button type="button" class="btn btn-pill btn-brand btn-elevate" onclick="validateRemark();">Submit</button> 
                                    </div>

                                    <!--end::Action-->

                                    <!--begin::Separator-->




                                    <!--end::Options-->
                                </div>
                            </div>

                            <!--end::Wrapper-->

                        </div>
                    </div>
                    <!--begin::Body-->
                </div> 
            </div>
        </div>
    </div>
    <!-- begin:: Header Mobile -->
    <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
        <div class="k-header-mobile__logo">
            <a href="#">
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

                <!-- begin:: Aside Menu -->
                <jsp:include page="Tiles/DashBoardAsideNav.jsp"/>

                <!-- end:: Aside Menu -->

                <!-- begin:: Aside -->


                <!-- end:: Aside -->
            </div>

            <!-- end:: Aside -->
            <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor k-wrapper">

                <!-- begin:: Header -->
                <%@include  file="Tiles/Header.jsp" %> 

                <!-- end:: Header -->

                <!-- begin:: Content -->
                <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                    <!-- begin:: Content Head -->
                    <div class="k-content__head	k-grid__item">
                        <div class="k-content__head-main">
                            <h3 class="k-content__head-title">Bidder Template</h3>
                            <div class="k-content__head-breadcrumbs">
                                <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                <span class="k-content__head-breadcrumb-separator"></span>
                                <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                            </div>
                        </div>

                        <div class="k-content__head-toolbar fixme">
                            <div class="k-content__head-toolbar-wrapper"> 
                                <a class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper text-white" href="myTender">
                                    <i class="la la-arrow-left"></i>  Back to My Tender
                                </a>
                                <a href="#" class="btn btn-sm btn-elevate btn-danger" data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                    <span class="k-opacity-72" id="k_dashboard_daterangepicker_title">Remaining Time:</span>&nbsp;
                                    <span class="k-font-bold" id="clock12345"></span>
                                    <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                </a>
                            </div>
                            <button type="button" id="remark" class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper btn-sm" data-toggle="modal" data-target="#remark_modal" style="width: 20%;" hidden="true"><i class="la la-arrow-right"></i>Remark Modal</button>
                        </div>
                    </div>

                    <!-- end:: Content Head --> 

                    <!-- begin:: Content Body -->
                    <div class="k-content__body	k-grid__item k-grid__item--fluid">

                        <div class="row"> 
                            <div class="col-lg-12"> 
                                <!--begin::Portlet-->
                                <div class="k-portlet k-portlet--height-fluid">  
                                    <div class="k-portlet__body bidder_template"> 
                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon">
                                                    <i class="la la-info-circle"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">
                                                    Tender Details  
                                                </h3> 
                                            </div> 
                                        </div>

                                        <div class="bider_table_dt">

                                            <table class="table table-bordered table-hover table-checkable"> 
                                                <tbody>

                                                    <tr>
                                                        <th>Tender No.</th>
                                                        <td>${tender.tenderNumber}</td>
                                                        <th>NIT No.</th>
                                                        <td>${tender.nitNumber}</td>
                                                        <th>PAC</th>
                                                        <td colspan="2"><span class="rs_ic"><i class="la la-rupee"></i>${tender.estimateValueInFig}</span></td>


                                                    </tr>
                                                    <tr>
                                                        <th>EMD (In fig.)</th>
                                                        <td><span class="rs_ic"><i class="la la-rupee"></i>${tender.emdInFig}</span></td>

                                                        <c:if test="${(msmeReg=='1'||msmeReg=='2') && msmeExemtion=='Allowed'}">
                                                            <c:if test="${emdMsmeNsic!=null}">
                                                                <th>EMD Exemption For MSME</th>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${emdMsmeNsic}%</span></td>
                                                                <th>EMD Value (In Rs.) After Exemption</th>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${remainEmdMsme}</span></td>
                                                                    </c:if>
                                                                </c:if> 
                                                                <c:if test="${scstExemtion=='Allowed' && emdScst!=null}">

                                                            <th>EMD Exemption for SCST</th>
                                                            <td><span class="rs_ic"><i class="la la-rupee"></i>${emdScst}%</span></td>

                                                            <th>EMD Value (In Rs.) After Exemption</th>
                                                            <td><span class="rs_ic"><i class="la la-rupee"></i>${remainEmdScst}</span></td>

                                                        </c:if>
                                                        <c:if test="${obcExemtion=='Allowed'}">
                                                            <c:if test="${emdObc!=null}">                                                       
                                                                <th>EMD Exemption for OBC</th>                                                   
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${emdObc}%</span></td>
                                                                <th>EMD Value (In Rs.) After Exemption</th>
                                                                <td><span class="rs_ic"><i class="la la-rupee"></i>${remainEmdObc}</span></td>
                                                                    </c:if>
                                                                </c:if>
                                                    </tr>
                                                    <tr>
                                                        <th>Name of Work</th>
                                                        <td>${tender.nameOfWork}</td>
                                                        <th>Re-Bid</th>			
                                                        <td>${tender.tenderRebid}</td>

                                                        <th>BidWithDraw</th>
                                                        <td>${tender.tenderBidWithdraw}</td>
                                                        <c:if test="${bidWithDraw==true}">



                                                            <c:if test="${bidWithDrawnByContractor!=true}">
                                                                <td><button type="button"  onclick="bidWithDrawfunction();" class="btn btn-success btn-sm" >Bid-WithDraw</button></td>

                                                            </c:if>
                                                            <c:if test="${bidWithDrawnByContractor==true}">
                                                                <td>Your Bid is WithDrawn</td>
                                                            </c:if>



                                                        </c:if>

                                                    </tr>
                                                    <tr>
                                                        <th>Category</th>
                                                        <td>${scstStatus}${obcStatus}</td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!--end::Portlet-->
                            </div>

                        </div>

                        <!--begin::Row-->
                        <div class="row">
                            <div class="col-lg-12"> 
                                <!--                                    <a href="myTender" title="MyTenders" type="button" class="btn btn-success">Back to MyTender</a>-->

                                <!--begin::Portlet-->
                                <div class="k-portlet k-portlet--height-fluid"> 
                                    <div class="k-portlet__body bidder_template">
                                        <ul class="nav nav-pills nav-tabs-btn" role="tablist">
                                              <c:choose>
                                                <c:when test="${showEA}">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#k_tabs_8_1" role="tab">
                                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                                    <span class="nav-link-title">Envelope A</span>
                                                </a>
                                            </li>
                                            
                                                </c:when>
                                              </c:choose>

                                          <c:choose>
        <c:when test="${showQCBS}">
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#k_tabs_8_2" role="tab" onclick="viewEditQCBSTemplate();">
                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                    <span class="nav-link-title">Envelop B (QCBS)</span>
                </a>
            </li>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${showEB}">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#k_tabs_8_2" role="tab" >
                            <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                            <span class="nav-link-title">Envelope B</span>
                        </a>
                    </li>
                </c:when>
            </c:choose>
        </c:otherwise>
    </c:choose>
                                                    
                                                     <c:choose>
                                                             <c:when test="${showEC}">
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_tabs_8_3" role="tab" onclick="getEnvelopeCType();" id="envelopeCTabLink">
                                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                                    <span class="nav-link-title">Envelope C</span>
                                                </a>
                                            </li>
                                             </c:when>
                                                     </c:choose>
                                        </ul>

                                        <div class="tab-content">
  <c:choose>
                                                <c:when test="${showEA}">
                                            <div class="tab-pane fade active show" id="k_tabs_8_1" role="tabpanel">

                                                <div id="submittedA"  style="display: none">
                                                    <div class="envelope_success_messege">
                                                        Envelope A is Submitted Successfully.. 

                                                    </div>
                                                    <!--<center><button type="button" class="btn btn-success btn-sm" onclick="viewBid('A');">View Bid</button></center>-->


                                                </div>


                                                <div id="envelope_a">  


                                                    <form:form action="#" id="fformforA" class="k-form"  modelAttribute="DynamicTemplatePojo" enctype="multipart/form-data" >



                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="socicon-delicious"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Envelope A

                                                                </h3>
                                                            </div>

                                                        </div>
                                                        <div class="form-group border_boxesDiv clearfix vaishali_g"> 

                                                            <c:forEach items="${envelopeAToShow}" var="envelopeAToShow" varStatus="theindex">
                                                                <input  type="hidden" value="${theindex.index}" id="namefileA${envelopeAToShow.tender_EnvelopeA_SequnceId}"> 
                                                                <div class="form-group ">
                                                                    <input type="hidden" name="mendatory" value="${envelopeAToShow.labelMandatoryA}">
                                                                    <input type="hidden" name="lebeltype" value="${envelopeAToShow.labelNameA}">
                                                                    <input type="hidden" name="inputlebeltype" value="${envelopeAToShow.labelTypeA}">

                                                                    <form:hidden path="datalist[${theindex.index}].envelopeADataId" value="${envelopeAToShow.envelopeAFieldId}"/>
                                                                    <label>${envelopeAToShow.labelNameA}<i ${envelopeAToShow.labelMandatoryA == 'true'} style="color:red;">*</i></label>


                                                                    <c:if test="${envelopeAToShow.labelTypeA=='1'}"> 
                                                                        <form:input path="datalist[${theindex.index}].textfield" value="${envelopeAToShow.fieldValueOfContractor}" class="form-control checkValidation" placeholder=" "/>
                                                                        <span class="form-text errormsg" ></span> 
                                                                        <!--<span class="form-text text-muted" style="color: red;">gfjkfjkjk</span>-->
                                                                        <span class="form-text text-muted" style="color: red;" id="${envelopeAToShow.labelNameA}Error"></span>

                                                                    </c:if>
                                                                    <c:if test="${envelopeAToShow.labelTypeA=='2'}">

                                                                        <form:input path="datalist[${theindex.index}].textfield" value="${envelopeAToShow.fieldValueOfContractor}" class="form-control checkValidation" placeholder=" " onkeypress="return isNumberKey(event);"/>
                                                                        <span class="form-text errormsg" ></span>   
                                                                        <span class="form-text text-muted" style="color: red;" id="${envelopeAToShow.labelNameA}Error"></span>  
                                                                    </c:if>
                                                                    <c:if test="${envelopeAToShow.labelTypeA=='3'}">
                                                                        <c:if test="${reBidd!=true}">
                                                                            <div class="custom-file">
                                                                                <input type="file" class="custom-file-input checkValidation" id="fileA${envelopeAToShow.tender_EnvelopeA_SequnceId}"  name="datalist[${theindex.index}].files" onchange="saveEnvelopeFile(this.id)">
                                                                                <!--<input type="file" class="custom-file-input checkValidation" id="${envelopeAToShow.labelNameA}${envelopeAToShow.tender_EnvelopeA_SequnceId}"  name="multipartfile" onchange="saveEnvelopeFile(this.id)">-->
                                                                                <span class="form-text errormsg" ></span>   
                                                                                <span class="form-text text-muted" style="color: red;" id="${envelopeAToShow.labelNameA}Error"></span>
                                                                                <label class="custom-file-label" for="customFile"><span id="fileNamefileA${envelopeAToShow.tender_EnvelopeA_SequnceId}" >${envelopeAToShow.fileName}</span></label>
                                                                            </div>
                                                                        </c:if>    
                                                                        <c:if test="${reBidd==true}">

                                                                            <div class="custom-file">

                                                                                <input type="file" class="custom-file-input checkValidation" id="fileA${envelopeAToShow.tender_EnvelopeA_SequnceId}"  name="datalist[${theindex.index}].files" onchange="saveEnvelopeFile(this.id);" >
                                                                                <input type="hidden" name="datalist[${theindex.index}].fileFlag" id="fileFlag${envelopeAToShow.labelNameA}${envelopeAToShow.tender_EnvelopeA_SequnceId}" value="${envelopeAToShow.fileName}" /> 
                                                                                <span class="form-text text-muted errormsg"><a href="${envelopeAToShow.filePath}" target="_blank" >${envelopeAToShow.fileName}</a></span>   
                                                                                <span class="form-text text-muted" style="color: red;" id="${envelopeAToShow.labelNameA}Error"></span>
                                                                                <label class="custom-file-label" for="customFile"><span id="fileNamefileA${envelopeAToShow.tender_EnvelopeA_SequnceId}" ></span></label>

                                                                            </div> 
                                                                        </c:if>
                                                                        <!--                                                                       <input type="text" class="form-control" placeholder=" ">-->
                                                                        <!--<span class="form-text text-muted">Please .....</span>-->   

                                                                    </c:if>
                                                                    <c:if test="${envelopeAToShow.labelTypeA=='4'}">


                                                                        <!--                                                                    <label>(In fig.)</label>-->
                                                                        <div class="input-group ">
                                                                            <div class="input-group-prepend"><span class="input-group-text "><i class="fa fa-rupee-sign"></i></span></div>
                                                                                    <form:input path="datalist[${theindex.index}].textfield" value="${envelopeAToShow.fieldValueOfContractor}" class="form-control checkValidation" placeholder=" " aria-describedby="basic-addon1" onkeyup="dynamicTemplateConv(this.value, this.id);" onkeypress="return validateFloatKeyPress(this,event);"
                                                                                                id="${envelopeAToShow.labelNameA}${envelopeAToShow.tender_EnvelopeA_SequnceId}"/>
                                                                            <span class="form-text errormsg d_blk_wdt"></span> 
                                                                        </div>


                                                                        <span class="form-text text-muted" style="color: red;" id="${envelopeAToShow.labelNameA}Error"></span>

                                                                        <div class="form-group"> 
                                                                            <!--                                                                    <label>(In fig.)</label>-->
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend"><span class="input-group-text "><i class="fa fa-rupee-sign"></i></span></div>
                                                                                        <form:input path="datalist[${theindex.index}].textfieldInWords" class="form-control" value="${envelopeAToShow.fieldValueInWordsOfContractor}" placeholder=" " id="dynamicTemplateValue${envelopeAToShow.labelNameA}${envelopeAToShow.tender_EnvelopeA_SequnceId}" readonly="true"/>

                                                                            </div>
                                                                            <!--<span class="form-text text-muted">Please .....</span>-->   
                                                                            <span class="form-text errormsg" ></span>  
                                                                            <span class="form-text text-muted" style="color: red;" id="${envelopeAToShow.labelNameA}Error"></span>
                                                                        </div> 

                                                                    </c:if>

                                                                </div>

                                                            </c:forEach>
                                                            <p><input type="checkbox" name="terms" id="termsforA" value="1"> I accept the <u>Terms and Conditions</u></p>

                                                            <div class="form-group col-lg-12">
                                                                <div class="k-form__actions">
                                                                    <!--onsubmit="return checkEAValidation();"-->
                                                                    <c:if test="${reBidd==true}">
                                                                        <button type="button" class="btn btn-primary" onclick="updateEnvelopeData('A');">Submit </button>    


                                                                    </c:if>


                                                                    <c:if test="${submitBid=='submit'}">
                                                                        
                                                                        <button type="button" class="btn btn-primary" id="buttonforA" id="saveenvA" onclick="saveEnvelopeData('A');" >Submit</button>
                                                                        <!--<div style="color: red;float: right;size: 30px;" id="ForEMDid">Firstly please fill up the EMD.</div>-->
                                                                        <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                    </c:if>

                                                                </div> 
                                                            </div>
                                                        </div>

                                                    </form:form> 
                                                </div>
                                            </div>

                                                </c:when>
  </c:choose>

                                            <div class="tab-pane fade" id="k_tabs_8_2" role="tabpanel">

                                                <div id="submittedB" class="envelope_success_messege" style="display: none">
                                                    Envelope B is Submitted Successfully..    
                                                </div>
                                                <div id="envelope_b">  
                                                    <form:form action="#" id="fformforB" class="k-form"  modelAttribute="DynamicTemplatePojo" enctype="multipart/form-data">
                                                        <input name="id" type="hidden">
                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="socicon-delicious"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Envelope B
                                                                </h3>
                                                            </div>

                                                        </div>
                                                        <div class="form-group border_boxesDiv clearfix vaishali_g">   


                                                            <c:forEach items="${envelopeBToShow}" var="envelopeBToShow" varStatus="theindex">
                                                                <input  type="hidden" value="${theindex.index}" id="namefileB${envelopeBToShow.tender_EnvelopeA_SequnceId}"> 
                                                                <form:hidden path="datalist[${theindex.index}].envelopeBDataId" value="${envelopeBToShow.envelopeBFieldId}"/>
                                                                <div class="form-group">
                                                                    <input type="hidden" name="mendatory" value="${envelopeBToShow.labelMandatoryA}">
                                                                    <input type="hidden" name="lebeltype" value="${envelopeBToShow.labelNameA}">
                                                                    <input type="hidden" name="inputlebeltype" value="${envelopeBToShow.labelTypeA}">
                                                                    <label>${envelopeBToShow.labelNameA}<i ${envelopeBToShow.labelMandatoryA == 'true'} style="color:red;">*</i></label>


                                                                    <c:if test="${envelopeBToShow.labelTypeA=='1'}"> 
                                                                        <form:input path="datalist[${theindex.index}].textfield" value="${envelopeBToShow.fieldValueOfContractor}" class="form-control checkValidation" placeholder=" "/>
                                                                        <span class="form-text errormsg"></span> 
                                                                        <!--<span class="form-text text-muted" style="color: red;">gfjkfjkjk</span>-->
                                                                        <span class="form-text text-muted" style="color: red;" id="${dynamicTemplate.labelNameA}Error"></span>

                                                                    </c:if>
                                                                    <c:if test="${envelopeBToShow.labelTypeA=='2'}">

                                                                        <form:input path="datalist[${theindex.index}].textfield" value="${envelopeBToShow.fieldValueOfContractor}" class="form-control checkValidation" placeholder=" "/>
                                                                        <span class="form-text errormsg"></span>   

                                                                    </c:if>
                                                                    <c:if test="${envelopeBToShow.labelTypeA=='3'}">

                                                                        <c:if test="${reBidd!=true}">
                                                                            <div class="custom-file">
                                                                                <input type="file" class="custom-file-input checkValidation" id="fileB${envelopeBToShow.tender_EnvelopeA_SequnceId}"  name="datalist[${theindex.index}].files" onchange="saveEnvelopeFile(this.id)">

                                                                                <span class="form-text errormsg" ></span>   
                                                                                <span class="form-text text-muted" style="color: red;" id="${envelopeBToShow.labelNameA}Error"></span>
                                                                                <label class="custom-file-label" for="customFile"><span id="fileNamefileB${envelopeBToShow.tender_EnvelopeA_SequnceId}" >${envelopeBToShow.fileName}</span></label>
                                                                            </div>
                                                                        </c:if>    
                                                                        <c:if test="${reBidd==true}">

                                                                            <div class="custom-file">

                                                                                <input type="file" class="custom-file-input checkValidation" id="fileB${envelopeBToShow.tender_EnvelopeA_SequnceId}"  name="datalist[${theindex.index}].files" onchange="saveEnvelopeFile(this.id);" >
                                                                                <input type="hidden" name="datalist[${theindex.index}].fileFlag" id="fileFlag${envelopeBToShow.labelNameA}${envelopeBToShow.tender_EnvelopeA_SequnceId}" value="${envelopeBToShow.fileName}" /> 
                                                                                <span class="form-text text-muted errormsg"><a href="${envelopeBToShow.filePath}" target="_blank" >${envelopeBToShow.fileName}</a></span>   
                                                                                <span class="form-text text-muted" style="color: red;" id="${envelopeBToShow.labelNameA}Error"></span>
                                                                                <label class="custom-file-label" for="customFile"><span id="fileNamefileB${envelopeBToShow.tender_EnvelopeA_SequnceId}" ></span></label>

                                                                            </div> 
                                                                        </c:if>




                                                                    </c:if>
                                                                    <c:if test="${envelopeBToShow.labelTypeA=='4'}">

                                                                        <div class="input-group ">
                                                                            <div class="input-group-prepend"><span class="input-group-text "><i class="fa fa-rupee-sign"></i></span></div>
                                                                                    <form:input path="datalist[${theindex.index}].textfield" value="${envelopeBToShow.fieldValueOfContractor}" class="form-control checkValidation" placeholder=" " aria-describedby="basic-addon1" onkeyup="dynamicTemplateConv(this.value, this.id);" id="${envelopeBToShow.labelNameA}${envelopeBToShow.tender_EnvelopeA_SequnceId}"/>
                                                                            <span class="form-text errormsg d_blk_wdt"></span> 
                                                                        </div>
                                                                        <span class="form-text text-muted" style="color: red;" id="${envelopeBToShow.labelNameA}Error"></span>

                                                                        <div class="form-group"> 
                                                                            <!--                                                                    <label>(In fig.)</label>-->
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend"><span class="input-group-text "><i class="fa fa-rupee-sign"></i></span></div>
                                                                                        <form:input path="datalist[${theindex.index}].textfieldInWords" class="form-control" value="${envelopeBToShow.fieldValueInWordsOfContractor}" placeholder=" " id="dynamicTemplateValue${envelopeBToShow.labelNameA}${envelopeBToShow.tender_EnvelopeA_SequnceId}" readonly="true"/>

                                                                            </div>
                                                                            <!--<span class="form-text text-muted">Please .....</span>-->   
                                                                            <span class="form-text errormsg" ></span>  
                                                                            <span class="form-text text-muted" style="color: red;" id="${envelopeBToShow.labelNameA}Error"></span>
                                                                        </div> 



                                                                    </c:if>

                                                                </div>
                                                                     <p><input type="checkbox" name="terms" id="termsforB" value="1"> I accept the <u>Terms and Conditions</u></p>

                                                            <div class="form-group col-lg-12">
                                                                <div class="k-form__actions">
                                                                    <c:if test="${reBidd==true}">
                                                                        <button type="button" class="btn btn-primary" onclick="updateEnvelopeData('B');">Submit </button>    


                                                                    </c:if>
                                                                    <c:if test="${submitBid=='submit'}">
                                                                        <button type="button" class="btn btn-primary" id="buttonforB" onclick="saveEnvelopeData('B');">Submit</button>
                                                                        <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                    </c:if>
                                                                </div> 
                                                            </div>
                                                            </c:forEach>
                                                                
                                                            
                                                                        <input type="hidden" id="deptUserId" value="${DeptUserId}">
                                                                <input type="hidden" id="templateid" value="${templateId}">
                                                                 <input type="hidden" id="tenderid" value="${tender.tender_Id}">
                                                                <input type="hidden" id="contId" value="${contId}">
                                                               
                                                                 <div id="question" style="display: none;"></div>
                                                                <div id="question"></div>

<!-- Container to display the table -->
                                                                    <div id="ajaxResponse"></div>
                                                                             <div id="addButtonForAction"></div>
<!-- Modal structure -->


                                                        </div>
                                                    </form:form>

                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="k_tabs_8_3" role="tabpanel">

                                                <div id="submittedC" class="envelope_success_messege" style="display: none;">
                                                    Envelope C is Submitted Successfully..


                                                </div>  
<!--                                                <div id="showHash" class="envelope_success_messege" style="display: none;">


                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col">
                                                                 Your auto-adjustable heading 
                                                                <h4>CheckSum </h4>
                                                                <p style="font-size:14px;" id="showData" class="text-wrap"></p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>-->

                                                <div id="envelope_c">   
                                                    <form:form action="" id="formforC" class="k-form" modelAttribute="envelopeCData" style="padding: 19px;"  enctype="multipart/form-data">
                                                        <input name="id" type="hidden">

                                                        <form:hidden path="envelopeCFieldId" />

                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="socicon-delicious"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Envelope C
                                                                </h3>
                                                            </div>

                                                        </div>
                                                        <div class="form-group border_boxesDiv clearfix vaishali_g"> 


                                                            <c:if test="${envelopeCfor=='Lumpsum Tender'}">
                                                                <div class="form-group ">

                                                                    <label>Rate<i  style="color:red;">*</i></label>
                                                                    <!--<input type="text" class="form-control" placeholder=" ">-->
                                                                    <form:input  path="encryptedBidByContractor"  onKeyup="dynamicTemplateConv(this.value,2);"  class="form-control currency" placeholder="Enter rate" onkeypress="return validateFloatKeyPress(this,event);"/>

                                                                    <span id="errormsg" class="form-text errormsg"></span>


                                                                </div> 
                                                                <div class="form-group"> 
                                                                    <label>Rate (In words)</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                                                <form:input path="encryptedBidInWordByContractor" id="dynamicTemplateValue2" class="form-control" placeholder=" " aria-describedby="basic-addon1" readonly="true"/>
                                                                    </div>
                                                                    <span class="form-text text-muted"></span>
                                                                </div> 
                                                            </c:if>
                                                            <c:if test="${envelopeCfor=='Persentage Rate Tender'}">
                                                                <div class="form-group ">

                                                                    <label>Percentage Rate<i  style="color:red;">*</i></label>
                                                                    <!--<input type="text" class="form-control" placeholder=" ">-->
                                                                    <form:select path="encryptedDeviationByContractor" id="selectid" onchange="percentageRate(this.value);" class="form-control currency"   >
                                                                        <c:forEach var="percentaglist" items="${percentRateList}"  >  

                                                                            <option value="${percentaglist.key}" ${percentaglist.key== envelopeCData.encryptedDeviationByContractor ?"selected='selected'":""}>${percentaglist.value}</option>
                                                                        </c:forEach>

                                                                    </form:select>
                                                                    <span id="errormsg1" class="form-text errormsg"></span>                


                                                                </div> 
                                                                <div class="form-group" id="ratePersentage" style="display: none"> 
                                                                    <label>Rate value<i  style="color:red;">*</i></label>
                                                                    <div class="input-group">
                                                                        <form:input path="encryptedBidByContractor" class="form-control" placeholder=" " id="dynamicTemplateValue2" onkeypress="return validateFloatKeyPressLimit(this,event);"  tabindex="-1" aria-describedby="basic-addon1" />
                                                                    </div>
                                                                    <span id="errormsg" class="form-text errormsg"></span>
                                                                </div> 
                                                            </c:if>


                                                            <p><input type="checkbox" name="terms" id="termsforC" value="1"> I accept the <u>Terms and Conditions</u></p>


                                                            <div class="form-group row">
                                                                <div class="col-lg-12">
                                                                    <div class="k-form__actions">
                                                                        <c:if test="${reBidd==true}">
                                                                            <button type="button" class="btn btn-primary" onclick="updateEnvelopeCData();">Submit </button>    



                                                                        </c:if>
                                                                        <c:if test="${submitBid=='submit'}">
                                                                            <button type="button" class="btn btn-primary" id="buttonforC" onclick="saveEnvelopeCData();">Submit</button>
                                                                            <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                        </c:if>
                                                                    </div> 
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </form:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--end::Portlet-->
                            </div>

                        </div>

                        <!--end::Row-->
                    </div>

                    <!-- end:: Content Body -->
                </div>

                <!-- end:: Content -->

                <!-- begin:: Footer -->


                <!-- end:: Footer -->
            </div>

            <!-- begin:: Aside Secondary -->



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


    <!--end::Modal-->



    <input type="button" hidden="true" id="otponBidWithDraw" data-toggle="modal" data-target="#bidWithDrawotp" >
    <jsp:include page="BidWithDrawForm.jsp"/>
    <input type="button" hidden="true" id="otponBidWithDraw1" data-toggle="modal" data-target="#bidwithdrawformfields" >
    <jsp:include page="BidWithDrawForm1.jsp"/>

    <script src="<c:url value="/resources/angular/DepartmentUser.js"/>"></script>
    <!---Start-Modal-Tab-Upload-Documents--->
    <style>
        .uplodeFolderFile .modal-header {
            border-bottom: 0;
            padding-bottom: 0;
        }

        .pd-tp {
            padding-top: 0px;
        }

        .pd-bt {
            padding-bottom: 0px;
        }

        .pd-lt {
            padding-left: 0px;
        }

        .pd-right {
            padding-top: 0px;
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
            text-align:center;
        }
    </style>

    <!-- Modal -->


    <!---End-Modal-Tab-Upload-Documents--->
    <!--begin::Modal-->


    <!-- begin::Global Config -->
    <!-- begin::Quick Panel -->


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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

    <script src="<c:url value="resources/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/js/jquery.min.js"/>" type="text/javascript"></script>


    <!--end:: Global Mandatory Vendors -->

    <!--begin:: Global Optional Vendors -->
    <script src="<c:url value="resources/vendors/jquery-form/dist/jquery.form.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/block-ui/jquery.blockUI.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/theme/framework/vendors/bootstrap-datepicker/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/theme/framework/vendors/bootstrap-timepicker/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-maxlength/src/bootstrap-maxlength.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-select/dist/js/bootstrap-select.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/typeahead.js/dist/typeahead.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/handlebars/dist/handlebars.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/inputmask/dist/jquery.inputmask.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/inputmask/dist/inputmask/inputmask.date.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/inputmask/dist/inputmask/inputmask.numeric.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/inputmask/dist/inputmask/inputmask.phone.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/nouislider/distribute/nouislider.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/owl.carousel/dist/owl.carousel.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/autosize/dist/autosize.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/clipboard/dist/clipboard.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/dropzone/dist/dropzone.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/summernote/dist/summernote.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/markdown/lib/markdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/bootstrap-markdown/js/bootstrap-markdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/theme/framework/vendors/bootstrap-markdown/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/jquery-validation/dist/jquery.validate.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/jquery-validation/dist/additional-methods.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/theme/framework/vendors/jquery-validation/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/toastr/build/toastr.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/raphael/raphael.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/morris.js/morris.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/chartist/dist/chartist.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/chart.js/dist/Chart.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/vendors/jquery-idletimer/idle-timer.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/waypoints/lib/jquery.waypoints.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/counterup/jquery.counterup.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/es6-promise-polyfill/promise.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/sweetalert2/dist/sweetalert2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/vendors/theme/framework/vendors/sweetalert2/init.js"/>" type="text/javascript"></script>

    <!--end:: Global Optional Vendors -->

    <!--begin::Global Theme Bundle -->
    <script src="<c:url value="resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

    <!--end::Global Theme Bundle -->

    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
    <!--begin::Global Theme Bundle -->
    <script src="<c:url value="resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

    <!--end::Global Theme Bundle -->

    <!--begin::Page Vendors -->
    <script src="<c:url value="resources/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/bootstrap-select.js"/>" type="text/javascript"></script>

    <!--end::Page Vendors -->

    <script src="<c:url value="resources/assets/demo/custom/components/base/popovers.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/app/scripts/custom/dashboard.js"/>" type="text/javascript"></script>

    <!--begin::Global App Bundle -->
    <script src="<c:url value="resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/dropzone.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/jquery.repeater.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/assets/demo/repeater.js"/>" type="text/javascript"></script>
    <script src="<c:url value="resources/assets/demo/scripts.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/custom/components/forms/widgets/summernote.js"/>" type="text/javascript"></script>
    <!--begin::Page Vendors -->
    <script src="<c:url value="resources/assets/vendors/custom/datatables/datatables.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script>
    <!--end::Page Vendors -->
    <!--begin::Page Scripts -->
    <script src="<c:url value="resources/assets/demo/custom/components/datatables/advanced/row-grouping.js"/>" type="text/javascript"></script> 
    <!--end::Page Scripts -->
    <!--end::Global Theme Bundle -->
    <script src="<c:url value="resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/angular/ContractorController.js"/>" type="text/javascript" ></script>

    <script>


                                                                                        $("#saveenvA").hide();
                                                                                        $(document).ready(function () {


                                                                                        });
    </script>
    <script>

                function  percentageRate(id) {
                    
                   
//                alert("perCentages "+id);
                    if (id == '1' || id == '3') {
                        $('#ratePersentage').show();
                    } else {
                        $('#ratePersentage').hide();
                    }
                }

                function persentageLimit(limit) {
//       alert("limit "+limit);
                    var persentagelimit = new Regex("[0-9]{2}")
                    if (!persentagelimit.test(limit)) {
                        return false;
//           alert("limit "+limit);

                    } else {

                        return true;
                    }


                }
    </script>

    <script>
//                function onPageLoad() {
//                    var EAData = "${showEAData}";
//                    var EBData = "${showEBData}";
//                    var ECData = "${showECData}";
//                    console.log("EN DATA IS " + EBData);
//                    if (EAData === "true")
//                    {
//
//                    } else
//                    {
//                        $('#envelope_a').hide();
//                        $('#submittedA').show();
//                    }
//
//
//                    if (EBData === "true")
//                    {
//
//                    } else
//                    {
//                        $('#envelope_b').hide();
//                        $('#submittedB').show();
//                    }
//
//                    if (ECData === "true")
//                    {
//
//                    } else
//                    {
//                        $('#envelope_c').hide();
//                        $('#submittedC').show();
//                    }
//
//                }





                // Call onPageLoad function when the page finishes loading
//                window.onload = onPageLoad;

    </script>

    <script>



                function templateValidation(text) {
                    //   alert("validation called templateValidation"+text);

                    var countError = 0;
                    $("#fformfor" + text + " input[name=mendatory]").each(function () {


                        var inputvalmendetory = $(this).val();
                        var inputvallabel = $(this).next('input').val();
                        var inputlebeltype = $(this).next().next('input').val();
                        var mainVal = $(this).parent().find('.checkValidation');
//                        alert("mainval  "+mainVal+" mendetory  "+ inputvalmendetory);
                        var numeric = new RegExp('^[0-9]+$');
                        var alphNumerc = new RegExp('[A-Za-z ]+$');
                        var currency = new RegExp('^[1-9][0-9]*$');

                        if (inputvalmendetory === 'true') {
                            if ($(mainVal).val() === '') {
                                if (inputlebeltype === '3') {
                                    var fileAnchorVal = $(this).parent().find('a').text();
                                    if (fileAnchorVal == null || fileAnchorVal == '') {
                                        $(mainVal).next('span').show();
                                        $(mainVal).next('span').html(inputvallabel + " is required");
                                        countError++;
                                    }
                                } else {
                                    $(mainVal).next('span').show();
                                    $(mainVal).next('span').html(inputvallabel + " is required");
                                    countError++;
                                }
                            } else if ($(mainVal).val() && inputlebeltype === '2') {
                                if (numeric.test($(mainVal).val())) {
                                    $(mainVal).next('span').hide();
                                    $(mainVal).next('span').html();
                                } else {
                                    $(mainVal).next('span').show();
                                    $(mainVal).next('span').html(inputvallabel + " Should be numeric");
                                    countError++;
                                }
                            } else if ($(mainVal).val() && inputlebeltype === '4') {
                                if ((numeric.test($(mainVal).val())) && (currency.test($(mainVal).val()))) {
                                    $(mainVal).next('span').hide();
                                    $(mainVal).next('span').html();
                                } else {
                                    $(mainVal).next('span').show();
                                    $(mainVal).next('span').html(inputvallabel + " Should be numeric and not start from Zero");
                                    countError++;
                                }
                            } else if ($(mainVal).val() && inputlebeltype === '1') {
                                if (alphNumerc.test($(mainVal).val())) {
                                    $(mainVal).next('span').hide();
                                    $(mainVal).next('span').html();
                                } else {
                                    $(mainVal).next('span').show();
                                    $(mainVal).next('span').html(inputvallabel + " Should be Alphabatic only");
                                    countError++;
                                }
                            } else {
                                $(mainVal).next('span').hide();
                                $(mainVal).next('span').html();
                            }
                        }
                    });
                    return countError;
                }

                function envelopeCvalidation() {

                    var countError = 0;
                    var dynamicTemplateValue2 = $("#dynamicTemplateValue2").val();
                    var percentageRate = $("#selectid").val();
                    //        alert("percentageRate " + percentageRate);
                    if (dynamicTemplateValue2 === null || dynamicTemplateValue2 === "") {
                        //            $("#dynamicTemplateValue2").css('border-color', 'red');
                        //            $("#errormsg").css('color', 'red');
                        $("#errormsg").html("Rate value is required");
                        countError++;
                    } else {
                        //            $("#dynamicTemplateValue2").css('border-color', '');
                        //            $("#errormsg").css('color', '');
                        $("#errormsg").html("");
                    }
                    if (percentageRate === '0') {

                        //           $("#selectid").css('border-color', 'red');
                        //            $("#errormsg1").css('color', 'red');
                        $("#errormsg1").html("Please Select Rate");
                        countError++;
                    } else {
                        //          $("#selectid").css('border-color', '');
                        //            $("#errormsg1").css('color', '');
                        $("#errormsg1").html("");

                    }
                    return countError;
                }



                //to show the selected file Name


                function checkTermsConditions(text) {
                    var tform = $("#termsfor" + text).is(":checked");

                    if (tform === true) {
                        return true;
                    } else {
                        $("#termsfor" + text).focus();
                        alert("Please Accept the Terms and Conditions Before Proceed.");
                        return false;
                    }

                }
                function saveEnvelopeData(text) {
                 //alert("test "+text);
                    var check_validation = templateValidation(text);
                    if (check_validation === 0) {
                      //  alert("11")
                        var check_validation1 = checkTermsConditions(text);
                        if (check_validation1 === true) {
    //alert("22")
                            var files = new Array();
                            var form = new FormData();
                            var other_data = $('#fformfor' + text).serializeArray();
                            $.each(other_data, function (key, input) {
                                  //  alert("33")
                                //   alert(this.name+" : "+this.value);
                                form.append(this.name, this.value);
                            });
                            $("#fformfor" + text + " input[type=file]").each(function (index) {
                                //   alert("index "+index);
                                   // alert("44")
                                var envelopefileId = this.id;
                                //   alert(envelopefileId);
                                var fileIndex = $("#name" + envelopefileId).val();
                                //  alert("envelopefileId "+fileIndex);
                                files = document.getElementById(envelopefileId).files[0];
//                        form.append("files[" + index + "]", files);
                                form.append("datalist[" + fileIndex + "].files", files);
                            });
    //alert("55")
                            $.ajax({
                                url: "getSaveEnvelope" + text,
                                type: "POST",
                                data: form,
                                processData: false,
                                contentType: false,
                                success: function (response) {
//                       alert("response "+response); 
                                    if (response === "Envelope A Submitted") {
                                        $('#envelope_a').hide();
                                        $('#submittedA').show();

                                    } else if (response === "Envelope B Submitted") {

                                        $('#envelope_b').hide();
                                        $('#submittedB').show();


                                    } else if (response === "Please Accept T&C.") {

                                        checkTermsConditions(text);

                                    } else if (response === "Bidding is Closed Now !") {
                                        swal('',
                                                response,
                                                'error'
                                                );
                                    } else {
                                        $.each(JSON.parse(response), function (key, value) {
                                            $('#' + key).html(value);
                                        });
                                    }
                                },
                                error: function (e) {
                                    alert('Error: ' + e);
                                    document.getElementById('wait').style.display = 'none';
                                }
                            });
                        }
                    }
                }

                function updateEnvelopeData(text) {
                    var check_validation = templateValidation(text);
                    if (check_validation === 0) {
                        var check_validation1 = checkTermsConditions(text);
                        if (check_validation1 === true) {
                            var files = new Array();
                            var form = new FormData();
                            var other_data = $('#fformfor' + text).serializeArray();
                            $.each(other_data, function (key, input) {
//              alert(this.name+" : "+this.value);
                                form.append(this.name, this.value);
                            });
                            $("#fformfor" + text + " input[type=file]").each(function (index) {
                                //alert("index "+this.value);
                                var envelopefileId = this.id;
                                var envelopefileValue = this.value;
                                var fileIndex = $("#name" + envelopefileId).val();
//                        alert("envelopefileId "+this.id+" envelopefileValue "+this.value+" fileName "+fileName);
                                if (envelopefileValue === null || envelopefileValue === "") {
                                    var fileName = $("#fileFlag" + envelopefileId).val();
                                    //       alert("file is not changed & file Name is "+fileName); 
                                    form.append("datalist[" + fileIndex + "].fileFlag", fileName);
                                } else {
                                    files = document.getElementById(envelopefileId).files[0];
                                    //        alert("file is changed & file Name is "+files.name);
//                         form.append("datalist["+fileIndex+"].fileFlag", ""); 
                                    form.append("datalist[" + fileIndex + "].files", files);
                                }
                            });
                            $.ajax({
                                url: "updateEnvelope" + text,
                                type: "POST",
                                data: form,
                                processData: false,
                                contentType: false,
                                success: function (response) {
//                        alert("response " + response);
                                    if (response === "Envelope A Re-bid Submitted") {
                                        $('#envelope_a').hide();
                                        $('#submittedA').show();

                                    } else if (response === "Envelope B Re-bid Submitted") {

                                        $('#envelope_b').hide();
                                        $('#submittedB').show();


                                    } else if (response === "Please Accept T&C.") {

                                        checkTermsConditions(text);

                                    } else if (response === "Bidding is Closed Now !") {
                                        swal('',
                                                response,
                                                'error'
                                                );
                                    } else {
                                        $.each(JSON.parse(response), function (key, value) {
                                            $('#' + key).html(value);
                                        });
                                    }
                                },
                                error: function (e) {
                                    alert('Error: ' + e);
                                    document.getElementById('wait').style.display = 'none';
                                }
                            });
                        }
                    }
                }

                function saveEnvelopeCData() {
                    var check_validation = envelopeCvalidation();
            // alert("check_validationss "+check_validation);
                    if (check_validation === 0 || check_validation === 1) {
                        var check_validation1 = checkTermsConditions('C');
                        if (check_validation1 === true) {
                            var form = new FormData();
                            var formData = $('#formforC').serializeArray();
                            $.each(formData, function (key, input) {
    //   alert(this.name+" : "+this.value);
                                form.append(this.name, this.value);
                            });
                            //     alert("form " + form);
                            $.ajax({
                                url: "getSaveEnvelopeC",
                                type: "POST",
                                data: form,
                                processData: false,
                                contentType: false,
                                success: function (response) {
//                       alert("response "+response);
                                    var data = JSON.parse(response);
                                    if (data.msg == "Envelope C Submitted") {
//                                  
                                        $('#envelope_c').hide();
                                        $('#submittedC').show();
//                                        $('#showHash').innerHTML("<div>helloo</div>");
                                        $('#showHash').show();
                                        $('#showData').html(data.hash);
                                    }
                                },
                                error: function (e) {
                                    alert('Error: ' + e);
                                    document.getElementById('wait').style.display = 'none';
                                }
                            });
                        }
                    }
                }

                function updateEnvelopeCData() {
                    //   alert("update Envelope C ");
                    var check_validation = envelopeCvalidation();
//             alert("check_validation "+check_validation);
                    if (check_validation === 0) {

                        var check_validation1 = checkTermsConditions('C');
                        if (check_validation1 === true) {
                            var form = new FormData();
                            var formData = $('#formforC').serializeArray();
                            $.each(formData, function (key, input) {
//        alert(this.name+" : "+this.value);
                                form.append(this.name, this.value);
                            });
                            //    alert("form " + form);
                            $.ajax({
                                url: "updateEnvelopeC",
                                type: "POST",
                                data: form,
                                processData: false,
                                contentType: false,
                                success: function (response) {
//                                    alert("response " + response);
                                    var data = JSON.parse(response);
//                                    console.log(data);
                                    if (data.msg == "Envelope C Re bidd is Submitted") {

                                        $('#envelope_c').hide();
                                        $('#submittedC').show();
                                        $('#showHash').show();
                                        $('#showData').html(data.hash);


                                    }
                                },
                                error: function (e) {
                                    alert('Error: ' + e);
                                    document.getElementById('wait').style.display = 'none';
                                }
                            });

                        }
                    }
                }


                function isNumberKey(evt)
                {
                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                        swal(
                                '',
                                '<h5 style="color:red">Only Numbers are allowed</h5>',
                                'error'

                                )
                        return false;
                    } else {
                        return true;
                    }
                }
                function bidRate(evt)
                {

                    $(this).val().substring($(this).val().indexOf('.'), $(this).val().indexOf('.').length).length > 2
                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                        swal(
                                '',
                                '<h5 style="color:red">Only Numbers are allowed</h5>',
                                'error'

                                )
                        return false;
                    } else {
                        return true;
                    }
                }

                function getEnvelopeCType() {

                    var getEnvelopeCType = '<c:out value="${envelopeCfor}"></c:out>';
                    var rate = '<c:out value="${envelopeCData.encryptedDeviationByContractor}"></c:out>';

                    if (getEnvelopeCType === "Persentage Rate Tender" && rate !== '2')
                    {
                        $("#ratePersentage").show();

                    } else {
                        $("#ratePersentage").hide();

                    }

                }

                function bidWithDrawfunction() {

                    var status = confirm("Do You really Want to WithDraw your Bid?");
                    if (status === true) {
                        $('#otponBidWithDraw').click();
                        getOTPcontractor();
                    } else {
//                alert("false");
                    }
                }





                function saveEnvelopeFile(i) {
                    //            alert("i"+i);
                    var file = i.toString();
                    $('#fileName' + i).html("");
                    var files = document.getElementById(i).files[0];
                    //      alert("fileName "+files.name); 
                    $('#fileName' + i).html(files.name);
                    $('#fileFlag' + i).val("");
                }

                function validateFloatKeyPress(el, evt) {

                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    var number = el.value.split('.');
                    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                        return false;
                    }
                    //just one dot
                    if (number.length > 1 && charCode == 46) {
                        return false;
                    }
                    //get the carat position
                    var caratPos = getSelectionStart(el);
                    var dotPos = el.value.indexOf(".");
                    if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
                        return false;
                    }
                    return true;
                }

//thanks: http://javascript.nwbox.com/cursor_position/
                function getSelectionStart(o) {
                    if (o.createTextRange) {
                        var r = document.selection.createRange().duplicate()
                        r.moveEnd('character', o.value.length)
                        if (r.text == '')
                            return o.value.length
                        return o.value.lastIndexOf(r.text)
                    } else
                        return o.selectionStart
                }
                function validateFloatKeyPressLimit(el, evt) {


                    var charCode = (evt.which) ? evt.which : event.keyCode;

                    var number = el.value.split('.');



                    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                        return false;
                    }
                    //just one dot
                    if (number.length > 1 && charCode == 46) {
                        return false;
                    }
                    //get the carat position
                    var caratPos = getSelectionStart(el);
                    var dotPos = el.value.indexOf(".");
                    if (caratPos > dotPos && dotPos > -1 && (number[1].length > 1)) {
                        return false;
                    }
                    return true;
                }


                $("#dynamicTemplateValue2").blur(function () {

                    var num = parseFloat($(this).val());
                    if ((num % 1) != 0)
                    {
                        if (num > 100)
                        {
//	 	alert("too decimal long"); 
                            $(this).val("");
                        } else
                        {
                            var cleanNum = num.toFixed(2);
                            $(this).val(cleanNum);
                        }
                    } else
                    {
                        var s = $(this).val().length;
                        alert(s);
                        if (s > 2)
                        {
//      alert("too long");
                            $(this).val("");
                        }
                    }

                    // if(num/cleanNum < 1){
                    //     alert('Please enter only 2 decimal places, we have truncated extra points');
                    //     }
                });
                
              function saveQCBSTemplate() {
    // Validation
    var deptUserId=$("#deptUserId").val();
    var tenderId = $("#tenderid").val();
    var templateIds = $("#templateid").val();
    var templateName = $("#templateName").val();
    var contractorId = $("#contId").val();
    var status = false;

    $("#ajaxResponse").find('table').each(function () {
        $(this).find('input').each(function () {
            if ($(this).val() == '' || $(this).val() == null) {
                $(this).css('border-color', 'red');
                status = true;
                swal(
                    'Alert',
                    'Please Fill All Fields',
                    'error'
                );
            } else {
                $(this).css('border-color', '#ddd');
            }
        });
    });

    if (status) {
        return;
    } // validation end

    var stqcJsonData = [];
    var formData = new FormData();
    $("#ajaxResponse").find('table').each(function (tableIndex) {
        var obj = {};
        $(this).find('input,select').each(function (inputIndex) {
            if (this.name == 'parameter') {
                obj['parameter'] = $(this).val();
            } else if (this.name == 'mark') {
                obj['mark'] = $(this).val();
            } else if (this.name == 'strUser') {
                obj['strUser'] = $(this).val();
            } else if (this.type === 'file' && this.files.length > 0) {
                formData.append('fileInput_' + tableIndex + '_' + inputIndex, this.files[0]);
            } else {
                obj[this.name] = $(this).val();
            }
        });
        stqcJsonData.push(obj);
    });

    console.log("HEYYYYYYY" + JSON.stringify(stqcJsonData));
    console.log("Department"+deptUserId)
    var json = JSON.stringify(stqcJsonData);
    formData.append('template', json);
    formData.append('templateId', templateIds);
    formData.append('templateName', templateName);
    formData.append('tenderId', tenderId);
    formData.append('contId', contractorId);
    formData.append('deptUserId',deptUserId);

    $.ajax({
        url: 'SaveEnvelopBData',
        data: formData,
        type: 'POST',
        processData: false,
        contentType: false,
        success: function (response) {
            $("#qcbsTemplateView").click();
            var templateId = parseInt(response);
            $("#templateId").val(templateId);
            $("#templateid").val(response);
            $("#QCBSTemplate").html('<a href="#" class="text-white" onclick="viewEditQCBSTemplate();">New Template</a>');
            if (response === "success") {
                $('#envelope_b').hide();
                $('#submittedB').show();
            }
            $("#QCBSTemplate").on("hide", function () {
                $("#QCBSTemplate a.btn").off("click");
            });
        },
        error: function (error) {
            alert("error : " + error);
        }
    });
}


function viewEditQCBSTemplate() {
    var templateId = $("#templateid").val();

    $.ajax({
        url: 'ViewQCBSTemplate',
        data: {'templateId': templateId},
        type: 'GET',
        success: function (response) {
            var data = JSON.parse(response);
            var parsedData = JSON.parse(data[1]);
            var templateId = data[0];

            var temp = "";
            var q = 0;

            // Clear previous content
            $("#question").empty();
            $("#ajaxResponse").empty();

            // Iterate over each object in the parsed JSON data
            parsedData.forEach(function (value) {
                if (typeof value === 'object') {
                    var question = value.question;
                    var parameter = value.parameter;
                    var mark = value.mark;
                    var strUser = value.strUser;
                    q++;

                    var html = '<table class="table table-bordered questiontable" align="center">';
                    
                  html += '<tr><td colspan="3"><span> No: ' + q + '<input type="text" name="templateName" id="templateName' + q + '" class="form-control questioncss" placeholder="Enter Criteria Question" value="' + question + '" readonly/></span></td></tr>';
html += '<tr><td colspan="3"><span><input type="text" name="parameter" id="mark' + q + '" class="form-control markcss" value="' + mark + '" readonly style="display: none;"/></span></td></tr>';
html += '<tr><td colspan="3"><span><input type="text" name="mark" id="mark' + q + '" class="form-control markcss" value="' + mark + '" readonly style="display: none;"/></span></td></tr>';


                  for (var i = 0; i < parameter.length; i++) {
    var fileUploadArea = ''; // Initialize fileUploadArea here
    var selectBoxAndUploadArea = ''; // Initialize selectBoxAndUploadArea here
    
    if (strUser[i] == '1') {
                fileUploadArea = '<div class="custom-file">' +
                    '<input type="file" class="custom-file-input" id="fileInput' + q + '_' + i + '" name="fileInput' + q + '_' + i + '">' +
                    '<label class="custom-file-label" for="fileInput' + q + '_' + i + '">Choose file</label>' +
                    '</div>';
            }

    // Generate options for select box
    var options = parameter.map(param => '<option value="' + param + '">' + param + '</option>').join('');
    
    // Define the HTML for select box and file upload area
    selectBoxAndUploadArea = '<select class="form-control d-inline-block w-auto mr-2" name="strUser" id="bidingQCBS' + q + '">' +
        '<option value="0">select</option>' + options +
        '</select>' + fileUploadArea;
}

// Wrap the select box and file upload area in a single row
var rowHtml = '<tr>' +
    '<td colspan="3" class="d-flex align-items-center">' +
    selectBoxAndUploadArea +
    '</td>' +
    '</tr>';

html += rowHtml;

                    html += '</table>';
                    temp += html;

                    // Append the question to the question container
                    var paragraph = $('<p></p>').text("Question " + q + ": " + question);
                    $('#question').append(paragraph);
                }
            });

            // Append the generated HTML to the ajaxResponse container
            $("#ajaxResponse").html(temp);

            // Append the Save button to the addButtonForAction container
           $("#addButtonForAction").html('<div style="display: flex; justify-content: center; margin-top: 20px;"><button onclick="saveQCBSTemplate();" class="btn btn-primary btn-sm" type="button" style="padding: 10px 20px; margin: 10px;"><i class="la la-save"></i> Save Template</button></div>');
        },
        error: function (error) {
            alert(error);
        }
    });
}



        </script>
        
    
        
        
        <script>


                    //window.onload=checkBidWithDraw(){
                    function bodyLoad() {

                        var bidWithDrawnByContractor =<c:out value="${bidWithDrawnByContractor}"/>;
                        //   alert("bidWithDrawnByContractor "+bidWithDrawnByContractor);
                        if (bidWithDrawnByContractor === true) {
                            $(':button').prop('disabled', true);
                            $(':input').prop('disabled', true);
                        }




                    }

    </script>
    <script>
                function dynamicTemplateConv(value, id) {
//                       alert("inside number2text   "+value);
                    var fraction = Math.round(frac(value) * 100);
                    var f_text = "";
                    if (fraction > 0) {
                        f_text = "And " + convert_number(fraction) + " Paise";
                    }
                    var word = convert_number(value);
//       alert(word);
                    if (word !== "" || word !== null) {

                        document.getElementById("dynamicTemplateValue" + id).value = word + " Rupees " + f_text + " Only";
                    } else {

                        document.getElementById("dynamicTemplateValue" + id).value = word + "  " + f_text + " ";

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
                    var Lc = Math.floor(number / 1000000000000);  /* Lakh Crore */
                    number -= Lc * 1000000000000;
                    var kb = Math.floor(number / 10000000000);  /* Thousand Crore */
                    number -= kb * 10000000000;
                    var An = Math.floor(number / 1000000000);  /* Hundred Crore */
                    number -= An * 1000000000;
                    var Gn = Math.floor(number / 10000000);  /* Crore */
                    number -= Gn * 10000000;
                    var kn = Math.floor(number / 100000);     /* lakhs */
                    number -= kn * 100000;
                    var Hn = Math.floor(number / 1000);      /* thousand */
                    number -= Hn * 1000;
                    var Dn = Math.floor(number / 100);       /* Tens (deca) */
                    number = number % 100;               /* Ones */
                    var tn = Math.floor(number / 10);
                    var one = Math.floor(number % 10);
                    var res = "";

                    if (Lc > 0)
                    {
                        res += (convert_number(Lc) + " Lakh ");
                    }
                    if (kb > 0)
                    {
                        res += (convert_number(kb) + " Thousand ");
                    }
                    if (An > 0)
                    {
                        res += (convert_number(An) + " Hundred ");
                    }
                    if (Gn > 0)
                    {
                        res += (convert_number(Gn) + " Crore");
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
                                convert_number(Dn) + " Hundred ");
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

    <script type="text/javascript">
                $("#saveEmd").click(function (e) {
                    e.preventDefault();
                    //            alert("saveEmd");
                    var formdata = new FormData();
                    //                        alert("formdata" + formdata);

                    $('#emdofflineid').find('input[type!=file],textarea,select').each(function () {

                        formdata.append(this.name, this.value);
                    });

                    var emdCopyFile = document.getElementById('emdCopy').files[0];
                    //            alert("emdCopyFile  :::" + emdCopyFile);

                    var emdlink = $("#emdcopyLink").val();
                    //            if ((typeof emdCopyFile == "undefined" || emdCopyFile == '') && (emdlink == '' || emdlink == null)) {
                    //                alert("Please Upload EMD copy");
                    //            }
                    if (!(typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink === null || emdlink === ''))
                    {

                        //                right
                        alert("emdCopyFile has changed in save::: " + emdCopyFile);
                        formdata.append("emdCopyFile", emdCopyFile);
                    } else if (!(typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink !== null || emdlink !== ''))
                    {
                        //                right
                        alert("file has changed in updation");
                        formdata.append("emdCopyFile", emdCopyFile);
                    } else if ((typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink !== null || emdlink !== ''))
                    {
                        //                right
                        //                formdata.append("emdCopyFile" ,emdCopyFile);
                        alert("file has not changed in updation");
                    } else if ((typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink === null || emdlink === ''))
                    {
                        //                formdata.append("emdCopyFile" ,emdCopyFile);
                        alert("file is not selected in save");
                    }



                    //                        }
                    $.ajax({
                        url: "saveEmdData",
                        type: "Post",
                        data: formdata,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            //                    alert("Response is : " + response);
                            $('.ValidationMsg').html('');
                            if (response == "Tender Wise Emd successfully saved")
                            {
                                $("#saveenvA").show();
                                $("#ForEMDid").hide();
                                swal(
                                        '',
                                        'Tender Wise Emd successfully saved',
                                        'success'
                                        )
                            } else
                            {
                                $("#saveenvA").hide();
                                $("#ForEMDid").show();
                                swal(
                                        '',
                                        'Tender Wise Emd did not save',
                                        'error'
                                        )

                                $.each(JSON.parse(response), function (key, value) {
                                    $("#" + key + "Error").html(value);
                                    console.log(key);
                                });
                            }
                            //                                    $.each(JSON.parse(response), function (key, value) {
                            //                                        $("#"+key+"Error").html(value);
                            //                                        
                            //                                            swal(
                            //                                                    '',
                            //                                                   ' Tender Wise Emd did not save',
                            //                                                    'error'
                            //                                                    )
                            ////                                       
                            //                                    });
                        },
                        error: function () {
                            console.log('Upload error');
                        }
                    });
                });
    </script>  

    <script>
                function saveemd() {
                    //            alert("validation function called");
                    var x = $("#bankName").val();
                    var n = $("#bankOtherName").val();
                    var y = $("#emdCopy").val();
                    var z = $("#bankBranchName").val();
                    var m = $("#emdValidity").val();
                    var alpha = /^[a-zA-Z]*$/;
                    var alphneu = /^[0-9]*$/;
                    //            var mobNoreg = /^[0]?[789]\d{9}$/;
                    //            var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.doc|\.docx|\.xl|\.xlx|\.pdf|\.rar|\.zip|\.cdr|\.dwg)$/i;
                    //            var email = document.getElementById("txtEmail");

                    if (x === "Other")
                    {
                        if (n === "") {
                            //      alert("n:" + n);
                            document.getElementById("bankOtherNamespan").innerHTML = "Bank Name can not be empty";
                            document.getElementById("bankspan").innerHTML = "";
                        } else {
                            document.getElementById("bankOtherNamespan").innerHTML = "";
                        }
                    } else
                    {
                        if (x === "") {
                            document.getElementById("bankspan").innerHTML = "Please Select Bank Name";
                        } else {
                            document.getElementById("bankspan").innerHTML = "";
                        }
                    }
                    if (y === "") {
                        document.getElementById("emdCopyspan").innerHTML = "Please Select Emd Copy";
                    } else
                    if (!allowedExtensions.exec(y)) {
                        alert('Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.');
                        document.getElementById("emdCopyspan").innerHTML = "Please upload file having extensions .jpeg/.jpg/.png/.doc/.docx/.xl/.xlx/.pdf/.rar/.zip/.cdr/.dwg only.";
                    } else {
                        document.getElementById("emdCopyspan").innerHTML = "";
                    }
                    if (m === "") {
                        document.getElementById("emdValidityspan").innerHTML = "Emd Validity can not be empty";
                    } else if (!alphneu.exec(m))
                    {
                        document.getElementById("emdValidityspan").innerHTML = "Month Number should be neumeric";
                    } else {
                        document.getElementById("emdValidityspan").innerHTML = "";
                    }
                    if (z === "") {
                        document.getElementById("bankBranchNamespan").innerHTML = "Branch Name can not be empty";
                    } else if (!alpha.exec(z)) {
                        //            alert('This field should be Alphabetic');
                        document.getElementById("bankBranchNamespan").innerHTML = "Branch Name should be alphabetic";
                    } else {
                        document.getElementById("bankBranchNamespan").innerHTML = "";
                    }
                }
    </script>
    <script>
                function admSelectCheck(nameSelect)
                {
//            alert("nameSelect " + nameSelect);
                    console.log(nameSelect);
                    if (nameSelect) {
                        admOptionValue = document.getElementById("otherid").value;
                        if (admOptionValue == nameSelect.value) {
                            document.getElementById("admDivCheck").style.display = "block";
                        } else {
                            document.getElementById("admDivCheck").style.display = "none";
                        }
                    } else {
                        document.getElementById("admDivCheck").style.display = "none";
                    }
                }
    </script>

    <script>
                var fixmeTop = $('.fixme').offset().top;
                $(window).scroll(function () {
                    var currentScroll = $(window).scrollTop();
                    if (currentScroll >= fixmeTop) {
                        $('.fixme').css({
                            position: 'fixed',
                            top: '79px',
                            right: '4.4%'
                        });
                    } else {
                        $('.fixme').css({
                            position: 'static'
                        });
                    }
                });



    </script>
    <script>
                function saveEmdFile(name)
                {
                    //    alert("in saveEmdFile"+name); 
                    var file = document.getElementById('emdCopy').files[0].name;
                    //   alert("file:::"+file);
                    $("#emdSpan").html(file);

                }



    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</body>
<!-- Angular script -->

<!-- end::Body -->
<script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
<script src="<c:url value="/resources/angular/DepartmentUserController.js" />"></script>
</html> 