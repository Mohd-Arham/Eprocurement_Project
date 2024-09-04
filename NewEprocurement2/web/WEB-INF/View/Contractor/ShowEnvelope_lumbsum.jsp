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
                                $(':button').prop('disabled', true);
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
                                        <textarea type="email" class="form-control" id="remarkNote" placeholder=" " name="remarkNote"></textarea>
                                        <span class="form-text text-muted" id="remarkError" style="color: red;"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Upload File<i style="color:red;">*</i></label>
                                        <div></div>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="uploadfile" name="uploadfile">
                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                            <span class="form-text text-muted" id="uploadfileError" style="color: red;"></span>
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
              <%@include  file="../Contractor/Tiles/Header.jsp" %> 

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
                                                    
                                                     
                                                    
                                                   
                                                  
                                                    <tr><th>Tender No.</th>
                                                        <td>${tender.tenderNumber}</td>
                                                        <th>NIT No.</th>
                                                        <td>${tender.nitNumber}</td>
                                                        <th>PAC</th>
                                                        <td colspan="2"><span class="rs_ic"><i class="la la-rupee"></i>100000</span></td>
                                                       
                                                        
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
                                                       
                                                   </tr>
                                                     <c:if test="${bidWithDraw==true}">
                                                       <tr> 
                                                        
                                                      
                                                            <c:if test="${bidWithDrawnByContractor!=true}">
                                                            <td><a href="javascript:;" onclick="bidWithDraw();">BidWithDraw</a></td>
                                                            </c:if>
                                                            <c:if test="${bidWithDrawnByContractor==true}">
                                                                <td>Your Bid is WithDrawn</td>
                                                            </c:if>
                                                    <button type="button" data-toggle="modal" data-target="#OTP_modal" id="otpModal" hidden="true">
                                                        
                                                    </tr>
                                                    </c:if>
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
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#k_tabs_8_1" role="tab">
                                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                                    <span class="nav-link-title">Envelope A</span>
                                                </a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_tabs_8_2" role="tab">
                                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                                    <span class="nav-link-title">Envelope B</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_tabs_8_3" role="tab" onclick="getEnvelopeCType();">
                                                    <span class="nav-link-icon"><i class="flaticon-multimedia-2"></i></span>
                                                    <span class="nav-link-title">Envelope C</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade active show" id="k_tabs_8_1" role="tabpanel">
                                                
                                                 <div id="submittedA"  style="display: none">
                                                    <div class="envelope_success_messege">
                                                        Envelope A is Submitted Successfully.. 

                                                    </div>
                                                    <center><button type="button" class="btn btn-success btn-sm" onclick="viewBid('A');">View Bid</button></center>


                                                </div>
                                                
                                               
                                                <div id="envelope_a">  
