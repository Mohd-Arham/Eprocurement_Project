<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />   
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
    <div class="k-aside-menu-wrapper	k-grid__item k-grid__item--fluid" id="k_aside_menu_wrapper">
        <div id="k_aside_menu" class="k-aside-menu " data-kmenu-vertical="1" data-kmenu-scroll="1" data-kmenu-dropdown-timeout="500" style="position: relative;">
            <ul class="k-menu__nav " style="padding-top:4px;">
                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover" style="padding: 20px 0;"><a href="#" class="k-menu__link k-menu__toggle" style="background-color:#fff!important;cursor:inherit;"><i class="k-menu__link-icon flaticon-time-1" style="color: #fd3995;font-size: 21px;"></i><span class="k-menu__link-text time_view"><p class="clock_section" >{{ clock }}<span class="day_view">{{ date }}</span></p></span></a>
                </li>
                <li class="k-menu__item  k-menu__item--submenu k-menu__item--open k-menu__item--expanded" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="departmentUserDashBoard" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-line-graph"></i><span class="k-menu__link-text">Dashboards</span></a>
                </li>
                <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-layers"></i><span class="k-menu__link-text">Verify DSC</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                    <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                        <ul class="k-menu__subnav">
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:verifyDSCProcess('Signing');" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Verify DSC For Signing</span></a>
                            </li>
                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:verifyDSCProcess('Encryption');" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Verify DSC For Encryption</span></a>
                            </li>
                        </ul>
                    </div>
                </li>
                <c:forEach var="entry" items="${privilege}">
                    <c:if test="${entry.key.equalsIgnoreCase('Administration')}">
                        <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="eTendering" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Administration</span></a>
                        </li>
                    </c:if>
                    <c:if test="${entry.key.equalsIgnoreCase('E-Tendering')}">
                        <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="eTendering" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-strikethrough"></i><span class="k-menu__link-text">Tendering</span></a>
                        </li>
                    </c:if>
                    <c:if test="${entry.key.equalsIgnoreCase('E-Auction')}">
                        <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="eTendering" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-balance-scale"></i><span class="k-menu__link-text">Auction</span></a>
                        </li>
                    </c:if>
                    <c:if test="${entry.key.equalsIgnoreCase('Inventory')}">
                        <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="eTendering" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la flaticon-squares-3"></i><span class="k-menu__link-text">Inventory</span></a>
                        </li>
                    </c:if>
                </c:forEach>
                        <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="comparisonsheet?tenderId=1" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Evaluation of Bid</span></a>
                            </li>
                              <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="comparisonsheet?tenderId=1" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-map-signs"></i><span class="k-menu__link-text">Comparison Sheet</span></a>
                            </li>
                <!--                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="auction.html" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-gavel"></i><span class="k-menu__link-text">Auction</span></a>
                                            </li>
                                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon fa fa-user-lock"></i><span class="k-menu__link-text">Administration</span> </a>
                                            </li>
                                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon la la-cubes"></i><span class="k-menu__link-text">Inventory</span></a>
                                            </li>-->
                <!--                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-tabs"></i><span class="k-menu__link-text">DSC Details</span><i class="k-menu__ver-arrow la la-angle-right"></i></a>
                                                <div class="k-menu__submenu "><span class="k-menu__arrow"></span>
                                                    <ul class="k-menu__subnav">
                                                        <li class="k-menu__item  k-menu__item--parent" aria-haspopup="true"><span class="k-menu__link"><span class="k-menu__link-text">Keen Datatable</span></span>
                                                        </li>
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
                <!--                            <li class="k-menu__item  k-menu__item--submenu" aria-haspopup="true" data-kmenu-submenu-toggle="hover"><a href="javascript:;" class="k-menu__link k-menu__toggle"><i class="k-menu__link-icon flaticon-list"></i><span class="k-menu__link-text">MIS Reports</span></a></li>
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
                                            </li>-->
                <!--                            <li class="k-menu__section ">
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
   

    <!-- end:: Aside -->
</div>
<script>
    var randomNo = "70331";
    function verifyDSCProcess(dscType) {
        $('#preloaderSpinner').show();
        randomNo = getRandomInt(1, 300000);
        console.log("deptUser");
      //  alert("deptUser");
        
        randomNo = randomNo + "TAB";
        var url = "VerifyDSCProcess?randomNo=" + randomNo+'&dscType='+dscType+'&userType=deptUser';
        alert(url+"url is")
        console.log(url+"Url is")
        window.open(url);
       
        checkJnlpExeStatus();
    }
    function checkJnlpExeStatus() {
        $.ajax({
            url: "accessJnlpExeStatusForDeptUser?randomNo=" + randomNo,
            cache: false,
            success: function (response) {
                var data = JSON.parse(response);

                // Run if status is active and result is success
                if (data[0] == 'success' && data[1] == 'active') {
                    console.log("polling end...");
                    $('#preloaderSpinner').hide();
                    if (randomNo.indexOf('NEWTAB') > -1) { // open url in new tab
                        window.open(data[2], "_blank");
                    } else { // open url in same tab
                        window.location.href = data[2];
                    }
                } else {
                    setTimeout(checkJnlpExeStatus, 2000);
                    console.log("polling continue....");
                }
            },
            error: function (data) {
                console.log("error in ajax call...");
            },
            complete: function (data) {
                console.log("ajax call completed..");
            }
        });
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
</script>