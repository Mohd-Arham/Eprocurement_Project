<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" ng-app="myApp">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Procurelinc e-Procurement | Home</title>

        <!-- Favicon lotus procure -->
<!--        <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
        <!--begin:: Global Mandatory Vendors -->
        <link href="<c:url value="/resources/vendors/perfect-scrollbar/css/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css" />
        <!--begin:: Global Optional Vendors -->
        <link href="<c:url value="/resources/vendors/tether/dist/css/tether.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/bootstrap-select/dist/css/bootstrap-select.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/nouislider/distribute/nouislider.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/owl.carousel/dist/assets/owl.carousel.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/owl.carousel/dist/assets/owl.theme.default.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/sweetalert2/dist/sweetalert2.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/socicon/css/socicon.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/vendors/line-awesome/css/line-awesome.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/vendors/flaticon/css/flaticon.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/vendors/vendors/fontawesome5/css/all.min.css"/>" rel="stylesheet" type="text/css" />
        <!-- Angular script -->
        <script src="<c:url value="/resources/assets/app/angular.min.js"/>"></script>
        <script src="<c:url value="/resources/angular/ContractorController.js" />" type="text/javascript"></script>
        <!--end:: Global Optional Vendors -->

        <!--begin::Global Theme Styles -->
        <link href="<c:url value="/resources/assets/demo/base/style.bundle.css"/>" rel="stylesheet" type="text/css" />

        <link href="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.css"/>" rel="stylesheet" type="text/css" />

        <!-- coustom_style_css -->
        <link href="<c:url value="/resources/assets/mystylehomepage.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.css"/>" rel="stylesheet" type="text/css" />

    </head>
    <style>
        .validateField {
            color: red;
            font-size: 13px;
        }
        span.staric {
            font-size: 19px;
            color: red;
            font-weight: normal;
        }
    </style>
    <script>
        addDeptAdmin = function () {
        console.log("calling");
        var formData = $("#dAdminRagister").serialize();
        // Now you have all the form values as a query string format
        // console.log(formData+"");

        // Rest of your code...
        $.post("saveDepartment", formData, function(response) {
        console.log("Enter in Api call");
        // Handle the response from the server
        console.log(response);
        });
        // Alternatively, you can convert the serialized data into an object for easier manipulation
        var formObject = {};
        $.each($("#dAdminRagister").serializeArray(), function(_, kv) {
        formObject[kv.name] = kv.value;
        });
        console.log(formObject);
        };
    </script>
    <body onLoad="Captcha(); DrawCaptcha(); openModal(); forgotPasswordCaptcha();"  ng-controller="myCtrl" class="k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed1 k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled  aos-all" id="transcroller-body" >
        <!-- begin:: Header Mobile -->  
        <jsp:include page="Header.jsp"></jsp:include>
            <!-- HEADER CONTENT END HERE HOME PAGES -->

            <!-- BODY CONTENT START HERE HOME PAGES -->

            <div class="k-grid k-grid--hor k-grid--root">
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--ver k-page">

                    <!-- end:: Aside -->
                    <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor">
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">
                            <section class="slider_lotus">
                                <div id="demo1" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <div class="overley"></div>
                                            <img src="<c:url value="/resources/assets/slider/la.jpg"/>" alt="Los Angeles" width="1100" height="500">
                                        <div class="carousel-caption">
                                            <h3>New India Building is focused on <br>long-term cooperation with stable result.</h3>
                                            <p>Help in the new journey of developing India.</p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="overley"></div>
                                        <img src="<c:url value="/resources/assets/slider/chicago.jpg"/>" alt="Chicago" width="1100" height="500">
                                        <div class="carousel-caption">
                                            <h3>New India Building is focused on <br>long-term cooperation with stable result.</h3>
                                            <p>Help in the new journey of developing India.</p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="overley"></div>
                                        <img src="<c:url value="/resources/assets/slider/ny.jpg"/>" alt="New York" width="1100" height="500">
                                        <div class="carousel-caption">
                                            <h3>New India Building is focused on <br>long-term cooperation with stable result.</h3>
                                            <p>Help in the new journey of developing India.</p>
                                        </div>
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#demo1" data-slide="prev">
                                    <span class="carousel-control-prev-icon fa fa-angle-left"></span>
                                </a>
                                <a class="carousel-control-next" href="#demo1" data-slide="next">
                                    <span class="carousel-control-next-icon fa fa-angle-right"></span>
                                </a>
                            </div>
                        </section>
                        <!-- SLIDER SECTION END -->
                        <div class="k-portlet mb-0" id="k_portlet">
                            <div class="k-container">
                                <div class="bidder_template tenderSearch_div" id="block1111">
                                    <div class="nav nav-pills nav-tabs-btn nav-pills-btn-secondary">
                                        <div class="nav-item">
                                            <div class="nav-link bg_search pd_bt">
                                                <span class="nav-link-icon"><i class="flaticon-open-box"></i></span>
                                                <h3><span class="nav-link-title">Live Tenders / Auction</span></h3>
                                                <p class="text-muted height_same mrginbt">Looking at our live tenders is so easy & fast,Just a click away. Click Now</p>

                                                <div class="btn_custom"><a href="searchTender" class="btn btn-secondary btn-sm btn_custom1" target="_blank">View All</a></div>
                                            </div>
                                        </div>
                                        <div class="nav-item">
                                            <div class="nav-link bg-serchtd input_bt padding-bottom">
                                                <span class="nav-link-icon text-white"><i class="flaticon-user-add"></i></span>
                                                <h3><span class="nav-link-title text-white">Department Registration</span></h3>
                                                <p class="text-white margin_bottom1 height_same">Register your (Government / Semi-Government / PSU) department and perform your procurement related tasks at <strong>No-Cost.</strong></p> 
                                                <div class="btn_custom"><a href="viewtender.html" class="btn btn-secondary btn-sm btn_custom2" data-toggle="modal" data-target="#searchtenderModal">Department Registration</a></div>
                                            </div>
                                        </div>
                                        <div class="nav-item">
                                            <div class="nav-link bg-dark dropdown_bt">
                                                <span class="nav-link-icon"><i class="flaticon-user-ok text-white"></i></span>
                                                <h3> <span class="nav-link-title text-white">Departments</span></h3>
                                                <p class="text-white height_same">Select a particular department from here. </p> 

                                                <div class="form-group">

                                                    <select id="exampleSelect1" name="deptName" class="form-control">
                                                        <option value="-1">select</option>
                                                        <c:forEach var="DepartmentList" items="${DepartmentList}">
                                                            <option value="${DepartmentList.deptId}">${DepartmentList.deptName}</option>
                                                        </c:forEach>
                                                    </select>                                                    
                                                </div>
                                                <div class="btn_custom"><a href="#" class="btn btn-secondary btn-sm btn_custom3">Visit Site</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- BEGIN:: LOGIN BUTTON AND REGISTRATION BUTTON -->
                                    <div class="login_register_main text-center">
                                        <div class="login_register">
                                            <a href="#" class="btn btn-elevate btn-bold btn-upper" data-toggle="modal" data-target="#contaractorRegistrationForm">Bidder Registration</a>
                                            <a href="#" class="btn btn-elevate btn-bold btn-upper btn-warning text-white bgclr_bt " data-toggle="modal" data-target="#cont_login_page">User Login</a>
                                            <button type="button"  data-toggle="modal" data-target="#change_passwords" id="newPassword"  hidden="true">Change Password</button>
                                            <button type="button" data-toggle="modal" data-target="#contractor_notification" id="verifyBtn" hidden="true">Verify</button>

                                        </div>
                                    </div>
                                    <!--END:: LOGIN BUTTON AND REGISTRATION BUTTON -->

                                </div>
                                <div class="department_section pd_top_100 pd_bottom_50">
                                    <div class="row">
                                        <div class="col-xl-8 col-xxl-8 order-xxl-1">
                                            <div class="dpt_detail aos-item"  data-aos="fade-up">
                                                <small class="text-muted">Government of India</small>
                                                <h2 class="k-content__head-title"><span class="d-block">Procurelinc</span> </h2>
                                                <p class="text-muted font_size_12 text-justify">Procurelinc <b>L</b>imited was incorporated on 15th September 2000. It took over the business of providing of telecom services and network management from the erstwhile Central Government Departments of Telecom Services (DTS) and Telecom Operations (DTO), with effect from 1st October‘ 2000 on going concern basis. It is one of the largest & leading public sector units providing comprehensive range of telecom services in India.</p>
                                                <div class="point_view">
                                                    <p><i class="fa fa-circle"></i>8,00,000+ KM of Optical Fiber Network.</p>
                                                    <p><i class="fa fa-circle"></i>138 Lakh Wireline Phone 56% Wireline Market Share</p>
                                                    <p><i class="fa fa-circle"></i>2,505 Hotspots at 180 Cities</p>
                                                    <p><i class="fa fa-circle"></i>1,365 Lakh Lines Switching Capacity</p>
                                                    <p><i class="fa fa-circle"></i>1 Lakh+ FTTH Connections</p> 
                                                    <p><i class="fa fa-circle"></i>100+ Million Mobile Customer Base</p>

                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="full_widt_bt"><a href="#" target="_blank" class="btn btn-outline-warning btn-elevate btn-bold btn-upper d-block text-dark btn-square">Click Here to Visit Procurelinc 's Official Website</a></div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-xxl-4 order-xxl-1">
                                            <!-- <div class="dept_image_logo"> -->
                                            <!-- <img src="../assets/demo/media/deptlogo.png" alt="" class="img_width"> -->

                                            <!-- </div> -->
