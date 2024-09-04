<!--     MODAL_FORM_START  -->
<style>
    .space{
        height:20px;
    }
</style>

 <!--     begin::Modal -->
    <div class="modal fade mdl-bg" id="m_select_modal" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true" >
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Envelope A</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modelAClose">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form id="saveEnvelopeASubmit" class="k-form k-form--label-left" >
                    <div class="modal-body">
                        <div class="form-group row k-margin-t-20">
                            <label class="col-form-label col-lg-3 col-sm-12">Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="hidden" name="submittedEnvelopeA_Id" id="submittedEnvelopeA_Id" value="0"/>
<select name="envelopeAOfficers" class="form-control" id="envelopeAOfficers" ng-model="departmentUserARegId" ng-change="departmentUserAView(departmentUserARegId);" multiple>
    <option ng-repeat="DepartmentUsers in DepartmentUser"  data-select-watcher="true" value="{{DepartmentUsers.reg_Id}}" data-last="{{$last}}" >{{DepartmentUsers.firstName}} {{DepartmentUsers.lastName}}</option>
</select><span class="form-text errorColor" id="envelopeAOfficersError"></span></div></div><div class="form-group row"><label class="col-form-label col-lg-3 col-sm-12">Minimum Opening Authority<span style="color:red;">*</span></label><div class="col-lg-1 col-md-1 col-sm-12"><input type="text" name="minOpeningOfficerA"  class="form-control" id="minOpeningOfficerA" ng-model="minOpeningOfficerA" ng-keyup="totalDepartmentUser(minOpeningOfficerA, 'remainOpeningOfficerA', 'minOpeningOfficerA', 'minOpeningOfficerAError', 'aCountAuthority');" value="0" style="width: 85px;">
        <span class="form-text errorColor" id="minOpeningOfficerAError"></span>
                            </div>
    <div class="col-lg-8 col-md-8 col-sm-12">
        <label class="space"></label>
        <span class="errorColor" id="aCountAuthority"></span>
    </div>
                        </div>
                        <input type="hidden" name="remainOpeningOfficerA" id="remainOpeningOfficerA"/>
                        
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Envelope A<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <select class="form-control upr_text envelopeAId" name="envelopeAId" id="envelopeAId" ng-model="envelopeAName" ng-change="managehideAndShow('templateANameDropDown')"><option value="0">Select</option><option ng-repeat="envelopeANameses in templateNameForEnvelopeA" value="{{envelopeANameses.tender_EnvelopeAName_Id}}">{{envelopeANameses.envelopeATemplateName}}</option></select>
    <span class="form-text errorColor" id="envelopeAIdError"></span>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" ng-show="templateEnvelopeAButton" data-target="#m_select_modal_new_template" ng-click="showModelForEnvelope('A');">New Template</button>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" ng-hide="templateEnvelopeAButton" data-target="#m_select_modal_new_template" ng-click="showModelForEnvelope('A');fetchDynamicTemplateData('A');">Edit Template</button>
                            <button type="button" ng-click="envelopeAValidation('A');" class="btn btn-success btn-sm" >Select</button>
                            <!--data-dismiss="modal"-->
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  <!--  end::Modal-->
  
  <!--     begin::Modal -->
    <div class="modal fade mdl-bg" id="m_select_modalQCBS" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add QCBS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modelQCBSClose">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form id="saveTemplateDataQCBS" class="k-form k-form--label-left">
                    <div class="modal-body">
                        <div class="form-group row k-margin-t-20">
                            <label class="col-form-label col-lg-3 col-sm-12">Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="hidden" name="submittedQCBS" id="submittedQCBS" value="0"/>
                                <select name="QCBSOfficers" class="form-control k_selectpicker" id="QCBSOfficers" ng-change="departmentUserQCBSView(departmentUserQCBSRegId);" ng-model="departmentUserQCBSRegId" multiple>
                                    <option ng-repeat="DepartmentUserB in DepartmentUserB"  data-select-watcher="true" value="{{DepartmentUserB.reg_Id}}" data-last="{{$last}}" >{{DepartmentUserB.firstName}} {{DepartmentUserB.lastName}}</option>
                                </select>
                                <span class="form-text errorColor" id="envelopeBOfficersError"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Minimum Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-1 col-md-1 col-sm-12">
                                <input type="text" name="minOpeningOfficerQCBS"  class="form-control" id="minOpeningOfficerQCBS" ng-model="minOpeningOfficerQCBS" ng-keyup="totalDepartmentUser(minOpeningOfficerQCBS, 'remainOpeningOfficerQCBS', 'minOpeningOfficerQCBS', 'minOpeningOfficerQCBSError', 'QCBSCountAuthority');" style="width: 85px;" value="0" >
                                <span class="form-text errorColor" id="minOpeningOfficerQCBSError"></span>
                            </div>
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <label class="space"></label>
                        <span class="errorColor" id="QCBSCountAuthority"></span>
                    </div>
                        </div>
                        <input type="hidden" name="remainOpeningOfficerQCBS" id="remainOpeningOfficerQCBS"/>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">QCBS Template<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <select class="form-control upr_text" name="templateId" id="templateId" onchange="takeValueOfTemplateIdDropdown(this.value);"><option value="0">Select</option>
                                        <option ng-repeat="(key, value) in templateNameForQCBS" value="{{key}}">{{value}}</option>
                                </select>
                                <span class="form-text errorColor" id="templateIdError"></span>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" id="QCBSTemplate" data-target="#myModalQCBS" onClick="openQCBSTemplate();">New Template</button>
                            <button type="button" ng-click="saveTemplateData('QCBS');" class="btn btn-success btn-sm" onclick="$('#viewQCBSButton').show();" data-dismiss="modal">Select</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  <!--  end::Modal-->
  
  <!--     begin::Modal -->
    <div class="modal fade mdl-bg" id="m_select_modalB" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Envelope B</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modelBClose">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form id="saveEnvelopeBSubmit" class="k-form k-form--label-left">
                    <div class="modal-body">
                        <div class="form-group row k-margin-t-20">
                            <label class="col-form-label col-lg-3 col-sm-12">Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="hidden" name="submittedEnvelopeB_Id" id="submittedEnvelopeB_Id" value="0"/>
                                <select name="envelopeBOfficers" class="form-control k_selectpicker" id="envelopeBOfficers" ng-change="departmentUserBView(departmentUserBRegId);" ng-model="departmentUserBRegId" multiple>
                                    <option ng-repeat="DepartmentUserB in DepartmentUserB"  data-select-watcher="true" value="{{DepartmentUserB.reg_Id}}" data-last="{{$last}}" >{{DepartmentUserB.firstName}} {{DepartmentUserB.lastName}}</option>
                                </select>
                                <span class="form-text errorColor" id="envelopeBOfficersError"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Minimum Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-1 col-md-1 col-sm-12">
                                <input type="text" name="minOpeningOfficerB"  class="form-control" id="minOpeningOfficerB" ng-model="minOpeningOfficerB" ng-keyup="totalDepartmentUser(minOpeningOfficerB, 'remainOpeningOfficerB', 'minOpeningOfficerB', 'minOpeningOfficerBError', 'bCountAuthority');" style="width: 85px;" value="0" >
                                <span class="form-text errorColor" id="minOpeningOfficerBError"></span>
                            </div>
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <label class="space"></label>
                        <span class="errorColor" id="bCountAuthority"></span>
                    </div>
                        </div>
                        <input type="hidden" name="remainOpeningOfficerB" id="remainOpeningOfficerB"/>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Envelope B<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <select class="form-control upr_text" name="envelopeBId" id="envelopeBId" ng-model="envelopeBName" ng-change="managehideAndShow('templateBNameDropDown')"><option value="0">Select</option>
                                        <option ng-repeat="envelopeBNameses in templateNameForEnvelopeB" value="{{envelopeBNameses.tender_EnvelopeAName_Id}}" >{{envelopeBNameses.envelopeATemplateName}}</option>
                                </select>
                                <span class="form-text errorColor" id="envelopeBIdError"></span>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" ng-show="templateEnvelopeBButton" data-target="#m_select_modal_new_template" ng-click="showModelForEnvelope('B');">New Template</button>
                             <button type="button" class="btn btn-info btn-sm" data-toggle="modal" ng-hide="templateEnvelopeBButton" data-target="#m_select_modal_new_template" ng-click="showModelForEnvelope('B');fetchDynamicTemplateData('B');">Edit Template</button>
                            <button type="button" ng-click="envelopeBValidation('B');" data-dismiss="modal" class="btn btn-success btn-sm" ng-init="viewEnvelopeB = 'true'" >Select</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  <!--  end::Modal-->
  
 
  <!--     begin::Modal -->
    <div class="modal fade mdl-bg" id="m_select_modalC" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Envelope C</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modelCClose">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form id="saveEnvelopeCSubmit" class="k-form k-form--label-left">
                    <div class="modal-body">
                        <div class="form-group row k-margin-t-20">
                            <label class="col-form-label col-lg-3 col-sm-12">Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="hidden" name="submittedEnvelopeC_Id" id="submittedEnvelopeC_Id" value="0"/>
                                <select name="envelopeCOfficers" class="form-control k_selectpicker" id="envelopeCOfficers" ng-change="departmentUserCView(departmentUserCRegId);" ng-model="departmentUserCRegId" multiple>
                                    <option ng-repeat="DepartmentUserC in DepartmentUserC" data-select-watcher="true" value="{{DepartmentUserC.reg_Id}}" data-last="{{$last}}" >{{DepartmentUserC.firstName}} {{DepartmentUserC.lastName}}</option>
                                </select>
                                <span class="form-text errorColor" id="envelopeCOfficersError"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Minimum Opening Authority<span style="color:red;">*</span></label>
                            <div class="col-lg-1 col-md-1 col-sm-12">
                                <input type="text" name="minOpeningOfficerC"  class="form-control" id="minOpeningOfficerC" ng-model="minOpeningOfficerC" ng-keyup="totalDepartmentUser(minOpeningOfficerC, 'remainOpeningOfficerC', 'minOpeningOfficerC', 'minOpeningOfficerCError', 'cCountAuthority');" style="width: 85px;" value="0" >
                                <span class="form-text errorColor" id="minOpeningOfficerCError"></span>
                            </div>
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <label class="space"></label>
                        <span class="errorColor" id="cCountAuthority"></span>
                    </div>
                        </div>
                        <input type="hidden" name="remainOpeningOfficerC" id="remainOpeningOfficerC"/>
