 <div class="k-content	k-grid__item k-grid__item--fluid k-grid k-grid--hor">

                    <!-- begin:: Content Head -->
                    <div class="k-content__head	k-grid__item">
                        <div class="k-content__head-main">
                            <h3 class="k-content__head-title">Tender</h3>
                            <div class="k-content__head-breadcrumbs">
                                <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                <span class="k-content__head-breadcrumb-separator"></span>
                                <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>

                                <!-- <span class="k-content__head-breadcrumb-link k-content__head-breadcrumb-link--active">Active link</span> -->
                            </div>
                        </div>
                        <div class="k-content__head-toolbar">
                            <div class="k-content__head-toolbar-wrapper">

                                <div class="dropdown dropdown-inline" data-toggle="k-tooltip" title="Create New Tender" data-placement="top">
                                    <button type="button" class="btn btn-sm btn-elevate btn-info btn-bold btn-upper" data-toggle="modal" data-target="#createTenderWizard">
                                      <i class="la la-map-signs"></i>  Create Tender 
                                    </button>
                                </div>

                                <!-- <div class="dropdown dropdown-inline" data-toggle="k-tooltip" title="Create New Tender" data-placement="top"> -->
                                <!-- <button type="button" class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper" data-toggle="modal" data-target=".bd-example-modal-lg"> -->
                                <!-- Create Auction -->
                                <!-- </button> -->
                                <!-- </div> -->
                                <!-- <div class="dropdown dropdown-inline" data-toggle="k-tooltip" title="Quick actions" data-placement="top"> -->
                                    <!-- <button type="button" class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper dropdown-toggle-" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="k_sweetalert_demo_6"> -->
                                        <!-- New -->
                                    <!-- </button> -->
                                    <!-- <div class="dropdown-menu dropdown-menu-right"> -->
                                        <!-- <a class="dropdown-item" href="#"><i class="la la-plus"></i> New Report</a> -->
                                        <!-- <a class="dropdown-item" href="#"><i class="la la-user"></i> Add Customer</a> -->
                                        <!-- <a class="dropdown-item" href="#"><i class="la la-cloud-download"></i> New Download</a> -->
                                        <!-- <div class="dropdown-divider"></div> -->
                                        <!-- <a class="dropdown-item" href="#"><i class="la la-cog"></i> Settings</a> -->
                                    <!-- </div> -->
                                <!-- </div>&nbsp; -->
                                <a href="#" class="btn btn-sm btn-elevate btn-danger" id="k_dashboard_daterangepicker" data-toggle="k-tooltip" title="Select dashboard daterange" data-placement="top">
                                    <span class="k-opacity-7" id="k_dashboard_daterangepicker_title">Today</span>&nbsp;
                                    <span class="k-font-bold" id="k_dashboard_daterangepicker_date">Aug 16</span>
                                    <i class="flaticon-calendar-with-a-clock-time-tools k-padding-l-5 k-padding-r-0"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- end:: Content Head -->

                    <!--WIZARD_MODAL_FORM-->
                 

                    <!-- begin:: Content Body -->
                    <div class="k-content__body	k-grid__item k-grid__item--fluid">

                        <!--begin::Row-->
                        <div class="row">
						<div class="col-lg-12"> 
									<!--begin::Portlet-->
									<div class="k-portlet" style="margin-bottom:-10px;">
										<div class="k-portlet__body"> 
												<div class="row">
													<div class="col-lg-11" style="padding-right:0;"> 
														<ul class="tender_search">
														    <li><input type="text" class="form-control" placeholder="Temder NO. / NIT NO."></li>
														    <li><select class="form-control" id="exampleSelect1">
                                                                    <option value="0">Select Status</option>
                                                                    <option value="1">Live</option>
                                                                    <option value="2">In Process</option>
                                                                </select>
															</li>
														    <li><select class="form-control" id="exampleSelect1">
                                                                    <option value="0">Select Officer Name</option>
                                                                    <option value="Atul Pathak">Atul Pathak</option>
                                                                    <option value="Amit Pathak">Amit Pathak</option>
                                                                </select>
															</li>
														    <li><div class="input-group date">
                                                                    <input type="text" class="form-control" readonly="" placeholder="Select date &amp; time" id="k_datetimepicker_2">
                                                                    <div class="input-group-append">
                                                                        <span class="input-group-text"><i class="la la-calendar-check-o glyphicon-th"></i></span>
                                                                    </div>
                                                                </div> 
															</li> 
														</ul> 
													</div> 
													<div class="col-lg-1" style="padding-left:0;">
															<button type="reset" class="btn btn-info">Search</button>
														</div>													
												</div>
											
										</div>
									</div>

									<!--end::Portlet--> 
								</div>
                            <!--begin::Portlet-->
						<div class="col-lg-12">	
                            <div class="k-portlet k-portlet--tabs tender_tab">
                                <div class="k-portlet__head">
                                    <div class="k-portlet__head-toolbar">
                                        <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-danger nav-tabs-line-2x nav-tabs-line-right nav-tabs-bold" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_2_1_tab_content" role="tab">
															All Tenders
														</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_2_tab_content" role="tab">
														Created Tenders
														</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_3_tab_content" role="tab">
															Sent For Approval
														</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_4_tab_content" role="tab">
															Approved
														</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_5_tab_content" role="tab">
															Live / In Process Tenders
														</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_6_tab_content" role="tab">
															Amended
													</li>
													<li class="nav-item">
														<a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_7_tab_content" role="tab">
															Canceled Tenders
														</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_8_tab_content" role="tab">
															View CS
														</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="k-portlet__body">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="k_portlet_base_demo_2_1_tab_content" role="tabpanel">
										<div class="detail-tender">
                            <p><span>All Tenders:</span>List of all tenders related to you.</p>
                        </div>
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable my_datatable" id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_2_tab_content" role="tabpanel">
										<div class="detail-tender">
                            <p><span>Created Tenders:</span>List of tenders, either created by you or sent to you for approval.</p>
                        </div>
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_3_tab_content" role="tabpanel">
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_4_tab_content" role="tabpanel">
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_5_tab_content" role="tabpanel">
										<div class="detail-tender">
                            <p><span>Live Tenders:</span>Tenders that are currently available for purchase.
                                <span>In Progress:</span>Tenders that are currently active and available for bid submission.</p>
                        </div>
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_6_tab_content" role="tabpanel">
										<div class="detail-tender">
                            <p><span>Amended Tenders:</span>List of amended tenders or corrigendum.</p>
                        </div>
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_7_tab_content" role="tabpanel">
							<div class="detail-tender">
                            <p><span>Cancelled Tenders:</span> Tenders are cancelled for a reason by tender authority.</p>
                        </div>
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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
                                        <div class="tab-pane" id="k_portlet_base_demo_2_8_tab_content" role="tabpanel">
										<div class="detail-tender">
                            <p><span>View CS:</span>View the Comparison Sheet(CS) of financial bid. </p>
                        </div>
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
                                                <table class="table table-striped- table-bordered table-hover table-checkable " id="k_table_1545454">
                                                    <thead>
                                                        <tr>
                                                            <th>Tender No.</th>
                                                            <th>NIT No.</th>
                                                            <th>Description</th>
                                                            <th>PAC</th>
                                                            <th>Release Date</th>
                                                            <th>Purchase Date</th>
                                                            <th>Status</th>
                                                            <th>Action / Details</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>61715-075</td>
                                                            <td>China</td>
                                                            <td>Tieba</td>
                                                            <td>746 Pine View Junction</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>63629-4697</td>
                                                            <td>Indonesia</td>
                                                            <td>Cihaur</td>
                                                            <td>01652 Fulton Trail</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>68084-123</td>
                                                            <td>Argentina</td>
                                                            <td>Puerto Iguazú</td>
                                                            <td>2 Pine View Park</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>67457-428</td>
                                                            <td>Indonesia</td>
                                                            <td>Talok</td>
                                                            <td>3050 Buell Terrace</td>
                                                            <td><span class="k-badge k-badge--brand k-badge--inline k-badge--pill">Sold Out</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-1016</td>
                                                            <td>Indonesia</td>
                                                            <td>Merdeka</td>
                                                            <td>3150 Cherokee Center</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>0093-5142</td>
                                                            <td>China</td>
                                                            <td>Jianggao</td>
                                                            <td>289 Badeau Alley</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>NIT/01/02/03</td>
                                                            <td>36987-3093</td>
                                                            <td>China</td>
                                                            <td>Jiantou</td>
                                                            <td>373 Northwestern Plaza</td>
                                                            <td><span class="k-badge  k-badge--success k-badge--inline k-badge--pill">In Stock</span></td>
                                                            <td><span><a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="View details"><i class="la la-ellipsis-h"></i></a>
												<a href="#" class="btn btn-hover-brand btn-icon btn-pill" title="Edit details"><i class="la la-edit"></i></a></span></td>
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

                                    </div>
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


