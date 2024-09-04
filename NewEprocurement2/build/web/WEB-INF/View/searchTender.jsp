<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

 <html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Lotus Procure | Home</title>
    <!-- Favicon lotus procure -->
    <link rel="shortcut icon" href="img/favicon.png" />
    <!-- Font Awesome --> 
    <link href="css/style.min.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700i" rel="stylesheet">
  
    <!--begin:: Global Mandatory Vendors -->
    <link href="vendors/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
<!--begin::Web font -->
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script> -->
		<!-- <script> -->
			<!-- WebFont.load({ -->
                <!-- google: {"families":["Poppins:300,400,500,600,700","Roboto:300,400,500,600,700"]}, -->
                <!-- active: function() { -->
                    <!-- sessionStorage.fonts = true; -->
                <!-- } -->
            <!-- }); -->
        <!-- </script> -->
    <!--begin:: Global Optional Vendors -->
   <link href="<c:url value="/Homepage/vendors/tether/dist/css/tether.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-timepicker/css/bootstrap-timepicker.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-daterangepicker/daterangepicker.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-select/dist/css/bootstrap-select.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/nouislider/distribute/nouislider.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/owl.carousel/dist/assets/owl.carousel.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/owl.carousel/dist/assets/owl.theme.default.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/dropzone/dist/dropzone.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/summernote/dist/summernote.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/bootstrap-markdown/css/bootstrap-markdown.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/animate.css/animate.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/toastr/build/toastr.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/morris.js/morris.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/chartist/dist/chartist.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/sweetalert2/dist/sweetalert2.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/socicon/css/socicon.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/vendors/line-awesome/css/line-awesome.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/vendors/flaticon/css/flaticon.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/vendors/vendors/fontawesome5/css/all.min.css"/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/angular/ContractorController.js" />" type="text/javascript"></script>
    <!--end:: Global Optional Vendors -->

    <!--begin::Global Theme Styles -->
    <link href="<c:url value="/Homepage/assets/demo/base/style.bundle.css"/>" rel="stylesheet" type="text/css" />

    <!--RTL version:<link href="assets/demo/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Global Theme Styles -->
    <!--begin::Page Vendors Styles -->
    <link href="<c:url value="/Homepage/assets/vendors/custom/datatables/datatables.bundle.css"/>" rel="stylesheet" type="text/css" />
    <!--begin::Page Vendors Styles -->
    <link href="<c:url value="/Homepage/assets/vendors/custom/fullcalendar/fullcalendar.bundle.css"/>" rel="stylesheet" type="text/css" />

    <!--RTL version:<link href="assets/vendors/custom/fullcalendar/fullcalendar.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Page Vendors Styles -->
    <link rel="shortcut icon" href="<c:url value="/Homepage/assets/demo/media/faviconlp.ico"/>" />
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=PT+Sans:700" rel="stylesheet">
    <!-- coustom_style_css -->
    <link href="<c:url value="/Homepage/assets/mystyle.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/assets/animate.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/Homepage/assets/animationBorder/jquery.rollingBorder.css"/>" rel="stylesheet" type="text/css" />
 <style>
 body, p{ 
font-family: 'Poppins', sans-serif!important;
 }
 p{
 font-family: 'Roboto', sans-serif;
 }
 </style>
</head>

