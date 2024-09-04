<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Procurelinc e-Procurement | Home</title>
    <!-- Favicon lotus procure -->
<!--    <link rel="shortcut icon" href="<c:url value="/resources/assets/demo/media/favicon.ico"/>" />  -->
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
<div id="preloaderSpinner" class="preloader spinner">
    <div class="spinWrap">
        <p class="spinnerImage"></p>
        <p class="loader"></p>
        <p class="loadingMessage" id="spinnerMessage"></p>
    </div>
</div> 
        <!-- begin:: Page -->

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
                            <a href="index.html">
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
                        <jsp:include page="Tiles/AdminHeader.jsp"/>

                        <!-- end:: Header Topbar -->
                    </div>

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">Department Admin</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <!--<span class="k-content__head-breadcrumb-separator"></span>-->
                                    <!--<a href="" class="k-content__head-breadcrumb-link">Dashboards</a>-->

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
                          
                        </div>

                        <!-- end:: Content Head -->
                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">
                            <div class="row">
                                <!--begin::Portlet-->
                                <div class="col-lg-12">
                                    <div class="k-portlet">	
                                        <div class="k-portlet__body description_acc_tender">
                                            <div class="accordion accordion-outline">
                                               
                                                <table class="table table-striped- table-bordered table-hover tenderData1"> 
                                                    <thead>
                                                        <tr class="group tbl_row_bg"><td colspan="10" class="clearfix tbl_td_bg"><span class="pull-left tbl_head">DepartmentUser's Details</span>
                                                                    <a href="#" class="btn btn-sm btn-elevate btn-brand pull-right"  onclick="clearModal();Impmessage();"><i class="la la-plus-circle"></i><span>Add User's</span></a>
                                                               <!--<a href="#" class="btn btn-info"  onclick="clearModal();Impmessage();"><i class="fa fa-plus-circle"></i> <span>Add More</span></a>-->   
                                                                </td></tr>
                                                        <tr> 
                                                            <th>Name</th>
                                                    <th>Designation</th>
                                                    <th>Circle</th>
                                                    <th>Division</th>
                                                    <th>Subdivision</th>
                                                    <th>Action</th>
                                                    <th>Status</th>
                                                    <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="abcd">
                                                        
                                                        <tr ng-repeat="all_department in all_departments" current-page="currentPage" >
                                                        <td>{{ all_department.firstName}}</td>
                                                        <td>{{all_department.designations}}</td>
                                                        <td>{{all_department.circle}}</td>
                                                        <td>{{all_department.division}}</td>
                                                        <td>{{ all_department.subDivision}}</td>
                                                        <!--                                                     <td><center><a href="updateDepartmentUser?id={{all_department.reg_Id}}"><button  class="btn btn-primary">view/Edit</button></a></center></td>-->



                                                        <td ng-if="all_department.userType === 'primary' || all_department.userType === 'secondary'">
                                                            <span class="dropdown">
                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                              <i class="flaticon-menu-button"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end"> 
                                
                                <form action="updateDepartmentUserEditForm" id="editForm" method="post" >
                                    <input type="hidden" id="regid{{$index}}" name="id" value="{{all_department.reg_Id}}">
                                    <input type="hidden" name="action" value="readonly">
                                    <input type="hidden"  id="userType{{$index}}"  name="userType" value="{{all_department.userType}}">
                                    <button id="editFormbtn{{$index}}" hidden="true" type="submit"></button>
                                </form>
                          
                                <a class="dropdown-item" id="{{$index}}" onclick="update(this.id);" ><i class="flaticon-information"></i>View</a>
                                <!--<a class="dropdown-item" href="updateDepartmentUserEditForm?id={{all_department.reg_Id}}&action=readonly&userType={{all_department.userType}}"><i class="flaticon-information"></i>View</a>-->
                                
                            </div>
                                                            </span></td>

                                                <td ng-if="all_department.userType === 'true'">
 <span class="dropdown">
                            <a href="#" class="btn btn-hover-brand btn-icon btn-pill" data-toggle="dropdown" aria-expanded="false">
                              <i class="flaticon-menu-button"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" x-placement="top-end"> 
                                 <form action="updateDepartmentUserEditForm" id="editForm" method="post" >
                                     <input type="hidden"  id="regid{{$index}}"  name="id" value="{{all_department.reg_Id}}"/>
                                    <input type="hidden" name="action" value="readonly"/>
                                    <input type="hidden" name="userType" id="userType{{$index}}" value="{{all_department.userType}}"/>
                                    <button id="editFormbtn{{$index}}" hidden="true" type="submit"></button>
                                </form>
                                <a class="dropdown-item" id="{{$index}}" onclick="update(this.id);"><i class="flaticon-information"></i>View</a>
                                <!--<a class="dropdown-item" href="updateDepartmentUserEditForm?id={{all_department.secondory_reg_Id}}&action=readonly&userType={{all_department.userType}}"><i class="flaticon-information"></i>View</a>-->
                               
                            </div>
                                                            </span></td>