<!--                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Envelope A</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <select class="form-control" name="envelopeBId" id="envelopeBId" ng-model="envelopeBName"><option value="0">Select</option>
                                        <option ng-repeat="envelopeBNameses in templateNameForEnvelopeB" value="{{envelopeBNameses.tender_EnvelopeAName_Id}}">{{envelopeBNameses.envelopeATemplateName}}</option>
                                </select>
                                <span class="form-text errorColor" id="envelopeBIdError"></span>
                            </div>
                        </div>-->
                        <div class="form-group text-center">
<!--                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#m_select_modal_new_template" ng-click="showModelForEnvelope('B');">New Template</button>-->
                            <button type="button" ng-click="saveTemplateData('C');" class="btn btn-success btn-sm" ng-init="viewEnvelopeC = 'true'" >Select</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  <!--  end::Modal-->
  
  
  <!--     begin::Modal -->
    <div class="modal fade mdl-bg" id="m_select_modalCpercentage" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Percentage Template</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modelCClose">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form id="saveEnvelopeBSubmit" class="k-form k-form--label-left">
                    <div class="modal-body">

                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Deviation</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <select class="form-control" name="envelopeBId" id="envelopeBId" ng-change="showAsPar(envelopeBId);" ng-model="envelopeBId"><option value="0">Select</option>
                                        <option value="1">AT PAR</option>
                                        <option value="2">ABOVE</option>
                                        <option value="3">BELOW</option>
                                </select>
                                <span class="form-text errorColor" id=""></span>
                            </div>
                        </div>
                        <div class="form-group row" ng-show="asPerShow">
                            <label class="col-form-label col-lg-3 col-sm-12">Rate(Percentage In Figure)</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="text" class="form-control" ng-disabled="true" name="envelopeBId" ng-model="percentageInFig">
                                        
                                <span class="form-text errorColor" id=""></span>
                            </div>
                        </div>
                        <div class="form-group row" ng-show="asPerShow">
                            <label class="col-form-label col-lg-3 col-sm-12">Rate(Percentage In Words)</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <textarea class="form-control" name="envelopeBId" ng-disabled="true">{{percentageInFig | percentage}}
                                </textarea>       
                                <span class="form-text errorColor" id=""></span>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            
                            <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  <!--  end::Modal-->
  
  
  <!--     begin::Modal -->
    <div class="modal fade mdl-bg" id="m_select_modalClumsum" data-backdrop="static" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="max-width: 65%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Lumsum Template</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modelCClose">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <form id="saveEnvelopeBSubmit" class="k-form k-form--label-left">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Rate(In Figure)</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="text" class="form-control" ng-disabled="true" name="envelopeBId" ng-model="rateInFig">
                                        
                                <span class="form-text errorColor" id=""></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-lg-3 col-sm-12">Rate(In Words)</label>
                            <div class="col-lg-9 col-md-9 col-sm-12">
                                <input type="text" class="form-control" name="envelopeBId" ng-disabled="true" value="{{rateInFig | words}}">
                                        
                                <span class="form-text errorColor" id=""></span>
                            </div>
                        </div>
                       
                        <div class="form-group text-center">
                            
                            <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  <!--  end::Modal-->