<!--                                            <video id="autoplay" loop muted="" >
                                                <source src="<c:url value="/resources/assets/demo/media/BSNL_LOGOanimation_Small1.mp4"/>" type="video/mp4"> 
                                            </video>-->
                                        </div>
                                    </div>
                                </div>
<!--                                <script>
                                    document.getElementById('autoplay').play();
                                </script>-->
                                <div class="services_model pd_bottom_50">
                                    <div class="row">
                                        <!-- Single Feature Start -->
                                        <div class="col-xl-4 col-xxl-4 order-xxl-1">
                                            <div class="single-feature">
                                                <i class="flaticon-box" aria-hidden="true"></i>
                                                <h5 class="k-font-boldest">Exclusive services<small class="d-block text-muted">for eProcurement Process</small></h5>
                                                <p>Live Auction process. Shows real time bid changes to department and bidder.</p>
                                            </div>
                                        </div>
                                        <!-- Single Feature Start -->
                                        <div class="col-xl-4 col-xxl-4 order-xxl-1">
                                            <div class="single-feature">
                                                <i class="flaticon-rotate" aria-hidden="true"></i>
                                                <h5 class="k-font-boldest">Customer friendly<small class="d-block text-muted">for eProcurement Process</small></h5>
                                                <p>Easy Amendments, Validation, Comparison Sheet and Envelop based system of Tendering.</p>
                                            </div>
                                        </div>
                                        <!-- Single Feature Start -->
                                        <div class="col-xl-4 col-xxl-4 order-xxl-1">
                                            <div class="single-feature">
                                                <i class="flaticon-safe-shield-protection" aria-hidden="true"></i>
                                                <h5 class="k-font-boldest">Highly Secured Technology<small class="d-block text-muted">for eProcurement Process</small></h5>
                                                <p>PKI Digital Signature based e-Tendering process to insure the security and integrity of bid.</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--  End K-Container -->
                            <!--  START ABOUT SECTION -->
                            <div class="department_section pd_bottom_50 about_section">
                                <div class="k-container">
                                    <div class="row">
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1">
                                            <div class="dpt_detail about_us pt-20">
                                                <small class="text-muted">360 Degree e-Procurement</small>
                                                <h2 class="k-content__head-title mrgin_bottom">About Procurelinc e-Procurement Solution</h2>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-7 col-xxl-7 order-xxl-1">
                                                    <div class="dpt_detail about_us pd_bottom_80">
                                                        <img src="<c:url value="/resources/assets/demo/media/about_lotus.jpg"/>" alt="About_Lotus_Procure" class="about_img mb-4">
                                                        <h4>0 (Zero) cost to Buyer/Department.</h4>
                                                        <p class="text-muted font_size_12 mb-4">100% online e-Procurement Solution with 0 (Zero) cost to Buyer or Department.</p>
                                                        <div class="full_widt_bt mt-0"><a href="solution" target="_blank" class="btn btn-warning btn-elevate btn-upper btn-square text-white btn-sm">Know More About Us?</a></div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-5 col-xxl-5 order-xxl-1">
                                                    <div class="dpt_detail list_dtl">
                                                        <ul>
                                                            <li><span class="no_cnt">1.</span><span class="detail_heading">	e-Tendering</span></li>
                                                            <li><span class="no_cnt">2.</span><span class="detail_heading">	e-Auction</span></li>
                                                            <li><span class="no_cnt">3.</span><span class="detail_heading">	Department Management</span></li>
                                                            <li><span class="no_cnt">4.</span><span class="detail_heading">	Bidder Management</span></li>
                                                            <li><span class="no_cnt">5.</span><span class="detail_heading">Payment Management</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1">
                                            <div class="bg-img"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--  END ABOUT SECTION -->

                            <!--  START COUNTER SECTION -->
                            <section class="counter_section">
                                <div class="k-container postion_ab">
                                    <div class="row">
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1 pr-0"> 
                                            <div id="demo2" class="left_side_counter vertical-slider carousel vertical slide" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                                    <!-- <li data-target="#myCarousel" data-slide-to="2"></li> -->
                                                </ol>

                                                <div class="carousel-inner">

                                                    <div class="active carousel-item site__header">
                                                        <h2 class="k-content__head-title mrgin_bottom text-center"><span class="d-block">Solutions</h2>
                                                        <p class="text-dark text-center">Cert-In Certified solution to host and use.</p>
                                                        <div class="participate_count">
                                                            <div class="single_count">
                                                                <!-- <h5 class="k-font-boldest">1000<i class="fa fa-plus"></i></h5> -->
                                                                <!-- <span class="k-font-boldest">Tenders</span> -->
                                                                <img src="<c:url value="/resources/assets/demo/media/certified.png"/>" class="img-responsive" alt="e-Tendering" title="Certificate">
                                                                <img src="<c:url value="/resources/assets/demo/media/certified1.png"/>" class="img-responsive" alt="e-Tendering" title="Certificate">

                                                                <img src="<c:url value="/resources/assets/demo/media/stqc.png"/>" class="img-responsive" alt="e-Tendering" title="Certificate">
                                                            </div> 

                                                        </div>
                                                    </div>
                                                    <div class="carousel-item site__header">
                                                        <h2 class="k-content__head-title mrgin_bottom text-center"><span class="d-block">e-Tendering</h2>
                                                        <p class="text-dark text-center">PKI Digital Signature based e-Tendering process to insure the security and integrity of bid</p>
                                                        <div class="participate_count">
                                                            <div class="single_count">
                                                                <img src="<c:url value="resources/assets/demo/media/step.png"/>" class="img-responsive" alt="e-Tendering" title="Certificet">
                                                            </div> 
                                                        </div>
                                                    </div>
                                                    <!-- <div class="carousel-item site__header"> -->
                                                    <!-- <h2 class="k-content__head-title mrgin_bottom text-center"><span class="d-block">Some Exceptional</span> -->
                                                    <!-- Results We Have Achieved</h2> -->
                                                    <!-- <p class="text-dark text-center">Through Our new and Advances eProcurement Solution our department has earned exceptional results till date.</p> -->
                                                    <!-- <div class="participate_count"> -->
                                                    <!-- <div class="single_count"> -->
                                                    <!-- <h5 class="k-font-boldest">1000<i class="fa fa-plus"></i></h5> -->
                                                    <!-- <span class="k-font-boldest">Tenders</span> -->
                                                    <!-- </div> -->
                                                    <!-- <div class="single_count"> -->
                                                    <!-- <h5 class="k-font-boldest">500<i class="fa fa-plus"></i></h5> -->
                                                    <!-- <span class="k-font-boldest">Contractors</span> -->
                                                    <!-- </div> -->
                                                    <!-- <div class="single_count"> -->
                                                    <!-- <h5 class="k-font-boldest">900<i class="fa fa-plus"></i></h5> -->
                                                    <!-- <span class="k-font-boldest">Completed</span> -->
                                                    <!-- </div> -->
                                                    <!-- </div> -->
                                                    <!-- </div> -->

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1 pl-0">
                                            <div class="counter_img">
                                                <img src="<c:url value="/resources/assets/demo/media/wheel.png"/>" alt="Crain_Img">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-xxl-12 order-xxl-1">
                                            <div class="bgimage_safty div_content">
                                                <div class="float_width">
                                                    <div class="content_banner">
                                                        <h2 class="k-content__head-title mrgin_bottom text-center">Safety & Transparency First!</h2>
                                                        <p class="text-muted font_size_12">Safety & Transparency of tender procedure is our first and foremost concern. Always strive for maintaining it between the departments & contractors.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!--  END COUNTER SECTION -->
                            <!-- DOWNLOAD SECTION CONTENT START -->
                            <div class="department_section pd_bottom_50">
                                <div class="k-container">
                                    <div class="row">
                                        <div class="col-xl-12 col-xxl-12 order-xxl-1">
                                            <div class="dpt_detail about_us pt-200 text-center pd_bottom_50">
                                                <small class="text-muted">Download Centre</small>
                                                <h2 class="k-content__head-title mrgin_bottom"><span class="d-block">Download important</span>
                                                    plugin & Software Updates</h2>
                                                <p class="text-muted font_size_12 mb-4">Find all the important plugins & softwares for the smooth working of your
                                                    <br> new eProcurement pannel & keep yourself up to date.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-3 col-xxl-3 order-xxl-1">
                                            <div class="download_btn">
                                                <h3 class="k-portlet__head-title">Java Download</h3>
                                                <a href="https://java.com/en/download/" target="_blank" class="btn btn-danger btn-bold btn-upper btn-square btn-sm">Download</a>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-xxl-3 order-xxl-1">
                                            <div class="download_btn">
                                                <h3 class="k-portlet__head-title">Root Chain Certificate</h3>
                                                <a href="http://cca.gov.in/cca/?q=root_certificate.html" target="_blank" class="btn btn-danger btn-bold btn-upper btn-square btn-sm">Download</a>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-xxl-3 order-xxl-1">
                                            <div class="download_btn">
                                                <h3 class="k-portlet__head-title">Firefox</h3>
                                                <a href="https://www.mozilla.org/en-US/firefox/new/" target="_blank" class="btn btn-danger btn-bold btn-upper btn-square btn-sm">Download</a>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-xxl-3 order-xxl-1">
                                            <div class="download_btn">
                                                <h3 class="k-portlet__head-title">Ammy Admin</h3>
                                                <a href="http://www.ammyy.com/en/downloads.html" target="_blank" class="btn btn-danger btn-bold btn-upper btn-square btn-sm">Download</a>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <!-- END DOWNLOAD CONTENT SECTION -->

                            <!-- START MOBILE APP SECTION -->
                            <section class="application_download green_bg">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1">
                                            <div class="application_msg pt-20">
                                                <h3 class="message-boxcmg text-white">~ Coming Soon ~</h3>
                                                <h2 class="k-content__head-title mrgin_bottom text-white"><span class="d-block">Your eProcurement assistant 
                                                        is always at hand with our app</span></h2>
                                                <p class="text-light">Procurelinc Procure’s amazing coming soon feature for every customer is on its way!</p>
                                                <div class="app_playstore">
                                                    <a><img src="<c:url value="/resources/assets/demo/media/apple_store.png"/>" alt="app_store" title="Comming Soon"></a>
                                                    <a><img src="<c:url value="/resources/assets/demo/media/play_store.png"/>" alt="play_store" title="Comming Soon"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1">
                                            <div class="lotusprocureApp">
