<!DOCTYPE html>

<html lang="en" ng-app="myApp">

    <!-- begin::Head -->
  <head>
        <meta charset="utf-8" />
        <title>Contractor Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
           <%@include file="../Contractor/Tiles/csslink.jsp" %>  
    </head> 
    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled"  ng-controller="myCtrl"> 
        <!-- Modal -->
        <div class="modal fade" id="contractor_notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:63%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Digital Signature Certificate (DSC) Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body notification_md">
                        <div class="k-portlet__body">
                            <table class="table table-bordered tenderData"> 
                                <thead> 
                                    <tr class="table_th tbl_row_bg"> 
                                        <th class="k-font-bolder">Certificate Type</th>
                                        <th class="k-font-bolder">Status</th>
                                        <th class="k-font-bolder">Verify Certificate</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table_data_viewDSC">
                                        <td><p class="td_data">Signing</p></td>
                                        <td><p class="td_data">Verified</p></td>
                                        <td><p class="td_data"><a href="#" class="btn btn-info btn-sm">Verify Now</a></p></td>										
                                    </tr>
                                    <tr class="table_data_viewDSC">
                                        <td><p class="td_data">Encryption</p></td>
                                        <td><p class="td_data">Not Verified</p></td> 
                                        <td><p class="td_data"><a href="#" class="btn btn-info btn-sm">Verify Now</a></p></td>
                                    </tr> 
                                </tbody>
                            </table>



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
                                .important_note .alert .alert-text{
                                    font-weight:600;
                                }
                            </style>
                            <div class="important_note">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group form-group-last">
                                            <div class="alert alert-secondary" role="alert">
                                                <div class="alert-icon"><i class="flaticon-close k-font-danger"></i></div>
                                                <div class="alert-text">
                                                    Not Verified / Revoked
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-group-last">
                                            <div class="alert alert-secondary" role="alert">
                                                <div class="alert-icon"><i class="flaticon-exclamation-1 k-font-warning"></i></div>
                                                <div class="alert-text">
                                                    About to Expired
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group form-group-last">
                                            <div class="alert alert-secondary" role="alert">
                                                <div class="alert-icon"><i class="fa fa-check-circle k-font-success fa_lineheight"></i></div>
                                                <div class="alert-text">
                                                    Verified & Valid
                                                </div>
                                            </div>
                                        </div>
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
        <!-- begin::Global Config -->

        <!-- begin:: Page -->
        <!-- begin:: Page -->

        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="#">
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
                            <a href="#">
                                <img alt="Logo" src="resources/assets/demo/media/logo-light.png" style="max-width: 80%;" />
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
                    <%@include  file="../Contractor/Tiles/Header.jsp" %> 

                    <!-- end:: Header -->

                    <!-- begin:: Content -->
                    <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                        <!-- begin:: Content Head -->
                        <div class="k-content__head	k-grid__item">
                            <div class="k-content__head	k-grid__item">
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">Contractor Details</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                    <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                                </div>
                            </div>
                         </div>
                           
                        </div>

                        <!-- end:: Content Head -->



                        <!-- begin:: Content Body -->
                        <div class="k-content__body	k-grid__item k-grid__item--fluid">

                            <!--begin::Row-->
                            <div class="row">

                                <div class="col-xl-4 col-xxl-4 order-xxl-1">

                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                        <div class="k-portlet__body">
                                            <div class="k-widget-10__wrapper">
                                                <div class="k-widget-10__details">
                                                    <div class="k-widget-10__title">Total Tender</div>
                                                    <div class="k-widget-10__desc">December 2018</div>
                                                </div>
                                                <div class="k-widget-10__num">
                                                    7599
                                                </div>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body k-portlet__body--fit">
                                            <div class="k-widget-10__chart">
                                                <canvas id="k_widget_mini_chart_1" height="100"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                    <!--end::Portlet-->
                                </div>
                                <div class="col-xl-4 col-xxl-4 order-xxl-1">

                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                        <div class="k-portlet__body">
                                            <div class="k-widget-10__wrapper">
                                                <div class="k-widget-10__details">
                                                    <div class="k-widget-10__title">Tender Purchase</div>
                                                    <div class="k-widget-10__desc">December 2018</div>
                                                </div>
                                                <div class="k-widget-10__num">
                                                    7,300
                                                </div>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body k-portlet__body--fit">
                                            <div class="k-widget-10__chart">
                                                <canvas id="k_widget_mini_chart_2" height="100"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                    <!--end::Portlet-->
                                </div>
                                <div class="col-xl-4 col-xxl-4 order-xxl-1">

                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid k-widget-10">
                                        <div class="k-portlet__body">
                                            <div class="k-widget-10__wrapper">
                                                <div class="k-widget-10__details">
                                                    <div class="k-widget-10__title">Participate</div>
                                                    <div class="k-widget-10__desc">December 2018</div>
                                                </div>
                                                <div class="k-widget-10__num">
                                                    1958
                                                </div>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body k-portlet__body--fit">
                                            <div class="k-widget-10__chart">
                                                <canvas id="k_widget_mini_chart_3" height="100"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                    <!--end::Portlet-->
                                </div>


                                <div class="col-xl-4 col-xxl-4 order-xxl-2">
                                    <!--begin::Portlet-->
                                    <div class="k-portlet k-portlet--height-fluid k-portlet--tabs">
                                        <div class="k-portlet__head" style="    padding: 0 10px;">
                                            <div class="k-portlet__head-label">
                                                <h3 class="k-portlet__head-title">
                                                    Work Progress
                                                </h3>
                                            </div>
                                            <div class="k-portlet__head-toolbar">
                                                <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-brand nav-tabs-bold" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active show" data-toggle="tab" href="#k_portlet_tabs_1111_1_content" role="tab" aria-selected="false">
                                                            Tender
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_tabs_1111_2_content" role="tab" aria-selected="false">
                                                            Auction	
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body">
                                            <div class="tab-content">
                                                <div class="tab-pane fade active show" id="k_portlet_tabs_1111_1_content" role="tabpanel">
                                                    <div class="k-widget-11">
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    Pendings Tasks
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    78%
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    Completed Tasks
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    320&nbsp;/&nbsp;<span class="k-opacity-5">780</span>
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    Tasks In Progress
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    45%
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    All Tasks
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    1200
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- <div class="k-margin-t-30 k-align-center"> -->
                                                    <!-- <a href="#" class="btn btn-brand btn-upper btn-bold k-align-center">Full Report</a> -->
                                                    <!-- </div> -->
                                                </div>
                                                <div class="tab-pane fade" id="k_portlet_tabs_1111_2_content" role="tabpanel">
                                                    <div class="k-widget-11">
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    Pendings Tasks
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    78%
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    Completed Tasks
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    320&nbsp;/&nbsp;<span class="k-opacity-5">780</span>
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 58%" aria-valuenow="58" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    Tasks In Progress
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    45%
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="k-widget-11__item">
                                                            <div class="k-widget-11__wrapper">
                                                                <div class="k-widget-11__title">
                                                                    All Tasks
                                                                </div>
                                                                <div class="k-widget-11__value">
                                                                    1200
                                                                </div>
                                                            </div>
                                                            <div class="k-widget-11__progress">
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- <div class="k-margin-t-30 k-align-center"> -->
                                                    <!-- <a href="#" class="btn btn-brand btn-upper btn-bold k-align-center">Full Report</a> -->
                                                    <!-- </div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--end::Portlet-->

                                </div>

                                <div class="col-xl-8 col-xxl-8 order-xxl-2">

                                    <div class="k-portlet" id="k_portlet">
                                        <div class="k-portlet__head">
                                            <div class="k-portlet__head-label">
                                                <h3 class="k-portlet__head-title">Pie Chart 1</h3>
                                            </div>
                                        </div>
                                        <div class="k-portlet__body">
                                            <div id="k_flotcharts_1" style="height: 300px;"></div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12w">

                                <!--begin::Portlet-->
                                <div class="k-portlet" id="k_portlet">
                                    <div class="k-portlet__head k-portlet__head--lg">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-map-location"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Basic Calendar
                                            </h3>
                                        </div>

                                    </div>
                                    <div class="k-portlet__body">
                                        <div id="k_calendar"></div>
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
                    <div class="k-footer	k-grid__item k-grid k-grid--desktop k-grid--ver-desktop">
                        <div class="k-footer__copyright">
                            <p class="k-link">Keep your browser up to date for better view please use - IE (11 and Above), Mozilla(51 and Above) and Google Chrome(44 and above).</p>
                        </div> 
                    </div>

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
                    <div class="k-aside-secondary__nav k-grid k-grid--hor d-none">
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
                        <div class="k-grid__item k-aside-secondary__nav-foot d-none">
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
         <script src="<c:url value="/resources/assets/vendors/custom/flot/flot.bundle.js"/>" type="text/javascript"></script>

    <script src="<c:url value="/resources/assets/demo/custom/components/charts/flotcharts.js"/>" type="text/javascript"></script>
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
        <script src="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.full.js"/>" type="text/javascript"></script>
        <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/demo/custom/components/calendar/basic.js"/>" type="text/javascript"></script>
        <script type="text/javascript">
            $(window).on('load', function () {
                $('#contractor_notification').modal('show');
            });
        </script>

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
         <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js" />" type="text/javascript"></script>
        </body>

    <!-- end::Body -->

</html>