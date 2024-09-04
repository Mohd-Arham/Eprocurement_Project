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
                                    <h3 class="k-content__head-title">Upload SOR</h3>
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
                                    <div class="col-md-12">
                                        <div class="k-portlet alert_part circle_create"> 
                                            <div class="k-portlet__head">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon ">
                                                        <i class="flaticon-add"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">Upload SOR</h3>
                                                </div> 
                                            </div>
                                            <div class="k-portlet__body">

                                            <form:form action="uploadSor" name="uploadSorform" method="post" class="k-form" onsubmit="return validateform()" enctype="multipart/form-data" modelAttribute="SOR" >
                                                <div class="form-group row">
                                                    <label for="example-text-input" class="col-2 col-form-label">SOR Name</label>
                                                    <div class="col-10">
                                                        <form:hidden path="id" />
                                                        <form:input path="fileName" id="fileName" name="fileName" class="form-control" placeholder="SOR Name"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="example-text-input" class="col-2 col-form-label">Upload SOR</label>
                                                    <div class="col-10">
                                                        <span id="spanid2" style="color: red;margin-left: 10px"></span>
                                                        <div class="custom-file">
                                                            <input type="file" name="file" class="custom-file-input" id="upload" onchange="uploadFile();">
                                                            <!--<input type="file" name="file" id="upload" class="custom-file-label" onchange="uploadFile();" >-->
                                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group text-center">
                                                    <button type="submit" class="btn btn-success btn-sm">Submit</button>
                                                    <button type="reset" class="btn btn-primary btn-sm">Reset</button>
                                                </div> 
                                            </form:form> 
                                        </div>
                                    </div>
                                </div><!--end::Portlet-->
                            </div>
                            <!--end::Row-->
                            <!--begin::Row-->

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="k-portlet alert_part circle_create">  
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon ">
                                                    <i class="flaticon-add"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">Available SOR Documents</h3>
                                            </div> 
                                        </div>
                                        <div class="k-portlet__body">
                                            <table class="table table-bordered m-table">
                                                <thead>
                                                    <tr class="tbl_td_bg">
                                                        <th>SOR Name</th>
                                                        <th>Upload SOR File Name</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="dc" items="${SorList}">
                                                        <tr>
                                                            <td><span class="sor_name">${dc.fileName}</span></td>
                                                            <td><span class="filename"><a href="${dc.fileUrl}/resources/UploadedDocuments/sorDocs/${dc.fileconvertedName}" target="_blank" class="k-link">${dc.fileName}</a></span></td>

                                                            <td> 
                                                                <span class="status_sor"><span class="k-switch k-switch--outline k-switch--icon k-switch--success">
                                                                        <c:if test="${dc.status=='Enable'}">
                                                                            <label>
                                                                                <!--<input type="checkbox" checked="checked" name="">-->
                                                                                <input type="checkbox" id="status${dc.id}" name="status" onchange="myfunction(${dc.id})" checked>
                                                                                <span></span>
                                                                            </label>
                                                                        </c:if>
                                                                        <c:if test="${dc.status=='Disable'}">
                                                                            <label>
                                                                                <!--<input type="checkbox" checked="checked" name="">-->
                                                                                <input type="checkbox" id="status${dc.id}" name="status" onchange="myfunction(${dc.id})" checked>
                                                                                <span></span>
                                                                            </label>
                                                                        </c:if>
                                                                    </span>
                                                                </span>

                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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

        <script>
                    function myfunction(id) {
                        var status = $('#status' + id).is(':checked');
                        swal({
                        title: 'Are you sure?',
                                text: "You want to change the status",
                                type: 'question',
                                showCancelButton: true,
                                confirmButtonText: 'Yes',
                                cancelButtonText: 'No',
                                showLoaderOnConfirm: true,
                                reverseButtons: true,
                                allowOutsideClick: false
                        }).then((result) = > {
                        if (result.value) {
                            swal(
                                    'Changed',
                                    'Your Status Has Been Changed',
                                    'success'
                                    )
                            //  var status = $('#status' + id).is(':checked');
                            if (status === true) {
                                //  alert("Your Status Is Enabled");
                                status = "Enable";
                                id = parseInt(id);
                                $.ajax({
                                    url: "statusForUploadSor",
                                    data: {'id': id, 'status': status},
                                    success: function (response) {
                                        // alert(response);
                                        return true;
                                    },
                                    error: function (e) {
                                        // alert('Error: ' + e);

                                    }
                                });

                            }
                            else {
                                //  alert("Your Status Is Disabled");
                                status = "Disable";
                                id = parseInt(id);
                                $.ajax({
                                    url: "statusForUploadSor",
                                    data: {'id': id, 'status': status},
                                    success: function (response) {
                                        //alert(response);
                                        return true;
                                    },
                                    error: function (e) {
                                        //   alert('Error: ' + e);

                                    }
                                });
                            }
                        }
                        else if (
// Read more about handling dismissals
                                result.dismiss === swal.DismissReason.cancel
                                ) {
                            swal(
                                    'Cancelled',
                                    'Your Status has not changed',
                                    'error'
                                    )
                            if (status === true) {
                                $('#status' + id).prop('checked', false);
                            }
                            else {
                                $('#status' + id).prop('checked', true);
                            }
                        }
                        }
                        )
                    }
        </script>
        <script>
                    function validateform() {
//             document.getElementById("spanid1").innerHTML = "";
//              document.getElementById("spanid2").innerHTML = " ";
//alert("validation");
                        var name = document.forms["uploadSorform"]["fileName"].value;
                        
                        var upload = document.forms["uploadSorform"]["upload"].value;
                 
                        if (name == "") {
                            document.getElementById("spanid1").innerHTML = "Please Enter Sor Document Name";
                                    return  false;
                        }
                        else {
                            document.getElementById("spanid1").innerHTML = "";
                        }
                        if (!/^[a-zA-Z0-9 ]*$/.test(document.uploadSor.fileName.value)) {
                            document.getElementById("spanid1").innerHTML = "Special Characters are not Allowed";
                            return false;
                        }
                        else {
                            document.getElementById("spanid1").innerHTML = "";
                        }
                        if (upload == "") {
                            document.getElementById("spanid2").innerHTML = "Please Select a File";
                            return false;
                        }
                        else {
                            document.getElementById("spanid2").innerHTML = "";
                        }
                        
                        return true;
                    }

                    $(document).ready(function () {

                        var message = '<c:out value="${msg2}"></c:out>';
                        if (message !== "") {
                            swal(
                                    '',
                                    message,
                                    'success'
                                    )
                        }
                        var message = '<c:out value="${msg1}"></c:out>';
                        if (message !== "") {

                            swal(
                                    '',
                                    message,
                                    'error'
                                    )
                        }
                    });


        </script>