<body class="k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed1 k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled">
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
                        <section class="searchSection bg_search_cl">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3" style="max-width: 20%;">
				<div class="home-content__head-main">
                  <h3 class="k-content__head-title text-center">Search Tender</h3> 

                </div>
			</div>
			<div class="col-lg-8">
				<div class="input_form_search">
					<input type="text" class="form-control">
				</div>
				<div class="button_modify">
				<a href="#" class="btn_custom text_upr">Modify Search</a> 
				</div>
			</div>
			<div class="col-lg-1">
				<a href="#" target="_blank" class="btn btn-elevate btn-secondary btn-bold btn-upper">Login</a>
			</div>
		</div>
	</div>
  </section>
  <section class="tendersearch_ft">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 width_customize">
								<div class="filter_tender pt-4">
									<h4 class="form-group">Filter <small class="pull-right">Reset All</small></h4>
						<!--begin::Portlet-->
									<div class="form-group">
																	<div class="k-radio-inline">
															<label class="k-radio k-radio--default">
																<input type="radio" name="radio4"> Tenders
																<span></span>
															</label>
															<label class="k-radio k-radio--default">
																<input type="radio" checked="checked" name="radio4"> Auction
																<span></span>
															</label>
															<label class="k-radio k-radio--default">
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
						  <button type="button" class="btn btn-warning bg-white radiobt2 waves-effect waves-light">Days Left</button>
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
                                                            <img src="<c:url value="resources/assets/departmentlogo/department.png"/>" alt="department_logo">
							</div>
						</div>
						<div class="col-lg-8 border_right">
							<div class="department_detail">
								<h5 class="department_title color_blue">Department of Tourism - Madhya Pradesh</h5>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
								<ul class="contact_details">
									<li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span>Bhopal (M.P) </span></li>
									<li class="display_block"><strong class="color_blue">NIT No.</strong> <span>NIT/DEMO/LUMPSUM/QCBS/18/9/2</span></li>
									<li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>4958762</span></li>
									<li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong> <span>01-12-2020 | 12:00 PM</span></li>
									<li><i class="la la-inr"></i> <strong>Value</strong> <span>4500980000.00</span></li> 
								<li class="d-block mb-0">
								<div class="tender_keywords clearfix">
									<span class="pull-left keywords_v_lst"><i class="flaticon-interface-9"></i><a href="#">Construction</a>,<a href="#">Road</a>,<a href="#">Civil</a></span>
									<span class="">
										<a href="#" class="pull-right btn btn-primary view_dtl_bt btn-sm m-0"><i class="la la-arrow-circle-o-down text-white"></i><span class="d-lg-inline-block mr-1">Download</span></a>
									</span>
								</div></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 padding_both">
						 <div class="sharetender">
							<a class="envelope" href="#"><i class="la la-envelope" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							<a href="#" class="btn btn-primary btn-sm view_dtl_bt btn-sm btn-bold">View Details</a>
						 </div>
						</div>
					</div> 
                                         <div class="row">
                                             <c:if test="${not empty tenderList}">
    <c:forEach items="${tenderList}" var="tender">
        <div class="col-lg-2">
							<div class="department_logo">
                                                            <img src="<c:url value="resources/assets/departmentlogo/department.png"/>" alt="department_logo">
							</div>
						</div>
        <div class="col-lg-8 border_right">
            <div class="department_detail">
               	<h5 class="department_title color_blue">${tender.deptName}</h5>
                <p>${tender.nameOfWork}</p>
                <ul class="contact_details">
                    <li class="display_block"><i class="la la-map-marker"></i> <strong class="color_black">Location :</strong> <span></span></li>
                   <li class="display_block"><strong class="color_blue">NIT No.</strong> <span>${tender.nitNumber}</span></li>
                    <li class="mrgt"><strong class="color_blue">Tender No.</strong> <span>${tender.tenderNumber}</span></li>
                    <li class="margin_right"><i class="flaticon-event-calendar-symbol"></i> <strong>Last Date of Purchase :</strong>
                        <c:set var="purchaseDate" value="${tender.tenderKeyDates.tenderPurchaseDate}" />
<c:set var="splitDates" value="${fn:split(purchaseDate, '/')}" />
                        <span>${splitDates[1]}</span>
                    </li>
                    <li><i class="la la-inr"></i> <strong>Value</strong> <span>${tender.estimateValueInFig}</span></li>
                    <!-- Include other details as needed using -->
                    <li class="d-block mb-0">
                        <div class="tender_keywords clearfix">
                            <span class="pull-left keywords_v_lst">
                                <i class="flaticon-interface-9"></i>
                               
                            </span>
                            <span class="">
                                <a href="#" class="pull-right btn btn-primary view_dtl_bt btn-sm m-0">
                                    <i class="la la-arrow-circle-o-down text-white"></i>
                                    <span class="d-lg-inline-block mr-1">Download</span>
                                </a>
                            </span>
                        </div>
                    </li>
                </ul>
            </div>
                    
        </div>
                    <div class="col-lg-2 padding_both">
						 <div class="sharetender">
							<a class="envelope" href="#"><i class="la la-envelope" aria-hidden="true"></i></a>
							<a class="" href="#"><i class="la la-star" aria-hidden="true"></i></a>
							<a href="#" class="live_btn">Live</a> 
						 </div>
						 <div class="spacebtween"></div>
						 <div class="text-center">
							<span class="text-danger d-block trail_msg"><b class="weight">24</b>Days Left</span>
							 <a href="viewLiveTenderDetails?tender_Id=${tender.tender_Id}" class="btn btn-outline-info btn-sm"><i class="la la-info-circle"></i>view  Details</a>
						 </div>
						</div>
    </c:forEach>
    </c:if>
</div>               
				</div>
