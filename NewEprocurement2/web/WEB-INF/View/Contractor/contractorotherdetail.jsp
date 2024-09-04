<%-- 
    Document   : contractorotherdetail
    Created on : 1 Nov, 2018, 5:53:58 PM
    Author     : Windows7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en"  ng-app="myApp">

    <!-- begin::Head -->

    <head>
        <meta charset="utf-8" />
        <title>Contractor Profile Dashboard</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <%@include file="../Contractor/Tiles/csslink.jsp" %>  
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


        <style>


            .modal_time_watch {
                float: left;
                width: 75%;
            } 
            .wizard_tb .nav-pills.nav-tabs-btn .nav-link {
                padding: 8px!important;
                border-radius: 100px;
                border: 1px solid #dedede;
                height: 45px;
                width: 45px;
                pointer-events: none;
            }

            .wizard_tb .nav-pills.nav-tabs-btn .nav-item {
                border-radius: 100px;
                background-color: #fff;
                height: 45px;
                width: 45px;
                margin: 0 10.05rem;
                cursor: no-drop;
            }

            .connecting-line {
                height: 2px;
                background-color: #d8d8d8;
                position: absolute;
                width: 67%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 42%;
                z-index: 1;
            }

            .sve_class_cl {
                background-color: #44cb99;
            }

            .sve_class_cl span {
                color: #fff!important;
            }

            .sve_class_already {
                background-color: #00BCD4;
            }

            .sve_class_already span {
                color: #fff!important;
            }
            .modal-body .ps > .ps__rail-y > .ps__thumb-y {
                background: #5867dc;
                opacity: 1;
            }


        </style>
        <style>
            .Validatingfield {
                color: red;
                font-size: 13px;
            }
            span.staric {
                font-size: 19px;
                color: red;
                font-weight: normal;
            }
        </style>
    </head>

    <div id="preloaderSpinner_1" class="preloader spinner">
        <div class="spinWrap">
            <p class="spinnerImage"></p>
            <p class="loader"></p>
            <p class="loadingMessage" id="spinnerMessage1"></p>
        </div>
    </div>


    <!-- end::Head -->

    <!-- begin::Body -->

    <body class="k-header--fixed k-header--skin-default k-header-mobile--skin-default k-header-mobile--fixed k-aside--enabled k-aside--fixed k-aside--skin-default k-aside__brand--skin-default k-aside-secondary--enabled" ng-controller="myCtrl">
        <!--STAR_TENDER_WIZARD_MODAL -->
        <!-- Large Modal -->
        <div class="modal fade" id="contractorProfileWizard" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" data-backdrop="static" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="max-width:90%;">
                <div class="modal-content">
                    <div class="modal-body" style="background-color: #f8f8f8;">
                        <div class="k-portlet" style="margin-bottom:0;">
                            <div class="k-portlet__head" style="padding: 12px 25px;">
                                <div class="wizard_tb mx-auto" style="position:relative;">
                                    <div class="connecting-line"></div>
                                    <ul class="nav nav-pills nav-tabs-btn" role="tablist" style="padding-bottom:0px;position:relative;z-index:1;">

                                        <li class="nav-item" id="li1">
                                            <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_1_tab_content" id="step1" role="tab">
                                                <span class="nav-link-title">1</span>
                                                <span class="fa fa-check" style="display:none;"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item" id="test2">
                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_tab_content" id="step2" role="tab">
                                                <span class="nav-link-title">2</span>
                                                <span class="fa fa-check" style="display:none;"></span>
                                            </a>
                                        </li>
                                        <li class="nav-item" id="test3">
                                            <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_3_tab_content" id="step3" role="tab">
                                                <span class="nav-link-title">3</span>
                                                <span class="fa fa-check" style="display:none;"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div id="contractorDiv">
                                <form:form role="form" id="formData" modelAttribute="Contractordetails" > 
                                    <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" id="scrollingEffect" data-scroll="true" data-height="400"  data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;">
                                        <div class="tab-content">
                                            <!-- STEP_FIRST_FORM -->
                                            <div class="tab-pane active" id="k_portlet_base_demo_1_tab_content" role="tabpanel">
                                                <div id="foreignFirstStep">                                
                                                    <form class="k-form">
                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="flaticon-cogwheel"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Foreign Company Details 
                                                                </h3>
                                                            </div>

                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <form:hidden path="contOtherId"  id="contOtherId" />
                                                            <div class="row">
                                                                <div class="col-lg-4">

                                                                    <label>First Name</label><span class="staric">*</span>
                                                                    <form:input path="ForeignfName" id="ForeignfName" style="text-transform: uppercase;"  class="form-control Name" placeholder=" " readonly="true"/>
                                                                    <span class="form-text Validatingfield" id="ForeignfNameError"></span>
                                                                </div>
                                                                <div class="col-lg-4 mt-2">
                                                                    <label class="">Middle Name</label>
                                                                    <form:input path="ForeignmName" id="ForeignmName" style="text-transform: uppercase;" value="" class="form-control Name"  placeholder=" " readonly="true"/>
                                                                    <span class="form-text Validatingfield" id="ForeignmNameError"></span>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="">Last Name</label><span class="staric">*</span>
                                                                    <form:input path="ForeignlName" id="ForeignlName" style="text-transform: uppercase;" value="" class="form-control Name"  placeholder=" " readonly="true"/>
                                                                    <span class="form-text Validatingfield" id="ForeignlNameError"></span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <label>Email ID</label><span class="staric">*</span>
                                                                    <form:input path="foreignemail" id="foreignemail"  style="text-transform: uppercase;" class="form-control Email_Id" placeholder=" " readonly="true" />
                                                                    <span class="form-text Validatingfield" id="foreignemailError"></span>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="">Mobile No.</label><span class="staric">*</span>
                                                                    <form:input path="foreignContact1" id="foreignContact1"  class="form-control Mobile_No" placeholder="" readonly="true"/>
                                                                    <span class="form-text Validatingfield" id="foreignContact1Error" ></span>
                                                                </div>
                                                                <input type="hidden" id="regId" name="regId" value="${regid}">
                                                                <input type="hidden" id="contractorType" name="contractorType">
                                                                <div class="col-lg-4">
                                                                    <label class="">Contact No.</label>
                                                                    <form:input path="foreignContact2" id="foreignContact2"  class="form-control Mobile_No" placeholder=" " />
                                                                    <span class="form-text Validatingfield"  id="foreignContact2Error" ></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Name of Organization</label><span class="staric">*</span>
                                                                    <form:input path="foreignOrgName" id="foreignOrgName" style="text-transform: uppercase;" class="form-control Name" placeholder="" />
                                                                    <span class="form-text Validatingfield" id="foreignOrgNameError"></span>
                                                                </div>
                                                                <div class="col-lg-6 mt-2">
                                                                    <label class="">Official Website</label>
                                                                    <form:input path="foreignWebsite" id="foreignWebsite" style="text-transform: uppercase;"  class="form-control Website"  placeholder="" />
                                                                    <span class="form-text Validatingfield" id="foreignWebsiteError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <label>Registered Address</label><span class="staric">*</span>
                                                                    <form:textarea path="foreignAddress" id="foreignAddress" style="text-transform: uppercase;"  class="form-control Address"  placeholder=" " />
                                                                    <span class="form-text Validatingfield" id="foreignAddressError"></span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <input type="hidden" id="country_id" value="${Contractordetails.country}">
                                                                    <label>Country</label><span class="staric">*</span>
                                                                    <form:select path="country" id="country" class="select form-control p-0" onchange="mystate(this.value,'0')" required="true" >
                                                                        <form:option value="">Select</form:option>
                                                                        <c:forEach var="countryList" items="${countryList}">
                                                                            <form:option value="${countryList.country_id}">${countryList.country_name}</form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="countryError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="hidden" id="stateid" value="${Contractordetails.foreignState}">
                                                                    <label class="">State</label><span class="staric">*</span>
                                                                    <form:select path="foreignState" id="foreignState" class="select form-control select" onchange="myCity(this.value,'0')" required="true" >
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="foreignStateError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <input type="hidden" id="cityid" value="${Contractordetails.foreignCity}">
                                                                    <label>City</label><span class="staric">*</span>
                                                                    <form:select path="foreignCity" id="foreignCity" class="select form-control select" required="true">
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="foreignCityError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">Pincode</label><span class="staric">*</span>
                                                                    <form:input path="foreignPincode" id="foreignPincode"  class="form-control Pincode" placeholder=" " />
                                                                    <span class="form-text Validatingfield" id="foreignPincodeError"></span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Tax Identification Number</label><span class="staric">*</span>
                                                                    <form:input path="foreignTINNo" id="foreignTINNo" style="text-transform: uppercase;"  class="form-control TIN"  placeholder="" />
                                                                    <span class="form-text Validatingfield" id="foreignTINNoError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">TIN Certificate</label><span class="staric">*</span>
                                                                    <div></div>
                                                                    <div class="custom-file">
                                                                        <input type="file" name="foreignTINDocName" id="foreignTINDoc"  value="" class="custom-file-input">
                                                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                                                        <input type="hidden" id="foreignTINDocs" value="${Contractordetails.foreignTINDocUrl}" >   
                                                                        <a href="${Contractordetails.foreignTINDocUrl}" target="blank">${Contractordetails.foreignTINDocName}</a>
                                                                    </div>
                                                                    <span class="form-text Validatingfield" id="foreignTINDocerrorpdf"></span>
                                                                    <span class="form-text Validatingfield"  id="foreignTINDocError" ></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Registration Number</label><span class="staric">*</span>
                                                                    <form:input path="foreignRegno" id="foreignRegno"  class="form-control CRN"  placeholder="" />
                                                                    <span class="form-text Validatingfield" id="foreignRegnoError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">Registration Certificate</label><span class="staric">*</span>
                                                                    <div></div>
                                                                    <div class="custom-file">
                                                                        <input type="file" name="foreignRegDocName" id="foreignRegDoc"   class="custom-file-input FileName" >
                                                                        <label class="custom-file-label"  for="customFile" id="regFile"></label><span id="1regFile"></span>
                                                                        <!--<input type="text" id="regFile">-->
                                                                        <input type="hidden" id="foreignRegDocs" value="${Contractordetails.foreignRegDocUrl}" >
                                                                        <a href="${Contractordetails.foreignRegDocUrl}" target="blank">${Contractordetails.foreignRegDocName}</a>
                                                                    </div> <span class="form-text Validatingfield" id="foreignRegDocerrorpdf"></span>
                                                                    <span class="form-text Validatingfield"  id="foreignRegDocError" ></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- SECOND_STEP_FORM -->
                                            <div class="tab-pane" id="k_portlet_base_demo_2_tab_content" role="tabpanel">
                                                <div id="indianSecSteps" >
                                                    <form class="k-form">
                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="flaticon-cogwheel"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Indian Bidder / Agent Details  
                                                                </h3>
                                                            </div>

                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <label>First Name</label><span class="staric">*</span>
                                                                    <form:input path="IndianfName" id="IndianfName" style="text-transform: uppercase;" class="form-control Name"  placeholder=" " readonly="true"/>
                                                                    <span class="form-text Validatingfield" id="IndianfNameError"></span>
                                                                </div>
                                                                <div class="col-lg-4 mt-2">
                                                                    <label class="">Middle Name</label>
                                                                    <form:input path="IndianmName" id="IndianmName" style="text-transform: uppercase;"  class="form-control Name"  placeholder=" " readonly="true"/>
                                                                    <span class="form-text Validatingfield" id="IndianmNameError"></span>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <label class="">Last Name</label><span class="staric">*</span>
                                                                    <form:input path="IndianlName" id="IndianlName" style="text-transform: uppercase;"  class="form-control Name"  placeholder=" " readonly="true"/>
                                                                    <span class="form-text Validatingfield"  id="IndianlNameError"></span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Email ID</label><span class="staric">*</span>
                                                                    <form:input path="agentemail" id="agentemail" style="text-transform: uppercase;" class="form-control Email_Id"  placeholder=" " readonly="true" />
                                                                    <span class="form-text Validatingfield" id="agentemailError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">Mobile No.</label><span class="staric">*</span>
                                                                    <form:input path="agentContact1" id="agentContact1"  class="form-control Mobile_No"  placeholder="" readonly="true" />
                                                                    <span class="form-text Validatingfield" id="agentContact1Error"></span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Name of Organization</label><span class="staric">*</span>
                                                                    <form:input path="indianOrgName" id="indianOrgName" style="text-transform: uppercase;"  class="form-control Name"  placeholder="" />
                                                                    <span class="form-text Validatingfield"  id="indianOrgNameError"></span>
                                                                </div>
                                                                <div class="col-lg-6 mt-2">
                                                                    <label class="">Official Website</label>
                                                                    <form:input path="agentWebsite" id="agentWebsite" style="text-transform: uppercase;"  class="input form-control Website"  placeholder="" />
                                                                    <span class="form-text Validatingfield" id="agentWebsiteError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <label>Registered Address</label><span class="staric">*</span>
                                                                    <form:textarea path="agentAddress" id="agentAddress" style="text-transform: uppercase;"  class="form-control Address"  placeholder=" " />
                                                                    <span class="form-text Validatingfield" id="agentAddressError"></span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row"> 
                                                                <div class="col-lg-6">
                                                                    <label class="">State</label><span class="staric">*</span>
                                                                    <form:select path="agentState" id="agentState" class="select form-control" onchange="myIndianCity(this.value,'0')" required="true" >
                                                                        <form:option value="">Select</form:option>
                                                                        <c:forEach var="stateList" items="${stateList}">
                                                                            <form:option value="${stateList.state_id}">${stateList.state_name}</form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="agentStateError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <input type="hidden" id="agentCityId" value="${Contractordetails.agentCity}">
                                                                    <label>City</label><span class="staric">*</span>
                                                                    <form:select path="agentCity" id="agentCity" class="select form-control select" required="true">
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="agentCityError"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label class="">Pincode</label><span class="staric">*</span>
                                                                    <form:input path="agentPincode" id="agentPincode" class="form-control Pincode"  placeholder=" " />
                                                                    <span class="form-text Validatingfield" id="agentPincodeError"></span>
                                                                </div>
                                                                <div class="col-lg-6 mt-2">
                                                                    <label class="">Contact No.</label>
                                                                    <form:input path="agentContact2" id="agentContact2" class="form-control Mobile_No" placeholder=" " />
                                                                    <span class="form-text Validatingfield" id="agentContact2Error"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">													
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="border_boxesDiv">
                                                                        <div class="form-group">
                                                                            <label>Type of Organization</label><span class="staric">*</span>
                                                                            <form:select path="contOrganization" id="contOrganization" class="select form-control" required="true">
                                                                                <form:option value="">Select</form:option>
                                                                                <c:forEach var="organizationTypeList" items="${organizationTypeList}">
                                                                                    <form:option value="${organizationTypeList.orgId}">${organizationTypeList.organizationType}</form:option>
                                                                                </c:forEach>
                                                                            </form:select>
                                                                            <span class="form-text Validatingfield" id="contOrganizationError"></span>
                                                                        </div>
                                                                        <div class="form-group" id="otherOrg">
                                                                            <label class="">Other Organization</label>
                                                                            <form:input path="otherOrganization" id="otherOrganization" style="text-transform: uppercase;" class="form-control" placeholder=" " />
                                                                            <span class="form-text Validatingfield"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="border_boxesDiv">
                                                                        <div class="form-group">
                                                                            <label class="">Contractor Class</label><span class="staric">*</span>
                                                                            <form:select path="contractorClass" id="contractorClass" onchange="showClass(this);" class="select form-control" required="true">
                                                                                <form:option value="">Select</form:option>
                                                                                <c:forEach var="ContractorClassSecondList" items="${ContractorClassSecondList}">
                                                                                    <form:option value="${ContractorClassSecondList.contClassId}">${ContractorClassSecondList.contClassName}</form:option>
                                                                                </c:forEach>
                                                                            </form:select>
                                                                            <span class="form-text Validatingfield" id="contractorClassError"></span>
                                                                        </div>
                                                                        <div class="form-group" id="contClassDiv">
                                                                            <label class="">Contractor Class Certificate</label><span class="staric">*</span>
                                                                            <div></div>
                                                                            <div class="custom-file" >
                                                                                <input type="file" name="contractorClassDocName" id="contractorClassDoc" class="custom-file-input"  placeholder="">
                                                                                <label class="custom-file-label" for="customFile">Choose file</label>
                                                                                <input type="hidden" id="contractorClassDocs" value="${Contractordetails.contractorClassDocUrl}" > 
                                                                                <a href="${Contractordetails.contractorClassDocUrl}" target="blank">${Contractordetails.contractorClassDocName}</a>
                                                                            </div>
                                                                            <span class="form-text Validatingfield" id="contractorClassDocerrorpdf"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="form-group row">
                                                                <div class="col-lg-6">
                                                                    <label>Registration Details(MSME/NSIC,etc)</label><span class="staric">*</span>
                                                                    <form:select path="contCompanyType" id="contCompanyType" class="select form-control" required="true">
                                                                        <form:option value="">Select</form:option>
                                                                        <c:forEach var="MsmeOrgList" items="${MsmeOrgList}">
                                                                            <form:option value="${MsmeOrgList.msmeId}">${MsmeOrgList.comName}</form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="contCompanyTypeError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">Social Category</label><span class="staric">*</span>
                                                                    <form:select path="socialCategory" id="socialCategory" class="select form-control" required="true">
                                                                        <form:option value="">Select</form:option>
                                                                        <c:forEach var="socialList" items="${socialCategoryList}">
                                                                            <form:option value="${socialList.socialCategoryId}">${socialList.categoryName}</form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <span class="form-text Validatingfield" id="socialCategoryError"></span>
                                                                </div>

                                                            </div>
                                                            <div class="form-group1" id="msmeDiv" > 
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <label>MSME/NSIC Certificate</label><span class="staric">*</span>
                                                                        <div class="custom-file">
                                                                            <input type="file" name="msmeDocName" id="msmeDoc" class="custom-file-input"  placeholder="">
                                                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                                                            <input type="hidden" id="msmeDocs" value="${Contractordetails.msmeDocUrl}" >    
                                                                            <a href="${Contractordetails.msmeDocUrl}" target="blank">${Contractordetails.msmeDocName}</a>
                                                                        </div>
                                                                        <span class="form-text Validatingfield" id="msmeDocerrorpdf"></span>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <label class="">Expiry Date</label><span class="staric">*</span>
                                                                        <div class="input-group date">
                                                                            <form:input path="expiryDate" id="filter-date"  class="form-control"  placeholder="Select date & time" />
                                                                            <div class="input-group-append">
                                                                                <span class="input-group-text"><i class="la la-calendar-check-o glyphicon-th"></i></span>
                                                                            </div>
                                                                        </div>
                                                                        <span class="form-text Validatingfield"></span>
                                                                    </div>

                                                                </div>
                                                            </div>   
                                                        </div>

                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Registration Number</label><span class="staric">*</span>
                                                                    <form:input path="agentRegno" id="agentRegno" style="text-transform: uppercase;" class="input form-control CRN"  placeholder="" />
                                                                    <span class="form-text Validatingfield" id="agentRegnoError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">Registration Certificate</label><span class="staric">*</span>
                                                                    <div></div>
                                                                    <div class="custom-file">	
                                                                        <input type="file" name="agentRegDocName" id="agentRegDoc" class="custom-file-input"  placeholder="">   
                                                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                                                        <input type="hidden" id="agentRegDocs" value="${Contractordetails.agentRegDocUrl}" >
                                                                        <a href="${Contractordetails.agentRegDocUrl}" target="blank">${Contractordetails.agentRegDocName}</a>

                                                                    </div>
                                                                    <span class="form-text Validatingfield" id="agentRegDocerrorpdf"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <label>Organization PAN</label><span class="staric">*</span>
                                                                    <form:input path="orgPAN" id="orgPAN" style="text-transform: uppercase;"  class="form-control PCN"  placeholder=" " />
                                                                    <div class="d-flex justify-content-between" > 
                                                                        <span id="panHolderNameContainer"></span> 
                                                                        <button type="button" class="btn btn-success btn-sm mt-1" onclick="verifyPanNumber()">Verify</button>
                                                                    </div>
                                                                    <span class="form-text Validatingfield" id="orgPANError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">PAN Card</label><span class="staric">*</span>
                                                                    <div></div>
                                                                    <div class="custom-file">
                                                                        <input type="file" name="agentPANDocName" id="agentPANDoc" onchange="fileName(this.id);" value="" class="custom-file-input" placeholder=" "  >
                                                                        <span></span><label class="custom-file-label" for="customFile" id="label1">Choose File</label>
                                                                        <input type="hidden" id="agentPANDocs" value="${Contractordetails.agentPANDocUrl}" >  
                                                                        <a href="${Contractordetails.agentPANDocUrl}" target="blank">${Contractordetails.agentPANDocName}</a>

                                                                    </div>
                                                                    <span class="form-text Validatingfield" id="agentPANDocerrorpdf"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group border_boxesDiv"> 
                                                            <div class="form-group row">
                                                                <div class="col-lg-6 mt-2">
                                                                    <label class="">GSTN No.</label>
                                                                    <form:input path="gistnNo" id="gistnNo"  class="form-control gistn"   placeholder=" " />
                                                                    <div class="d-flex justify-content-between" > 
                                                                        <span id="gstHolderNameContainer"></span> 
                                                                        <button type="button" class="btn btn-success btn-sm mt-1" onclick="verifyGstNumber()">Verify</button>
                                                                    </div>
                                                                    <span class="form-text Validatingfield" id="gistnNoError"></span>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <label class="">Authorized Person Aadhar No.</label><span class="staric">*</span>
                                                                    <form:input path="comAadharNo" id="comAadharNo"  class="form-control ACN"  placeholder=" " />
                                                                    <span id="adharHolderNameContainer"></span>
                                                                    <div class="d-flex d-none justify-content-between" > 
                                                                        <span id=""></span>
                                                                        <button type="button" class="btn btn-success btn-sm mt-1" id="QQ" onclick="sendAadhaarOtp()">Send OTP</button>
                                                                       
                                                                    </div>

                                                                    <div class="d-none" id="otpContainer">
                                                                        <label class="">OTP</label>
                                                                        <form:input path="comAadharNo" id="adharOtp"  class="form-control"  placeholder=" " />
                                                                        <div class="d-flex justify-content-between" > 
                                                                            <span id="otpA"></span> 
                                                                            <button type="button" class="btn btn-success btn-sm mt-1" id="QQ" onclick="sendAadhaarOtp()">ReSend OTP</button><br>
                                                                            <button type="button" class="btn btn-success btn-sm mt-1" onclick="verifyAdharNumber()">Verify</button>
                                                                        </div>
                                                                    </div>


                                                                    <span class="form-text Validatingfield" id="comAadharNoError"></span>
                                                                </div>

                                                            </div>
                                                            <div class="form-group1"  > 
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <label>GISTN Certificate</label>
                                                                        <div class="custom-file">
                                                                            <input type="file" name="gistnDocName" id="gistnDoc" class="custom-file-input"  placeholder="">
                                                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                                                            <input type="hidden" id="gistnDocs" value="${Contractordetails.gistnDocUrl}" >    
                                                                            <a href="${Contractordetails.gistnDocUrl}" target="blank">${Contractordetails.gistnDocName}</a>
                                                                        </div>
                                                                        <span class="form-text Validatingfield" id="gistnDocerrorpdf"></span>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>

                                            <!-- THIRD_STEP_FORM -->
                                            <div class="tab-pane" id="k_portlet_base_demo_3_tab_content" role="tabpanel">
                                                <!--begin::Form-->
                                                <form class="k-form">
                                                    <div id="public">     
                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="flaticon-cogwheel"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Public Limited / Private Limited / LLP
                                                                </h3>
                                                            </div> 
                                                        </div>
                                                        <div class=" documentts"> 
                                                            <div class="k-repeater">
                                                                <div class="k-repeater__data-set">
                                                                    <div>
                                                                        <div>
                                                                            <div class="form-group border_boxesDiv">
                                                                                <div class="k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                                                    <table class="table table-striped- table-bordered table-hover table-checkable " id="addMoreTable2">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Sr.No.</th>
                                                                                                <th>Name of Director<span class="staric" >*</span></th>
                                                                                                <th>DIN Number<span class="staric">*</span></th>
                                                                                        <span id="errorshPANNo"></span>
                                                                                        <th>PAN Of Director<span class="staric">*</span></th>
                                                                                        <th>Aadhar Number<span class="staric">*</span></th>
                                                                                        <th>Mobile Number<span class="staric">*</span></th>
                                                                                        <th>Remove</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody id="public_fields_wrap">
                                                                                            <c:if test="${(empty Contractordetails.contApplication) || ((Contractordetails.contOrganization!='4')&&(Contractordetails.contOrganization!='5')&&(Contractordetails.contOrganization!='6'))}">
                                                                                                <tr>
                                                                                            <input type="hidden" name="contApplication[0].contAppId" id="contAppIdd0" >
                                                                                            <td class="contentMid"><span id="shNo0"><b>1</b></span></td>
                                                                                            <td><span class="form-text Validatingfield" id="shDirName0Error"></span><input type="text" id="shDirName0" name="contApplication[0].shDirName"  style="text-transform: uppercase;" class="form-control" onkeyup="chackName(this);"  placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="dinNo0Error"></span><input type="text" id="dinNo0" name="contApplication[0].dinNo"  class="form-control"  onchange="checkDINNo(this);" placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="shPANNo0Error"></span><input type="text" id="shPANNo0" name="contApplication[0].shPANNo"  class="form-control PCN"   style="text-transform: uppercase;"  placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="shAadharNo0Error"></span><input type="text" id="shAadharNo0" name="contApplication[0].shAadharNo" class="form-control" onchange="checkAadharNo(this);" placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="shMobNo0Error"></span><input type="text" id="shMobNo0" name="contApplication[0].shMobNo"  class="form-control" onchange="checkMobileNo(this);" placeholder=""></td>
                                                                                            <td><button type="button" class="btn btn-hover-danger btn-icon btn-pill"><i class="la la-trash"></i></button></td>
                                                                                            </tr>
                                                                                        </c:if>
                                                                                        <c:if test="${(!empty Contractordetails.contApplication) && ((Contractordetails.contOrganization=='4')||(Contractordetails.contOrganization=='5')||(Contractordetails.contOrganization=='6'))}">
                                                                                            <c:forEach items="${Contractordetails.contApplication}" var="data" varStatus="index">
                                                                                                <tr>
                                                                                                <input type="hidden" name="contApplication[${index.index}].contAppId" id="contAppIdd${index.index}" value="${data.contAppId}">
                                                                                                <td class="contentMid"><span id="shNo${index.index}"><b>${index.index +1}</b></span></td>
                                                                                                <td><span  class="Validatingfield" id="shDirName${index.index}Error"></span><input type="text" id="shDirName${index.index}" name="contApplication[${index.index}].shDirName" style="text-transform: uppercase;" value="${data.shDirName}" class="input form-control Name" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                <td><span  class="Validatingfield" id="dinNo${index.index}Error"></span><input type="text" id="dinNo${index.index}" name="contApplication[${index.index}].dinNo" style="text-transform: uppercase;" onchange="checkDINNo(this); ;" value="${data.dinNo}" class="input form-control DIN" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                <td><span  class="Validatingfield" id="shPANNo${index.index}Error"></span><input type="text" id="shPANNo${index.index}" name="contApplication[${index.index}].shPANNo" value="${data.shPANNo}" style="text-transform: uppercase;" class="input form-control PCN" onchange="uniquePAN(this.id, this.value);" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                <td><span  class="Validatingfield" id="shAadharNo${index.index}Error"></span><input type="text" id="shAadharNo${index.index}" name="contApplication[${index.index}].shAadharNo" value="${data.shAadharNo}" class="input form-control ACN" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                <td><span  class="Validatingfield" id="shMobNo${index.index}Error"></span><input type="text" id="shMobNo${index.index}" name="contApplication[${index.index}].shMobNo" value="${data.shMobNo}" class="input form-control Mobile_No" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                <td><button type="button" class="btn btn-hover-danger btn-icon btn-pill" onclick="deleteRow(this.id)" id="${data.contAppId}"><i class="la la-trash"></i></button></td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                        </c:if>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="k-repeater__add-data">
                                                                    <button type="button" class="btn btn-info btn-sm"  id="addNewBtn1" >
                                                                        <i class="la la-plus"></i> Add More</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <!-----------PARTNERSHIP DIV-------->
                                                <form class="k-form">
                                                    <div id="partnership" >     
                                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                            <div class="k-portlet__head-label">
                                                                <span class="k-portlet__head-icon">
                                                                    <i class="flaticon-cogwheel"></i>
                                                                </span>
                                                                <h3 class="k-portlet__head-title">
                                                                    Partnership Firm
                                                                </h3>
                                                            </div> 
                                                        </div>
                                                        <span style="color:red">Note:  Please enter Percentage to 2 digit of the decimal.</span>
                                                        <div class=" documentts"> 
                                                            <div >
                                                                <div >
                                                                    <div >
                                                                        <div>
                                                                            <div class="form-group border_boxesDiv">
                                                                                <div class="k-portlet--mobile dataTables_wrapper dt-bootstrap4 no-footer">
                                                                                    <table class="table table-striped- table-bordered table-hover table-checkable " id="addMoreTable" >
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Sr.No.</th>
                                                                                                <th style="width: 18%;">Name Of Partner<span class="staric">*</span></th>
                                                                                        <span id="errorPercentage" style="color: red"></span>
                                                                                        <span id="errorDecPoint" style="color: red"></span>
                                                                                        <th>Percentage in Firm <span class="staric">*</span></th>
                                                                                        <span id="errorptnrPANNo"></span>
                                                                                        <th>PAN Of Partner<span class="staric">*</span></th>
                                                                                        <th>Aadhar Number<span class="staric">*</span></th>
                                                                                        <th>Mobile Number<span class="staric">*</span></th>
                                                                                        <th>Remove</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody id="ptnr_fields_wrap">

                                                                                            <c:if test="${(empty Contractordetails.contApplication)||(Contractordetails.contOrganization!='7')}">
                                                                                                <tr>
                                                                                            <input type="hidden" name="contApplication[0].contAppId" id="contAppId0" >
                                                                                            <td class="contentMid"><span id="ptnrNo0"><b>1</b></span></td>
                                                                                            <td><span class="form-text Validatingfield" id="ptnrName0Error"></span><input type="text" id="ptnrName0" name="contApplication[0].ptnrName" style="text-transform: uppercase;" class="form-control" onchange="chackName(this);" placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="ptnrPop0Error"></span><div class="input-group"><input type="text" id="ptnrPop0" name="contApplication[0].ptnrPop" class="form-control totalPercent" oninput="validate_onblure(this);" onblur="getPartnerPercentage();"  placeholder=""><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div></td>
                                                                                            <td><span class="form-text Validatingfield" id="ptnrPANNo0Error"></span><input type="text"  id="ptnrPANNo0" name="contApplication[0].ptnrPANNo" value=""  style="text-transform: uppercase;" class="form-control" onchange="checkPANNo(this);"  placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="ptnrAadharNo0Error"></span><input type="text" id="ptnrAadharNo0" name="contApplication[0].ptnrAadharNo" class="form-control" onchange="checkAadharNo(this);"  placeholder=""></td>
                                                                                            <td><span class="form-text Validatingfield" id="ptnrMobNo0Error"></span><input type="text" id="ptnrMobNo0" name="contApplication[0].ptnrMobNo" class="form-control" onchange="checkMobileNo(this);" placeholder=""></td>
                                                                                            <td><button type="button" class="btn btn-hover-danger btn-icon btn-pill"><i class="la la-trash"></i></button></td>
                                                                                            </tr>
                                                                                        </c:if>
                                                                                        <c:if test="${(!empty Contractordetails.contApplication) && (Contractordetails.contOrganization=='7')}">
                                                                                            <c:forEach items="${Contractordetails.contApplication}" var="data" varStatus="index">
                                                                                                <tr>
                                                                                                <input type="hidden" name="contApplication[${index.index}].contAppId" id="contAppId${index.index}" value="${data.contAppId}">
                                                                                                <div id="ptnrfInput" class="ptnrVal">
                                                                                                    <td class="contentMid"><span id="ptnrNo${index.index}"><b>${index.index +1}</b></span></td>
                                                                                                    <td><span class="Validatingfield" id="ptnrName${index.index}Error"></span><input type="text" id="ptnrName${index.index}" name="contApplication[${index.index}].ptnrName" style="text-transform: uppercase;" value="${data.ptnrName}" class="input form-control Name" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                    <td><span class="Validatingfield" id="ptnrPop${index.index}Error"></span><div class="input-group"><input type="text" id="ptnrPop${index.index}" name="contApplication[${index.index}].ptnrPop" value="${data.ptnrPop}" oninput="validate_onblure(this);" onblur="getPartnerPercentage();" class="input form-control totalPercent" data-toggle="tooltip" data-placement="bottom" placeholder=""><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div></td>
                                                                                                    <td><span class="Validatingfield" id="ptnrPANNo${index.index}Error"></span><input type="text" id="ptnrPANNo${index.index}" name="contApplication[${index.index}].ptnrPANNo" style="text-transform: uppercase;" value="${data.ptnrPANNo}" onchange="uniquePAN(this.id, this.value)" class="input form-control PCN" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                    <td><span class="Validatingfield" id="ptnrAadharNo${index.index}Error"></span><input type="text" id="ptnrAadharNo${index.index}" name="contApplication[${index.index}].ptnrAadharNo" value="${data.ptnrAadharNo}" class="input form-control ACN" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                    <td><span class="Validatingfield" id="ptnrMobNo${index.index}Error"></span><input type="text" id="ptnrMobNo${index.index}" name="contApplication[${index.index}].ptnrMobNo" value="${data.ptnrMobNo}" class="input form-control Mobile_No" data-toggle="tooltip" data-placement="bottom" placeholder=""></td>
                                                                                                </div>
                                                                                                <td><button type="button" class="btn btn-hover-danger btn-icon btn-pill" id="${data.contAppId}" onclick="deleteRow(this.id)"><i class="la la-trash"></i></button></td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                        </c:if>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="form-group border_boxesDiv">
                                                                                    <span>Total:-<span id="totalPer">0</span><span>%</span></span>&nbsp<span>Remaining:-<span id="remPer">100</span><span>%</span></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="k-repeater__add-data">
                                                                    <button type="button" class="btn btn-info btn-sm"  id="add_new_btn">
                                                                        <i class="la la-plus"></i> Add More</button>
                                                                </div> 

                                                            </div>
                                                        </div>
                                                    </div>

                                                </form>
                                                <!-------------------/PARTNERSHIP DIV---------->

                                            </div>

                                        </div>
                                    </div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer block_footer">
                        <div class="modal_time_watch">
                            <button type="submit" class="btn btn-primary"  onclick="logout();"><i class="la la-power-off"></i>SignOut</button>
                        </div>
                        <button type="button" class="btn btn-primary btn_prev" style="display:none;" id="prevBtnId" onclick="prevStepManaging(this.value);">Previous</button>
                        <button type="button" class="btn btn-success"  id="buttonId" value="step1" onclick="saveWizard(this, 'notcomplete');">Save and Next</button>
                        <button type="submit" class="btn btn-success"  id="submitBtnId" value="step2" onclick="saveWizard(this, 'complete');" hidden="true">Submit</button>
                    </div>

                </div>
            </div>
        </div>

        <!--END_TENDER_WIZARD_MODAL_FORM-->

        <!-- begin:: Page -->

        <!-- begin:: Header Mobile -->
        <div id="k_header_mobile" class="k-header-mobile  k-header-mobile--skin-default k-header-mobile--fixed ">
            <div class="k-header-mobile__logo">
                <a href="#">
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
                            <div class="k-content__head-main">
                                <h3 class="k-content__head-title">Contractor Details</h3>
                                <div class="k-content__head-breadcrumbs">
                                    <a href="#" class="k-content__head-breadcrumb-home"><i class="flaticon-home-2"></i></a>
                                    <span class="k-content__head-breadcrumb-separator"></span>
                                    <a href="" class="k-content__head-breadcrumb-link">Dashboards</a>
                                </div>
                            </div>
                            <div class="k-content__head-toolbar">
                                <div class="k-content__head-toolbar-wrapper">

                                    <div class="dropdown dropdown-inline mt-2" data-toggle="k-tooltip" title="Contractor Profile" data-placement="top">
                                        <button type="button" id="cod" class="btn btn-sm btn-elevate btn-brand btn-bold btn-upper" data-toggle="modal" data-target="#contractorProfileWizard" hidden="true">
                                            <i class="la la-user-plus"></i>  Contractor Profile
                                        </button>
                                    </div> 
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- end:: Content -->

                </div>

            </div>

            <!-- end:: Page -->

            <!-- begin::Scrolltop -->
            <div id="k_scrolltop" class="k-scrolltop">
                <i class="la la-arrow-up"></i>
            </div>
            <%--
     <!-------------Quick-Panel START-------------------->
     <%@include file="../Contractor/Tiles/RightSideNav.jsp" %>
     <!-------------Quick-Panel END-------------------->--%>
            <!---End-Modal-Tab-Upload-Documents---> 

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
            <script src=""<c:url value="/resources/assets/demo/custom/components/datatables/basic/basic.js"/>" type="text/javascript"></script> 
            <!--end::Page Vendors -->
            <!--begin::Page Scripts -->
            <!-- <script src="assets/demo/custom/components/datatables/advanced/row-grouping.js" type="text/javascript"></script> -->
            <!--end::Page Scripts -->
            <!--end::Global Theme Bundle -->
            <script src="<c:url value="/resources/assets/demo/bootstrap-datetimepicker.js"/>" type="text/javascript"></script> 
            <script src="<c:url value="/resources/assets/single_date_picker/jquery.datetimepicker.full.js"/>" type="text/javascript"></script>
            <script type="text/javascript" src="<c:url value="/resources/angular/DepartmentUserController.js" />" type="text/javascript"></script>
            <script>
                        $('#filter-date').datetimepicker({
                timepicker: false,
                        format: 'd/m/Y',
                        formatDate: 'Y/m/d'
                });
            </script>
            <script>

                        function verifyPanNumber() {

                        let panNumber = document.getElementById("orgPAN").value;
                                // api call
                                $.ajax({
                                type: "POST",
                                        url: 'ekyc/panVerification',
                                        contentType: 'application/json', // Changed 'Content-Type' to 'contentType'
                                        data: JSON.stringify({// Changed 'body' to 'data'
                                        panNumber: panNumber
                                        }),
                                        success: function (response) {
                                        message = "PAN Verified Successfully";
                                                console.log("SUCCESS >>>>>>>", response.data.Name);
                                                document.getElementById("panHolderNameContainer").textContent = response.data.Name
                                                swal(
                                                        'Success',
                                                        message,
                                                        'success'
                                                        );
                                        },
                                        error: function (e) {

                                        console.log("ERROR >>>>>>>", e);
                                        }
                                });
                        }

                function verifyGstNumber() {

                let gstNumber = document.getElementById("gistnNo").value;
                        // api call
                        $.ajax({
                        type: "POST",
                                url: 'ekyc/gstVerification',
                                contentType: 'application/json', // Changed 'Content-Type' to 'contentType'
                                data: JSON.stringify({// Changed 'body' to 'data'
                                gstNumber: gstNumber
                                }),
                                success: function (response) {
                                message = "GST Verified Successfully";
                                        console.log("SUCCESS >>>>>>>", response.data.Name);
                                        document.getElementById("gstHolderNameContainer").textContent = response.data.companyName
                                        swal(
                                                'Success',
                                                message,
                                                'success'
                                                );
                                },
                                error: function (e) {

                                console.log("ERROR >>>>>>>", e);
                                }
                        });
                }
                let refIdForAadharOTP;
                        function sendAadhaarOtp(){

                        let adharNumber = document.getElementById("comAadharNo").value;
                                $.ajax({
                                type: "POST",
                                        url: 'ekyc/adharVerification',
                                        contentType: 'application/json', // Changed 'Content-Type' to 'contentType'
                                        data: JSON.stringify({// Changed 'body' to 'data'
                                        aadhaarNumber: adharNumber
                                        }),
                                        success: function (response) {
                                        console.log("Success>>>", response.statusCode, "---", response.data)
                                                var x = document.getElementById("QQ");
                                                if (x.style.display === "none") {
                                        x.style.display = "block";
                                        } else {
                                        x.style.display = "none";
                                        }
                                        if (response.statusCode === 200) {
                                        refIdForAadharOTP = response.data
                                                document.getElementById("otpContainer").classList.remove("d-none")                                    }
                                        },
                                        error: function (e) {

                                        console.log("ERROR >>>>>>>", e);
                                        }
                                });
                        }

                function verifyAdharNumber() {

                let adharOtp = document.getElementById("adharOtp").value;
//                            alert(adharOtp)
                        console.log("refIdForAadharOTP >>>>>>>>", refIdForAadharOTP)
                        // api call
                        $.ajax({
                        type: "POST",
                                url: 'ekyc/aadhar-otp-verification',
                                contentType: 'application/json', // Changed 'Content-Type' to 'contentType'
                                data: JSON.stringify({// Changed 'body' to 'data'
                                refNumber : refIdForAadharOTP,
                                        otp: adharOtp

                                }),
                                success: function (response) {
                                message = "Aadhaar Verified Successfully";
                                        console.log("-----------SUCCESS-----------", response.data);
                                        document.getElementById("adharHolderNameContainer").textContent = response.data.Name
                                        document.getElementById("otpContainer").classList.add("d-none")
                                        swal(
                                                'Success',
                                                message,
                                                'success'
                                                );
                                },
                                error: function (e) {

                                console.log("ERROR >>>>>>>", e);
                                }
                        });
                }




                $(document).ready(function () {

                $(".btn_next").click(function (e) {
                //                function nextStep(e){
                $('.btn_next').prev("button").css("display", "block");
                        var li_first = $('.nav-tabs-btn');
                        console.log(li_first);
                        var $active = $('.nav-tabs-btn .nav-item a.active');
                        $($active).addClass("sve_class_cl");
                        $($active).find('.nav-link-title').hide();
                        $($active).find('.fa').show();
                        nextTab($active);
                });
                        //                }
                        $(".btn_prev").click(function (e) {
                var $active = $('.nav-tabs-btn .nav-item a.active.show');
                        var current_li = $('.nav-tabs-btn .nav-item a.active.show').closest('li').attr('id');
                        var first_li = $('.nav-tabs-btn').find('li:nth-child(2)').attr('id');
                        if (current_li && (current_li === first_li)) {
                console.log("remove previous button");
                        //                         $('.btn_next').prev("button").css("display", "none");
                        $('.btn_prev').css("display", "none");
                }
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
                                $(elem).removeClass("sve_class_already");
                                $(li).next('li').find('a').click();
                        }

                function prevTab(elem) {
                var li = $(elem).closest("li");
                        $(li).find('a').removeClass('active show');
                        $(li).find('a').addClass('sve_class_already');
                        $(li).prev('li').find('a').click();
                        $(li).prev('li').find('a').removeClass('sve_class_cl');
                        $(li).prev('li').find('a').addClass('sve_class_already');
                        $(li).prev('li').find('a').find('.nav-link-title').show();
                        $(li).prev('li').find('a').find('.fa').hide();
                }
            </script>

            <script>

                //deleting the add more button row      
                function deleteRow(rowid) {

                //            $("#" + rowid).closest('tr').remove();
                if (rowid != null) {
                $.ajax({
                url: "deleteRow?rowId=" + rowid,
                        method: 'POST',
                        success: function (response) {
                        //  alert("row is deleted");
                        $("#" + rowid).closest('tr').remove();
                        }, error: function (error) {
                //  alert("error : " + error);
                }
                });
                }
                }
                //To fetch the city by stateId
                function myCity(stateid, cityid) {
                //       alert(stateid);
                $.ajax({
                type: "GET",
                        url: 'getCityByAjax',
                        data: {'stateid': stateid},
                        success: function (response) {
                        //                    alert("fetching cities"+response);
                        var $select = $('#foreignCity');
                                $select.find('option').remove();
                                $('<option>').val("-1").text("Select City").appendTo($select);
                                $.each(JSON.parse(response), function (key, value) {
                                $('<option>').val(value["city_id"]).text(value["city_name"]).appendTo($select);
                                });
                                if (cityid != '0') {
                        $('#foreignCity').val(cityid);
                        }
                        document.getElementById('wait').style.display = 'none';
                        },
                        error: function (e) {
                        //                   alert('Error:in fetching cities' + e);
                        document.getElementById('wait').style.display = 'none';
                        }
                });
                }
                function myIndianCity(stateid, cityid) {
                //alert(stateid);
                $.ajax({
                type: "GET",
                        url: 'getCityByAjax',
                        data: {'stateid': stateid},
                        success: function (response) {
                        // alert(response);
                        var $select = $('#agentCity');
                                $select.find('option').remove();
                                $('<option>').val("-1").text("Select City").appendTo($select);
                                $.each(JSON.parse(response), function (key, value) {
                                $('<option>').val(value["city_id"]).text(value["city_name"]).appendTo($select);
                                });
                                if (cityid != '0') {
                        $('#agentCity').val(cityid);
                        }
                        document.getElementById('wait').style.display = 'none';
                        },
                        error: function (e) {
                        //alert('Error: ' + e);
                        document.getElementById('wait').style.display = 'none';
                        }
                });
                }
                //Fetch state on the basis of country id
                function mystate(countryid, stateid) {
                //                 alert("stateid"+stateid);
                //           alert(countryid);
                $.ajax({
                type: "GET",
                        url: 'getStateByAjax',
                        data: {'countryid': countryid},
                        success: function (response) {
                        //                            alert("fetch state"+response);
                        var $select = $('#foreignState');
                                $select.find('option').remove();
                                $('<option>').val("-1").text("Select State").appendTo($select);
                                $.each(JSON.parse(response), function (key, value) {
                                $('<option>').val(value["state_id"]).text(value["state_name"]).appendTo($select);
                                });
                                if (stateid != '0') {
                        $('#foreignState').val(stateid);
                        }
                        document.getElementById('wait').style.display = 'none';
                        },
                        error: function (e) {
                        //                    alert('Error: in fetching state ' + e);
                        document.getElementById('wait').style.display = 'none';
                        }
                });
                }
                //To fetch the districts by stateId
                function myDistrict(stateid) {

                $.ajax({
                type: "GET",
                        url: 'getDistrictsByAjax',
                        data: {'stateid': stateid},
                        success: function (response) {
                        //   alert(response);
                        var $select = $('#district');
                                $select.find('option').remove();
                                $('<option>').val("-1").text("Select District").appendTo($select);
                                $.each(JSON.parse(response), function (key, value) {
                                $('<option>').val(value["district_id"]).text(value["district_name"]).appendTo($select);
                                });
                                document.getElementById('wait').style.display = 'none';
                        },
                        error: function (e) {
                        //                         alert('Error: ' + e);
                        document.getElementById('wait').style.display = 'none';
                        }
                });
                }
            </script>
            <script>
                $(document).ready(function () {
                $("#otherOrg").hide();
                        $("#msmeDiv").hide();
                        $("#contClassDiv").hide();
                        var fCountryId = $('#country_id').val();
                        var city = $('#agentCityId').val();
                        var fStateId = $('#stateid').val();
                        var fcityId = $('#cityid').val();
                        var state_id = $('#agentState').val();
                        //                 alert("country id"+fCountryId);
                        if (fCountryId != null || fCountryId != '' || fCountryId != '0' || fCountryId != '-1') {
                mystate(fCountryId, fStateId);
                }
                //                 alert("foreign state id:"+fStateId);
                if (fStateId != null || fStateId != '' || fStateId != '-1') {
                myCity(fStateId, fcityId);
                }
                //                 alert("foreign cityId"+fcityId);
                //                 alert("indian state id"+state_id);
                if (city != null || city != '' || city != '-1') {
                myIndianCity(state_id, city);
                }
                //on selection of other in type of organization
                var prevOrgType = $("#contOrganization").val();
                        $('#contOrganization').change(function () {
                var orgType = $("#contOrganization").val();
                        console.log("prevOrgType  " + prevOrgType);
                        var contOtherId = $("#contOtherId").val();
                        //                 alert("contOtherId ::: "+contOtherId);
                        if (contOtherId == 0 || contOtherId == null) {
                console.log("id is 0");
                } else {
                var chngeOrgType = confirm("If you change the Type Of Organization your previous information will be lost");
                        if (chngeOrgType == true)
                {
                $.ajax({
                url: "deleteOrg?contOtherId=" + contOtherId,
                        method: 'POST',
                        success: function (response) {
                        //                            alert("response:" + response);
                        //                            alert("Row is deleted");
                        }, error: function (error) {
                //                    alert("error : " + error);
                }
                });
                } else {
                $("#contOrganization").val(prevOrgType);
                        console.log("chngeOrgType  " + chngeOrgType);
                }
                }
                if (orgType === "7") {
                $("#public").hide();
                        $("#partnership").show();
                } else {
                $("#partnership").hide();
                }
                if ((orgType === "4") || (orgType == "5") || (orgType == "6")) {
                $("#partnership").hide();
                        $("#public").show();
                } else {
                $("#public").hide();
                }
                if (orgType != '11')
                {
                $("#otherOrg").hide();
                } else {
                $("#otherOrg").show();
                }
                if ((orgType === "4") || (orgType === "5") || (orgType === "6") || (orgType === "7")) {
                $('#submitBtnId').hide();
                        $('#buttonId').show();
                } else {
                $('#buttonId').hide();
                        $('#submitBtnId').removeAttr('hidden');
                }
                });
                        var companyType = "${Contractordetails.contCompanyType}";
                        //           alert("companyType"+companyType);
                        if (companyType != '3') {
                $("#msmeDiv").show();
                } else {
                $("#msmeDiv").hide();
                }
                $('#contCompanyType').change(function () {
                var comType = $("#contCompanyType").val();
                        //              alert("comType"+comType);
                        if (comType != '3')
                {
                $("#msmeDiv").show();
                } else {
                $("#msmeDiv").hide();
                }
                });
                        var contractorClass = "${Contractordetails.contractorClass}";
                        //         alert("contractorClass"+contractorClass);
                        if (contractorClass !== "1") {
                $("#contClassDiv").show();
                } else {
                $("#contClassDiv").hide();
                }
                var organizationType = "${Contractordetails.contOrganization}";
                        if (organizationType === "11")
                {
                $("#otherOrg").show();
                } else {
                $("#otherOrg").hide();
                }
                //            alert("organizationType"+organizationType);
                if (organizationType === "7") {
                $("#public").hide();
                        $("#partnership").show();
                } else {
                $("#partnership").hide();
                }
                if ((organizationType === "4") || (organizationType === "5") || (organizationType === "6")) {
                $("#partnership").hide();
                        $("#public").show();
                } else {
                $("#public").hide();
                }
                if ((organizationType === "4") || (organizationType === "5") || (organizationType === "6") || (organizationType === "7")) {
                $('#submitBtnId').hide();
                        $('#buttonId').show();
                } else {
                $('#buttonId').hide();
                        $('#submitBtnId').removeAttr('hidden');
                }
                });
                        function  showClass(name) {
                        if (name.value !== "1") {
                        alert("Please Upload Your Contractor Class Certificate");
                                $("#contClassDiv").show();
                        } else {
                        $("#contClassDiv").hide();
                        }

                        }

                function logout() {
                //         alert("logout  contractor");      
                window.location.href = "logoutContractor";
                }


            </script>
            <script>
                function stepManaging(step) {
                var st = step.substring(step.length - 1);
                        //     alert("current step is:"+step);
                        var newStep = "step";
                        var stloop = parseInt(st);
                        if (stloop < 3) {
                stloop = stloop + 1;
                        newStep = newStep + stloop;
                }
                //    $('#butttonId').attr('disabled', 'disabled');
                //                alert($('#butttonId').attr('disabled', 'disabled'));
                if (stloop == 3) {
                newStep = "step3";
                        //                    $("#buttonId").attr('disabled', 'disbled');
                }
                $("#buttonId").val(newStep);
                        $("#prevBtnId").val(newStep);
                        // alert(" next Step is:   "+newStep);
                        return step;
                }

                function prevStepManaging(step) {
                var st = step.substring(step.length - 1);
                        //   alert("current step is:"+step);
                        var newStep = "step";
                        var stloop = parseInt(st);
                        if (stloop > 1) {
                stloop = stloop - 1;
                        newStep = newStep + stloop;
                }
                $("#prevBtnId").val(newStep);
                        $("#buttonId").val(newStep);
                        //  alert("previous step is: "+newStep);
                        return step;
                }
                function saveWizard(step, status)
                {
                var myDiv = document.getElementById('scrollingEffect');
                        myDiv.scrollTop = 0;
                        $('#preloaderSpinner_1').css('z-index', '99999');
                        $('#preloaderSpinner_1').css('opacity:', '0.8');
                        $('#preloaderSpinner_1').css('background:', '#ffffff4d', '!important');
                        $("#preloaderSpinner_1").show();
                        //        alert("saveWizard  step is:  "+step.value +"status"+status);
                        console.log(step.value);
                        if (step.value === 'step1') {
                var firstStepResult = firstStepValidation();
                        //                    alert(firstStepResult);
                        if (firstStepResult === 1) {
                console.log("validate");
                } else {
                return;
                }
                }
                if (step.value === 'step2') {
                var secondStepResult = secondStepValidation();
                        //                    alert(secondStepResult);
                        if (secondStepResult === 1) {
                console.log("validate");
                } else {
                return;
                }
                }
                if (step.value === 'step3') {
                var organizationType = $("organizationType").val();
                        if (organizationType === '7') {
                var totalPer = $("#totalPer").html();
                        // alert(":totalPer "+totalPer);
                        if (totalPer != '100.00')
                        return false;
                }
                var thirdStepResult = thirdStepValidation();
                        status = 'complete';
                        console.log("thirdStepResult " + thirdStepResult);
                        if (thirdStepResult === true) {
                console.log("validate");
                } else {
                return;
                }
                }
                var formData = new FormData();
                        $('#contractorDiv').find('input[type != file],textarea,select').each(function () {
                formData.append(this.name, this.value);
                });
                        if (step.value === "step1") {
                //CONDITION FOR FORIEGN REGISTRATION CERTIFICATE      
                var regdoc = document.getElementById('foreignRegDoc').files[0];
                        var doc1 = $("#foreignRegDocs").val();
                        // alert("foreignRegDoc      "+regdoc+"DOC1      "+doc1);
                        if ((typeof regdoc == "undefined" || regdoc == '') && (doc1 == '' || doc1 == null)) {
                //                        alert("Please Upload Foreign Registration Certificate");
                $("#foreignRegDocError").html("Please Select  Registration Certificate");
                } else if (!(typeof regdoc == "undefined" || regdoc == '') || (doc1 == '' || doc1 == null)) {
                var result = checkPdfFile('foreignRegDoc');
                        if (result == true) {
                //alert("@@@@@@@@@@@@@@@@regdoc");       
                formData.append("foreignRegDoc", document.getElementById('foreignRegDoc').files[0]);
                        $("#foreignRegDocError").html(" ");
                }
                } else if ((typeof regdoc == "undefined" || regdoc == '') && (doc1 != '' || doc1 != null)) {
                //                        alert("!!!!!!!!!!!!!!!!!!!foreignRegDoc");
                }
                //CONDITION FOR TINDOC REGISTRATION CERTIFICATE
                var tindoc = document.getElementById('foreignTINDoc').files[0];
                        var doc2 = $("#foreignTINDocs").val();
                        //             alert("foreignTINDoc      "+tindoc+"doc2      "+doc2);
                        if ((typeof tindoc == "undefined" || tindoc == '') && (doc2 == '' || doc2 == null)) {
                //                        alert("Please Upload TIN Document Certificate");
                $("#foreignTINDocError").html("Please Select TIN Document Certificate");
                } else if (!(typeof tindoc == "undefined" || tindoc == '') || (doc2 == '' || doc2 == null)) {
                var result1 = checkPdfFile('foreignTINDoc');
                        if (result1 == true) {
                //                 alert("@@@@@@@@@@@@@@@@foreignTINDoc");       
                formData.append("foreignTINDoc", document.getElementById('foreignTINDoc').files[0]);
                        $("#foreignTINDocError").html(" ");
                }
                } else if ((typeof tindoc == "undefined" || tindoc == '') && (doc2 != '' || doc2 != null)) {
                //               alert("!!!!!!!!!!!!!!!!!!!");       
                }
                }
                if (step.value === "step2") {
                var gistnValue = $("#gistnNo").val();
                        console.log("gistnValue : " + gistnValue);
                        if (gistnValue == null || gistnValue == '')
                {
                console.log("gistn values is null");
                } else {
                var gistnDocFile = document.getElementById('gistnDoc').files[0];
                        if ((typeof gistnDocFile == "undefined" || tindoc == '')) {
                console.log("file is not uploaded");
                } else {
                var result = checkPdfFile('gistnDoc');
                        if (result == true) {
                formData.append("gistnDoc", document.getElementById('gistnDoc').files[0]);
                        console.log("Gistn  doc is:  " + formData);
                        $("#gistnDocError").html(" ");
                }
                }
                }
                //                    alert("#$%@#$%34534%"+step.value);
                //CONDITIONS FOR REGISTRATION CERTIFICATE OF INDIAN AGENT
                var regdoc = document.getElementById('agentRegDoc').files[0];
                        var doc1 = $("#agentRegDocs").val();
                        //             alert("regdoc      "+regdoc+"DOC1      "+doc1);
                        if ((typeof regdoc == "undefined" || regdoc == '') && (doc1 == '' || doc1 == null)) {
                alert("Please Upload Agent Registration Certificate");
                        $("#agentRegDocError").html("Please Select  Registration Certificate");
                } else if (!(typeof regdoc == "undefined" || regdoc == '') || (doc1 == '' || doc1 == null)) {
                var result = checkPdfFile('agentRegDoc');
                        if (result == true) {
                formData.append("agentRegDoc", document.getElementById('agentRegDoc').files[0]);
                        console.log("Reg doc is:  " + formData);
                        $("#agentRegDocError").html(" ");
                }
                } else if ((typeof regdoc == "undefined" || regdoc == '') && (doc1 != '' || doc1 != null)) {
                //               alert("!!!!!!!!!!!!!!!!!!!regdoc");       
                }
                //CONDITIONS FOR PAN CARD OF INDIAN AGENT
                var pandoc = document.getElementById('agentPANDoc').files[0];
                        var doc2 = $("#agentPANDocs").val();
                        //             alert("agentPANDoc      "+pandoc+"doc2      "+doc2);
                        if ((typeof pandoc == "undefined" || pandoc == '') && (doc2 == '' || doc2 == null)) {
                alert("Please Upload PAN CARD Certificate");
                        $("#agentPANDocError").html("Please Select PAN CARD");
                } else if (!(typeof pandoc == "undefined" || pandoc == '') || (doc2 == '' || doc2 == null)) {
                var result1 = checkPdfFile('agentPANDoc');
                        if (result1 == true) {
                //                 alert("@@@@@@@@@@@@@@@@agentPANDoc");       
                formData.append("agentPANDoc", document.getElementById('agentPANDoc').files[0]);
                        console.log("pan doc is:  " + formData);
                        $("#agentPANDocError").html(" ");
                }
                } else if ((typeof pandoc == "undefined" || pandoc == '') && (doc2 != '' || doc2 != null)) {
                //               alert("!!!!!!!!!!!!!!!!!!!pandoc");       
                }
                //CONDITIONS FOR CONTRACTOR CLASS DOCUMENTS
                var contClass = $('#contractorClass').val();
                        if (contClass != '1') {
                var contClassdoc = document.getElementById('contractorClassDoc').files[0];
                        var doc3 = $("#contractorClassDocs").val();
                        //             alert("contClassdoc      "+contClassdoc+"doc3      "+doc3);
                        if ((typeof contClassdoc == "undefined" || contClassdoc == '') && (doc3 == '' || doc3 == null)) {
                //                            alert("Please Upload Contractor Class Certificate"); 
                $("#contractorClassDocError").html("Please Select Contractor Class Certificate");
                } else if (!(typeof contClassdoc == "undefined" || contClassdoc == '') || (doc3 == '' || doc3 == null)) {
                var result3 = checkPdfFile('contractorClassDoc');
                        if (result3 == true) {
                //                 alert("@@@@@@@@@@@@@@@@contClassdoc");       
                formData.append("contractorClassDoc", document.getElementById('contractorClassDoc').files[0]);
                        $("#contractorClassDocError").html(" ");
                }
                } else if ((typeof contClassdoc == "undefined" || contClassdoc == '') && (doc3 != '' || doc3 != null)) {
                //               alert("!!!!!!!!!!!!!!!!!!!contClassdoc");       
                }
                }
                //CONDITIONS FOR MSME/NSIC DOCUMENTS
                var comType = $('#contCompanyType').val();
                        /// alert("comType is:"+comType);
                        if (comType != '3') {
                var msmeDocument = document.getElementById('msmeDoc').files[0];
                        var doc4 = $("#msmeDocs").val();
                        //             alert("msmeDocument      "+msmeDocument+"doc2      "+doc2);
                        if ((typeof msmeDocument == "undefined" || msmeDocument == '') && (doc4 == '' || doc4 == null)) {
                //                            alert("Please Upload MSME/NSIC Certificate");
                $("#msmeDocError").html("Please Select MSME/NSIC Certificate");
                } else if (!(typeof msmeDocument == "undefined" || msmeDocument == '') || (doc4 == '' || doc4 == null)) {
                var msmeRes = checkPdfFile('msmeDoc');
                        if (msmeRes == true) {
                //                 alert("@@@@@@@@@@@@@@@@msmeDoc");       
                formData.append("msmeDoc", document.getElementById('msmeDoc').files[0]);
                        $("#msmeDocError").html(" ");
                }
                } else if ((typeof msmeDocument == "undefined" || msmeDocument == '') && (doc4 != '' || doc4 != null)) {
                //               alert("!!!!!!!!!!!!!!!!!!!msmeDocument");       
                }
                }
                }
                var contOtherId = $("#contOtherId").val();
                        var openStep = '<%= session.getAttribute("step")%>';
                        if (openStep !== 'null') {
                status = 'complete';
                }
                //                  alert(contOtherId);
                //                 if((result==true && result1==true) ||(step=="complete")){
                $.ajax({
                url: "saveContractordetails?contOtherId=" + contOtherId + "&step=" + step.value + "&status=" + status,
                        method: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                        $("#preloaderSpinner_1").hide();
                                //   alert("response  "+response);
                                var obj = JSON.parse(response);
                                $.each(obj, function (key, value) {
                                //                              alert("length"+obj.length);
                                var length = obj.length - 1;
                                        if (key == "res") {
                                $("#contOtherId").val(value[0]);
                                        var length = value.length - 1;
                                        if (value[length] == '7') {
                                var id = 1;
                                        for (var i = 1; i < length; i++) {
                                id = i - 1;
                                        $("#contAppId" + id).val(value[i]);
                                        $("#contAppIds" + id).val(value[i]);
                                }
                                }
                                if ((value[length] == '4') || (value[length] == '5') || (value[length] == '6')) {
                                var id = 1;
                                        for (var i = 1; i < length; i++) {
                                id = i - 1;
                                        $("#contAppIdd" + id).val(value[i]);
                                        $("#contAppIdds" + id).val(value[i]);
                                }
                                }
                                console.log("validation");
                                        var validate = $('#buttonId').val();
                                        console.log("validate " + validate);
                                        if (validate == 'step2') {
                                console.log("validate::::::: " + validate);
                                        //                                    document.getElementById("butttonId").disabled = true;
                                        //                                    $('#buttonId').prop('disabled', true);
                                }
                                var openStep = '<%= session.getAttribute("step")%>';
                                        //                             alert("oopenStep    "+openStep);
                                        if (status == 'notcomplete' && openStep == 'null') {
                                //                                    alert("inside 1st if ");
                                if (openStep == 'null') {
                                validationTrueAndNext(step);
                                        stepManaging(step.value);
                                }
                                } else if (status == 'complete' && openStep == 'null') {
                                //                                        alert("inside 2st if ");
                                closeWizard();
                                        window.location.href = 'contractorDashboard';
                                } else if (openStep !== 'null') {
                                //                                        alert("inside 3st if ");
                                $('#cod').click();
                                        window.location.href = 'viewPrimaryContractor';
                                }
                                $("#" + key).css("border-color", "green");
                                } else {
                                //                                    alert("error is: " + key);
                                $("#" + key + "Error").html(value);
                                        $("#" + key).css("border-color", "red");
                                }

                                });
                        }, error: function (error) {
                //                            alert("error : " + error);
                return false;
                }
                });
                }
                //Client side validation for pdf
                function checkPdfFile(fileId)
                {
                document.getElementById(fileId + "errorpdf").innerHTML = "";
                        // alert("checkpdf file");
                        var file = fileId;
                        // alert("id is:" + thisform);
                        var fileName = document.getElementById(fileId).value;
                        // alert("filename is:" + fileName);
                        //  var numb = file.substring(file.length - 1);
                        var fileSize = document.getElementById(fileId).files[0].size;
                        fileSize = parseInt(fileSize);
                        //alert("file number is:" + numb);
                        var format = fileName.substring(fileName.lastIndexOf('.') + 1);
                        if (!format.match("pdf") && !format.match("PDF")) {
                //                        alert(fileId+"errorpdf");
                document.getElementById(fileId + "errorpdf").innerHTML = "Please Upload Valid pdf file";
                        return false;
                } else if (fileSize > 10485760) {
                document.getElementById(fileId + "errorpdf").innerHTML = "File Size must be less than 10MB.";
                        return false;
                } else if (fileName = '') {

                document.getElementById(fileId + "errorpdf").innerHTML = ""
                        return false;
                } else {
                //            alert("end");
                return true;
                }
                return true;
                }

                function uniquePAN(id, value) {
                //            alert("id is:"+id);
                var idval = id.slice(0, - 1);
                        // alert("idval"+idval);

                        // alert("value is:"+value);
                        var PAN = value;
                        $.ajax({
                        url: "uniquePAN_no",
                                data: {PANNo: PAN},
                                success: function (res) {
                                // alert(res);
                                if (res !== "valid PAN Number") {
                                //alert("done");
                                $("#" + id + "Error").css('color', 'red');
                                        $("#" + id + "Error").html("PAN Number is already exist");
                                        if (idval === "ptnrPANNo") {
                                $("#add_new_btn").attr('disabled', 'disabled');
                                } else if (idval === "shPANNo") {
                                $("#addNewBtn1").attr('disabled', 'disabled');
                                        $("#steps3").removeAttr('disabled');
                                }

                                // $('#steps2').attr('disabled', 'disabled'); 
                                } else {
                                $("#" + id + "Error").css('color', 'red');
                                        $("#" + id + "Error").html("");
                                        // $('#steps2').removeAttr('disabled'); 
                                        if (idval === "ptnrPANNo") {
                                $("#add_new_btn").removeAttr('disabled');
                                } else if (idval === "shPANNo") {
                                $("#addNewBtn1").removeAttr('disabled');
                                }
                                }
                                }, error: function (error) {
                        //                    alert("error : "+error); 
                        }
                        });
                }
                function closeWizard() {
                $("#cod").click();
                }
            </script>
            <script>
                $(document).ready(function () {
                var x = 0;
                        var y = 0;
                        var sum = 0;
                        $("#add_new_btn").click(function () {
                var result = checkRow('ptnr_fields_wrap');
                        var sumResult = getPartnerPercentage();
                        //                    alert("sumresult "+sumResult);
                        if (result == true && sumResult === 'less') {
                //                   alert("clicked");
                var id = $('#addMoreTable tr:last').find("span[id*='ptnrNo']").attr('id');
                        if (typeof id == "undefined" || id == '')
                        x = - 1;
                        else
                        x = id.match(/\d+/);
                        x++;
                        //                   alert("new row id is : " + x);
                        var count = x + 1;
                        //                   alert("count is:" + count);
                        var html = '';
                        html += '<tr class="deleteBtn">';
                        html += '<input type="hidden" name="contApplication[' + x + '].contAppId" id="contAppId' + x + '">';
                        html += '<td class="contentMid"><span class="Validatingfield" id="ptnrNo' + x + 'Error"></span><span id="ptnrNo' + x + '"><b>' + count + '</b></span></td>';
                        html += '<td><span class="form-text Validatingfield" id="ptnrName' + x + 'Error"></span><input type="text" id="ptnrName' + x + '" name="contApplication[' + x + '].ptnrName"  style="text-transform: uppercase;" class="form-control" onchange="chackName(this);" placeholder=""></td>';
                        html += '<td><span class="form-text Validatingfield" id="ptnrPop' + x + 'Error"></span><div class="input-group"><input type="text" id="ptnrPop' + x + '" name="contApplication[' + x + '].ptnrPop"  class="form-control totalPercent" oninput="validate_onblure(this);" onblur="getPartnerPercentage();"  placeholder=""><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div></td>';
                        html += '<td><span class="form-text Validatingfield" id="ptnrPANNo' + x + 'Error"></span><input type="text" id="ptnrPANNo' + x + '" name="contApplication[' + x + '].ptnrPANNo"  class="form-control"  onchange="checkPANNo(this);" style="text-transform: uppercase;"  placeholder=""></td>';
                        html += '<td><span class="form-text Validatingfield" id="ptnrAadhar' + x + 'Error"></span><input type="text" id="ptnrAadhar' + x + '" name="contApplication[' + x + '].ptnrAadharNo"  class="form-control" onchange="checkAadharNo(this);" placeholder=""></td>';
                        html += '<td><span class="form-text Validatingfield" id="ptnrMobNo' + x + 'Error"></span><input type="text" id="ptnrMobNo' + x + '" name="contApplication[' + x + '].ptnrMobNo"  class="form-control"  onchange="checkMobileNo(this);" placeholder=""></td>';
                        html += '<td><button type="button"  class="btn btn-hover-danger btn-icon btn-pill delete_Btn1"  onclick="deleteRow(this.id)" id="contAppIds' + x + '"><i class="la la-trash"></i></button></td></tr>';
                        $("#ptnr_fields_wrap").append(html);
                        $("#buttonId").attr('disabled', 'disabled');
                } else if (result == true && sumResult === 'equal') {
                $("#add_new_btn").attr('disabled', 'disabled');
                        $('#buttonId').removeAttr('disabled');
                } else if (result == true && sumResult === 'more') {
                $("#add_new_btn").attr('disabled', 'disabled');
                        $("#buttonId").attr('disabled', 'disabled');
                }
                });
                        $("#ptnr_fields_wrap").on("click", ".delete_Btn1", function (e) { //user click on remove text
                e.preventDefault();
                        $(this).closest('tr').remove();
                        $("#add_new_btn").removeAttr('disabled');
                });
                        $("#addNewBtn1").click(function () {
                var fieldResult = checkRow('public_fields_wrap');
                        if ((fieldResult == true)) {
                $("#buttonId").removeAttr('disabled');
                        var id = $('#addMoreTable2 tr:last').find("span[id*='shNo']").attr('id');
                        if (typeof id == "undefined" || id == '')
                        y = - 1;
                        else
                        y = id.match(/\d+/);
                        y++;
                        //                    alert("after" + y);
                        var count = y + 1;
                        //                    alert("new row id is:" + y);
                        var html = '';
                        html += '<tr class="deleteBtn1">';
                        html += '<input type="hidden" name="contApplication[' + y + '].contAppId" id="contAppIdd' + y + '" readonly="true">';
                        html += '<td class="contentMid"><span class="Validatingfield" id="shNo' + y + 'Error"></span><span id="shNo' + y + '"><b>' + count + '</b></span></td>';
                        html += '<td><span  class="form-text Validatingfield" id="shDirName' + y + 'Error"></span><input type="text" id="shDirName' + y + '" name="contApplication[' + y + '].shDirName" value="" style="text-transform: uppercase;" class="form-control"  placeholder="" onkeyup="chackName(this);"></td>';
                        html += '<td><span  class="form-text Validatingfield" id="dinNo' + y + 'Error"></span><input type="text" id="dinNo' + y + '" name="contApplication[' + y + '].dinNo"  onchange="checkDINNo(this);" style="text-transform: uppercase;" value="" class="form-control"  placeholder=""></td>';
                        html += '<td><span  class="form-text Validatingfield" id="shPANNo' + y + 'Error"></span><input type="text" id="shPANNo' + y + '" name="contApplication[' + y + '].shPANNo" style="text-transform: uppercase;" value="" class="form-control" onchange="checkPANNo(this);"  placeholder=""></td>';
                        html += '<td><span  class="form-text Validatingfield" id="shAadharNo' + y + 'Error"></span><input type="text" id="shAadharNo' + y + '" name="contApplication[' + y + '].shAadharNo" value="" class="form-control" onchange="checkAadharNo(this);"  placeholder=""></td>';
                        html += '<td><span  class="form-text Validatingfield" id="shMobNo' + y + 'Error"></span><input type="text" id="shMobNo' + y + '" name="contApplication[' + y + '].shMobNo" value="" class="form-control" onchange="checkMobileNo(this);" placeholder=""></td>';
                        html += '<td> <button type="button"  class="btn btn-hover-danger btn-icon btn-pill delete_Btn2" onclick="deleteRow(this.id)" id="contAppIdds' + y + '"><i class="la la-trash"></i></button></td></tr>';
                        $("#public_fields_wrap").append(html);
                }
                });
                        $("#public_fields_wrap").on("click", ".delete_Btn2", function (e) { //user click on remove text
                //            alert("delete button is clicked");
                e.preventDefault();
                        $(this).closest('tr').remove();
                        $("#addNewBtn1").removeAttr('disabled');
                });
                        function checkRow(tbodyId) {
                        //                alert("tbody"+tbodyId);
                        var validate = true;
                                $('#' + tbodyId).find('tr input[type=text]').each(function () {
                        if ($(this).val() == "") {
                        validate = false;
                        }
                        });
                                if (validate) {
                        if (tbodyId == 'ptnr_fields_wrap') {
                        $('#add_new_btn').removeAttr('disabled');
                        } else {
                        $('#steps3').removeAttr('disabled');
                        }
                        $('#add_new_btn').removeAttr('disabled');
                                //                 alert("Form is validate");
                                //                 $("#steps3").removeAttr('disabled');
                                return true;
                        } else {
                        if (tbodyId == 'ptnr_fields_wrap') {
                        $('#add_new_btn').attr('disabled', 'disabled');
                                //                            $("#buttonId").attr('disabled', 'disabled');
                                alert("Please fill all the details");
                        } else {
                        //                     $('#addNewBtn1').attr('disabled','disabled')
                        alert("please fill all the details");
                                //                            $("#buttonId").attr('disabled', 'disabled');
                        }
                        //                 $('#steps3').attr('disabled','disabled');     

                        return false;
                        }
                        }

                });
            </script>

            <script type="text/javascript">
                        $(document).ready(function () {
                var commonLogonId = '<%= session.getAttribute("commonLoginId")%>';
                        var step = '<%= session.getAttribute("step")%>';
                        var contType = '<c:out value="${contractor.contractorType}"></c:out>';
                        var contractorEmail = '<c:out value="${contractor.emailid}"></c:out>';
                        var contractorMob = '<c:out value="${contractor.mobileno}"></c:out>';
                        var contractorFName = '<c:out value="${contractor.firstname}"></c:out>';
                        var contractorLName = '<c:out value="${contractor.lastname}"></c:out>';
                        var contractorMName = '<c:out value="${contractor.middlename}"></c:out>';
                        var contractor = '<c:out value="${contractor}"></c:out>';
                        var contractordetails = '<c:out value="${Contractordetails}"></c:out>';
                        $('#contractorType').val(contType);
                        console.log("contType   " + contType + " contractorEmail : " + contractorEmail + "  contractorMob + " + contractorMob + "  contractorFName" + contractorFName);
                        if (contType === "indian") {
                $('#buttonId').prev("button").css("display", "none");
                        var li_first = $('.nav-tabs-btn');
                        console.log(li_first);
                        var $active = $('.nav-tabs-btn .nav-item a.active');
                        //                $($active).addClass("sve_class_cl");
                        //                $($active).find('.nav-link-title').hide();
                        //                $($active).find('.fa').show();
                        nextTab($active);
                        $("#buttonId").val('step2');
                        //            $("#steps1").removeAttr('disabled');
                        //            $("#steps1").click();
                        if (contractorMName != null) {
                $('#IndianmName').val(contractorMName);
                } else {
                $('#IndianmName').val("");
                }
                $('#IndianfName').val(contractorFName);
                        $('#IndianlName').val(contractorLName);
                        $('#agentemail').val(contractorEmail);
                        $('#agentContact1').val(contractorMob);
                } else {
                $('#buttonId').show();
                        $('#submitBtnId').hide();
                        $('#IndianfName').removeAttr('readonly');
                        $('#IndianlName').removeAttr('readonly');
                        $('#agentemail').removeAttr('readonly');
                        $('#agentContact1').removeAttr('readonly');
                        $('#foreignemail').val(contractorEmail);
                        $('#ForeignfName').val(contractorFName);
                        $('#ForeignlName').val(contractorLName);
                        if (contractorMName != null) {
                $('#ForeignmName').val(contractorMName);
                } else {
                $('#ForeignmName').val("");
                }
                $('#foreignContact1').val(contractorMob);
                }
                var id = '<c:out value="${regid}"></c:out>';
                        var wizardStatus = '<c:out value="${Contractordetails.status}"></c:out>';
                        var stepValue = '<c:out value="${Contractordetails.wizardStepStatus}"></c:out>';
                        //          alert(stepValue +"  p"+"step  "+step +"   wizardStatus   "+wizardStatus+" id "+id);
                        //  alert("id in regid is:  "+id +wizardStatus);

                        if (id != null && wizardStatus !== 'complete' && step === 'null') {
                $("#cod").click();
                } else if (id != null && wizardStatus !== 'notcomplete' && step === 'null') {
                window.location.href = 'contractorDashboard';
                        //                 document.getElementById('viewContractorOtherDetails').click();
                        //               $("#viewContractorOtherDetails").click();
                } else if (id != null && wizardStatus !== 'complete' && step === 'null' && stepValue !== 'null') {
                //                 alert("palak");
                $("#cod").click();
                        $("#" + stepValue).click();
                } else if (step === 'step1') {
                $("#cod").click();
                        $("#step1").click();
                        $('#buttonId').prev("button").css("display", "none");
                } else if (step === 'step2') {
                //              alert("steeeeeepppp 2");
                $("#cod").click();
                        $("#step2").click();
                        $("#buttonId").val("step2");
                        $('#buttonId').prev("button").css("display", "none");
                } else if (step === 'step3') {
                //              alert("steeeeeepppp 333");
                $("#cod").click();
                        $("#step3").click();
                        $("#buttonId").val("step3");
                        $('#buttonId').prev("button").css("display", "none");
                }

                });
                </script> 
                <script>

                            function validate_onkeyup(that)
                            {
                            that.value = that.value.replace(/[^0-9]/g, '');
                            }
                    function validate_onblure(that)
                    {
                    $('#errorPercentage').html("");
                            that.value = that.value.replace(/[^0-9\.]/g, "");
                            if ((that.value) && Number(that.value) > 100.00)
                    {
                    $('#errorPercentage').html("Percentage in firm should not be more than 100");
                            that.value = "";
                    }
                    }
                    function getPartnerPercentage()
                    {
                    //    alert("value is:"+value);
                    var sum = 0.00;
                            var valid = 0;
                            var remaining = 0.00;
                            $('.totalPercent').each(function () {
                    var sub = $(this).val().substring($(this).val().indexOf('.'), $(this).val().indexOf('.').length).length - 1;
                            var spanid = this.id;
                            //        alert("sum is:"+sum);

                            //      alert("substr is:"+sub);
                            if (sub == 2) {
                    console.log($(this).val());
                            sum += parseFloat($(this).val());
                            //        alert("sum in:"+sum);
                            if (sum < 100.00) {
                    $("#add_new_btn").removeAttr('disabled');
                            $("#" + spanid + "Error").html(" ");
                            valid = sum;
                    } else if (sum == 100.00) {
                    $("#" + spanid + "Error").html("");
                            valid = sum;
                    } else {
                    $("#" + spanid + "Error").html("Total % is more than 100");
                            //        $("#steps3").attr('disabled','disabled');   
                            valid = sum;
                    }
                    $('#errorDecPoint').html("");
                            remaining = 100.00 - sum;
                            console.log("remaing " + parseFloat(remaining).toFixed(2));
                            $("#totalPer").html(sum);
                            $("#remPer").html(parseFloat(remaining).toFixed(2));
                    } else {
                    $('#' + spanid + "Error").html("Please enter valid percent");
                            //   alert("value aftr decimal point should be 2");
                            $("#add_new_btn").attr('disabled', 'disabled');
                    }
                    //   alert("sum is:"+sum);

                    });
                            if (valid < 100) {
                    return "less";
                    } else if (valid > 100) {
                    return "more";
                    } else {
                    return "equal";
                    }
                    }
                </script>
                <script>
                    $(document).ready(function () {
                    $('#orgPAN').change(function () {
                    var gistnNo = $("#gistnNo").val();
                            console.log("gistnNo : " + gistnNo);
                            var PAN = this.value;
                            if (gistnNo === '' || gistnNo === null) {
                    console.log("gistn number is not entered");
                    } else {
                    var gistnSubStr = gistnNo.substring(2, 12);
                            console.log("pan after substring is " + gistnSubStr);
                            if (PAN === gistnSubStr) {
                    console.log("Organization Pan is valid");
                            $("#orgPANError").html("");
                            return true;
                    } else {
                    console.log("Organization Pan is not valid");
                            $("#orgPANError").html("Organization PAN is not matched with GISTN Number");
                            return false;
                    }
                    }
                    //            alert("pan no: is"+this.value);
                    var id = this.id;
                            //            alert(id);
                            $.ajax({
                            url: "uniqueOrgPan",
                                    data: {PANNo: PAN},
                                    success: function (res) {
                                    //                            alert("Entered PAN Number is valid");
                                    if (res !== "valid PAN Number") {
                                    $("#orgPANError").html("PAN Number Is Already Registered");
                                            $("#" + id).val("");
                                    } else {
                                    $("#orgPANError").html("");
                                    }
                                    }, error: function (error) {
                            //                       alert("error : "+error); 
                            }
                            });
                    });
                            function GistnNumber() {
                            var gistnNo = $("#gistnNo").val();
                            }
                    });
                </script>
                <script>

                            function chackName(obj) {
                            var firstregex = new RegExp(
                                    '^(([a-zA-Z ]+$))'
                                    );
                                    var id = obj.id;
                                    console.log(obj.id + " print the id");
                                    if (firstregex.test($(obj).val())) {
                            $("#" + id + "Error").html(" ");
                            } else {
                            $("#" + id + "Error").html("Please Enter Alphabets Only");
                                    $("#" + id).val(' ');
                                    //                   alert('nai ho raha blank');
                            }
                            }
                    function checkPANNo(obj) {
                    var panregex = new RegExp(
                            '/^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/'
                            );
                            var id = obj.id;
                            //               alert(obj.value);
                            console.log(obj.id + " chackPANNo print id");
                            var panVal = obj.value;
                            var regpan = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
                            if (regpan.test(panVal)) {
                    $("#" + id + "Error").html(" ");
                    } else {
                    $("#" + id + "Error").html("Please Enter Valid PAN Card Number");
                            $("#" + id).val(' ');
                    }
                    }
                    function checkDINNo(obj) {
                    var dinRegex = new RegExp(
                            '^([0-9]{8})$'
                            );
                            var id = obj.id;
                            console.log(obj.id + " checkDINNo print id and value  return" + obj.value + " " + dinRegex.test(obj.value));
                            if (dinRegex.test(obj.value)) {
                    $("#" + id + "Error").html("");
                    } else {
                    $("#" + id + "Error").html("Please Enter Valid DIN Number");
                            $("#" + id).val(' ');
                    }
                    }
                    function checkAadharNo(obj) {
                    var aadharRegex = new RegExp('/^\d{12}$/');
                            var id = obj.id;
                            console.log(obj.id + " checkAadharNo print id");
                            if (aadharRegex.test(obj.value)) {
                    $("#" + id + "Error").html("");
//                                } else {
//                                    alert("OPPS");
//                                    $("#" + id + "Error").html("Please Enter Valid Aadhar Card Number");
//                                    $("#" + id).val(' ');
//                                }
                    }
                    function checkMobileNo(obj) {
                    var mobregex = new RegExp(
                            '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                            );
                            var id = obj.id;
                            console.log(obj.id + " checkMobileNo print id");
                            if (mobregex.test(obj.value)) {
                    $("#" + id + "Error").html("");
                    } else {
                    $("#" + id + "Error").html("Please Enter Valid Mobile Number");
                            $("#" + id).val(' ');
                    }
                    }
                    $(document).ready(function () {
                    var firstregex = new RegExp(
                            '^(([a-zA-Z ]+$))'
                            );
                            var mobregex = new RegExp(
                                    '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                                    );
                            var addregex = new RegExp(
                                    '^([A-Za-z0-9\s,-_ ]+$)'
                                    );
                            var crnregex = new RegExp(
                                    '^(([a-zA-Z0-9]+$))'
                                    );
                            var numregex = new RegExp(
                                    '^(([0-9]+$))'
                                    );
                            var emailregex = new RegExp(
                                    '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                                    '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                                    '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                                    );
                            var ifacregex = new RegExp(
                                    '/^\d{12}$/'
                                    );
                            var pinregex = new RegExp(
                                    '^([1-9][0-9]{5})$'
                                    );
                            var panregex = new RegExp(
                                    '/^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/'
                                    );
                            var regpan = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
                            var bankregex = new RegExp(
                                    '^([0-9]{9,18})$'
                                    );
                            //    var webregex = new RegExp(
                            //    '^((??:https?|ftp):\/\/)?(??!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(??a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/\S*)?$)'
                            //   );

                            var aadharRegex = RegExp(
                                    '^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$');
                            var gistnreg = new RegExp(
                                    '^([0-9]{2}[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}[0-9]{1}[Z][0-9]{1})$'
                                    );
                            var tinRegex = new RegExp(
                                    '[0-9]{3}\-[0-9]{2}\-[0-9]{4}$'
                                    );
                            var urlRegex = new RegExp(
                                    '^(http:\\/\\/|https:\\/\\/)?(www.)?([a-zA-Z0-9]+).[a-zA-Z0-9]*.[a-z]{3}.?([a-z]+)?$'
                                    );
                            var dinRegex = new RegExp(
                                    '^([0-9]{8})$'
                                    );
                            $('.Name').on('input', function (e) {
                    var id = this.id;
                            console.log(this.id + " name class print id");
                            if (firstregex.test($(this).val())) {
                    $("#" + id + "Error").html(" ");
                            $("#" + id).css("border-color", "green");
                    } else {
                    $("#" + id).css("border-color", "red");
                            $("#" + id + "Error").html("Please Enter Alphabets Only");
                            //                        $("#"+id).val(' ');
                            //                       alert('nai ho raha blank');
                    }

                    });
                            $('.select').on('change', function (e) {
                    if ($('.select').val() !== '-1') {
                    $("#" + this.id + "Error").html("");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Select The Required Field");
                            console.log("error");
                    }
                    });
                            $('.Mobile_No').on('change', function (e) {
                    if (mobregex.test($(this).val())) {
                    $("#" + this.id + "Error").html("");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid Phone number");
                            $("#" + id).val(' ');
                    }

                    });
                            $('.Address').on('change', function (e) {
                    if (addregex.test($(this).val())) {
                    $("#" + this.id + "Error").html(" ");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid Address");
                            console.log("error");
                    }

                    });
                            $('.Pincode').on('change', function (e) {

                    if (pinregex.test($(this).val())) {
                    $("#" + this.id + "Error").html(" ");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid Pincode");
                            console.log("error");
                    }

                    });
                            $('.Email_Id').on('change', function (e) {

                    if (emailregex.test($(this).val())) {
                    $("#" + this.id + "Error").html("");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid Email Id");
                            console.log("error");
                    }

                    });
                            $('.CRN').on('change', function (e) {
                    if (crnregex.test($(this).val())) {
                    $("#" + this.id + "Error").html(" ");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid Registration Number");
                            console.log("error");
                    }

                    });
                            $('.PCN').on('change', function (e) {
                    var panVal = $(this).val();
                            var regpan = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
                            //                alert(panVal);
                            //                alert(regpan.test(panVal));

                            if ((regpan.test(panVal)) === true) {
                    //                     alert(" true ");
                    $("#" + this.id + "Error").html("");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    //                      alert(" false ");
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid PAN Card Number");
                            $("#" + this.id).val('');
                    }
                    });
//                                $('.ACN').on('change', function (e) {
//                                    if (aadharRegex.test($(this).val())) {
//                                        $("#" + this.id + "Error").html("");
//                                        $("#" + this.id).css("border-color", "green");
//                                        console.log("success");
//                                    } else {
//                                        $("#" + this.id).css("border-color", "red");
//                                        $("#" + this.id + "Error").html("Please Enter Valid Aadhar Card Number");
//                                        console.log("error");
//                                    }
//
//                                });
                            $('.gistn').on('change', function (e) {
                    if (gistnreg.test($(this).val())) {
                    $("#" + this.id + "Error").html("");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid GISTN Number");
                            console.log("error");
                    }

                    });
                            $('.TIN').on('change', function (e) {
                    if (tinRegex.test($(this).val())) {
                    $("#" + this.id + "Error").html("");
                            $("#" + this.id).css("border-color", "green");
                            console.log("success for tin");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid TIN Number");
                            console.log("error");
                    }

                    });
                            $('.DIN').on('change', function (e) {
                    if (dinRegex.test($(this).val())) {
                    $("#" + this.id + "Error").html("");
                            console.log("success");
                    } else {
                    $("#" + this.id).css("border-color", "red");
                            $("#" + this.id + "Error").html("Please Enter Valid TIN Number");
                            $("#" + id).val(' ');
                    }
                    });
                    });
                </script>



            <%---function  to called the validation of second step---%>

            <script>

                        function secondStepValidation() {
                        var status = 0;
                                var regex = /^[a-zA-Z]*$/;
                                var reg = /^[a-zA-Z0-9 ]*$/;
                                var pinreg = /^[1-9][0-9]{5}/;
                                var mobNoreg = /^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$/;
                                var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                                var aadharreg = /^([0-9]{12})$/;
                                var gistnreg = /^([0-9]{2}[A-Za-z]{5}[0-9]{4}[A-a-z]{1}[0-9]{1}[Z][0-9]{1})$/;
                                var panreg = /^([A-Za-z]{5}[0-9]{4}[A-Za-z]{1})$/;
                                var websitereg = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
                                if ($('#IndianfName').val() != '' && regex.test($('#IndianfName').val()) &&
                                        //       $('#IndianmName').val()!='' && regex.test($('#IndianmName').val())  &&

                                        $('#IndianlName').val() != '' && regex.test($('#IndianlName').val()) &&
                                        $('#agentemail').val() != '' && emailidreg.test($('#agentemail').val()) &&
                                        $('#agentContact1').val() != '' && mobNoreg.test($('#agentContact1').val()) &&
                                        //       $('#agentContact2').val()!='' && mobNoreg.test($('#agentContact2').val()) ||

                                        //                        $('#gistnNo').val() != '' && gistnreg.test($('#gistnNo').val()) &&
                                        $('#comAadharNo').val() != '' && aadharreg.test($('#comAadharNo').val()) &&
                                        $('#agentState').val() != '' && $('#agentCity').val() != '-1' &&
                                        $('#contOrganization').val() != '' && $('#contCompanyType').val() != '' &&
                                        $('#socialCategory').val() != '' && $('#contractorClass').val() != '' &&
                                        $('#agentRegno').val() != '' && reg.test($('#agentRegno').val()) &&
                                        $('#orgPAN').val() != '' && panreg.test($('#orgPAN').val()) &&
                                        $('#agentPincode').val() != '' && pinreg.test($('#agentPincode').val()) ||
                                        $('#agentWebsite').val() != '' && websitereg.test($('#agentWebsite').val()) &&
                                        $('#agentAddress').val() != '' && reg.test($('#agentAddress').val()) ||
                                        $('#otherOrganization').val() != '' && regex.test($('#otherOrganization').val()) &&
                                        $('#indianOrgName').val() != '' && regex.test($('#indianOrgName').val())

                                        )
                        {
                        status = 1;
                                return status;
                        } else {

                        $("#indianSecSteps").find('input[type=text],select,textarea').each(function () {
                        console.log("@#@$%#$5" + this.id + " value : " + this.value);
                                var label = $(this).prevAll("label").text();
                                if ((this.value === '') && ($(this).prev("span").text())) {
                        $("#" + this.id + "Error").text("Please Enter " + label);
                                $("#" + this.id).css("border-color", "red");
                        } else {
                        $("#" + this.id + "Error").text("");
                                $("#" + this.id).css("border-color", "green");
                        }

                        });
                                return status;
                        }
                        }
                function validationTrueAndNext(obj) {
                //                alert(obj + " true next ");
                $(obj).prev("button").css("display", "block");
                        var li_first = $('.nav-tabs-btn');
                        console.log(li_first);
                        var $active = $('.nav-tabs-btn .nav-item a.active');
                        $($active).addClass("sve_class_cl");
                        $($active).find('.nav-link-title').hide();
                        $($active).find('.fa').show();
                        nextTab($active);
                }
                function firstStepValidation() {
                var regex = /^[a-zA-Z]*$/;
                        var reg = /^[a-zA-Z0-9 ]*$/;
                        var pinreg = /^[1-9][0-9]{5}/;
                        var mobNoreg = /^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$/;
                        var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                        var aadharreg = /^([0-9]{12})$/;
                        var gistnreg = /^([0-9]{2}[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}[0-9]{1}[Z][0-9]{1})$/;
                        var panreg = /^([A-Za-z]{5}[0-9]{4}[A-Za-z]{1})$/;
                        var websitereg = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
                        var tinRegex = /^(?:\d{3}-\d{2}-\d{4}|\d{2}-\d{7})$/;
                        var status = 0;
                        if ($('#ForeignfName').val() !== '' && regex.test($('#ForeignfName').val()) &&
                                $('#ForeignlName').val() !== '' && regex.test($('#ForeignlName').val()) &&
                                $('#foreignemail').val() !== '' && emailidreg.test($('#foreignemail').val()) &&
                                $('#foreignContact1').val() !== '' && mobNoreg.test($('#foreignContact1').val()) &&
                                $('#foreignOrgName').val() !== '' && regex.test($('#foreignOrgName').val()) &&
                                $('#country').val() !== '' && $('#foreignState').val() !== '-1' &&
                                $('#foreignCity').val() !== '' &&
                                $('#foreignAddress').val() !== '' && reg.test($('#foreignAddress').val()) &&
                                $('#foreignPincode').val() !== '' && pinreg.test($('#foreignPincode').val()) &&
                                $('#foreignRegno').val() !== '' && reg.test($('#foreignRegno').val()) &&
                                $('#foreignTINNo').val() !== '' && tinRegex.test($('#foreignTINNo').val())
                                )
                {
                status = 1;
                        return status;
                } else {
                $("#foreignFirstStep").find('input[type=text],select,textarea').each(function () {
                var label = $(this).prevAll("label").text();
                        if ((this.value === '') && ($(this).prev("span").text())) {
                console.log("error is:  " + this.id);
                        $("#" + this.id + "Error").text("Please Enter " + label);
                        $("#" + this.id).css("border-color", "red");
                        status = 0;
                } else {
                $("#" + this.id + "Error").text("");
                        $("#" + this.id).css("border-color", "green");
                }

                });
                        return status;
                }
                }
                function thirdStepValidation() {
                var status = true;
                        var count = 0;
                        if ($("#public").is(':visible')) {
                //             alert("public organization");

                $("#public").find('input[type=text]').each(function () {
                console.log("id is:" + this.id + "    value:" + $(this).val() + "THEAD:");
                        //              var x=document.getElementById('addMoreTable2')
                        if ($(this).val() === "") {
                //                    alert($(this).closest('td').eq(n));
                $("#" + this.id + "Error").text("Field is Required");
                        $("#" + this.id).css("border-color", "red");
                        count++;
                        status = false;
                } else {
                $("#" + this.id).css("border-color", "green");
                        $("#" + this.id + "Error").text(" ");
                }
                });
                        console.log(count);
                        if (count > 0) {
                console.log("status return false");
                        return false;
                } else {
                console.log("status return true");
                        return true;
                }
                //            return '0';
                } else if ($("#partnership").is(':visible')) {
                //           alert("partnership organization");
                var count = 0;
                        $("#partnership").find('input[type=text]').each(function () {
                console.log("id is:" + $(this).id + " value:" + $(this).val());
                        //           
                        if ($(this).val() === "") {

                $("#" + this.id + "Error").text("Field is Required");
                        $("#" + this.id).css("border-color", "red");
                        count++;
                        status = false;
                } else {
                $("#" + this.id).css("border-color", "green");
                        $("#" + this.id + "Error").text(" ");
                }
                });
                        console.log(count);
                        if (count > 0) {
                console.log(" status return false ");
                        return false;
                } else {
                console.log(" status return true ");
                        return true;
                }
                }
                }

                //            
                //          var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');      
            </script>  


            <script type="text/javascript">
                function fileName(id) {
                console.log("selected file id is: " + id);
                        var file = document.getElementById(id).files[0];
                        var fileName = file.name;
                        console.log("Selected file name is: :" + fileName);
                        $("#label1").html(file.name);
                }

            </script>
    </body>
    <script>
                $(function () {
                $(".preloader").fadeOut(2000, function () {
                $(".loader_main").fadeIn(1000);
                });
                });
    </script>

    <!-- end::Body -->

</html>