<%-- 
    Document   : SearchTender
    Created on : 17 Dec, 2018, 11:43:55 AM
    Author     : Windows7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Lotus Procure | Home</title>
    <!-- Favicon lotus procure -->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=PT+Sans:700" rel="stylesheet">
  <jsp:include page="../DepartmentUser/Links.jsp"></jsp:include>
 <style>
 body{ 
 font-family: 'Montserrat', sans-serif!important;
 }
 p{
 font-family: 'Roboto', sans-serif!important;
 }
 </style>
</head>

<body class="k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed1 k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled">
    <!-- begin:: Header Mobile -->
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-8">
                    <div class="header-left">
                        <ul>
                            <li class="text-white">Help Desk Toll Free Number : 1800 345 1100</li>
                            <li><a href="#" class="text_upr text-white border_bt login_bt">Login</a></li>
                            <li><a href="#" class="text_upr text-white">Admin Login</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-5 col-sm-4">
                    <div class="header-right-div">
                        <div class="soical-profile">
                            <ul>
                                <li><a href="#"><i class="fa fa-plus" aria-hidden="true"></i>A</a></li>
                                <li><a href="#"><i class="fa fa-minus" aria-hidden="true"></i>A</a></li>
                                <li><a href="#"><i class="fa fa fa-repeat" aria-hidden="true"></i>A</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
        <div class="k-header-mobile__logo">
            <a href="index.html">
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
    <div class="k-grid1 k-grid--hor k-grid--root1">
        <div class="k-container">
            <div class="k-grid__item k-grid__item--fluid k-grid k-grid--ver k-page">
                <div class="k-aside__brand	k-grid__item  k-aside__brand--skin-light k_aside_width" id="k_aside_brand">
                    <div class="k-aside__brand-logo">
                        <a href="index.html">
                            <img alt="Logo" src="resources/assets/demo/media/logo-dark.png" style="max-width: 100%;" />
                        </a>
                    </div>
                </div>
                <!-- begin:: Aside -->
                <button class="k-aside-close " id="k_aside_close_btn"><i class="la la-close"></i></button>

                <!-- end:: Aside -->
                <div class="k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                    <!-- begin:: Header -->
                    <div id="k_header" class="k-header k-grid__item k-header--skin-light header_shadow" k-hidden-height="76" style="">

                        <!-- begin: Header Menu -->
                        <button class="k-header-menu-wrapper-close" id="k_header_menu_mobile_close_btn"><i class="la la-close"></i></button>

                        <div class="k-header-menu-wrapper margin_0_auto mr-0" id="k_header_menu_wrapper"> 
                            <div id="k_header_menu" class="k-header-menu k-header-menu-mobile nav_menu_f">
                                <ul class="k-menu__nav menu_link_a">
                                    <li class="k-menu__item k-menu__item--active"><a href="#" class="k-menu__link "><span class="k-menu__link-text">About us</span></a>
                                    </li>
                                    <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">Management</span></a>
                                    </li>
                                    <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">Tender Process</span></a>
                                    </li>
                                    <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">FAQ's</span></a>
                                    </li>
                                    <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">Help</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- end: Header Menu -->

                        <!-- begin:: Header Topbar -->
                        <div class="k-header__topbar margin_0_auto ml-0">
                            <!--begin: Language bar -->
                            <div class="k-header__topbar-item k-header__topbar-item--langs">
                                <div class="k-header__topbar-item-wrapper" data-toggle="dropdown" data-offset="10px -2px" aria-expanded="false">
                                    <span class="k-header__topbar-icon">
										<img class="" src="resources/assets/media/flags/020-flag.svg" alt="">
									</span>
                                </div>
                                <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(876px, 76px, 0px);">
                                    <ul class="k-nav k-margin-t-10 k-margin-b-10">
                                        <li class="k-nav__item k-nav__item--active">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><img src="resources/assets/media/flags/020-flag.svg" alt=""></span>
                                                <span class="k-nav__link-text">English</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><img src="resources/assets/media/flags/016-spain.svg" alt=""></span>
                                                <span class="k-nav__link-text">Spanish</span>
                                            </a>
                                        </li>
                                        <li class="k-nav__item">
                                            <a href="#" class="k-nav__link">
                                                <span class="k-nav__link-icon"><img src="resources/assets/media/flags/017-germany.svg" alt=""></span>
                                                <span class="k-nav__link-text">German</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--end: Language bar -->
                            <!--end: Quick panel toggler -->
                        </div>

                        <!-- end:: Header Topbar -->

                    </div>

                    <!-- end:: Header -->

                </div>

            </div>
        </div>
    </div>
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
                                    <img src="resources/images/la.jpg" alt="Los Angeles" width="1100" height="500">
                                    <div class="carousel-caption">
                                        <h3>New India Building is focused on <br>long-term cooperation with stable result.</h3>
                                        <p>Help in the new journey of developing India.</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="overley"></div>
                                    <img src="resources/images/chicago.jpg" alt="Chicago" width="1100" height="500">
                                    <div class="carousel-caption">
                                        <h3>New India Building is focused on <br>long-term cooperation with stable result.</h3>
                                        <p>Help in the new journey of developing India.</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="overley"></div>
                                    <img src="resources/images/ny.jpg" alt="New York" width="1100" height="500">
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
                        <section class="searchSection bg_search_cl">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3" style="max-width: 20%;">
				<div class="home-content__head-main">
                    <h3 class="k-content__head-title text-center">Search Tender</h3> 
                </div>
			</div>
			<div class="col-lg-6">
				<div class="input_form_search">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col">
				<div class="button_modify">
				<a href="#" class="btn_custom text_upr">Modify Search</a> 
				</div>
			</div>
		</div>
	</div>
  </section>
  <section class="tendersearch_ft">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3">
								<div class="filter_tender pt-4">
									<h4 class="form-group">Filter <small class="pull-right">Reset All</small></h4>
						<!--begin::Portlet-->
									<div class="form-group">
																	<div class="k-radio-inline">
															<label class="k-radio k-radio--brand">
																<input type="radio" name="radio4"> Tenders
																<span></span>
															</label>
															<label class="k-radio k-radio--brand">
																<input type="radio" checked="checked" name="radio4"> Auction
																<span></span>
															</label>
															<label class="k-radio k-radio--brand">
																<input type="radio" name="radio4">RFX
																<span></span>
															</label>
														</div>
									</div>
									<div class="form-group">
												<select class="form-control k_selectpicker">
												<option value="" disabled="" selected="">Tender Status</option>
												<option value="1">Live</option>
												<option value="2">In Process</option>
												<option value="3">Technical Evaluation</option>
												<option value="4">Financial Bid Opening</option>
												<option value="5">Financial Evaluation</option>
												<option value="6">AOC</option>
												<option value="7">Retender</option>
												<option value="8">Cancelled</option>
												</select>
											</div>
									<div class="form-group">
												<select class="form-control k_selectpicker">
												<option value="" disabled selected>Tender Categories</option>
												<option value="1">Goods</option>
												<option value="2">Services</option>
												<option value="3">Works</option>
												</select>
											</div>
									<div class="form-group">
												<select class="form-control k_selectpicker">
												<option value="" disabled selected>Departments</option>
												<option value="1">Administrative Department - AIIMS Raipur</option>
												<option value="2">Central Store - AIIMS Raipur</option>
												<option value="3">Hospital Store - AIIMS Raipur</option>
												<option value="4">Project Cell - AIIMS Raipur</option>
												</select>
											</div>
									<div class="form-group">
			<input type="text" name="tenderNo" value="" class="form-control iput_field" placeholder="Type Tender or NIT No.">
									</div>
									<div class="form-group">
												<select class="form-control k_selectpicker">
												<option value="" disabled selected>Select Keywords</option> 
												<option value="1">Goods</option>
												<option value="2">Services</option>
												<option value="3">Works</option>
												</select>
											</div>
									<div class="form-group">
												<select class="form-control k_selectpicker">
												<option value="" disabled selected>Contractor Class</option>
												<option value="1">Class A</option>
												<option value="2">Class B</option>
												<option value="3">Class C</option>
												</select>
											</div>
									<div class="form-group">
												<select class="form-control k_selectpicker">
												<option value="" disabled selected>Area of Work</option>
												<option value="1">Today</option>
												<option value="2">Yesterday</option>
												<option value="3">Last 7 days</option>
												<option value="3">Last 30 days</option>
												<option value="3">Last week</option>
												<option value="3">Last month</option>
												</select>
											</div>
									<div class="form-group">
										<label>Probale Amount of Contract (P.A.C)</label>
												<select class="form-control k_selectpicker">
												<option value="" disabled selected>1 lac to 16 crore</option>
												<option value="1">1 lac to 16 crore</option>
												<option value="2">1 lac to 12 crore</option>
												</select>
											</div>
									<div class="form-group">
										<label>Start Date of Purchase</label>
											<div class="input-group mb-2">
												<div class="input-group-prepend">
												  <div class="input-group-text iput_field"><i class="flaticon-event-calendar-symbol" aria-hidden="true"></i></div>
												</div>
												<input type="text" class="form-control py-0 iput_field hasDatepicker" id="filter-date-2" placeholder="Select Start Date">
											</div>
									</div>
									<div class="form-group">
										<label>Last Date of Purchase</label>
											<div class="input-group mb-2">
												<div class="input-group-prepend">
												  <div class="input-group-text iput_field"><i class="flaticon-event-calendar-symbol" aria-hidden="true"></i></div>
												</div>
												<input type="text" class="form-control py-0 iput_field hasDatepicker" id="filter-date-3" placeholder="Select Last Date">
											</div>
									</div>

									<!--end::Portlet-->
								</div>

				 </div> 
			<div class="col-lg-8 bg-white">
			<br>
		<div class="sliderdate_m">
			<div class="row mrgn_sl">
				<div class="col-lg-4">
					<div class="filter_multiplebt">
					<h6 class="d-block h6">Sort By</h6>
						<div class="btn-group" role="group" aria-label="Basic example"> 
						  <button type="button" class="btn btn-warning bg-y waves-effect waves-light">Value<i class="la la-arrow-up" aria-hidden="true"></i></button>
						  <button type="button" class="btn btn-warning bg-white radiobt2 waves-effect waves-light">Date</button>
						  <button type="button" class="btn btn-warning bg-white radiobt2 waves-effect waves-light">Popularity</button>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
			<div id="demo" class="carousel slide cl_slider" data-ride="carousel"> 
			  <div class="carousel-inner">
				<div class="carousel-item carousel-item-next carousel-item-left">
				 	<div class="calendar_date">
						<ul class="clearfix">
							<li>
								<div class="viewDateDay">
									<span class="date_v">24 Sept</span>
									<span class="day_v">Thrusday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">25 Sept</span>
									<span class="day_v">Friday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">26 Sept</span>
									<span class="day_v">Saturday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">27 Sept</span>
									<span class="day_v">Sunday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">28 Sept</span>
									<span class="day_v">Today</span>
								</div>
							</li>
						</ul>
					</div>
				   
				</div>
				<div class="carousel-item">
				  <div class="calendar_date">
						<ul class="clearfix">
							<li>
								<div class="viewDateDay">
									<span class="date_v">24 Sept</span>
									<span class="day_v">Thrusday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">25 Sept</span>
									<span class="day_v">Friday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">26 Sept</span>
									<span class="day_v">Saturday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">27 Sept</span>
									<span class="day_v">Sunday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">28 Sept</span>
									<span class="day_v">Today</span>
								</div>
							</li>
						</ul>
					</div>
				    
				</div>
				<div class="carousel-item active carousel-item-left">
				  <div class="calendar_date">
						<ul class="clearfix">
							<li>
								<div class="viewDateDay">
									<span class="date_v">24 Sept</span>
									<span class="day_v">Thrusday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">25 Sept</span>
									<span class="day_v">Friday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">26 Sept</span>
									<span class="day_v">Saturday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">27 Sept</span>
									<span class="day_v">Sunday</span>
								</div>
							</li>
							<li>
								<div class="viewDateDay">
									<span class="date_v">28 Sept</span>
									<span class="day_v">Today</span>
								</div>
							</li>
						</ul>
					</div>
				      
				</div>
			  </div>
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				<i class="fa fa-caret-left" aria-hidden="true"></i>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
				<i class="fa fa-caret-right" aria-hidden="true"></i>
			  </a>
			</div>

		</div>
			</div>
		</div>
		<br>
				<div class="viewListTender">
					<div class="row">
						<div class="col-lg-2">
							<div class="department_logo">
								<img src="resources/img/department.png" alt="department_logo">
							</div>
						</div>
						<div class="col-lg-8 border_right">
							<div class="department_detail">
								<h5 class="department_title color_blue">Department of Tourism - Madhya Pradesh</h5>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
								<ul class="contact_details">
									<li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span>Bhopal (M.P) </span></li>
									<li class="margin_right mrgt"><strong class="color_blue">NIT No.</strong> <span>NIT/DEMO/LUMPSUM/QCBS/18/9/2</span></li>
									<li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>4958762</span></li>
									<li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong> <span>01-12-2020 | 12:00 PM</span></li>
									<li><i class="la la-inr"></i> <strong>Value</strong> <span>4500980000.00</span></li> 
								<li class="d-block mb-0">
								<div class="tender_keywords clearfix">
									<span class="pull-left keywords_v_lst"><i class="flaticon-interface-9"></i><a href="#">Construction</a>,<a href="#">Road</a>,<a href="#">Civil</a></span>
									<span class="">
										<a href="#" class="pull-right btn btn-primary  btn-sm m-0"><i class="la la-arrow-circle-o-down"></i><span class="d-lg-inline-block mr-1">Download</span></a>
									</span>
								</div></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 padding_both">
						 <div class="sharetender">
							<a class="" href="#"><i class="la la-share-square" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn btn btn-success btn-xm waves-effect waves-light">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							<a href="#" class="btn btn-success view_dtl_bt waves-effect waves-light">View Details</a>
						 </div>
						</div>
					</div> 
				</div>
					<div class="viewListTender">
					<div class="row">
						<div class="col-lg-2">
							<div class="department_logo">
								<img src="resources/img/department.png" alt="department_logo">
							</div>
						</div>
						<div class="col-lg-8 border_right">
							<div class="department_detail">
								<h5 class="department_title color_blue">Department of Tourism - Madhya Pradesh</h5>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
								<ul class="contact_details">
									<li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span>Bhopal (M.P) </span></li>
									<li class="margin_right mrgt"><strong class="color_blue">NIT No.</strong> <span>NIT/DEMO/LUMPSUM/QCBS/18/9/2</span></li>
									<li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>4958762</span></li>
									<li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong> <span>01-12-2020 | 12:00 PM</span></li>
									<li><i class="la la-inr"></i> <strong>Value</strong> <span>4500980000.00</span></li> 
								<li class="d-block mb-0">
								<div class="tender_keywords clearfix">
									<span class="pull-left keywords_v_lst"><i class="flaticon-interface-9"></i><a href="#">Construction</a>,<a href="#">Road</a>,<a href="#">Civil</a></span>
									<span class="">
										<a href="#" class="pull-right btn btn-primary  btn-sm m-0"><i class="la la-arrow-circle-o-down"></i><span class="d-lg-inline-block mr-1">Download</span></a>
									</span>
								</div></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 padding_both">
						<div class="sharetender">
							<a class="" href="#"><i class="la la-share-square" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn btn btn-success btn-xm waves-effect waves-light">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							<a href="#" class="btn btn-success view_dtl_bt waves-effect waves-light">View Details</a>
						 </div>
						</div>
					</div> 
				</div>
						<div class="viewListTender">
					<div class="row">
						<div class="col-lg-2">
							<div class="department_logo">
								<img src="resources/img/department.png" alt="department_logo">
							</div>
						</div>
						<div class="col-lg-8 border_right">
							<div class="department_detail">
								<h5 class="department_title color_blue">Department of Tourism - Madhya Pradesh</h5>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
								<ul class="contact_details">
									<li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span>Bhopal (M.P) </span></li>
									<li class="margin_right mrgt"><strong class="color_blue">NIT No.</strong> <span>NIT/DEMO/LUMPSUM/QCBS/18/9/2</span></li>
									<li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>4958762</span></li>
									<li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong> <span>01-12-2020 | 12:00 PM</span></li>
									<li><i class="la la-inr"></i> <strong>Value</strong> <span>4500980000.00</span></li> 
								<li class="d-block mb-0">
								<div class="tender_keywords clearfix">
									<span class="pull-left keywords_v_lst"><i class="flaticon-interface-9"></i><a href="#">Construction</a>,<a href="#">Road</a>,<a href="#">Civil</a></span>
									<span class="">
										<a href="#" class="pull-right btn btn-primary  btn-sm m-0"><i class="la la-arrow-circle-o-down"></i><span class="d-lg-inline-block mr-1">Download</span></a>
									</span>
								</div></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 padding_both">
						<div class="sharetender">
							<a class="" href="#"><i class="la la-share-square" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn btn btn-success btn-xm waves-effect waves-light">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							<a href="#" class="btn btn-success view_dtl_bt waves-effect waves-light">View Details</a>
						 </div>
						</div>
					</div> 
				</div>
						<div class="viewListTender">
					<div class="row">
						<div class="col-lg-2">
							<div class="department_logo">
								<img src="resources/img/department.png" alt="department_logo">
							</div>
						</div>
						<div class="col-lg-8 border_right">
							<div class="department_detail">
								<h5 class="department_title color_blue">Department of Tourism - Madhya Pradesh</h5>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
								<ul class="contact_details">
									<li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span>Bhopal (M.P) </span></li>
									<li class="margin_right mrgt"><strong class="color_blue">NIT No.</strong> <span>NIT/DEMO/LUMPSUM/QCBS/18/9/2</span></li>
									<li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>4958762</span></li>
									<li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong> <span>01-12-2020 | 12:00 PM</span></li>
									<li><i class="la la-inr"></i> <strong>Value</strong> <span>4500980000.00</span></li> 
								<li class="d-block mb-0">
								<div class="tender_keywords clearfix">
									<span class="pull-left keywords_v_lst"><i class="flaticon-interface-9"></i><a href="#">Construction</a>,<a href="#">Road</a>,<a href="#">Civil</a></span>
									<span class="">
										<a href="#" class="pull-right btn btn-primary  btn-sm m-0"><i class="la la-arrow-circle-o-down"></i><span class="d-lg-inline-block mr-1">Download</span></a>
									</span>
								</div></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 padding_both">
						 <div class="sharetender">
							<a class="" href="#"><i class="la la-share-square" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn btn btn-success btn-xm waves-effect waves-light">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							<a href="#" class="btn btn-success view_dtl_bt waves-effect waves-light">View Details</a>
						 </div>
						</div>
					</div> 
				</div>
						<div class="viewListTender">
					<div class="row">
						<div class="col-lg-2">
							<div class="department_logo">
								<img src="resources/img/department.png" alt="department_logo">
							</div>
						</div>
						<div class="col-lg-8 border_right">
							<div class="department_detail">
								<h5 class="department_title color_blue">Department of Tourism - Madhya Pradesh</h5>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
								<ul class="contact_details">
									<li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span>Bhopal (M.P) </span></li>
									<li class="margin_right mrgt"><strong class="color_blue">NIT No.</strong> <span>NIT/DEMO/LUMPSUM/QCBS/18/9/2</span></li>
									<li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>4958762</span></li>
									<li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong> <span>01-12-2020 | 12:00 PM</span></li>
									<li><i class="la la-inr"></i> <strong>Value</strong> <span>4500980000.00</span></li> 
								<li class="d-block mb-0">
								<div class="tender_keywords clearfix">
									<span class="pull-left keywords_v_lst"><i class="flaticon-interface-9"></i><a href="#">Construction</a>,<a href="#">Road</a>,<a href="#">Civil</a></span>
									<span class="">
										<a href="#" class="pull-right btn btn-primary  btn-sm m-0"><i class="la la-arrow-circle-o-down"></i><span class="d-lg-inline-block mr-1">Download</span></a>
									</span>
								</div></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 padding_both">
						<div class="sharetender">
							<a class="" href="#"><i class="la la-share-square" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn btn btn-success btn-xm waves-effect waves-light">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							<a href="#" class="btn btn-success view_dtl_bt waves-effect waves-light">View Details</a>
						 </div>
						</div>
					</div> 
				</div>
			
			<!-- Pagination Section Start -->
				 <div class="pagination_design">
				 <nav aria-label="Page navigation example">
  <ul class="pagination pagination-circle pg-blue">
    <li class="page-item disabled"><a class="page-link waves-effect waves-effect">First</a></li>
    <li class="page-item disabled">
      <a class="page-link waves-effect waves-effect" aria-label="Previous">
        <span aria-hidden="true">«</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item active"><a class="page-link waves-effect waves-effect">1</a></li>
    <li class="page-item"><a class="page-link waves-effect waves-effect">2</a></li>
    <li class="page-item"><a class="page-link waves-effect waves-effect">3</a></li>
    <li class="page-item"><a class="page-link waves-effect waves-effect">4</a></li>
    <li class="page-item"><a class="page-link waves-effect waves-effect">5</a></li>
    <li class="page-item">
      <a class="page-link waves-effect waves-effect" aria-label="Next">
        <span aria-hidden="true">»</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link waves-effect waves-effect">Last</a></li>
  </ul>