</td>  

                                                <td ng-if="all_department.userType === 'primary' || all_department.userType === 'secondary'"><div id="statuss{{all_department.reg_Id}}"> {{all_department.status}} </div> </td>
                                                <td ng-if="all_department.userType === 'true'"><div id="statuss{{all_department.secondory_reg_Id}}"> {{all_department.status}} </div> </td>
                                                <td> 
                                                    <div ng-if="all_department.status === 'Enable'">

                                                        <label class="k-switch k-switch--outline k-switch--icon k-switch--success">
                                                            <input ng-if="all_department.userType === 'primary' || all_department.userType === 'secondary'" type="checkbox" id="status{{all_department.reg_Id}}"  name="status" value="{{all_department.reg_Id}},{{all_department.userType}}" onclick="editStatus(this.value)" checked/>
                                                            <input ng-if="all_department.userType === 'true'" type="checkbox" id="status{{all_department.reg_Id}}"  name="status" value="{{all_department.secondory_reg_Id}},{{all_department.userType}}" onclick="editStatus(this.value)" checked/>
                                                            <span class="slider round"></span> </label>
                                                    </div>

                                                    <div ng-if="all_department.status === 'Disable'">

                                                        <label class="k-switch k-switch--outline k-switch--icon k-switch--success">
                                                            <label >
                                                                <input ng-if="all_department.userType === 'primary' || all_department.userType === 'secondary'" type="checkbox" id="status{{all_department.reg_Id}}"  name="status" value="{{all_department.reg_Id}},{{all_department.userType}}" onclick="editStatus(this.value)" />
                                                                <input ng-if="all_department.userType === 'true'" type="checkbox" id="status{{all_department.reg_Id}}"  name="status" value="{{all_department.secondory_reg_Id}},{{all_department.userType}}" onclick="editStatus(this.value)" />
                                                                <span class="slider round"></span></label>
                                                            </label>
                                                    </div>
                                                </td> 
                                                <!--<td><center><a href="updateDepartmentUserEditForm?id={{all_department.reg_Id}}&action=readonly"><button  class="btn btn-primary">Form Edit</button></a></center></td>-->                  
                                                <!--<td><center><button  class="btn btn-primary" ng-click="editDeptUser(all_department.reg_Id )">Update User</button></center></td>-->


                                                </tr>
                                                        
                                                                                                     </tbody>
                                                </table>
                                            </div>

                                            <!--end: Datatable -->

                                        </div>
                                    </div>         
                                </div>
                                <!--end::Portlet-->

                            </div>

                            <!--end::Row-->
                        </div>

                        <!-- end:: Content Body -->
                    </div>

                    <!-- end:: Content -->

                    <!-- begin:: Footer -->
