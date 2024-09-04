<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" >
    // right click disabled
    document.addEventListener('contextmenu', event = > event.preventDefault());
</script>
<script type="text/javascript" >
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
    window.onhashchange = function () {
        window.location.hash = "no-back-button";
    }
</script>

<div id="preloaderSpinner" class="preloader spinner">
    <div class="spinWrap">
        <p class="spinnerImage"></p>
        <p class="loader"></p>
        <p class="loadingMessage" id="spinnerMessage"></p>
    </div>
</div> 
<!--start::--Mobile_top_header-->
<div class="header-top mobile_view d-none">
    <div class="k-container">
        <div class="row">
            <div class="col-md-7 col-sm-8">
                <div class="header-left">
<!--                    <ul>
                        <li class="text-white">Help Desk  | Toll Free : 1800-419-7549 <span class="d-block"> info@Procurelinceprocurement.com</span></li> 
                    </ul>-->
                </div>
            </div>
            <div class="col-md-5 col-sm-4">
                <div class="header-right-div">
                    <div class="soical-profile"  data-aos="zoom-in-down">
                        <ul>
                            <li><a href="#" title="Increase Font Size"><i class="fa fa-plus font-button plus" aria-hidden="true"></i>A</a></li>
                            <li><a href="#" title="Decrease Font Size"><i class="fa fa-minus font-button minus" aria-hidden="true"></i>A</a></li>
                            <li><a href="#" title="Reset Font Size"><i class="fa fa-undo reset-font" aria-hidden="true"></i>A</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end::--Mobile_top_header-->

<div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed "> 
<!--    <div class="k-header-mobile__logo">
        <a href="/">
            <img alt="Logo" src="<c:url value="/resources/assets/demo/media/logo-dark.png"/>" style="max-width: 100%;" />
        </a>
    </div>-->
    <div class="k-header-mobile__toolbar">
        <button class="k-header-mobile__toolbar-toggler" id="k_header_mobile_toggler"><span></span></button>
    </div>
</div>
<!-- end:: Header Mobile -->
<div class="k-grid1 k-grid--hor k-grid--root1 ">
    <div class="header-top desktop_header">
        <div class="k-container">
            <div class="row">
                <div class="col-md-7 col-sm-8">
                    <div class="header-left">
<!--                        <ul>
                            <li class="text-white">Help Desk  | Toll Free : 1800-419-7549 / info@Procurelinceprocurement.com</li> 
                        </ul>-->
                    </div>
                </div>
                <div class="col-md-5 col-sm-4">
                    <div class="header-right-div">
                        <div class="soical-profile"  data-aos="zoom-in-down">
                            <ul>
                                <li><a href="#" title="Increase Font Size"><i class="fa fa-plus font-button plus" aria-hidden="true"></i>A</a></li>
                                <li><a href="#" title="Decrease Font Size"><i class="fa fa-minus font-button minus" aria-hidden="true"></i>A</a></li>
                                <li><a href="#" title="Reset Font Size"><i class="fa fa-undo reset-font" aria-hidden="true"></i>A</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="k-container">
        <div class="k-grid__item k-grid__item--fluid k-grid k-grid--ver k-page">
            <div class="k-aside__brand	k-grid__item  k-aside__brand--skin-light k_aside_width" id="k_aside_brand">
                <div class="k-aside__brand-logo">
                    <a href="/">
                        <img alt="Logo" src="<c:url value="/resources/assets/demo/media/logo-light.png"/>" style="max-width: 100%;" />
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

                    <div class="k-header-menu-wrapper ml-0" id="k_header_menu_wrapper"> 
                        <div id="k_header_menu" class="k-header-menu k-header-menu-mobile nav_menu_f">
                            <ul class="k-menu__nav menu_link_a">
                                <li class="k-menu__item k-menu__item--active"><a href="Aboutus" target="_blank" class="k-menu__link "><span class="k-menu__link-text">About us</span></a>
                                </li>
                                <li class="k-menu__item"><a href="solution" class="k-menu__link " target="_blank"><span class="k-menu__link-text">Solution</span></a>
                                </li>
                                <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">Process</span></a>
                                </li>
                                <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">FAQ's</span></a>
                                </li>
                                <li class="k-menu__item"><a href="#" class="k-menu__link "><span class="k-menu__link-text">Help</span></a>
                                </li>
                                <li class="k-menu__item desktop_none d-none"><a href="#" class="k-menu__link btn btn-sm btn-elevate btn-warning btn-bold btn-upper" data-toggle="modal" data-target="#cont_login_page"><span class="k-menu__link-text">User Login</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- end: Header Menu -->

                    <!-- begin:: Header Topbar -->
                    <div class="k-header__topbar margin_0_auto">
                        <!--begin: Language bar -->
                        <div class="k-header__topbar-item k-header__topbar-item--langs">
                            <div class="k-header__topbar-item-wrapper">
                                <span class="k-header__topbar-icon">
                                    <a href="#" class="btn btn-sm btn-elevate btn-warning btn-bold btn-upper btn-square" data-toggle="modal" data-target="#cont_login_page">User Login</a>
                                </span>
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
<div class="fixed_header"></div>