<!--					
			<!-- Pagination Section Start -->
				 <div class="pagination_design">
				 <nav aria-label="Page navigation example">
														<ul class="pagination">
															<li class="page-item">
																<a class="page-link" href="#" aria-label="Previous">
																	<span aria-hidden="true">«</span>
																	<span class="sr-only">Previous</span>
																</a>
															</li>
															<li class="page-item"><a class="page-link" href="#">1</a></li>
															<li class="page-item"><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															<li class="page-item"><a class="page-link" href="#">4</a></li>
															<li class="page-item"><a class="page-link" href="#">5</a></li>
															<li class="page-item"><a class="page-link" href="#">6</a></li>
															<li class="page-item">
																<a class="page-link" href="#" aria-label="Next">
																	<span aria-hidden="true">»</span>
																	<span class="sr-only">Next</span>
																</a>
															</li>
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
 
			 <jsp:include page="Footer.jsp"/>
                <!-- end:: Footer -->
            </div>

        </div>
    </div>
    <!-- Search Section -->

    <!--begin:: Global Mandatory Vendors -->
    <script src="<c:url value="/Homepage/vendors/jquery/dist/jquery.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/popper.js/dist/umd/popper.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/js-cookie/src/js.cookie.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/moment/min/moment.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/tooltip.js/dist/umd/tooltip.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/perfect-scrollbar/dist/perfect-scrollbar.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/wnumb/wNumb.js"/>" type="text/javascript"></script>
 
    <!--begin:: Global Optional Vendors -->
    <script src="<c:url value="/Homepage/vendors/jquery-form/dist/jquery.form.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/block-ui/jquery.blockUI.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/theme/framework/vendors/bootstrap-datepicker/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/theme/framework/vendors/bootstrap-timepicker/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-daterangepicker/daterangepicker.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-maxlength/src/bootstrap-maxlength.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-select/dist/js/bootstrap-select.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/typeahead.js/dist/typeahead.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/handlebars/dist/handlebars.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/inputmask/dist/jquery.inputmask.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/inputmask/dist/inputmask/inputmask.date.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/inputmask/dist/inputmask/inputmask.numeric.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/inputmask/dist/inputmask/inputmask.phone.extensions.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/nouislider/distribute/nouislider.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/owl.carousel/dist/owl.carousel.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/autosize/dist/autosize.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/clipboard/dist/clipboard.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/dropzone/dist/dropzone.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/summernote/dist/summernote.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/markdown/lib/markdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/bootstrap-markdown/js/bootstrap-markdown.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/theme/framework/vendors/bootstrap-markdown/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/jquery-validation/dist/jquery.validate.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/jquery-validation/dist/additional-methods.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/theme/framework/vendors/jquery-validation/init.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/toastr/build/toastr.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/raphael/raphael.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/morris.js/morris.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/chartist/dist/chartist.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/chart.js/dist/Chart.bundle.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/vendors/jquery-idletimer/idle-timer.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/waypoints/lib/jquery.waypoints.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/counterup/jquery.counterup.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/es6-promise-polyfill/promise.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/sweetalert2/dist/sweetalert2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/vendors/theme/framework/vendors/sweetalert2/init.js"/>" type="text/javascript"></script>

    <!--end:: Global Optional Vendors -->

    <!--begin::Global Theme Bundle -->
    <script src="<c:url value="/Homepage/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

    <!--end::Global Theme Bundle -->

    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
    <!--begin::Global Theme Bundle -->
    <script src="<c:url value="/Homepage/assets/demo/base/scripts.bundle.js"/>" type="text/javascript"></script>

    <!--end::Global Theme Bundle -->

    <!--begin::Page Vendors -->
    <script src="<c:url value="/Homepage/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/demo/custom/components/forms/widgets/bootstrap-select.js"/>" type="text/javascript"></script>

    <!--end::Page Vendors -->

    <script src="<c:url value="/Homepage/assets/demo/custom/components/base/popovers.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/app/scripts/custom/dashboard.js"/>" type="text/javascript"></script>

    <!--begin::Global App Bundle -->
    <script src="<c:url value="/Homepage/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/demo/custom/components/forms/widgets/dropzone.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/demo/jquery.repeater.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/assets/demo/repeater.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/assets/demo/scripts.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/demo/custom/components/forms/widgets/summernote.js"/>" type="text/javascript"></script>
    <!--begin::Page Vendors -->
    <script src="<c:url value="/Homepage/assets/vendors/custom/datatables/datatables.bundle.js"/>" type="text/javascript"></script>
    <!--begin::Page Scripts -->
    <script src="<c:url value="/Homepage/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script>
    <!--end::Page Vendors -->
    <!--begin::Page Scripts -->
    <!-- <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> -->
    <!--end::Page Scripts -->
    <!--end::Global Theme Bundle -->
    <script src="<c:url value="/Homepage/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/Homepage/assets/animationBorder/jquery.rollingBorder.js"/>" type="text/javascript"></script>

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
			
			$('#demo').carousel({
				interval: false
			});
        </script>

 

</body>

</html>