<!--                                                <img src="<c:url value="/resources/assets/demo/media/lotusprocureApp.png"/>" alt="Mobile App" title="Coming Soon">-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- END MOBILE APP SECTION -->

                            <!-- START CONTACT US SECTION -->
                            <section class="contact_us black_bg">
                                <div class="container">
                                    <div class="row">
<!--                                        <div class="col-xl-6 col-xxl-6 order-xxl-1">
                                            <div class="contact_us_detail">
                                                <ul class="contact_list">
                                                    <li class="text-light"><span class="contact_ic"><i class="flaticon-support"></i></span>For any question and enquiry<span class="contact_info">info@precureinceprocurement.com</span></li>
                                                    <li class="text-light"><span class="contact_ic"><i class="flaticon-support"></i></span>Technical Assistance<span class="contact_info">support@Procurelinceprocurement.com</span></li>
                                                    <li class="text-light"><span class="contact_ic"><i class="flaticon-computer"></i></span>Training Desk<span class="contact_info">support@Procurelinceprocurement.com</span></li>
                                                    <li class="text-light">
                                                        <span class="contact_ic">
                                                            <i class="flaticon-map-location"></i>
                                                        </span>
                                                        Address<span class="contact_info"><span class="text-capitalize">Procurelinc<br>

                                                               </span></span></li> 
                                                </ul>
                                            </div>
                                        </div>-->
                                        <div class="col-xl-6 col-xxl-6 order-xxl-1">
                                            <div class="contact_us_form">
                                                <h2 class="k-content__head-title text-white form-group">For any question and enquiry</h2>
                                                <p class="text-light form-group">Feel free to email, We generally replies in a day or two!</p>
                                                <form class="contct_frm">
                                                    <div class="half_form form-group">
                                                        <input type="text" class="form-control width_48" id="exampleInputPassword1" placeholder="Name">
                                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Email">
                                                    </div>
                                                    <div class="half_form form-group">
                                                        <input type="text" class="form-control width_48" id="exampleInputPassword1" placeholder="Subject">
                                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Mobile Number">
                                                    </div>
                                                    <div class="full_form msg_text form-group">
                                                        <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="Message"></textarea>
                                                    </div>

                                                    <div class="form-group captcha_div">
                                                        <span class="responsive-img">
                                                            <p id="">2 4 3 3</p>
                                                        </span>
                                                        <a href="#"><i class="flaticon-refresh text-white"></i></a>
                                                        <input type="text" class="form-control index_captcha" id="exampleInputPassword1" placeholder="Enter Captcha Here">
                                                    </div> 
                                                    <div class="submit_btn form-group">
                                                        <input type="submit" class="btn btn-warning" value="SEND A MESSAGE">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- END CONTACT US SECTION -->

                        </div>
                        <!-- MAIN SECTION DIV CLOSE -->

                    </div>

                    <jsp:include page="Footer.jsp"/>

                    <!-- end:: Footer -->
                </div>

            </div>
        </div>
        <!-- Search Section -->

        <!-- MODAL HOME PAGE USE -->  



        <!-- Large Modal -->
        <div class="modal fade" id="searchtenderModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered"> 
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo"  src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" style="width:120px ;height:120px" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Department Registration</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" style="background-color: #f8f8f8;">
                        <div class="k-portlet" style="margin-bottom:0;">   
                            <div class="k-portlet__body">
                                 
                                <form class="contct_frm searchTenderForm" id="dAdminRagister"> 
                                    <div class="full_form form-group">
                                        <input type="text" class="form-control departname" id="exampleInputPassword1" name="deptName" placeholder="Department Full Name">
                                    </div>
                                    <div class="half_form form-group">
                                        <input type="text" class="form-control width_48" id="exampleInputPassword1"name="deptAdminName" placeholder="Officer Name">
                                        <input type="text" class="form-control" id="exampleInputPassword1"name="designation" placeholder="Designation">
                                    </div>
                                    <div class="half_form form-group">
                                        <input type="text" class="form-control width_48" name="deptMobNo" id="exampleInputPassword1" placeholder="Mobile Number">
                                        <input type="email" class="form-control"  name="deptEmailId" id="exampleInputPassword1" placeholder="Email ID">
                                    </div> 
                                    <div class="form-group captcha_div">
                                        <span class="responsive-img">
                                            <p id="txtCaptch">2 4 3 3</p>
                                        </span>
                                        <a href="#"><i class="flaticon-refresh text-warning"></i></a>
                                        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Captcha Here">
                                    </div>
                                    <div class="form-group">
                                        <div class="k-checkbox-list">
                                            <label class="k-checkbox k-checkbox--brand">
                                                <input type="checkbox"> I Agree with <a href="TermsConditions.html" target="_blank"><b>Terms</b></a> and <a href="TermsConditions.html" target="_blank"><b>Conditions.</b></a>
                                                <span></span>
                                            </label>
                                        </div>
                                    </div> 
                                    <div class="submit_btn form-group">

                                        <input type="submit" class="btn btn-warning" onclick="addDeptAdmin()"value="Register Now"/>
                                    </div>
                                </form>
                            </div>
                        </div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button> 
                    </div>
                </div>
            </div>
        </div>

        <!--END_TENDER_WIZARD_MODAL_FORM-->
        <!-- contact Us Form -->
        <div class="modal fade" id="contactUsForm" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered"> 
                <div class="modal-content" style=" border-color: #ffffff; border-width: 3px;"> 
                    <div class="modal-body contact_us black_bg">
                        <div class="k-portlet1212" style="margin-bottom:0;">   
                            <div class="k-portlet__body2122">
                                <div class="contact_us_form">
                                    <h2 class="k-content__head-title text-white form-group">For any question and enquiry</h2>
                                    <p class="text-light form-group">Feel free to email, We generally replies in a day or two!</p>
                                    <form class="contct_frm">
                                        <div class="half_form form-group">
                                            <input type="text" class="form-control width_48" id="exampleInputPassword1" placeholder="Name">
                                            <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Email">
                                        </div>
                                        <div class="half_form form-group">
                                            <input type="text" class="form-control width_48" id="exampleInputPassword1" placeholder="Subject">
                                            <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Mobile Number">
                                        </div>
                                        <div class="full_form msg_text form-group">
                                            <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="Message"></textarea>
                                        </div>

                                        <div class="form-group captcha_div">
                                            <span class="responsive-img">
                                                <p id="">2 4 3 3</p>
                                            </span>
                                            <a href="#"><i class="flaticon-refresh text-white"></i></a>
                                            <input type="text" class="form-control index_captcha modal_captcha" id="exampleInputPassword1" placeholder="Enter Captcha Here">
                                        </div> 
                                        <div class="submit_btn form-group">
                                            <input type="submit" class="btn btn-warning" value="SEND A MESSAGE">
                                            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Close">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            </div>
        </div>


        <!--END_TENDER_WIZARD_MODAL_FORM-->
        <!-- Modal --> 
        <div class="modal fade mdl_bg mdl_frm" id="" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">				 
                    <div class="modal-body">
                        <div class="k-login-v2">
                            <!--begin::Body-->
                            <div class="k-login-v2__body">

                                <!--begin::Wrapper-->
                                <div class="k-login-v2__body-wrapper">
                                    <div class="k-login-v2__body-container">
                                        <div class="modal-header">
                                            <h5 class="modal-title logo-modal"> 
                                                <a href="#" class="dpt_logo">
                                                    <img alt="Department Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" class="logo-width">
                                                </a>
                                                <span class="dpt_name_logo">Sign In</span></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>

                                        <!--begin::Form-->
                                        <form class="k-login-v2__body-form k-form k-login-v2__body-form--border" action="#" autocomplete="off">
                                            <div class="form-group">
                                                <input class="form-control" type="text" placeholder="UserId" name="username" autocomplete="off">
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control" type="password" placeholder="Password" name="password" autocomplete="off">
                                            </div>
                                            <div class="form-group"> 
                                                <div class="captcha_div">
                                                    <span class="responsive-img">
                                                        <p>2 2 2 2</p>
                                                    </span>
                                                    <a href="#"><i class="flaticon-refresh"></i></a>
                                                </div>
                                                <div class="field_captcha_text">
                                                    <label>Captcha Text</label>
                                                    <input type="email" class="form-control" placeholder="Enter Captcha text here"> 
                                                </div> 
                                            </div>
                                        </form>

                                        <!--end::Form-->

                                        <!--begin::Action-->
                                        <div class="k-login-v2__body-action k-login-v2__body-action--brand">
                                            <a href="#" class="k-link k-link--brand">
                                                Forgot Password ?
                                            </a>
                                            <button type="submit" class="btn btn-pill btn-brand btn-elevate">Sign In</button> 
                                        </div>
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

        <jsp:include page="DepartmentUser/DepartmentContractorLoginModel.jsp" ></jsp:include>
        <jsp:include page="DepartmentUser/ForgotPassword.jsp" ></jsp:include>   
        <jsp:include page="DepartmentUser/CreatePassword.jsp" ></jsp:include>   
        <jsp:include page="createPassword.jsp" ></jsp:include>   
        <jsp:include page="OTPVerificationDeptUser.jsp" ></jsp:include>   
        <jsp:include page="DepartmentUser/Notification.jsp" ></jsp:include>    
        <jsp:include page="DepartmentUser/Tiles/ForgetPasswordOTPVeirifactionDepartUser.jsp" ></jsp:include>    
        <jsp:include page="Contractor/Tiles/ContractorRegistrationModal.jsp"></jsp:include> 
        <jsp:include page="Contractor/Tiles/otpModal.jsp"></jsp:include>
        <jsp:include page="Contractor/Tiles/otpVerifyContractor.jsp"></jsp:include>
        <jsp:include page="Contractor/ForgotPasswordEmailModal.jsp"></jsp:include>
        <jsp:include page="Contractor/Tiles/EditMobileNumberModal.jsp"></jsp:include>
        <jsp:include page="Contractor/Tiles/EditEmailIdModal.jsp"></jsp:include>
            <!--begin:: Global Mandatory Vendors -->
        <script src="<c:url value="/resources/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/sweetalert2/dist/sweetalert2.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/vendors/theme/framework/vendors/sweetalert2/init.js"/>" type="text/javascript"></script>
        <script src="<c:url value="resources/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>
        <!--end:: Global Mandatory Vendors -->
        <script>
            $(function() {
            $(".preloader").fadeOut(2000, function() {
            $(".loader_main").fadeIn(1000);
            });
            });
        </script>
        <script>
            $(document).ready(function() {
            $('#media').carousel({
            pause: true,
                    interval: false,
            });
            });
        </script>
        <script>
            $(document).ready(function() {
            $('#myCarousel').carousel({
            pause: true,
                    interval: false,
            });
            });
        </script> 
        <script>
            $(document).ready(function() {
            $('#media').carousel({
            pause: true,
                    interval: false,
            });
            });
        </script>
        <script>
            $(document).ready(function() {
            var invalidUser = '<c:out value="${invalidUser}"></c:out>';
            if (invalidUser !== ''){
            swal(
                    '',
                    'You Have Entered Incorrect ID And Password',
                    'error'
                    )
            }
            $('.checkOtp').on('input', function (e) {
            $("#validateOTP").html("");
            this.value = this.value.replace(/[^0-9\.]/g, "");
            if (this.value === ''){
            $("#validateOTP").html("Please Enter Valid OTP");
            } else{
            $("#validateOTP").html("");
            }
            });
            var message = '<c:out value="${verifyMobileno}"></c:out>';
            if (message !== "") {
            swal(
                    '',
                    message,
                    'error'
                    );
            }
            });
            </script>
            <script type="text/javascript">
                var code;
                function DrawCaptcha()
                {
                var a = Math.ceil(Math.random() * 7) + '';
                var b = Math.ceil(Math.random() * 7) + '';
                var c = Math.ceil(Math.random() * 7) + '';
                var d = Math.ceil(Math.random() * 7) + '';
                //        var e = Math.ceil(Math.random() * 7) + '';
                //        var f = Math.ceil(Math.random() * 7) + '';
                code = a + ' ' + b + ' ' + c + ' ' + d;
                document.getElementById("txtCaptcha").innerHTML = code;
                }
                function ValidatingCaptcha() {
                var generatedCaptcha = removeSpaces($('#txtCaptcha').html());
                var enteredCaptcha = removeSpaces($('#captcha').val());
                if (enteredCaptcha === "") {
                document.getElementById("captchaError").innerHTML = "Please Keep Captcha";
                $("#sbtbtn").attr('disabled', 'disabled');
                return false;
                }
                else {
                $("#validatingCaptcha").html(" ");
                $("#sbtbtn").removeAttr('disabled');
                }

                if (generatedCaptcha === enteredCaptcha) {
                document.getElementById("captchaError").innerHTML = " ";
                return true;
                }
                else {
                //                        alert("Captcha Does Not Matched");
                document.getElementById("captchaError").innerHTML = "Captcha Does Not Matched";
                $("#sbtbtn").attr('disabled', 'disabled');
                return false;
                }
                }
                function removeSpaces(string)
                {
                return string.split(' ').join('');
                }
            </script>
            <script type="text/javascript">
                var captchaValue;
                function Captcha() {
                var a = Math.ceil(Math.random() * 7) + '';
                var b = Math.ceil(Math.random() * 7) + '';
                var c = Math.ceil(Math.random() * 7) + '';
                var d = Math.ceil(Math.random() * 7) + '';
                //        var e = Math.ceil(Math.random() * 7) + '';
                //        var f = Math.ceil(Math.random() * 7) + '';
                captchaValue = a + ' ' + b + ' ' + c + ' ' + d;
                document.getElementById("loginCaptcha").innerHTML = captchaValue;
                }
                function testCaptcha() {
                //                    alert("function called");
                var captchaValue = removeSpaces(document.getElementById('loginCaptcha').innerHTML);
                var enteredCaptchaValue = removeSpaces(document.getElementById('loginCaptchaInput').value);
                //                    alert("captchaValue "+captchaValue+"enteredCaptchaValue   "+enteredCaptchaValue);
                var msg = "";
                if (enteredCaptchaValue === '') {
                return false;
                }
                else {
                document.getElementById("testCaptchaMsg").innerHTML = "";
                }

                if (captchaValue === enteredCaptchaValue) {
                document.getElementById("testCaptchaMsg").innerHTML = "";
                return true;
                }
                else {

                return false;
                }
                }
                function removeSpaces(string) {
                return string.split(' ').join('');
                }
                //forgot password captcha             
            </script>
            <script>
                function passwordMatch() {
//                alert("Password is matching");
                var newPassword = document.getElementById("newEnteredPassword").value;
                var confirmPassword = document.getElementById("confirmNewPassword").value;
                document.getElementById("newEnteredPasswordError").innerHTML = " ";
                document.getElementById("confirmNewPasswordError").innerHTML = " ";
//               alert("newPassword    "+newPassword +" confirmPassword   " +confirmPassword);
                if (newPassword === "") {
                console.log("newPassword is empty");
                document.getElementById("newEnteredPasswordError").innerHTML = "Please Enter Password";
                return false;
                }
                if (confirmPassword === "") {
                console.log("confirmPassword is empty");
                document.getElementById("confirmNewPasswordError").innerHTML = "Please Confirm Password";
                return false;
                }
                if (newPassword !== confirmPassword) {
                console.log("newPasswordError Does Not Matched");
                document.getElementById("confirmNewPasswordError").innerHTML = "Password Not Matched";
                return false;
                }
                else {
                console.log("newPassword  Matched");
                document.getElementById("newEnteredPasswordError").innerHTML = " ";
                document.getElementById("confirmNewPasswordError").innerHTML = " ";
                return true;
                }
                }


                function validateLoginForm() {
//                     alert("function is called");
                var x = document.forms["myForm1"]["emailid"].value;
                //                alert("x::"+x)
                var y = document.forms["myForm1"]["password"].value;
                var z = document.forms["myForm1"]["loginCaptchaInput"].value;
                var captchaResult = testCaptcha();
                console.log("result for checking captcha is:  " + captchaResult);
                //                alert("y::"+y);
                if (x === "")
                {
                //  alert("Tender Category must be filled out");
                document.getElementById("emailFieldError").innerHTML = "Please Enter Registered Email Id or Mobile No";
                return false;
                }
                else{

                document.getElementById("emailFieldError").innerHTML = "";
                }
                if (y === "") {
//                    alert("Area of Work must be filled out");
                document.getElementById("passwordFieldError").innerHTML = "Please Enter Password";
                return false;
                }
                else{
                document.getElementById("passwordFieldError").innerHTML = "";
                }
                if (captchaResult === false){
                document.getElementById("testCaptchaMsg").innerHTML = "Please Enter Valid Captcha";
                return false;
                } else{
                document.getElementById("testCaptchaMsg").innerHTML = "";
                return true;
                }
                }
                function validate_captcha(that)
                {
                $('#validatingCaptcha').html("");
                that.value = that.value.replace(/[^0-9\.]/g, "");
                }
            </script>


            <script>
                $(document).ready(function () {
//                    alert("copy paste  ");
                $("#passwordCont,#password1 ").on("copy cut paste drop", function () {
                return false;
                });
                $("#txtCaptcha,#captcha").on("copy cut paste drop", function () {
                return false;
                });
                });
            </script>
            <script type="text/javascript">
                $(function () {
                $(".font-button").bind("click", function () {
                var size = parseInt($('#transcroller-body').css("font-size"));
                if ($(this).hasClass("plus")) {
                console.log(size);
                size = size + 2;
                } else {
                size = size - 2;
                if (size <= 10) {
                size = 10;
                }
                }
                $('#transcroller-body').css("font-size", size);
                });
                });
                $(function () {
                $(".reset-font").bind("click", function () {
                var size = parseInt($('#transcroller-body').css("font-size"));
                size = 13;
                $('#transcroller-body').css("font-size", size);
                });
                });
            </script>
            <button hidden="true" data-toggle="modal" data-target="#create_passwordsdeptUser" id="createPassDeptUser" class="createPassDeptUser"></button>
            <button hidden="true" data-toggle="modal" data-target="#otpModalforDeptUser" id="otpforDeptUser" class="otpforDeptUser"></button>
            <script>
                $(document).ready(function () {

                var deptUser = '<c:out value="${deptUser}"></c:out>';
                //alert("hello"+ deptUser);

                if (deptUser == 'deptUserCreatePassword'){

                $('.createPassDeptUser').click();
                $("#create_passwordsdeptUser").toggle();
                }

                var otpfor = '<c:out value="${otpfor}"></c:out>';
                if (otpfor == 'otpforDeptUser'){
                alert("otpfor111 " + otpfor + "Department User");
                $('.otpforDeptUser').click();
                }
                var msgFordeptUser = '<c:out value="${msgFordeptUser}"></c:out>';
                //      alert("otpfor111 "+ otpfor);

                if (msgFordeptUser == 'You Have Successfully Created your Password .'){

                //          $('#otpforDeptUser').click();
                }
                if (msgFordeptUser == 'You Have Alredy Created your Password'){
                swal(
                        'Warning',
                        msgFordeptUser,
                        'Warning'
                        );
                //          $('#otpforDeptUser').click();
                } else if (msgFordeptUser == 'Your Account is Blocked. Please Contect to the Department'){

                swal(
                        'Warning',
                        msgFordeptUser,
                        'Warning'
                        );
                }
                });
            </script>
            <!--Contractor registration related script starts-->   
            <button class="btn btn-brand btn-elevate" data-toggle="modal" data-target="#otpModal" id="openotpModal" hidden="true"></button>
            <button  id="contractorRegId" hidden="true"></button>                                
            <button  id="contractorMobileNo" hidden="true"></button>                                
            <button class="btn btn-brand btn-elevate" data-toggle="modal" data-target="#otpRegCont" id="openVerifyContOtpModal" hidden="true"></button>
            <button type="submit" hidden="true" id="otpFunction"></button>

            <!-- View Department User Model for OTP -->
            <button class="btn btn-brand btn-elevate departUserForgetPassword" data-toggle="modal" data-target="#departUserForgetPasswordModel" hidden="true"></button>

            <script>
                $(document).ready(function () {
                $(".emailId").change(function () {
                var email = $("#email").val();
                $.ajax({
                url: "CheckEmail",
                        data: {email: email},
                        success: function (res) {
                        //                   alert(res);
                        if (res !== "valid Email") {

                        $(".emailIdError").html("Email Id Is Already Registered");
                        $(".emailId").val(" ");
                        }
                        else {
                        $(".emailIdError").html("");
                        //                       $("#"+this.id+"Error").html("");

                        }
                        }, error: function (error){
                //               alert("error : "+error); 
                }
                });
                });
                $(".mobileno").change(function () {
                var mobile = $(".mobileno").val();
                $.ajax({
                url: "checkUserContact",
                        data: {mobile: mobile},
                        success: function (res) {
                        //                    alert(res);
                        if (res !== "valid mobile_no") {
                        $(".mobilenoError").html("Mobile Number Is Already Registered");
                        $(".mobileno").val("");
                        }
                        else {
                        $(".mobilenoError").html("");
                        }
                        }, error: function (error){
                }
                });
                });
                });
            </script>
            <script>
                $(document).ready(function () {
                $("#otherDes").hide();
                var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var firstregex = new RegExp(
                        '^(([a-zA-Z ]+$))'
                        );
                var mobregex = new RegExp(
                        '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                        );
                var emailregex = new RegExp(
                        '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                        '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                        '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                        );
                var passregex = new RegExp(
                        '^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,10})'
                        );
                $('.Name').on('input', function (e) {
                var id = this.id;
                console.log(this.id + "is");
                if (firstregex.test($(this).val())) {
                $("#" + id + "Error").html(" ");
                } else {
                $("#" + id + "Error").html("Please Enter Alphabets Only");
                $("#" + id).val(' ');
                //                    
                }

                });
                $('.select').on('change', function (e) {

                if ($('.select').val() !== '-1') {
                $("#" + this.id + "Error").html(" ");
                console.log("success");
                } else {
                $("#" + this.id + "Error").html("Please Select The Required Field");
                $("#" + id).val(' ');
                console.log("error");
                }
                });
                $('.dialCode').on('change', function (e) {
                if ($('.dialCode').val() !== '-1') {
                //                   alert("true");    
                $("#dialCodesError").html(" ");
                console.log("success");
                } else {
                $("#dialCodesError").html("Please Select the Dial Code");
           console.log("error");
                }
                });
                $('.Mobile_No').on('change', function (e) {
                if (mobregex.test($(this).val())) {
                $("#" + this.id + "Error").html(" ");
                console.log("success");
                } else {
                $("#" + this.id + "Error").html("Please Enter Valid Phone Number");
                }

                });
                $('.mob_no').on('input', function (e) {
                $("#" + this.id + "Error").html("");
                this.value = this.value.replace(/[^0-9\.]/g, "");
                if (this.value === ''){
                $("#" + this.id + "Error").html("Please Enter Valid Phone Number");
                } else{
                $("#" + this.id + "Error").html("");
                }
                });
                $('.Email_Id').on('blur', function (e) {
                //                    alert("Email id test is: "+emailregex.test($(this).val()));

                if (emailregex.test($(this).val())) {
                $("#" + this.id + "Error").html(" ");
                console.log("success");
                } else {
                $("#" + this.id + "Error").html("Please Enter Valid Email Id");
                $("#" + this.id).val('');
                console.log("error");
                }
                });
                $('.Password').on('input', function (e) {
                $("#" + this.id + "Error").html("");
                this.value = this.value.replace(/\s/g, "");
                });
                $('.Password').on('change', function (e) {
                var id = this.id;
                if (passregex.test($(this).val())) {
                $("#" + id + "Error").html(" ");
                } else {
                $("#" + id + "Error").html("Password must contains atleast 1 special character(#,!,%),1 capital letter(A-Z) and minimum length should be 8");
                $("#" + id).val('');
                //                    
                }
                });
                //validation for password does not contain spaces  
                $('.passwordCont').on('input', function (e) {
                $("#" + this.id + "Error").html("");
                this.value = this.value.replace(/\s/g, "");
                });
                $('.passwordCont').on('change', function (e){
                var id = this.id;
                if (passregex.test($(this).val())) {
                $("#passwordContError").html(" ");
                } else {
                $("#" + id + "Error").html("Password must contains atleast 1 special character(#,!,%),1 capital letter(A-Z) and minimum length should be 8");
                $(".passwordCont").val('');
                }
                });
                //checking that confirm password is equal to the password
                $('.Confirm_Password').on('change', function (e) {
                var password = $(".passwordCont").val();
                if (password == $(this).val()) {
                console.log("Password is matched");
                $("#" + this.id + "Error").html(" ");
                } else {
                $("#" + this.id + "Error").html("Password Not Matched");
                $("#" + this.id).val('');
                }
                });
                $('.designation').change(function(){
                var value = $(this).val();
                if (value === '3'){
                $("#otherDes").show();
                } else{
                $("#otherDes").hide();
                }
                });
                });
            </script>
            <script>
                $(document).ready(function() {
                var verifyEmail = '<c:out value="${notVerifyEmail}"></c:out>';
                var verifyMobile = '<c:out value="${notVerifyMobile}"></c:out>';
                var resendemail = '<c:out value="${emailid}"></c:out>';
                var mobile = '<c:out value="${contMobile}"></c:out>';
                var otpContractor = '<c:out value="${otpContractor}"></c:out>';
                var contVerifyRegId = '<c:out value="${contVerifyRegId}"></c:out>';
                var contMobileNo = '<c:out value="${contMobileNo}"></c:out>';
                var passwordFor = '<c:out value="${passwordFor}"></c:out>';
                var otpMessage = '<c:out value="${otpMessage}"></c:out>';
                var editStatus = '<c:out value="${editContMobileNumberStatus}"></c:out>';
                var sendVerificationLink = '<c:out value="${sendVerificationLink}"></c:out>';
                var emailVerificationMessage = '<c:out value="${RegContEmailVerificationMessage}"></c:out>';
                var editContEmailVerificationMessage = '<c:out value="${editContEmailVerificationMessage}"></c:out>';
                if (contVerifyRegId != null){
                $("#contractorRegId").val(contVerifyRegId);
                }
                if (contMobileNo != null){
                $("#contractorMobileNo").val(contMobileNo);
                }
                if (otpMessage !== "") {
                swal(
                        '',
                        otpMessage,
                        'success'
                        );
                }
                if (editStatus === "Mobile Number is Changed Successfully"){
                swal(
                        '',
                        editStatus,
                        'success'
                        );
                }
                if (editStatus === "Mobile Number is not Changed Successfully"){
                swal(
                        '',
                        editStatus,
                        'error'
                        );
                }

                if (sendVerificationLink === "Verification Link has been send") {
                swal(
                        '',
                        'Verification Link has been send to your emailId',
                    'success'
                        );
                }

                if (emailVerificationMessage == 'Email Id Is Verified Successfully'){
                swal(
                        '',
                        emailVerificationMessage,
                        'success'
                        );
                }
                if (editContEmailVerificationMessage == 'Email Id is Changed and Verified Successfully'){
                swal(
                        '',
                        editContEmailVerificationMessage,
                        'success'
                        );
                }

                if (verifyEmail === "Please verify Email" || verifyMobile === "Please Verify Mobile"){
                $("#verifyBtn").click();
                if (verifyEmail === "Please verify Email") {
                $("#verLink").removeAttr('hidden');
                $("#emailVerifyCheck").css("color", "red");
                $("#emailVerifyCheck").addClass("flaticon-close k-font-danger");
                } else {
                $("#verifyStatus").attr('hidden', true);
                $("#verLink").addClass("d-none");
                //                    document.getElementById('verLink').style.display = "none";
                $("#emailVerifyMessage").text("Email is Verified").css("color", "green");
                $("#emailVerifyCheck").addClass("fa fa-check-circle k-font-success fa_lineheight");
                }
                if (verifyMobile === "Please Verify Mobile") {
                $("#resendOtpLink").removeAttr('hidden');
                $("#mobileVerifyCheck").addClass("flaticon-close k-font-danger");
                } else {
                $("#mobileVerifyCheck").addClass("fa fa-check-circle k-font-success fa_lineheight");
                $("#mobileVerifyMessage").text("Mobile is Verified").css("color", "green");
                $("#resendOtpLink").addClass("d-none");
                $('#mobileCheck').prop('checked', true);
                }
                }
                if (otpContractor == 'secondaryContractor'){
                $.ajax({
                url: "verifyMob",
                        success: function (res) {
                        alert(res);
                        $('#generatedotp').val(res);
                        $('#otpFor').val("secondaryContractor");
                        $('#openotpModal').click();
                        }, error: function (error){
                console.log("error : " + error);
                }
                });
                }
                if (passwordFor == 'secondaryContractorCreatePassword') {
                $("#createNewPasswordModal").click();
                }

                var forgotPasswordPage = '<c:out value="${forgotPasswordPage}"></c:out>';
                var statusOfChangePwd = '<c:out value="${statusOfChangePwd}"></c:out>';
                if (forgotPasswordPage == 'forgotPasswordPage'){
                $("#newPassword").click();
                }
                if (statusOfChangePwd !== '' && statusOfChangePwd !== 'false'){
                swal(
                        '',
                        'Password is Changed and You Can Login Successfully',
                        'success'
                        )
                }
                if (statusOfChangePwd !== '' && statusOfChangePwd !== 'true'){
                swal(
                        '',
                        'Password Not Changed Successfully',
                        'error'
                        )
                }

                var message = '<c:out value="${successMsgForPwd}"></c:out>';
                //                alert(message);
                if (message !== "") {
                swal(
                        '',
                        message,
                        'success'
                        );
                }
                });
            </script>
            <script>

                //Captcha on forgot password modal                     
                function forgotPasswordCaptcha() {
                var a = Math.ceil(Math.random() * 7) + '';
                var b = Math.ceil(Math.random() * 7) + '';
                var c = Math.ceil(Math.random() * 7) + '';
                var d = Math.ceil(Math.random() * 7) + '';
                //        var e = Math.ceil(Math.random() * 7) + '';
                //        var f = Math.ceil(Math.random() * 7) + '';
                captchaValue = a + ' ' + b + ' ' + c + ' ' + d;
                document.getElementById("forgotPasswordCaptcha").innerHTML = captchaValue;
                }
                function testForgotPasswordCaptcha() {
                var generatedCaptcha = removeSpaces($('#forgotPasswordCaptcha').html());
                var enteredCaptcha = removeSpaces($('#forgotPasswordCaptchaInput').val());
                if (enteredCaptcha === "") {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Please Enter Captcha";
                return false;
                }
                if (generatedCaptcha === enteredCaptcha) {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = " ";
                return true;
                }
                else {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Captcha Does Not Matched";
                return false;
                }
                }

                function removeSpaces(string)
                {
                return string.split(' ').join('');
                }
                //validating the forgot pwd modal where email and captcha is there         
                function validateForgotPwdModal() {
                //                     alert("function is called");
                var x = document.forms["forgotPwdEmailModal"]["emailid"].value;
                var z = document.forms["forgotPwdEmailModal"]["txtCaptchaInput"].value;
                var captchaResult = testForgotPasswordCaptcha();
                console.log("result for checking forgot password captcha is:  " + captchaResult);
                if (x === "")
                {
                document.getElementById("forgotpwdEmailError").innerHTML = "Please Enter Registered Email Id or Mobile No";
                return false;
                }
                else{
                document.getElementById("forgotpwdEmailError").innerHTML = "";
                }
                if (captchaResult === false){
                document.getElementById("forgotpwdEmailError").innerHTML = "Please Enter Valid Captcha";
                return false;
                } else{
                document.getElementById("forgotpwdEmailError").innerHTML = "";
                return true;
                }
                }
                function validate_captcha(that)
                {
                $('#validatingCaptcha').html("");
                that.value = that.value.replace(/[^0-9\.]/g, "");
                }

                //forgot password checking validation for emailregex and mobile regex
                $(".forgotpwdEmail").change(function(){
                var emailregex = new RegExp(
                        '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                        '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                        '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                        );
                var mobregex = new RegExp(
                        '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                        );
                if (emailregex.test($(this).val()) || mobregex.test($(this).val())) {
                $("#" + this.id + "Error").html(" ");
                console.log("success");
                } else {
                $("#" + this.id + "Error").html("Please Enter Valid Email Id/Contact Number");
                $("#" + this.id).val('');
                return false;
                }
                });
            </script>
            <script>
                $('#otpFunction').click(function(){
                console.log("id=" + this.id);
                $.ajax({
                url: "verifyMob",
                        success: function (res) {
                        alert(res);
                        $('#generatedotp').val(res);
                        $('#otpFor').val("registrationDone");
                        $('#openotpModal').click();
                        }
                });
                });
                function openModal () {
                $("#firstname").val("");
                $("#middlename").val("");
                $("#lastname").val("");
                $("#fullname").val("");
                $("#dialCode").val("-1");
                $("#designation").val("");
                $("#mobileno").val("");
                $("#email").val("");
                $("#password").val("");
                $("#password1").val("");
                $("#captcha").val("");
                $("#contractorType1").prop("checked", false);
                $("#contractorType2").prop("checked", false);
                }
                function otpRegContractor(){
                var id = $("#contractorRegId").val();
                var mobileNo = $("#contractorMobileNo").val();
                $.ajax({
                url: "verifyRegisteredContractor?regId=" + id,
                        success: function (res) {
                        alert(res);
                        $('#generatedOTP').val(res);
                        $('#regContId').val(id);
                        $('#contMobileNo').val(mobileNo);
                        $('#otpFor').val("registrationDone");
                        $('#openVerifyContOtpModal').click();
                        }
                });
                }
                function sendOtpForEdit(){
                var mobileNo = $(".editMobileNo").val();
                if (mobileNo == null || mobileNo === ""){
                $("#editMobileNoError").html("Please Enter Mobile Number");
                return false;
                } else
                {
                $("#editMobileNoError").html("");
                }
                var id = $("#editcontractorRegId").val();
                var mobileNo = $("#editMobileNo").val();
                //                        alert("id is "+id +" mobileNo "+mobileNo);
                $.ajax({
                url: "editRegisteredContractor?regId=" + id + "&mobileNo=" + mobileNo,
                        success: function (res) {
                        alert(res);
                        $('#generatedOTP').val(res);
                        $('#regContId').val(id);
                        $('#contMobileNo').val(mobileNo);
                        $('.otpFor').val("editContMobileNumber");
                        $('#editMobileNumberModal').modal('toggle');
                        $('#openVerifyContOtpModal').click();
                        }
                });
                }

                //checking for editted mobile number is already registered or not from database               

                $(".editMobileNo").change(function () {
                var mobile = $("#editMobileNo").val();
                $.ajax({
                url: "checkUserContact",
                        data: {mobile: mobile},
                        success: function (res) {
                        //                               alert(res);
                        if (res !== "valid mobile_no") {
                        $("#" + this.id + "Error").html("Mobile Number. Is Already Registered");
                        $("#" + this.id).val(" ");
                        }
                        else {
                        $("#" + this.id + "Error").html("");
                        }
                        }, error: function (error){
                }
                });
                });
                function forgotPassword(){
                //alert("forgot password ");
                $('#forgotPasswordEmailModal').modal('toggle');
                $('#cont_login_page').modal('toggle');
                }
            </script>
            <script>
                function resendOtpRegisteredCont(){
                $('#contractor_notification').modal('toggle');
                var id = $("#contractorRegId").val();
                var mobileNo = $("#contractorMobileNo").val();
                //        alert("id is ok  "+id);
                $.ajax({
                url: "verifyRegisteredContractor?regId=" + id,
                        success: function (res) {
                        alert(res);
                        $('#generatedOTP').val(res);
                        $('#regContId').val(id);
                        $('#contMobileNo').val(mobileNo);
                        $('#otpFor').val("registrationDone");
                        $('#openVerifyContOtpModal').click();
                        }
                });
                }

                //for checkin captcha in forgot password email
                function testForgotPasswordCaptcha() {
                var generatedCaptcha = removeSpaces($('#forgotPasswordCaptcha').html());
                var enteredCaptcha = removeSpaces($('#forgotPasswordCaptchaInput').val());
                if (enteredCaptcha === "") {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Please Enter Captcha";
                return false;
                }
                if (generatedCaptcha === enteredCaptcha) {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = " ";
                return true;
                }
                else {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Captcha Does Not Matched";
                return false;
                }
                }

                function removeSpaces(string)
                {
                return string.split(' ').join('');
                }
                //validating the forgot pwd modal where email and captcha is there         
                function validateForgotPwdModal() {
                //                     alert("function is called");
                var x = document.forms["forgotPwdEmailModal"]["emailid"].value;
                var z = document.forms["forgotPwdEmailModal"]["txtCaptchaInput"].value;
                var captchaResult = testForgotPasswordCaptcha();
                console.log("result for checking forgot password captcha is:  " + captchaResult);
                if (x === "")
                {
                document.getElementById("forgotpwdEmailError").innerHTML = "Please Enter Registered Email Id or Mobile No";
                return false;
                }
                else{
                document.getElementById("forgotpwdEmailError").innerHTML = "";
                }
                if (captchaResult === false){
                document.getElementById("forgotpwdEmailError").innerHTML = "Please Enter Valid Captcha";
                return false;
                } else{
                document.getElementById("forgotpwdEmailError").innerHTML = "";
                return true;
                }
                }
                function validateForgotPwdCaptcha(that)
                {
                $('#forgotPasswordCaptchaInputError').html("");
                that.value = that.value.replace(/[^0-9\.]/g, "");
                }
                $('.forgotPasswordCaptchaInput').change(function(){
                var generatedCaptcha = removeSpaces($('#forgotPasswordCaptcha').html());
                var enteredCaptcha = removeSpaces($('#forgotPasswordCaptchaInput').val());
                if (enteredCaptcha === "") {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Please Enter Captcha";
                $('.forgotPasswordCaptchaInput').val('');
                }
                if (generatedCaptcha === enteredCaptcha) {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = " ";
                }
                else {
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Captcha Does Not Matched";
                $('.forgotPasswordCaptchaInput').val('');
    }

                });
                var otpReceived;
                //forgot password ajax call to generate otp
                function forgotPasswordUser(){
                var validUser = $("#forgotpwdEmail").val();
                var enteredCaptcha = removeSpaces($('#forgotPasswordCaptchaInput').val());
                //                        alert("enteredCaptcha  "+enteredCaptcha); 
                if (validUser == null || validUser === ""){
                document.getElementById("forgotpwdEmailError").innerHTML = "Please Enter Valid EmailId/Contact Number";
                return false;
                }
                else  if (enteredCaptcha === "") {
                document.getElementById("forgotpwdEmailError").innerHTML = "";
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "Please Enter Captcha";
                return false;
                }

                else{
                document.getElementById("forgotpwdEmailError").innerHTML = "";
                document.getElementById("forgotPasswordCaptchaInputError").innerHTML = "";
                $.ajax({
                url:"forgotPassword?validUser=" + validUser,
                        success: function (res) {
                        $('#forgotPasswordEmailModal').modal('toggle');
                        //alert(res[1]+":"+res[2]);
                        if (res[2] == "Contractor"){
                        //                                           alert("RESPONSE  ARE "+res[0]+ "  2: "+res[1]);
                        console.log(res);
                        $('#generatedOTP').val(res[1]);
                        $('#regContId').val(res[0]);
                        $('.otpFor').val("forgotPasswordOtp");
                        $('#openVerifyContOtpModal').click();
                        } else if (res[2] == "DepartmentUser"){
                        $(".departUserForgetPassword").click();
                        otpReceived = res[1];
                        $(".reg_Id").val(res[0]);
                        }
                        }
                });
                document.getElementById("forgotpwdEmailError").innerHTML = " ";
                }
                }



            </script>
            <script>
                function  resendMail(){
                var emailid = '<c:out value="${emailid}"></c:out>';
                var user = $("#resendMail").val();
                $('#contractor_notification').modal('toggle');
                //               alert("user  : "+user);
                swal({
                title: 'Are you sure?',
                        text: 'This will send Verification Link to ' + emailid,
                        type: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'Yes',
                        cancelButtonText: 'No',
                        showLoaderOnConfirm: true,
                        reverseButtons: true
                }).then((result) = > {
                if (result.value) {
                $("#preloaderSpinner").show();
                $.ajax({
                url: "resendEmailDone",
                        data: {'emailId': emailid},
                        success: function (response) {
                        $("#preloaderSpinner").hide();
                        //             alert("response  "+response);
                        if (response == 'success')
                                swal(
                                        'Send',
                                        'Email Has Been Send to ' + emailid,
                                        'success'
                                        )
                        },
                        error: function (e) {
                        //                console.log('Error: ' + e);
                        }
                });
                } else if (
                        result.dismiss === swal.DismissReason.cancel
                        ) {
                swal(
                        'Cancelled',
                        'Email Has Not Been Send',
                        'error'
                        )
                }
                })
                        $('#contractor_notification').modal('toggle');
                }
        </script>
        <script>
            $("#contractorType1").click(function(){
            //  alert("confirm contractor");    
            swal({
            title: 'Are you sure?',
                    text: 'If You Once Registered You Cannot Change The Contractor Type',
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    allowOutsideClick: false,
            }).then((result) = > {
            if (result.value) {
            $("#contractorType1").prop("checked", true);
            $("#contractorTypeError").html("");
            } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                    ) {
            $("#contractorType1").prop("checked", false);
            //         $(this).attr('checked',false); 
            //            $(this).checked = false;  
            }
            })
            });
            $("#contractorType2").click(function(){
            swal({
            title: 'Are you sure?',
                    text: 'If You Once Registered You Cannot Change The Contractor Type',
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    allowOutsideClick: false,
            }).then((result) = > {
            if (result.value) {
            $("#contractorType2").prop("checked", true);
            $("#contractorTypeError").html("");
            } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                    ) {
            $("#contractorType2").prop("checked", false);
            }
            })
            });
        </script>
        <script>
            //edit contractor mobile number     
            function editRegisteredMobileNumber(){
            $('#contractor_notification').modal('toggle');
            var id = $("#contractorRegId").val();
            //        alert("id is ok  "+id);
            swal({
            title: 'Are you sure?',
                    text: 'You Want to Edit Mobile Number',
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    allowOutsideClick: false,
            }).then((result) = > {
            if (result.value) {
            $("#editcontractorRegId").val(id);
//                      $('#contractor_notification').modal('toggle');
            $('#editMobileNumberModal').modal('toggle');
            } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                    ) {
            $('#contractor_notification').modal('toggle');
            console.log("cancelled");
            }
            })
            }
            function editRegisteredEmail(){
            $('#contractor_notification').modal('toggle');
            var id = $("#contractorRegId").val();
            //        alert("id is ok  "+id);
            swal({
            title: 'Are you sure?',
                    text: 'You Want to Edit Email Id',
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    allowOutsideClick: false,
            }).then((result) = > {
            if (result.value) {
            $("#editEmailcontractorRegId").val(id);
            $('#editEmailIdModal').modal('toggle');
            } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                    ) {
            $('#contractor_notification').modal('toggle');
            console.log("cancelled");
            }
            })
            }
            //checking that new email id exist or not in database in EditEmailIdModal
            $(".EmailId").change(function () {
            var email = $("#editEmailId").val();
            var emailregex = new RegExp(
                    '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                    '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                    '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                    );
            if (emailregex.test($(this).val())) {
            $("#" + this.id + "Error").html(" ");
            console.log("success");
            } else {
            $("#" + this.id + "Error").html("Please Enter Valid Email Id");
            $("#" + this.id).val('');
            return false;
            }
            $.ajax({
            url: "CheckEmail",
                    data: {email: email},
                    success: function (res) {
//                   alert(res);
                    if (res !== "valid Email") {
//                        alert("done");
                    $(".editEmailIdError").html("Email Id Is Already Registered");
                    $("#" + this.id).val(" ");
                    }
                    else {
                    $("#" + this.id + "Error").html("");
                    }
                    }, error: function (error){
//               alert("error : "+error); 
            }
            });
            });
            //validating the email id for contractor in EditEmailIdModal
            function validateEditContEmail(){
            var email = $("#editEmailId").val();
            //                    alert("Email id test is: "+emailregex.test($(this).val()));

//             alert("email   "+email);
            if (email == null || email === ""){
            document.getElementById("editEmailIdError").innerHTML = "Please Enter EmailId";
            return false;
            }



            }
        </script>   












    </body>

</html>