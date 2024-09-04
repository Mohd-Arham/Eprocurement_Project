<%@page import="com.eproc.util.FileUtility"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="tenderDocument" target="<%=FileUtility.UPLOAD_TENDERDOCUMENTDIRECTORY%>"/>
<style>
    .note-editor.note-frame .note-editing-area {
        overflow: hidden;
        margin-top: 50px;
    }
    .disabledClass{
        background: #eee;
        pointer-events: none;
        touch-action: none;
    }
    .note-editor.note-frame .note-editing-area .note-editable {
        padding: 10px;
        overflow: auto;
        color: #000;
        word-wrap: break-word;
        background-color: #fff;
        padding-top: 50px;
    }
</style>
<!--STAR_TENDER_WIZARD_MODAL -->
<!-- Large Modal -->

<div class="modal fade" id="createTenderWizard" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered" style="max-width:90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tender Creation</h5>
                <button type="button" class="close" ng-click="lostDataMessage();" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="background-color: #f8f8f8;">
                <form:form role="form" action="#" id="tenderCreation" name="tenderCreationStep1" modelAttribute="tender" ng-model="tenderDetais">             
                    <div class="k-portlet" style="margin-bottom:0;">
                        <div class="k-portlet__head mx-auto" style="padding: 12px 25px;">
                            <div class="wizard_tb" style="position:relative;">
                                <div class="connecting-line"></div>
                                <ul class="nav nav-pills nav-tabs-btn" role="tablist" style="padding-bottom:0px;position:relative;z-index:1;">

                                    <li class="nav-item" id="li1">
                                        <a class="nav-link active" data-toggle="tab" href="#k_portlet_base_demo_1_tab_content" role="tab" id="step1">
                                            <span class="nav-link-title">1</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item" id="test2">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_2_tab_content" role="tab" id="step2">
                                            <span class="nav-link-title">2</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item" id="test3">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_3_tab_content" role="tab" id="step3">
                                            <span class="nav-link-title">3</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_4_tab_content" role="tab" id="step4">
                                            <span class="nav-link-title">4</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_5_tab_content" role="tab" id="step5">
                                            <span class="nav-link-title">5</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_6_tab_content" role="tab" id="step6">
                                            <span class="nav-link-title">6</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_7_tab_content" role="tab" id="step7">
                                            <span class="nav-link-title">7</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                    <li class="nav-item" id="li_last">
                                        <a class="nav-link" data-toggle="tab" href="#k_portlet_base_demo_8_tab_content" role="tab" id="step8">
                                            <span class="nav-link-title">8</span>
                                            <span class="fa fa-check" style="display:none;"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="k-portlet__body k-scroll k-scroller ps ps--active-y" data-scroll="true" data-height="400" data-mobile-height="400" style="height: 400px; overflow: hidden;padding-top: 0;" id="scrollingEffect">
                            <div class="tab-content">
                                <!--STEP_FIRST_FORM--> 
                                <div class="tab-pane active" id="k_portlet_base_demo_1_tab_content" role="tabpanel">
                                    <!--                                    <form class="k-form">-->
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Get Tender Number
                                            </h3>
                                        </div>
                                    </div>

                                    <input type="hidden" id="step" value="{{step}}"/>                            
                                    <!--Section for NIT Date and NIT Number-->         
                                    <div class="form-group border_boxesDiv">	
                                        <div class="row">

                                            <div class="col-lg-6"><label>NIT Number <span style="color:red;">*</span></label><input type="hidden" name="nitNumber"><form:input path="nitNumber" id="nitNumber" cssClass="form-control" ng-model="nitNumber" placeholder="Enter NIT number" /><span style="color:red" id="nitNumberError" maxlength="3"></span></div>
                                            <div class="col-lg-6"><label class="">NIT Date <span style="color:red;">*</span></label><div class="input-group date"><form:input path="nitDate" id="nitDate" cssClass="form-control filter-date nitDate" placeholder="Enter NIT Date" readonly="true" ng-model="nitDate"/><div class="input-group-append"><span class="input-group-text"><i class="la la-calendar-check-o glyphicon-th"></i></span></div></div><span style="color:red" id="nitDateError" ></span></div>
                                        </div>
                                    </div>

                                    <!--Section for New Copy, Copy Tender and Tender Number-->    
                                    <div class="form-group border_boxesDiv"><div class="row"><div class="col-lg-4">
                                                <label class="">Process For</label><div class="k-radio-inline">
                                                    <label class="k-radio k-radio--primary" ng-hide="resetTender">
                                                        <input type="radio" name="example_2" id="newTenderRadio" ng-click="getTenderNumber();tenderStage('new Tender');" ng-disabled="newTenderRadioButton"> 
                                                        New Tender<span></span></label>
                                                    <label class="k-radio k-radio--primary" ng-hide="resetTender">
                                                        <input type="radio" id="copyTenderRadio" name="example_2" ng-click="getTenderNumber();tenderStage('copy Tender');" ng-disabled="copyTenderRadioButton"> 
                                                        Copy From Tender<span></span></label>
                                                    <label class="k-radio k-radio--primary" ng-show="resetTender">
                                                        <input type="radio" name="example_2" checked="checked"> Reset Tender<span></span></label></div>
                                                <!--<span class="form-text text-muted">Please Select Tender Process</span>-->
                                            </div><div class="col-lg-4"><label class="">Tender Number <span style="color:red;">*</span></label>
                                                <div class="k-input-icon k-input-icon--right">
                                                    <form:input path="tenderNumber"  cssClass="form-control" placeholder="Generated Tender Number" id="hiddenTenderNumber" ng-model="tenderNumber" readonly="true"/><form:hidden  path="tenderStatus" id="tenderStatusManaging" /><input type="text" name="tender_Id" ng-model="tender_Id" ng-hide="true"/><span class="k-input-icon__icon k-input-icon__icon--right"><span><i class="la la-bookmark-o"></i></span></span></div><span style="color:red" id="tenderNumberError"></span></div></div></div>

                                    <!--Section for New Copy Tender Number, Number of Copy and Tender Number-->      
                                    <div class="form-group border_boxesDiv" id="copyTenderFunctionality"><div class="row"><div class="col-lg-2"><label class="">Previous Tender Number</label><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#m_select_modal_view_tender_number" ng-click="fetchPreviousTenderNumber();">View Tenders Number</button></div><div class="col-lg-3"><label class="">Copy Tender Number</label><input type="email" class="form-control" placeholder="Copied Tender Number" ng-change="validateCopyTender();" ng-model="copiedNumber" id="copiedNumber" readonly="true"><span style="color:red" id="copyTenderNumberError"></span></div><div class="col-lg-3"><label class="">Number of Copy</label><select class="form-control" id="copyTenderNumber"></select><span style="color:red" id="numberOfCopyError"></span></div><div class="col-lg-3"><label class="">Click to Copy </label><div class="k-input-icon k-input-icon--right"><a href="#" ng-click="copyTenderfunctionality();" class="btn btn-primary btn-sm" >Copy Tender</a></div></div></div></div>
                                    <!--</form>-->
                                </div>




                                               

                                <!--                                 SECOND_STEP_FORM -->
                                <div class="tab-pane" id="k_portlet_base_demo_2_tab_content" role="tabpanel">
                                    <!--<form class="k-form">-->
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Information
                                            </h3>
                                        </div>
                                    </div>


                                    <!--                                         Section to select Tender Stage and Selective Tender -->
                                    <div class="form-group border_boxesDiv">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>Tender Stage<span style="color:red;">*</span></label>

                                                <c:if test="${!tenderStagesList.isEmpty()}"><form:select path="tenderStage" id="tenderStage" cssClass="form-control" ng-change="managehideAndShow('Tender Stage');" ng-model="tenderStageDropDown"><form:option value="0">Select</form:option><c:forEach var="tenderStageName" items="${tenderStagesList}"><form:option value="${tenderStageName.tenderStage_id}">${tenderStageName.tenderStage_Name}</form:option></c:forEach></form:select></c:if><span class="errorColor" id="tenderStageError"></span></div>


                                                                <div class="col-lg-6"><label class="">Selective Tender<span style="color:red;">*</span></label><c:if test="${!selectiveTenderList.isEmpty()}"><form:select path="selectiveTender" id="selectiveTender" cssClass="form-control" ng-model="selectiveTender" ng-change="managehideAndShow('Selective Tender')"><form:option value="0">Select</form:option><c:forEach var="selectiveTenderList" items="${selectiveTenderList}"><form:option value="${selectiveTenderList.selectiveTender_id}">${selectiveTenderList.selectivetender_Name}</form:option></c:forEach></form:select></c:if><span class="errorColor" id="selectiveTenderError"></span></div>


                                                    </div> 
                                                </div>

                                                <!-- Section to select Tender Stage and Selective Tender -->
                                                        <div class="form-group border_boxesDiv"><div class="form-group row"><div class="col-lg-6"><label>Tender Categories <span style="color:red;">*</span></label><c:if test="${!tenderCategoryList.isEmpty()}"><form:select path="tenderCategory" id="tenderCategory" cssClass="form-control"  ng-change="tenderCategoryShow();managehideAndShow('Tender Categories');" ng-model="tenderCategory" placeholder="Select Tender Category" onchange="validating();" ><form:option value="0">Select</form:option><c:forEach var="tenderCategoryList" items="${tenderCategoryList}"><form:option value="${tenderCategoryList.tender_category_id}">${tenderCategoryList.tender_category_name}</form:option></c:forEach></form:select></c:if><c:if test="${tenderCategoryList.isEmpty()}">Please Mention Tender Category from Department</c:if><span class="errorColor" id="tenderCategoryError"></span></div>

                                                                    <div class="col-lg-6"><label>Area Of Work <span style="color:red;">*</span></label><form:select path="areaOfWork" ng-model="areaOfWorkss" cssClass="form-control" id="areaOfWork"  ng-change="tenderKeyWordsShow(areaOfWorkss);empanelContractorShow(areaOfWorkss);" ><form:option value="0"  placeholder="Select Area Of Work">Select</form:option><form:option value="{{areaOfWorks.areaofwork_id}}" ng-repeat="areaOfWorks in areaOfWork" placeholder="Select Area Of Work">{{areaOfWorks.areaofwork_name}}</form:option></form:select><span class="errorColor" id="areaOfWorkssError"></span></div>
                                                </div> 

                                                <!--     Section to select Tender Keywords, Empanel Contractor            -->
                                                    <div class="form-group row"><div class="col-lg-12"><label class="">Tender Keywords <span style="color:red;">*</span></label><form:select path="tenderKeywords" cssClass="form-control selectpicker upr_text" data-live-search="true" id="keywordssss" multiple="true" ng-model="keyword" ><form:option ng-repeat="keyword in keywords" data-select-watcher="true" value="{{keyword.tenderKeyWordsId}}" id="{{keyword.tenderKeyWordsName}}" data-last="{{$last}}" >{{keyword.tenderKeyWordsName}}</form:option></form:select><span class="errorColor" id="keyWordError"></span></div></div>

                                                <div class=" row" ng-hide="empanelConts"><div class="col-lg-12"><label class="">Empanel Contractor <span style="color:red;">*</span></label><form:select path="empanelContrators" cssClass="form-control selectpicker upr_text" data-live-search="true" multiple="true" id="empanelContrators"><form:option ng-repeat="contractor in contractors" data-select-watcher="true" value="{{contractor.id}}" data-last="{{$last}}">{{contractor.firstname + " " + contractor.lastname}}</form:option></form:select><span class="errorColor" id="empanelContratorsError"></span></div></div>
                                            </div>


                                            <!--Section to select SOR Documents-->   
                                            <div class="form-group border_boxesDiv"><div class="row">
                                                    
                                                    <div class="col-lg-8" ng-hide="sorDoc">
                                                        <label class="">SOR Documents<span style="color:red;">*</span></label>
                                                        <c:if test="${!uploadSORList.isEmpty()}">
                                                        <form:select path="sorDocument" id="sorDOcument" ng-model="sorDocumentFile"  cssClass="form-control selectpicker" ng-change="sorDocument(sorDocumentFile)" multiple="false" liveSearchPlaceholder="true">
                                                            <c:forEach var="uploadSORList" items="${uploadSORList}" >
                                                                <form:option value="${uploadSORList.id}" 
                                                                             cssClass="sorDOcument${uploadSORList.id}" 
                                                                             id="${uploadSORList.fileconvertedName}">${uploadSORList.fileName}</form:option>
                                                            </c:forEach>
                                                        </form:select><div class="k-portlet__body"><div class="form-group position-relative"><dl class="dropdown document_dropdowm"></dl></div></div>
                                                        </c:if>
                                                        <span class="errorColor" id="sorDocumentError"></span>
                                                    </div>
                                            <!--          Link To show SOR Documents-->
                                            <div class="col-lg-4" ng-hide="sorDoc"><label class="">View Sor Document</label><a href="${context}/resources/UploadedDocuments/sorDocs/{{sorDocuments}}" class="form-control" target="_blank">{{sorDocumentName}}</a></div>

                                            <!--Buy Back Policy radio button-->       
                                            <div class="col-lg-4" ng-hide="buyBackPol"><label class="">Is This Tender Include Buy Back Offer Policy?:</label><div class="k-radio-inline"><label class="k-radio  k-radio--primary"><form:radiobutton path="buyBackPolicy" id="buyBackDocumentYes" cssClass="buyBackDocument" value="yes" ng-click="managehideAndShow('BuyBackPolicy')" checked="checked"/>Yes<span></span></label><label class="k-radio k-radio--primary"><form:radiobutton path="buyBackPolicy" id="buyBackDocumentNo" cssClass="buyBackDocument" value="no" ng-click="managehideAndShow('BuyBackPolicy')"/>No<span></span></label></div></div>

                                            <!--Buy Back Policy Documents--> 
                                            <div class="col-lg-4" ng-hide="buyBackPolDoc"><label class="">Upload Document for Buy Back Offer Policy:</label><div><button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#cloudFolderModel2" ng-click="documentSequnceCalled('1', 'tenderBuyBackDocument');" id="buyPolicyDocument"><i class="fa fa-file-upload" ></i> Upload Document</button>
                                                    <form:hidden path="buyBackDocument" value="{{serverResponse}}"/></div><span class="errorColor" id="buyPolicyDocumentError"></span></div></div>
                                    </div>

                                    <!--Section to select SOR Documents--> 
                                    <div class="form-group border_boxesDiv">
                                        <div class="row"><div class="col-lg-4"><label>Tender Re-Bid</label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="tenderRebid" id="tenderReBid"  value="Allowed" ng-click="tenderCheckedBox('ReBid');" checked="checked" /><span></span><b class="payment_mode tenderReBid1" >{{reBidStatus}} Allowed Tender Re-Bid</b></label></span></div></div>
                                        <div class="col-lg-4"><label>Tender Bid-Withdraw</label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="tenderBidWithdraw" id="tenderBidWithdraw" value="Allowed" ng-click="tenderCheckedBox('BidWithdraw');" checked="checked"/><span></span><b class="payment_mode tenderBidWithdraw1">{{bidWithdrawStatus}} Allowed Bid-Withdraw</b></label></span></div></div></div>
                                    </div>
                                    <!--</form>-->
                                </div>
   


                                <!--                                 THIRD_STEP_FORM -->
                                <div class="tab-pane" id="k_portlet_base_demo_3_tab_content" role="tabpanel">
                                    <!--begin::Form-->
                                    <!--    <form class="k-form">-->
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Create Tender
                                            </h3>
                                        </div>
                                    </div>

                                    <!--Section to Name of Work And Short Description--> 
                                    <div class="form-group border_boxesDiv">

                                        <div class="row"><div class="col-lg-6"><label>Name of Work<span style="color:red;">*</span></label><form:textarea path="nameOfWork" id="nameOfWork" cssClass="form-control"  placeholder="Name of Work" rows="3" ></form:textarea><span class="errorColor" id="nameOfWorkError"></span></div>

                                                <div class="col-lg-6"><label class="">Short Description <span style="color:red;">*</span></label><form:textarea path="descriptionOfWork" id="descriptionOfWork" cssClass="form-control"  placeholder="Short Description Of Work" rows="3" ></form:textarea><span class="errorColor" id="descriptionOfWorkError"></span></div></div>

                                        </div>

                                        <!--Section to Estimate Value-->         
                                        <div class="form-group row">
                                            <div class="col-lg-6">
                                                <div class="border_boxesDiv">
                                                    <div class="form-group">
                                                        <label class="">Estimated Value (In Fig)<span style="color:red;">*</span></label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><i class="fa fa-rupee-sign"></i></span>
                                                            </div>
                                                            <form:input path="estimateValueInFig"  cssClass="form-control" placeholder="Estimate Value (In Figure)" ng-model="estimateValue" id="estimateValue" />
                                                    </div><span class="errorColor" id="estimateValueError"></span></div>

                                                <div class="form-group1"><label class="">Estimated Value (In Word)<span style="color:red;">*</span></label><div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div><form:input path="estimateValueInWord" cssClass="form-control wrd_conversion" aria-describedby="basic-addon1" placeholder="Estimate Value (In Words)" readonly="true" value="{{estimateValue | words}}"/></div></div></div>
                                        </div>

                                        <!--Section to Tender Fees-->  
                                        <div class="col-lg-6"><div class="border_boxesDiv"><div class="form-group row"><div class="col-lg-6"><label class="">Tender Fees (In Fig)<span style="color:red;">*</span></label><div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div><form:input path="tenderFeeInFig"  cssClass="form-control" placeholder="Tender Fee (In Figure)" ng-model="tenderFee" id="tenderFee"/></div><span class="errorColor" id="tenderFeeError"></span></div>

                                                    <div class="col-lg-6"><div class="paymentmode"><label>Mode Of Payment </label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="modeOfFeeForTenderFee" id="modeOfFeeForTenderFee"  value="online" ng-click="tenderCheckedBox('modeOfFeeForTenderFee');" checked="checked"/><span></span><b class="payment_mode">{{modeOfFeeForTenderFee}}</b></label></span></div></div></div>
                                                </div>

                                                <div class="form-group1"><label class="">Tender Fees (In Words)<span style="color:red;">*</span></label><div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div><form:input path="tenderFeeInWord" cssClass="form-control wrd_conversion" aria-describedby="basic-addon1" placeholder="Tender Fee (In Words)" readonly="true" value="{{tenderFee | words}}"/></div></div></div></div>
                                    </div>


                                    <!--Section to Bid Validate And Work Completion-->  
                                    <div class="form-group border_boxesDiv"><div class="row"><div class="col-lg-3"><label class="">Bid Validity Type<span style="color:red;">*</span></label><form:select path="bidValidateType" id="bidValidateType" cssClass="form-control"  ng-model="bidValidateType"><form:option value="0">Select</form:option><form:option value="1">Days</form:option><form:option value="2">Month</form:option></form:select><span class="errorColor" id="bidValidateTypeError"></span></div>

                                                            <div class="col-lg-3"><label class="">Bid Validity Period<span style="color:red;">*</span></label><form:input path="bidValidatePeriod" cssClass="form-control" placeholder="Bid Validate Period" id="bidValidatePeriod"/><span class="errorColor" id="bidValidatePeriodError"></span></div>

                                            <div class="col-lg-3"><label class="">Work Completion Period Type<span style="color:red;">*</span></label><form:select path="workCompletionType" id="workCompletionType" cssClass="form-control" ng-model="workCompletionType"><form:option value="0">Select</form:option><form:option value="1">Days</form:option><form:option value="2">Month</form:option></form:select><span class="errorColor" id="workCompletionTypeError"></span></div>

                                                            <div class="col-lg-3"><label class="">Work Completion Period<span style="color:red;">*</span></label><form:input path="workCompletionPeriod" cssClass="form-control" placeholder="Work Completion Period" id="workCompletionPeriod"/><span class="form-text errorColor" id="workCompletionPeriodError"></span></div></div></div>

                                    <!--Section to Rainy Season-->  
                                    <div class="row"><div class="col-lg-5"><div class="form-group border_boxesDiv rainysesion"><label class="">Rainy Season<span style="color:red;">*</span></label><div class="k-radio-inline"><label class="k-radio k-radio--primary"><form:radiobutton path="rainySeason" value="Include" ng-model="rainySeasonMode"/> Include
                                                        <span></span></label><label class="k-radio k-radio--primary"><form:radiobutton path="rainySeason" value="Exclude" ng-model="rainySeasonMode" id="portfolio-link"/> Exclude<span></span></label><label class="k-radio k-radio--primary"><form:radiobutton path="rainySeason" value="Not Applicable" id="blog-link" ng-model="rainySeasonMode"/> Not Applicable<span></span></label></div><span  id="rainySeasonError" class="errorColor"></span></div></div>

                                        <div class="col-lg-7"><div class="form-group border_boxesDiv"><div class="row"><div class="col-lg-6"><label class="">Division</label><form:select path="tenderSelectedDivision" id="tenderSelectedDivision" ng-model="tenderSelectedDivision"  cssClass="form-control" ng-change="getSubDivision(tenderSelectedDivision);"><form:option value="0">Select</form:option><c:forEach var="division" items="${division}" ><form:option value="${division.division_id}">${division.division}</form:option></c:forEach></form:select></div>

                                                                    <div class="col-lg-6"><label>Sub Division</label><form:select path="tenderSelectedSubDivision"  cssClass="form-control"><form:option value="0"  placeholder="Select Area Of Work">Select</form:option><form:option value="{{subdivisions.subdivision_id}}" ng-repeat="subdivisions in subdivisions" placeholder="Select Sub Division">{{subdivisions.subdivision}}</form:option></form:select></div></div></div></div></div>

                                            <!--</form>-->
                                        </div>


                                        <!-- FOURTH_STEP_FORM -->
                                        <div class="tab-pane" id="k_portlet_base_demo_4_tab_content" role="tabpanel">
                                            <!--    <form class="k-form">-->
                                            <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon">
                                                        <i class="flaticon-cogwheel"></i>
                                                    </span>
                                                    <h3 class="k-portlet__head-title">
                                                        Tender Category
                                                    </h3>
                                                </div>

                                            </div>

                                            <!--Section Tender Category Dropdown-->         
                                            <div class="form-group border_boxesDiv">	

                                                    <div class="row"><div class="col-lg-3"><label class="">Envelope Type <span style="color:red;">*</span></label><c:if test="${!envelopeTypeList.isEmpty()}"><form:select path="envelopeType" id="envelopeType" cssClass="form-control" ng-change="managehideAndShow('Envelope Type');checkEnvelopeUpdate(envelopeType);" ng-model="envelopeType" ng-disabled="envelopeTypeStatus"><form:option value="0">Select</form:option><c:forEach var="envelopeTypeList" items="${envelopeTypeList}"><form:option value="${envelopeTypeList.envelopeType_id}">${envelopeTypeList.envelopeType_Name}</form:option></c:forEach></form:select></c:if><span class="form-text errorColor" id="envelopeTypeError"></span></div>

                                                                <div class="col-lg-3"><label class="">Contractor Class <span style="color:red;">*</span></label><c:if test="${!contractorClassList.isEmpty()}"><form:select path="contractorClass" id="contractorClass" cssClass="input form-control contractorClass" value="{{tenderDetais.contractorClass}}" ng-model="contractorClass" ng-disabled="contractorClassStatus"><form:option value="0">Select</form:option><c:forEach var="contractorClassList" items="${contractorClassList}"><form:option value="${contractorClassList.contractorClass_id}" cssClass="${contractorClassList.contractorClass_id}">${contractorClassList.contractorClass_Name}</form:option></c:forEach></form:select></c:if><span class="form-text errorColor" id="contractorClassError"></span></div>

                                                                <div class="col-lg-3"><label class="">Type of Tenders <span style="color:red;">*</span></label><c:if test="${!typeOfTendersList.isEmpty()}"><form:select path="typeOfTender" id="typeOfTender" cssClass="input form-control" ng-change="managehideAndShow('typeOfTender')" ng-model="typeOfTender" ng-disabled="typeOfTenderStatus"><form:option value="0">Select</form:option><p id="EnvelopOne" style="display:none;">Lumpsum Tender</p><c:forEach var="typeOfTendersList" items="${typeOfTendersList}"><form:option value="${typeOfTendersList.typeOfTenders_id}">${typeOfTendersList.typeOfTenders_Name}</form:option></c:forEach></form:select></c:if><span class="form-text errorColor" id="typeOfTenderError"></span></div>

                                                                <div class="col-lg-3"><label class="">EMD Applicable <span style="color:red;">*</span></label><c:if test="${!emdApplicableList.isEmpty()}"><form:select path="emdApplicable" id="emdApplicable" cssClass="input form-control"  ng-model="emdApplicable" ng-disabled="emdApplicableStatus" ng-change="managehideAndShow('emdApplicable')"><form:option value="0">Select</form:option><c:forEach var="emdApplicableList" items="${emdApplicableList}"><form:option value="${emdApplicableList.emd_Applicable_id}">${emdApplicableList.emd_Applicable_Name}</form:option></c:forEach></form:select></c:if><span class="form-text errorColor" id="emdApplicable"></span></div></div></div>
