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
                                    <h3 class="k-content__head-title">Product Category / SubCategory</h3>
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
                                    <div class="col-md-6">
                                        <div class="k-portlet alert_part circle_create"> 
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon " data-toggle="modal" data-target="#myModal">
                                                        <i class="flaticon-add"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">Product Category</h3>
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
                                                                            <input type="text" value="" class="form-control" placeholder="Search..." onkeyup="myFunctionProductCat()" name="search" id="search1" >
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
                                                <div class="k-notification k-scroll k-scroller ps ps--active-y" id="categoryDiv" data-scroll="true" data-height="400" style="height: 400px; overflow: hidden;">
                                                   <div class="text-center"> 
                                                    <span class="contentNotFound">{{msg_ProductCat}}</span>
                                                    </div>
                                                    <a href="#" class="k-notification__item" ng-repeat="x in productcategories">
                                                        <div class="k-notification__item-icon" data-toggle="modal" data-target="#myModal">
                                                            <i class="la la-edit"  ng-click="productCategoryUpdate(x.productCategoryId);"></i>
                                                        </div>
                                                        <style>  
                                                            .productcategory0{
                                                                color:#5867dd !important;
                                                            }
                                                        </style>
                                                        <div class="k-notification__item-details">
                                                            <div class="k-notification__item-title">
                                                                <span id="productCategoryId" class="productcategory{{$index}}" role="tab" data-toggle="tab" ng-class="{'active': $index == activeTab}" ng-click="getProductSubCategory(x.productCategoryId);">{{x.productCategoryName}}</span>
                                                            </div>

                                                        </div>
                                                        <div class="k-notification__item-icon" >
                                                            <button ng-click="ProductCategoryAlert(x.productCategoryId)" style="border: none; cursor: pointer; background-color:#F3F6F4;"><i class="la la-archive"></i></button>
                                                        </div>
                                                    </a> 
                                                </div> 
                                                <div class="text-center mb-2 mt-2">
                                                    <button type="button" class="btn btn-primary btn-sm" id="addProductCategory" data-toggle="modal" data-target="#myModal" ng-click="openModal(this.id)"><i class="flaticon-add-circular-button"></i>Add Product Category</button>
                                                </div>
                                            </div> 
                                        </div>
                                    </div><!--end::Portlet-->
                                    <div class="col-md-6">
                                        <div class="k-portlet alert_part circle_create"> 
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon" data-toggle="modal" data-target="#myModal2">
                                                        <i class="flaticon-add"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">Product SubCategory</h3>
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
                                                                            <input type="text" name="query" value="" class="form-control" placeholder="Search..." onkeyup="myFunctionProdSubCat()" name="search" id="search2">
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
                                                <div class="k-notification k-scroll k-scroller ps ps--active-y" id="prCategoryDiv" data-scroll="true" data-height="400" style="height: 400px; overflow: hidden;">
                                                    <div class="text-center"> 
                                                    <span class="contentNotFound">{{msg_ProductCat}}</span>
                                                    </div>
                                                    <a href="#" class="k-notification__item" ng-repeat="y in productsubcategories">
                                                        <div class="k-notification__item-icon" data-toggle="modal" data-target="#myModal2">
                                                            <i class="la la-edit"  ng-click="productSubCategoryUpdate(y.productSubCategoryId);"></i>
                                                        </div>
                                                        <style>  
                                                            .productsubcategory0{
                                                                color:#5867dd !important;
                                                            }
                                                        </style>
                                                        <div class="k-notification__item-details">
                                                            <div class="k-notification__item-title">
                                                                <span id="productSubCategoryId"  class="productsubcategory{{$index}}" role="tab" data-toggle="tab" ng-class="{'active': $index == activeTab}" >{{y.productSubCategoryName}}</span>
                                                            </div>

                                                        </div>
                                                        <div class="k-notification__item-icon" >
                                                            <button ng-click="ProductSubCategoryAlert(y.productSubCategoryId)" style="border: none; cursor: pointer; background-color:#F3F6F4;"><i class="la la-archive"></i></button>
                                                        </div>
                                                    </a> 
                                                </div> 
                                                <div class="text-center mb-2 mt-2">
                                                    <button type="button" class="btn btn-primary btn-sm" id="addProductSubCategory" data-toggle="modal" data-target="#myModal2" ng-click="openModal(this.id)"><i class="flaticon-add-circular-button"></i>Add Product SubCategory</button>
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
                <jsp:include page="Tiles/AsideNavSecondary.jsp"></jsp:include>
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
        <jsp:include page="Tiles/QuickPanel.jsp"></jsp:include>

            <!-- end::Quick Panel -->
            <div class="modal fade mdl-bg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header pd-header">
                            <h5 class="modal-title logo-modal"> 
                                <a href="#" class="dpt_logo">
                                    <img alt="Department Logo" src="assets/demo/media/logo-dark.png" class="logo-width">
                                </a>
                                <span class="dpt_name_logo">Create Product Category</span></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <form:form class="k-form" modelAttribute="pcategory" id="prodcatform">
                        <div class="modal-body">
                            <form:hidden path="productCategoryId" id="idproductcategory"/>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Product Category</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <form:input path="productCategoryName"  id="target1"  style="text-transform: uppercase;" class="form-control"/>
                                    <span id="errorPcategory"></span>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success btn-sm" ng-click="saveProductCategory();">Add</button>
                            <button type="button" class="btn btn-primary btn-sm">Reset</button>
                            <button type="button" class="btn btn-secondary btn-sm" id="prcatBTN" data-dismiss="modal">Close</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

        <div class="modal fade mdl-bg" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header pd-header">
                        <h5 class="modal-title logo-modal"> 
                            <a href="#" class="dpt_logo">
                                <img alt="Department Logo" src="assets/demo/media/logo-dark.png" class="logo-width">
                            </a>
                            <span class="dpt_name_logo">Create Product SubCategory</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <form:form action="#" class="k-form" modelAttribute="productSubCategory" id="prosubcatform">
                        <div class="modal-body">
                            <div class="form-group row">
                                <form:hidden path="productCategoryId" id="idproCategory"/>
                                <form:hidden path="productSubCategoryId" id="Id_productSubCategory"/>
                                <label class="col-form-label col-lg-3 col-sm-12">Product Category</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <span class="ValidationMsg" id="productCategoryNameError1" style="color:red;"></span>
                                    <form:select path="productCategoryId" id="prcategory" class="form-control">
                                        <form:option value="">Select</form:option>
                                        <form:option ng-repeat="x in productcategories" value="{{x.productCategoryId}}">{{x.productCategoryName}}</form:option>
                                    </form:select>
                                    <span id="errorPrCategory"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-lg-3 col-sm-12">Product SubCategory</label>
                                <div class="col-lg-9 col-md-9 col-sm-12">
                                    <span class="ValidationMsg" id="productSubCategoryNameError1" style="color:red;"></span>
                                    <form:input path="productSubCategoryName" class="form-control" placeholder="Enter productSubCategoryName" id="pscategory"  style="text-transform: uppercase;"/>
                                    <span id="errorprSubCategory"></span>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success btn-sm" ng-click="saveProductSubCategory();">Add</button>
                            <button type="button" class="btn btn-primary btn-sm">Reset</button>
                            <button type="button" class="btn btn-secondary btn-sm" id="prscatBTN" data-dismiss="modal">Close</button>
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

                    function pcategoryValidation() {
                        var alphNumerc = new RegExp('[A-Za-z ]+$');
                        var countError = 0;
                        var pcaterory = $("#target1").val();
                        pcaterory = pcaterory.trim();
                        if (pcaterory === null || pcaterory === "") {
                            $("#errorPcategory").css('color', 'red');
                            $("#errorPcategory").html("Please Enter Product Category Name");
                            countError++;
                        }
//                        else if (pcaterory !== alphNumerc) {
//                            alert("alphNumerc");
//                            $("#errorPcategory").css('color', 'red');
//                            $("#errorPcategory").html("Special Symboles are not allowed");
//                            countError++;
//                        } 
                        else {
                            $("#errorPcategory").html("");
                        }
                        return countError;
                    }

                    function pSubValidation() {
//                        alert("validation called");
                        var alphNumerc = /'[A-Za-z ]+$'/;
                        var countError = 0;
                        var prcategory = $("#prcategory").val();
                        var pscategory = $("#pscategory").val();
                        if (prcategory === null || prcategory === "") {
                            $("#errorPrCategory").css('color', 'red');
                            $("#errorPrCategory").html("Please select Product Category");
                            countError++;
                        } else {
                            $("#errorPrCategory").html("");
                        }
                        if (pscategory === null || pscategory === "") {
                            $("#errorprSubCategory").css('color', 'red');
                            $("#errorprSubCategory").html("Please Enter Product Sub Category Name");
                            countError++;
                        } else {
                            $("#errorprSubCategory").html("");
                        }
//                         if (pscategory !== alphNumerc) {
//                            alert("alphNumerc");
//                            $("#errorprSubCategory").css('color', 'red');
//                            $("#errorprSubCategory").html("Special Symboles are not allowed");
//                            countError++;
//                        } 
//                        else {
//                            $("#errorprSubCategory").html("");
//                        }
                        return countError;
                    }

                    function myFunctionProductCat() {
                        var input, filter, a, i, div, span;
                        input = document.getElementById("search1");
                        filter = input.value.toUpperCase();
                        div = document.getElementById("categoryDiv");
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

                    function myFunctionProdSubCat() {
                        var input, filter, a, i, div, span;
                        input = document.getElementById("search2");
                        filter = input.value.toUpperCase();
                        div = document.getElementById("prCategoryDiv");
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


    </body>
    <!-- end::Body -->

</html>
