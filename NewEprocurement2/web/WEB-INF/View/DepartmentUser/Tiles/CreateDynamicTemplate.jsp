 <!--begin::Modal-New-template -->
    <div class="modal fade mdl-bg" id="m_select_modal_new_template" role="dialog" aria-labelledby="" aria-hidden="true">
        <form role="form" id="{{saveEnvelope}}"  name="formName" novalidate >
        <div class="modal-dialog  modal-lg" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Envelope {{alpha}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="la la-remove"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="k-form" id="saveEnvelope{{alpha}}">
                        <div class="form-group">
                            <label class="">Template Names<span style="color:red;">*</span></label>
                            <div class="">
<!--                                <input type="text" class="form-control upr_text"  name="envelopeATemplateName" id="envelopeATemplateName" ng-model="envelopeATemplateName" ng-keyup="checkDuplicateEnvelopeName(alpha, envelopeATemplateName);" placeholder="Template Name" required>
                                <input type="text" name="tender_EnvelopeA_Id"  value="0" ng-hide="true"/>-->
                                <input type="text" class="form-control upr_text" name="envelopeATemplateName" id="envelopeATemplateName" ng-model="envelopeATemplateName" ng-keyup="checkDuplicateEnvelopeName(alpha, envelopeATemplateName);" placeholder="Template Name" required>
<div ng-show="formName.envelopeATemplateName.$touched && formName.envelopeATemplateName.$error.required" style="color: red;">Template Name is required.</div>

                            </div>
                        </div>
                        <div class="k-separator k-separator--space-sm k-separator--border-dashed"></div>
                        <div class="k-repeater" >
                            <div class="k-repeater__data-set" data-ng-repeat="temp in template">
                                <div>        
                                    <div data-repeater-item class="k-repeater__item">
                                        <div class="form-group row">
                                            <div class="col-lg-4">
                                                <input type="hidden" name="tender_EnvelopeA_SequnceIdList" ng-model="templateLabelSequnce[temp.id]" value="{{temp.id}}"/>
                                                <label>Label Name<span style="color:red;">*</span></label>
<!--                                                <input type="text" name="labelNameAList" id="labelNameAList1" ng-model="templateLabelName[temp.id]" class="form-control upr_text" placeholder="Enter Label Name"required>-->
<input type="text" name="labelNameAList" id="labelNameAList1" ng-model="templateLabelName[temp.id]" class="form-control upr_text" placeholder="Enter Label Name" required>
<div ng-show="formName.labelNameAList.$touched && formName.labelNameAList.$error.required" style="color: red;">Label Name is required.</div>

                                                <!--                                                <span class="form-text text-muted">Please Mention Label Name</span>-->
                                            </div>
                                            <div class="col-lg-3">
                                                <label>Label Type <span style="color:red;">*</span></label>
                                      <select name="labelTypeAList" id="labelTypeAList1" ng-model="templateLabelType[temp.id]" class="form-control upr_text" required>
    <option value="1">Alpha-Numeric</option>
    <option value="2">Numeric</option> 
    <option value="3">File</option>
    <option value="4">Currency</option>
</select>
<div ng-show="formName.labelTypeAList.$touched && formName.labelTypeAList.$error.required" style="color: red;">Label Type is required.</div>
<!--                                                <span class="form-text text-muted">Please Select Label Type</span>-->
                                            </div>
                                            <div class="col-lg-3">
                                                <label>Submission Mandatory<span style="color:red;">*</span></label>
                                                <div class="k-checkbox-list">
                                                    <label class="k-checkbox k-checkbox--brand">
                                                        <input type="checkbox" value="true" id="labelMandatoryAList" ng-click="dynamicTemplateChecked(temp.id);" name="labelMandatoryAList" class="true{{temp.id}}" checked="checked"/>
                                                        <span></span>
                                                    </label>
                                                </div>
                                                        <input type="checkbox" value="false" id="labelMandatoryAList" class="false{{temp.id}}" ng-hide="true" name="labelMandatoryAList"/>

                                            </div>
                                            <div class="col-lg-2">
                                                <label>Remove</label>
                                                <div class="k-repeater__close k-repeater__data form-group">
                                                    <button class="k-repeater__close btn btn-elevate-hover btn-sm  btn-font-danger remove_field2"  style="padding: 0.45rem 0rem;" ng-click="removeNewChoice2()"><i class="la la-trash"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="k-separator k-separator--border-dashed"></div>
                                        <div class="k-separator k-separator--height-sm"></div>
                                    </div>
                                </div>
                            </div>
                            <!--id="addMoreEnvelopeButton"-->
                            <div class="k-repeater__add-data">
                                <!--data-repeater-create=""-->
                                <span  class="btn btn-info btn-sm add_More_EnvelopeA"   ng-show="showAddChoice2(temp)"  ng-click="addNewChoice2()"><i class="la la-plus"></i> Add More
               			</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="reset" id="resetDynamicTemplate" ng-hide="true"/>
                    <!--<button type="button" class="btn btn-success" ng-click="envelopeSubmit(alpha);" data-dismiss="modal" ng-disabled="alphaButton[alpha]">Save Envelope {{alpha}}</button>-->
                    <button type="button" class="btn btn-success" ng-click="envelopeSubmit(alpha);" data-dismiss="modal" ng-disabled="formName.$invalid || alphaButton[alpha]">Save Envelope {{alpha}}</button>

                </div>
            </div>
        </div>
            
        </form>
    </div>