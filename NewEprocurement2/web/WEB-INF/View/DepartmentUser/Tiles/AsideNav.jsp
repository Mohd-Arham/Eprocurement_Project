<!-- begin:: Aside -->
				 <button class="k-aside-close " id="k_aside_close_btn"><i class="la la-close"></i></button>
            <div class="k-aside  k-aside--fixed k-aside--skin-default 	k-grid__item k-grid k-grid--desktop k-grid--hor-desktop" id="k_aside">

                <!-- begin:: Aside -->
                <div class="k-aside__brand	k-grid__item  k-aside__brand--skin-default " id="k_aside_brand">
                    <div class="k-aside__brand-logo">
                        <a href="index.html">
                            <img alt="Logo" src="resources/assets/demo/media/logo-light.png" style="max-width: 100%;" />
                        </a>
                    </div>
                    <div class="k-aside__brand-tools">
                        <button class="k-aside__brand-aside-toggler k-aside__brand-aside-toggler--left" id="k_aside_toggler"><span></span></button>
                    </div>
                </div>

                <!-- end:: Aside -->

                <!-- begin:: Aside Menu -->
                <div class="k-aside-menu-wrapper	k-grid__item k-grid__item--fluid" id="k_aside_menu_wrapper">
                    <div id="k_aside_menu" class="k-aside-menu " data-kmenu-vertical="1" data-kmenu-scroll="1" data-kmenu-dropdown-timeout="500" style="position: relative;">
                        <ul class="k-menu__nav " style="padding-top:4px;">
                             <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover" style="padding: 20px 0;"><a href="#" class="k-menu__link k-menu__toggle" style="background-color:#fff!important;cursor:inherit;"><i class="k-menu__link-icon flaticon-time-1" style="color: #fd3995;font-size: 21px;"></i><span class="k-menu__link-text time_view"><p class="clock_section" >{{ clock }}<span class="day_view">{{ date }}</span></p></span></a>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu k-menu__item--open k-menu__item--expanded" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="departmentUserDashBoard" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-line-graph"></i><span class="k-menu__link-text">Dashboards</span></a>
                            </li>
<!--                            <li class="k-menu__section ">
                                <h4 class="k-menu__section-text">Components</h4>
                                <i class="k-menu__section-icon flaticon-more-v2"></i>
                            </li>-->
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="eTendering" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Tender</span></a>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="tenderOpening" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Tender Opening</span></a>
                            </li>
<!--                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="192.168.0.101:8075/NewEprocurement/saveAuction" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-gavel"></i><span class="k-menu__link-text">Auction</span></a>
                            </li>
                              <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-open-box"></i><span class="k-menu__link-text">Administration</span> </a>
                             </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-interface-7"></i><span class="k-menu__link-text">Inventory</span></a>
                            </li>
                           	<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-tabs"></i><span class="k-menu__link-text">DSC Details</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
									<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
										<ul class="k-menu__subnav">
											<li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Keen Datatable</span></span></li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Base</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/data-local.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/data-json.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">JSON Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/data-ajax.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Ajax Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/html-table.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">HTML Table</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/record-selection.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Record Selection</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/local-sort.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Sort</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/row-details.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Row Details</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/column-rendering.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Column Rendering</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/column-width.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Column Width</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/responsive-columns.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Responsive Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/base/translation.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Translation</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Scrolling</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/vertical.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Vertical Scrolling</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/horizontal.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Horizontal Scrolling</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/scrolling/both.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Both Scrolling</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Locked Columns</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/left.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Left Locked Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/right.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Right Locked Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/both.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Both Locked Columns</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/locked/html-table.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">HTML Table</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Child Datatables</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/child/data-local.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Local Data</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/child/data-ajax.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Remote Data</span></a></li>
													</ul>
												</div>
											</li>
											<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">API</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
												<div class="k-menu__submenu "><span class="k-menu__arrow"></span>
													<ul class="k-menu__subnav">
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/api/methods.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">API Methods</span></a></li>
														<li class="k-menu__item " aria-haspopup="true"><a href="components/keen-datatable/api/events.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Events</span></a></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>-->
<!--								<li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-list-3"></i><span class="k-menu__link-text">MIS Reports</span></a></li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-share"></i><span class="k-menu__link-text">Icons</span><span class="k-menu__link-badge"><span class="k-badge k-badge--danger">5</span></span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/flaticon.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Flaticon</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/fontawesome5.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Fontawesome 5</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/lineawesome.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Lineawesome</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/icons/socicons.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Socicons</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-interface-1"></i><span class="k-menu__link-text">Portlets</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Portlets</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/portlets/base.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Base</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/portlets/draggable.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Draggable</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-calendar"></i><span class="k-menu__link-text">Calendar</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Calendar</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/basic.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Basic</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/list-view.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">List View</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/google.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Google Calendar</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/external.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">External Events</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/calendar/rendering.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Event Rendering</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-diagram"></i><span class="k-menu__link-text">Charts</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Charts</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/flotcharts.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Flot Charts</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/google-charts.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Google Charts</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/morris-charts.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Morris Charts</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="components/charts/chart-js.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Chart JS</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__section ">
                                <h4 class="k-menu__section-text">Tools</h4>
                                <i class="k-menu__section-icon flaticon-more-v2"></i>
                            </li>
                            <li class="k-menu__item " aria-haspopup="true" data-kmenu-link-redirect="1"><a target="_blank" href="https://keenthemes.com/keen/preview/?page=builder" class="k-menu__link "><i class="k-menu__link-icon flaticon-settings"></i><span class="k-menu__link-text">Layout Builder</span></a></li>
                            <li class="k-menu__section ">
                                <h4 class="k-menu__section-text">Custom</h4>
                                <i class="k-menu__section-icon flaticon-more-v2"></i>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-interface-9"></i><span class="k-menu__link-text">Pricing</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Pricing</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/pricing/pricing-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Pricing v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/pricing/pricing-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Pricing v2</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-piggy-bank"></i><span class="k-menu__link-text">Invoices</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Invoices</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/invoices/invoice-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Invoice v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/invoices/invoice-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Invoice v2</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-exclamation-2"></i><span class="k-menu__link-text">FAQs</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">FAQs</span></span>
                                        </li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v2</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v3.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v3</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/faq/faq-v4.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">FAQ v4</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-user"></i><span class="k-menu__link-text">User Pages</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/user/login-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Login v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/user/login-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Login v2</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a href="custom/user/profile-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">Profile v1</span></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-warning"></i><span class="k-menu__link-text">Error Pages</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                    <ul class="k-menu__subnav">
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v1.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v1</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v2.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v2</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v3.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v3</span></a></li>
                                        <li class="k-menu__item " aria-haspopup="true"><a target="_blank" href="custom/error/404-v4.html" class="k-menu__link "><i class="k-menu__link-bullet k-menu__link-bullet--dot"><span></span></i><span class="k-menu__link-text">404 - v4</span></a></li>
                                    </ul>
                                </div>
                            </li>-->
                        </ul>
                    </div>
                </div>

                <!-- end:: Aside Menu -->

                <!-- begin:: Aside -->
<!--                <div class="k-aside__footer		k-grid__item" id="k_aside_footer">
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
                </div>-->

                <!-- end:: Aside -->
            </div>