<!--                    <div class="k-footer	k-grid__item k-grid k-grid--desktop k-grid--ver-desktop">
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

                <jsp:include page="Tiles/QuickPanel.jsp"/>

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
        <jsp:include page="Tiles/AsideNavSecondary.jsp"/>
        
        

        
        <input type="hidden" id="openModel" data-toggle="modal" data-target="#myModalforImpNotice"/>
 <input type="hidden" id="openModel1" data-toggle="modal" data-target="#myModaldetail"/>
        
        
        
        
        <div class="modal fade mdl-bg" id="myModaldetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="/NewEprocurement/resources/assets/demo/media/logo-light.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Create Department User</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" id="close" onclick="clearHtml();">&times;</span>
                        </button>
                    </div>
                    <!--<form class="k-form">-->
                       <form class="k-form" modelAttribute="departmentUser" action="checkdepartment" id="form" enctype="multipart/form-data">
                        <div class="modal-body"> 
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Email Id</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <input type="text" class="form-control Email_Id" id="email" placeholder="Enter Email" name="emailAdd">
                                    <span id="errorEmail"></span>
                                    <input type="hidden"  id="validEmail" >
                                    <!--<input type="email" class="form-control" aria-describedby="emailHelp" placeholder="">-->
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Mobile No.</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <input type="text" class="form-control Mobile_No" id="mobile_no" placeholder="Enter Mobile No." name="mobNo">
                                     <span id="errorMobile_no"></span>
                                     <input type="hidden"  id="validContect"  >
                                    <!--<input type="email" class="form-control aria-describedby="emailHelp" placeholder="">-->
                                </div>
                            </div>
                          
                        </div>
   <div class="modal-footer">
                        <button type="button" class="btn btn-success  btn-sm" id="saveDept" onclick="checkdeptinfo();"  data-dismiss="modal" aria-label="Close" data-toggle="modal" data-target="#myModaldetail1">Submit</button>
                              
                        <button type="reset" id="reset" class="btn btn-primary btn-sm" onclick="clearHtml();">Reset</button>
                                <button type="button" class="btn btn-secondary btn-sm" aria-label="Close" data-dismiss="modal" onclick="clearHtml();" >Close</button> 
                                
                </div>
                        </form>
                 
                </div>
                
                
            </div>
        </div>
 <input type="button" hidden="true" id="checkdeptinfo"  data-toggle="modal" data-target="#myModaldetail1">
        <div class="containeri8ui8i">
                        <div class="modal fade" id="myModaldetail1" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header1">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title categoryTitle"><img src="/NewEprocurement/resources/assets/demo/media/logo-light.png" alt="Department logo"></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="subdivisoncreate">

                                            <div class="col-md-12">
                                                <div class="inputfield_division" >
                                                    <form action="addnewdepartment" class="createdivison" style="padding: 28px 57px;" method="post">


                                                        <div class="form-group row">
                                                            <p class="msg-User">
                                                                <span class="text-danger" id="userName"></span> is already registered with  <span id="userdept" class="text-danger"></span> Department.<br>
                                                                Do You Want to Register This User With <span class="text-danger" id="sessionDept"></span>  Department ?

                                                            </p>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-sm-12">
                                                                <div class="text-center">
                                                                    <input type="hidden" id="user2reg_id" name="red_id">
                                                                   
                                                                    <button type="submit" class="btn btn-success">Add</button>
                                                                    <button type="button" class="btn btn-danger"  data-dismiss="modal"  data-toggle="modal" data-target="#myModaldetail">Reset</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        
        <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <div class="modal fade" id="myModalforImpNotice" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Notifications</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body notification_md">
                    <div class="k-portlet__body">
                      	
							
							
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
							</style>
								<div class="important_note">
							<div class="row">
								<div class="col-md-12">
                                                                      <c:if test="${designationList=='size is zero'}" >
                                 			<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="flaticon-bell k-font-info"></i></div>
														<div class="alert-text">
                                                                                                                    <span class="deptName d-block"></span> 
															<span class="d-block">Department don't have any Designations</span> <a href="#">Please Click Here to Add</a>
														</div>
													</div>
												</div> </c:if>
								</div>
								<div class="col-md-12">
							              <c:if test="${circleList=='size is zero'}" >
                                 			<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="flaticon-bell k-font-info"></i></div>
														<div class="alert-text">
                                                                                                                    <span class="deptName d-block"></span> 
															<span class="d-block">Department don't have any Circle</span> <a href="#">Please Click Here to Add</a>
														</div>
													</div>
												</div> </c:if>
								</div>
								<div class="col-md-12">
							              <c:if test="${divisionList=='size is zero'}" >
                                 			<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="flaticon-bell k-font-info"></i></div>
														<div class="alert-text">
                                                                                                                    <span class="deptName d-block"></span> 
															<span class="d-block">Department don't have any Division</span> <a href="#">Please Click Here to Add</a>
														</div>
													</div>
												</div> </c:if>
								</div> 
                                                            <div class="col-md-12">
							              <c:if test="${subDivisionList=='size is zero'}" >
                                 			<div class="form-group form-group-last">
													<div class="alert alert-secondary" role="alert">
														<div class="alert-icon"><i class="flaticon-bell k-font-info"></i></div>
														<div class="alert-text">
                                                                                                                    <span class="deptName d-block"></span> 
															<span class="d-block">Department don't have any SubDivision</span> <a href="#">Please Click Here to Add</a>
														</div>
													</div>
												</div> </c:if>
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
   
         
        <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

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

        <script src="<c:url value="/resources/assets/vendors/custom/datatables/datatables.bundle.js"/>" type="text/javascript"></script>

        <script src="<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script>
        <!--begin::Global App Bundle -->
        <script src="<c:url value="/resources/assets/app/scripts/bundle/app.bundle.js"/>" type="text/javascript"></script>

        <!--end:: Global Optional Vendors -->


        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-datetimepicker.js"/>" type="text/javascript"></script>


        <!--begin::Page Vendors -->
        <script src="<c:url value="/resources/assets/demo/custom/components/datatables/advanced/row-grouping.js"/>" type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/forms/widgets/bootstrap-select.js"/>"  type="text/javascript"></script>

        <!--end::Page Vendors -->

        <script src="<c:url value="/resources/assets/demo/custom/components/base/popovers.js"/>"  type="text/javascript"></script>
        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/app/scripts/custom/dashboard.js"/>"  type="text/javascript"></script>



        <!--begin::Page Scripts -->
        <script src="<c:url value="/resources/assets/demo/custom/components/calendar/basic.js"/>" type="text/javascript"></script>
       