<script>
                    function uploadFile(){
                        document.getElementById("spanid2").innerHTML = " ";
                        var validFile=checkPdfFile('upload');
                        var file=document.getElementById("upload").files[0];
                        var formData = new FormData();
                        formData.append('file', file);
                         if (validFile == true){
                       // alert("upload file function call : "+file);
                         $('#errorPDF').html("");
                        $.ajax({
                            url:'uploadFile',
                            data : formData,
                            method:'POST',
                            processData: false,
                            contentType : false,
                            success: function (response) {
                         // alert("response : "+response);
                             $("#showDocument").html(response);
                            }, error: function  (error) {
                                alert("error : "+error);
                            }
                        });
                         }
                     }
                     
                 
                    function checkPdfFile(validfile)
                       {

                   //  alert("checkpdf file");
                    var fileID = validfile;
                   //  alert("id is:" + validfile );
                    var fileName = document.getElementById(fileID).value;
                    //alert("filename is:" + fileName);
                    var fileSize = document.getElementById(fileID).files[0].size;
                    fileSize = parseInt(fileSize);
                   var format = fileName.substring(fileName.lastIndexOf('.') + 1);
                  if (!format.match("pdf") && !format.match("PDF")) {
                 document.getElementById("errorPDF").innerHTML = "Please Upload Valid pdf file";
                    return false;
              }
             else if (fileSize > 10485760) {
            document.getElementById("errorPDF").innerHTML = "File Size must be less then 10MB.";
                    return false;
            } else if (fileName = '') {

            document.getElementById("errorPDF").innerHTML = "";
                    return false;
            } else {
            alert("Valid pdf File");
            return true;
            }
          return true;
            }
  </script>
    </body>
    <!-- end::Body -->

</html>