</nav>
</div>
			</div>  
			<div class="col-lg-1" style="background-color:#fff;"></div>
		</div>
	</div>
  </section>
                        <!--  End K-Container -->
                      
                     
                    </div>
                    <!-- MAIN SECTION DIV CLOSE -->

                </div>
 
				<footer class="page-footer bg-dark pt-4"> 
  <!--Footer Links-->
  <div class="container text-center text-md-left footer_div">
    <div class="row mt-3">
      <!--First column-->
      <div class="col-md-4 col-lg-4 col-xl-4 mb-4">
          <img src="resources/img/light_logo.png" alt="Logo_Footer" class="max_with_foot">
        <p class="text-light">
          Department of Information Technology, Govt. of Madhya Pradesh has adopted the e-tendering System using online platform in 2006. The Project being a BOT Project implemented as "No Cost to GoMP" commenced through MP Government Order No. F3-3/2004/56 dated 07th Sept 2006.
        </p> 
      </div>
      <!--/.First column-->
      <!--Second column-->
      <div class="col-md-4 col-lg-4 col-xl-4 mb-4">
        <h6 class="text-uppercase font-weight-bold text-muted">
          <strong>Useful Links</strong>
        </h6> 
		 <div class="use_full_link">
        <p>
          <a class="border_dashed" href="#">Client care</a>
        </p> 
        <p>
          <a class="border_dashed" href="#">Legal information</a>
        </p>
        <p>
          <a class="border_dashed" href="#">FAQs</a>
        </p>
        <p>
          <a class="border_dashed" href="#">Policies</a>
        </p>
        <p>
          <a class="border_dashed" href="#">Appointments</a>
        </p>
        <p>
          <a class="border_dashed" href="#">Downloads</a>
        </p>
        <p>
          <a href="#">Track a tender</a>
        </p>
		<p>
          <a href="#">Contractor support</a>
        </p> 
		 </div>
      </div>  
      <!--/.Second column-->
       <!--/.Third column-->
      <!--Fourth column-->
      <div class="col-md-4 col-lg-4 col-xl-4 Subscribe">
        <h6 class="text-uppercase font-weight-bold text-muted">
          <strong>Subscribe</strong>
        </h6> 
        <p class="text-light">
         Subscribe to our montly newsletter which helps to keep
you updated with our organization.
        </p> 
		<p>
          <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Type your email">
        </p>
        <p>
         <a href="#" class="btn btn-warning btn-bold btn-upper d-block text-white">Subscribe to Newsletter</a>
        </p>
        
      </div>
      <!--/.Fourth column-->
    </div>
  </div>
  <!--/.Footer Links-->
  <!-- Copyright-->
  <div class="footer-copyright py-3 text-center">
    © 2018 Copyright:
    <a href="#">
      <strong>OSMO IT SOLUTION PVT. LTD</strong>
    </a>
  </div>
  <!--/.Copyright -->
</footer>

                <!-- end:: Footer -->
            </div>

        </div>
    </div>
  

<script>
            /*jslint browser:true*/
            /*global jQuery, document*/

            jQuery(document).ready(function () {
                'use strict';

                jQuery('#filter-date-2,#filter-date-3').datetimepicker();
				allowTimes:[
  '12:10', '13:00', '15:00', 
  '17:00', '17:05', '17:20', '19:00', '20:00'
 ]
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

</body>

</html>