<script src="<c:url value="/resources/angular/DepartmentUserScript.js" />"></script>

        <!--begin::Global Theme Bundle -->

    </body>
    <!-- end::Body -->
    <script>
$(document).ready(function() {
    $('.tenderData').DataTable();
} );
</script>

<script>
            $(document).ready(function () {
//                alert("Manage Department User");
                $('.search').on('keyup', function () {
                    var searchTerm = $(this).val().toLowerCase();
                    $('#abcd tr').each(function () {
                        var lineStr = $(this).text().toLowerCase();
                        if (lineStr.indexOf(searchTerm) === -1) {
                            $(this).hide();
                        } else {
                            $(this).show();
                        }
                    });
                });
            });
            
            
            function update(id){
//                alert("id "+id);
                        var regid=$('#regid'+id).val();
                        var userType=$('#userType'+id).val();
                        
//                        alert("id "+regid+" and UserType "+userType);
                 $.ajax({
                    url: "viewEdit?id="+regid+"&userType="+userType,
                   
                    success: function (res) {
                         alert(res);
                        
                       
                    }
                    
                });

               $('#editFormbtn'+id).click();
                
            }
        </script>
    <script>
        $(document).ready(function () {
//            alert("welcome");
    //function checkEmail_Mobile(){
            $("#email").change(function () {
                var email = $("#email").val();
                var checkValidEmail1=checkValidEmail(email);
                  alert("checkValidEmail "+checkValidEmail1);
             if(checkValidEmail1==true){
                   $.ajax({
                    url: "checkUserEmail",
                    data: {email: email},
                    success: function (res) {
//                         alert(res);
                        if (res != "valid Email") {
//                             alert("done");
                            $("#errorEmail").css('color', 'red');
                            $("#errorEmail").html("Email address is already exist");
                            $("#validEmail").val(res);
                            $("#email").append(res);
                            $("#saveDept").attr('disabled', 'disabled');

                        } else {
                            $("#errorEmail").css('color', 'red');
                            $("#errorEmail").html("");
                             $("#validEmail").val(res);
                            $("#email").append(res);
                            $('#saveDept').removeAttr('disabled');
                        }
                    }
                });  
                 }else{
                           $("#errorEmail").css('color', 'red');
                            $("#errorEmail").html("Enter Valid Email");
                            $("#validEmail").val("res");
                            $("#email").append("res");
                            $("#saveDept").attr('disabled', 'disabled');
             }
            });

            $("#mobile_no").change(function () {

                var mobile_no = $("#mobile_no").val();
                var mobileValid=checkValidContect(mobile_no);
//                alert("mobileValid "+mobileValid);
                if(mobileValid==true){
                 $.ajax({
                    url: "checkUserContacts",
                    data: {mobile_no: mobile_no},
                    success: function (res) {
                        // alert(res);
                        if (res != "valid mobile_no") {
                            // alert("done");
                            $("#errorMobile_no").css('color', 'red');
                            $("#errorMobile_no").html("Mobile No. is already exist");
                            $("#validContect").val(res);
                            $("#mobile_no").append(res);
                            $("#saveDept").attr('disabled', 'disabled');
                            return false;
                        } else {
                            $("#errorMobile_no").css('color', 'red');
                            $("#errorMobile_no").html("");
                             $("#validContect").val(res);
                            $("#mobile_no").append(res);
                        }

                    }
                }); 
                }else{
                            $("#errorMobile_no").css('color', 'red');
                            $("#errorMobile_no").html("Enter Valid Mobile No.");
                            $("#validContect").val("notValid");
                            $("#mobile_no").append("notValid");
                            $("#saveDept").attr('disabled', 'disabled');
                }
            });
        });
        
        
        function checkValidEmail(email){
           var emailvalid = new RegExp("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");  
           if(emailvalid.test(email)){
                return true;
           }else{
               return false;
           } 
            
        }
        function checkValidContect(mobno){
           var contectValid = new RegExp('^([0-9]){10}$');  
           if(contectValid.test(mobno)){
                return true;
           }else{
               return false;
           } 
            
        }
    
    </script>
    <script>
        function editStatus(reg_Id) {
//                           alert(reg_Id);
            var status = $('#status' + reg_Id).is(':checked');

//             var status = $('#status' + id).is(':checked');
            swal({
                title: 'Are you sure?',
                text: "You want to change the status",
                type: 'question',
                showCancelButton: true,
                confirmButtonText: 'Yes',
                cancelButtonText: 'No',
                showLoaderOnConfirm: true,
                reverseButtons: true,
                allowOutsideClick:false,
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
                            url: "statusValue",
                            data: {'reg_Id': reg_Id, 'status': status},
                            success: function (response) {
//                     alert(response);
                                $('#statuss' + reg_Id).html(response);
                            }
                        });
                    } else if (status === false) {
//                    alert("disable");

                        status = "Disable";

                        $.ajax({
                            type: "GET",
                            url: "statusValue",
                            data: {'reg_Id': reg_Id, 'status': status},
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
                    if (status === true) {
                        $('#status' + reg_Id).prop('checked', false);
                    } else {
                        $('#status' + reg_Id).prop('checked', true);
                    }
                }
            })
        }



        function checkdeptinfo() {
//alert("checkdeptinfo");
            var dept = '<%= session.getAttribute("deptName")%>'
            var form = $("form").serialize();
            var validEmail=$('#validEmail').val();
            var validContect=$('#validContect').val();
            
            if(validEmail=='valid Email' && validContect=='valid mobile_no'){
               $.ajax({
                type: "GET",
                url: "checkdepartment",
                data: form,
                success: function (response) {

//                        alert("  "+response);
                    if (response === 'valid Email') {
                        $("#close").click();
                        window.location.href = 'register';
                    }
                    if (response === "exists as secondary") {
                        $("#close").click();
                        alert("This User is already exists in " + dept + " Department");

                    }

                    var obj = JSON.parse(response);

                    $.each(obj, function (key, value) {
                        if (response !== null || response !== '') {
                            if (value.deptName === dept) {
                                $("#close").click();
//                                alert(value.firstName + " is already exists in " + dept + " Department");

                            } else {
                                  $('#checkdeptinfo').click();
                                $("#userName").append(value.firstName);
                                $("#user2reg_id").val(value.reg_Id);
                                $("#userdept").append(value.deptName);
                                $("#sessionDept").append(dept);

                            }
                        }

                    });
                }

            });  
                
                
            }else{
                
               alert("Enter Valid Email or Contect") 
                    $("#saveDept").attr('disabled', 'disabled'); 
            }
//                    alert(dept);
           
        }
        function clearModal() {

            $('#reset').click();
        }
        function Impmessage() {

//           alert("IMP MSG");

            var deptName = "<%= session.getAttribute("deptName")%>";
//            alert("deptName "+deptName);
            $(".deptName").html(deptName);
            var designationList = '<c:out value="${designationList}"/>';
//            alert(designationList);
            var circleList = '<c:out value="${circleList}"/>';
//            alert(circleList);
            var divisionList = '<c:out value="${divisionList}"/>';
//            alert(divisionList);
            var subDivisionList = '<c:out value="${subDivisionList}"/>';
//            alert(subDivisionList);
            if (designationList === 'size is zero' || circleList === 'size is zero' || divisionList === 'size is zero' || subDivisionList === 'size is zero') {
             $(".close").click();
//         alert(designationList+" "+circleList+" "+divisionList+" "+subDivisionList);    
                $("#openModel").click();
            } else {


                $("#openModel1").click();
            }
        }
        
        
        function clearHtml(){
//           alert("clearHtml");
          $('#errorEmail').html("");
          $('#errorMobile_no').html("");
          
            
        }
    </script>

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
<script>
    $(function(){$(".preloader").fadeOut(2000,function(){$(".loader_main").fadeIn(1000);});});
</script>
</html>