<div class="row">                                                
<div class="col-lg-3" ng-show="QualificationWeightage">
        <label class="">Qualification Weightage <span style="color:red;">*</span></label>
     <form:input path="qualificationWeightage" type="number" ng-model="qualificationWeightage" placeholder="Enter Weightage"  class="form-control" id="qualificationWeightage" ng-change="updateWeightagePercent()" />
            <span class="form-text errorColor" id="WeightageError"></span>
    <span class="form-text errorColor" id="qualificationWeightageError">{{qualificationWeightageError}}</span>
   
</div>
    <div class="col-lg-3" ng-show="QualificationWeightage">
        <label class="">Qualification Weightage<span style="color:red;">*</span></label>
        <form:input path="qualificationWeightagePercent" type="number" ng-model="qualificationWeightagePercent"  id="qualificationWeightagePercent" class="form-control" ng-readonly="true" />
        <span class="form-text errorColor" id="qualificationWeightagePercentError"></span>
    </div>
    
     <div class="col-lg-3" ng-show="QualificationWeightage">
        <label class="">Minimium Qualification Marks <span style="color:red;">*</span></label>
        <form:input path="minimiumQualification" type="number" ng-model="minimiumQualification" class="form-control" id="minimiumQualification" placeholder="Enter Qualification Marks" ng-change="updateMinimiumQualification()" />
        <span class="form-text errorColor" id="minQualificationError"></span>
        <span class="form-text errorColor" id="minimiumQualificationError">{{minimiumQualificationError}}</span>
    </div>