<!--                                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                        <div class="k-portlet__head-label">
                                                            <span class="k-portlet__head-icon">
                                                                <i class="socicon-delicious"></i>
                                                            </span>
                                                            <h3 class="k-portlet__head-title">
                                                                Tender Wise EMD 

                                                            </h3>
                                                        </div>
                                                    </div>-->
                                                    <!--Start emd-->
                                               <%--     <c:if test="${emdApplicable=='1'}">

                                                        <c:if test="${status=='offline'}">
                                                            <div id="emdofflineid">
                                                                <!--${emdpayment}-->
                                                                <form:form class="createdivison"  style="padding: 19px;"  modelAttribute="emdpayment"  enctype="multipart/form-data"  id="EmptempDataform">
                                                                    <!--                                                        <div ng-repeat="emdmod in EmdModel">-->
                                                                    <!--{{emdmod.emdInFig}}-->
                                                                    <c:if test="${emdpayment.emdId!=null}">                                                            
                                                                        <form:hidden  path="emdId"/>
                                                                    </c:if>

                                                                    <div class="border_boxesDiv">  
                                                                        <div class="k-separator k-separator--border-dashed k-separator--space-lg"></div>
                                                                        <div class="form-group row">
                                                                            <div class="form-group col-lg-6">
                                                                                <label>Bank Name (EMD Issued)</label>
                                                                                <select class="form-control"  id="bankName"  name="bankName" onchange="admSelectCheck(this);">
                                                                                    <c:if test="${emdpayment.bankName==null}">
                                                                                        <option value="">select</option>
                                                                                    </c:if>
                                                                                    <%--<c:if test="${emdpayment.bankName!=null}">--%>
                                                                                        <!--<option value="${emdpayment.bankName}">${emdpayment.bankName}</option>-->
                                                                                    <%--</c:if>
                                                                                    <c:forEach var="banklistvar" items="${banknamelist}">   
                                                                                        <option value="${banklistvar.bankId}">${banklistvar.bankNames}</option>
                                                                                    </c:forEach>          
                                                                                </select>  
                                                                                <span class="form-text  ValidationMsg"  id="bankNameError"></span>
                                                                                <span class="form-text  ValidationMsg"  id="bankspan"></span>
                                                                            </div> 
                                                                            <div class="col-lg-6">
                                                                                <label class="">Bank Branch (EMD Issued)</label>
                                                                                <input type="text" class="form-control" placeholder=" " id="bankBranchName" value="${emdpayment.bankBranchName}"  name="bankBranchName">
                                                                                <span class="form-text  ValidationMsg"  id="bankBranchNameError"></span>
                                                                                <span class="form-text  ValidationMsg"  id="bankBranchNamespan"></span>

                                                                            </div>
                                                                            <div class="col-lg-6" id="admDivCheck" style="display:none;">
                                                                                <label>Other</label>  

                                                                                <input type="text" class="form-control"  id="bankOtherName" value="${emdpayment.bankOtherName}" name="bankOtherName"/> 
                                                                                <span class="form-text  ValidationMsg" id="bankOtherNameError" ></span>
                                                                                <span class="form-text  ValidationMsg" id="bankOtherNamespan" ></span>
                                                                            </div>
                                                                        </div>

                                                                        <div class="k-separator k-separator--border-dashed k-separator--space-lg"></div>

                                                                        <div class="form-group row">
                                                                             <div class="col-lg-4"> 
                                                                                <label>EMD Value (In Rs.)</label>
                                                                                <div class="input-group">
                                                                                    <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                                                                    <input type="text" class="form-control" id="emdValue" readonly="true"  placeholder="Emd Value"  name="emdInFig" placeholder=" " value="${emdvalue}" aria-describedby="basic-addon1">
                                                                                </div>
                                                                                <span class="form-text text-muted"></span>
                                                                            </div>
                                                                            <div class="col-lg-4"> 
                                                                                <label>EMD Validity (In Months)</label>
                                                                                <input type="text" class="form-control" id="emdValidity"  placeholder=" "  value="${emdpayment.emdValidity}" name="emdValidity">
                                                                                <span class="form-text  ValidationMsg"  id="emdValidityError"></span>
                                                                                <span class="form-text  ValidationMsg"  id="emdValidityspan"></span>

                                                                            </div>
                                                                            <div class="col-lg-4"> 
                                                                                <label>Upload Copy of EMD</label>
                                                                                <div></div>
                                                                                <div class="custom-file">
                                                                                   
                                                                                    <input type="file" class="custom-file-input" name="emdCopy" onchange="saveEmdFile(this.id)" value="${newemdcopy}" id="emdCopy">
                                                                                    
                                                                                    <input type="hidden" id="emdcopyLink" value="${emdpayment.emdCopy}" >
                                                                                    <a href="${emdpayment.emdCopyUrl}" target="_blank">${emdpayment.emdCopy}</a>
                                                                                    <label class="custom-file-label" for="customFile" ><span id="emdSpan"></span></label>
                                                                               
                                                                                </div>
                                                                                <span class="form-text  ValidationMsg"  id="emdCopyError"></span>
                                                                                <span class="form-text  ValidationMsg"  id="emdCopyspan"></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="k-separator k-separator--border-dashed k-separator--space-lg"></div>

                                                                        <div class="form-group row"> 
                                                                            <div class="col-lg-12">
                                                                                <label class="">Remarks</label>
                                                                                <textarea class="form-control" placeholder=" " value="${emdpayment.remark}" id="remark"   name="remark"></textarea>
                                                                                <span class="form-text  ValidationMsg"  id="remarkError"></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="k-separator k-separator--border-dashed k-separator--space-lg"></div>
                                                                        <div class="form-group row">
                                                                            <div class="col-lg-12">

                                                                                <div class="k-form__actions">
                                                                                    <button type="button" class="btn btn-primary" href="javascript:void(0)" onclick="saveemd();"  id="saveEmd">Submit</button>
                                                                                    <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                                </div> 
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--</div>-->
                                                                </form:form>
                                                            </div>         
                                                        </c:if>


                                                        <c:if test="${status=='online'}">

                                                            <form class="createdivison" style="padding: 19px;"  enctype="multipart/form-data"  id="EmptempDataform">
                                                                <!--                                                        <div ng-repeat="emdmod in EmdModel">-->
                                                                <!--{{emdmod.emdInFig}}-->
                                                                <input type="hidden" name="tender_Id" ng-model="EmdModel.tender_Id" id="tender_Id" value="{{EmdModel.tender_Id}}" ng-init="EmdModel.tender_Id = EmdModel.tender_Id"/>
                                                                <div class="border_boxesDiv">  

                                                                    <div class="form-group row">
                                                                        <div class="col-lg-6">

                                                                            <span class="form-text  ValidationMsg"  id="bankBranchNameError"></span>
                                                                            <button type="button" class="btn btn-primary">Payment</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--</div>-->
                                                            </form>     


                                                        </c:if>
                                                    </c:if>  --%>

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
                                                                        <button type="button" class="btn btn-primary" onclick="updateEnvelopeData('A');">Submit Re-Bid</button>    


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



                                            <div class="tab-pane fade" id="k_tabs_8_2" role="tabpanel">

                                                <div id="submittedB" class="envelope_success_messege" style="display: none">
                                                   Envelope B is Successfully Submitted..   
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
                                                            </c:forEach>
                                                            <p><input type="checkbox" name="terms" id="termsforB" value="1"> I accept the <u>Terms and Conditions</u></p>

                                                            <div class="form-group col-lg-12">
                                                                <div class="k-form__actions">
                                                                    <c:if test="${reBidd==true}">
                                                                        <button type="button" class="btn btn-primary" onclick="updateEnvelopeData('B');">Submit Re-Bid</button>    


                                                                    </c:if>
                                                                    <c:if test="${submitBid=='submit'}">
                                                                        <button type="button" class="btn btn-primary" id="buttonforB" onclick="saveEnvelopeData('B');">Submit</button>
                                                                        <button type="reset" class="btn btn-secondary">Cancel</button>
                                                                    </c:if>
                                                                </div> 
                                                            </div>


                                                        </div>
                                                    </form:form>

                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="k_tabs_8_3" role="tabpanel">

                                                <div id="submittedC" class="envelope_success_messege" style="display: none;">
                                                    Envelope C is Successfully Submitted..  
                                                </div>
                                                <div id="envelope_c">   
                                                    <form:form action="" id="formforC" class="k-form" modelAttribute="envelopeCData" style="padding: 19px;"  enctype="multipart/form-data">
                                                        <input name="id" type="hidden">

                                                        <%--<form:hidden path="envelopeCFieldId" />--%>

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
                                                                <div class="form-group" id="ratePersentage" hidden="true"> 
                                                                    <label>Rate value<i  style="color:red;">*</i></label>
                                                                    <div class="input-group">
                                                                        <form:input path="encryptedBidByContractor" class="form-control" placeholder=" " id="dynamicTemplateValue2" onkeypress="return validateFloatKeyPress(this,event);" tabindex="-1" aria-describedby="basic-addon1" />
                                                                    </div>
                                                                    <span id="errormsg" class="form-text errormsg"></span>
                                                                </div> 
                                                            </c:if>


                                                            <p><input type="checkbox" name="terms" id="termsforC" value="1"> I accept the <u>Terms and Conditions</u></p>


                                                            <div class="form-group row">
                                                                <div class="col-lg-12">
                                                                    <div class="k-form__actions">
                                                                        <c:if test="${reBidd==true}">
                                                                            <button type="button" class="btn btn-primary" onclick="updateEnvelopeCData();">Submit Re-Bid</button>    


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

    <!--begin::Modal-View-template -->
    <div class="modal fade mdl-bg" id="m_select_modal_view_template" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog " role="document">
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
                        <div class="form-group">
                            <button type="button" class="btn btn-success btn-sm">Add</button>
                            <button type="button" class="btn btn-secondary btn-sm">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--end::Modal-->

    <!--begin::Modal-New-template -->
    <div class="modal fade mdl-bg" id="m_select_modal_tender_document" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document" style="max-width: 80%;">
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
                                            <div class="col-lg-4">
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
                                            <div class="col-lg-1">
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
    <!--begin::Modal-New-template -->
    <div class="modal fade mdl-bg" id="m_select_modal_view_tender_number" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document" style="max-width: 90%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">View Tenders Number</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                    <div class="modal-body">
                        <div class="k-portlet k-portlet--mobile">

                            <!--begin: Datatable -->
                            <table class="table table-striped- table-bordered table-hover table-checkable" id="k_table_1">
                                <thead>
                                    <tr>
                                        <th>Record ID</th>
                                        <th>Order ID</th>
                                        <th>Country</th>
                                        <th>Ship City</th>
                                        <th>Ship Address</th>
                                        <th>Company Agent</th>
                                        <th>Company Name</th>
                                        <th>Ship Date</th>
                                        <th>Status</th>
                                        <th>Type</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>61715-075</td>
                                        <td>China</td>
                                        <td>Tieba</td>
                                        <td>746 Pine View Junction</td>
                                        <td>Nixie Sailor</td>
                                        <td>Gleichner, Ziemann and Gutkowski</td>
                                        <td>2/12/2018</td>
                                        <td>3</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>63629-4697</td>
                                        <td>Indonesia</td>
                                        <td>Cihaur</td>
                                        <td>01652 Fulton Trail</td>
                                        <td>Emelita Giraldez</td>
                                        <td>Rosenbaum-Reichel</td>
                                        <td>8/6/2017</td>
                                        <td>6</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>68084-123</td>
                                        <td>Argentina</td>
                                        <td>Puerto Iguazú</td>
                                        <td>2 Pine View Park</td>
                                        <td>Ula Luckin</td>
                                        <td>Kulas, Cassin and Batz</td>
                                        <td>5/26/2016</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>67457-428</td>
                                        <td>Indonesia</td>
                                        <td>Talok</td>
                                        <td>3050 Buell Terrace</td>
                                        <td>Evangeline Cure</td>
                                        <td>Pfannerstill-Treutel</td>
                                        <td>7/2/2016</td>
                                        <td>1</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>31722-529</td>
                                        <td>Austria</td>
                                        <td>Sankt Andrä-Höch</td>
                                        <td>3038 Trailsway Junction</td>
                                        <td>Tierney St. Louis</td>
                                        <td>Dicki-Kling</td>
                                        <td>5/20/2017</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>64117-168</td>
                                        <td>China</td>
                                        <td>Rongkou</td>
                                        <td>023 South Way</td>
                                        <td>Gerhard Reinhard</td>
                                        <td>Gleason, Kub and Marquardt</td>
                                        <td>11/26/2016</td>
                                        <td>5</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>43857-0331</td>
                                        <td>China</td>
                                        <td>Baiguo</td>
                                        <td>56482 Fairfield Terrace</td>
                                        <td>Englebert Shelley</td>
                                        <td>Jenkins Inc</td>
                                        <td>6/28/2016</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>64980-196</td>
                                        <td>Croatia</td>
                                        <td>Vinica</td>
                                        <td>0 Elka Street</td>
                                        <td>Hazlett Kite</td>
                                        <td>Streich LLC</td>
                                        <td>8/5/2016</td>
                                        <td>6</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>9</td>
                                        <td>0404-0360</td>
                                        <td>Colombia</td>
                                        <td>San Carlos</td>
                                        <td>38099 Ilene Hill</td>
                                        <td>Freida Morby</td>
                                        <td>Haley, Schamberger and Durgan</td>
                                        <td>3/31/2017</td>
                                        <td>2</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>52125-267</td>
                                        <td>Thailand</td>
                                        <td>Maha Sarakham</td>
                                        <td>8696 Barby Pass</td>
                                        <td>Obed Helian</td>
                                        <td>Labadie, Predovic and Hammes</td>
                                        <td>1/26/2017</td>
                                        <td>1</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>11</td>
                                        <td>54092-515</td>
                                        <td>Brazil</td>
                                        <td>Canguaretama</td>
                                        <td>32461 Ridgeway Alley</td>
                                        <td>Sibyl Amy</td>
                                        <td>Treutel-Ratke</td>
                                        <td>3/8/2017</td>
                                        <td>4</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>12</td>
                                        <td>0185-0130</td>
                                        <td>China</td>
                                        <td>Jiamachi</td>
                                        <td>23 Walton Pass</td>
                                        <td>Norri Foldes</td>
                                        <td>Strosin, Nitzsche and Wisozk</td>
                                        <td>4/2/2017</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>13</td>
                                        <td>21130-678</td>
                                        <td>China</td>
                                        <td>Qiaole</td>
                                        <td>328 Glendale Hill</td>
                                        <td>Myrna Orhtmann</td>
                                        <td>Miller-Schiller</td>
                                        <td>6/7/2016</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>14</td>
                                        <td>40076-953</td>
                                        <td>Portugal</td>
                                        <td>Burgau</td>
                                        <td>52550 Crownhardt Court</td>
                                        <td>Sioux Kneath</td>
                                        <td>Rice, Cole and Spinka</td>
                                        <td>10/11/2017</td>
                                        <td>4</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>15</td>
                                        <td>36987-3005</td>
                                        <td>Portugal</td>
                                        <td>Bacelo</td>
                                        <td>548 Morrow Terrace</td>
                                        <td>Christa Jacmar</td>
                                        <td>Brakus-Hansen</td>
                                        <td>8/17/2017</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>16</td>
                                        <td>67510-0062</td>
                                        <td>South Africa</td>
                                        <td>Pongola</td>
                                        <td>02534 Hauk Trail</td>
                                        <td>Shandee Goracci</td>
                                        <td>Bergnaum, Thiel and Schuppe</td>
                                        <td>7/24/2016</td>
                                        <td>5</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>17</td>
                                        <td>36987-2542</td>
                                        <td>Russia</td>
                                        <td>Novokizhinginsk</td>
                                        <td>19427 Sloan Road</td>
                                        <td>Jerrome Colvie</td>
                                        <td>Kreiger, Glover and Connelly</td>
                                        <td>3/4/2016</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>18</td>
                                        <td>11673-479</td>
                                        <td>Brazil</td>
                                        <td>Conceição das Alagoas</td>
                                        <td>191 Stone Corner Road</td>
                                        <td>Michaelina Plenderleith</td>
                                        <td>Legros-Gleichner</td>
                                        <td>2/21/2018</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>19</td>
                                        <td>47781-264</td>
                                        <td>Ukraine</td>
                                        <td>Yasinya</td>
                                        <td>1481 Sauthoff Place</td>
                                        <td>Lombard Luthwood</td>
                                        <td>Haag LLC</td>
                                        <td>1/21/2016</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>20</td>
                                        <td>42291-712</td>
                                        <td>Indonesia</td>
                                        <td>Kembang</td>
                                        <td>9029 Blackbird Point</td>
                                        <td>Leonora Chevin</td>
                                        <td>Mann LLC</td>
                                        <td>9/6/2017</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>21</td>
                                        <td>64679-154</td>
                                        <td>Mongolia</td>
                                        <td>Sharga</td>
                                        <td>102 Holmberg Park</td>
                                        <td>Tannie Seakes</td>
                                        <td>Blanda Group</td>
                                        <td>7/31/2016</td>
                                        <td>6</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>22</td>
                                        <td>49348-055</td>
                                        <td>China</td>
                                        <td>Guxi</td>
                                        <td>45 Butterfield Street</td>
                                        <td>Yardley Wetherell</td>
                                        <td>Gerlach-Schultz</td>
                                        <td>4/3/2017</td>
                                        <td>2</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>23</td>
                                        <td>47593-438</td>
                                        <td>Portugal</td>
                                        <td>Viso</td>
                                        <td>97 Larry Center</td>
                                        <td>Bryn Peascod</td>
                                        <td>Larkin and Sons</td>
                                        <td>5/22/2016</td>
                                        <td>6</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>24</td>
                                        <td>54569-0175</td>
                                        <td>Japan</td>
                                        <td>Minato</td>
                                        <td>077 Hoffman Center</td>
                                        <td>Chrissie Jeromson</td>
                                        <td>Brakus-McCullough</td>
                                        <td>11/26/2017</td>
                                        <td>2</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>25</td>
                                        <td>0093-1016</td>
                                        <td>Indonesia</td>
                                        <td>Merdeka</td>
                                        <td>3150 Cherokee Center</td>
                                        <td>Gusti Clamp</td>
                                        <td>Stokes Group</td>
                                        <td>4/12/2018</td>
                                        <td>6</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>26</td>
                                        <td>0093-5142</td>
                                        <td>China</td>
                                        <td>Jianggao</td>
                                        <td>289 Badeau Alley</td>
                                        <td>Otis Jobbins</td>
                                        <td>Ruecker, Leffler and Abshire</td>
                                        <td>3/6/2018</td>
                                        <td>4</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>27</td>
                                        <td>51523-026</td>
                                        <td>Germany</td>
                                        <td>Erfurt</td>
                                        <td>132 Chive Way</td>
                                        <td>Lonnie Haycox</td>
                                        <td>Feest Group</td>
                                        <td>4/24/2018</td>
                                        <td>1</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>28</td>
                                        <td>49035-522</td>
                                        <td>Australia</td>
                                        <td>Eastern Suburbs Mc</td>
                                        <td>074 Algoma Drive</td>
                                        <td>Heddi Castelli</td>
                                        <td>Kessler and Sons</td>
                                        <td>1/12/2017</td>
                                        <td>5</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>29</td>
                                        <td>58411-198</td>
                                        <td>Ethiopia</td>
                                        <td>Kombolcha</td>
                                        <td>91066 Amoth Court</td>
                                        <td>Tuck O'Dowgaine</td>
                                        <td>Simonis, Rowe and Davis</td>
                                        <td>5/6/2017</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>30</td>
                                        <td>27495-006</td>
                                        <td>Portugal</td>
                                        <td>Arrifes</td>
                                        <td>3 Fairfield Junction</td>
                                        <td>Vernon Cosham</td>
                                        <td>Kreiger-Nicolas</td>
                                        <td>2/8/2017</td>
                                        <td>4</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>31</td>
                                        <td>55154-8284</td>
                                        <td>Philippines</td>
                                        <td>Talisay</td>
                                        <td>09 Sachtjen Junction</td>
                                        <td>Bryna MacCracken</td>
                                        <td>Hyatt-Witting</td>
                                        <td>7/22/2017</td>
                                        <td>2</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>32</td>
                                        <td>62678-207</td>
                                        <td>Libya</td>
                                        <td>Zuwārah</td>
                                        <td>82 Thackeray Pass</td>
                                        <td>Freda Arnall</td>
                                        <td>Dicki, Morar and Stiedemann</td>
                                        <td>7/22/2016</td>
                                        <td>3</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>33</td>
                                        <td>68428-725</td>
                                        <td>China</td>
                                        <td>Zhangcun</td>
                                        <td>3 Goodland Terrace</td>
                                        <td>Pavel Kringe</td>
                                        <td>Goldner-Lehner</td>
                                        <td>4/2/2017</td>
                                        <td>4</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>34</td>
                                        <td>0363-0724</td>
                                        <td>Morocco</td>
                                        <td>Temara</td>
                                        <td>9550 Weeping Birch Crossing</td>
                                        <td>Felix Nazaret</td>
                                        <td>Waters, Quigley and Keeling</td>
                                        <td>6/4/2016</td>
                                        <td>5</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>35</td>
                                        <td>37000-102</td>
                                        <td>Paraguay</td>
                                        <td>Los Cedrales</td>
                                        <td>1 Ridge Oak Way</td>
                                        <td>Penrod Allanby</td>
                                        <td>Rodriguez Group</td>
                                        <td>3/5/2018</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>36</td>
                                        <td>55289-002</td>
                                        <td>Philippines</td>
                                        <td>Dologon</td>
                                        <td>9 Vidon Terrace</td>
                                        <td>Hubey Passby</td>
                                        <td>Lemke-Hermiston</td>
                                        <td>6/29/2017</td>
                                        <td>2</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>37</td>
                                        <td>15127-874</td>
                                        <td>Tanzania</td>
                                        <td>Nanganga</td>
                                        <td>33 Anniversary Parkway</td>
                                        <td>Magdaia Rotlauf</td>
                                        <td>Hettinger, Medhurst and Heaney</td>
                                        <td>2/18/2018</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>38</td>
                                        <td>49349-123</td>
                                        <td>Indonesia</td>
                                        <td>Pule</td>
                                        <td>77292 Bonner Plaza</td>
                                        <td>Alfonse Lawrance</td>
                                        <td>Schuppe-Harber</td>
                                        <td>4/14/2017</td>
                                        <td>1</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>39</td>
                                        <td>17089-415</td>
                                        <td>Palestinian Territory</td>
                                        <td>Za‘tarah</td>
                                        <td>42806 Ridgeview Terrace</td>
                                        <td>Kessiah Chettoe</td>
                                        <td>Mraz LLC</td>
                                        <td>3/4/2017</td>
                                        <td>5</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>40</td>
                                        <td>51327-510</td>
                                        <td>Philippines</td>
                                        <td>Esperanza</td>
                                        <td>4 Linden Court</td>
                                        <td>Natka Fairbanks</td>
                                        <td>Mueller-Greenholt</td>
                                        <td>6/21/2017</td>
                                        <td>3</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>41</td>
                                        <td>0187-2201</td>
                                        <td>Brazil</td>
                                        <td>Rio das Ostras</td>
                                        <td>5722 Buhler Place</td>
                                        <td>Shaw Puvia</td>
                                        <td>Veum LLC</td>
                                        <td>6/10/2017</td>
                                        <td>3</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>42</td>
                                        <td>16590-890</td>
                                        <td>Indonesia</td>
                                        <td>Krajan Gajahmati</td>
                                        <td>54 Corry Street</td>
                                        <td>Alden Dingate</td>
                                        <td>Heidenreich Inc</td>
                                        <td>10/27/2016</td>
                                        <td>5</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>43</td>
                                        <td>75862-001</td>
                                        <td>Indonesia</td>
                                        <td>Pineleng</td>
                                        <td>4 Messerschmidt Point</td>
                                        <td>Cherish Peplay</td>
                                        <td>McCullough-Gibson</td>
                                        <td>11/23/2017</td>
                                        <td>2</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>44</td>
                                        <td>24559-091</td>
                                        <td>Philippines</td>
                                        <td>Amuñgan</td>
                                        <td>5470 Forest Parkway</td>
                                        <td>Nedi Swetman</td>
                                        <td>Gerhold Inc</td>
                                        <td>3/23/2017</td>
                                        <td>5</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>45</td>
                                        <td>0007-3230</td>
                                        <td>Russia</td>
                                        <td>Bilyarsk</td>
                                        <td>5899 Basil Place</td>
                                        <td>Ashley Blick</td>
                                        <td>Cummings-Goodwin</td>
                                        <td>10/1/2016</td>
                                        <td>4</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>46</td>
                                        <td>50184-1029</td>
                                        <td>Peru</td>
                                        <td>Chocope</td>
                                        <td>65560 Daystar Center</td>
                                        <td>Saunders Harmant</td>
                                        <td>O'Kon-Wiegand</td>
                                        <td>11/7/2017</td>
                                        <td>3</td>
                                        <td>2</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>47</td>
                                        <td>10819-6003</td>
                                        <td>France</td>
                                        <td>Rivesaltes</td>
                                        <td>4981 Springs Center</td>
                                        <td>Mellisa Laurencot</td>
                                        <td>Jacobs Group</td>
                                        <td>10/30/2017</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>48</td>
                                        <td>62750-003</td>
                                        <td>Mongolia</td>
                                        <td>Jargalant</td>
                                        <td>94 Rutledge Way</td>
                                        <td>Orland Myderscough</td>
                                        <td>Gutkowski Inc</td>
                                        <td>11/2/2016</td>
                                        <td>5</td>
                                        <td>3</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>49</td>
                                        <td>68647-122</td>
                                        <td>Philippines</td>
                                        <td>Cardona</td>
                                        <td>4765 Service Hill</td>
                                        <td>Devi Iglesias</td>
                                        <td>Ullrich-Dibbert</td>
                                        <td>7/21/2016</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                    <tr>
                                        <td>50</td>
                                        <td>36987-3093</td>
                                        <td>China</td>
                                        <td>Jiantou</td>
                                        <td>373 Northwestern Plaza</td>
                                        <td>Bliss Tummasutti</td>
                                        <td>Legros-Cummings</td>
                                        <td>11/27/2017</td>
                                        <td>5</td>
                                        <td>1</td>
                                        <td nowrap></td>
                                    </tr>
                                </tbody>
                            </table>

                            <!--end: Datatable -->

                        </div>

                    </div>
                </div>
                <!--Start::Modal::Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                </div>
                <!--end::Modal::Footer-->
            </div>
        </div>
    </div>

    <!--end::Modal-->

    <!-- Inventory Modal to add item-->

    <!--end::Modal-->
    <!--begin::Modal-New-template -->
    <div class="modal fade mdl-bg" id="add_Items" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document" style="max-width: 85%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Items</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                    <div class="modal-body">
                        <form class="k-form">
                            <div class="form-group row">

                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <label>Select Category :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="-1"> Select </option>
                                                <option value="1">computer</option>
                                                <option value="2">Furnature</option>
                                                <option value="3">Vehicle</option>
                                            </select>
                                            <span class="form-text text-muted">Please enter your nit number</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="space_btn_height"></label>
                                            <div class=" ">
                                                <button type="button" class="btn btn-accent btn-sm" data-toggle="modal" data-target="#add_category"><i class="fa fa-plus-circle"></i>Add Category</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <label class="">Select Sub Category :</label>
                                            <select class="form-control" id="exampleSelect1">
                                                <option value="-1"> Select </option>
                                                <option value="1">Mouse</option>
                                                <option value="2">Keyboard</option>
                                                <option value="3">Desktop</option>
                                            </select>
                                            <span class="form-text text-muted">Please select nit date</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="space_btn_height"></label>
                                            <div class=" ">
                                                <button type="button" class="btn btn-accent btn-sm" data-toggle="modal" data-target="#add_Subcategory"><i class="fa fa-plus-circle"></i>Add Sub Category</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="documentts">
                                <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                                <div class="k-repeater">
                                    <div class="k-repeater__data-set">
                                        <div data-repeater-list="demo3-list2">
                                            <div data-repeater-item="" class="k-repeater__item">
                                                <div class="form-group row">
                                                    <div class="col-lg-4">
                                                        <label>Label Name :</label>
                                                        <input type="email" class="form-control" placeholder="Enter NIT number">
                                                        <span class="form-text text-muted">Please enter your nit number</span>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <label>Label Type :</label>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" id="customFile2">
                                                            <label class="custom-file-label selected" for="customFile"> </label>
                                                        </div>
                                                        <span class="form-text text-muted">Please enter your nit number</span>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <label>Document Link </label>
                                                        <div><a href="#" target="_blank" class="k-link">info@osmoindia.com</a></div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label>Action</label>
                                                        <div class="k-repeater__close k-repeater__data form-group">
                                                            <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                                <i class="la la-close"></i> Remove
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="k-repeater__add-data form-group">
                                        <span data-repeater-create="" class="btn btn-info btn-sm">
                                            <i class="la la-plus"></i> Add More
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label>Brief Description :</label>
                                    <textarea class="form-control" id="k_autosize_1" rows="3"></textarea>
                                    <span class="form-text text-muted">Please enter your nit number</span>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="">Reverse Price (In fig):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>
                                <div class="col-lg-9">
                                    <label class="">Reverse Price (In Word):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>

                            </div>

                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="">Auction Start Value (In fig):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>
                                <div class="col-lg-9">
                                    <label class="">Auction Start Value (In Word):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>

                            </div>

                            <div class="documentts">
                                <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                                <div class="k-repeater">
                                    <div class="k-repeater__data-set">
                                        <div data-repeater-list="demo3-list2">
                                            <div data-repeater-item="" class="k-repeater__item">
                                                <div class="form-group row">
                                                    <div class="col-lg-4">
                                                        <label>S.No.</label>
                                                        <input type="email" class="form-control" placeholder="Enter NIT number">
                                                        <span class="form-text text-muted">Please enter your nit number</span>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <label>Property Name</label>
                                                        <div class="dropzone dropzone-primary dz-clickable" action="inc/api/dropzone/upload.php" id="k-dropzone-one" style="min-height: auto;padding:0;   border: 1px solid #dedede;">
                                                            <div class="dropzone-msg dz-message needsclick" style="margin:2px 0;">
                                                                <span class=" btn btn-sm">Upload Document</span>
                                                            </div>
                                                        </div>
                                                        <span class="form-text text-muted">Please enter your nit number</span>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <label>Property Description</label>
                                                        <div><a href="#" target="_blank" class="k-link">info@osmoindia.com</a></div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label>Action</label>
                                                        <div class="k-repeater__close k-repeater__data form-group">
                                                            <button class="btn btn-elevate-hover btn-sm  btn-font-danger" style="padding: 0.45rem 0rem;">
                                                                <i class="la la-close"></i> Remove
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="k-repeater__add-data form-group">
                                        <span data-repeater-create="" class="btn btn-success btn-sm">
                                            <i class="la la-plus"></i> Add More Property
                                        </span> <span class="text-danger">Please Upload the .PDF  format only at the time of document upload.</span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--Start::Modal::Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                </div>
                <!--end::Modal::Footer-->
            </div>
        </div>
    </div>

    <!--end::Modal-->
    <!--begin::Modal-New-template -->
    <div class="modal fade mdl-bg" id="add_From_Inventory" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document" style="max-width: 75%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Inventory Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_length" id="k_table_1_length">
                                    <label>Show
                                        <select name="k_table_1_length" aria-controls="k_table_1" class="custom-select custom-select-sm form-control form-control-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select> entries</label>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-6">
                                <div id="k_table_1_filter" class="dataTables_filter">
                                    <label>Search:
                                        <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="k_table_1">
                                    </label>
                                </div>
                            </div>
                            <!-- <div class="col-sm-12 col-md-3 order-1 order-xl-2 k-align-right"> -->
                            <!-- <label>	<a href="#" class="btn btn-accent btn-sm"> -->
                            <!-- <i class="la la-plus"></i> Add Items -->
                            <!-- </a> -->
                            <!-- <div class="k-separator k-separator--border-dashed k-separator--space-lg d-xl-none"></div> -->
                            <!-- </label> -->
                            <!-- </div> -->
                        </div>
                        <!--begin: Datatable -->
                        <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1">
                            <thead>
                                <tr>
                                    <th>Select</th>
                                    <th>Inventory Number</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Details</th>
                                    <th>Quantity</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>1</td>
                                    <td>61715-075</td>
                                    <td>China</td>
                                    <td>Tieba</td>
                                    <td>746 Pine View Junction</td>
                                    <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>

                                </tr>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>2</td>
                                    <td>63629-4697</td>
                                    <td>Indonesia</td>
                                    <td>Cihaur</td>
                                    <td>01652 Fulton Trail</td>
                                    <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>

                                </tr>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>3</td>
                                    <td>68084-123</td>
                                    <td>Argentina</td>
                                    <td>Puerto Iguazú</td>
                                    <td>2 Pine View Park</td>
                                    <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>

                                </tr>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>4</td>
                                    <td>67457-428</td>
                                    <td>Indonesia</td>
                                    <td>Talok</td>
                                    <td>3050 Buell Terrace</td>
                                    <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>

                                </tr>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>25</td>
                                    <td>0093-1016</td>
                                    <td>Indonesia</td>
                                    <td>Merdeka</td>
                                    <td>3150 Cherokee Center</td>
                                    <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>

                                </tr>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>26</td>
                                    <td>0093-5142</td>
                                    <td>China</td>
                                    <td>Jianggao</td>
                                    <td>289 Badeau Alley</td>
                                    <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="k-radio k-radio--bold k-radio--success">
                                            <input type="radio" name="radio6">
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>50</td>
                                    <td>36987-3093</td>
                                    <td>China</td>
                                    <td>Jiantou</td>
                                    <td>373 Northwestern Plaza</td>
                                    <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                </tr>
                            </tbody>
                        </table>

                        <!--end: Datatable -->
                        <div class="row">
                            <div class="col-sm-12 col-md-5">
                                <div class="dataTables_info" id="k_table_1_info" role="status" aria-live="polite">Showing 1 to 25 of 50 entries</div>
                            </div>
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="k_table_1_paginate">
                                    <ul class="pagination">
                                        <li class="paginate_button page-item previous disabled" id="k_table_1_previous"><a href="#" aria-controls="k_table_1" data-dt-idx="0" tabindex="0" class="page-link"><i class="la la-angle-left"></i></a></li>
                                        <li class="paginate_button page-item active"><a href="#" aria-controls="k_table_1" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                        <li class="paginate_button page-item "><a href="#" aria-controls="k_table_1" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                                        <li class="paginate_button page-item next" id="k_table_1_next"><a href="#" aria-controls="k_table_1" data-dt-idx="3" tabindex="0" class="page-link"><i class="la la-angle-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--Start::Modal::Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#add_Items_From_Inventory">Add Items</button>
                </div>
                <!--end::Modal::Footer-->
            </div>
        </div>
    </div>

    <!--end::Modal-->

    <!--begin::Modal-New-template -->
    <div class="modal fade mdl-bg" id="add_Items_From_Inventory" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document" style="max-width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Inventory Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                    <div class="modal-body">
                        <form class="k-form">
                            <div class="form-group row">
                                <div class="col-lg-6">
                                    <label>Select Category :</label>
                                    <select class="form-control" id="exampleSelect1">
                                        <option value="-1"> Select </option>
                                        <option value="1">computer</option>
                                        <option value="2">Furnature</option>
                                        <option value="3">Vehicle</option>
                                    </select>
                                    <span class="form-text text-muted">Please enter your nit number</span>
                                </div>
                                <div class="col-lg-6">
                                    <label class="">Select Sub Category :</label>
                                    <select class="form-control" id="exampleSelect1">
                                        <option value="-1"> Select </option>
                                        <option value="1">Mouse</option>
                                        <option value="2">Keyboard</option>
                                        <option value="3">Desktop</option>
                                    </select>
                                    <span class="form-text text-muted">Please select nit date</span>
                                </div>

                            </div>
                            <div class=" k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                <!--begin: Datatable -->
                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1">
                                    <thead>
                                        <tr>
                                            <th><b>Item Document Name</b></th>
                                            <th><b>Select File</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Auction Document</td>
                                            <td>Hydrangeas313256.jpg</td>
                                        </tr>
                                        <tr>
                                            <td>Auction Document</td>
                                            <td>Hydrangeas313256.jpg</td>
                                        </tr>
                                        <tr>
                                            <td>Auction Document</td>
                                            <td>Hydrangeas313256.jpg</td>
                                        </tr>
                                        <tr>
                                            <td>Auction Document</td>
                                            <td>Hydrangeas313256.jpg</td>
                                        </tr>
                                        <tr>
                                            <td>Auction Document</td>
                                            <td>Hydrangeas313256.jpg</td>
                                        </tr>
                                        <tr>
                                            <td>Auction Document</td>
                                            <td>Hydrangeas313256.jpg</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--end: Datatable -->
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label>Brief Description :</label>
                                    <textarea class="form-control" id="k_autosize_1" rows="3"></textarea>
                                    <span class="form-text text-muted">Please enter your nit number</span>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="">Reverse Price (In fig):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>
                                <div class="col-lg-9">
                                    <label class="">Reverse Price (In Word):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>

                            </div>

                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="">Auction Start Value (In fig):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>
                                <div class="col-lg-9">
                                    <label class="">Auction Start Value (In Word):</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div>
                                        <input type="text" class="form-control" placeholder=" " aria-describedby="basic-addon1">
                                    </div>
                                    <span class="form-text text-muted">Please enter your postcode</span>
                                </div>

                            </div>

                        </form>

                    </div>
                    <!--Start::Modal::Footer-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success btn-sm">Save Inventory</button>
                </div>
                <!--end::Modal::Footer-->
            </div>
        </div>
    </div>
    <!--end::Modal-->

    <!--begin::Modal-->
    <div class="modal fade mdl-bg" id="add_category" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form class="k-form">
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
                            <button type="button" class="btn btn-info btn-sm">Add</button>
                            <button type="button" class="btn btn-success btn-sm">Reset</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <!--end::Modal-->

    <!-- Small Modal -->
    <div class="modal fade bd-example-modal-sm mdl-bg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                    <div class="form-group">
                        <div class="input-group pull-right" id="k_daterangepicker_58">
                            <input type="text" class="form-control" readonly="" placeholder="Select date &amp; time range">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                            </div>
                        </div>
                    </div>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-sm">Submit</button>
                </div>
            </div>
        </div>
    </div>

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
    <div class="modal mdl-bg fade uplodeFolderFile" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Insert files using Google Drive</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pd-tp pd-bt">
                    <div class="k-portlet k-portlet--tabs" style="margin-bottom:0;">
                        <div class="k-portlet__head paddingboth">
                            <div class="k-portlet__head-toolbar">
                                <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-primary" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_1_1_tab_content" role="tab" aria-selected="false">
                                            <i class="la la-desktop"></i> My Computer
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active show" data-toggle="tab" href="#k_portlet_base_demo_1_2_tab_content" role="tab" aria-selected="true">
                                            <i class="la la-cloud-upload"></i> Cloud Folder
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="225" data-mobile-height="225" style="height: 225px; overflow: hidden;">
                            <div class="tab-content">
                                <div class="tab-pane" id="k_portlet_base_demo_1_1_tab_content" role="tabpanel">

                                    <div class="widthUploadBt">
                                        <div></div>
                                        <div class="custom-file input_upload">
                                            <input type="file" class="custom-file-input" id="customFile">
                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane active show" id="k_portlet_base_demo_1_2_tab_content" role="tabpanel">
                                    2
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm  btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-sm btn-primary">Upload</button>
                </div>
            </div>
        </div>
    </div>

    <!---End-Modal-Tab-Upload-Documents--->
    <!--begin::Modal-->
    <div class="modal fade mdl-bg" id="add_Subcategory" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Create Sub Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form class="k-form">
                    <div class="modal-body">
                        <div class="form-group row k-margin-t-20">
                            <label class="col-form-label col-lg-3 col-sm-12">Item Category</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <select class="form-control" id="exampleSelect1">
                                    <option value="">Select</option>

                                    <option value="1">Computer</option>

                                    <option value="2">Furnature</option>

                                    <option value="3">Vehicle</option>
                                </select>
                                <span class="form-text text-muted">Select boxes with optgroups</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Sub Division Name</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="email" class="form-control" placeholder=" ">
                                <span class="form-text text-muted">Select boxes with optgroups</span>
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

    <!-- begin::Global Config -->
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
                //   alert("test "+text);
            var check_validation = templateValidation(text);
            if (check_validation === 0) {
                var check_validation1 = checkTermsConditions(text);
                if (check_validation1 === true) {

                    var files = new Array();
                    var form = new FormData();
                    var other_data = $('#fformfor' + text).serializeArray();
                    $.each(other_data, function (key, input) {
                    //   alert(this.name+" : "+this.value);
                        form.append(this.name, this.value);
                    });
                    $("#fformfor" + text + " input[type=file]").each(function (index) {
                    //   alert("index "+index);
                        var envelopefileId = this.id;
                     //   alert(envelopefileId);
                        var fileIndex =$("#name"+envelopefileId).val();
                    //  alert("envelopefileId "+fileIndex);
                        files = document.getElementById(envelopefileId).files[0];
//                        form.append("files[" + index + "]", files);
                        form.append("datalist["+fileIndex+"].files", files);
                         });

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
                $("#fformfor" + text +" input[type=file]").each(function (index) {
                     //alert("index "+this.value);
                        var envelopefileId = this.id;
                        var envelopefileValue= this.value;
                        var fileIndex =$("#name"+envelopefileId).val();
//                        alert("envelopefileId "+this.id+" envelopefileValue "+this.value+" fileName "+fileName);
                       if(envelopefileValue===null||envelopefileValue===""){
                              var fileName =$("#fileFlag"+envelopefileId).val(); 
                    //       alert("file is not changed & file Name is "+fileName); 
                        form.append("datalist["+fileIndex+"].fileFlag", fileName);  
                      }else{
                         files = document.getElementById(envelopefileId).files[0];
                 //        alert("file is changed & file Name is "+files.name);
//                         form.append("datalist["+fileIndex+"].fileFlag", ""); 
                         form.append("datalist["+fileIndex+"].files", files); 
                      }
                     });
                  $.ajax({
                    url: "updateEnvelope"+text,
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
//             alert("check_validation "+check_validation);
            if (check_validation === 0) {
                var form = new FormData();
                var formData = $('#formforC').serializeArray();
                $.each(formData, function (key, input) {
//        alert(this.name+" : "+this.value);
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
                        if (response == "Envelope C Submitted") {

                            $('#envelope_c').hide();
                            $('#submittedC').show();
                        }
                    },
                    error: function (e) {
                        alert('Error: ' + e);
                        document.getElementById('wait').style.display = 'none';
                    }
                });
            }
        }

     function updateEnvelopeCData() {
         //   alert("update Envelope C ");
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
             //       alert("response " + response);
                },
                error: function (e) {
                    alert('Error: ' + e);
                    document.getElementById('wait').style.display = 'none';
                }
            });
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
                $("#ratePersentage").hide()();

            }

        }
        
        function bidWithDraw(){
          var status=  confirm("Do You really Want to BidWithDraw ?");
            
            
           if(status == true){
          
            $.ajax({
                url: "verifyMob",
                success: function (response) {
            //      alert("response "+response);  
                  
                  $("#generatedotp11").val(response);
//                  $("otpFor").val("bidWithdraw");
                  $("#otpModal").click();
                  },
                error: function () {
                    console.log('Upload error');
                }
            });
                  return true;  
           }else{
               return false;
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
        
   
        
    </script>
    <script>


//window.onload=checkBidWithDraw(){
function bodyLoad(){
    
     var bidWithDrawnByContractor=<c:out value="${bidWithDrawnByContractor}"/>;
  //   alert("bidWithDrawnByContractor "+bidWithDrawnByContractor);
     if(bidWithDrawnByContractor===true){
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
//                    alert("emdCopyFile has changed in save::: " + emdCopyFile);
                formdata.append("emdCopyFile", emdCopyFile);
            } else if (!(typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink !== null || emdlink !== ''))
            {
    //                right
//                     alert("file has changed in updation");
                formdata.append("emdCopyFile", emdCopyFile);
            } else if ((typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink !== null || emdlink !== ''))
            {
    //                right
    //                formdata.append("emdCopyFile" ,emdCopyFile);
//                    alert("file has not changed in updation");
            } else if ((typeof emdCopyFile === "undefined" || emdCopyFile === '') && (emdlink === null || emdlink === ''))
            {
    //                formdata.append("emdCopyFile" ,emdCopyFile);
//                    alert("file is not selected in save");
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

            function  percentageRate(id) {
           //     alert(id);
            if (id == '1' || id == '3') {
                $('#ratePersentage').removeAttr('hidden');
            } else {
                $('#ratePersentage').hide();
            }
        }
     
   
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
		
		function validateFloatKeyPress(el, evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    var number = el.value.split('.');
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    //just one dot
    if(number.length>1 && charCode == 46){
         return false;
    }
    //get the carat position
    var caratPos = getSelectionStart(el);
    var dotPos = el.value.indexOf(".");
    if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){
        return false;
    }
    return true;
}

    </script>
    <script>
        function saveEmdFile(name)
        {
      //    alert("in saveEmdFile"+name); 
          var file= document.getElementById('emdCopy').files[0].name;
       //   alert("file:::"+file);
          $("#emdSpan").html(file);
          
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <%@include file="BidWithDrawForm.jsp"%>            
</body>
<!-- Angular script -->
    <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
       <script src="<c:url value="/resources/angular/DepartmentUserController.js" />"></script>
<!-- end::Body -->
</html> 