</div>
<br>
                                                <!--Section for EMD-->                          
                                                <div class="form-group border_boxesDiv"> 
                                                            <div class="row"><div class="col-lg-4" ng-show="emdInputField"><label class="">EMD (In Fig)<span style="color:red;">*</span></label><div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div><form:input path="emdInFig"  cssClass="form-control"  placeholder="EMD (In Figure)" ng-model="emdValues" id="emdInFig"></form:input></div><span class="form-text errorColor" id="emdInFigError"></span></div>

                                                <div class="col-lg-2"></div>
                                                <div class="col-lg-6" ng-show="emdInputField"><label>Mode Of Payment </label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="modeOfFeeForEMDApplicable" id="modeOfFeeForEMDApplicable"  value="online" ng-click="tenderCheckedBox('modeOfFeeForEMDApplicable');" checked="checked"/><span></span><b class="payment_mode">{{modeOfFeeForEMDApplicable}}</b></label></span></div></div>

                                            <div class="form-group col-lg-12" ng-show="emdInputField"><label class="">EMD (In Words)<span style="color:red;">*</span></label><div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div><input name="emdInWords" class="form-control wrd_conversion" placeholder="EMD (In Words)" aria-describedby="basic-addon1" placeholder="{{emdValues| words}}" readonly="true" value="{{emdValues| words}}"/></div></div>

                                            <div class="col-lg-12" ng-hide="emdInputField"><label class="">EMD</label><div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-rupee-sign"></i></span></div><input type="text" class="form-control wrd_conversion" aria-describedby="basic-addon1" readonly="true" value="EMD as per Item wise as mentioned in tender document"/></div><span class="form-text text-muted">EMD Status</span></div></div></div>   

                                    <!--Section for Social Category-->                         
                                    <div class="form-group row">
                                        <div class="col-lg-4"><div class="border_boxesDiv"><label class="">Social Category Exemption</label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="scstExemption" id="scstExemption"  value="Allowed" ng-model="scstExemption" ng-init="scstExemption = false" ng-click="tenderCheckedBox('scstExemption');"/><span></span><b class="payment_mode">{{scstExemptionStatus}} SC/ST Exemption</b></label></span></div>

                                                <div class="row" ng-if="scstExemption"><div class="col-lg-6"><label class="">Tender Fees</label><div class="input-group"><form:input path="tenderfeeSCSTExemption" cssClass="form-control" aria-describedby="basic-addon2" placeholder="SC/ST Exemption" ng-model="tenderfeeSCSTExemption" id="tenderfeeSCSTExemption" ng-change="percentageCheck(tenderfeeSCSTExemption, 'tenderfeeSCSTExemption', 'tenderfeeSCSTExemptionError');"></form:input><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div><span class="form-text errorColor" id="tenderfeeSCSTExemptionError" ></span></div><div class="col-lg-6"><label class="">EMD</label><div class="input-group"><form:input path="emdTenderSCSTFeeExemption" cssClass="form-control" aria-describedby="basic-addon2" placeholder="SC/ST Exemption" ng-model="emdTenderSCSTFeeExemption" id="emdTenderSCSTFeeExemption" ng-change="percentageCheck(emdTenderSCSTFeeExemption, 'emdTenderSCSTFeeExemption', 'emdTenderSCSTFeeExemptionError');"></form:input><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div><span class="form-text errorColor" id="emdTenderSCSTFeeExemptionError"></span></div></div></div></div>


                                                <div class="col-lg-4"><div class="border_boxesDiv"><label class="">Social Category Exemption </label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="obcExemption" id="obcExemption" value="Allowed" ng-model="obcExemption" ng-init="obcExemption = false" ng-click="tenderCheckedBox('obcExemption');"/><span></span><b class="payment_mode">{{obcExemptionStatus}} OBC Exemption</b></label></span></div>


                                                <div class="row" ng-if="obcExemption"><div class="col-lg-6"><label class="">Tender Fees</label><div class="input-group"><form:input path="tenderfeeOBCExemption" cssClass="form-control" aria-describedby="basic-addon2" ng-model="tenderfeeOBCExemption" placeholder="OBC Exemption" ng-change="percentageCheck(tenderfeeOBCExemption, 'tenderfeeOBCExemption', 'tenderfeeOBCExemptionError');"></form:input><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div><span class="form-text errorColor" id="tenderfeeOBCExemptionError"></span></div>

                                                        <div class="col-lg-6"><label class="">EMD</label><div class="input-group"><form:input path="emdTenderOBCFeeExemption" cssClass="form-control" ng-model="emdTenderOBCFeeExemption" aria-describedby="basic-addon2" placeholder="OBC Exemption" ng-change="percentageCheck(emdTenderOBCFeeExemption, 'emdTenderOBCFeeExemption', 'emdTenderOBCFeeExemptionError');" ></form:input><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div><span class="form-text errorColor" id="emdTenderOBCFeeExemptionError"></span></div></div></div></div>  

                                            <div class="col-lg-4"><div class="border_boxesDiv"><label class="">MSME / NSIC Exemption</label><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><form:checkbox path="msmensicExemption" id="msmensicExemption" value="Allowed" ng-model="msmensicExemption" ng-init="msmensicExemption = false" ng-click="tenderCheckedBox('msmensicExemption');"/><span></span><b class="payment_mode">{{msmensicExemptionStatus}} MSME/NSIC Exemption</b></label></span></div><div class="row" ng-if="msmensicExemption">

                                                    <div class="col-lg-6"><label class="">Tender Fees</label><div class="input-group"><form:input path="tenderfeeMSMENSICExemption" cssClass="form-control" ng-model="tenderfeeMSMENSICExemption" ng-change="percentageCheck(tenderfeeMSMENSICExemption, 'tenderfeeMSMENSICExemption', 'tenderfeeMSMENSICExemptionError');" placeholder="MSME/NSIC Exemption" ></form:input><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div><span class="form-text errorColor" id="tenderfeeMSMENSICExemptionError"></span></div>

                                                        <div class="col-lg-6"><label class="">EMD</label><div class="input-group"><form:input path="emdMSMENSICExemption" cssClass="form-control" ng-model="emdMSMENSICExemption" ng-change="percentageCheck(emdMSMENSICExemption, 'emdMSMENSICExemption', 'emdMSMENSICExemptionError');" placeholder="MSME/NSIC Exemption" ></form:input><div class="input-group-append"><span class="input-group-text" id="basic-addon2"><i class="fa fa-percent"></i></span></div></div><span class="form-text errorColor" id="emdMSMENSICExemptionError"></span></div></div></div></div>
                                        </div>
                                        <!--    </form>-->
                                    </div>





                                    <!-- FIFTH_STEP_FORM -->
                                    <div class="tab-pane" id="k_portlet_base_demo_5_tab_content" role="tabpanel">
                                        <!--    <form class="k-form">-->
                                        <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                            <div class="k-portlet__head-label">
                                                <span class="k-portlet__head-icon">
                                                    <i class="flaticon-cogwheel"></i>
                                                </span>
                                                <h3 class="k-portlet__head-title">
                                                    Bidder Template
                                                    <small></small>
                                                </h3>
                                            </div>
                                        </div>
                                  
                                        <div class="form-group row"><div class="col-lg-4" ><div class="border_boxesDiv" ng-show="EnvelopeA"><div class="card2"><div class="card-body"><h5 class="card- title">Envelope A:<span style="color:red;">*</span></h5><a href="#" class="card-link btn btn-primary btn-sm" data-toggle="modal" data-target="#m_select_modal"><i class="fa fa-plus-circle" ></i> Add Template</a><a href="#" class="card-link btn btn-accent btn-sm" data-toggle="modal" id="viewTemplateButtonA" data-target="#m_select_modal_view_template" ng-click="showModelForGenerateTemplate(envelopeAName, 'A');"><i class="fa fa-plus-circle"></i> View Template</a><span class="form-text errorColor" id="envelopeAError"></span></div></div></div></div>

                                            <div class="col-lg-4" ><div class="border_boxesDiv" ng-show="EnvelopeB"><div class="card2"><div class="card-body"><h5 class="card-  title">Envelope B:<span style="color:red;">*</span></h5><a href="#" class="card-link btn btn-primary btn-sm" data-toggle="modal" data-target="#m_select_modalB" id="addTemplateButtonB"><i class="fa fa-plus-circle" ></i> Add Template</a><a href="#" class="card-link btn btn-accent btn-sm" data-toggle="modal" data-target="#m_select_modal_view_template" id="viewTemplateButtonB" ng-show="viewEnvelopeB" ng-click="showModelForGenerateTemplate(envelopeBName, 'B');"><i class="fa fa-plus-circle" ></i> View Template</a><span class="form-text errorColor" id="envelopeBError"></span></div></div></div>

                                                <div class="border_boxesDiv" ng-show="EnvelopeBQCBS"><div class="card2"><div class="card-body"><h5 class="card- title">Envelope B:<span style="color:red;">*</span></h5><a href="#" class="card-link btn btn-primary btn-sm" data-toggle="modal"  data-target="#m_select_modalQCBS" ><i class="fa fa-plus-circle"></i> Add QCBS</a>
                                                            <button type="button" ng-click="showEnvelopeANames('QCBS');" id="qcbsTemplateView" ng-hide="true"></button> <a href="#" class="card-link btn btn-accent btn-sm pull-right"  onclick="viewQCBSTemplate();" id="viewQCBSButton"><i class="fa fa-plus-circle"></i> View QCBS</a><span class="form-text text-muted"></span></div></div></div></div>

                                            <div class="col-lg-4" ><div class="border_boxesDiv" ng-show="EnvelopeC"><div class="card2"><div class="card-body"><h5 class="card-  title">Envelope C:<span style="color:red;">*</span></h5><a href="#" class="card-link btn btn-primary btn-sm" data-toggle="modal"  data-target="#m_select_modalC"><i class="fa fa-plus-circle"></i> Add Template</a><a href="#" class="card-link btn btn-accent btn-sm" data-toggle="modal" id="viewTemplateButtonC" ng-show="viewEnvelopeC" data-target="{{envelopeCImages}}"><i class="fa fa-plus-circle" ></i> View Template</a><span class="form-text errorColor" id="envelopeCError"></span></div></div></div></div></div>

                                        <div class="form-group border_boxesDiv"><div class="row"><div class="form-group col-lg-12">
                                                    <label> Ammendment Privilege</label>
                                                    <div class="k-checkbox-list">
                                                        <span class="k-switch k-switch--outline k-switch--icon k-switch--primary">
                                                            <label><input name="ammendmentPrivilege" type="checkbox" checked="checked" id="ammendmentPrivilege" ng-checked="false" ng-click="tenderCheckedBox('ammendmentPrivilege');" value="Allowed"><span></span><b class="payment_mode">{{ammendmentPrivilegeStatus}} Ammendment Privilege</b></label>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12" ng-hide="ammendmentField">
                                                <form:select path="ammendmentPrivilegeOfficer" ng-change="amendmentPrivilegeOfficerSelection();" cssClass="form-control selectpicker" data-live-search="false" multiple="true"  ng-model="amendmentPrivilege" id="amendmentPrivilege">
                                                    <c:forEach var="amendmentPrivilege" items="${amendmentPrivilege}">
                                                        <form:option  data-select-watcher="true" value="${amendmentPrivilege.key}" data-last="{{$last}}">${amendmentPrivilege.value}
                                                        </form:option></c:forEach></form:select>
                                                    </div>
                                                </div>
                                                <span class="errorColor" id="amendmentPrivilegeError"></span>
                                            </div>
                                            <!--</form>  -->
                                        </div>





                                        <!-- SIXTH_STEP_FORM -->
                                        <div class="tab-pane" id="k_portlet_base_demo_6_tab_content" role="tabpanel">
                                            <!--    <form class="k-form">-->
                                            <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                                <div class="k-portlet__head-label">
                                                    <span class="k-portlet__head-icon">		</span>
                                                    <h3 class="k-portlet__head-title">		</h3>
                                                </div>
                                            </div>
 
                                            <div class="form-group row">
                                                <div class="col-lg-12"><div class="k-checkbox-list"><span class="k-switch k-switch--outline k-switch--icon k-switch--primary"><label><input type="checkbox" name="singedPDF" value="no" ng-checked="singedPDF" ng-model="singedPDF" ng-click="uploadedSignedPDFDOcument(singedPDF);" id="singedPDF"><span></span><b class="payment_mode">Upload Signed PDF Document</b></label></span></div></div></div>

                                            <div class=" documentts" ng-show="tenderDocuments" data-ng-repeat="choice in choices">
                                                <div class="k-repeater"><div class="k-repeater__data-set"><div data-repeater-list="demo3-list2"><!--data-repeater-item--><div  class="k-repeater__item"><div class="form-group border_boxesDiv"><div class="row"><div class="col-lg-1"><label>Sr.No.</label><span class="form-text text-muted"><b>{{choice.id}}</b></span></div>

                                                                        <div class="col-lg-3"><label>Label Name :</label><input type="text" ng-hide='true' id="doc_Id{{choice.id}}" value="0" ng-model="doc_Id[choice.id]"/><input type="text" class="form-control" id="documentLabel{{choice.id}}" ng-model="documentLabel[choice.id]" placeholder=" "><span class="errorColor" id="documentLabelError{{choice.id}}"></span></div>

                                                                        <div class="col-lg-2"><label>Document :</label><div><button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#cloudFolderModel" ng-click="documentSequnceCalled(choice.id, 'cloudFolderURL');"><i class="fa fa-file-upload"></i> Upload Document</button></div></div>

                                                                        <div class="col-lg-3"><label style="margin: 0px 65px;">Document Link </label><div><center><a href='${context}{{showDocument[choice.id]}}' target="_blank" class="k-link" >View</a></center></div></div>

                                                                <div class="col-lg-2"><label>After purchase</label><div class="k-checkbox-list checkB_center radius_check"><label class="k-checkbox k-checkbox--brand"><input type="checkbox" id="documentVisibility{{choice.id}}" ng-checked="documentVisibility[choice.id]"  ng-click="documentAfterPurchase(choice.id);"><span style="margin:0px 35px;"></span></label></div></div>

                                                                <div class="col-lg-1"><label>Action</label><div class="k-repeater__close k-repeater__data form-group"><button type="button" class="btn btn-hover-danger btn-icon btn-pill" title="Delete" ng-click="removeNewChoice();documentRemove(choice.id);" ><i class="la la-trash"></i></button><!--data-repeater-delete=""--></div></div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="k-repeater__add-data">
                                                <button type="button"  id="sequnceOfDocument" class="btn btn-info btn-sm" ng-show="showAddChoice(choice)" ng-click="addNewChoice()">
                                                    <!--data-repeater-create=""-->
                                                    <i class="la la-plus"></i> Add More
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!--</form>-->
                                </div>


                                <!-- SEVENTH_STEP_FORM -->
                                <div class="tab-pane" id="k_portlet_base_demo_7_tab_content" role="tabpanel">
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">		</span>
                                            <h3 class="k-portlet__head-title">		</h3>
                                        </div>
                                    </div>
                                    
                                    <!--                                        <div class="form-group">
                                                                                <label>Inline Radioes</label>
                                                                                <div class="k-radio-inline">
                                                                                    <label class="k-radio" data-toggle="modal" data-target=".bd-example-modal-sm">
                                                                                        <input type="radio" name="radio2" value="7">7 Days
                                                                                        <span></span>
                                                                                    </label>
                                                                                    <label class="k-radio" data-toggle="modal" data-target=".bd-example-modal-sm">
                                                                                        <input type="radio" name="radio2" value="15"> 15 days
                                                                                        <span></span>
                                                                                    </label>
                                                                                    <label class="k-radio" data-toggle="modal" data-target=".bd-example-modal-sm">
                                                                                        <input type="radio" name="radio2" value="30"> 30 Days
                                                                                        <span></span>
                                                                                    </label>
                                                                                    <label class="k-radio" data-toggle="modal" data-target=".bd-example-modal-sm">
                                                                                        <input type="radio" name="radio2" value="45"> 45 Days
                                                                                        <span></span>
                                                                                    </label>
                                                                                    <label class="k-radio" data-toggle="modal" data-target=".bd-example-modal-sm">
                                                                                        <input type="radio" name="radio2" value="60"> 60 Days
                                                                                        <span></span>
                                                                                    </label>
                                                                                </div>
                                                                                <span class="form-text text-muted">Tender Date Cycle Managing</span>
                                                                            </div>-->
                                    <div class="form-group row" style="margin-bottom:5px;">
                                        <div class="col-lg-1">
                                            <label>Serial No.</label>
                                              
                                        </div>
                                        <div class="col-lg-5">
                                            <label class="">Stages Name</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>Start Date and Time </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>End Date and Time</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="1">
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="TENDER PURCHASE">
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_561">
                                                <!--<input type='text' class="form-control" readonly placeholder="Select date & time range" />-->
                                                <input type="hidden" id="keyDatesId" value="0"/> 
                                                <!-- find by k_daterangepicker_561 in TenderValidation.js for calender -->  
                                                <form:input path="tenderKeyDates.tenderPurchaseDate" readonly="true" cssClass="form-control" id="tenderPurchaseDate" ng-model="tenderPurchaseDate"/>
                                                <div class="input-group-append">        
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="tenderPurchaseDateError"></span>                        
                                        </div> 
                                    </div>
                                           
                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="2">
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="BID SUBMISSION">
                                            
                                        </div>
                                        
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_571">
                                                <!-- find by k_daterangepicker_571 in TenderValidation.js for calender -->
                                                <form:input path="tenderKeyDates.bidSubmissionDate" readonly="true" id="bidSubmissionDate" cssClass="form-control" ng-model="bidSubmissionDate" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="bidSubmissionDateError"></span>                     
                                        </div>

                                    </div>
                                           

                                    <div class="form-group row">
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="3">
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="OPENING(EA)">
                                        </div>

                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' >
                                                <!-- find by filter-date-time-openingEA in TenderValidation.js for calender -->
                                                <form:input path="tenderKeyDates.openingEA" cssClass="form-control filter-date-time-openingEA" readonly="true" id="openingEA" ng-model="openingEA" ng-blur="disableAndEnableToggle();"/>
                                                <div class="input-group-append"><span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="openingEAError"></span>
                                        </div>

                                    </div>
                                                 <!--OPENING EC SUBMISSION DATE 2 STAGE START-->
                                                <div id="stageToShow" style="display: none;">
                                                <div  class="form-group row" >
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="4">
                                        </div>
                                        <div class="col-lg-5">
                                        <input type="text" class="form-control" disabled="disabled" value="BID SUBMISSION (EC)">
                                            
                                        </div>
                                        
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_581">
                                                <!-- find by k_daterangepicker_581 in TenderValidation.js for calender -->
                                                <form:input path="tenderKeyDates.ecBidSubmissionDate" readonly="true" id="ecBidSubmissionDate" cssClass="form-control" ng-model="ecBidSubmissionDate" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="bidECSubmissionError"></span>                     
                                        </div>

                                    </div>
                                                </div>   
                                                  <!--OPENING EC SUBMISSION DATE 2 STAGE END-->
                                               
                                                  
                                    <div class="form-group row" ng-show="OpeningEBDate">
                                                
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control" disabled="disabled" value="4">
                                        </div>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" disabled="disabled" value="OPENING(EB)">
                                        </div>
                                        <div class="col-lg-6">
                                            <div class='input-group pull-right' id="k_daterangepicker_55">
                                                <!-- find by filter-date-time-openingEB in TenderValidation.js for calender -->
                                                <form:input path="tenderKeyDates.openingEB" cssClass="form-control filter-date-time-openingEB" ng-model="openingEB" readonly="true" id="openingEB"/> 
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="openingEBError"></span>
                                        </div>

                                    </div>
                                     
                                                  <!--OPENING EC STAGE START-->
                                                  <div id="Show" style="display: none;">
                                                    <div class="form-group row">
                                                        <div class="col-lg-1" >
                                            <input type="text" class="form-control" disabled="disabled" value="5">
                                        </div>
                                        <div class="col-lg-5" >
                                            <input type="text" class="form-control" disabled="disabled" value="OPENING(EC)">
                                        </div>
                                        <div class="col-lg-6" >
                                            <div class='input-group pull-right' id="k_daterangepicker_5">
                                                <!--                                                    <input type='text' class="form-control " readonly placeholder="Select date & time range" />-->
                                                <!-- find by filter-date-time-openingEC in TenderValidation.js for calender -->
                                                <form:input path="tenderKeyDates.openingEC" cssClass="form-control filter-date-time-openingEC" ng-model="openingEC" readonly="true" id="openingEC"/> 
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="openingECError"></span>         
                                        </div>

                                                        
                                                    </div>
                                                     </div>
                                                  <!--OPENING EC STAGE END-->         
                                    <div class="form-group row" ng-show="OpeningECDate">
                                        <div class="form-group col-lg-12">
                                            <div class="k-checkbox-list">
                                                <span class="k-switch k-switch--outline k-switch--icon k-switch--primary">
                                                    <label>	
                                                        <form:checkbox path="tenderKeyDates.openingECaftertechopening" ng-click="managehideAndShow('openingTechnical');" value="yes" ng-model="openingECaftertechopening" id="openingECaftertechopening" />
                                                        <!--<input type="checkbox" checked="checked" name="openingECaftertechopening" id="openingECaftertechopening" ng-click="managehideAndShow('openingTechnical');" value="yes" ng-model="openingECaftertechopening"/>-->
                                                        <span></span>
                                                        <b class="payment_mode">Decided after Technical Opening</b></label>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-lg-1" ng-show="managingOpeningECDate">
                                            <input type="text" class="form-control" disabled="disabled" value="5">
                                        </div>
                                        <div class="col-lg-5" ng-show="managingOpeningECDate">
                                            <input type="text" class="form-control" disabled="disabled" value="OPENING(EC)">
                                        </div>
                                        <div class="col-lg-6" ng-show="managingOpeningECDate">
                                            <div class='input-group pull-right' id="k_daterangepicker_5">
                                                <!--                                                    <input type='text' class="form-control " readonly placeholder="Select date & time range" />-->
                                                <!-- find by filter-date-time-openingEC in TenderValidation.js for calender -->
                                                <form:input path="tenderKeyDates.openingEC" cssClass="form-control filter-date-time-openingEC" ng-model="openingEC" readonly="true" id="openingEC"/> 
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                                </div>
                                            </div>
                                            <span class="errorColor" id="openingECError"></span>         
                                        </div>

                                    </div>

                                    <div class="form-group col-lg-12">
                                        <div class="k-checkbox-list" style="margin-left: -15px;">
                                            <span class="k-switch k-switch--outline k-switch--icon k-switch--primary">
                                                <label>	
                                                    <form:checkbox path="preBidMeetingStatus" ng-click="managehideAndShow('preBidMeetingStatus');" value="yes" ng-model="preBidMeetingStatus" id="preBidMeetingStatus" ng-disabled="dependOnBidSubmissionDate"/>
                                                    <span></span>
                                                    <b class="payment_mode">Decided Meeting before the Bid Submission</b></label>
                                            </span>
                                        </div>
                                    </div>                  
                                    <div class="form-group border_boxesDiv" ng-show="prebidDiscussion">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label>Pre-Bid Meeting Venue</label>
                                                <form:textarea path="preBidMeetingVenue" cssClass="form-control" id="preBidMeetingVenue" rows="3"></form:textarea>
                                                    <!--                                                                <span class="form-text text-muted">Please enter ......</span>-->
                                                </div>
                                                <div class="col-lg-6">
                                                    <label class="">Pre-Bid Meeting Date </label>
                                                <form:input path="preBidMeetingDate" cssClass="form-control filter-date-time-preBidMeeting"  readonly="true" id="preBidMeeting"/>              <span class="form-text errorColor" id="preBidMeetingError"></span>
                                            </div>
                                        </div>
                                    </div>                  

                                </div>



                                <!--                                 EIGHTH_STEP_FORM -->
                                <div class="tab-pane" id="k_portlet_base_demo_8_tab_content" role="tabpanel">
                                    <!--                                    <form class="k-form">-->
                                    <div class="k-portlet__head" style="padding:0;margin-bottom:10px;">
                                        <div class="k-portlet__head-label">
                                            <span class="k-portlet__head-icon">
                                                <i class="flaticon-cogwheel"></i>
                                            </span>
                                            <h3 class="k-portlet__head-title">
                                                Tender Notice<span style="color:red;">*</span>

                                            </h3>
                                        </div>
                                    </div>
                                    <!--                                        <div class="summernote" id="m_summernote_1" style="height:390px;"></div>-->
                                    <!-- To manage summer note feature please move on resources/assets/demo/custom/components/forms/widgets/summernote.js -->
                                    <form:textarea path="tenderNotice"  class="summernote" id="tenderNotice"/>
                                    <!--</form>--> 
                                    <span class="errorColor" id="tenderNoticeError"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer block_footer">
                    <div class="modal_time_watch">
                        <p class="clock_section">{{ clock}}<span class="day_view">{{ date}}</span></p>
                    </div>
                    <button type="button" class="btn btn-primary btn_prev" style="display:none;" ng-click="previousStepManaging(step);" >Previous</button>
                    <button type="button" class="btn btn-success  log-btn" ng-disabled="saveAndNextButton" ng-click="validations(step);showAmmendmentPrivilegeOfficer();" ng-click="checkAndRunFunction(step);">{{tenderWizardButton}}</button>
                    <button type="button" class="btn btn-secondary  pull-right" ng-click="lostDataMessage();">Close</button>
                    <hidden type="button" class="btn_next" id="saveAndNextButton"/>
                </div>

            </div>
        </div>
    </div>
</form:form>
<!--<script>
    function updateWeightagePercent() {
   // alert("hhhh")
    var weightage = document.getElementById('qualificationWeightage').value;
    var percent = 100 - weightage;
    document.getElementById('qualificationWeightagePercent').value = percent >= 0 ? percent : 0;
}
    </script>-->
